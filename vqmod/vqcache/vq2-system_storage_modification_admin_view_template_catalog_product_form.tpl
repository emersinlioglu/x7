<?php echo $header; ?><?php echo $column_left; ?>

      <!-- Product Option Image PRO module << -->
      <?php
        if ($poip_installed) {
          $poip_script = "";
        }
      ?>
      <!-- >> Product Option Image PRO module -->
<div id="content">

      <!-- Product Option Image PRO module << -->
      <?php if ( $poip_installed && $poip_global_settings['options_images_edit'] == 1 ) { //new ?>
        
				<script type="text/javascript"><!--
					
					var product_options = <?php echo (isset($product_options) && $product_options) ? json_encode($product_options) : 'false' ; ?>;
					var option_values = <?php echo (isset($option_values) && $option_values) ? json_encode($option_values) : 'false' ; ?>;
					
					function poip_get_product_option_value_name(option_id, option_value_id) {
						
						for (var i in option_values[option_id]) {
							
							if (option_values[option_id][i]['option_value_id'] == option_value_id) {
								return option_values[option_id][i]['name'];
							}
							
						}
						
					}
					
					function poip_show_image_options(row, data) {
					
						if ( !$('#image-row'+row).length ) return;
						
						if ( !$('#image-row'+row+' td[data-poip-options]').length ) {
							
							$('#image-row'+row+' td:first').after('<td class="text-right" data-poip-options style="vertical-align: top;"></td>');
							
						}
						
						var html = '';
						
						
						for (var i in product_options) {
							if ( !product_options.hasOwnProperty(i) ) continue;
							
							var product_option = product_options[i];
							
							if ( $.inArray(product_option['type'], ['select', 'radio', 'image', 'checkbox', 'color', 'block']) != -1) {
								
								html+= '<div class="col-sm-2 text-left">';
								html+= '<b>'+product_option['name']+'</b><br>';
								
								for (var j in product_option['product_option_value']) {
									if ( !product_option['product_option_value'].hasOwnProperty(j) ) continue;
								
									var product_option_value = product_option['product_option_value'][j];
									
									html+= '<div class="checkbox" style="min-height: 20px;padding-top:1px;white-space:nowrap;">';
									html+= '<label>';
									html+= '<input type="checkbox" name="product_image['+row+'][poip]['+product_option['option_id']+'][]" value="'+product_option_value['option_value_id']+'"';
									if (data && data['poip'] && data['poip'][product_option['option_id']]) {
										if ( $.inArray(product_option_value['option_value_id'], data['poip'][product_option['option_id']]) != -1 ) {
											html+= ' checked ';
										}
									}
									html+= '>&nbsp;'+poip_get_product_option_value_name(product_option['option_id'], product_option_value['option_value_id']);
									html+= '</label>';
									html+= '</div>';
									
									html+= '';
									html+= '';
								}
								html+= '</div>';
							}
						}
						
						
						$('#image-row'+row+' td[data-poip-options]').html(html);
						
					
					}
					
				
				//--></script>
					
			<?php } ?>
      <!-- >> Product Option Image PRO module -->
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
            <li><a href="#tab-links" data-toggle="tab"><?php echo $tab_links; ?></a></li>
            <li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <li><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
            <li><a href="#tab-recurring" data-toggle="tab"><?php echo $tab_recurring; ?></a></li>
            <li><a href="#tab-discount" data-toggle="tab"><?php echo $tab_discount; ?></a></li>
            <li><a href="#tab-special" data-toggle="tab"><?php echo $tab_special; ?></a></li>
            <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
            <li><a href="#tab-reward" data-toggle="tab"><?php echo $tab_reward; ?></a></li>
            <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>

        <!-- Related Options PRO / Связанные опции PRO << -->
				<?php if ($ro_installed) { ?>
				<li><a href="#tab-related_options" data-toggle="tab"><?php echo $related_options_title; ?></a></li>
				<?php } ?>
        <!-- >> Related Options PRO / Связанные опции PRO -->
      
      
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="product_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                    <div class="col-sm-10">
                      <textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-tag<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_tag; ?>"><?php echo $entry_tag; ?></span></label>
                    <div class="col-sm-10">
                      <input type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" placeholder="<?php echo $entry_tag; ?>" id="input-tag<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="tab-pane" id="tab-data">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                <div class="col-sm-10">
                  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                  <?php if ($error_model) { ?>
                  <div class="text-danger"><?php echo $error_model; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sku"><span data-toggle="tooltip" title="<?php echo $help_sku; ?>"><?php echo $entry_sku; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="sku" value="<?php echo $sku; ?>" placeholder="<?php echo $entry_sku; ?>" id="input-sku" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-upc"><span data-toggle="tooltip" title="<?php echo $help_upc; ?>"><?php echo $entry_upc; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="upc" value="<?php echo $upc; ?>" placeholder="<?php echo $entry_upc; ?>" id="input-upc" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ean"><span data-toggle="tooltip" title="<?php echo $help_ean; ?>"><?php echo $entry_ean; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="ean" value="<?php echo $ean; ?>" placeholder="<?php echo $entry_ean; ?>" id="input-ean" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-jan"><span data-toggle="tooltip" title="<?php echo $help_jan; ?>"><?php echo $entry_jan; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="jan" value="<?php echo $jan; ?>" placeholder="<?php echo $entry_jan; ?>" id="input-jan" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-isbn"><span data-toggle="tooltip" title="<?php echo $help_isbn; ?>"><?php echo $entry_isbn; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="isbn" value="<?php echo $isbn; ?>" placeholder="<?php echo $entry_isbn; ?>" id="input-isbn" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mpn"><span data-toggle="tooltip" title="<?php echo $help_mpn; ?>"><?php echo $entry_mpn; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="mpn" value="<?php echo $mpn; ?>" placeholder="<?php echo $entry_mpn; ?>" id="input-mpn" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-location"><?php echo $entry_location; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="location" value="<?php echo $location; ?>" placeholder="<?php echo $entry_location; ?>" id="input-location" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
                <div class="col-sm-10">
                  <select name="tax_class_id" id="input-tax-class" class="form-control">
                    <option value="0"><?php echo $text_none; ?></option>
                    <?php foreach ($tax_classes as $tax_class) { ?>
                    <?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-minimum"><span data-toggle="tooltip" title="<?php echo $help_minimum; ?>"><?php echo $entry_minimum; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="minimum" value="<?php echo $minimum; ?>" placeholder="<?php echo $entry_minimum; ?>" id="input-minimum" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-subtract"><?php echo $entry_subtract; ?></label>
                <div class="col-sm-10">
                  <select name="subtract" id="input-subtract" class="form-control">
                    <?php if ($subtract) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-stock-status"><span data-toggle="tooltip" title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
                <div class="col-sm-10">
                  <select name="stock_status_id" id="input-stock-status" class="form-control">
                    <?php foreach ($stock_statuses as $stock_status) { ?>
                    <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_shipping; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($shipping) { ?>
                    <input type="radio" name="shipping" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="shipping" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$shipping) { ?>
                    <input type="radio" name="shipping" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="shipping" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                  <?php if ($error_keyword) { ?>
                  <div class="text-danger"><?php echo $error_keyword; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-date-available"><?php echo $entry_date_available; ?></label>
                <div class="col-sm-3">
                  <div class="input-group date">
                    <input type="text" name="date_available" value="<?php echo $date_available; ?>" placeholder="<?php echo $entry_date_available; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length"><?php echo $entry_dimension; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-4">
                      <input type="text" name="length" value="<?php echo $length; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
                <div class="col-sm-10">
                  <select name="length_class_id" id="input-length-class" class="form-control">
                    <?php foreach ($length_classes as $length_class) { ?>
                    <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight"><?php echo $entry_weight; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="weight" value="<?php echo $weight; ?>" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
                <div class="col-sm-10">
                  <select name="weight_class_id" id="input-weight-class" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                    <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-links">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="<?php echo $help_manufacturer; ?>"><?php echo $entry_manufacturer; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer" value="<?php echo $manufacturer ?>" placeholder="<?php echo $entry_manufacturer; ?>" id="input-manufacturer" class="form-control" />
                  <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
                  <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_categories as $product_category) { ?>
                    <div id="product-category<?php echo $product_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_category['name']; ?>
                      <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="<?php echo $help_filter; ?>"><?php echo $entry_filter; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
                  <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_filters as $product_filter) { ?>
                    <div id="product-filter<?php echo $product_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_filter['name']; ?>
                      <input type="hidden" name="product_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <?php if (in_array(0, $product_store)) { ?>
                        <input type="checkbox" name="product_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="product_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $product_store)) { ?>
                        <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-download"><span data-toggle="tooltip" title="<?php echo $help_download; ?>"><?php echo $entry_download; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="download" value="" placeholder="<?php echo $entry_download; ?>" id="input-download" class="form-control" />
                  <div id="product-download" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_downloads as $product_download) { ?>
                    <div id="product-download<?php echo $product_download['download_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_download['name']; ?>
                      <input type="hidden" name="product_download[]" value="<?php echo $product_download['download_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $help_related; ?>"><?php echo $entry_related; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="related" value="" placeholder="<?php echo $entry_related; ?>" id="input-related" class="form-control" />
                  <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_relateds as $product_related) { ?>
                    <div id="product-related<?php echo $product_related['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_related['name']; ?>
                      <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-attribute">
              <div class="table-responsive">
                <table id="attribute" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_attribute; ?></td>
                      <td class="text-left"><?php echo $entry_text; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $attribute_row = 0; ?>
                    <?php foreach ($product_attributes as $product_attribute) { ?>
                    <tr id="attribute-row<?php echo $attribute_row; ?>">
                      <td class="text-left" style="width: 40%;"><input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" placeholder="<?php echo $entry_attribute; ?>" class="form-control" />
                        <input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" /></td>
                      <td class="text-left"><?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                          <textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
                        </div>
                        <?php } ?></td>
                      <td class="text-left"><button type="button" onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $attribute_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addAttribute();" data-toggle="tooltip" title="<?php echo $button_attribute_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-option">
              <div class="row">
                <div class="col-sm-2">
                  <ul class="nav nav-pills nav-stacked" id="option">
                    <?php $option_row = 0; ?>
                    <?php foreach ($product_options as $product_option) { ?>
                    <li><a href="#tab-option<?php echo $option_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-option<?php echo $option_row; ?>\']').parent().remove(); $('#tab-option<?php echo $option_row; ?>').remove(); $('#option a:first').tab('show');"></i> <?php echo $product_option['name']; ?></a></li>
                    <?php $option_row++; ?>
                    <?php } ?>
                    <li>
                      <input type="text" name="option" value="" placeholder="<?php echo $entry_option; ?>" id="input-option" class="form-control" />
                    </li>
                  </ul>
                </div>
                <div class="col-sm-10">
                  <div class="tab-content">
                    <?php $option_row = 0; ?>
                    <?php $option_value_row = 0; ?>
                    <?php foreach ($product_options as $product_option) { ?>
                    <div class="tab-pane" id="tab-option<?php echo $option_row; ?>">
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
                      <input type="hidden" name="product_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
                      <div class="form-group">
                        <?php
      // Product Option Image PRO module <<
      if ($poip_installed) {
        $poip_html  = "<div poip_settings style=\"display: none; \">";
        $poip_html .= "<label class=\"col-sm-2 control-label\">".$poip_module_name."</label>";
				$poip_html .= "<div class=\"col-sm-10\">";
        //$poip_html .= "<a id=\"poip_settings_on\" onclick=\"poip_settings_toggle(this);\">".$entry_show_settings."</a>";
        //$poip_html .= "<a id=\"poip_settings_off\" onclick=\"poip_settings_toggle(this);\" style=\"display: none;\">".$entry_hide_settings."</a>";
        //$poip_html .= "<table id=\"poip_settings_values\" style=\"display: none;\">";
        foreach ($poip_settings_names as $poip_setting_name) {
          $poip_html .= "<div class=\"col-sm-4\" style=\"padding-left:0px;\">";
          $poip_entry_name = "entry_".$poip_setting_name;
          $poip_html .= "".$$poip_entry_name.":";
          $poip_html .= "";
          $poip_html .= "<select ".$poip_setting_name." class=\"form-control\">";
          // new
          if (in_array('entry_'.$poip_setting_name."_v0", $poip_settings_values)) {
            $poip_html .= "<option value=\"0\">".$poip_settings_select_options[0]."</option>";
            for ($i=1; $i<9; $i++) {
              if (in_array('entry_'.$poip_setting_name."_v".$i, $poip_settings_values)) {
                $poip_html .= "<option value=\"".(1+$i)."\">".${("entry_".$poip_setting_name."_v".$i)}."</option>";
              }
            }
            $poip_html .= "<option value=\"".(1)."\">".${("entry_".$poip_setting_name."_v0")}."</option>";
          } else {
            foreach ($poip_settings_select_options as $select_value => $select_name) {
              $poip_html .= "<option value=\"".$select_value."\">".$select_name."</option>";
            }
          }
          $poip_html .= "</select>";
          $poip_html .= "</div>";
        }
				$poip_html .= "</div>";
        $poip_html .= "</div>";
        $poip_html .= "</div><div class=\"form-group\">";
        echo $poip_html;
      }
      // >> Product Option Image PRO module
      ?><label class="col-sm-2 control-label" for="input-required<?php echo $option_row; ?>"><?php echo $entry_required; ?></label>
                        <div class="col-sm-10">
                          <select name="product_option[<?php echo $option_row; ?>][required]" id="input-required<?php echo $option_row; ?>" class="form-control">
                            <?php if ($product_option['required']) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <?php if ($product_option['type'] == 'text') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" />
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'textarea') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <textarea name="product_option[<?php echo $option_row; ?>][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control"><?php echo $product_option['value']; ?></textarea>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'file') { ?>
                      <div class="form-group" style="display: none;">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" />
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'date') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-3">
                          <div class="input-group date">
                            <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span></div>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'time') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group time">
                            <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'datetime') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group datetime">
                            <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
                      <div class="table-responsive">
                        <table id="option-value<?php echo $option_row; ?>" class="table table-striped table-bordered table-hover">
                          <thead>
                            <tr>
                              <td class="text-left"><?php echo $entry_option_value; ?></td>
                              <td class="text-right"><?php echo $entry_quantity; ?></td>
                              <td class="text-left"><?php echo $entry_subtract; ?></td>
                              <td class="text-right"><?php echo $entry_price; ?></td>
                              <td class="text-right"><?php echo $entry_option_points; ?></td>
                              <td class="text-right"><?php echo $entry_weight; ?></td><!-- Product Option Image PRO module << // new --><?php if ($poip_installed && !$poip_global_settings['options_images_edit'] ) { ?><td class="text-left" style="width:240px;"><?php echo $entry_image; ?></td><?php } ?><!-- >> Product Option Image PRO module -->
                              <td></td>
                            </tr>
                          </thead>
                          <tbody>
                            <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
                            <tr id="option-value-row<?php echo $option_value_row; ?>">
                              <td class="text-left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]" class="form-control">
                                  <?php if (isset($option_values[$product_option['option_id']])) { ?>
                                  <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                                  <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                                  <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
                                  <?php } else { ?>
                                  <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                                  <?php } ?>
                                  <?php } ?>
                                  <?php } ?>
                                </select>
                                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" /></td>
                              <td class="text-right"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                              <td class="text-left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" class="form-control">
                                  <?php if ($product_option_value['subtract']) { ?>
                                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                  <option value="0"><?php echo $text_no; ?></option>
                                  <?php } else { ?>
                                  <option value="1"><?php echo $text_yes; ?></option>
                                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                  <?php } ?>
                                </select></td>
                              <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" class="form-control">
                                  <?php if ($product_option_value['price_prefix'] == '+') { ?>
                                  <option value="+" selected="selected">+</option>
                                  <?php } else { ?>
                                  <option value="+">+</option>
                                  <?php } ?>

			<?php // << Live Price
			
			if ( isset($liveprice_installed) && $liveprice_installed ) {
				echo '<option value="%" '.(($product_option_value['price_prefix']=='%')?('selected'):('')).'>%</option>';
				echo '<option value="*" '.(($product_option_value['price_prefix']=='*')?('selected'):('')).'>*</option>';
				echo '<option value="/" '.(($product_option_value['price_prefix']=='/')?('selected'):('')).'>/</option>';
				echo '<option value="=" '.(($product_option_value['price_prefix']=='=')?('selected'):('')).'>=</option>';
			}
			
			// >> Live Price ?>
			
                                  <?php if ($product_option_value['price_prefix'] == '-') { ?>
                                  <option value="-" selected="selected">-</option>
                                  <?php } else { ?>
                                  <option value="-">-</option>
                                  <?php } ?>
                                </select>
                                <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                              <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]" class="form-control">
                                  <?php if ($product_option_value['points_prefix'] == '+') { ?>
                                  <option value="+" selected="selected">+</option>
                                  <?php } else { ?>
                                  <option value="+">+</option>
                                  <?php } ?>
                                  <?php if ($product_option_value['points_prefix'] == '-') { ?>
                                  <option value="-" selected="selected">-</option>
                                  <?php } else { ?>
                                  <option value="-">-</option>
                                  <?php } ?>
                                </select>
                                <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>
                              <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]" class="form-control">
                                  <?php if ($product_option_value['weight_prefix'] == '+') { ?>
                                  <option value="+" selected="selected">+</option>
                                  <?php } else { ?>
                                  <option value="+">+</option>
                                  <?php } ?>
                                  <?php if ($product_option_value['weight_prefix'] == '-') { ?>
                                  <option value="-" selected="selected">-</option>
                                  <?php } else { ?>
                                  <option value="-">-</option>
                                  <?php } ?>
                                </select>
                                <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>

      <!-- Product Option Image PRO module << -->
      <?php
        if ($poip_installed && !$poip_global_settings['options_images_edit'] ) {
          if (isset($product_option_value['images']) && is_array($product_option_value['images'])) {
            foreach ($product_option_value['images'] as $image) {
              $poip_script .= "add_option_image(".$option_row.", $option_value_row, '".$image['thumb']."', '".$image['image']."', ".(int)$image['srt'].");\n";
            }
          }
      ?>
      <td >
				<!-- <div style="margin: 6px; margin-bottom: 11px;">-->
					<button type="button" class="btn btn-default" onclick="add_option_image(<?php echo $option_row; ?>, <?php echo $option_value_row; ?>);" title="<?php echo $button_image_add; ?>">
						<i class="fa fa-plus-circle"></i>
					</button>
					<!-- </div> -->
				</a>
				<div id="option_images<?php echo $option_row; ?>_<?php echo $option_value_row; ?>"></div>
			</td>
      <?php
        }
      ?>
      <!-- >> Product Option Image PRO module -->
      
                              <td class="text-left"><button type="button" onclick="$(this).tooltip('destroy');$('#option-value-row<?php echo $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                            </tr>
                            <?php $option_value_row++; ?>
                            <?php } ?>
                          </tbody>
                          <tfoot>
                            <tr>
                              <td colspan="6"></td>
                              <!-- Product Option Image PRO module << // new --><?php if ($poip_installed && !$poip_global_settings['options_images_edit'] ) { ?><td></td><?php } ?><!-- >> Product Option Image PRO module --><td class="text-left"><button type="button" onclick="addOptionValue('<?php echo $option_row; ?>');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                            </tr>
                          </tfoot>
                        </table>
                      </div>
                      <select id="option-values<?php echo $option_row; ?>" style="display: none;">
                        <?php if (isset($option_values[$product_option['option_id']])) { ?>
                        <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                        <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                      <?php } ?>
                    </div>
                    <?php $option_row++; ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-recurring">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_recurring; ?></td>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-left"></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $recurring_row = 0; ?>
                    <?php foreach ($product_recurrings as $product_recurring) { ?>

                    <tr id="recurring-row<?php echo $recurring_row; ?>">
                      <td class="text-left"><select name="product_recurring[<?php echo $recurring_row; ?>][recurring_id]" class="form-control">
                          <?php foreach ($recurrings as $recurring) { ?>
                          <?php if ($recurring['recurring_id'] == $product_recurring['recurring_id']) { ?>
                          <option value="<?php echo $recurring['recurring_id']; ?>" selected="selected"><?php echo $recurring['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-left"><select name="product_recurring[<?php echo $recurring_row; ?>][customer_group_id]" class="form-control">
                          <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $product_recurring['customer_group_id']) { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-left"><button type="button" onclick="$('#recurring-row<?php echo $recurring_row; ?>').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $recurring_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addRecurring()" data-toggle="tooltip" title="<?php echo $button_recurring_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>

        <!-- Related Options PRO / Связанные опции PRO << -->
				<?php if ($ro_installed) { ?>
					<div class="tab-pane" id="tab-related_options">
						
						
						<ul class="nav nav-tabs" id="ro_nav_tabs">
							<li>
								<button type="button" id='ro_add_tab_button' onclick="ro_add_tab();" data-toggle="tooltip" class="btn"><i class="fa fa-plus-circle"></i></button>
							</li>
						</ul>
			
						<div class="tab-content" id="ro_content">
						
							<input type="hidden" name="ro_data_included" value="1">
							
						</div>
						
						<span class="help-block" style="margin-top: 30px;">
							<?php echo $entry_ro_version.": ".$ro_version; ?> | <?php echo $text_ro_support; ?> | <?php echo $text_extension_page; ?>
						</span>
				
					</div>
			
				<?php } ?>

        <!-- >> Related Options PRO / Связанные опции PRO -->
      
      
            <div class="tab-pane" id="tab-discount">
              <div class="table-responsive">
                <table id="discount" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-right"><?php echo $entry_quantity; ?></td>
                      <td class="text-right"><?php echo $entry_priority; ?></td>
                      <td class="text-right"><?php echo $entry_price; ?></td>
                      <td class="text-left"><?php echo $entry_date_start; ?></td>
                      <td class="text-left"><?php echo $entry_date_end; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $discount_row = 0; ?>
                    <?php foreach ($product_discounts as $product_discount) { ?>
                    <tr id="discount-row<?php echo $discount_row; ?>">
                      <td class="text-left"><select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]" class="form-control">
                          <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                      <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
                      <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left"><button type="button" onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $discount_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="6"></td>
                      <td class="text-left"><button type="button" onclick="addDiscount();" data-toggle="tooltip" title="<?php echo $button_discount_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-special">
              <div class="table-responsive">
                <table id="special" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-right"><?php echo $entry_priority; ?></td>
                      <td class="text-right"><?php echo $entry_price; ?></td>
                      <td class="text-left"><?php echo $entry_date_start; ?></td>
                      <td class="text-left"><?php echo $entry_date_end; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $special_row = 0; ?>
                    <?php foreach ($product_specials as $product_special) { ?>
                    <tr id="special-row<?php echo $special_row; ?>">
                      <td class="text-left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">
                          <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
                      <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left"><button type="button" onclick="$('#special-row<?php echo $special_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $special_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="5"></td>
                      <td class="text-left"><button type="button" onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_special_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-image">
              <div class="table-responsive">
                <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_image; ?></td>

      <!-- Product Option Image PRO module << -->
      <?php if ( $poip_installed && $poip_global_settings['options_images_edit'] == 1 ) { //new ?>
        
					<td class="text-left"><?php echo $entry_option; ?></td>  
					
			<?php } ?>
      <!-- >> Product Option Image PRO module -->
                      <td class="text-right"><?php echo $entry_sort_order; ?></td>

                    <!-- Product Rotator -->
                    <td class="text-center"><?php echo $entry_is_rotator; ?></td>
                
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $image_row = 0; ?>
                    <?php foreach ($product_images as $product_image) { ?>
                    <tr id="image-row<?php echo $image_row; ?>">
                      <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                      <td class="text-right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>

                    <!-- Product Rotator -->
                    <td class="text-center">
                    <select name="product_image[<?php echo $image_row; ?>][is_rotator]" class="form-control rotator-select">
                      <?php if(isset($product_image['is_rotator']) && (int) $product_image['is_rotator'] == 1): ?>
                        <option value="1" selected="selected">Yes</option>
                        <option value="0">No</option>
                      <?php else: ?>
                        <option value="1">Yes</option>
                        <option value="0" selected="selected">No</option>
                      <?php endif; ?>
                    </select>
                    </td>
                    <!-- End -->
                
                      <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>

      <!-- Product Option Image PRO module << -->
      <?php if ( $poip_installed && $poip_global_settings['options_images_edit'] == 1 ) { //new ?>
        
				<script type="text/javascript"><!--
					poip_show_image_options(<?php echo $image_row; ?>, <?php echo json_encode($product_image); ?>);
				//--></script>
					
			<?php } ?>
      <!-- >> Product Option Image PRO module -->
                    <?php $image_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>

      <!-- Product Option Image PRO module << -->
      <?php if ( $poip_installed && $poip_global_settings['options_images_edit'] == 1 ) { //new ?>
        
					<td class="text-left"></td>
					
			<?php } ?>
      <!-- >> Product Option Image PRO module -->
                      <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-reward">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip" title="<?php echo $help_points; ?>"><?php echo $entry_points; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="points" value="<?php echo $points; ?>" placeholder="<?php echo $entry_points; ?>" id="input-points" class="form-control" />
                </div>
              </div>
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-right"><?php echo $entry_reward; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <tr>
                      <td class="text-left"><?php echo $customer_group['name']; ?></td>
                      <td class="text-right"><input type="text" name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" class="form-control" /></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tab-design">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_store; ?></td>
                      <td class="text-left"><?php echo $entry_layout; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left"><?php echo $text_default; ?></td>
                      <td class="text-left"><select name="product_layout[0]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php foreach ($stores as $store) { ?>
                    <tr>
                      <td class="text-left"><?php echo $store['name']; ?></td>
                      <td class="text-left"><select name="product_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
//--></script>
  <script type="text/javascript"><!--
// Manufacturer
$('input[name=\'manufacturer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					manufacturer_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['manufacturer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'manufacturer\']').val(item['label']);
		$('input[name=\'manufacturer_id\']').val(item['value']);
	}
});

// Category
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');

		$('#product-category' + item['value']).remove();

		$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Filter
$('input[name=\'filter\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['filter_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter\']').val('');

		$('#product-filter' + item['value']).remove();

		$('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-filter').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Downloads
$('input[name=\'download\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['download_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'download\']').val('');

		$('#product-download' + item['value']).remove();

		$('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-download').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Related
$('input[name=\'related\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'related\']').val('');

		$('#product-related' + item['value']).remove();

		$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
  <script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
    html  = '<tr id="attribute-row' + attribute_row + '">';
	html += '  <td class="text-left" style="width: 20%;"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
	html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
    <?php } ?>
	html += '  </td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr>';

	$('#attribute tbody').append(html);

	attributeautocomplete(attribute_row);

	attribute_row++;
}

function attributeautocomplete(attribute_row) {
	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							category: item.attribute_group,
							label: item.name,
							value: item.attribute_id
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
		}
	});
}

