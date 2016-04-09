<?php
//  Related Options PRO / Связанные опции PRO
//  Support: support@liveopencart.com / Поддержка: help@liveopencart.ru
?>
<?php

class ModelModuleRelatedOptions extends Model {

	var $cache_sets_by_poids = array();
	
	
	// << orders editing 
	public function getOrderOptions($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");

		return $query->rows;
	}
	
	// return order quantity back to product quantity (on order delete)
	public function update_ro_quantity($product_id, $order_id, $order_product_id, $quantity, $sign='+') {
		
		if (!$this->installed()) {
			return;
		}
		
		$query = $this->db->query("SELECT subtract FROM `".DB_PREFIX."product` WHERE `product_id` = ".(int)$product_id." " );
		if ($query->num_rows && $query->row['subtract']) {
			
			$product_options = $this->model_module_related_options->getOrderOptions((int)$order_id, (int)$order_product_id);
			if ($product_options) {
				
				$options = array();
				foreach ($product_options as $product_option) {
					$options[$product_option['product_option_id']] = $product_option['product_option_value_id'];
				}
				
				$ro_combs = $this->get_related_options_sets_by_poids($product_id, $options);
				if ($ro_combs) {
					foreach ($ro_combs as $ro_comb) {
						
						$this->db->query("UPDATE `".DB_PREFIX."relatedoptions` SET quantity=(quantity".$sign."".(int)$quantity.") WHERE `relatedoptions_id` = ".(int)$ro_comb['relatedoptions_id']." " );
					}
				}
			}	
		}
		
	}
	// >> orders editing
	

	// returns only switched-on additional fields (sku, upc, location)
	public function getAdditionalFields() {
		
		$fields = array();
		
		if ($this->installed()) {
			$ro_settings = $this->config->get('related_options');
			$std_fields = array('sku', 'upc', 'ean', 'location');
			foreach ($std_fields as $field) {
				if ( isset($ro_settings['spec_'.$field]) && $ro_settings['spec_'.$field] ) {
					$fields[] = $field;
				}
			}
		}
		
		return $fields;
	}
	
	public function updateOrderProductAdditionalFields($product, $order_product_id) {
		
		if ($this->installed()) {
			$this->check_order_product_table();
			$ro_settings = $this->config->get('related_options');
			
			$ro_options = array();
			foreach ($product['option'] as $option) {
				if (isset($option['product_option_value_id'])) {
					$ro_options[$option['product_option_id']] = $option['product_option_value_id'];
				}
			}
			
			$ro_combs = $this->get_related_options_sets_by_poids($product['product_id'], $ro_options);
			
			if ($ro_combs) {
				
				if ( !$this->model_catalog_product ) {
					$this->load->model('catalog/product');
				}
				//$this->load->model('catalog/product');
				$current_product_info = $this->model_catalog_product->getProduct($product['product_id']);
				
				$ro_adds = array('model'=>'', 'sku'=>'', 'upc'=>'', 'ean'=>'', 'location'=>'');
				foreach ($ro_combs as $ro_comb) {
					
					foreach ($ro_adds as $ro_field_name => &$ro_field_value) {
						if ( isset($ro_settings['spec_'.$ro_field_name]) && $ro_settings['spec_'.$ro_field_name] ) {
							
							if ( $ro_comb[$ro_field_name] ) {
							
								if ($ro_field_name == 'model') {
									
									if ( $ro_settings['spec_'.$ro_field_name] == 1 ) {
										$ro_field_value = $ro_comb[$ro_field_name];
									} elseif ( $ro_settings['spec_'.$ro_field_name] == 2 ) {
										$ro_field_value.= $ro_comb[$ro_field_name];
									} elseif ( $ro_settings['spec_'.$ro_field_name] == 3 ) {
										if ($ro_field_value == '') $ro_field_value = $current_product_info[$ro_field_name];
										$ro_field_value.= $ro_comb[$ro_field_name];
									}
									
								} else {
									if ($ro_comb[$ro_field_name]) {
										$ro_field_value = $ro_comb[$ro_field_name];
									}
								}
							}
						}
					}
					unset($ro_field_value);
					
				}
				
				if (isset($ro_settings['spec_model']) && $ro_settings['spec_model'] && isset($ro_adds['model']) && trim($ro_adds['model']) != "") {
					$this->db->query("UPDATE " . DB_PREFIX . "order_product SET `model`='".$this->db->escape($ro_adds['model'])."' WHERE order_product_id = " . (int)$order_product_id . "");
				}
				if (isset($ro_settings['spec_sku']) && $ro_settings['spec_sku']) {
					$current_value = (isset($ro_adds['sku']) && trim($ro_adds['sku']) != "") ? $ro_adds['sku'] : $current_product_info['sku'];
					$this->db->query("UPDATE " . DB_PREFIX . "order_product SET `sku`='".$this->db->escape($current_value)."' WHERE order_product_id = " . (int)$order_product_id . "");
				}
				if (isset($ro_settings['spec_upc']) && $ro_settings['spec_upc']) {
					$current_value = (isset($ro_adds['upc']) && trim($ro_adds['upc']) != "") ? $ro_adds['upc'] : $current_product_info['upc'];
					$this->db->query("UPDATE " . DB_PREFIX . "order_product SET `upc`='".$this->db->escape($current_value)."' WHERE order_product_id = " . (int)$order_product_id . "");
				}
				if (isset($ro_settings['spec_ean']) && $ro_settings['spec_ean']) {
					$current_value = (isset($ro_adds['ean']) && trim($ro_adds['ean']) != "") ? $ro_adds['ean'] : $current_product_info['ean'];
					$this->db->query("UPDATE " . DB_PREFIX . "order_product SET `ean`='".$this->db->escape($current_value)."' WHERE order_product_id = " . (int)$order_product_id . "");
				}
				if (isset($ro_settings['spec_location']) && $ro_settings['spec_location']) {
					$current_value = (isset($ro_adds['location']) && trim($ro_adds['location']) != "") ? $ro_adds['location'] : $current_product_info['location'];
					$this->db->query("UPDATE " . DB_PREFIX . "order_product SET `location`='".$this->db->escape($current_value)."' WHERE order_product_id = " . (int)$order_product_id . "");
				}
			
			}
				
		}
		
	}
	
