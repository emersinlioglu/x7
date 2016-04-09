<?php

//  Live Price 2 / Динамическое обновление цены - живая цена 2
//  Support: support@liveopencart.com / Поддержка: opencart@19th19th.ru

class ControllerModuleLivePrice extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/liveprice');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_setting_setting->editSetting('liveprice', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('module/liveprice', 'token=' . $this->session->data['token'], 'SSL'));
			
		}
				
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');
		$data['text_edit_position'] = $this->language->get('text_edit_position');
		$data['module_info'] = $this->language->get('module_info');
		$data['module_description'] = $this->language->get('module_description');
		$data['module_copyright'] = $this->language->get('module_copyright');
		$data['module_page'] = $this->language->get('module_page');
		$data['text_update_alert'] = $this->language->get('text_update_alert');
		
		$data['entry_discount_quantity'] = $this->language->get('entry_discount_quantity');
		$data['text_discount_quantity_0'] = $this->language->get('text_discount_quantity_0');
		$data['text_discount_quantity_1'] = $this->language->get('text_discount_quantity_1');
		$data['text_discount_quantity_2'] = $this->language->get('text_discount_quantity_2');
		$data['text_relatedoptions_notify'] = $this->language->get('text_relatedoptions_notify');
		$data['entry_multiplied_price'] = $this->language->get('entry_multiplied_price');
		$data['entry_ignore_cart'] = $this->language->get('entry_ignore_cart');
		$data['entry_ignore_cart_help'] = $this->language->get('entry_ignore_cart_help');
		
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$data['entry_we_recommend'] = $this->language->get('entry_we_recommend');
		$data['entry_show_we_recommend'] = $this->language->get('entry_show_we_recommend');
		$data['text_we_recommend'] = $this->language->get('text_we_recommend');
		$data['entry_about'] = $this->language->get('entry_about');
		$data['entry_settings'] = $this->language->get('entry_settings');
		$data['text_conversation'] = $this->language->get('text_conversation');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');
		
		$this->load->model('module/liveprice');
		$data['module_version'] = $this->model_module_liveprice->current_version();
		
		$data['config_admin_language'] = $this->config->get('config_admin_language');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
      $data['success'] = $this->session->data['success'];
      unset($this->session->data['success']);
    } 

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
		);

		$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_module'),
		'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
		);
	
		$data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
		'href'      => $this->url->link('module/liveprice', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
		);
		
		$data['action'] = $this->url->link('module/liveprice', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		/*
		$data['modules'] = array();
		
		
		if (isset($this->request->post['liveprice_module'])) {
			$data['modules'] = $this->request->post['liveprice_module'];
		} elseif ($this->config->get('liveprice_module')) { 
			$data['modules'] = $this->config->get('liveprice_module');
		}
		*/
		
		$data['liveprice_settings'] = array('discount_quantity'=>0);
		if (isset($this->request->post['liveprice_settings'])) {
			$data['liveprice_settings'] = $this->request->post['liveprice_settings'];
		} elseif ($this->config->get('liveprice_settings')) { 
			$data['liveprice_settings'] = $this->config->get('liveprice_settings');
		}	
		
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
		/*				
		$this->template = 'module/liveprice.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		*/
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
				
		$this->response->setOutput($this->load->view('module/liveprice.tpl', $data));
		//$this->response->setOutput($this->render());
	}
	
	// получаем стандартные настройки отображения модуля (при установке)
	private function standardSettings($post=false) {
		if (!$post || is_array($post)) {
			$post = array();
		}
		
		$post['liveprice_module'] = Array ( 0 => Array ( 	'layout_id' => 2
																										,	'position' => 'content_bottom'
																										, 'status' => 1
																										, 'sort_order' => 0
																										) );
		
		return $post;
	}
	
	public function install() {
		
		$post = $this->standardSettings();
		
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('liveprice', $post);
		
	}
	
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/liveprice')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>