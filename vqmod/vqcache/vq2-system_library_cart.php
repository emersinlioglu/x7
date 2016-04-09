<?php
class Cart {

			// << Related Options PRO / Связанные опции PRO
			
			private $relatedoptions_model = false;
			
			// >> Related Options PRO / Связанные опции PRO
			

      // Product Option Image PRO module <<
      
			private $poipregistry;
			
      // >> Product Option Image PRO module
      

			// << Live Price
			
			private $liveprice_model = false;
			
			// >> Live Price
			
	private $data = array();

	public function __construct($registry) {

      // Product Option Image PRO module <<
      
			$this->poipregistry = $registry;
			
      // >> Product Option Image PRO module
      
		$this->config = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->session = $registry->get('session');
		$this->db = $registry->get('db');
		$this->tax = $registry->get('tax');
		$this->weight = $registry->get('weight');

		// Remove all the expired carts with no customer ID
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE customer_id = '0' AND date_added < DATE_SUB(NOW(), INTERVAL 1 HOUR)");

		if ($this->customer->getId()) {
			// We want to change the session ID on all the old items in the customers cart
			$this->db->query("UPDATE " . DB_PREFIX . "cart SET session_id = '" . $this->db->escape($this->session->getId()) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");

			// Once the customer is logged in we want to update the customer ID on all items he has
			$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE customer_id = '0' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

			foreach ($cart_query->rows as $cart) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart['cart_id'] . "'");

				// The advantage of using $this->add is that it will check if the products already exist and increaser the quantity if necessary.
				$this->add($cart['product_id'], $cart['quantity'], json_decode($cart['option']), $cart['recurring_id']);
			}
		}
	}


			// << Live Price
			
			function getModelLivePrice() {
				global $loader, $registry;
				
				if ( $this->liveprice_model === false ) {
					if (!$loader || !is_object($loader) || !method_exists($loader, 'model')) {
						$loader = new Loader($registry);
					}
					
					$loader->model('module/liveprice');
					
					$this->liveprice_model = $registry->get('model_module_liveprice');
					
					/*
					if ($this->liveprice_model->installed()) {
						$this->liveprice_model->clear_cart_cache();
					}
					*/
					
				}	
					
				if ( !$this->liveprice_model->installed() ) {
					return false;
				} else {
					//$this->liveprice_model->clear_cart_cache();
					return $this->liveprice_model;
				}
			}
			
			// >> Live Price
			