$('#attribute tbody tr').each(function(index, element) {
	attributeautocomplete(index);
});
//--></script>
  <script type="text/javascript"><!--
var option_row = <?php echo $option_row; ?>;

$('input[name=\'option\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						category: item['category'],
						label: item['name'],
						value: item['option_id'],
						type: item['type'],
						option_value: item['option_value']
					}
				}));
			}
		});
	},
	'select': function(item) {
		html  = '<div class="tab-pane" id="tab-option' + option_row + '">';
		html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
		html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';

		html += '	<div class="form-group">';
		html += '	  <?php
      // Product Option Image PRO module <<
      if ($poip_installed) {
        $poip_html  = "<div poip_settings style=\"display: none; \">";
        $poip_html .= "<label class=\"col-sm-2 control-label\">".$poip_module_name."</label>";
				$poip_html .= "<div class=\"col-sm-10\">";
        //$poip_html .= "<a id=\"poip_settings_on\" onclick=\"poip_settings_toggle(this);\">".$entry_show_settings."</a>";
        //$poip_html .= "<a id=\"poip_settings_off\" onclick=\"poip_settings_toggle(this);\" style=\"display: none;\">".$entry_hide_settings."</a>";
        //$poip_html .= "<table id=\"poip_settings_values\" style=\"display: none;\">";
        foreach ($poip_settings_names as $poip_setting_name) {
          $poip_html .= "<div class=\"col-sm-4\" style=\"padding-left:0px;\">";
          $poip_entry_name = "entry_".$poip_setting_name;
          $poip_html .= "".$$poip_entry_name.":";
          $poip_html .= "";
          $poip_html .= "<select ".$poip_setting_name." class=\"form-control\">";
          // new
          if (in_array('entry_'.$poip_setting_name."_v0", $poip_settings_values)) {
            $poip_html .= "<option value=\"0\">".$poip_settings_select_options[0]."</option>";
            for ($i=1; $i<9; $i++) {
              if (in_array('entry_'.$poip_setting_name."_v".$i, $poip_settings_values)) {
                $poip_html .= "<option value=\"".(1+$i)."\">".${("entry_".$poip_setting_name."_v".$i)}."</option>";
              }
            }
            $poip_html .= "<option value=\"".(1)."\">".${("entry_".$poip_setting_name."_v0")}."</option>";
          } else {
            foreach ($poip_settings_select_options as $select_value => $select_name) {
              $poip_html .= "<option value=\"".$select_value."\">".$select_name."</option>";
            }
          }
          $poip_html .= "</select>";
          $poip_html .= "</div>";
        }
				$poip_html .= "</div>";
        $poip_html .= "</div>";
        $poip_html .= "</div><div class=\"form-group\">";
        echo $poip_html;
      }
      // >> Product Option Image PRO module
      ?><label class="col-sm-2 control-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
		html += '	  <div class="col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
		html += '	      <option value="1"><?php echo $text_yes; ?></option>';
		html += '	      <option value="0"><?php echo $text_no; ?></option>';
		html += '	  </select></div>';
		html += '	</div>';

		if (item['type'] == 'text') {
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
			html += '	</div>';
		}

		if (item['type'] == 'textarea') {
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control"></textarea></div>';
			html += '	</div>';
		}

		if (item['type'] == 'file') {
			html += '	<div class="form-group" style="display: none;">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
			html += '	</div>';
		}

		if (item['type'] == 'date') {
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-3"><div class="input-group date"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
			html += '	</div>';
		}

		if (item['type'] == 'time') {
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-10"><div class="input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
			html += '	</div>';
		}

		if (item['type'] == 'datetime') {
			html += '	<div class="form-group">';
			html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
			html += '	  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
			html += '	</div>';
		}

		if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
			html += '<div class="table-responsive">';
			html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
			html += '  	 <thead>';
			html += '      <tr>';
			html += '        <td class="text-left"><?php echo $entry_option_value; ?></td>';
			html += '        <td class="text-right"><?php echo $entry_quantity; ?></td>';
			html += '        <td class="text-left"><?php echo $entry_subtract; ?></td>';
			html += '        <td class="text-right"><?php echo $entry_price; ?></td>';
			html += '        <td class="text-right"><?php echo $entry_option_points; ?></td>';
			html += '        <td class="text-right"><?php echo $entry_weight; ?></td><!-- Product Option Image PRO module << // new --><?php if ($poip_installed && !$poip_global_settings['options_images_edit'] ) { ?><td class="text-left" style="width:240px;"><?php echo $entry_image; ?></td><?php } ?><!-- >> Product Option Image PRO module -->';
			html += '        <td></td>';
			html += '      </tr>';
			html += '  	 </thead>';
			html += '  	 <tbody>';
			html += '    </tbody>';
			html += '    <tfoot>';
			html += '      <tr>';
			html += '        <td colspan="6"></td>';
			html += '        <!-- Product Option Image PRO module << // new --><?php if ($poip_installed && !$poip_global_settings['options_images_edit'] ) { ?><td></td><?php } ?><!-- >> Product Option Image PRO module --><td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
			html += '      </tr>';
			html += '    </tfoot>';
			html += '  </table>';
			html += '</div>';

            html += '  <select id="option-values' + option_row + '" style="display: none;">';

            for (i = 0; i < item['option_value'].length; i++) {
				html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
            }

            html += '  </select>';
			html += '</div>';
		}

		$('#tab-option .tab-content').append(html);

      // Product Option Image PRO module << // new
      <?php  if (isset($poip_installed) && $poip_installed ) {  ?>
        if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image' || item['type'] == 'block' || item['type'] == 'color') {
          poip_refresh_settings();
        }
      <?php } ?>
      // >> Product Option Image PRO module 
      

          // << Parent-child Options
          
          pcop_show_option_settings(option_row);
          
          // >> Parent-child Options
        

		$('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove(); $(\'#option a:first\').tab(\'show\')"></i> ' + item['label'] + '</li>');

		$('#option a[href=\'#tab-option' + option_row + '\']').tab('show');

		$('.date').datetimepicker({
			pickTime: false
		});

		$('.time').datetimepicker({
			pickDate: false
		});

		$('.datetime').datetimepicker({
			pickDate: true,
			pickTime: true
		});

		option_row++;
	}
});
//--></script>
  <script type="text/javascript"><!--
