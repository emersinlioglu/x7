<?php
//  Related Options PRO / Связанные опции PRO
//  Support: support@liveopencart.com / Поддержка: help@liveopencart.ru
?>
<?php  
class ControllerModuleRelatedOptions extends Controller {
	
  public function get_ro_free_quantity() {
    
		
    if ($this->request->server['REQUEST_METHOD'] == 'GET' && isset($this->request->get['roids'])) {
      
      $this->load->model('module/related_options');
      
      $quantity = $this->model_module_related_options->get_ro_free_quantity($this->request->get['roids']);
      
      echo $quantity;
      exit;
      
    }
    
    
    
  }
  
  
}
?>