// Related Options PRO / Связанные опции PRO <<
			
			private function ro_calc_price($product_price, $ro_combs) {
			
				$ro_model = $this->ro_get_model();
			
				return $ro_model->calc_price_with_ro($product_price, $ro_combs);
			}
			
			private function ro_get_model() {
				global $loader, $registry;
				
				if ($this->relatedoptions_model===false) {
					if (!$loader || !is_object($loader) || !method_exists($loader, 'model')) {
						$loader = new Loader($registry);
					}
					
					$loader->model('module/related_options');
					$this->relatedoptions_model = $registry->get('model_module_related_options');
				}
				
				return $this->relatedoptions_model;
			}
			
			private function ro_get_products_data(&$ro_quantities) {
				
				$ro_model = $this->ro_get_model();
				
				$ro_for_products = array();
				$ro_quantities = array(); // total quantities by related options
				
				if (	$ro_model->installed() ) {
					if (!$this->data) {
					
						if ( VERSION >= '2.1.0.0' ) {
							$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
	
							foreach ($cart_query->rows as $cart) {
								$key = $cart['cart_id'];
								$product_id = $cart['product_id'];
								$quantity = $cart['quantity'];
								
								if ($quantity > 0) {
									$options = (array)json_decode($cart['option']);
									
									
									$ro_for_products[$key] = $ro_model->get_related_options_sets_by_poids($product_id, $options, true);
									//$ro_for_products[$key] = $ro_model->get_related_options_sets_by_poids($product_id, $options);
									
									if ($ro_for_products[$key]) {
										foreach ($ro_for_products[$key] as $ro_comb) {
											if (!isset($ro_quantities[$ro_comb['relatedoptions_id']])) {
												$ro_quantities[$ro_comb['relatedoptions_id']] = 0;
											}
											$ro_quantities[$ro_comb['relatedoptions_id']]+= $quantity;
										}
									}
								}
							}
						} else {
					
							foreach ($this->session->data['cart'] as $key => $quantity) {
								$product = unserialize(base64_decode($key));
					
								$product_id = $product['product_id'];
					
								// Options
								if (!empty($product['option'])) {
									$options = $product['option'];
								} else {
									$options = array();
								}
								
								$ro_for_products[$key] = $ro_model->get_related_options_sets_by_poids($product_id, $options, true);
								//$ro_for_products[$key] = $ro_model->get_related_options_sets_by_poids($product_id, $options);
								
								if ($ro_for_products[$key]) {
									foreach ($ro_for_products[$key] as $ro_comb) {
										if (!isset($ro_quantities[$ro_comb['relatedoptions_id']])) {
											$ro_quantities[$ro_comb['relatedoptions_id']] = 0;
										}
										$ro_quantities[$ro_comb['relatedoptions_id']]+= $quantity;
									}
								}
							}
						}
					}
				}
				
				return $ro_for_products;
				
			}
			
			// >> Related Options PRO / Связанные опции PRO
	public function getProducts() {
// Related Options PRO / Связанные опции PRO <<
			
			$ro_quantities = array();
			$ro_for_products = $this->ro_get_products_data($ro_quantities);
			if ($ro_for_products) {
				$ro_settings = $this->config->get('related_options');
			} else {
				$ro_settings = false;
			}
			
			// >> Related Options PRO / Связанные опции PRO

			// << Live Price
			
			$model_liveprice = $this->getModelLivePrice();
			
			// >> Live Price
			
		$product_data = array();

		$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

		foreach ($cart_query->rows as $cart) {
			$stock = true;

			$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store p2s LEFT JOIN " . DB_PREFIX . "product p ON (p2s.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p2s.product_id = '" . (int)$cart['product_id'] . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");

			if ($product_query->num_rows && ($cart['quantity'] > 0)) {
// Related Options PRO / Связанные опции PRO <<

			$ro_price = false;
			if ( VERSION >= '2.1.0.0' ) {
				$key = $cart['cart_id'];
				$ro_cart_quantity = $cart['quantity'];
			} else {
				$ro_cart_quantity = $quantity;
			}
			
			if ($ro_for_products && $ro_for_products[$key]) {
				$ro_model = '';
				$ro_weight = false;
				
				if ( isset($ro_settings['spec_price']) && $ro_settings['spec_price'] ) {
					$ro_price = $this->ro_calc_price($product_query->row['price'], $ro_for_products[$key]);
				}
				
				foreach ($ro_for_products[$key] as $ro_comb) {
					if ($ro_comb['quantity'] < $ro_cart_quantity) {
						$stock = false;
					}
					
					if ( isset($ro_settings['spec_model']) && $ro_settings['spec_model'] ) {
						if ($ro_settings['spec_model'] == 1) {
							$ro_model = $ro_comb['model'];
						} elseif ($ro_settings['spec_model'] == 2) {
							$ro_model.= $ro_comb['model'];
						} elseif ($ro_settings['spec_model'] == 3) {
							if ($ro_model == '') $ro_model = $product_query->row['model'];
							$ro_model.= $ro_comb['model'];	
						}
					}
					
					// Вес в связанных опциях
					if (isset($ro_settings['spec_weight']) && $ro_settings['spec_weight'] ) {
						
						if ( $ro_comb['weight'] != 0 ) {
							if ($ro_comb['weight_prefix'] == '=') {
								$ro_weight = $ro_comb['weight'];
							} elseif ($ro_comb['weight_prefix'] == '+') {
								if ($ro_weight === false) $ro_weight = $product_query->row['weight'];
								$ro_weight+= $ro_comb['weight'];
							} elseif ($ro_comb['weight_prefix'] == '-') {
								if ($ro_weight === false) $ro_weight = $product_query->row['weight'];
								$ro_weight-= $ro_comb['weight'];
							}
						}
					}
					
				}
				
				if ($ro_model) {
					$product_query->row['model'] = $ro_model;
				}
				
				if (isset($ro_settings['spec_weight']) && $ro_settings['spec_weight'] && $ro_weight !== false ) {
					$product_query->row['weight'] = $ro_weight;
				}
				
			}
			

			// >> Related Options PRO / Связанные опции PRO
				$option_price = 0;
				$option_points = 0;
				$option_weight = 0;

				$option_data = array();

				foreach (json_decode($cart['option']) as $product_option_id => $value) {
					$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$cart['product_id'] . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

					if ($option_query->num_rows) {
						if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio' || $option_query->row['type'] == 'image') {
							$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

							if ($option_value_query->num_rows) {
								if ($option_value_query->row['price_prefix'] == '+') {
									$option_price += $option_value_query->row['price'];
								} elseif ($option_value_query->row['price_prefix'] == '-') {
									$option_price -= $option_value_query->row['price'];
								}

								if ($option_value_query->row['points_prefix'] == '+') {
									$option_points += $option_value_query->row['points'];
								} elseif ($option_value_query->row['points_prefix'] == '-') {
									$option_points -= $option_value_query->row['points'];
								}

								if ($option_value_query->row['weight_prefix'] == '+') {
									$option_weight += $option_value_query->row['weight'];
								} elseif ($option_value_query->row['weight_prefix'] == '-') {
									$option_weight -= $option_value_query->row['weight'];
								}

								if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
									$stock = false;
								}

								$option_data[] = array(
									'product_option_id'       => $product_option_id,
									'product_option_value_id' => $value,
									'option_id'               => $option_query->row['option_id'],
									'option_value_id'         => $option_value_query->row['option_value_id'],
									'name'                    => $option_query->row['name'],
									'value'                   => $option_value_query->row['name'],
									'type'                    => $option_query->row['type'],
									'quantity'                => $option_value_query->row['quantity'],
									'subtract'                => $option_value_query->row['subtract'],
									'price'                   => $option_value_query->row['price'],
									'price_prefix'            => $option_value_query->row['price_prefix'],
									'points'                  => $option_value_query->row['points'],
									'points_prefix'           => $option_value_query->row['points_prefix'],
									'weight'                  => $option_value_query->row['weight'],
									'weight_prefix'           => $option_value_query->row['weight_prefix']
								);
							}
						} elseif ($option_query->row['type'] == 'checkbox' && is_array($value)) {
							foreach ($value as $product_option_value_id) {
								$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

								if ($option_value_query->num_rows) {
									if ($option_value_query->row['price_prefix'] == '+') {
										$option_price += $option_value_query->row['price'];
									} elseif ($option_value_query->row['price_prefix'] == '-') {
										$option_price -= $option_value_query->row['price'];
									}

									if ($option_value_query->row['points_prefix'] == '+') {
										$option_points += $option_value_query->row['points'];
									} elseif ($option_value_query->row['points_prefix'] == '-') {
										$option_points -= $option_value_query->row['points'];
									}

									if ($option_value_query->row['weight_prefix'] == '+') {
										$option_weight += $option_value_query->row['weight'];
									} elseif ($option_value_query->row['weight_prefix'] == '-') {
										$option_weight -= $option_value_query->row['weight'];
									}

									if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
										$stock = false;
									}

									$option_data[] = array(
										'product_option_id'       => $product_option_id,
										'product_option_value_id' => $product_option_value_id,
										'option_id'               => $option_query->row['option_id'],
										'option_value_id'         => $option_value_query->row['option_value_id'],
										'name'                    => $option_query->row['name'],
										'value'                   => $option_value_query->row['name'],
										'type'                    => $option_query->row['type'],
										'quantity'                => $option_value_query->row['quantity'],
										'subtract'                => $option_value_query->row['subtract'],
										'price'                   => $option_value_query->row['price'],
										'price_prefix'            => $option_value_query->row['price_prefix'],
										'points'                  => $option_value_query->row['points'],
										'points_prefix'           => $option_value_query->row['points_prefix'],
										'weight'                  => $option_value_query->row['weight'],
										'weight_prefix'           => $option_value_query->row['weight_prefix']
									);
								}
							}
						} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
							$option_data[] = array(
								'product_option_id'       => $product_option_id,
								'product_option_value_id' => '',
								'option_id'               => $option_query->row['option_id'],
								'option_value_id'         => '',
								'name'                    => $option_query->row['name'],
								'value'                   => $value,
								'type'                    => $option_query->row['type'],
								'quantity'                => '',
								'subtract'                => '',
								'price'                   => '',
								'price_prefix'            => '',
								'points'                  => '',
								'points_prefix'           => '',
								'weight'                  => '',
								'weight_prefix'           => ''
							);
						}
					}
				}

				$price = $product_query->row['price'];
