<?php echo $header; ?>
<div class="container bg-w">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-5'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <?php if ($thumb || $images) { ?>
				  <div class="thumbnails-image">
					<?php if ($thumb) { ?>
					   <a class="thumbnail" title="<?php echo $heading_title; ?>">
                            <img src="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                        </a>
					<?php } ?>
			     </div>
                 <!-- thumbnails-image -->
			
		          <?php if ($thumb) { ?>
                  <div class="wrapper-img-additional">
                  <div class="image-additional" id="gallery_01">
					<a class="thumbnail" href="#" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
					<?php } ?>
					<?php if ($images) { ?>
					<?php foreach ($images as $image) { ?>
					<a class="thumbnail" href="#" data-image="<?php echo $image['thumb']; ?>" data-zoom-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img  src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
					<?php } ?>
					<?php } ?>
				  </div>
                  </div>
				  <?php } ?>
          <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
        </div>
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-7'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?> product-detail">
        <div class="product-name">
          <h1><?php echo $heading_title; ?></h1>  
        </div>
        <?php if ($review_status) { ?>
          <div class="ratings">
            <div class="rating-box">
              <?php for ($i = 0; $i <= 5; $i++) { ?>
                  <?php if ($rating == $i) {
                      $class_r= "rating".$i;
                      echo '<div class="'.$class_r.'">rating</div>';
                  } 
              } ?>
            </div>
            <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
          </div>
          <?php } ?>
          <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
            <!-- AddThis Button END -->
        <?php if ($price) { ?>
          <ul class="list-unstyled">
            <?php if (!$special) { ?>
            <li class="detail-price">
              <h2 class="orgprice"><?php echo $price; ?></h2>
            </li>
            <?php } else { ?>
              <li class="detail-price"><span class="orgprice"><?php echo $price; ?></span><span class="newprice"><?php echo $special; ?></span></li>
            <?php } ?>
            <?php if ($tax) { ?>
            <li><?php echo $text_tax; ?> <span><?php echo $tax; ?></span></li>
            <?php } ?>
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <span><?php echo $points; ?></span></li>
            <?php } ?>
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
              <?php foreach ($discounts as $discount) { ?>
                <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><span><?php echo $discount['price']; ?></span></li>
              <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          
          
          <ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <span><?php echo $model; ?></span></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <span><?php echo $reward; ?></span></li>
            <?php } ?>
            <li><?php echo $text_stock; ?> <span><?php echo $stock; ?></span></li>
          </ul>
          <?php if ($options) { ?>
            
            <h3 class="title-option"><?php echo $text_option; ?></h3>
            <?php }?>
          
          <div id="product">
            <?php if ($options) { ?>
            
            
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            
            
            
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            
            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>
          <div class="add-to-wc">
              <button type="button" class="btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');">
                <?php echo $button_wishlist; ?>
              </button>
              <button type="button" class="btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');">
                <?php echo $button_compare; ?>
              </button>
          </div>
          <div class="add-to-cart">
              <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
              <input type="text" name="quantity" value="<?php echo $minimum; ?>" id="input-quantity" />
              <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="button"><span><?php echo $button_cart; ?></span></button>
            </div>
        </div>
      </div>
      <ul class="tabs-des-review">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
      <?php if ($products) { ?>
      
      <div class="group-title"><h2><?php echo $text_related; ?></h2></div>
      <div class="row">
        
        <?php 
	  $count = 0; 
	  $row=1;
	  $rows = 1; 
	  if(!$rows) {$rows=1;}
   ?>
   <div class="view-related">
        <?php foreach ($products as $product) { ?>
    <?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++; ?>
    <div class="item">
		 <div class="item-inner">
			 <div class="images-container">
				  <?php if ($product['special']) {?>
					 <div class="label_sale"><span><?php echo $text_label_sale ?></span></div>
				  <?php } else { ?>
					 <div class="label_new"><span><?php echo $text_label_new ?></span></div>
				  <?php }?>
				 <?php if ($product['thumb']) { ?>
					 <a class="product-image" href="<?php echo $product['href']; ?>">
						 <?php if($product['rotator_image']!=""){ ?>                                             <img class="img2" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />                                         <?php }?>
						 <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
					 </a>
				 <?php } else { ?>
					 <a class="product-image" href="<?php echo $product['href']; ?>">
						 <div class="product-image">
							 <img class="img2" src="image/cache/placeholder-268x268.png" alt="<?php echo $product['name']; ?>" />
							 <img src="image/cache/placeholder-268x268.png" alt="<?php echo $product['name']; ?>" />
						 </div>
					 </a>
				 <?php } ?>
				 
				 
			 </div><!--images-container-->
			 <div class="des-container">
			   <div class="actions">
					 <ul class="add-to-links">
						 <li>
							 <a class="link-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
								 <em><?php echo $button_wishlist; ?></em>
							 </a>
						 </li>
						 <li>
							 <a class="link-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');">
								 <em><?php echo $button_compare; ?></em>
							 </a>
						 </li>
					 </ul>
					 
					 <button class="button btn-cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
						 <span><?php echo $button_cart; ?></span>
						 <em><?php echo $button_cart; ?></em>
					 </button>
				 
				 </div><!-- actions -->
				 <div class="des-inner">
				 <h2 class="product-name">
						 <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
				 </h2>
				 <?php if (isset($product['rating'])) { ?>
					 <div class="ratings">
						 <div class="rating-box">
							 <?php for ($i = 0; $i <= 5; $i++) { ?>
								 <?php if ($product['rating'] == $i) {
									 $class_r= "rating".$i;
									 echo '<div class="'.$class_r.'">rating</div>';
								 } 
							 }  ?>
						 </div>
						 <div class="review-count"><a href="<?php echo $product['href']; ?>"><?php echo $product['reviews']; ?></a></div>
					 </div>
				 <?php } ?>
				 
					 <?php if ($product['price']) { ?>
						 <?php if (!$product['special']) { ?>
							 <div class="price-box box-regular">
								 <span class="regular-price">
									 <span class="price"><?php echo $product['price']; ?></span>
								 </span>
							 </div>
						 <?php } else { ?>
							 <div class="price-box box-special">
								 <p class="old-price"><span class="price"><?php echo $product['price']; ?></span></p>
								 <p class="special-price"><span class="price"><?php echo $product['special']; ?></span></p>
							 </div>
						 <?php } ?>
					 <?php } ?>
				 
				 </div><!-- des-inner -->
			 </div><!--des-container-->
		 </div> <!-- item-inner -->
	 </div> <!-- item -->
    <?php if($count % $rows == 0 ): ?>
    	</div>
     <?php else: ?>
    	<?php if($count == count($products)): ?>
    		</div>
    	<?php endif; ?>
     <?php endif; ?>
    <?php } ?>
      </div>
      </div>
      <?php } ?>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('body').before('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart .cart-inner > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart .cart-inner > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>

 				<script>
                    $(document).ready(function(){
					
						$('input[name^="option"]').click(function(){
							
							var elm = $(this);
							var optionId = elm.val();
							
							var activeOption = $('[id="desc_' + optionId + '"]');
							
							console.log('optionId: ' + optionId);
							console.log(activeOption);
							
							activeOption.siblings('.option-description').hide();
							activeOption.show();
						});
					});
				</script>
			

        
        <!-- << Parent-child Options -->
        
        <script type="text/javascript"><!--
        
          <?php
            $pcop_data = array();
            if (isset($options) && $options) {
              foreach ($options as $product_option) {
                $pcop_data[$product_option['product_option_id']] = isset($product_option['pcop']) ? $product_option['pcop'] : array();
              }
            }
          ?>
          var pcop_data = <?php echo json_encode($pcop_data); ?>;
          var pcop_option_prefix = "option";
					if ($('#mijoshop').length && $('[name^="option_oc["]').length) { // 
						pcop_option_prefix = "option_oc";
					} else if ( $('#product [id^="input-option"][name^="option_oc["]').length ) { // joocart
            pcop_option_prefix = "option_oc";
          }
          
          // option[XXX]
          function pcop_get_product_option_id_from_name(name) {
            
            var str = name.substr( pcop_option_prefix.length + 1 );
            var bracket_pos = str.indexOf(']');
            if (bracket_pos != -1) {
              return str.substr(0,bracket_pos);
            }
          }
          
          function pcop_is_parent_value_selected(parent_option_id, parent_option_values) {
          
            var result = false;
            
            $('#product').find('input:checkbox[name="'+pcop_option_prefix+'['+parent_option_id+'][]"]:checked, input:radio[name="'+pcop_option_prefix+'['+parent_option_id+']"]:checked, select[name^="'+pcop_option_prefix+'['+parent_option_id+']"]')
            .each(function(){
                               
              if ( $(this).val() && $.inArray($(this).val(), parent_option_values) != -1 ) {
                result = true;  
                return false; // stop the loop
              }
                              
            });
                              
            return result;
            
          }
          
          
          function pcop_change_option_visibility(product_option_id, option_toggle) {
          
            $('#product').find('[name^="'+pcop_option_prefix+'['+product_option_id+']"]').closest('div.form-group').toggle(option_toggle);
            if ( $('#product').find('[name^="'+pcop_option_prefix+'['+product_option_id+']"]').closest('div.form-group').next().is('br') ) {
              $('#product').find('[name^="'+pcop_option_prefix+'['+product_option_id+']"]').closest('div.form-group').next().toggle(option_toggle);
            }
            
            var values_changed = false;
            
            if ( !option_toggle ) {
              if ( $('#product').find('select[name^="'+pcop_option_prefix+'['+product_option_id+']"]').val() ) {
                $('#product').find('select[name^="'+pcop_option_prefix+'['+product_option_id+']"]').val('');
                values_changed = true;
              }
              if ( $('#product').find('input:checkbox[name^="'+pcop_option_prefix+'['+product_option_id+']"]:checked').length ) {
                $('#product').find('input:checkbox[name^="'+pcop_option_prefix+'['+product_option_id+']"]:checked').prop('checked', false);
                values_changed = true;
              }
              if ( $('#product').find('input:radio[name^="'+pcop_option_prefix+'['+product_option_id+']"]:checked').length ) {
                $('#product').find('input:radio[name^="'+pcop_option_prefix+'['+product_option_id+']"]:checked').prop('checked', false);
                values_changed = true;
              }
              
              if ( $('#product').find('input:not(:radio):not(:checkbox)[name^="'+pcop_option_prefix+'['+product_option_id+']"]').length ) {
                $('#product').find('input:not(:radio):not(:checkbox)[name^="'+pcop_option_prefix+'['+product_option_id+']"]').val('');
              }
              
              if ( $('#product').find('textarea[name^="'+pcop_option_prefix+'['+product_option_id+']"]').length ) {
                $('#product').find('textarea[name^="'+pcop_option_prefix+'['+product_option_id+']"]').val('');
              }
              
            }
            
            // << hided is not required
            if ( !$('#pcop_not_required').length ) {
              $('#product').append('<input type="hidden" name="pcop_not_required" id="pcop_not_required" value="">');
            }
            
            if ( !$('#pcop_not_required').val() ) {
              var current_opts = [];
            } else {
              var current_opts = $('#pcop_not_required').val().split(',');
            }
            
            var new_opts = [];
            for (var i in current_opts) {
              if ( !current_opts.hasOwnProperty(i) ) continue;
              if ( current_opts[i] != product_option_id) {
                new_opts.push(current_opts[i]);
              }
            }
            
            if (!option_toggle ) {
              new_opts.push(product_option_id);
            }
            $('#pcop_not_required').val(new_opts.toString());
            // >> hided is not required
            
          
            return values_changed;
          
          }
          
          function pcop_check_visibility() {
          
            if (pcop_data && Object.keys(pcop_data).length) {
              
              var product_options_ids = [];
              $('#product').find('input[name^="'+pcop_option_prefix+'["], textarea[name^="'+pcop_option_prefix+'["], select[name^="'+pcop_option_prefix+'["] ').each(function(){
                var product_option_id = pcop_get_product_option_id_from_name($(this).attr('name'));
                if ( $.inArray(product_option_id, product_options_ids) == -1 ) {
                  product_options_ids.push(product_option_id)
                }
              })
              
              for (var j in product_options_ids) {
                if ( !product_options_ids.hasOwnProperty(j) ) continue;
              
                var product_option_id = product_options_ids[j];
                
                if (pcop_data[product_option_id]) {
                  var pcop_rules = pcop_data[product_option_id];
                  if (pcop_rules && pcop_rules.length) {
                    
                    var option_toggle = true;
                    
                    for (var i in pcop_rules) {
                      if ( !pcop_rules.hasOwnProperty(i) ) continue;
                      
                      var parent_option_id = pcop_rules[i]['parent_option_id'];
                      var parent_option_values = pcop_rules[i]['values'];
                      
                      option_toggle = option_toggle && pcop_is_parent_value_selected(parent_option_id, parent_option_values);
                      
                    }
                    
                    
                    if ( pcop_change_option_visibility(product_option_id, option_toggle) ) {
                      // если у скрываемой опции были выбраны значения и они были выключены, запустим процедуру заново
                      $('#product [name^="'+pcop_option_prefix+'['+product_option_id+']"]:first').change();
                      //pcop_check_visibility(); 
                      return;
                    }
                    
                  }
                }
              
              }
              
              <?php if (isset($pcop_theme_name) && $pcop_theme_name=='openjewelry1.0') { ?>
                if ($.fn.uniform) {
                  $("select,input[type=checkbox],input[type=radio]").uniform();
                }
              <?php } ?>
            }
          }
          
          if (pcop_data && Object.keys(pcop_data).length) {
            $('#product').on('change', 'input:checkbox[name^="'+pcop_option_prefix+'"], input:radio[name^="'+pcop_option_prefix+'"], select[name^="'+pcop_option_prefix+'"]', function(){
              pcop_check_visibility();
            });
          }
          
          if (pcop_data && Object.keys(pcop_data).length) {
            pcop_check_visibility();
          }
        
        //--></script>
        
        <!-- >> Parent-child Options -->
        
        
<?php echo $footer; ?>