	public function get_related_options_model_sku($product_id, $ro_options, $product_model, $product_sku, &$ro_model, &$ro_sku) {
		
		
		if (!$this->installed()) return;
			
		$ro_settings = $this->config->get('related_options');
		
		$ro_combs = $this->get_related_options_sets_by_poids($product_id, $ro_options);
		
		$ro_model = '';
		$ro_sku = '';
		
		if ($ro_combs) {
			foreach ($ro_combs as $ro_comb) {
				
				if ( isset($ro_settings['spec_model']) && $ro_settings['spec_model'] ) {
					if ($ro_settings['spec_model'] == 1) {
						$ro_model = $ro_comb['model'];
					} elseif ($ro_settings['spec_model'] == 2) {
						$ro_model.= $ro_comb['model'];
					} elseif ($ro_settings['spec_model'] == 3) {
						if ($ro_model == '') $ro_model = $product_model;
						$ro_model.= $ro_comb['model'];	
					}
				}
				
				if ( isset($ro_settings['spec_sku']) && $ro_settings['spec_sku'] ) {
					if ($ro_settings['spec_sku'] == 1) {
						$ro_sku = $ro_comb['sku'];
					} elseif ($ro_settings['spec_sku'] == 2) {
						$ro_sku.= $ro_comb['sku'];
					} elseif ($ro_settings['spec_sku'] == 3) {
						if ($ro_sku == '')$ro_sku = $product_sku;
						$ro_sku.= $ro_comb['sku'];	
					}
				}
				
			}
		}
	}
	
	public function getRelatedOptionsIdsAutoSelectFirst($product_id) {
		
		$ro_ids = array();
		$ro_data = $this->get_ro_data($product_id);
		
		foreach ($ro_data as $ro_dt) {
			
			$ro_default = array();
			foreach ($ro_dt['ro'] as $ro) {
				
				if ($ro['defaultselect']) {
					$ro_default[] = $ro;
				}
				
			}
			
			$ro_comb = false;
			if ( count($ro_default) == 0 ) {
				$ro_default = $ro_dt['ro'];
			}
			
			foreach ($ro_default as $ro) {
				if ($ro_comb === false || $ro_comb['defaultselectpriority'] > $ro['defaultselectpriority']) {
					$ro_comb = $ro;
				}
			}
			
			if ($ro_comb !== false) {
				$ro_ids[] = $ro_comb['relatedoptions_id'];
			}
			
		}
		
		return $ro_ids;
		
	}
	
