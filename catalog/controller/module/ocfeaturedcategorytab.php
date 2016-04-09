<?php
class ControllerModuleOcfeaturedcategorytab extends Controller {

    public function index($setting) {

        $this->load->language('module/ocfeaturedcategorytab');

        $this->load->model('catalog/product');
        $this->load->model('catalog/category');
        $this->load->model('module/ocfeaturedcategorytab');
        $this->load->model('tool/image');

        $filter_data = array(
            'sort'  => 'p.date_added',
            'order' => 'DESC',
            'start' => 0,
            'limit' => $setting['limit']
        );

        $data = array();

        $_featured_categories = $this->model_module_ocfeaturedcategorytab->getFeaturedCategories();
        if ($_featured_categories) {
            foreach ($_featured_categories as $_category) {
                if ($_category['homethumb_image']) {
                    $homethumb_image = $this->model_tool_image->resize($_category['homethumb_image'], $setting['width'], $setting['height']);
                } else {
                    $homethumb_image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                }

                $filter_data['filter_category_id'] = $_category['category_id'];

                $data['categories'][] = array(
                    'category_id'  		=> $_category['category_id'],
                    'homethumb_image'   => $homethumb_image,
                    'name'        		=> $_category['name'],
                    'description' 		=> utf8_substr(strip_tags(html_entity_decode($_category['description'], ENT_QUOTES, 'UTF-8')), 0, 80) . 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod',
                    'href'        		=> $this->url->link('product/category', 'path=' . $_category['category_id']),
                    'products'          => $this->getProductFromData($filter_data,$setting)
                );
            }

            $data['config_slide'] = array(
                'items' => $setting['item'],
                'autoplay' => $setting['autoplay'],
                'shownextback' => $setting['shownextback'],
                'shownav' => $setting['shownav'],
                'speed' => $setting['speed'],
                'showprice' => $setting['showprice'],
                'showdes' => $setting['showdes'],
                'showaddtocart' => $setting['showaddtocart'],
                'f_rows' => $setting['rows']
            );

            $alias = str_replace(' ','_',$setting['name']);
            $data['category_alias'] = $alias;

            $data['heading_title'] = $this->language->get('heading_title');

            $data['tab_effect'] = 'wiggle';

            $data['text_tax'] = $this->language->get('text_tax');

            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');
            $data['exist_fcate'] = true;

        } else {
            $data['exist_fcate'] = false;
        }

        $data['status'] = $setting['status'];
		$data['text_empty_categories'] = $this->language->get('text_empty_categories');
		$data['text_empty_products'] = $this->language->get('text_empty_products');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/ocfeaturedcategorytab.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/ocfeaturedcategorytab.tpl', $data);
        } else {
            return $this->load->view('default/template/module/ocfeaturedcategorytab.tpl', $data);
        }

    }
    public function getProductFromData($data= array(), $setting = array()) {

        $results = $this->model_catalog_product->getProducts($data);
        $product_list = array();
        foreach ($results as $result) {
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], 300, 300);
            } else {
                $image = false;
            }

            if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $price = false;
            }

            if ((float)$result['special']) {
                $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
            } else {
                $special = false;
            }

            if ($this->config->get('config_review_status')) {
                $rating = $result['rating'];
            } else {
                $rating = false;
            }

            $product_list[] = array(
                'product_id' => $result['product_id'],
                'thumb'   	 => $image,
                'name'    	 => $result['name'],
                'price'   	 => $price,
                'special' 	 => $special,
                'rating'     => $rating,
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
                'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
                'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
            );


        }

        return $product_list;

    }
}