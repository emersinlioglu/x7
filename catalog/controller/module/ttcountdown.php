<?php  
class ControllerModulettcountdown extends Controller {
	public  function index($setting) {
		
		if(empty($setting)) {
			$data['permission'] = false;
		} else {
			$data['permission'] = true;
		}
		
		if($data['permission']) {
			$this->load->language('module/ttcountdown');

			$this->load->model('module/ttcountdown');

			$this->load->model('tool/image');

			if (empty($setting['limit'])) {
				$setting['limit'] = 4;
			}

			$data['heading_title'] 	= $this->language->get('heading_title');

			$data['text_reviews'] 	= $this->language->get('text_reviews');
			$data['text_years'] 	= $this->language->get('text_years');
			$data['text_months'] 	= $this->language->get('text_months');
			$data['text_weeks'] 	= $this->language->get('text_weeks');
			$data['text_days'] 		= $this->language->get('text_days');
			$data['text_hours'] 	= $this->language->get('text_hours');
			$data['text_minutes'] 	= $this->language->get('text_minutes');
			$data['text_seconds'] 	= $this->language->get('text_seconds');

			$data['button_cart'] 	= $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');

			$results = $this->model_module_ttcountdown->getTimeCountdown($setting['limit']);
			if ($results) {
				foreach ($results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}
					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($result['orgprice'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}
					if ((float)$result['special']) {
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['orgprice']);
					} else {
						$tax = false;
					}
					if ($result['date_start']!=null) {
						$date_start = $result['date_start'] ;
					} else {
						$date_start = false;
					}
					if($result['date_end']!=null) {
						$date_end = $result['date_end'] ;
					} else {
						$date_end = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $result['rating'];
					} else {
						$rating = false;
					}

					$reviews = sprintf($this->language->get('text_reviews'), (int)$result['reviews']);
					$data['products'][] = array(
						'product_id'  	=> $result['product_id'],
						'thumb'       	=> $image,
						'name'        	=> $result['name'],
						//'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'description' 	=> utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 250) . '..',
						'orgprice'      => $price,
						'special'     	=> $special,
						'date_start'  	=> $date_start,
						'date_end'    	=> $date_end,
						'tax'         	=> $tax,
						'rating'      	=> $rating,
						'href'        	=> $this->url->link('product/product', 'product_id=' . $result['product_id']),
						'reviews' 		=> $reviews
					);
				}
			}

			$data['config_slide'] = array(
				'items' => $setting['item'],
				'f_speed_slide' => $setting['autoplay'],
				'f_show_nextback' => $setting['shownextback'],
				'f_show_ctr' => $setting['shownav'],
				'f_ani_speed' => $setting['speed']
			);
			
			$data['use_thumbnail_slider'] = $setting['usethumbslide'];
			$data['thumbnail_slider_mode'] = $setting['thumbslidemode'];
		}

		$this->document->addScript('catalog/view/javascript/jquery.plugin.js');
		$this->document->addScript('catalog/view/javascript/jquery/bxslider/jquery.bxslider.js');
		$this->document->addStyle('catalog/view/javascript/jquery.countdown.css');
		$this->document->addStyle('catalog/view/javascript/jquery/bxslider/jquery.bxslider.css');
        $data['text_label_sale'] = $this->language->get('text_label_sale');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ttcountdown.tpl')) {
			return $this->load->view($this->config->get('config_template').'/template/module/ttcountdown.tpl', $data);
		} else {
			return $this->load->view('default/template/module/ttcountdown.tpl',$data);
		}
		
	}
}

?>