var option_value_row = <?php echo $option_value_row; ?>;

      // Product Option Image PRO module <<
      <?php
        if ($poip_installed) {
      ?>
      var option_image_row = 0;
      var poip_saved_settings = <?php echo json_encode($poip_saved_settings); ?>;
      
      function poip_settings_toggle(elem) {
        $(elem).toggle();
        $(elem).siblings('#poip_settings_values').toggle();
        $(elem).siblings('#poip_settings_on').toggle();
        $(elem).siblings('#poip_settings_off').toggle();
      }
      
      function poip_refresh_settings() {
        var poip_tabs = $('[id^=tab-option ]');
				var for_types = ['select','radio','checkbox','image','block','color'];
					
				for (var i=0;i<poip_tabs.length;i++) {
					if ($(poip_tabs[i]).find('input[type=hidden][name*=\\[type\\]]').length && $.inArray($(poip_tabs[i]).find('input[type=hidden][name*=\\[type\\]]').val(), for_types) != -1 ) {
						$(poip_tabs[i]).find('[poip_settings]').show();
					}
					var option_row = poip_tabs[i].id.substr(10);
					<?php  foreach ($poip_settings_names as $poip_setting_name) {  ?>
					$(poip_tabs[i]).find('[<?php echo $poip_setting_name; ?>]').attr('name', 'product_option['+option_row+'][poip_settings][<?php echo $poip_setting_name; ?>]');
					<?php  }  ?>
				}
				
				
      }
      
      function poip_fill_settings() {
        var poip_tabs = $('[id^=tab-option]');
        for (var i=0;i<poip_tabs.length;i++) {
          var option_row = poip_tabs[i].id.substr(10);
          if ($(poip_tabs[i]).find('[name=product_option\\['+option_row+'\\]\\[product_option_id\\]]').length) {
            var product_option_id = $(poip_tabs[i]).find('[name=product_option\\['+option_row+'\\]\\[product_option_id\\]]')[0].value;
            if (poip_saved_settings[product_option_id]) {
              <?php  foreach ($poip_settings_names as $poip_setting_name) {  ?>
                if (poip_saved_settings[product_option_id]['<?php echo $poip_setting_name; ?>']) {
                  $(poip_tabs[i]).find('[<?php echo $poip_setting_name; ?>]').val(poip_saved_settings[product_option_id]['<?php echo $poip_setting_name; ?>']);
                }
              <?php  }  ?>
            }
          }
        }
      }
      
      function add_option_image(option_row, option_value_row, thumb, image, srt) {

        
        html = '';
        
        html += '<div id="div_option_image'+option_image_row+'" style="float:left;">';
				//html += '<div class="image" style="margin: 2px; padding: 5px;  width:100px;" id="div_option_image'+option_image_row+'">';
        if (image && thumb) {
          var current_thumb = thumb;
          var current_image = image;
          var current_srt = srt;
        } else {
          var current_thumb = '<?php echo $placeholder; ?>';
          var current_image = '';
          var current_srt = 0;
          $('#option_images'+option_row+'_'+option_value_row).find('[name*=\\[srt\\]]').each(function() {
            current_srt = Math.max(current_srt, (parseInt(this.value)?parseInt(this.value):0));
          });
          current_srt++;
        }
				
				
				html += '<a href="" id="thumb-option-image'+option_image_row+'" data-toggle="image" class="img-thumbnail" >';
				html += '<img height="100" width="100" src="'+current_thumb+'" alt="" title="" data-placeholder="<?php echo $placeholder; ?>">';
				html += '</a>';
				html += '<input type="hidden" id="option_image'+option_image_row+'" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][images]['+option_image_row+'][image]" value="'+current_image+'">';
				html += '<div>';
				html += '<input  type="text" class="form-control" style="width:72px;float:left;" title="<?php echo $entry_sort_order; ?>" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][images]['+option_image_row+'][srt]" value="'+current_srt+'" size="3">';
				html += '<button class="btn btn-default" title="<?php echo $button_remove; ?>" onclick="$(\'#div_option_image' + option_image_row + '\').remove();"><i class="fa fa-trash-o"></i></button>';
				html += '</div>';
				
        html += '</div>';
        
        $('#option_images'+option_row+'_'+option_value_row).append(html);
        
        option_image_row++;
        
      }
      
      $(document).ready(function(){
        
        <?php
          echo $poip_script;
        ?>
        poip_fill_settings();
        poip_refresh_settings();
        
      });
      
      
      <?php
        }
      ?>
      // >> Product Option Image PRO module
      