	public function getRelatedOptionsIdsFromSearch($product_id, $search_string) {
		
		$ro_settings = $this->config->get('related_options');
		
		if ( isset($ro_settings['spec_model']) ) {
			if ( $ro_settings['spec_model']==2 || $ro_settings['spec_model']==3 ) {
			
				$query = $this->db->query("	SELECT *
																		FROM 	`".DB_PREFIX."relatedoptions_search`
																		WHERE	product_id = ".(int)$product_id."
																			AND LCASE(`model`) = '" . $this->db->escape(utf8_strtolower($search_string)) . "'
																		");
				
				if ($query->num_rows) {
					return explode(',',$query->row['ro_ids']);
				}
				
			} elseif ( $ro_settings['spec_model']==1 ) {
				
				$query = $this->db->query("	SELECT *
																		FROM 	`".DB_PREFIX."relatedoptions`
																		WHERE	product_id = ".(int)$product_id."
																			AND LCASE(`model`) = '" . $this->db->escape(utf8_strtolower($search_string)) . "'
																		");
				
				$ro_ids = array();
				foreach ($query->rows as $row) {
					$ro_ids[] = $row['relatedoptions_id'];
				}
				return $ro_ids;
				
			}
		}
		return false;
	}
	
	// without discouts and specials ?
  public function calc_price_with_ro($product_price, $ro_combs, &$special=0, &$stock=0, &$ro_price_modificator=0) {
		
		$ro_price = $product_price;
		
		if ($this->installed()) {
			
			$ro_settings = $this->config->get('related_options');
			
			if ( isset($ro_settings['spec_price']) && $ro_settings['spec_price'] ) {
				foreach ($ro_combs as $ro_comb) {
					
					if (isset($ro_comb['price']) && $ro_comb['price']!=0) {
						if (isset($ro_settings['spec_price_prefix']) && $ro_settings['spec_price_prefix'] && $ro_comb['price_prefix'] == '+') {
							$ro_price+= $ro_comb['price'];
							$ro_price_modificator+= $ro_comb['price'];
						} elseif (isset($ro_settings['spec_price_prefix']) && $ro_settings['spec_price_prefix'] && $ro_comb['price_prefix'] == '-') {
							$ro_price-= $ro_comb['price'];
							$ro_price_modificator-= $ro_comb['price'];
						} else {
							$ro_price = $ro_comb['price'];
						}
					}
					
					if (isset($ro['current_customer_group_special_price']) && $ro['current_customer_group_special_price']) {
						$special = $ro['current_customer_group_special_price'];
					}
					
					if (isset($ro_settings['spec_ofs']) && $ro_settings['spec_ofs']) {
						$stock = $ro_comb['stock'];
					}
					
				}
			}	
			
		}
		
		return $ro_price;
		
	}
	
  public function getJournal2Price($product_id, $price, &$special=false, &$ro_stock) {
		
		if ($this->installed()) {
			
			$ro_settings = $this->config->get('related_options');
			if ($ro_settings && is_array($ro_settings) && isset($ro_settings['spec_price']) && $ro_settings['spec_price']) {
				
				if ( !$this->model_catalog_product ) {
					$this->load->model('catalog/product');
				}
				//$this->load->model('catalog/product');
				$product_options = $this->model_catalog_product->getProductOptions($product_id);
				$options = array();
				foreach ($product_options as $option) {
					if (!in_array($option['type'], array('select', 'radio', 'image', 'block', 'color'))) continue;
								
					$option_ids = Journal2Utils::getProperty($this->request->post, 'option.' . $option['product_option_id'], array());
					
					if (is_scalar($option_ids)) {
						$options[$option['product_option_id']] = $option_ids;
					} elseif (is_array($option_ids) && count($option_ids) > 0) {
						$options[$option['product_option_id']] = $option_ids[0];
					}
					
				}
				
				if (count($options) > 0 ) {
					
					$ro_combs = $this->get_related_options_sets_by_poids($product_id, $options);
					
					$price = $this->calc_price_with_ro($product_price, $ro_combs, $special, $ro_stock);
					
					return $price;
					
				}
			}	
		}
		
		return false;
	}
	
	
	// check is there enough product quantity for related options (for all products in cart)
	public function cart_ckeckout_stock($products) {
		
		if ($this->installed()) {
			if (is_array($products)) {
				foreach ($products as &$product) {
					if ($product['stock']) {
						if (isset($product['option'])&&is_array($product['option'])) {
							$poids = array();
							foreach ($product['option'] as $option) {
								if ($option) {
									$poids[$option['product_option_id']] = $option['product_option_value_id'];
								}
								//$poids[$option['product_option_id']] = (int)$option['product_option_value_id'];
							}
							if (count($poids) > 0) {
								$product['stock'] = $this->cart_stock($product['product_id'], $poids, $product['quantity']);
							}
						}
					}
				}
				unset($product);
			}
		}
		return $products;
		
	}
	
	public function get_ro_free_quantity($roids) {
		
		if (!$roids) return 0;
		
		foreach ($roids as &$roid) {
			$roid = (int)$roid;
		}
		unset($roid);
		
		$query = $this->db->query("	SELECT RO.relatedoptions_id, RO.quantity, RO.product_id
																FROM 	" . DB_PREFIX . "relatedoptions RO
																WHERE RO.relatedoptions_id IN (".implode(",",$roids).")
																");
		$qtys = array();
		$product_id = 0;
		foreach ($query->rows as $row) {
			$qtys[$row['relatedoptions_id']] = $row['quantity'];
			$product_id = $query->row['product_id'];
		}
		
		if ($product_id==0 || !$qtys ) return 0;
		
		
		
		$products = $this->cart->getProducts();
		foreach ($products as $product) {
			if ($product['product_id'] == $product_id) {
				$options = array();
				foreach ($product['option'] as $option) {
					$options[$option['product_option_id']] = $option['product_option_value_id'];
				}
				
				$ro_combs = $this->get_related_options_sets_by_poids($product_id, $options);
				foreach ($ro_combs as $ro_comb) {
					if ( isset($qtys[$ro_comb['relatedoptions_id']]) ) {
						$qtys[$ro_comb['relatedoptions_id']] = MAX(0, $qtys[$ro_comb['relatedoptions_id']]-$product['quantity']);
					}
				}

			}
		}
		
		$quantity = false;
		foreach ($qtys as $qty) {
			if ($quantity === false) {
				$quantity = $qty;
			} else {
				$quantity = MIN($quantity, $qty);
			}
		}
		
		return $quantity;
		
	}
	
	
	// check is there's enough quantiti for related options
	public function cart_stock($product_id, $options, $quantity) {
		
		$ro_combs = $this->get_related_options_sets_by_poids($product_id, $options, true);
		//$ro_combs = $this->get_related_options_sets_by_poids($product_id, $options);
		$stock_ok = true;
		if ($ro_combs) {
			foreach ($ro_combs as $ro_comb) {
				$stock_ok = $stock_ok && ($quantity <= $ro_comb['quantity']);
			}
		}
		
		return $stock_ok;
		
	}
	
	
	// returns information for all relevant related options combinations
	// discounts and specials for current customer
	// if there's not price, discount or special for combination, this data takes from product 
	// all options values from related options combination should be equal to options given as parameter of function
	// (it's possible to have more options in parameter than in a related options combination)
	public function get_related_options_sets_by_poids($product_id, $options, $use_cache=false) {
		
		if (!$options || !is_array($options) || count($options)==0 ) {
			return FALSE;
		}
		
		$cache_key = md5( $product_id.'_'.serialize($options) );
		
		if ( $use_cache && isset($this->cache_sets_by_poids[$cache_key]) ) {
			return $this->cache_sets_by_poids[$cache_key];
		}
		
		$matches = array();
		$ro_data = $this->get_ro_data($product_id, false);
		
		foreach ($ro_data as $ro_dt) {
			
			$options_to_check = array();
			$options_values_to_check = array();
			foreach ($options as $po_id => $pov_id) {
				if ($pov_id && in_array($po_id, $ro_dt['options_ids'])) {
					$options_to_check[] = $po_id;
					$options_values_to_check[$po_id] = $pov_id;
				}
			}
			
			if ( !array_diff($options_to_check, $ro_dt['options_ids']) && count($options_to_check) == count($ro_dt['options_ids']) ) {
			
				foreach ($ro_dt['ro'] as $ro_comb) {
					if ( !array_diff_assoc($options_values_to_check, $ro_comb['options']) && count($options_values_to_check) == count($ro_comb['options']) ) {
						$matches[] = $ro_comb;
						
						break;
					}
				}
				
			}
			
		}
		
		$this->cache_sets_by_poids[$cache_key] = $matches;
		
		
		return $matches;
		
	}
	

  public function get_option_types() {
		return "'select', 'radio', 'image', 'block', 'color'";
	}
  
  public function get_compatible_options() {
		
		if (!$this->installed()) {
			return array();
		}
		
		$lang_id = $this->getLanguageId($this->config->get('config_language'));
		
		$query = $this->db->query("SELECT O.option_id, OD.name FROM `".DB_PREFIX."option` O, `".DB_PREFIX."option_description` OD
															WHERE O.option_id = OD.option_id
																AND OD.language_id = ".$lang_id."
																AND O.type IN (".$this->get_option_types().")
															ORDER BY O.sort_order
															");
		
		$opts = array();
		foreach ($query->rows as $row) {
			$opts[$row['option_id']] = $row['name'];
		}
		
		return $opts;
		
	}
  
  public function get_compatible_options_values() {
		
		if (!$this->installed()) {
			return array();
		}
		
		$lang_id = $this->getLanguageId($this->config->get('config_language'));
		
		$optsv = array();
		$compatible_options = $this->get_compatible_options();
		$str_opt = "";
		foreach ($compatible_options as $option_id => $option_name) {
			$optsv[$option_id] = array('name'=>$option_name, 'values'=>array());
			$str_opt .= ",".$option_id;
		}
		if ($str_opt!="") {
			$str_opt = substr($str_opt, 1);
			$query = $this->db->query("	SELECT OV.option_id, OVD.name, OVD.option_value_id
																	FROM `".DB_PREFIX."option_value` OV, `".DB_PREFIX."option_value_description` OVD 
																	WHERE OV.option_id IN (".$str_opt.")
																		AND OVD.language_id = ".$lang_id."
																		AND OV.option_value_id = OVD.option_value_id
																	ORDER BY OV.sort_order
																	");
			foreach ($query->rows as $row) {
				$optsv[$row['option_id']]['values'][$row['option_value_id']] = $row['name'];
			}
		}
		
		return $optsv;
		
	}
  
  public function get_options_for_variant($relatedoptions_variant_id) {
		
		$options = array();
		if ($relatedoptions_variant_id == 0) {
			$copts = $this->get_compatible_options();
			$options = array_keys($copts);
		} else {
			$options = array();
			$query = $this->db->query("	SELECT VO.option_id
																	FROM `".DB_PREFIX."relatedoptions_variant_option` VO
																	WHERE relatedoptions_variant_id = ".$relatedoptions_variant_id."
																	");
			foreach ($query->rows as $row) {
				$options[] = $row['option_id'];
			}
		}
		
		return $options;
		
	}
  
  
  public function getLanguageId($lang) {
		$query = $this->db->query('SELECT `language_id` FROM `' . DB_PREFIX . 'language` WHERE `code` = "'.$lang.'"');
		return $query->row['language_id'];
	}
  
  // option_id
  public function get_product_variant_options($product_id) {
		
		$options = array();
		
		$ro_variant_id = 0;
		$query = $this->db->query("	SELECT VP.relatedoptions_variant_id
																FROM 	" . DB_PREFIX . "relatedoptions_variant_product VP
																WHERE VP.product_id = ".(int)$product_id."
																");
		if ($query->num_rows) {
			$ro_variant_id = $query->row['relatedoptions_variant_id'];
		}
		
		$options = $this->get_options_for_variant($ro_variant_id);
		return $options;
		
	}
  
	function check_order_product_table() {
		
		if (!$this->installed()) return;
		
		$ro_settings = $this->config->get('related_options');
		
		if (isset($ro_settings['spec_sku']) && $ro_settings['spec_sku']) {
			$query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "order_product` WHERE field='sku' ");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `".DB_PREFIX."order_product` ADD COLUMN `sku` varchar(64) NOT NULL " );
			}
		}
		
		if (isset($ro_settings['spec_upc']) && $ro_settings['spec_upc']) {
			$query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "order_product` WHERE field='upc' ");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `".DB_PREFIX."order_product` ADD COLUMN `upc` varchar(12) NOT NULL " );
			}
		}
		
		if (isset($ro_settings['spec_ean']) && $ro_settings['spec_ean']) {
			$query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "order_product` WHERE field='ean' ");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `".DB_PREFIX."order_product` ADD COLUMN `ean` varchar(14) NOT NULL " );
			}
		}
		
		if (isset($ro_settings['spec_location']) && $ro_settings['spec_location']) {
			$query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "order_product` WHERE field='location' ");
			if (!$query->num_rows) {
				$this->db->query("ALTER TABLE `".DB_PREFIX."order_product` ADD COLUMN `location` varchar(128) NOT NULL " );
			}
		}
		
		
	}
	