// Related Options PRO / Связанные опции PRO <<
			
			
			if ($ro_for_products && $ro_for_products[$key] && isset($ro_settings['spec_price']) && $ro_settings['spec_price'] && $ro_price!==false) {
				$price = $ro_price;
			}
			
			
			// >> Related Options PRO / Связанные опции PRO

				// Product Discounts
				$discount_quantity = 0;

				$cart_2_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

				foreach ($cart_2_query->rows as $cart_2) {
					if ($cart_2['product_id'] == $cart['product_id']) {
						$discount_quantity += $cart_2['quantity'];
					}
				}

				$product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND quantity <= '" . (int)$discount_quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");

// Related Options PRO / Связанные опции PRO <<
			// Скидки в связанных опциях
			if ($ro_for_products && $ro_for_products[$key]
			&& isset($ro_settings['spec_price']) && $ro_settings['spec_price']
			&& isset($ro_settings['spec_price_discount']) && $ro_settings['spec_price_discount'] ) {
			
				// get first option combination with discount
				foreach ($ro_for_products[$key] as $ro_comb) {
					
					if ($ro_comb['discounts']) {
						$ro_discount_quantity = $ro_quantities[$ro_comb['relatedoptions_id']];
						$product_ro_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "relatedoptions_discount
																														WHERE relatedoptions_id = '" . (int)$ro_comb['relatedoptions_id'] . "'
																														AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'
																														AND quantity <= '" . (int)$ro_discount_quantity . "'
																														ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");
						if ($product_ro_discount_query->num_rows) {
							$product_discount_query = $product_ro_discount_query;
							break;
						}
					}
				}
			}
			
			
			// >> Related Options PRO / Связанные опции PRO
				if ($product_discount_query->num_rows) {
					$price = $product_discount_query->row['price'];
				}

				// Product Specials
				$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");