function addOptionValue(option_row) {
	html  = '<tr id="option-value-row' + option_value_row + '">';
	html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
	html += $('#option-values' + option_row).html();
	html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="form-control">';
	html += '    <option value="1"><?php echo $text_yes; ?></option>';
	html += '    <option value="0"><?php echo $text_no; ?></option>';
	html += '  </select></td>';
	html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
	html += '    <option value="+">+</option>';
	html += '    <option value="-">-</option>';
	html += '  </select>';
	html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
	html += '    <option value="+">+</option>';
	html += '    <option value="-">-</option>';
	html += '  </select>';
	html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
	html += '    <option value="+">+</option>';
	html += '    <option value="-">-</option>';
	html += '  </select>';
	html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>';

      // Product Option Image PRO module <<
      <?php if ($poip_installed && !$poip_global_settings['options_images_edit'] ) { ?>
      html += '<td><button type="button" class="btn btn-default" onclick="add_option_image('+option_row+', '+option_value_row+');"><i class="fa fa-plus-circle"></i></button><div id="option_images'+option_row+'_'+option_value_row+'"></div></td>';
      <?php } ?>
      // >> Product Option Image PRO module
      
	html += '  <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#option-value' + option_row + ' tbody').append(html);

			// << Live Price
			<?php
				if ( isset($liveprice_installed) && $liveprice_installed ) {
			?>
					var ppm_option = $('#option-value-row'+option_value_row).find('select[name*=price_prefix]').find('option[value="-"]');
					ppm_option.before('<option value="%">%</option>');
					ppm_option.before('<option value="*">*</option>');
					ppm_option.before('<option value="/">/</option>');
					ppm_option.before('<option value="=">=</option>');
			<?php
				}
			?>
			
			// >> Live Price
			
        $('[rel=tooltip]').tooltip();

	option_value_row++;
}
//--></script>
  <script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
	html  = '<tr id="discount-row' + discount_row + '">';
    html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
    html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#discount tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});

	discount_row++;
}
//--></script>
  <script type="text/javascript"><!--
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
	html  = '<tr id="special-row' + special_row + '">';
    html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';
    html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
    html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#special tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});

	special_row++;
}
//--></script>
  <script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;


                    //Product Rotator
                    $('#tab-image tfoot td:first').attr('colspan', 3);
                    
                    $('.rotator-select').change(function() {
                      var value = $(this).val();
                      if(value == 1) {
                        $('.rotator-select').val(0);
                        $(this).val(1);
                      }
                    });
                    //End
                