	public function get_ro_data($product_id, $for_front_end=false) {
		
		if (!$this->installed()) {
			return array();
		}
		
		$customer_group_id = (int)$this->config->get('config_customer_group_id');
		$lang_id = $this->getLanguageId($this->config->get('config_language'));
		
		$ro_settings = $this->config->get('related_options');
		
		$ro_data = array();
		
		$query = $this->db->query("	SELECT ROVP.*
																FROM 	`" . DB_PREFIX . "relatedoptions_variant_product` ROVP
																		LEFT JOIN	`" . DB_PREFIX . "relatedoptions_variant` ROV ON (ROVP.relatedoptions_variant_id = ROV.relatedoptions_variant_id)
																WHERE ROVP.product_id = " . (int)$product_id . "
																	AND ROVP.relatedoptions_use = 1
																ORDER BY ROV.sort_order, ROV.relatedoptions_variant_name, ROVP.relatedoptions_variant_id, ROVP.relatedoptions_variant_product_id
																");
		
		$rovp_rows = $query->rows;
		
		foreach ($rovp_rows as $rovp_row) {
			
			$ro_data[] = array(	'rovp_id' => $rovp_row['relatedoptions_variant_product_id']
												,	'use' 		=> $rovp_row['relatedoptions_use']
												,	'rov_id' 	=> $rovp_row['relatedoptions_variant_id']
												, 'ro'			=> array()
												, 'options_ids' => array()
												);
			$cnt = count($ro_data)-1;
			$rovp_id = (int)$rovp_row['relatedoptions_variant_product_id'];
			
			$query = $this->db->query("	SELECT RO.*, SS.name stock_status, PS.name product_stock_status
																	FROM 	`" . DB_PREFIX . "relatedoptions` RO
																			LEFT JOIN ".DB_PREFIX."stock_status SS ON (SS.stock_status_id = RO.stock_status_id && SS.language_id = ".(int)$lang_id." )
																			, `" . DB_PREFIX . "product` P
																			LEFT JOIN ".DB_PREFIX."stock_status PS ON (PS.stock_status_id = P.stock_status_id && PS.language_id = ".(int)$lang_id." )
																	WHERE RO.relatedoptions_variant_product_id = " . (int)$rovp_id . "
																		".(isset($ro_settings['allow_zero_select'])&& $ro_settings['allow_zero_select'] ? "" : " AND RO.quantity > 0 ")."
																		AND P.product_id = RO.product_id
																	ORDER BY RO.relatedoptions_id
																	");
			foreach ($query->rows as $row) {
				
				$ro_data[$cnt]['ro'][$row['relatedoptions_id']] = $row;
				
				if ($for_front_end) {
					//unset($ro_data[$cnt]['ro'][$row['relatedoptions_id']]['price']);
					unset($ro_data[$cnt]['ro'][$row['relatedoptions_id']]['quantity']);
				}
				
				$stock = '';
				$in_stock = false;
				if (isset($ro_settings['spec_ofs'])&& $ro_settings['spec_ofs']) {
					$in_stock = true;
					if ($row['quantity'] <= 0) {
						$stock = ($row['stock_status']) ? $row['stock_status'] : $row['product_stock_status'] ;
						$in_stock = false;
					} elseif ($this->config->get('config_stock_display')) {
						$stock = $row['quantity'];
					} else {
						$stock = $this->language->get('text_instock');
					}
				}
				
				$ro_data[$cnt]['ro'][$row['relatedoptions_id']]['stock'] = $stock;
				$ro_data[$cnt]['ro'][$row['relatedoptions_id']]['options'] = array();
				$ro_data[$cnt]['ro'][$row['relatedoptions_id']]['discounts'] = array();
				$ro_data[$cnt]['ro'][$row['relatedoptions_id']]['specials'] = array();
				
			}
			
			$query = $this->db->query("	SELECT ROO.*, PO.product_option_id, POV.product_option_value_id
																	FROM 	`" . DB_PREFIX . "relatedoptions_option` ROO
																			,	`" . DB_PREFIX . "relatedoptions` RO
																			, `" . DB_PREFIX . "option` O
																			, `" . DB_PREFIX . "option_value` OV
																			, `" . DB_PREFIX . "product_option` PO
																			, `" . DB_PREFIX . "product_option_value` POV
																	WHERE ROO.product_id = " . (int)$product_id . "
																		AND RO.relatedoptions_id = ROO.relatedoptions_id
																		AND RO.relatedoptions_variant_product_id = ".(int)$rovp_id."
																		AND O.option_id = ROO.option_id
																		AND O.option_id = PO.option_id
																		AND PO.product_id = " . (int)$product_id . "
																		AND OV.option_value_id = ROO.option_value_id
																		AND OV.option_value_id = POV.option_value_id
																		AND POV.product_option_id = PO.product_option_id
																		".(isset($ro_settings['allow_zero_select'])&& $ro_settings['allow_zero_select'] ? "" : " AND RO.quantity > 0 ")."
																	ORDER BY ROO.relatedoptions_id, O.sort_order, OV.sort_order 
																	");
			
			foreach ($query->rows as $row) {
				$ro_data[$cnt]['ro'][$row['relatedoptions_id']]['options'][$row['product_option_id']] = $row['product_option_value_id'];
				if ( !in_array($row['product_option_id'], $ro_data[$cnt]['options_ids']) ) {
					$ro_data[$cnt]['options_ids'][] = $row['product_option_id'];
				}
			}
			
			if (!$for_front_end) {
				$query = $this->db->query("	SELECT RD.*
																		FROM 	`" . DB_PREFIX . "relatedoptions` RO
																				, `" . DB_PREFIX . "relatedoptions_discount` RD
																		WHERE RO.product_id = " . (int)$product_id . "
																			AND RO.relatedoptions_id = RD.relatedoptions_id
																			AND RO.relatedoptions_variant_product_id = ".(int)$rovp_id."
																			AND RD.customer_group_id = ".(int)$customer_group_id."
																			".(isset($ro_settings['allow_zero_select'])&& $ro_settings['allow_zero_select'] ? "" : " AND RO.quantity > 0 ")."
																		ORDER BY RD.relatedoptions_id, RD.customer_group_id, RD.quantity 
																		");
				
				foreach ($query->rows as $row) {
					$ro_data[$cnt]['ro'][$row['relatedoptions_id']]['discounts'][] = $row;
				}
				
				
				$query = $this->db->query("	SELECT RS.*
																		FROM 	`" . DB_PREFIX . "relatedoptions` RO
																				, `" . DB_PREFIX . "relatedoptions_special` RS
																		WHERE RO.product_id = " . (int)$product_id . "
																			AND RO.relatedoptions_id = RS.relatedoptions_id
																			AND RO.relatedoptions_variant_product_id = ".(int)$rovp_id."
																			AND RS.customer_group_id = ".(int)$customer_group_id."
																			".(isset($ro_settings['allow_zero_select'])&& $ro_settings['allow_zero_select'] ? "" : " AND RO.quantity > 0 ")."
																		ORDER BY RS.relatedoptions_id, RS.customer_group_id
																		");
				
				foreach ($query->rows as $row) {
					$ro_data[$cnt]['ro'][$row['relatedoptions_id']]['specials'][] = $row;
					$ro_data[$cnt]['ro'][$row['relatedoptions_id']]['current_customer_group_special_price'] = $query->row['price'];
				}
			}
		}
		
		return $ro_data;
		
	}
	

  public function installed() {
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = 'module' AND `code` = 'related_options'");
		return $query->num_rows;
		
		return false;
		
	}



}



?>