// Related Options PRO / Связанные опции PRO <<
			// Акции в связанных опциях
			
			if ($ro_for_products && $ro_for_products[$key]
			&& isset($ro_settings['spec_price']) && $ro_settings['spec_price']
			&& isset($ro_settings['spec_price_special']) && $ro_settings['spec_price_special'] ) {
			
				// get first option combination with special
				foreach ($ro_for_products[$key] as $ro_comb) {
				
					if ($ro_comb['specials']) {
						$product_ro_special_query = $this->db->query("SELECT price FROM ".DB_PREFIX."relatedoptions_special 
																													WHERE relatedoptions_id = '" . (int)$ro_comb['relatedoptions_id'] . "'
																														AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'
																													ORDER BY priority ASC, price ASC LIMIT 1");
						if ($product_ro_special_query->num_rows) {
							$product_special_query = $product_ro_special_query;
							break;
						}
					}
				}
			}
			// >> Related Options PRO / Связанные опции PRO
				if ($product_special_query->num_rows) {
					$price = $product_special_query->row['price'];
				}

				// Reward Points
				$product_reward_query = $this->db->query("SELECT points FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

				if ($product_reward_query->num_rows) {
					$reward = $product_reward_query->row['points'];
				} else {
					$reward = 0;
				}

				// Downloads
				$download_data = array();

				$download_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download p2d LEFT JOIN " . DB_PREFIX . "download d ON (p2d.download_id = d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON (d.download_id = dd.download_id) WHERE p2d.product_id = '" . (int)$cart['product_id'] . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

				foreach ($download_query->rows as $download) {
					$download_data[] = array(
						'download_id' => $download['download_id'],
						'name'        => $download['name'],
						'filename'    => $download['filename'],
						'mask'        => $download['mask']
					);
				}

				// Stock
				if (!$product_query->row['quantity'] || ($product_query->row['quantity'] < $cart['quantity'])) {
					$stock = false;
				}

				$recurring_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring r LEFT JOIN " . DB_PREFIX . "product_recurring pr ON (r.recurring_id = pr.recurring_id) LEFT JOIN " . DB_PREFIX . "recurring_description rd ON (r.recurring_id = rd.recurring_id) WHERE r.recurring_id = '" . (int)$cart['recurring_id'] . "' AND pr.product_id = '" . (int)$cart['product_id'] . "' AND rd.language_id = " . (int)$this->config->get('config_language_id') . " AND r.status = 1 AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

				if ($recurring_query->num_rows) {
					$recurring = array(
						'recurring_id'    => $cart['recurring_id'],
						'name'            => $recurring_query->row['name'],
						'frequency'       => $recurring_query->row['frequency'],
						'price'           => $recurring_query->row['price'],
						'cycle'           => $recurring_query->row['cycle'],
						'duration'        => $recurring_query->row['duration'],
						'trial'           => $recurring_query->row['trial_status'],
						'trial_frequency' => $recurring_query->row['trial_frequency'],
						'trial_price'     => $recurring_query->row['trial_price'],
						'trial_cycle'     => $recurring_query->row['trial_cycle'],
						'trial_duration'  => $recurring_query->row['trial_duration']
					);
				} else {
					$recurring = false;
				}


			// << Live Price
			// replace standard calculated price
			
			//$model_liveprice = $this->getModelLivePrice();
			
			if ( $model_liveprice && $model_liveprice->installed() ) {
			
				$lp_prices = array();
				$lp_product_data = array();
				if ( VERSION >= '2.1.0.0' ) {
					$lp_product_id = $cart['product_id'];
					$lp_options = (array)json_decode($cart['option']);
					$lp_recurring_id = $cart['recurring_id'];
					$lp_quantity = $cart['quantity'];
				} else {
					$lp_product_id = $product_id;
					$lp_options = $options;
					$lp_recurring_id = $recurring_id;
					$lp_quantity = $quantity;
				}
				$model_liveprice->getProductPrice( $lp_product_id, -$lp_quantity, $lp_options, $lp_recurring_id, $lp_prices, $lp_product_data, $option_data, false, true, true );
				//$model_liveprice->getProductPrice( $lp_product_id, -$lp_quantity, $lp_options, $lp_recurring_id, $lp_prices, $lp_product_data, $option_data, false, true );
				//$model_liveprice->getProductPrice( $lp_product_id, -1, $lp_options, $lp_recurring_id, $lp_prices, $lp_product_data, $option_data, false, true );
				//$model_liveprice->getProductPrice( isset($product_id) ? $product_id : $cart['product_id'], -1, isset($options) ? $options : $cart['option'], $recurring_id, $prices, $product_data, $option_data, false, true );
				$price = $lp_prices['price'];
				$option_price = $lp_prices['option_price'];
			}
			
			// >> Live Price
			

      // Product Option Image PRO module <<
      
			global $registry;
      //global $loader, $registry;
			
			if ($registry) {
				$poipregistry = $registry;
			} else {
				$poipregistry = $this->poipregistry;
			}
			$poiploader = new Loader($poipregistry);
			
      $poiploader->model('module/product_option_image_pro');
      $poip_model = $poipregistry->get('model_module_product_option_image_pro');
      $product_query->row['image'] = $poip_model->getProductCartImage($product_query->row['product_id'], $option_data, $product_query->row['image']);
      
      // >> Product Option Image PRO module
      

			// Related Options PRO / Связанные опции PRO <<
			
			$ro_product_fields = array('sku'=>'','upc'=>'','ean'=>'','location'=>'');
			
			if ($ro_for_products && $ro_for_products[$key]) {
			
				foreach ($ro_for_products[$key] as $ro_comb) {
				
					if (isset($ro_settings['spec_sku']) && $ro_settings['spec_sku'] && $ro_comb['sku']) {
						$ro_product_fields['sku'] = $ro_comb['sku'];
					}
					if (isset($ro_settings['spec_upc']) && $ro_settings['spec_upc'] && $ro_comb['upc']) {
						$ro_product_fields['upc'] = $ro_comb['upc'];
					}
					if (isset($ro_settings['spec_ean']) && $ro_settings['spec_ean'] && $ro_comb['ean']) {
						$ro_product_fields['ean'] = $ro_comb['ean'];
					}
					if (isset($ro_settings['spec_location']) && $ro_settings['spec_location'] && $ro_comb['location']) {
						$ro_product_fields['location'] = $ro_comb['location'];
					}
				}
			}
			
			// >> Related Options PRO / Связанные опции PRO
			
			
				$product_data[] = array(

			// Related Options PRO / Связанные опции PRO <<
			
			'sku'         => $ro_product_fields['sku'],
			'upc'         => $ro_product_fields['upc'],
			'ean'         => $ro_product_fields['ean'],
			'location'    => $ro_product_fields['location'],
			
			// >> Related Options PRO / Связанные опции PRO
			
			
					'cart_id'         => $cart['cart_id'],
					'product_id'      => $product_query->row['product_id'],
					'name'            => $product_query->row['name'],
					'model'           => $product_query->row['model'],
					'shipping'        => $product_query->row['shipping'],
					'image'           => $product_query->row['image'],
					'option'          => $option_data,
					'download'        => $download_data,
					'quantity'        => $cart['quantity'],
					'minimum'         => $product_query->row['minimum'],
					'subtract'        => $product_query->row['subtract'],
					'stock'           => $stock,
					'price'           => ($price + $option_price),
					'total'           => ($price + $option_price) * $cart['quantity'],
					'reward'          => $reward * $cart['quantity'],
					'points'          => ($product_query->row['points'] ? ($product_query->row['points'] + $option_points) * $cart['quantity'] : 0),
					'tax_class_id'    => $product_query->row['tax_class_id'],
					'weight'          => ($product_query->row['weight'] + $option_weight) * $cart['quantity'],
					'weight_class_id' => $product_query->row['weight_class_id'],
					'length'          => $product_query->row['length'],
					'width'           => $product_query->row['width'],
					'height'          => $product_query->row['height'],
					'length_class_id' => $product_query->row['length_class_id'],
					'recurring'       => $recurring
				);
			} else {
				$this->remove($cart['cart_id']);
			}
		}

		return $product_data;
	}

	public function add($product_id, $quantity = 1, $option = array(), $recurring_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "'");

		if (!$query->row['total']) {
			$this->db->query("INSERT " . DB_PREFIX . "cart SET customer_id = '" . (int)$this->customer->getId() . "', session_id = '" . $this->db->escape($this->session->getId()) . "', product_id = '" . (int)$product_id . "', recurring_id = '" . (int)$recurring_id . "', `option` = '" . $this->db->escape(json_encode($option)) . "', quantity = '" . (int)$quantity . "', date_added = NOW()");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = (quantity + " . (int)$quantity . ") WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "'");
		}
	}

	public function update($cart_id, $quantity) {
		$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = '" . (int)$quantity . "' WHERE cart_id = '" . (int)$cart_id . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
	}

	public function remove($cart_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart_id . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
	}

	public function clear() {
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
	}

	public function getRecurringProducts() {
		$product_data = array();

		foreach ($this->getProducts() as $value) {
			if ($value['recurring']) {
				$product_data[] = $value;
			}
		}

		return $product_data;
	}

	public function getWeight() {
		$weight = 0;

		foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
				$weight += $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('config_weight_class_id'));
			}
		}

		return $weight;
	}

	public function getSubTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $product['total'];
		}

		return $total;
	}

	public function getTaxes() {
		$tax_data = array();

		foreach ($this->getProducts() as $product) {
			if ($product['tax_class_id']) {
				$tax_rates = $this->tax->getRates($product['price'], $product['tax_class_id']);

				foreach ($tax_rates as $tax_rate) {
					if (!isset($tax_data[$tax_rate['tax_rate_id']])) {
						$tax_data[$tax_rate['tax_rate_id']] = ($tax_rate['amount'] * $product['quantity']);
					} else {
						$tax_data[$tax_rate['tax_rate_id']] += ($tax_rate['amount'] * $product['quantity']);
					}
				}
			}
		}

		return $tax_data;
	}

	public function getTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
		}

		return $total;
	}

	public function countProducts() {
		$product_total = 0;

		$products = $this->getProducts();

		foreach ($products as $product) {
			$product_total += $product['quantity'];
		}

		return $product_total;
	}

	public function hasProducts() {
		return count($this->getProducts());
	}

	public function hasRecurringProducts() {
		return count($this->getRecurringProducts());
	}

	public function hasStock() {
		$stock = true;

		foreach ($this->getProducts() as $product) {
			if (!$product['stock']) {
				$stock = false;
			}
		}

		return $stock;
	}

	public function hasShipping() {
		$shipping = false;

		foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
				$shipping = true;

				break;
			}
		}

		return $shipping;
	}

	public function hasDownload() {
		$download = false;

		foreach ($this->getProducts() as $product) {
			if ($product['download']) {
				$download = true;

				break;
			}
		}

		return $download;
	}
}