function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';

                    //Product Rotator
                    html += ' <td class="text-center">';
                    html += '   <select name="product_image[' + image_row + '][is_rotator]" class="form-control rotator-select">';
                    html += '     <option value="1">Yes</option>';
                    html += '     <option value="0" selected="selected">No</option>';
                    html += '   </select>';
                    html += ' </td>';
                    //End
                
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#images tbody').append(html);

      <!-- Product Option Image PRO module << -->
      <?php if ( $poip_installed && $poip_global_settings['options_images_edit'] == 1 ) { //new ?>
				poip_show_image_options(image_row);
			<?php } ?>
      <!-- >> Product Option Image PRO module -->

                    //Product Rotator
                    $('.rotator-select').change(function() {
                    var value = $(this).val();
                    if(value == 1) {
                      $('.rotator-select').val(0);
                      $(this).val(1);
                    }
                    });
                    //End
                

	image_row++;
}
//--></script>
  <script type="text/javascript"><!--
var recurring_row = <?php echo $recurring_row; ?>;

function addRecurring() {
	recurring_row++;

	html  = '';
	html += '<tr id="recurring-row' + recurring_row + '">';
	html += '  <td class="left">';
	html += '    <select name="product_recurring[' + recurring_row + '][recurring_id]" class="form-control">>';
	<?php foreach ($recurrings as $recurring) { ?>
	html += '      <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>';
	<?php } ?>
	html += '    </select>';
	html += '  </td>';
	html += '  <td class="left">';
	html += '    <select name="product_recurring[' + recurring_row + '][customer_group_id]" class="form-control">>';
	<?php foreach ($customer_groups as $customer_group) { ?>
	html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
	<?php } ?>
	html += '    <select>';
	html += '  </td>';
	html += '  <td class="left">';
	html += '    <a onclick="$(\'#recurring-row' + recurring_row + '\').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>';
	html += '  </td>';
	html += '</tr>';

	$('#tab-recurring table tbody').append(html);
}
//--></script>
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script></div>

        
        <!-- << Parent-child Options -->
        
        <script type="text/javascript"><!--
        
          var pcop_parent_option_cnt = 0;
          var pcop_product_options = <?php echo isset($pcop_product_options) ? json_encode($pcop_product_options) : 'false'; ?>;
          
          /*
          $(document).ready(function(){
            setTimeout(function(){
              pcop_show_all_settings();
            },500);
          });
          */
          
          // refresh list of values for parent option
          // pcop_parent_option_cnt - number of parent option block
          // settings - values that should be selected
          // set_parent_option_id - set parent option id to this value
          function pcop_show_parent_option_values(pcop_parent_option_cnt, settings, set_parent_option_id) {
          
            var parent_option_select = $('#parent_option_'+pcop_parent_option_cnt);
            if (set_parent_option_id) {
              parent_option_select.val(set_parent_option_id);
            }
            
            var parent_option_id = parent_option_select.val();
            var block_number = pcop_get_product_option_block_number_from_name($('#parent_option_'+pcop_parent_option_cnt).attr('name'));
            var html = '';
            
            var current_values = [];
            if (settings) {
              current_values = settings;
            } else {
              $('#parent_option_values_'+pcop_parent_option_cnt).find('input[type=checkbox]:checked').each(function(){
                current_values.push($(this).val());
              });
            }
            
            if (parent_option_id) {
              for (var i in pcop_product_options) {
                if ( !pcop_product_options.hasOwnProperty(i) ) continue;
                
                if (pcop_product_options[i]['option_id'] == parent_option_id && pcop_product_options[i]['product_option_value']) {
                  for (var j in pcop_product_options[i]['product_option_value']) {
                    if ( !pcop_product_options[i]['product_option_value'].hasOwnProperty(j) ) continue;
                  
                    var pcop_pov = pcop_product_options[i]['product_option_value'][j];
                    html += '<div class="checkbox"><label>';
                    html += '<input type="checkbox" name="product_option['+block_number+'][pcop]['+pcop_parent_option_cnt+'][values][]" ';
                    if ( $.inArray(pcop_pov['option_value_id'], current_values) != -1 ) {
                      html += ' checked ';
                    }
                    html += ' value="'+pcop_pov['option_value_id']+'">';
                    html += pcop_pov['name'];
                    html += '</label></div>';
                  }
                }
              }
            }
            
            $('#parent_option_values_'+pcop_parent_option_cnt).html(html);
            
          }
        
          // add one more parent option rule
          function pcop_add_parent_option(product_option_block_num, settings) {
          
            var pcop_table = $('#pcop_parent_options_'+product_option_block_num);
            //var block_number = pcop_get_product_option_block_number_by_product_option_id(product_option_id);
            
            var html = '';
            html += '<tr>';
            html += '<td>';
            html += '<div class="col-sm-4">';
            html += '<input type="hidden" name="product_option['+product_option_block_num+'][pcop]['+pcop_parent_option_cnt+'][pcop_id]" value="'+(settings ? settings['pcop_id'] : '')+'">';
            html += '<select name="product_option['+product_option_block_num+'][pcop]['+pcop_parent_option_cnt+'][parent_option_id]" id="parent_option_'+pcop_parent_option_cnt+'" class="form-control" onchange="pcop_show_parent_option_values('+pcop_parent_option_cnt+')">';
            html += '<option value="">-</option>';
            
            if (pcop_product_options) {
              for (var i in pcop_product_options) {
                if ( !pcop_product_options.hasOwnProperty(i) ) continue;
                
                if ($.inArray(pcop_product_options[i]['type'], ['select','radio','image','checkbox','block','color']) != -1) {
                  html += '<option value="'+pcop_product_options[i]['option_id']+'"';
                  html += ' '+( (settings && pcop_product_options[i]['option_id']==settings['parent_option_id']) ? 'selected' : '' )+' ';
                  html += '>'+pcop_product_options[i]['name']+'</option>';
                }
              }
            }
            
            html += '</select>';
            html += '</div>';
            html += '<div class="col-sm-4">';
            html += '<div class="well well-sm" style="height: 150px; overflow: auto; margin-bottom:0px;" id="parent_option_values_'+pcop_parent_option_cnt+'">';
            html += '';
            html += '';
            html += '</div>';
            html += '</div>';
            html += '</td>';
            
            html += '<td>';
            html += '<button type="button" onclick="$(this).closest(\'tr\').remove();check_text_no_parent_options('+product_option_block_num+');" data-toggle="tooltip" class="btn btn-danger"';
            html += 'title="<?php echo htmlspecialchars($pcop_entry_remove_parent_option, ENT_QUOTES); ?>"><i class="fa fa-minus-circle"></i></button>';
            html += '</td>';
            html += '</tr>';
            
            pcop_table.find('tbody').append(html);
            
            pcop_show_parent_option_values(pcop_parent_option_cnt, (settings ? settings['values'] : false), (settings ? settings['parent_option_id'] : false) );
            
            pcop_parent_option_cnt++;
            check_text_no_parent_options(product_option_block_num);
            
          }
          
          // show parent options settings for product option
          function pcop_show_option_settings(product_option_block_num, pcop_data) {
          
            var html = '';
            
            html += '<div class="form-group">';
            html += '<label class="col-sm-2 control-label"><?php echo addslashes($pcop_entry_settings); ?></label>';
            html += '<div class="col-sm-10">';
            html += '<table id="pcop_parent_options_'+product_option_block_num+'" class="table table-striped table-bordered table-hover">';
            html += '<tbody></tbody>';
            html += '<tfoot><td width="100%"><div id="text_no_parent_options_'+product_option_block_num+'"><?php echo htmlspecialchars($pcop_entry_no_parent_options, ENT_QUOTES); ?></font></td>';
            html += '<td>';
            html += '<button type="button" onclick="pcop_add_parent_option('+product_option_block_num+')" data-toggle="tooltip" class="btn btn-primary"';
            html += 'title="<?php echo htmlspecialchars($pcop_entry_add_parent_option, ENT_QUOTES); ?>"><i class="fa fa-plus-circle"></i></button>';
            html += '</td></tfoot>';
            html += '</div>';
            html += '</div>';
          
            // show after "required" block
            $('#tab-option'+product_option_block_num+' div.form-group:first').after(html);
            
            if (pcop_data) {
              for (var i in pcop_data) {
                if ( !pcop_data.hasOwnProperty(i) ) continue;
                pcop_add_parent_option(product_option_block_num, pcop_data[i]);
              }
            }
          
            //var required_elem_fm = $('#tab-option input[type="hidden"][name^="product_option["][name*="[product_option_id]"][value="'+product_option_id+'"]').parent().find('select[name*="[required]"]').closest('.form-group');
            //required_elem_fm.after(html);
          
          }
          
          // get product option block number from name product_option[X]...
          function pcop_get_product_option_block_number_from_name(name) {
            var str = name.substring(15);
            str = str.substring(0, str.indexOf(']'));
            return str;
          }
          
          // get product option block number by product option id
          function pcop_get_product_option_block_number_by_product_option_id(product_option_id) {
            var name = $('#tab-option input[type="hidden"][name^="product_option["][name*="[product_option_id]"][value="'+product_option_id+'"]').attr('name');
            return pcop_get_product_option_block_number_from_name( name );
          }
          
          
          // show text if there's no parent options, hide is there's some parent options
          function check_text_no_parent_options(product_option_block_num) {
            
            var has_parent_options = $('#pcop_parent_options_'+product_option_block_num+' tbody tr').length;
            $('#text_no_parent_options_'+product_option_block_num).toggle(!has_parent_options);
            
          }
          
          <?php for($i=0;$i<$option_row;$i++) {
            echo 'pcop_show_option_settings('.$i.', '.(isset($product_options[$i]['pcop'])? json_encode($product_options[$i]['pcop']) :'false').');';
          } ?>
        
          /*
          // show all options parents settings
          function pcop_show_all_settings() {
            
            $('#tab-option input[type="hidden"][name^="product_option["][name*="[product_option_id]"][value]').each(function(){
              
              pcop_show_option_settings($(this).val());
              
            });
            
          }
          */
          
          
        
        //--></script>
        
        <!-- << Parent-child Options -->
        
        

      
<!-- Related Options PRO / Связанные опции PRO << -->

<script type="text/javascript"><!--

var ro_counter = 0;
var ro_discount_counter = 0;
var ro_special_counter = 0;
var ro_variants = [];
//var ro_variants_options_order = [];
var ro_all_options = <?php echo json_encode($ro_all_options); ?>;
var ro_settings = <?php echo json_encode($ro_settings); ?>;
var ro_variants = <?php echo json_encode($variants_options); ?>;
var ro_data = <?php echo json_encode($ro_data); ?>;
//ro_variants_options_order[0] = [];



var ro_tabs_cnt = 0;

function ro_tab_name_change(ro_tabs_num) {
	
	if ( $('#ro-use-'+ro_tabs_num+'').is(':checked') ) {
		var new_tab_name = $('#rov-'+ro_tabs_num+' option[value="'+$('#rov-'+ro_tabs_num).val()+'"]').html();
	} else {
		var new_tab_name = '<?php echo addslashes($related_options_title); ?>';
	}
	
	$('#ro_nav_tabs a[data-ro-cnt="'+ro_tabs_num+'"]').html(new_tab_name);
	
}

function ro_add_tab(tab_data_param) {

	var tab_data = tab_data_param ? tab_data_param : false;
	
	html = '<li><a href="#tab-ro-'+ro_tabs_cnt+'" data-toggle="tab" data-ro-cnt="'+ro_tabs_cnt+'">ro '+ro_tabs_cnt+'</a></li>';
	//$('#ro_nav_tabs').append(html);
	$('#ro_add_tab_button').closest('li').before(html);
	
	html = '<div class="tab-pane" id="tab-ro-'+ro_tabs_cnt+'" data-ro-cnt="'+ro_tabs_cnt+'">'+ro_tabs_cnt+'</div>';
	$('#ro_content').append(html);
	
	$('#ro_nav_tabs [data-ro-cnt='+ro_tabs_cnt+']').click();
	
	html = '';
	html+= '<input type="hidden" name="ro_data['+ro_tabs_cnt+'][rovp_id]" value="'+(tab_data['rovp_id'] ? tab_data['rovp_id'] : '0')+'">';
	html+= '<div class="form-group">';
	
	html+= '<label class="col-sm-2 control-label"><?php echo addslashes($entry_ro_use); ?></label>';
	
	html+= '<div class="col-sm-10">';
	html+= '<label class="radio-inline">';
		html+= '<input type="radio" name="ro_data['+ro_tabs_cnt+'][use]" id="ro-use-'+ro_tabs_cnt+'" value="1" '+((tab_data['use'])?('checked'):(''))+' onchange="ro_use_check('+ro_tabs_cnt+')" />';
		html+= ' <?php echo $text_yes; ?>';
	html+= '</label>';
	html+= '<label class="radio-inline">';
		html+= '<input type="radio" name="ro_data['+ro_tabs_cnt+'][use]" value="" '+((tab_data['use'])?(''):('checked'))+' onchange="ro_use_check('+ro_tabs_cnt+')" />';
		html+= ' <?php echo $text_no; ?>';
	html+= '</label>';
	html+= '</div>';
	
	//html+= '<input type="checkbox" id="ro-use-'+ro_tabs_cnt+'" name="ro_data['+ro_tabs_cnt+'][use]" onchange="ro_use_check('+ro_tabs_cnt+')" value="1" '+((tab_data['use'])?('checked'):(''))+'>';
	
	//html+= '<label class="col-sm-2 control-label"><input type="checkbox" id="ro-use-'+ro_tabs_cnt+'" name="ro_data['+ro_tabs_cnt+'][use]" onchange="ro_use_check('+ro_tabs_cnt+')" value="1" '+((tab_data['use'])?('checked'):(''))+'>&nbsp;<?php echo addslashes($entry_ro_use); ?></label><br><br>';
	
	html+= '</div>';
	
	html+= '<div id="ro-use-data-'+ro_tabs_cnt+'">';
	html+= '	<div class="form-group">';
	html+= '		<label class="col-sm-2 control-label" for="rov-'+ro_tabs_cnt+'" ><?php echo $entry_ro_variant; ?></label>';
	html+= '		<div class="col-sm-3" >';
	html+= '			<select name="ro_data['+ro_tabs_cnt+'][rov_id]" id="rov-'+ro_tabs_cnt+'" class="form-control" onChange="ro_tab_name_change('+ro_tabs_cnt+');">';
	
	if (ro_settings['ro_use_variants']) {
		for (var i in ro_variants) {
			if (i == 0) {
				html+= '				<option value="0"><?php echo addslashes($text_ro_all_options); ?></option>';
			} else {
				var ro_variant = ro_variants[i];
				html+= '			<option value="'+ro_variant['rov_id']+'" '+(tab_data['rov_id'] && tab_data['rov_id'] == ro_variant['rov_id'] ? 'selected':'')+' >'+ro_variant['name']+'</option>';
			}
		}	
	} else {
		html+= '				<option value="0"><?php echo addslashes($text_ro_all_options); ?></option>';
	}
	
	html+= '			</select>';
	html+= '		</div>';
	html+= '		<button type="button" onclick="ro_fill_all_combinations('+ro_tabs_cnt+');" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="<?php echo addslashes($entry_add_all_variants); ?>"><?php echo addslashes($entry_add_all_variants); ?></button>';
	html+= '		<button type="button" onclick="ro_fill_all_combinations('+ro_tabs_cnt+',1);" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="<?php echo addslashes($entry_add_product_variants); ?>"><?php echo addslashes($entry_add_product_variants); ?></button>';
	html+= '	</div>';
	
	
	
	html+= '	<div class="table-responsive">';
	html+= '		<table class="table table-striped table-bordered table-hover">';
	html+= '			<thead>';
	html+= '				<tr>';
	html+= '					<td class="text-left"><?php echo addslashes($entry_options_values); ?></td>';
	html+= '					<td class="text-left" width="90"><?php echo addslashes($entry_related_options_quantity); ?>:</td>';
			
	var ro_fields = {spec_model: "<?php echo $entry_model; ?>"
									,spec_sku: "<?php echo $entry_sku; ?>"
									,spec_upc: "<?php echo $entry_upc; ?>"
									,spec_ean: "<?php echo $entry_ean; ?>"
									,spec_location: "<?php echo $entry_location; ?>"
									,spec_ofs: "<?php echo $entry_stock_status; ?>"
									,spec_weight: "<?php echo $entry_weight; ?>"
									};
								
	for (var i in ro_fields) {
		if (ro_settings[i] && ro_settings[i] != 0) {
			html+= '<td class="text-left" width="90">'+ro_fields[i]+'</td>';
		}
	}
			
	if (ro_settings['spec_price'] ) {
		html+= '				<td class="text-left" width="90" ><?php echo addslashes($entry_price); ?></td>';
		if (ro_settings['spec_price_discount'] ) {
			html+= '					<td class="text-left" style="90"><?php echo addslashes($tab_discount); ?>: <font style="font-weight:normal;font-size:80%;">(<?php echo addslashes(str_replace(":","",$entry_customer_group." | ".$entry_quantity." | ".$entry_price)); ?>)</font></td>';
		}
		if (ro_settings['spec_price_special'] ) {
			html+= '					<td class="text-left" style="90"><?php echo addslashes($tab_special); ?>: <font style="font-weight:normal;font-size:80%;">(<?php echo addslashes(str_replace(":","",$entry_customer_group." | ".$entry_price)); ?>)</font></td>';
		}
	}
				
	if (ro_settings['select_first'] && ro_settings['select_first'] == 1 ) {
		html+= '				<td class="text-left" width="90" style="white-space:nowrap"><?php echo addslashes($entry_select_first_short); ?>:</td>';
	}
	
					
	html+= '					<td class="text-left" width="90"></td>';
	
	html+= '				<tr>';			
	html+= '		</thead>';
	html+= '		<tbody id="tbody-ro-'+ro_tabs_cnt+'"></tbody>';
	html+= '	</table>';
	
	html+= '	<div class="col-sm-2" >';
	html+= '		<button type="button" onclick="ro_add_combination('+ro_tabs_cnt+', false);" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="<?php echo addslashes($entry_add_related_options); ?>"><?php echo addslashes($entry_add_related_options); ?></button>';
	html+= '	</div>';
			
	html+= '</div>';
	
	html+= '';
	html+= '';
	html+= '</div>';
	
	$('#tab-ro-'+ro_tabs_cnt+'').html(html);
	$('#ro-use-'+ro_tabs_cnt).prop('checked', true);
	ro_use_check(ro_tabs_cnt);
	
	if (tab_data['ro']) {
		for (var i in tab_data['ro']) {
			ro_add_combination(ro_tabs_cnt, tab_data['ro'][i]);
		}
	}
	
	// выбор добавленной закладки 
	$('#ro_nav_tabs a[data-ro-cnt="'+ro_tabs_cnt+'"]').click();
	
	ro_tabs_cnt++;
	
	return ro_tabs_cnt-1;
	
}

function ro_use_check(ro_tabs_num) {
	
	$('#ro-use-data-'+ro_tabs_num).toggle( $('input[type=radio][name="ro_data['+ro_tabs_num+'][use]"][value="1"]').is(':checked') );
	ro_tab_name_change(ro_tabs_num);
	
}

function ro_add_combination(ro_tabs_num, params) {

	var rov_id = $('#rov-'+ro_tabs_num).val();
	var ro_variant = ro_variants[ rov_id ];

	var entry_add_discount = "<?php echo addslashes($entry_add_discount); ?>";
	var entry_del_discount_title = "<?php echo addslashes($entry_del_discount_title); ?>";
	
	var entry_add_special = "<?php echo addslashes($entry_add_special); ?>";
	var entry_del_special_title = "<?php echo addslashes($entry_del_special_title); ?>";
	
	
	str_add = '';
	str_add += "<tr id=\"related-option"+ro_counter+"\"><td>";
	
	var div_id = "ro_status"+ro_counter;
	str_add +="<div id='"+div_id+"' style='color: red'></div>";
	
	for (var i in ro_variant['options']) {
		
		var ro_option = ro_variant['options'][i];
		var option_id = ro_option['option_id'];
	
		str_add += "<div style='float:left;'><label class='col-sm-1 control-label' for='ro_o_"+ro_counter+"_"+option_id+"'> ";
		str_add += "<nobr>"+ro_option['name']+":</nobr>";
		str_add += "</label>";
		str_add += "<select class='form-control' id='ro_o_"+ro_counter+"_"+option_id+"' name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][options]["+option_id+"]' onChange=\"ro_refresh_status("+ro_tabs_num+","+ro_counter+")\">";
		str_add += "<option value=0></option>";
					
			for (var j in ro_all_options[option_id]['values']) {
				if((ro_all_options[option_id]['values'][j] instanceof Function) ) { continue; }
				
				var option_value_id = ro_all_options[option_id]['values'][j]['option_value_id'];
				
				str_add += "<option value='"+option_value_id+"'";
				if (params['options'] && params['options'][option_id] && params['options'][option_id] == option_value_id) str_add +=" selected ";
				str_add += ">"+ro_all_options[option_id]['values'][j]['name']+"</option>";
			}

		str_add += "</select>";
		str_add += "</div>";
	}
	
  
  str_add += "</td>";
  str_add += "<td>&nbsp;";
	str_add += "<input type='text' class='form-control' name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][quantity]' size='2' value='"+(params['quantity']||0)+"'>";
  str_add += "<input type='hidden' name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][relatedoptions_id]' value='"+(params['relatedoptions_id']||"")+"'>";
  str_add += "</td>";
	
	str_add += ro_add_text_field(ro_tabs_num, ro_counter, 'spec_model', params, 'model');
	str_add += ro_add_text_field(ro_tabs_num, ro_counter, 'spec_sku', params, 'sku');
	str_add += ro_add_text_field(ro_tabs_num, ro_counter, 'spec_upc', params, 'upc');
	str_add += ro_add_text_field(ro_tabs_num, ro_counter, 'spec_ean', params, 'ean');
	str_add += ro_add_text_field(ro_tabs_num, ro_counter, 'spec_location', params, 'location');
	
	if (ro_settings['spec_ofs']) {
		
		str_add += '<td>';
		str_add += '&nbsp;<select name="ro_data['+ro_tabs_num+'][ro]['+ro_counter+'][stock_status_id]" class="form-control">';
		str_add += '<option value="0">-</option>';
		<?php foreach ($stock_statuses as $stock_status) { ?>
			str_add += '<option value="<?php echo $stock_status['stock_status_id']; ?>"';
			if ("<?php echo $stock_status['stock_status_id'] ?>" == params['stock_status_id']) {
				str_add += ' selected ';
			}
			str_add += '><?php echo addslashes($stock_status['name']); ?></option>';
		<?php } ?>
		str_add += '</select>';
		
		str_add += '</td>';
	
	}
	
	if (ro_settings['spec_weight'])	{
		str_add += "<td>&nbsp;";
		str_add += "<select class='form-control' name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][weight_prefix]'>";
		str_add += "<option value='=' "+( (params['weight_prefix'] && params['weight_prefix']=='=')? ("selected") : (""))+">=</option>";
		str_add += "<option value='+' "+( (params['weight_prefix'] && params['weight_prefix']=='+')? ("selected") : (""))+">+</option>";
		str_add += "<option value='-' "+( (params['weight_prefix'] && params['weight_prefix']=='-')? ("selected") : (""))+">-</option>";
		str_add += "</select>";
		str_add += "<input type='text' class='form-control' name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][weight]' value=\""+(params['weight']||'0.000')+"\" size='5'>";
		str_add += "</td>";
	//} else {
	//	str_add += "<input type='hidden' name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][weight_prefix]' value=\""+(params['weight_prefix']||'')+"\">";
	//	str_add += "<input type='hidden' name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][weight]' value=\""+(params['weight']||'0.000')+"\">";
	}
	
	if (ro_settings['spec_price'])	{
		str_add += "<td>&nbsp;";
		if (ro_settings['spec_price_prefix']) {
			str_add += "<select name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][price_prefix]' class='form-control'>";
			var price_prefixes = ['=', '+', '-'];
			for (var i in price_prefixes) {
				if((price_prefixes[i] instanceof Function) ) { continue; }
				var price_prefix = price_prefixes[i];
				str_add += "<option value='"+price_prefix+"' "+(price_prefix==params['price_prefix']?"selected":"")+">"+price_prefix+"</option>";
			}
			str_add += "</select>";
		}
		str_add += "<input type='text' class='form-control' name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][price]' value='"+(params['price']||'')+"' size='10'>";
		str_add += "</td>";
	//} else {
	//	str_add += "<input type='hidden' name='relatedoptions["+ro_counter+"][price]' value='"+(params['price']||'')+"'>";
	}
	
	
	if (ro_settings['spec_price'] && ro_settings['spec_price_discount'])	{
		str_add += "<td>";
	//} else {
	//	str_add += "<div style='display:none;'>";
	//}
	
		str_add += "<button type='button' onclick=\"ro_add_discount("+ro_tabs_num+", "+ro_counter+", '');\" data-toggle='tooltip' title='"+entry_add_discount+"' class='btn btn-primary'><i class='fa fa-plus-circle'></i></button>";
		str_add += "<div id='ro_price_discount"+ro_counter+"' >";
		str_add += "</div>";
		//if (ro_settings['spec_price'] && ro_settings['spec_price_discount'])	{
			str_add += "</td>";	
		//} else {
		//	str_add += "</div>";
		//}
	}
	
	if (ro_settings['spec_price'] && ro_settings['spec_price_special'])	{
		str_add += "<td>";
	//} else {
	//	str_add += "<div style='display:none;'>";
	//}
	str_add += "<button type='button' onclick=\"ro_add_special("+ro_tabs_num+", "+ro_counter+", '');\" data-toggle='tooltip' title='"+entry_add_special+"' class='btn btn-primary'><i class='fa fa-plus-circle'></i></button>";
	str_add += "<div id='ro_price_special"+ro_counter+"'>";
	str_add += "</div>";
	//if (ro_settings['spec_price'] && ro_settings['spec_price_special'])	{
		str_add += "</td>";	
	//} else {
	//	str_add += "</div>";
	}
	
	if (ro_settings['select_first'] && ro_settings['select_first']==1) {
		str_add += "<td>&nbsp;";
		
		str_add += "<input id='defaultselect_"+ro_counter+"' type='checkbox' onchange='ro_check_defaultselectpriority("+ro_tabs_num+");' name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][defaultselect]' "+((params && params['defaultselect']==1)?("checked"):(""))+" value='1'>";
		str_add += "<input id='defaultselectpriority_"+ro_counter+"' type='text' class='form-control' title='<?php echo $entry_select_first_priority; ?>' name='ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][defaultselectpriority]'  value=\""+((params && params['defaultselectpriority'])?(params['defaultselectpriority']):(""))+"\" >";
		str_add += "</td>";	
	}

	str_add += "<td><br>";
	str_add += "<button type=\"button\" class='btn btn-danger' onclick=\"$('#related-option" + ro_counter + "').remove();ro_refresh_status("+ro_tabs_num+");\" data-toggle=\"tooltip\" title=\"<?php echo $button_remove; ?>\" class='btn btn-primary' data-original-title=\"<?php echo $button_remove; ?>\" ><i class=\"fa fa-minus-circle\"></i></button>";
	
  str_add += "</td></tr>";
  
  $('#tbody-ro-'+ro_tabs_num).append(str_add);
	
	if (ro_settings['spec_price'] && ro_settings['spec_price_discount'])	{
		if (params && params['discounts'] ) {
			for (var i_dscnt in params['discounts']) {
				if ( ! params['discounts'].hasOwnProperty(i_dscnt) ) continue;
				ro_add_discount(ro_tabs_num, ro_counter, params['discounts'][i_dscnt]);
			}
		}
	}
	
	if (ro_settings['spec_price'] && ro_settings['spec_price_special'])	{
		if (params && params['specials'] ) {
			for (var i_dscnt in params['specials']) {
				if ( ! params['specials'].hasOwnProperty(i_dscnt) ) continue;
				ro_add_special(ro_tabs_num, ro_counter, params['specials'][i_dscnt]);
			}
		}
	}
	
	ro_update_combination(ro_tabs_num,ro_counter);
	
	if (params==false) {
		ro_refresh_status(ro_tabs_num);
		ro_check_defaultselectpriority(ro_tabs_num);
	}
	
  ro_counter++;
  
}

function ro_refresh_status(ro_tabs_num, ro_num) {
  
	if (ro_num || ro_num==0) {
		ro_update_combination(ro_tabs_num, ro_num);
	}
	
	var rov_id = $('#rov-'+ro_tabs_num).val();
	var ro_variant = ro_variants[ rov_id ];
	
	$('#tab-ro-'+ro_tabs_num+' div[id^=ro_status]').html('');
	
	var opts_combs = [];
	var checked_opts_combs = [];
	$('#tab-ro-'+ro_tabs_num+' tr[id^=related-option]').each( function () {
		var opts_comb = $(this).attr('ro_opts_comb');
		
		if ( $.inArray(opts_comb, opts_combs) != -1 && $.inArray(opts_comb, checked_opts_combs)==-1 ) {
			$('#tab-ro-'+ro_tabs_num+' tr[ro_opts_comb='+opts_comb+']').each( function () {
				$(this).find('div[id^=ro_status]').html('<?php echo $warning_equal_options; ?>');
			});
			checked_opts_combs.push(opts_comb);
		} else {
			opts_combs.push(opts_comb);
		}
	})
	
	return;
	
}

function ro_update_combination(ro_tabs_num, ro_num) {
	
	var rov_id = $('#rov-'+ro_tabs_num).val();
	var ro_variant = ro_variants[ rov_id ];
	var str_opts = "";
	
	for (var i in ro_variant['options']) {
		
		if((ro_variant['options'][i] instanceof Function) ) { continue; }
		
		var option_id = ro_variant['options'][i]['option_id'];
	
		str_opts += "_о"+option_id;
		str_opts += "_"+$('#ro_o_'+ro_num+'_'+option_id).val();
	}
	$('#related-option'+ro_num).attr('ro_opts_comb', str_opts);
	
}

function ro_add_text_field(ro_tabs_num, ro_num, setting_name, params, field_name) {
	str_add = "";
	if (ro_settings[setting_name] && ro_settings[setting_name]!='0')	{
		str_add += "<td>&nbsp;";
		str_add += "<input type='text' class='form-control' name='ro_data["+ro_tabs_num+"][ro]["+ro_num+"]["+field_name+"]' value=\""+(params[field_name]||'')+"\">";
		str_add += "</td>";
	//} else {
	//	str_add += "<input type='hidden' class='form-control' name='ro_data["+ro_tabs_num+"][ro]["+ro_num+"]["+field_name+"]' value=\""+(params[field_name]||'')+"\">";
	}
	return str_add;
}

function ro_add_discount(ro_tabs_num, ro_counter, discount) {
	
	var first_name = "ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][discounts]["+ro_discount_counter+"]";
	var customer_group_id = (discount=="")?(0):(discount['customer_group_id']);
	
	str_add = "";
	str_add += "<table id='related-option-discount"+ro_discount_counter+"' style='width:242px;'><tr><td>";
	
	str_add += "<select name='"+first_name+"[customer_group_id]' class='form-control' title=\"<?php echo htmlspecialchars($entry_customer_group); ?>\" style='float:left;width:80px;'>";
	<?php foreach ($customer_groups as $customer_group) { ?>
	str_add += "<option value='<?php echo $customer_group['customer_group_id']; ?>' "+((customer_group_id==<?php echo $customer_group['customer_group_id']; ?>)?("selected"):(""))+"><?php echo $customer_group['name']; ?></option>";
	<?php } ?>
	str_add += "</select>";
	
	str_add += "<input type='text' class='form-control' style='float:left;width:42px;' size='2' name='"+first_name+"[quantity]' value='"+((discount=="")?(""):(discount['quantity']))+"' title=\"<?php echo htmlspecialchars($entry_quantity); ?>\">";
	str_add += "";
	
	// hidden
	str_add += "<input type='hidden' name='"+first_name+"[priority]' value='"+((discount=="")?(""):(discount['priority']))+"' title=\"<?php echo htmlspecialchars($entry_priority); ?>\">";
	
	str_add += "<input type='text' class='form-control' style='float:left;width:80px;' size='10' name='"+first_name+"[price]' value='"+((discount=="")?(""):(discount['price']))+"' title=\"<?php echo htmlspecialchars($entry_price); ?>\">";
	
	str_add += "<button type=\"button\" onclick=\"$('#related-option-discount" + ro_discount_counter + "').remove();\" data-toggle=\"tooltip\" title=\"<?php echo $button_remove; ?>\" class=\"btn btn-danger\" style='float:left;' data-original-title=\"\"><i class=\"fa fa-minus-circle\"></i></button>";

	str_add += "</td></tr></table>";
	
	$('#ro_price_discount'+ro_counter).append(str_add);
	
	ro_discount_counter++;
	
}

function ro_add_special(ro_tabs_num, ro_counter, special) {
	
	var first_name = "ro_data["+ro_tabs_num+"][ro]["+ro_counter+"][specials]["+ro_special_counter+"]";
	var customer_group_id = (special=="")?(0):(special['customer_group_id']);
	
	str_add = "";
	str_add += "<table id='related-option-special"+ro_special_counter+"' style='width:200px;'><tr><td>";
	
	str_add += "<select name='"+first_name+"[customer_group_id]' class='form-control' style='float:left;width:80px;' title=\"<?php echo htmlspecialchars($entry_customer_group); ?>\">";
	<?php foreach ($customer_groups as $customer_group) { ?>
	str_add += "<option value='<?php echo $customer_group['customer_group_id']; ?>' "+((customer_group_id==<?php echo $customer_group['customer_group_id']; ?>)?("selected"):(""))+"><?php echo $customer_group['name']; ?></option>";
	<?php } ?>
	str_add += "</select>";
	
	// hidden
	str_add += "<input type='hidden' size='2' name='"+first_name+"[priority]' value='"+((special=="")?(""):(special['priority']))+"' title=\"<?php echo htmlspecialchars($entry_priority); ?>\">";
	str_add += "<input type='text'  class='form-control' style='float:left;width:80px;' size='10' name='"+first_name+"[price]' value='"+((special=="")?(""):(special['price']))+"' title=\"<?php echo htmlspecialchars($entry_price); ?>\">";
	str_add += "<button type=\"button\" onclick=\"$('#related-option-special" + ro_special_counter + "').remove();\" data-toggle=\"tooltip\" title=\"<?php echo $button_remove; ?>\" class=\"btn btn-danger\" style='float:left;' data-original-title=\"<?php echo $button_remove; ?>\"><i class=\"fa fa-minus-circle\"></i></button>";
	str_add += "</td></tr></table>";
	
	$('#ro_price_special'+ro_counter).append(str_add);
	
	ro_special_counter++;
	
}

function ro_fill_all_combinations(ro_tabs_num, product_options_only) {

	var rov_id = $('#rov-'+ro_tabs_num).val();
	var ro_variant = ro_variants[ rov_id ];
	//var vopts = ro_variants[ $('[name=related_options_variant]')[0].value ];
	var all_vars = [];
	
	if (product_options_only) {
		var this_product_options = [];
		$('select[name^=product_option][name*=option_value_id]').each(function() {
			if ( $(this).val() ) {
				this_product_options.push($(this).val());
			}
		});
	}
		
	var reversed_options = [];	
	for (var i in ro_variant['options']) {
		if((ro_variant['options'][i] instanceof Function) ) { continue; }
		reversed_options.unshift(i);
	}
		
	//for (var i in ro_variant['options']) {
	//	if((ro_variant['options'][i] instanceof Function) ) { continue; }
	for (var i_index in reversed_options) {
	
		var i = reversed_options[i_index];
		
		var option_id = ro_variant['options'][i]['option_id'];
		
		var temp_arr = [];
		for (var j in ro_all_options[option_id]['values']) {
			if((ro_all_options[option_id]['values'][j] instanceof Function) ) { continue; }
			
			var option_value_id = ro_all_options[option_id]['values'][j]['option_value_id']
			
			if (product_options_only && $.inArray(option_value_id, this_product_options) == -1 ) { //
				continue;
			}
			if (all_vars.length) {
				for (var k in all_vars) {
					if((all_vars[k] instanceof Function) ) { continue; }
					
					var comb_arr = all_vars[k].slice(0);
					comb_arr[option_id] = option_value_id;
					temp_arr.push( comb_arr );
				}
			} else {
				var comb_arr = [];
				comb_arr[option_id] = option_value_id;
				temp_arr.push(comb_arr);
			}
			
		}
		if (temp_arr && temp_arr.length) {
			all_vars = temp_arr.slice(0);
		}
	}
	
	if (all_vars.length) {
		for (var i in all_vars) {
			if((all_vars[i] instanceof Function) ) { continue; }
			
			rop = {};
			for (var j in all_vars[i]) {
				if((all_vars[i][j] instanceof Function) ) { continue; }
				rop[j] = all_vars[i][j];
			}
			
			ro_add_combination(ro_tabs_num, {options: rop});

		}
		
		ro_use_check(ro_tabs_num);
		ro_refresh_status(ro_tabs_num);
		ro_check_defaultselectpriority(ro_tabs_num);
		
	}
	
}

// check priority fields (is it available or not) for default options combination
function ro_check_defaultselectpriority(ro_tabs_num) {
	
	var dsc = $('#tab-ro-'+ro_tabs_num+' input[type=checkbox][id^=defaultselect_]');
	var dsp;
	for (var i=0;i<dsc.length;i++) {
		dsp = $('#defaultselectpriority_'+dsc[i].id.substr(14));
		if (dsp && dsp.length) {
			if (dsc[i].checked) {
				dsp[0].style.display = '';
				if (isNaN(parseInt(dsp[0].value))) {
					dsp[0].value = 0;
				}
				if (parseInt(dsp[0].value)==0) {
					dsp[0].value = "1";
				}
			} else {
				dsp[0].style.display = 'none';
			}
		}
	}
}


if (ro_data) {
	for (var i in ro_data) {
		var ro_tabs_num = ro_add_tab(ro_data[i]);
		
		ro_use_check(ro_tabs_num);
		ro_refresh_status(ro_tabs_num);
		ro_check_defaultselectpriority(ro_tabs_num);
		
	}
	
	
	
}



//--></script>
<!-- >> Related Options PRO / Связанные опции PRO -->
      
      
      
<?php echo $footer; ?>
