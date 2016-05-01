<?php echo $header; ?>
<div class="container">
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
					<a class="thumbnail" href="#" data-image="<?php echo $image['thumb']; ?>" data-zoom-image="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img  
      src="<?php echo $image['thumb']; ?>" title="<?php echo ( (isset($image['title']) && $image['title']) ? ' '.$image['title'] : $heading_title); ?>" alt="<?php echo ((isset($image['title']) && $image['title']) ? ' '.$image['title'] : $heading_title); ?>"
       /></a>
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
        <?php } ?><?php } ?></p><?php } ?>
        <!--optiondesc-->

				
				<?php if(isset($options)): ?>
				<?php foreach ($options as $option): ?>
					
					<div class="option-group">
						<?php foreach ($option['product_option_value'] as $optionValue): ?>
							<div class="option-description"
								id="desc_<?php echo $optionValue['product_option_value_id']; ?>"
								style="display: none;">
								
								<div class="group-title">
									<h2>Details</h2>
								</div>
								<?php if (isset($optionValue['description'])) echo $optionValue['description']; ?>
							</div>
						<?php endforeach; ?>
					</div>
					
				<?php endforeach; ?>
				<?php endif; ?>
							
			
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
            <li><?php //echo $text_points; ?> <span><?php //echo $points; ?></span></li>
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
            <li><?php echo $text_model; ?> <span><?php	/* Related Options PRO / Связанные опции PRO */	echo "<font id='product_model'>".$model."</font>"; /* >> Related Options PRO / Связанные опции PRO */ ?>
      </span></li>
            <?php if ($reward) { ?>
            <li><?php // echo $text_reward; ?> <span><?php //echo $reward; ?></span></li>
            <?php } ?>
            <li><?php echo $text_stock; ?> <span><?php	/* Related Options PRO / Связанные опции PRO */	echo "<font id='product_stock'>".$stock."</font>"; /* >> Related Options PRO / Связанные опции PRO */ ?>
      </span></li>
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

			<?php
			// << Product Option Image PRO module

			if ($option['type'] == 'radio' && isset($option_value['poip_image']) && $option_value['poip_image'] ) {
				?>
				<img src="<?php echo $option_value['poip_image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
				<?php
			}
			
      // >> Product Option Image PRO module
			?>
			
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

			<?php
			// << Product Option Image PRO module

			if ($option['type'] == 'checkbox' && isset($option_value['poip_image']) && $option_value['poip_image'] ) {
				?>
				<img src="<?php echo $option_value['poip_image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
				<?php
			}
			
      // >> Product Option Image PRO module
			?>
			
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

			<?php
			// << Product Option Image PRO module

			if ($option['type'] == 'radio' && isset($option_value['poip_image']) && $option_value['poip_image'] ) {
				?>
				<img src="<?php echo $option_value['poip_image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
				<?php
			}
			
      // >> Product Option Image PRO module
			?>
			
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
						 <?php if($product['rotator_image']!=""){ ?>                                             <img class="img2" src="<?php echo $product['rotator_image']; ?>" <?php /* Product Option Image PRO module << */ if ($poip_installed) { ?> data-poip_id="image_<?php echo "".$current_class."_".$product['product_id']; ?>" <?php } /*  >> Product Option Image PRO module */ ?>alt="<?php echo $product['name']; ?>" />                                         <?php }?>
						 <img src="<?php echo $product['thumb']; ?>" <?php /* Product Option Image PRO module << */ if ($poip_installed) { ?> data-poip_id="image_<?php echo "".$current_class."_".$product['product_id']; ?>" <?php } /*  >> Product Option Image PRO module */ ?>alt="<?php echo $product['name']; ?>" />
					 </a>
				 <?php } else { ?>
					 <a class="product-image" href="<?php echo $product['href']; ?>">
						 <div class="product-image">
							 <img class="img2" src="image/cache/placeholder-268x268.png" <?php /* Product Option Image PRO module << */ if ($poip_installed) { ?> data-poip_id="image_<?php echo "".$current_class."_".$product['product_id']; ?>" <?php } /*  >> Product Option Image PRO module */ ?>alt="<?php echo $product['name']; ?>" />
							 <img src="image/cache/placeholder-268x268.png" <?php /* Product Option Image PRO module << */ if ($poip_installed) { ?> data-poip_id="image_<?php echo "".$current_class."_".$product['product_id']; ?>" <?php } /*  >> Product Option Image PRO module */ ?>alt="<?php echo $product['name']; ?>" />
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
// << Related Options PRO / Связанные опции PRO
	<?php
		
		if ( isset($ro_installed) && $ro_installed ) {
			if (isset($ro_settings['stock_control']) && $ro_settings['stock_control'] && isset($ro_data) && $ro_data ) {
	?>
	
		if (!$('#button-cart').attr('allow_add_to_cart')) {
			ro_stock_control(1);
			return;
		}
		$('#button-cart').attr('allow_add_to_cart','');
		
	<?php
			}
		}
	?>
			
// >> Related Options PRO / Связанные опции PRO 
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
        
        

			<?php // << Live Price ?>
			<?php if (isset($liveprice_installed) && $liveprice_installed) { ?>

			<script type="text/javascript">
				
				var liveprice_last_request = 0;
				
				function liveprice_recalc() {
					
					liveprice_last_request = Math.random();
					//console.debug(liveprice_last_request);
					
					$.ajax({
						type: 'POST',
						url: 'index.php?route=module/liveprice/get_price&product_id=<?php echo $product_id; ?>&quantity='+$('input#input-quantity,input#qty-input,input#qty[name="quantity"],#product .quantity-adder input[name="quantity"], #quantity_wanted').val()+'&rnd='+liveprice_last_request,
						data: $('select[name^="'+lp_option_prefix+'["], input[name^="'+lp_option_prefix+'["][type=\'radio\']:checked, input[name^="'+lp_option_prefix+'["][type=\'checkbox\']:checked, textarea[name^="'+lp_option_prefix+'["], input[name^="'+lp_option_prefix+'["][type="text"]'),
						dataType: 'json',
						//dataType: 'text',
						beforeSend: function() {},
						complete: function() {},
						success: function(json) {
							//console.debug(json);
							
							if (json && json.rnd && json.rnd == liveprice_last_request) {
								if (json.ct == 'monster') {
									$('#product div.priceArea p.newprice').replaceWith(json.htmls.html);
									
								} else if (json.ct == 'smarti' || json.ct == 'beamstore') {
									$('.product-info .price').html(json.htmls.html);
									
								} else if (json.ct == 'pav_styleshop') {
									$('.product-info .price').html(json.htmls.html);
									
								} else if (json.ct == 'pav_digitalstore') {
									$('.product-info .price').html(json.htmls.html);
									
								} else if (json.ct == 'megashop') {
									$('.product-info .price').html(json.htmls.html);
									
								} else if (json.ct == 'bigshop') {
									$('.product-info ul.price-box').html(json.htmls.html);	
									
								} else if (json.ct == 'pav_fashion') {
									$('.product-info .price ul.list-unstyled:first').replaceWith(json.htmls.html1);
									$('.product-info ul.description').html(json.htmls.html2);
									
								} else if (json.ct == 'pav_dress_store') {
									$('.product-info .price ul.list-unstyled:first').html(json.htmls.html);	
									
								} else if (json.ct == 'theme516') {
									$('.product-info .price-section').html(json.htmls.html);
									
								} else if (json.ct == 'theme519') { // Beauty
									$('.product-info .price-section').html(json.htmls.html); 	
									
								} else if (json.ct == 'theme531') {
									$('.product-info .price-section').html(json.htmls.html);
									
								} else if (json.ct == 'theme511') {
									$('.product-info .price-section').html(json.htmls.html);
									
								} else if (json.ct == 'theme546') {
									$('#product .price-section').html(json.htmls.html);		
									
								} else if (json.ct == 'cosyone') {
									$('#product .cart .price').html(json.htmls.html1);
									$('#product').find('.minimum, .reward, .discount').remove();
									$('#product .cart').after(json.htmls.html2);	
									
								} else if (json.ct == 'OPC080183') {
									$('#product').siblings('.prod-price').find('li:first').replaceWith(json.htmls.html1);
									$('#product').siblings('.prod-price').next().replaceWith(json.htmls.html2);
									
								} else if (json.ct == 'sellegance') {
									
									var stock_info = $('#content .price .stock').html();
									$('#content .price').html(json.htmls.html.replace('%stock%', stock_info));
								
									//var stock_info = $('.product-info .price .stock').html();
									//$('.product-info .price').html(json.htmls.html.replace('%stock%', stock_info));
									
								} else if (json.ct == 'glade') {
									$('#product .price').html(json.htmls.html);
									
								} else if (json.ct == 'lamby') {
									$('.product-shop .list-unstyled.price-box').html(json.htmls.html);
									
								} else if (json.ct == 'journal2') {
									$('#product .list-unstyled.price').html(json.htmls.html);
								
								} else if (json.ct == 'fortuna') {
									$('#product div.price').replaceWith(json.htmls.html);	
								
								} else if (json.ct == 'rgen-opencart') {
									$('#content .product-info .buying-info .price-wrp').html(json.htmls.html);
									$('#content .product-info .buying-info1').html(json.htmls.html1);
									
								} else if (json.ct == 'bt_comohos') {
									$('.product-info .price_info').replaceWith(json.htmls.html);
									
								} else if (json.ct == 'amazecart') {
									$('#product').parent().find('div.prdmf').each(function() {
										if ( $(this).find('.list-unstyled').length == 2 ) {
											$($(this).find('.list-unstyled')[1]).replaceWith(json.htmls.html);		
										} else if ( $(this).find('.list-unstyled').length == 1 ) {
											$($(this).find('.list-unstyled')[0]).replaceWith(json.htmls.html);		
										}
									})
									
								} else if (json.ct == 'ntl' || json.ct == 'bt_claudine') { 
									$('.product-info .price_info').replaceWith(json.htmls.html);
									
								} else if (json.ct == 'allure') { 
									$('#product ul.list-unstyled[itemprop="offerDetails"]').html(json.htmls.html);	
									
								} else if (json.ct == 'OPC080185_3') { // Glorious
									var lp_infos = $('#product').siblings('.list-unstyled:first').replaceWith(json.htmls.html);
									
								} else if (json.ct == 'kingstorepro') {
									$('#product').parent().find('div.price').replaceWith(json.htmls.html);
									
								} else if (json.ct == 'coloring') {
									$('#product div.price').html(json.htmls.html);
									
								} else if (json.ct == 'OPC080178') {
									$('div.price ul').html(json.htmls.html);
									
								} else if (json.ct == 'tt_petsyshop') {
									$('#product').siblings('div.price:first').html(json.htmls.html);	
									
								} else {
									var lp_infos = $('#product').parent().find('.list-unstyled');
									if (lp_infos.length >= 2 ) {
										$(lp_infos[1]).replaceWith(json.htmls.html);
									}
								}
							}
						},
						error: function(error) {
							console.log(error);
						}
					});
					
				}
				
				//$(document).ready( function() {
					var lp_theme_name = '<?php echo isset($lp_theme_name) ? $lp_theme_name : ''; ?>';
					
					
				
					var lp_option_prefix = "option";
					if ($('#mijoshop').length && $('[name^="option_oc["]').length) { // 
						lp_option_prefix = "option_oc";
					}
				
					$('select[name^="'+lp_option_prefix+'["]').on('change', function(){
						liveprice_recalc();
					});
					
					$('input[name^="'+lp_option_prefix+'["]').on('change', function(){
						liveprice_recalc();
					});
					
					$('textarea[name^="'+lp_option_prefix+'["]').on('change', function(){
						liveprice_recalc();
					});
					
					$('#input-quantity, #qty-input, input#qty[name="quantity"], #product .quantity-adder input[name="quantity"], #quantity_wanted').on('input propertychange change', function(){
						liveprice_recalc();
					});
					
					<?php if ($lp_theme_name == 'journal2') { ?>
						$('#product .options ul li[data-value]').click(function(){
							setTimeout(function(){
								liveprice_recalc();
							}, 50);
						});
					<?php } ?>
					
					<?php if (isset($custom_price) && $custom_price) { ?>
						$('input[name^="'+lp_option_prefix+'["]').on('propertychange input', function(){
							liveprice_recalc();
						});
					<?php } ?>
					
					$('#button-cart').on('click', function(){
						setTimeout( function(){
							liveprice_recalc();
						}, 200);
					});
					
					if ($('#input-quantity').length && $('#input-quantity').val() && $('#input-quantity').val() > 1) {
						liveprice_recalc();
					}
					
					
					if (lp_theme_name == 'mobile') {
						$(document).ready( function() {
							setTimeout( function(){
								$(document).off('click','.spinner .btn:first-of-type');
								$(document).on('click','.spinner .btn:first-of-type', function(){
									$('.spinner input').val( parseInt($('.spinner input').val(), 10) + 1);
									$('.spinner input').change();
								});
								$(document).off('click','.spinner .btn:last-of-type');
								$(document).on('click','.spinner .btn:last-of-type', function(){
									$('.spinner input').val( Math.max(parseInt($('.spinner input').val(), 10) - 1, 1));
									$('.spinner input').change();
								});
							}, 100);
						});
					}
					
					if (lp_theme_name == 'tt_petsyshop') {
						$('#input-quantity').siblings('#plus, #minus').click(function() {
							setTimeout(function () {
								liveprice_recalc();
							}, 100);
						});
					}
					
					//pav_digitalstore
					$('#product .quantity-adder').find('span.add-up, span.add-down').click(function() {
						setTimeout(function () {
							liveprice_recalc();
						}, 100);
					});
					
					//bt_comohos
					$('#input-quantity').siblings('.increase, .decrease').click(function() {
						setTimeout(function () {
							$('#input-quantity').change();
						}, 100);
					});
					
					//rgen-opencart
					$('#content .product-info .buying-info .buy-btn-wrp a.qty-handle').click(function() {
						setTimeout(function () {
							$('#input-quantity').change();
						}, 100);
					});
					
					//fortuna
					$('#product .qty-minus, #product .qty-plus').click(function() {
						setTimeout(function () {
							$('#qty-input').change();
						}, 100);
					});
					
					//cosyone
					$('#product .cart .quantity_button').click(function() {
						setTimeout(function () {
							$('#input-quantity').change();
						}, 100);
					});
					
					// pav styleshop
					$('#product .quantity-adder .quantity-wrapper span').click(function() {
						setTimeout(function () {
							$('#input-quantity').change();
						}, 100);
					});
					
					// sellegance
					$('#product .input-qty .qty-minus, #product .input-qty .qty-plus').click(function() {
						setTimeout(function () {
							$('#qty-input').change();
						}, 100);
					});
					
					//journal2
					$('#product .qty .journal-stepper').click(function() {
						setTimeout(function () {
							$('#input-quantity').change();
						}, 100);
					});
					
					//kingstorepro & megashop
					$('#product #q_up, #product #q_down').click(function() {
						setTimeout(function () {
							$('#quantity_wanted').change();
						}, 100);
					});
					
					//bigshop
					$('.product-info .cart .qty .qtyBtn').click(function() {
						setTimeout(function () {
							$('#input-quantity').change();
						}, 100);
					});
					
				//});
				
			</script>
			<?php } ?>
	
	
			<?php // >> Live Price ?>
			

			<?php
				//<< Product Option Image PRO module
				if (isset($poip_theme_name) && ($poip_theme_name=='pav_fashion' || $poip_theme_name=='pav_styleshop' || $poip_theme_name=='megashop'
				|| $poip_theme_name == 'lexus_shopping' || $poip_theme_name == 'pav_sportshop' ) ) { ?>
				<script type="text/javascript"><!--
					$('div.product-action').css('top', '-70px');
					$('a.pav-colorbox').css('top', 'auto');
					$('a.pav-colorbox').css('bottom', '-40px');
				--></script>
				<?php }
				// >> Product Option Image PRO module
				?>
      

      <!-- Product Option Image PRO module << -->
      <?php  if ($poip_installed) {  ?>
        
      <script type="text/javascript"><!--
      var console=console||{"log":function(){},"debug":function(){}};
      var poip_options_settings = <?php echo json_encode($poip_product_settings); ?>;
      var poip_settings = <?php echo json_encode($poip_settings); ?>;
      var poip_images = <?php echo json_encode($poip_images); ?>;
      var poip_images_by_options = <?php echo json_encode($poip_images_by_options); ?>;
      var poip_product_option_ids = <?php echo json_encode($poip_product_option_ids); ?>;
			
			if ( typeof(poip_images2) != 'undefined' ) {
				poip_images = poip_images2;
			}
			
			var poip_theme_name = '<?php echo isset($poip_theme_name) ? $poip_theme_name : 'default'; ?>';
			if (poip_theme_name == 'default' && typeof(poip_ava_store) !== 'undefined' && poip_ava_store) {
				poip_theme_name = 'ava_store';
			}
			var use_refresh_colorbox = poip_theme_name!='allure' && poip_theme_name!='maxstore' && poip_theme_name!='theme422' && poip_theme_name!='theme500' 
						&& poip_theme_name!='theme541' && poip_theme_name!='theme546' && poip_theme_name!='theme638' && poip_theme_name!='default' && poip_theme_name!='pavilion' && poip_theme_name!='eagency' && poip_theme_name!='art';
			//var use_refresh_colorbox = poip_theme_name!='theme422' && poip_theme_name!='polianna';
			
			var poip_std_src = poip_main_image().attr('src');
			var poip_std_href = poip_main_image().closest('a').attr('href');
			
			var option_prefix = "option";
			if ($('[name^="option_oc["]').length) {
				option_prefix = "option_oc";
			}
			var option_prefix_length = option_prefix.length;
			
      // в список может быть включего главное изображений, надо его учесть
			if (poip_theme_name != 'bt_claudine' && poip_theme_name != 'ntl') { // !bt_claudine
				poipImageAdditional().find('a').each(function() {
					var img_src = '';
					if ($(this).attr('data-zoom-image') && poip_theme_name=='mattimeo') {
						img_src = $(this).attr('data-zoom-image');
					}else if ($(this).attr('data-image')) {
						img_src = $(this).attr('data-image');
					} else if ($(this).attr('href') && $(this).attr('href').substr(0,1) != "#") {
						img_src = $(this).attr('href');
					}
					
					if (img_src) {
	
						var img_found = false;
						for (var i=0;i<poip_images.length;i++) {
							if (img_src == poip_images[i]['popup'] || decodeURIComponent(img_src) == poip_images[i]['popup']) {
								img_found = true;
								break;
							}
						}
						if (!img_found) {
							poip_images.unshift({"product_id":"<?php echo $product_id; ?>","product_image_id":["-1"],"popup":"","main":"","thumb":""});
							poip_images[0].popup = img_src;
							poip_images[0].main = img_src;
							poip_images[0].thumb = img_src;
						}
					}
				});
			}
      
			function poip_get_product_option_id_from_name(name) {
				return name.substr(option_prefix_length+1, name.indexOf(']')-(option_prefix_length+1) )
			}
			
      // 1 - без checkbox, 2 - только чекбокс
      function get_selected_values(checkbox_variant, product_option_id) {
			
        var values = [];
				
				var select_string = "";
				if (!checkbox_variant || checkbox_variant==1) {
					select_string += 'select[name^="'+option_prefix+'["], input[type=radio][name^="'+option_prefix+'["]:checked';
				}
				if (!checkbox_variant || checkbox_variant==2) {
					select_string += (select_string=='' ? '' : ', ') + 'input[type=checkbox][name^="'+option_prefix+'["]:checked';
				}
				
				$(select_string).each(function () {
					var current_product_option_id = poip_get_product_option_id_from_name($(this).attr('name'));
					
					if ( (!product_option_id && $.inArray(current_product_option_id, poip_product_option_ids) != -1)
							|| (product_option_id && product_option_id == current_product_option_id) ) {
						
						if ($(this).val()) {
							values.push($(this).val());
						}
						
					}
					
				});
				
				return values;
				
      }
      
      function poip_get_global_visible_images() {
        // изображения которые должны быть видны до применения фильтра
        var global_visible_images = [];
        var images_by_settings = [];
        var selected_values = get_selected_values(); 
        
        for (var i=0; i<poip_images.length; i++) {
					
          if (poip_images[i]['product_image_id']) { // стандартное доп.изображение
            global_visible_images.push(poip_images[i]['popup']);
          } else {
            for (var product_option_id in poip_options_settings) {
              if (poip_options_settings[product_option_id]['img_use'] == 1) { // вкл изображения всех значений
                global_visible_images.push(poip_images[i]['popup']);
              } else if (poip_options_settings[product_option_id]['img_use'] == 2) { // вкл изображения только выбранных значений
                for (var j=0; j<selected_values.length; j++) {
                  if ($.inArray(selected_values[j], poip_images[i]['product_option_value_id'])!=-1) {
                    global_visible_images.push(poip_images[i]['popup']);
                  }
                }
              }
            }
          }
          
        }
        
        return global_visible_images;
        
      }
      
      function poip_array_intersection(arr1, arr2) {
        
        var match = [];
        
        $.each(arr1, function (i, val1) {
          if ($.inArray(val1, arr2) != -1) {
            match.push(val1);
          }
        });
        
        return match;
      }
      
      function poip_change_available_images(product_option_id) {
			
				if ($.inArray(product_option_id, poip_product_option_ids)==-1) {
          return;
        }
        
        var global_visible_images = poip_get_global_visible_images();
				
				var current_visible_images = poip_get_global_visible_images();
				
				for (var i in poip_product_option_ids) {
					
					if (!poip_product_option_ids.hasOwnProperty(i)) continue;
				
					var current_product_option_id = poip_product_option_ids[i];
					
					var current_product_option_selected_values = get_selected_values(0, current_product_option_id);
					
					if (poip_options_settings[current_product_option_id]['img_limit'] && poip_options_settings[current_product_option_id]['img_use']
						&& current_product_option_selected_values.length ) {
						
						var images_to_show = [];
						for (var j in poip_images) {
							if (poip_images[j]['product_option_value_id'] && poip_images[j]['product_option_value_id'].length) {
								for (var copsv_i in current_product_option_selected_values) {
									if ($.inArray(current_product_option_selected_values[copsv_i], poip_images[j]['product_option_value_id']) !== -1
										&& $.inArray(poip_images[j]['popup'], images_to_show) == -1 ) {
										images_to_show.push(poip_images[j]['popup']);
									}
								}
							}
						}
						
						if ( !images_to_show.length ) {
							continue;
						}
						
						current_visible_images = poip_array_intersection(current_visible_images, images_to_show);
					}
					
				}
				
				if (current_visible_images.length == 0) {
          current_visible_images = global_visible_images;
				}
				
				poip_set_visible_images(current_visible_images);
				
				return current_visible_images;
				
      }
			
			
			function poip_popup_refresh() {
				
				if (poip_theme_name == 'sebian' && $('#image-additional-carousel-quickview').length ) {
					return;
				}
				
				if (!poip_settings['img_gal']) {
					if ( $('li.image-additional').length ) { // OC 2.0 new-style default
						
						// exclude main image from gallery (main image should be present in additional images already)
						$('.thumbnails').magnificPopup({
							type:'image',
							delegate: '.image-additional a',
							gallery: {
								enabled:true
							}
						});
						poip_main_image().off('click', poip_main_aimg_click);
						poip_main_image().on('click', poip_main_aimg_click);
					}
					return;
				}
				
				if ( $('li.image-additional').length ) { // OC 2.0 new-style default
					// OC 2.0 DEFAULT instead of colorbox in OC 1.X
					$('.thumbnails').magnificPopup({
						type:'image',
						delegate: '.image-additional a:visible',
						gallery: {
							enabled:true
						}
					});
					poip_main_image().off('click', poip_main_aimg_click);
					poip_main_image().on('click', poip_main_aimg_click);
					
				} else { // OC 1.X and OC 2.0 old-style themes
					refresh_colorbox();
				}
			}
			
			var poip_main_aimg_click = function (event) {
			
				event.preventDefault();
				
				var main_href = $(this).parent().attr('href');
				
				poipImageAdditional().find('a').each(function(){
					if ($(this).attr('href') == main_href) {
						$(this).click();
						return;
					}
				});
				
			
			}
			
			function poip_set_visible_images_pavilion(images, counter) {
				
				if (!counter) counter = 1;
				if (counter == 50) return;
				
				if (!$('.fotorama').length || !$('.fotorama').data('fotorama')) {
					setTimeout(function () {
						poip_set_visible_images_pavilion(images, counter+1);
					}, 100);
					return;
				}
				
				var photorama_data = [];
				
				for (var i in images) {
					photorama_data.push({img: images[i], thumb: poip_get_image_by_src(images[i], 'popup')['thumb']});
				}
				
				$('.fotorama').data('fotorama').load(photorama_data);
				
				// fullscreen gallery
				$('#product .tbGoFullscreen').off('click');
				$('#product .tbGoFullscreen').on('click', function(){
					if (!$(this).hasClass('tbKeyPressed')) {
            lightbox_gallery('PageContentProductSystem_tbW0yqLP2t', photorama_data, $('.fotorama').data('fotorama').activeIndex);
          }
          $(this).addClass('tbKeyPressed');
				});
				
			}
			
			function poip_sort_images_by_selected_options(images_param) {
			
				var images = [];
				var values = get_selected_values();
				
				for (var j in values) {
					if ( !values.hasOwnProperty(j) ) continue;
				
					if (poip_images_by_options && poip_images_by_options[values[j]] && poip_images_by_options[values[j]].length) {
						for (var i in poip_images_by_options[values[j]]) {
							if ( !poip_images_by_options[values[j]].hasOwnProperty(i) ) continue;
						
							if (poip_images_by_options[values[j]][i]['image']) {
								var image = poip_get_image_by_src(poip_images_by_options[values[j]][i]['image'],'image');
								if (image && image['popup'] && $.inArray(image['popup'], images_param) != -1 && $.inArray(image['popup'], images) == -1) {
									images.push(image['popup']);
								}
							}	
						}
					}
				}
				
				for (var i in images_param) {
					if ( !images_param.hasOwnProperty(i) ) continue;
				
					if ( $.inArray(images_param[i], images) == -1 ) {
						images.push(images_param[i]);
					}
				}
			
				return images;
			}
			
			function poip_set_visible_images_eagency(images) {
			
				if ( poipImageAdditional().length ) { 
					var shown_img = [];
					poipImageAdditional().find('a').each( function(){
						// Учтем возможность спец символов типа пробела %20
						if ( $.inArray( $(this).attr('href'), images) != -1 && $.inArray( $(this).attr('href'), shown_img) == -1) {
							$(this).parents('li').show();
							$(this).attr('disabled', false);
							shown_img.push($(this).attr('href'));
						} else {
							$(this).parents('li').hide();
							$(this).attr('disabled', true);
						}
					});
					
					$('.popup-gallery').magnificPopup({
						delegate: 'a:not([disabled])',
						type: 'image',
						tLoading: 'Loading image #%curr%...',
						mainClass: 'mfp-img-mobile',
						gallery: {
							enabled: true,
							navigateByImgClick: true,
							preload: [0,1] // Will preload 0 - before current, and 1 after the current image
						},
						image: {
							tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
							titleSrc: function(item) {
								return item.el.attr('title');
							}
						}
					});

					
					return;
				}
				
			}
			
			function poip_set_visible_images_marketshop(images) {
			
				var shown_img = [];
				poipImageAdditional().find('a').each( function(){
				
					var current_href = $(this).attr('href');
					if ( (!current_href || current_href == '#') ) {
						if ($(this).attr('data-zoom-image')) {
							current_href = $(this).attr('data-zoom-image');
						} else {
							current_href = false;
						}
						if (current_href) {
							if ( $.inArray( current_href, images) != -1 && $.inArray( current_href, shown_img) == -1 ) {
								$(this).show();
								shown_img.push(current_href);
							} else {
								$(this).hide();
							}
						}
					}
        });
				
				<?php if(isset($marketshop_cloud_zoom_gallery) && $marketshop_cloud_zoom_gallery== 1) { ?>
					//////pass the images to swipebox
					
					var swipebox_images = [];
					
					$("#zoom_01").unbind("click");
					$("#zoom_01").bind("click", function(e) {
						
						// order like in gallery
						var ez_list =   $('#zoom_01').data('elevateZoom').getGalleryList();
						for (var i in ez_list) {
							if ( $.inArray(ez_list[i].href, shown_img) != -1 ) {
								swipebox_images.push(ez_list[i]);
							}
						}
						$.swipebox(swipebox_images);	
						
						//$.swipebox(ez.getGalleryList());
						return false;
					});
				<?php } ?>
			
			}
			
			function poip_set_visible_images_theme500(images) { // Cycling Equipment theme
			
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					//if ( $.inArray($(this).attr('data-image'), current_imgs) == -1) {
						current_imgs.push($(this).attr('data-image'));
					//}
				});
				
				if ( current_imgs.toString() == images.toString() ) {
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional">'+new_html+'</ul>');
				
				
				$('#image-additional').bxSlider({
					mode: 'vertical',
					pager: false,
					controls: true,
					slideMargin: 13,
					minSlides: 6,
					maxSlides: 6,
					slideWidth: 88,
					nextText: '<i class="fa fa-chevron-down"></i>',
					prevText: '<i class="fa fa-chevron-up"></i>',
					infiniteLoop: false,
					adaptiveHeight: true,
					moveSlides: 1
				});
				
				
				$('#image-additional').find('[data-image]').click(function (e) {
					e.preventDefault();
					var img = $(this).data('image');
					
					$('#gallery_zoom').attr('src', img);
					$('#gallery_zoom').attr('data-zoom-image', img);
					$('.zoomContainer .zoomWindowContainer div').css({"background-image": 'url("'+img+'")'});
					
						
				})
				
				$('#image-additional').find('a').mouseover(function(){
					poip_image_mouseover(this);
				});
				
			
			}
			
			function poip_set_visible_images_theme541(images) { // Eyewear theme
				
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					if ( $.inArray($(this).attr('data-image'), current_imgs) == -1) {
						current_imgs.push($(this).attr('data-image'));
					}
				});
				
				if ( current_imgs.toString() == images.toString() ) {
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional">'+new_html+'</ul>');
				
				
				$('#image-additional').bxSlider({
						mode: 'vertical',
						pager: false,
						controls: true,
						slideMargin: 13,
						minSlides: 5,
						maxSlides: 5,
						slideWidth: 88,
						nextText: '<i class="fa fa-chevron-down"></i>',
						prevText: '<i class="fa fa-chevron-up"></i>',
						infiniteLoop: false,
						adaptiveHeight: true,
						moveSlides: 1
				});
				
				
				$('#image-additional').find('[data-image]').click(function (e) {
						e.preventDefault();
						var img = $(this).data('image');
						$('#product-image').find('.inner img').each(function () {
								$(this).attr('src', img);
						})
				})
				
				$('#image-additional').find('a').mouseover(function(){
					poip_image_mouseover(this);
				});
				
			
			}
			
			function poip_set_visible_images_theme546(images) { // AudioGear theme
			
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					if ( $.inArray($(this).attr('data-image'), current_imgs) == -1) {
						current_imgs.push($(this).attr('data-image'));
					}
				});
				
				if ( current_imgs.toString() == images.toString() ) {
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional">'+new_html+'</ul>');
				
				
				$('#image-additional').bxSlider({
					mode:'vertical',
					pager:false,
					controls:true,
					slideMargin:13,
					minSlides: 5,
					maxSlides: 5,
					slideWidth:99,
					nextText: '<i class="fa fa-chevron-down"></i>',
					prevText: '<i class="fa fa-chevron-up"></i>',
					infiniteLoop:false,
					adaptiveHeight:true,
					moveSlides:1
				});
				
				/*
				$('#image-additional').find('[data-image]').click(function (e) {
						e.preventDefault();
						var img = $(this).data('image');
						$('#gallery_zoom').attr('src', img);
						$('#gallery_zoom').attr('data-zoom-image', img);
						//$('#product-image').find('.inner img').each(function () {
						//		$(this).attr('src', img);
						//})
				});
				*/
				// elevateZoom destroy
				$.removeData($("#gallery_zoom"), 'elevateZoom');
				$('.zoomContainer').remove();
				$("#gallery_zoom").elevateZoom({gallery:'image-additional', cursor: 'pointer',zoomType : 'inner', galleryActiveClass: 'active', imageCrossfade: true}); 
				
				$('#image-additional').find('a').mouseover(function(){
					poip_image_mouseover(this);
				});
				
			
			}
			
			function poip_set_visible_images_theme638(images) { // VIVA theme
			
				if ( !$('#poip_images').length ) {
					$('#default_gallery').before('<div id="poip_images" style="display:none;"></div>');
					poipImageAdditional().each(function(){
						$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				var current_imgs = [];
				poipImageAdditional().find('a').each( function(){
					current_imgs.push($(this).attr('data-image'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
					return; // nothing to change
				}
			
				var shown_imgs = [];
				var new_html = '';
				$('#poip_images').find('a').each( function(){
					
					if ( $.inArray( $(this).attr('data-image'), images) != -1 && $.inArray( $(this).attr('data-image'), shown_imgs) == -1) {
						new_html+= poip_outerHTML($(this).parent());
						shown_imgs.push($(this).attr('data-image'));
						
					}
					
				});
				
				$('#default_gallery div.image-thumb').html('<ul id="image-additional" class="image-additional">'+new_html+'</ul>');
				
				setTimeout( function () {
					$('#image-additional').bxSlider({
							mode: 'vertical',
							pager: false,
							controls: true,
							slideMargin: 13,
							minSlides: 4,
							maxSlides: 4,
							slideWidth: 88,
							nextText: '<i class="material-icons-expand_more"></i>',
							prevText: '<i class="material-icons-expand_less"></i>',
							infiniteLoop: false,
							adaptiveHeight: true,
							moveSlides: 1
					});
					
					
					/*
					// elevateZoom destroy
					$.removeData($("#gallery_zoom"), 'elevateZoom');
					$('.zoomContainer').remove();
					$("#gallery_zoom").elevateZoom({gallery:'image-additional', cursor: 'pointer',zoomType : 'inner', galleryActiveClass: 'active', imageCrossfade: true});
					*/
					
					var o = $('#image-additional');
					
					o.find('li:first-child a').addClass('active');
	
					$('#product-image').bind("click", function (e) {
						var imgArr = [];
						o.find('a').each(function () {
							img_src = $(this).data("image");
	
							//put the current image at the start
							if (img_src == $('#product-image').find('img').attr('src')) {
								imgArr.unshift({
									href: '' + img_src + '',
									title: $(this).find('img').attr("title")
								});
							}
							else {
								imgArr.push({
									href: '' + img_src + '',
									title: $(this).find('img').attr("title")
								});
							}
						});
						$.fancybox(imgArr);
						return false;
					});
	
	
					o.find('[data-image]').click(function (e) {
							e.preventDefault();
							o.find('.active').removeClass('active');
							var img = $(this).data('image');
							$(this).addClass('active');
							$('#product-image').find('.inner img').each(function () {
									$(this).attr('src', img);
							})
					});
					
					
					$('#image-additional').find('a').mouseover(function(){
						poip_image_mouseover(this);
					});
				}, 0);
			
			}
			
			function poip_set_visible_images_bt_claudine(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('#boss-image-additional-zoom').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#boss-image-additional-zoom').before('<div id="poip_images" style="display:none;"></div>');
						$('#boss-image-additional-zoom li').each(function(){
							$('#poip_images').append( poip_outerHTML($(this)) );
						});
					}
					
					if (!$('#boss-image-additional-zoom').data('_cfs_isCarousel')) {
						setTimeout(function(){ poip_set_visible_images_bt_claudine(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('#boss-image-additional-zoom').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
						return; // nothing to change
					}
					
					var elems_cnt = $('#boss-image-additional-zoom li').length;
					for (var i = 1; i<=elems_cnt; i++ ) {
						$('#boss-image-additional-zoom').trigger('removeItem', ['end']);
					}
					
					var shown_imgs = [];
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							$('#boss-image-additional-zoom').trigger('insertItem', [poip_outerHTML($(this).parent()), 'end']);
							shown_imgs.push( $(this).attr('href') );
						}
					});
					
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('#boss-image-additional-zoom li a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}
			
			}
			
			var poip_set_visible_images_timeout_id = false;
			
			function poip_set_visible_images_bt_comohos(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
			
				if ( $('#boss-image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#boss-image-additional').before('<div id="poip_images" style="display:none;"></div>');
						$('#boss-image-additional li').each(function(){
							$('#poip_images').append( poip_outerHTML($(this)) );
						});
					}
					
					if (!$('#boss-image-additional').data('_cfs_isCarousel') || !($('.cloud-zoom, .cloud-zoom-gallery').data('zoom'))) {
						poip_set_visible_images_timeout_id = setTimeout(function(){ poip_set_visible_images_bt_comohos(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('#boss-image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('href'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
						return; // nothing to change
					}
					
					
					var elems_cnt = $('#boss-image-additional li').length;
					for (var i = 1; i<=elems_cnt; i++ ) {
						$('#boss-image-additional').trigger('removeItem', ['end']);
					}
					
					var shown_imgs = [];
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							$('#boss-image-additional').trigger('insertItem', [poip_outerHTML($(this).parent()), 'end']);
							shown_imgs.push( $(this).attr('href') );
						}
					});
					
					$('#wrap div.mousetrap').remove();
					//CloudZoom.quickStart();
					//$('.cloud-zoom, .cloud-zoom-gallery').data('zoom').destroy();
					//$('.cloud-zoom, .cloud-zoom-gallery').removeData('zoom')
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					//$('#boss-image-additional .cloud-zoom, #boss-image-additional .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('#boss-image-additional li a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
					if ( $.fn.fancybox ) { // boss zoom
						var gallerylist = [];
						
						for (var i in shown_imgs) {
							if ( !shown_imgs.hasOwnProperty(i) ) continue;
							
							gallerylist.push({
								href: shown_imgs[i],
								title: "<?php echo $heading_title; ?>"
							});
							
						}
						
						$("#wrap").unbind('click');
						$("#wrap").bind('click',function(){    
							$.fancybox.open(gallerylist);
							return false;
						});
					}
					
					
				}
				
				poip_set_visible_images_timeout_id = false;
			
			}
			
			function poip_set_visible_images_OPC080183(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 100) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
				
				if ( !$('#poip_images').length ) {
					$('#carousel').before('<div id="poip_images" style="display:none;"></div>');
					var added_img = [];
					$('#carousel li').each(function(){
						if ( $.inArray($(this).find('img').attr('data-large'), added_img) == -1 ) {
							$('#poip_images').append( $(this).clone() );
							added_img.push($(this).find('img').attr('data-large'));
						}
					});
				}
				
				// second hidden list
				if ( !$('#poip_slider').length ) {
					$('#slider').before('<div id="poip_slider" style="display:none;"></div>');
					var added_img = [];
					$('#slider li').each(function(){
						if ( $.inArray($(this).find('a').attr('href'), added_img) == -1 ) {
							$('#poip_slider').append( $(this).clone() );
							added_img.push($(this).find('a').attr('href'));
						}
					});
				}
				
				if ( !$('#carousel .flex-viewport').length ) {
					setTimeout(function(){ poip_set_visible_images_OPC080183(images, counter+1); }, 100);
					return;
				}
					
				var current_imgs = [];
				$('#carousel').find('img').each( function(){
					current_imgs.push($(this).attr('data-large'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
					return; // nothing to change
				}
				
				var flexslider = $('#carousel').data('flexslider');
				var elems_cnt = flexslider.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider.removeSlide(i);
					$('#carousel .flex-viewport li:first').remove();
				}
				
				var flexslider2 = $('#slider').data('flexslider');
				var elems_cnt = flexslider2.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider2.removeSlide(i);
					$('#slider li:first').remove();
				}
				
				var shown_imgs = [];
				
				var html = '';
				var slides = [];
				
				$('#poip_images img').each(function(){
					if ( $.inArray($(this).attr('data-large'), images) != -1 && $.inArray($(this).attr('data-large'), shown_imgs) == -1 ) {
					
						html+= poip_outerHTML($(this).parent());
						flexslider.addSlide( $(this).parent().clone() );
						shown_imgs.push( $(this).attr('data-large') );
						
						if ( $('#poip_slider a[href="'+$(this).attr('data-large')+'"]').length ) {
							flexslider2.addSlide( '<li>'+poip_outerHTML($('#poip_slider a[href="'+$(this).attr('data-large')+'"]'))+'</li>' );
						}
					}
				});
				
				flexslider2.doMath();
				flexslider2.currentSlide = 1;
				$('#slider').flexslider(0);
				
				$('#carousel img').click(function(){
					var img = $(this).attr('data-large');
					var cnt = 0;
					$('#slider li a').each(function(){
						if ( $(this).attr('href') == img ) {
							return false;
						}
						cnt++
					});
					
					$('#slider').flexslider(cnt);
					
				});
				
				
				$.removeData($(".jqzoom"), 'elevateZoom');
				$('.zoomContainer').remove();
				
				var device_view = 'window';
				if(($(window).width()/$('.thumbnail  .img-responsive').width()) < 2 ) {
					device_view = 'inner';
				}
				var mmos_zoom_config = { 
					gallery: curent_id,
							cursor: 'pointer',
							imageCrossfade: true,
							zoomType: device_view,
							zoomWindowFadeIn: 500,
							zoomWindowFadeOut: 750,
					scrollZoom : true,
							responsive : true,
							zoomWindowWidth: 500 ,
							zoomWindowHeight: 500 ,
							borderSize : 0 ,
							borderColour : "#ffffff"
				};
				
				$("#slider li").css('z-index', 1);
				$("#slider li").css('opacity', 0);
				
				$("#slider .jqzoom").elevateZoom(mmos_zoom_config);
				
				$("#slider a[rel^='prettyPhoto']").prettyPhoto({
					animation_speed: 'normal',
					slideshow: 5000 ,
					autoplay_slideshow: 1 ,
					opacity: 0.8 ,
					show_title: 1 ,
					allow_resize: 1 ,
					default_width: 800 ,
					default_height: 927 ,
					counter_separator_label: '/',
					theme: 'light_rounded',
					modal: false,
					overlay_gallery: true,
				}); 
		
				poip_set_visible_images_timeout_id = false;
				
				if (poip_settings['img_hover']) {
					$("#carousel li img").mouseover(function(){
						$(this).click();
					});
				}
				
			}
			
			function poip_set_visible_images_OPC080184(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 100) {
					poip_set_visible_images_timeout_id = false;
					return;
				}
				
				if ( !$('#poip_images').length ) {
					$('#carousel').before('<div id="poip_images" style="display:none;"></div>');
					var added_img = [];
					$('#carousel li').each(function(){
						if ( $.inArray($(this).find('img').attr('data-large'), added_img) == -1 ) {
							$('#poip_images').append( $(this).clone() );
							added_img.push($(this).find('img').attr('data-large'));
						}
					});
				}
				
				// second hidden list
				if ( !$('#poip_slider').length ) {
					$('#slider').before('<div id="poip_slider" style="display:none;"></div>');
					var added_img = [];
					$('#slider li').each(function(){
						if ( $.inArray($(this).find('a').attr('href'), added_img) == -1 ) {
							$('#poip_slider').append( $(this).clone() );
							added_img.push($(this).find('a').attr('href'));
						}
					});
				}
				
				if ( !$('#carousel .flex-viewport').length ) {
					setTimeout(function(){ poip_set_visible_images_OPC080184(images, counter+1); }, 100);
					return;
				}
					
				var current_imgs = [];
				$('#carousel').find('img').each( function(){
					current_imgs.push($(this).attr('data-large'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
					return; // nothing to change
				}
				
				var flexslider = $('#carousel').data('flexslider');
				var elems_cnt = flexslider.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider.removeSlide(i);
					$('#carousel .flex-viewport li:first').remove();
				}
				
				var flexslider2 = $('#slider').data('flexslider');
				var elems_cnt = flexslider2.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider2.removeSlide(i);
					$('#slider li:first').remove();
				}
				
				var shown_imgs = [];
				
				var html = '';
				var slides = [];
				
				$('#poip_images img').each(function(){
					if ( $.inArray($(this).attr('data-large'), images) != -1 && $.inArray($(this).attr('data-large'), shown_imgs) == -1 ) {
					
						html+= poip_outerHTML($(this).parent());
						flexslider.addSlide( $(this).parent().clone() );
						shown_imgs.push( $(this).attr('data-large') );
						
						if ( $('#poip_slider a[href="'+$(this).attr('data-large')+'"]').length ) {
							flexslider2.addSlide( '<li>'+poip_outerHTML($('#poip_slider a[href="'+$(this).attr('data-large')+'"]'))+'</li>' );
						}
					}
				});
				
				flexslider2.doMath();
				flexslider2.currentSlide = 1;
				$('#slider').flexslider(0);
				
				$('#carousel img').click(function(){
					var img = $(this).attr('data-large');
					var cnt = 0;
					$('#slider li a').each(function(){
						if ( $(this).attr('href') == img ) {
							return false;
						}
						cnt++
					});
					
					$('#slider').flexslider(cnt);
					
				});
				
				
				$.removeData($(".jqzoom"), 'elevateZoom');
				$('.zoomContainer').remove();
				
				var device_view = 'window';
				if(($(window).width()/$('.thumbnail  .img-responsive').width()) < 2 ) {
					device_view = 'inner';
				}
				var mmos_zoom_config = { 
					gallery: curent_id,
							cursor: 'pointer',
							imageCrossfade: true,
							zoomType: device_view,
							zoomWindowFadeIn: 500,
							zoomWindowFadeOut: 750,
					scrollZoom : true,
							responsive : true,
							zoomWindowWidth: 500 ,
							zoomWindowHeight: 500 ,
							borderSize : 0 ,
							borderColour : "#ffffff"
				};
				$("#slider .jqzoom").elevateZoom(mmos_zoom_config);
				
				$("#slider a[rel^='prettyPhoto']").prettyPhoto({
					animation_speed: 'normal',
					slideshow: 5000 ,
					autoplay_slideshow: 1 ,
					opacity: 0.8 ,
					show_title: 0 ,
					allow_resize: 1 ,
					default_width: 600 ,
					default_height: 800 ,
					counter_separator_label: '/',
					theme: 'light_rounded',
					modal: false,
					overlay_gallery: true,
				}); 
		
				//$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
				poip_set_visible_images_timeout_id = false;
				
			}
			
			function poip_set_visible_images_maxstore(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
				
				if ( !$('#poip_images').length ) {
					$('div.image-additional').before('<div id="poip_images" style="display:none;"></div>');
					$('div.image-additional li').each(function(){
						$('#poip_images').append( $(this).clone() );
						//$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				if ( !$('div.image-additional .flex-viewport').length ) {
					setTimeout(function(){ poip_set_visible_images_maxstore(images, counter+1); }, 100);
					return;
				}
				
				var current_imgs = [];
				$('div.image-additional').find('a').each( function(){
					current_imgs.push($(this).attr('href'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
					return; // nothing to change
				}
				
				
				var flexslider = $('.image-additional').data('flexslider');
				
				var elems_cnt = flexslider.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider.removeSlide(i);
					$('div.image-additional .flex-viewport li:first').remove();
				}
				
				var shown_imgs = [];
				$('#poip_images a').each(function(){
				
					if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
						flexslider.addSlide( $(this).parent().clone() );
						//flexslider.addSlide( poip_outerHTML($(this).parent()) );
						
						shown_imgs.push( $(this).attr('href') );
					}
				});
				
				$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
				
			}
			
			function poip_set_visible_images_allure(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
				
				if ( !$('#poip_images').length ) {
					$('div.image-additional').before('<div id="poip_images" style="display:none;"></div>');
					$('div.image-additional li').each(function(){
						$('#poip_images').append( $(this).clone() );
						//$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				if ( !$('div.image-additional .flex-viewport').length ) {
					setTimeout(function(){ poip_set_visible_images_allure(images, counter+1); }, 100);
					return;
				}
					
				var current_imgs = [];
				$('div.image-additional').find('a').each( function(){
					current_imgs.push($(this).attr('href'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
					return; // nothing to change
				}
				
				
				var flexslider = $('.image-additional').data('flexslider');
				
				var elems_cnt = flexslider.count;
				for (var i = 0; i<elems_cnt; i++ ) {
					flexslider.removeSlide(i);
					$('div.image-additional .flex-viewport li:first').remove();
				}
				
				var shown_imgs = [];
				$('#poip_images a').each(function(){
					if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
						flexslider.addSlide( $(this).parent().clone() );
						//flexslider.addSlide( poip_outerHTML($(this).parent()) );
						shown_imgs.push( $(this).attr('href') );
					}
				});
				
				$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
				
			}
			
			function poip_set_visible_images_buyshop(images, counter) {
				
				if (!counter) counter = 1;
				if (counter == 50) return;
				
				if ( !$('#poip_images').length ) {
					$('div.product-more-views').before('<div id="poip_images" style="display:none;"></div>');
					$('div.product-more-views li').each(function(){
						$('#poip_images').append( $(this).clone() );
						//$('#poip_images').append( poip_outerHTML($(this)) );
					});
				}
				
				if ( !$('div.jcarousel-container').length ) {
					setTimeout(function(){ poip_set_visible_images_buyshop(images, counter+1); }, 100);
					return;
				}
				
				var current_imgs = [];
				$('div.product-more-views ul li').find('img').each( function(){
					current_imgs.push($(this).attr('src'));
				});
				
				if ( current_imgs.toString() == images.toString() ) {
					return; // nothing to change
				}
				
				
				$('div.product-more-views').html('<ul class="jcarousel jcarousel-skin-previews"></ul>');
				
				var shown_imgs = [];
				$('#poip_images img').each(function(){
					if ( $.inArray($(this).attr('src'), images) != -1 && $.inArray($(this).attr('src'), shown_imgs) == -1 ) {
						$('div.product-more-views ul').append( $(this).parent().clone() );
						shown_imgs.push( $(this).attr('src') );
					}
				});
				
				var elevateZoom = $(".elevate-zoom img.elevatezoom");
				var imageCloudZoom = $('.product-image img.cloudzoom');
				
				if (elevateZoom.length) {
					var PreviewSliderHeight = function () {
						var big_image_height = elevateZoom.height();
						var preview_image_height = $(".elevate-gallery").find('li:first-child').height();
						var slider_height = Math.round(big_image_height / preview_image_height) * preview_image_height;
						$(".jcarousel-skin-previews").find('.jcarousel-clip-vertical').css({
								"min-height": slider_height + "px"
						});
					};
				} else if (imageCloudZoom.length) {
				
					var cloudGalleryOuter = $('.product-more-views:not(.elevate-gallery) ul');
				
					var PreviewSliderHeight = function () {
            var big_image_height = imageCloudZoom.height();
            var preview_image_height = cloudGalleryOuter.find('li:first-child').height();
            var slider_height = Math.round(big_image_height / preview_image_height) * preview_image_height;
            //console.log(big_image_height);
            //console.log(slider_height);
            $(".jcarousel-skin-previews").find('.jcarousel-clip-vertical').css({
                "min-height": slider_height + "px"
            });
					};
				}
				
				if (PreviewSliderHeight) {
				
					$('div.product-more-views ul').jcarousel({
						vertical: true,
						scroll: 3,
						buttonNextHTML: '<a class="btn"><i class="icon-up"></i></a>',
						buttonPrevHTML: '<a class="btn"><i class="icon-down"></i></a>',
						itemLoadCallback: PreviewSliderHeight
					});
					
					if ($('.cloudzoom-gallery').length) {
						$('.cloudzoom-gallery').CloudZoom();
					}
					
				}
				
				if (poip_settings['img_hover']) {
					$('div.product-more-views ul li img').mouseover(function(){
						poip_image_mouseover(this);
					});
				}
			}
			
			
			function poip_set_visible_images_art(images_param, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('#content .wrapper').length ) {
				
					// for thumbs
					if ( !$('#poip_images').length ) {
						var added_imgs = [];
						$('#content .wrapper').before('<div id="poip_images" style="display:none;"></div>');
						$('#content .wrapper img').each(function(){
						
							if ( $.inArray($(this).attr('src'), added_imgs) == -1 ) {
								$('#poip_images').append( $(this).clone() );
								added_imgs.push( $(this).attr('src') );
							}
						});
					}
					
					// for hidden big images
					if ( !$('#poip_images_zoom').length ) {
						var added_imgs = [];
						$('#content .single-product').before('<div id="poip_images_zoom" style="display:none;"></div>');
						$('#content .single-product img').each(function(){
						
							if ( $.inArray($(this).attr('src'), added_imgs) == -1 ) {
								$('#poip_images_zoom').append( $(this).clone() );
								added_imgs.push( $(this).attr('src') );
							}
						});
					}
					
					
					if ( !$('#content .wrapper .slick-list').length) {
						setTimeout(function(){
							poip_set_visible_images_art(images_param, counter+1); }
						, 100);
						return;
					}
					
					var images = []; // art theme uses thumbs
					
					for (var i in images_param) { // save original order
						if ( !images_param.hasOwnProperty(i) ) continue;
						
						for (var j in poip_images) {
							if ( !poip_images.hasOwnProperty(j) ) continue;
							
							if ( poip_images[j]['popup'] == images_param[i] ) {
								images.push(poip_images[j]['thumb']);
								break;
							}
						}
					}
					
					var current_imgs = [];
					$('#content .wrapper').find('img').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('src'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
						return; // nothing to change
					}
					
					// << change thumbs carousel
					
					var elems_cnt = $('#content .wrapper img').length;
					for (var i = 1; i<=elems_cnt; i++ ) {
						$('#content .wrapper .slick-slider').slick('removeSlide',0);
					}
					
					var shown_imgs = [];
					for (var i in images) {
						if ( !images.hasOwnProperty(i) ) continue;
					
						$('#poip_images img').each(function(){
							if ( $(this).attr('src') == images[i] && $.inArray($(this).attr('src'), shown_imgs) == -1 ) {
								$('#content .wrapper .slick-slider').slick('addSlide', '<div class="carousel-item">'+poip_outerHTML($(this))+'</div>' );
								shown_imgs.push( $(this).attr('src') );
								return false;
							}
						});
					}
					
					// >> change thumbs carousel
					
					
					// << change hidded zoom images carousel
					
					var elems_cnt = $('#content .single-product img').length;
					for (var i = 1; i<=elems_cnt; i++ ) {
						$('#content .single-product').slick('removeSlide',0);
					}
					
					var shown_imgs = [];
					for (var i in images) {
						if ( !images.hasOwnProperty(i) ) continue;
					
						$('#poip_images_zoom img').each(function(){
						
							if ( $(this).attr('src') == images[i] && $.inArray($(this).attr('src'), shown_imgs) == -1 ) {
								$('#content .single-product').slick('addSlide', '<div class="carousel-item">'+poip_outerHTML($(this))+'</div>' );
								
								shown_imgs.push( $(this).attr('src') );
								return false;
							}
						});
					}
					
					// >> change hidded zoom images carousel
					
					CloudZoom.quickStart();
					
					/*
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('#boss-image-additional-zoom li a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					*/
					
				}
			
			}
			
			function poip_set_visible_images_tt_petsyshop(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('.image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('.image-additional').before('<div id="poip_images" style="display:none;"></div>');
						$('.image-additional a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('.image-additional.owl-carousel').data('owlCarousel');
					
					if (!current_carousel || !$('.image-additional.owl-carousel .owl-item').length || !$('.zoomContainer').length ) {
						setTimeout(function(){ poip_set_visible_images_tt_petsyshop(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('data-zoom-image'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
						return; // nothing to change
					}
					
					
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('data-zoom-image'), images) != -1 && $.inArray($(this).attr('data-zoom-image'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('data-zoom-image') );
							
						}
					});
					
					current_carousel.addItem(html);
					current_carousel.reinit();
					
					// elevateZoom destroy
					$.removeData($(".thumbnails-image img"), 'elevateZoom');
					$('.zoomContainer').remove();
					$(".thumbnails-image img").elevateZoom({
						zoomType : "inner",
						cursor: "crosshair",
						gallery:'gallery_01', 
						cursor: 'crosshair', 
						galleryActiveClass: "active", 
						imageCrossfade: true,
					});
					
					//$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('.image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}
				
			}
			
			function poip_set_visible_images_tt_optima_(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('.image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('.image-additional').before('<div id="poip_images" style="display:none;"></div>');
						$('.image-additional a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('.image-additional.owl-carousel').data('owlCarousel');
					
					if (!current_carousel || !$('.image-additional.owl-carousel .owl-item').length || !$('.zoomContainer').length ) {
						setTimeout(function(){ poip_set_visible_images_tt_optima_(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('data-zoom-image'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
						return; // nothing to change
					}
					
					
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('data-zoom-image'), images) != -1 && $.inArray($(this).attr('data-zoom-image'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('data-zoom-image') );
							
						}
					});
					
					current_carousel.addItem(html);
					current_carousel.reinit();
					
					// elevateZoom destroy
					$.removeData($(".thumbnails-image img"), 'elevateZoom');
					$('.zoomContainer').remove();
					$(".thumbnails-image img").elevateZoom({
						zoomType : "window",
						cursor: "crosshair",
						gallery:'gallery_01', 
						cursor: 'crosshair', 
						galleryActiveClass: "active", 
						imageCrossfade: true,
						zoomWindowFadeIn: 500, 
						zoomWindowFadeOut: 500, 
						lensFadeIn: 500, 
						lensFadeOut: 500,
						zoomWindowHeight: 350,
						zoomWindowWidth: 350,
						borderSize: 1,
					});
					
					if (poip_settings['img_hover']) {
						$('.image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}
				
			}
			
			function poip_set_visible_images_tt_greek_(images, counter) {
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('.image-additional').length ) {
					
					if ( !$('#poip_images').length ) {
						$('.image-additional').before('<div id="poip_images" style="display:none;"></div>');
						$('.image-additional a').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('.image-additional.owl-carousel').data('owlCarousel');
					
					if (!current_carousel || !$('.image-additional.owl-carousel .owl-item').length || !$('.zoomContainer').length ) {
						setTimeout(function(){ poip_set_visible_images_tt_greek_(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('.image-additional').find('a').each( function(){
						//if ( $.inArray($(this).attr('href'), current_imgs) == -1) {
							current_imgs.push($(this).attr('data-zoom-image'));
						//}
					});
					
					if ( current_imgs.toString() == images.toString() ) {
						return; // nothing to change
					}
					
					
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					
					//$('.image-additional.owl-carousel .owl-wrapper').html('');
					//current_carousel.reinit();
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('data-zoom-image'), images) != -1 && $.inArray($(this).attr('data-zoom-image'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('data-zoom-image') );
							
						}
					});
					
					current_carousel.addItem(html);
					current_carousel.reinit();
					
					// elevateZoom destroy
					$.removeData($(".thumbnails-image img"), 'elevateZoom');
					$('.zoomContainer').remove();
					 $(".thumbnails-image img").elevateZoom({
						zoomType : "window",
						cursor: "crosshair",
						gallery:'gallery_01', 
						cursor: 'crosshair', 
						galleryActiveClass: "active", 
						imageCrossfade: true,
						zoomWindowFadeIn: 500, 
						zoomWindowFadeOut: 500, 
						lensFadeIn: 500, 
						lensFadeOut: 500,
						zoomWindowHeight: 350,
						zoomWindowWidth: 350,
						borderSize: 1,
					});
					
					//$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					
					if (poip_settings['img_hover']) {
						$('.image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
				}
				
			}
			
			function poip_set_visible_images_sebian(images, counter) { // by Novaworks
			
				if (!counter) counter = 1;
				if (counter == 50) return;
			
				if ( $('#image-additional-carousel').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#image-additional-carousel').before('<div id="poip_images" style="display:none;"></div>');
						$('#image-additional-carousel li.image-additional').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('#image-additional-carousel').data('owlCarousel');
					
					if (!current_carousel || !$('#image-additional-carousel .owl-item').length ) {
						setTimeout(function(){ poip_set_visible_images_sebian(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('#image-additional-carousel li.image-additional a').each( function(){
						current_imgs.push($(this).attr('href'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
						return; // nothing to change
					}
					
					// old version of owlCarousel used, only complete carousel replacing will work
					/*
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					*/
				
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += poip_outerHTML($(this).parent());
							//html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('href') );
							
						}
					});
					
					$('#image-additional-carousel').replaceWith('<div id="image-additional-carousel">'+html+'</div>');
					
					//$('#zoom1').replaceWith( poip_outerHTML($('#zoom1')) );
					
					if ( $('#zoom1').data('zoom') ) {
						$('#zoom1').data('zoom').destroy();
						$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					}
					
					$("#image-additional-carousel").owlCarousel({
						items : 5, //10 items above 1000px browser width
						itemsDesktop : [1000,4], //5 items between 1000px and 901px
						itemsDesktopSmall : [900,4], // 3 items betweem 900px and 601px
						itemsTablet: [600,3], //2 items between 600 and 0;
						itemsMobile : [320,1],
						navigation : true,
						pagination : false,
						slideSpeed : 600,
						navigationText : ["<i class=\"fa fa-angle-left\"></i>","<i class=\"fa fa-angle-right\"></i>"],
					});	
					
					/*
					current_carousel.addItem(html);
					current_carousel.reinit();
					*/
					
					if (poip_settings['img_hover']) {
						$('#image-additional-carousel .image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					
					
				} else if ( $('#image-additional-carousel-quickview').length ) {
					
					if ( !$('#poip_images').length ) {
						$('#image-additional-carousel-quickview').before('<div id="poip_images" style="display:none;"></div>');
						$('#image-additional-carousel-quickview li.image-additional').each(function(){
							$('#poip_images').append( $(this).clone() );
						});
					}
					
					var current_carousel = $('#image-additional-carousel-quickview').data('owlCarousel');
					
					if (!current_carousel || !$('#image-additional-carousel-quickview .owl-item').length ) {
						setTimeout(function(){ poip_set_visible_images_sebian(images, counter+1); }, 100);
						return;
					}
					
					var current_imgs = [];
					$('#image-additional-carousel-quickview li.image-additional a').each( function(){
						current_imgs.push($(this).attr('href'));
					});
					
					if ( current_imgs.toString() == images.toString() ) {
						return; // nothing to change
					}
					
					// old version of owlCarousel used, only complete carousel replacing will work
					
					
					/*
					var elems_cnt = current_carousel.itemsAmount;
					for (var i = 1; i<=elems_cnt; i++ ) {
						current_carousel.removeItem();
					}
					*/
				
					
					var shown_imgs = [];
					
					html = '';
					$('#poip_images a').each(function(){
						if ( $.inArray($(this).attr('href'), images) != -1 && $.inArray($(this).attr('href'), shown_imgs) == -1 ) {
							
							//current_carousel.addItem('<div>'+ poip_outerHTML($(this)) +'</div>');
							html += poip_outerHTML($(this).parent());
							//html += '<div>'+ poip_outerHTML($(this)) +'</div>';
							//html += ''+ poip_outerHTML($(this)) +'';
							
							shown_imgs.push( $(this).attr('href') );
							
						}
					});
					
					$('#image-additional-carousel-quickview').replaceWith('<div id="image-additional-carousel-quickview">'+html+'</div>');
					
					//$('#zoom1').replaceWith( poip_outerHTML($('#zoom1')) );
					
					/*
					if ( $('#zoom1').data('zoom') ) {
						$('#zoom1').data('zoom').destroy();
						$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
					}
					*/
					
					$("#image-additional-carousel-quickview").owlCarousel({
						items : 1,
						itemsDesktop : [1199,1],
						itemsDesktopSmall : [979,1],
						itemsTablet: [600,1], //2 items between 600 and 0;
						itemsMobile : [320,1],
						slideSpeed : 300,
						paginationSpeed : 300 
					});	
					
					/*
					current_carousel.addItem(html);
					current_carousel.reinit();
					*/
					
					/*
					if (poip_settings['img_hover']) {
						$('#image-additional-carousel-quickview .image-additional a').mouseover(function(){
							poip_image_mouseover(this);
						}); 
					}
					*/
					
				}
				
				
			}
			
      
      function poip_set_visible_images(images_param) {
			
				var images = poip_sort_images_by_selected_options(images_param);
				
				if (poip_theme_name == 'sebian') {
					poip_set_visible_images_sebian(images);
					return;
				}
				
				if (poip_theme_name == 'marketshop') {
					poip_set_visible_images_marketshop(images);
					return;
				}
				
				if (poip_theme_name == 'tt_petsyshop') {
					poip_set_visible_images_tt_petsyshop(images);
					return;
				}
				
				if (poip_theme_name.substr(0, 10) == 'tt_optima_') {
					poip_set_visible_images_tt_optima_(images);
					return;
				}
				
				if (poip_theme_name.substr(0, 9) == 'tt_greek_') {
					poip_set_visible_images_tt_greek_(images);
					return;
				}
				
				if (poip_theme_name == 'buyshop') {
					poip_set_visible_images_buyshop(images);
					return;
				}
				
				if (poip_theme_name == 'OPC080183') { // Optimal
					poip_set_visible_images_OPC080183(images);
					return;
				}
				
				if (poip_theme_name == 'OPC080184') { // Kids Market
					poip_set_visible_images_OPC080184(images);
					return;
				}
				
				if (poip_theme_name == 'theme500') { // Cycling Equipment
					poip_set_visible_images_theme500(images);
					return;
				}
				
				if (poip_theme_name == 'theme541') { // Eyewear
					poip_set_visible_images_theme541(images);
					return;
				}
				
				if (poip_theme_name == 'theme546') { // 
					poip_set_visible_images_theme546(images);
					return;
				}
				
				if (poip_theme_name == 'theme638') { // Eyewear
					poip_set_visible_images_theme638(images);
					return;
				}
				
				if (poip_theme_name == 'art') {
					poip_set_visible_images_art(images);
					return;
				}
				
				if (poip_theme_name == 'bt_claudine' || poip_theme_name == 'ntl') { // bt_claudine
					poip_set_visible_images_bt_claudine(images);
					return;
				}
				
				if (poip_theme_name == 'bt_comohos' ) { 
					poip_set_visible_images_bt_comohos(images);
					return;
				}
				
				if (poip_theme_name == 'allure') { 
					poip_set_visible_images_allure(images);
					return;
				}
				
				if (poip_theme_name == 'maxstore') { 
					poip_set_visible_images_maxstore(images);
					return;
				}
				
				// << DEFAULT OC 2.0 STYLE
				
				if ( $('li.image-additional').length || poip_theme_name == 'coloring' ) { // OC 2.0 default
					var shown_img = [];
					poipImageAdditional().find('a').each( function(){
						// Учтем возможность спец символов типа пробела %20
						if ( $.inArray( $(this).attr('href'), images) != -1 && $.inArray( $(this).attr('href'), shown_img) == -1) {
							$(this).show();
							shown_img.push($(this).attr('href'));
						} else {
							$(this).hide();
						}
					});
					
					return;
				}
				// >> DEFAULT OC 2.0 STYLE
				
				if (poip_theme_name == 'pavilion') {
					poip_set_visible_images_pavilion(images);
				}
				
				if (poip_theme_name == 'eagency') {
					poip_set_visible_images_eagency(images);
				}
				
        
				// << theme 422 compatibility
				if ($('div[class=image-additional]').find('ul[id=image-additional]').length) {
				
					// make inages list copy
					if ( !$('#image-additional-copy').length ) {
						$('div[class=image-additional]').after("<div id=\"image-additional-copy\" style=\"display: none;\">"+$('div[class=image-additional]').find('ul[id=image-additional]').html()+"</div>");
					}
					
					// check is image list update needed
					var new_html = '';
					var new_images = [];
					$('#image-additional-copy').find('a').each( function(){
						if ($.inArray( $(this).attr('data-image'), images) != -1 || $.inArray(decodeURIComponent($(this).attr('data-image')), images) != -1) {
							// anchors have parents = "li"
							new_html += "<li>"+$(this).parent().html()+"</li>";
							new_images.push($(this).attr('data-image'));
						}
						//else {
						//	$(this).hide();
						//}
					});
					
					// there may be double images, so make groupping
					var images_changed = $('#image-additional').find('a').length != new_images.length;
					var same_images_count = 0;
					if (!images_changed) {
						$('#image-additional').find('a').each( function(){
							if ($.inArray( $(this).attr('data-image'), images) != -1 || $.inArray(decodeURIComponent($(this).attr('data-image')), images) != -1) {
								same_images_count++;
							}
						});
						images_changed = same_images_count != new_images.length;
					}
					
					if (images_changed) {	
						
						$('div[class=image-additional]').html("<ul id=\"image-additional\">"+new_html+"</ul>");
						
						if ($('#image-additional').find('a').length) {
							setTimeout( function () {
								$('#image-additional').bxSlider({
									pager:false,
									controls:true,
									slideMargin:10,
									minSlides: 3,
									maxSlides: 3,
									slideWidth:70,
									infiniteLoop:false,
									moveSlides:1
								});
								
								$("#zoom_01").elevateZoom({gallery:'image-additional', cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true}); 
								//pass the images to Fancybox
								$("#zoom_01").bind("click", function(e) {  
									var ez =   $('#zoom_01').data('elevateZoom');	
									$.fancybox(ez.getGalleryList());
									return false;
								});
								
							}, 0);
						}
					}
					return;
				}
				// >> theme 422 compatibility
				
				// journal2 compatibility
				// if carousel journal2 -
				// first time - copy all to hidden div
				// second time - fill all from hidden div
				<?php if (isset($poip_theme_name)
					&& ($poip_theme_name == 'journal2' || $poip_theme_name == 'cosyone' || $poip_theme_name == 'ava_store' || $poip_theme_name == 'mattimeo')) { ?>
				
					if (poip_theme_name == 'journal2') {
						var block_gallery = $("#product-gallery");
					} else if (poip_theme_name == 'ava_store') { 
						var block_gallery = $("#gallery div.owl-carousel");
					} else if (poip_theme_name == 'mattimeo') { 
						var block_gallery = $("#add-gallery");	
					} else { // cosyone
						var block_gallery = $("ul.image_carousel");
					}
				
					// first time - copy all images to hidden element
					if ( !$('#hidden-carousel').length ) {
						block_gallery.after("<div style='display:none' id='hidden-carousel'></div>");
						poipImageAdditional().find('a').each( function(){
							$('#hidden-carousel').append( poip_outerHTML($(this)) );
							//$('#hidden-carousel').append( poip_outerHTML($(this).parent()) );
						});
					}
					
					// add visible images to carousel
					var pg_html = "";
					var pg_added = [];
					$('#hidden-carousel').find('a').each( function(){
						
						var img_href = $(this).attr('href');
						if (poip_theme_name == 'mattimeo') {
							if ( (img_href == '#' || !img_href) && $(this).attr('data-zoom-image') ) img_href = $(this).attr('data-zoom-image');
						} else {
							if ( (img_href == '#' || !img_href) && $(this).attr('data-image') ) img_href = $(this).attr('data-image');
						}
						
						if ($.inArray( img_href, images) != -1 || $.inArray(decodeURIComponent(img_href), images) != -1) {
							if ($.inArray(img_href, pg_added) == -1) { // to not have double images
								// show
								pg_html = pg_html + poip_outerHTML($(this));
								pg_added.push(img_href);
								//pg_html = pg_html + poip_outerHTML($(this).parent());
							}
						}
					});
					
					
					
					// when carousel for additional images is turned on
					if (block_gallery.data('owlCarousel')) {
						var pg_opts = block_gallery.data('owlCarousel').options;
					}
					
					if (pg_html != block_gallery.html()) {
						block_gallery.html(pg_html);
						
						// when carousel for additional images is turned on
						if (block_gallery.data('owlCarousel')) {
							block_gallery.data('owlCarousel').reinit(pg_opts);
							
							<?php if (isset($poip_theme_name) && $poip_theme_name == "journal2" && isset($poip_journal2_settings)
								&& ($poip_journal2_settings['product_page_gallery_carousel_arrows'] == 'hover' || $poip_journal2_settings['product_page_gallery_carousel_arrows'] == 'always')): ?>
							block_gallery.find('.owl-buttons').addClass('side-buttons');
							<?php endif; ?>
						}
						
						// journal2 may use other gallery instead of colorbox
						<?php if (isset($poip_theme_name) && $poip_theme_name == "journal2") {
							if (isset($poip_journal2_settings) && $poip_journal2_settings['product_page_gallery'] === '1') { ?>
								var ig_added = [];
								
								// not used in quickview
								if (typeof(poip_journal2_quickview) == 'undefined' || !poip_journal2_quickview) {
								
									$('.product-info .image-gallery a').each(function(){
										// spec symbols like space %20
										
										if (($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) && $.inArray(this.href, ig_added) == -1) {
											// show
											$(this).attr('rel', 'poip-visible');
											//$(this).addClass('swipebox');
											ig_added.push(this.href);
										} else { // hide
											$(this).attr('rel', '');
											//$(this).removeClass('swipebox');
											//$(this).hide();
										}
										
									});
									
									// original click event in journal2 places later. fix it with mouseover
									$('.gallery-text').off('mousedown');
									$('.gallery-text').on('mousedown', function() {
										$('.gallery-text').off('click');
										$('.gallery-text').on('click', function () {
											if ( !$('#swipebox-overlay').length ) {
												$('.product-info .image-gallery a.swipebox[rel=poip-visible][href="'+$('#image').parent().attr('href')+'"]').first().click();
												return false;
											}
										});
									});
								}
							<?php } ?>
							
							/* additional images click */
							$('.product-info .image-additional a').click(function (e) {
									e.preventDefault();
									var thumb = $(this).find('img').attr('src');
									var image = $(this).attr('href');
									Journal.changeProductImage(thumb, image);
									return false;
							});
							
							//images_to_mouseover();
							if (poip_settings['img_hover']) {
								$('div.image-additional').find('a').mouseover(function(){
									poip_image_mouseover(this);
								});
							}
							
						<?php } ?>
						
						<?php if (isset($poip_theme_name) && $poip_theme_name == 'cosyone') { ?>
							$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
							
							//$(".cloud-zoom-gallery").last().removeClass("cboxElement");
						
							$(".cloud-zoom-gallery").click(function() {
								$("#zoom-btn").attr('href', $(this).attr('href'));
								$("#zoom-btn").attr('title', $(this).attr('title'));
							
							});
							
						<?php } ?>
						
						<?php if (isset($poip_theme_name) && $poip_theme_name == 'mattimeo' && $poip_mattimeo_settings['product_zoom'] == '1') { ?> // опциональная галерея вместо колорбокса
							
							$('.left .image').html($('.left .image').html());
							
							$('.image-additional a').click(function(){ 
								$('.image-additional a').removeClass('active');
								$(this).addClass('active'); // some calls changed, whats why one div should be deleted from carousel
								$('.product-info .image img').attr('src', $(this).attr('data-image'));
							});
							$('.image-additional a:first').addClass('active');
							// zoom
							// elevateZoom destroy
							$.removeData($("#main-image"), 'elevateZoom');
							$('.zoomContainer').remove();
							$("#main-image").elevateZoom({
								gallery:'add-gallery',  
								galleryActiveClass: 'active',
								zoomType: "inner",
								cursor: "pointer"
							});
							
							
							var mattimeo_data_index = 0;
							$('.image-additional a').each(function(){
								$(this).attr('data-index',mattimeo_data_index);
								mattimeo_data_index++;
							});
							
							
							var popupSettings = {items: []
																	,gallery: { enabled: true, preload: [0,2] }
																	,type: 'image'
																	,mainClass: 'mfp-fade'
																	};
							if ($('.image-additional div a').length) {
								popupSettings['callbacks'] = {
									open: function() {
										var activeIndex = parseInt($('.image-additional a.active').attr('data-index'));
										var magnificPopup = $.magnificPopup.instance;
										magnificPopup.goTo(activeIndex);
									}
								};
								
								$('.image-additional div a').each(function(){
									popupSettings['items'].push({src: $(this).attr('data-zoom-image')});
								});
								
							}
							
							$('.left .image a').magnificPopup(popupSettings);
							
						<?php } ?>
						
						<?php if (isset($poip_theme_name) && $poip_theme_name == 'ava_store') { ?>
								
							// elevateZoom destroy
							$.removeData($("#zoom"), 'elevateZoom');
							$('.zoomContainer').remove();
							
							$("#zoom").elevateZoom({
								gallery:'gallery',
								zoomType: "inner",
								cursor: "crosshair",
								galleryActiveClass: 'active',
								imageCrossfade: true,
								zoomWindowFadeIn: 500,
								zoomWindowFadeOut: 750,
								loadingIcon: 'catalog/view/theme/default/image/loader.gif'
							});
							
						<?php } ?>
						
						
						
					}
					
					return;
					
				<?php } ?>
				
				<?php
				// << pav fashion theme compatibility
				if (isset($poip_theme_name) && ($poip_theme_name == 'pav_fashion' || $poip_theme_name == 'pav_styleshop' || $poip_theme_name == 'megashop'
				|| $poip_theme_name == 'lexus_shopping' || $poip_theme_name == 'pav_sportshop' )) { ?>
					
					// first time - copy all images to hidden element
					if ( !$('#hidden-carousel').length ) {
					
						// count elements per item
						var images_per_item = Math.max(3, $('#image-additional').find('.item').first().find('a').length);
						
						$("#image-additional").after("<div style='display:none' id='hidden-carousel' images_per_item='"+images_per_item+"'></div>");
						
						$('#image-additional-carousel').find('a').each( function(){
							$('#hidden-carousel').append( poip_outerHTML($(this)) );
						});
					};
						
					// add visible images to carousel
					var pg_html = "";
					var pg_added = [];
					var anchors_cnt = 0;
					var images_per_item = $('#hidden-carousel').attr('images_per_item');
					$('#hidden-carousel').find('a').each( function(){
						
						if ($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) {
							if ($.inArray(this.href, pg_added) == -1) { 
							
								if (anchors_cnt%images_per_item==0) {
									if (anchors_cnt>0) pg_html = pg_html + "</div>";
									pg_html = pg_html + "<div class='item'>";
								}
							
								// show
								pg_html = pg_html + poip_outerHTML($(this));
								pg_added.push(this.href);
								//pg_html = pg_html + poip_outerHTML($(this).parent());
								
								anchors_cnt++;
							}
						}
					});
					if (pg_html != "") {
						pg_html = pg_html + "</div>";
					}
					
					if (pg_html != $('#image-additional-carousel').html()) {
					
						$('#image-additional-carousel').html(pg_html);
						if ($('#image-additional-carousel').find('.item').length>1) {
							$("#image-additional").find(".carousel-control").show();
						} else {
							$("#image-additional").find(".carousel-control").hide();
						}
						
						$('#image-additional .item:first').addClass('active');
						
						if (poip_theme_name == 'lexus_shopping' || (poip_theme_name == 'pav_sportshop' && !poip_settings['img_hover'] )
						|| (poip_theme_name == 'pav_fashion' && !poip_settings['img_hover'] )) {
							var zoomCollection = '#image';
								$( zoomCollection ).elevateZoom({
										lensShape : "basic",
								lensSize    : 150,
								easing:true,
								gallery:'image-additional-carousel',
								cursor: 'pointer',
								galleryActiveClass: "active"
							});
						}
						
						if (poip_settings['img_hover']) {
							$("#image-additional-carousel a").click(function(event){
								event.preventDefault()
							});
							$("#image-additional").find('a').mouseover(function(){
								poip_image_mouseover(this);
							});
						}
						
					}
					
					return;
				<?php } 
				// >> pav fashion theme compatibility
				?>
				
				<?php
				// << polianna theme compatibility
				if (isset($poip_theme_name) && $poip_theme_name == 'polianna') { ?>
				
					// make images list copy
					if ( !$('#image-additional-copy').length ) {
						$('div.image-additional').after("<div id=\"image-additional-copy\" style=\"display: none;\">"+$('div.image-additional div.overview').html()+"</div>");
					}
					
					var shown_img = [];
					var new_items = '';
					$('#image-additional-copy a').each(function(){
						if (($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) && $.inArray( this.href, shown_img) == -1) {
							new_items+= '<div class="item">'+poip_outerHTML($(this))+'</div>';
							shown_img.push(this.href);
						}
					});
					
					$('div.image-additional div.overview').html(new_items);
				
					$('.image-scroll').tinycarousel({ 
						axis: 'x', // vertical or horizontal scroller? ( x || y ).
						interval: true,
						rewind: false, 
					});
				
					$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
				
					return;
				<?php }
				// >> polianna theme compatibility
				?>
				
				// << lexus superstore compatibility
				if ($('div.image-additional').find('div.item').find('a').length) {
					var shown_img = [];
					$('div.image-additional').find('div.item').find('a').each( function(){
					
						if (($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) && $.inArray( this.href, shown_img) == -1) {
							$(this).show();
							shown_img.push(this.href);
						} else {
							$(this).hide();
							
						}
					});
					return;
				}
				// >> lexus superstore compatibility
				
				// << DEFAULT OC 1.X STYLE
				// more compatible
				
				var shown_img = [];
				poipImageAdditional().find('a').each( function(){
				
					var current_href = $(this).attr('href');
					if ( (!current_href || current_href == '#') ) {
						if ($(this).attr('data-zoom-image')) {
							current_href = $(this).attr('data-zoom-image');
						} else {
							current_href = false;
						}
						if (current_href) {
							if ( $.inArray( current_href, images) != -1 && $.inArray( current_href, shown_img) == -1 ) {
								$(this).show();
								shown_img.push(current_href);
							} else {
								$(this).hide();
							}
						}
					}
        });
				
				/* old
				var shown_img = [];
				$('div.image-additional').find('a').each( function(){
        //$('div.image-additional').children('a').each( function(){
          if (($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) && $.inArray( this.href, shown_img) == -1) {
            $(this).show();
						shown_img.push(this.href);
          } else {
            $(this).hide();
          }
        });
				*/
				// >> DEFAULT OC 1.X STYLE
				
				// << theme neocart
				if ( $('.product-img-box a.cloud-zoom-gallery').length ) {
					$('.product-img-box a.cloud-zoom-gallery').each(function () {
						if ($.inArray( this.href, images) != -1 || $.inArray(decodeURIComponent(this.href), images) != -1) {
							$(this).parent().show(); // <li>
						} else {
							$(this).parent().hide();
						}
					});
					
					// switch to beginning
					if ($('.product-img-box .flex-direction-nav a.flex-prev').length) {
						for (var i=1; i<=50; i++) {
							$('.product-img-box .flex-direction-nav a.flex-prev').trigger('click');
						}
					}
					
				}
				// >> theme neocart
        
      }
      
			//
			function elevate_zoom_select_image(img_click) {
			
				var have_elevate_zoom = false;
				
				//$('#image-additional').find('li').find('a').each( function () {
				poipImageAdditional().find('a').each( function () {
					if ($(this).attr('data-image') == img_click || $(this).attr('data-zoom-image') == img_click) {
						have_elevate_zoom = true;
					}
				});
				
				if (have_elevate_zoom) {
			
					setTimeout( function() {
						poipImageAdditional().find('a').each( function () {
							if ($(this).attr('data-image') == img_click || $(this).attr('data-zoom-image') == img_click) {
								//$(this).find('img').click();
								$(this).click();
								return false;
							}
						});
					}, 100);
				}
				return have_elevate_zoom;
			}
			
			// for future
			function cloud_zoom_switch(elem) {
					
					var data = elem.data('relOpts');
					
					$('#' + data.useZoom).parent().find('div.mousetrap').remove();
	
					// Destroy the previous zoom
					$('#' + data.useZoom).data('zoom').destroy();
	
					// Change the biglink to point to the new big image.
					$('#' + data.useZoom).attr('href', elem.attr('href'));
	
					// Change the small image to point to the new small image.
					$('#' + data.useZoom + ' img').attr('src', data.smallImage);
	
					// Init a new zoom with the new images.				
					$('#' + data.useZoom).CloudZoom();
					
			}
			
			// << theme lexus superstore & journal2
			function lexus_superstore_zoom_switch(img_click) {
				$('.image a #image').attr('data-zoom-image', img_click);
				$('.zoomWindowContainer').find('div').css({"background-image": 'url("'+img_click+'")'});
				if ($('.image a #image').data('zoom-image')) {
					$('.image a #image').data('zoom-image', img_click);
				}
			}
			// >> theme lexus superstore
			
			function pav_fashion_zoom_switch(img_click) {
				$('div.image').find('#image').attr('data-zoom-image', img_click);
				$('.zoomWindowContainer').find('div').css({"background-image": 'url("'+img_click+'")'});
				if ($('div.zoomLens').css('background-image') != 'none') {
					$('div.zoomLens').css({"background-image": 'url("'+img_click+'")'});
				}
				if ($('div.image').find('#image').data('zoom-image')) {
					$('div.image').find('#image').data('zoom-image', img_click);
				}
			}
			
			
			function ava_store_zoom_switch(img_click) {
				
				$('div.product-info div.image a#zoom_link1').attr('href', img_click);
				$('.zoomWindowContainer').find('div').css({"background-image": 'url("'+img_click+'")'});
				if ($('.image a #image').data('zoom-image')) {
					$('.image a #image').data('zoom-image', img_click);
				}
				
			}
			
			function zoom_switch_sebian_cloud_zoom(img_click) {
				
				if ($('#zoom1').data('zoom')) {
					setTimeout(function(){
					$('#image-additional-carousel .image-additional a').each(function(){
						if ( img_click == $(this).attr('href') ) {
							$(this).click();
							return false;
						}
					});
					}, 0);
				}
				
			}
			
			function image_zoom_click(img_click) {
				
				if (poip_theme_name == 'art') {
					var elem = $('#content .content-image .carousel-item img:visible:first');
					if (elem.length) {
						var html = poip_outerHTML(elem);
						var pos1 = html.indexOf("zoomImage: '");
						var pos2 = html.indexOf("', autoInside");
						if (pos1 && pos2 && pos2 > pos1) {
							var html1 = html.substr(0,pos1+12);
							var html2 = html.substr(pos2);
							
							html = html1 + img_click + html2;
							elem.replaceWith(html);
							CloudZoom.quickStart();
						}
					}
					return;
				}
				
				if (poip_theme_name == 'sebian') {
					zoom_switch_sebian_cloud_zoom(img_click);
					return;
				}
				
				if (poip_theme_name == 'mariposa-purple') {
					var poip_image = poip_get_image_by_src(img_click, 'popup');
					$('.thumbnails .zoomIn a.zoomit').attr('href', img_click);
					$('.thumbnails .zoomIn a.zoomit img').attr('src', poip_image['main']);
					return;
				}
				
				if (poip_theme_name == 'bt_claudine' || poip_theme_name == 'ntl') { // bt_claudine
				
					$("#boss-image-additional-zoom li a").each(function(){
						if ( $(this).attr('href') == img_click ) {
							$(this).click();
							return false;
						}
					});
				
					return;
				}
				
				if (poip_theme_name == 'buyshop') {
					$('div.product-more-views ul li img').each(function(){
						if ( $(this).attr('src') == img_click ) {
							$(this).click();
							return false;
						}
					});
					return;
				}
				
				if (poip_theme_name == 'marketshop') {
				
					setTimeout(function(){
						poipImageAdditional().find('a').each(function(){
							if ($(this).attr('data-zoom-image') == img_click) {
							
								// progress freezing
								$('#zoom_01').parent().find('div[style*="progress.gif"]').remove();
							
								var ez =   $('#zoom_01').data('elevateZoom');
								ez.swaptheimage($(this).attr('data-image'), $(this).attr('data-zoom-image'));
							
								// click works badly
								//$(this).find('img').click();
								//$(this).click()
								//setTimeout( function(){ $(this).click() }, 100);
								return false;
							}
						});
					
					}, 100);
					
					return;
				}
				
				// << pav fashion theme - product page & quickview
				if (poip_theme_name == "pav_fashion" || poip_theme_name == 'pav_styleshop' || poip_theme_name == 'megashop'
				|| poip_theme_name == 'lexus_shopping' || poip_theme_name == 'pav_sportshop' ) {
				
					pav_fashion_zoom_switch(img_click);
					return;
				}
				// >> pav fashion theme - product page & quickview
			
				
				
				// << elevatezoom compatibility / theme 422
				if ( elevate_zoom_select_image(img_click) ) return;
				// >> elevatezoom compatibility  / theme 422
				
				
				if (poip_theme_name == 'eagency') {
				
					poipImageAdditional().find('a').each(function(){
						if ($(this).attr('data-zoom-image') == img_click) {
							var smallImage = $(this).attr('data-image');
							var largeImage = $(this).attr('data-zoom-image');
							var ez =   $('#image').data('elevateZoom');	
							$('#ex1').attr('href', largeImage);  
							ez.swaptheimage(smallImage, largeImage); 
							return false;

						}
					});
					return;
				}
				
				
				// << product image zoom free compatibility
				$('div.image-additional').find('a.cloud-zoom-gallery').each( function () {
				
					if ($(this).attr('href') == img_click) {
						$(this).find('img').click();
						return false;
					} else if (poip_theme_name == 'shopme' && img_click.indexOf($(this).attr('href')) != -1 ) {
						$(this).find('img').click();
						return false;
					}
					
				});
				// >> product image zoom free compatibility
				
				
				
				
				
				if (poip_theme_name == 'mattimeo') { // only if colorbox replacing is turned ON
					setTimeout(function(){
						$('div.image-additional a').each(function(){
							if ($(this).attr('data-zoom-image') == img_click) {
								$(this).find('img').click();
								return false;
							}
						});
					
					}, 100);
					
					return;
				}
				
				// << ava store theme
				if (poip_theme_name == 'ava_store') {
				
					if ($('div.product-info div.image a#zoom_link1').attr('href') && $('.zoomWindowContainer').length && $('.zoomWindowContainer').find('div').length) {
					
						ava_store_zoom_switch(img_click);
						
					} else {
						
						setTimeout(function(){
							ava_store_zoom_switch(img_click);
						}, 100);
						
					}
					
					return;
				}
				// >> ava store theme
				
				
				
				// journal2 allows to use other zooming - zm-viewer
				if (poip_theme_name == 'journal2' && $('div.zm-viewer').length) {
				
					$('#product-gallery a').each(function(){
						if ( $(this).attr('href') == img_click ) {
							$(this).find('img').click();
							return false;
						}
					});
					
					// not found in additional images, change image direclty
					for (var i in poip_images) {
						if (poip_images[i]['popup'] == img_click) {
							$('div.zm-viewer').find('img.zm-fast').attr('src', poip_images[i]['main']);
							$('div.zm-viewer').find('img').last().attr('src', poip_images[i]['popup']);
						}
					}
					return;
				}
				
				/// << theme lexus superstore & journal2 & pav fashion (product page)
				if ($('.image a #image').attr('data-zoom-image') && $('.zoomWindowContainer').length && $('.zoomWindowContainer').find('div').length) {
					lexus_superstore_zoom_switch(img_click);
					return; 
				} else if ($('.image a #image').attr('data-zoom-image')) {
					setTimeout(function () { lexus_superstore_zoom_switch(img_click); }, 100);
					return;
				}
				// >> theme lexus superstore
				
				
				
				// << theme start zoom
				$('#image-additional').find('a[data-zoom-image]').each( function () { // all elements with attribute 'data-zoom-image'
					if ($(this).attr('href') == img_click) {
						$(this).click();
						return;
					}
				});
				// >> theme start zoom
				
				// << theme neocart
				if ( $('.product-img-box a.cloud-zoom-gallery').length ) {
					$('.product-img-box a.cloud-zoom-gallery').each(function () {
						if ($(this).attr('href') == img_click ) {
							$(this).click();
							return;
						}
					});
				}
				// >> theme neocart
				
			}
			
			
			function poip_set_main_image_pavilion(main, popup, counter) {
			
				$('#product meta[itemprop=image]').attr('content', popup);
			
				if (!counter) counter = 1;
				if (counter == 10) return;
				
				if (!$('.fotorama').length || !$('.fotorama').data('fotorama')) {
					setTimeout(function () {
						poip_set_main_image(main, popup, counter+1)
					}, 100);
					return;
				}
				
				for (var i in $('.fotorama').data('fotorama').data) {
					var f_data = $('.fotorama').data('fotorama').data[i];
					
					if (f_data['img']==popup) {
						$('.fotorama').data('fotorama').show(i);
						return;
					}
					
				}
				
			}
			
			function poip_set_main_image(main, popup) {
			


				if (poip_theme_name == 'art') {
					
					$('#content .content-image .carousel-item img:visible:first').attr('src', main);
					
				} else if (poip_theme_name == 'pavilion') {
				
					poip_set_main_image_pavilion(main, popup);
					
				} else {
					poip_main_image().attr('src', main);
					poip_main_image().closest('a').attr('href', popup);
				}
				
			}
			
      function poip_change_images(option) {
			
        var product_option_id = option.name.substr(option_prefix_length+1, option.name.indexOf(']')-(option_prefix_length+1) );
				
				if ($.inArray(product_option_id, poip_product_option_ids)==-1) {
          return;
        }
				
        images_to_show = poip_change_available_images(product_option_id);
				
				var value = option.value;
				var selected_values = get_selected_values();
				
				if (images_to_show.length==0 && value && $.inArray(value, selected_values)==-1 && poip_std_src && poip_std_href) {
					<?php if ( !($poip_theme_name == 'mattimeo' && $poip_mattimeo_settings['product_zoom']==1) ) { ?>
						poip_set_main_image(poip_std_src, poip_std_href);
						//poip_main_image().attr('src', poip_std_src);
						//poip_main_image().closest('a').attr('href', poip_std_href);
					<?php } ?>
				}
				
				var images_to_check = [];
				if ( value && $.inArray(value, selected_values) != -1 ) {
					for (var i=0;i<poip_images.length;i++) {
						if ( poip_images[i]['product_option_value_id'] && $.inArray(value, poip_images[i]['product_option_value_id']) != -1 && $.inArray(poip_images[i]['popup'], images_to_show) != -1 ) {
							images_to_check.push( images_to_show[$.inArray(poip_images[i]['popup'], images_to_show)] );
						}
					}
				}
				
				if ( !images_to_check.length ) {
					images_to_check = images_to_show;
				}
				
				
				// first time on options combination
				// if filtration is used, take first filtered image, else first option image
				var main_image_switched = false;
				if (images_to_check && ((poip_options_settings[product_option_id]['img_limit'] && poip_options_settings[product_option_id]['img_use'])
															|| (value && $.inArray(value, selected_values)==-1)) ) { //если отменили выбор опции, то тоже показываем первую из доступных картинок
				//if (images_to_check && poip_options_settings[product_option_id]['img_limit'] && poip_options_settings[product_option_id]['img_use']) {
					for (var i=0;i<poip_images.length;i++) {
						if (images_to_check[0] == poip_images[i]['popup']) {
						
							<?php if ( !($poip_theme_name == 'mattimeo' && $poip_mattimeo_settings['product_zoom']==1) ) { ?>
								poip_set_main_image(poip_images[i]['main'], poip_images[i]['popup']);
								//poip_main_image().attr('src', poip_images[i]['main']);
								//poip_main_image().closest('a').attr('href', poip_images[i]['popup']);
							<?php } ?>
							
							// << zoom compatibility
							image_zoom_click(poip_images[i]['popup']);
							// >> zoom compatibility
							
							var main_image_switched = true;
						}
					}
				}
				
				if (!main_image_switched) {
				
					// then on selected option images
					
					if (value && $.inArray(value, selected_values)!=-1) {
					
						// main image change
						if (poip_options_settings[product_option_id] && poip_options_settings[product_option_id]['img_change'] ) {
						
							if (poip_images_by_options[value]) {
							
								image = poip_images_by_options[value][0]['image'];
								
								for (var i=0;i<poip_images.length;i++) {
								
									if (image == poip_images[i]['image']) {

										poip_set_main_image(poip_images[i]['main'], poip_images[i]['popup']);
										//poip_main_image().attr('src', poip_images[i]['main']);
										//poip_main_image().closest('a').attr('href', poip_images[i]['popup']);
										
										// << zoom compatibility
										image_zoom_click(poip_images[i]['popup']);
										// >> zoom compatibility
				
										break;
									}
								}
							}
	
						}
					}
				}
        
        // images showing under options
        if (poip_options_settings[product_option_id] && poip_options_settings[product_option_id]['img_option'] ) {
          if (!$('product_option_images'+product_option_id).length) {

            // checkbox may have many values
            if ($(option).prop('tagName')=='INPUT' && $(option).prop('type')=='checkbox' ) {
              var values = [];
              $('input[type=checkbox][name^='+option_prefix+'\\['+product_option_id+'\\]]:checked').each( function() {
                values.push($(this).val());
              });
            } else {
              var values = [value];
            }
            
            $('#option-images-'+product_option_id).remove();
						var new_style_img_opt = false;
            if (!$('#option-images-'+product_option_id).length) {
							if ($('#option-'+product_option_id).length) { // OC 1.X style
								$('#option-'+product_option_id).append('<div id="option-images-'+product_option_id+'"></div>');
							} else { // OC 2.0 style
								$(option).after('<div id="option-images-'+product_option_id+'" style="margin-top: 10px;"></div>');
								new_style_img_opt = true;
							}
            }
            
            $('#option-images-'+product_option_id).html('');
            for (var i=0; i<poip_images.length; i++) {
              for (var j=0; j<values.length; j++) {
                if (poip_images[i]['product_option_value_id'] && $.inArray(values[j], poip_images[i]['product_option_value_id']) != -1) {
                  var html_image = '<a href="'+poip_images[i]['popup']+'" class="image-additional" style="margin: 5px;"><img src="'+poip_images[i]['thumb']+'" ></a>';
                  $('#option-images-'+product_option_id).append(html_image);
                }
              }
            }
						
						// OC 2.0 new-style default
						if ( new_style_img_opt && $('#option-images-'+product_option_id+' a').length ) {
							$('#option-images-'+product_option_id).magnificPopup({
								type:'image',
								delegate: 'a',
								gallery: {
									enabled:true
								}
							});
						}

          }
        }
        
      }
			
			function poip_get_option_images(product_option_id) {
				var images = [];
				
				for (var product_option_value_id in poip_images_by_options) {
					for (var i in poip_images_by_options[product_option_value_id]) {
						if (poip_images_by_options[product_option_value_id][i]['product_option_id'] == product_option_id) {
							images.push(poip_images_by_options[product_option_value_id][i]['image']);
						}
					}	
				}
				return images;
			}
			
			function poip_get_option_value_images(product_option_value_id) {
				var images = [];
				for (var i in poip_images_by_options[product_option_value_id]) {
					images.push(poip_images_by_options[product_option_value_id][i]['image']);
				}	
				return images;
			}
			
			function poip_get_image_src(image, src) {
				for (var i in poip_images) {
					if (poip_images[i]['image'] == image) {
						return poip_images[i][src];
					}
				}
				return '';
			}
			
			function poip_get_image_by_src(image, src) {
				for (var i in poip_images) {
					if (poip_images[i][src] == image) {
						return poip_images[i];
					}
				}
				return '';
			}
			
			function poip_dependent_thumbnails() {
				
				for (var j in poip_product_option_ids) {
					
					var product_option_id = poip_product_option_ids[j];
					
					if (poip_options_settings[product_option_id] && poip_options_settings[product_option_id]['dependent_thumbnails']
							&& poip_options_settings[product_option_id]['img_first'] == 1 ) {
						
						var option_images = poip_get_option_images(product_option_id);
						
						for (var i in poip_product_option_ids) {
							
							if (poip_product_option_ids[i] == product_option_id) continue;
							var current_product_option_id = poip_product_option_ids[i];
							
							var current_product_option_selected_values = get_selected_values(0, current_product_option_id);
							
							var current_option_images = [];
							for (var poip_images_i in poip_images) {
								if (poip_images[poip_images_i]['product_option_value_id'] && poip_images[poip_images_i]['product_option_value_id'].length) {
									for (var copsv_i in current_product_option_selected_values) {
										if ($.inArray(current_product_option_selected_values[copsv_i], poip_images[poip_images_i]['product_option_value_id']) !== -1
											&& $.inArray(poip_images[poip_images_i]['image'], current_option_images) == -1 ) {
											current_option_images.push(poip_images[poip_images_i]['image']);
										}
									}
								}

							}
							option_images = poip_array_intersection(option_images, current_option_images);
							
						}
						
						if (option_images.length == 0) {
							option_images = poip_get_option_images(product_option_id);
						}
						
						// change options icons
						$('#product').find('input[type=radio][name="'+option_prefix+'['+product_option_id+']"], input[type=checkbox][name="'+option_prefix+'['+product_option_id+']"]').each(function(){
							option_value_images = poip_get_option_value_images($(this).val());
							if (option_value_images.length) {
								current_option_value_images	= poip_array_intersection(option_value_images, option_images);
								if (current_option_value_images.length) {
									$(this).next('img').attr('src', poip_get_image_src(current_option_value_images[0], 'option_thumb') );
								} else {
									$(this).next('img').attr('src', poip_get_image_src(option_value_images[0], 'option_thumb') );
								}
							}
						});
							
						
						
						
					}
					
				}
				
			}
      
			var poip_option_value_selected_works = false;
			var poip_option_value_selected_timeout_id = 0;
			
      function poip_option_value_selected(option) {
			
				// not run twice parallel
				if ( poip_option_value_selected_works || poip_set_visible_images_timeout_id !== false) {
					clearTimeout(poip_option_value_selected_timeout_id);
					poip_option_value_selected_timeout_id = setTimeout(function(){
						poip_option_value_selected(option);
					}, 100);
					return;
				}
				
				poip_option_value_selected_works = true;
			
				poip_change_images(option);
        
        poip_popup_refresh();
				
				poip_dependent_thumbnails();
				
				poip_option_value_selected_works = false;
        
      }
			
			// return IMG element relevant to main image
			function poip_main_image() {
			
				if ( poip_theme_name == 'coloring' ) {
					return $('.main-image img');
				}
			
				var oc2_main_img = $('ul.thumbnails li').not('.image-additional').find('a img');
				if ( oc2_main_img.length ) { // OC 2.0 default
					return oc2_main_img;
				}
			
			
				if (!$('#image').length) {
					if ($('#main-image').length) {
						return $('#main-image'); // theme start compatibility
					}
					if ($('div.product-info div.image a img').length) {
						return $('div.product-info div.image a img'); // theme cosyone compatibility
					}
					if ($('div.row-product a img[itemprop="image"]').length) {
						return $('div.row-product a img[itemprop="image"]'); // theme moneymaker compatibility
					}
				}
				return $('#image'); // by standard default
			}
      
			function poip_outerHTML(elem) {
        str = $(document.createElement("div")).append(elem.clone()).html();
        return str;
      }
			
			// returns element/elements (div, ul, li etc, depend on theme) containing links to additional images (а)
			function poipImageAdditional() {
				if (poip_theme_name == 'moneymaker') {
					return $('div.row-product div.images');
					
				//} elseif (poip_theme_name == 'pavilion') {
				//	return $('#product_images_thumbs .fotorama__nav-wrap .fotorama__thumb');
				
				} if (poip_theme_name == 'eagency' && $('.product-info .thumbnails li, .product-info .thumbnails-left li').length) {
				
					return $('.product-info .thumbnails li, .product-info .thumbnails-left li');
					
				} else if (poip_theme_name == 'theme500' || poip_theme_name == 'theme541' || poip_theme_name == 'theme546' || poip_theme_name == 'theme638') {
				
					return $('#image-additional li');
					
				} else if (poip_theme_name == 'coloring') {	
				
					return $('.images-additional');
				
				} else {
					
					if ( $('li.image-additional').length ) { // OC 2.0 default
						return $('li.image-additional');
					}
				
					if ( !$('div.image-additional').length ) {
						$('div.product-info div.image').after('<div class="image-additional"></div>');
					}
				
					return $('div.image-additional');
				}
			}
			
      function refresh_colorbox() {
			
				// OC 2.0 not uses colorbox in default theme
					if (!use_refresh_colorbox) return;
					
					if (typeof(poip_journal2_quickview) !== 'undefined' && poip_journal2_quickview) return;
					
					<?php if ($poip_theme_name == 'mattimeo' && $poip_mattimeo_settings['product_zoom'] == '1') { ?> // optional gallery instead of colorbox
						return; 
					<?php } ?>
					
					if (poip_settings['img_gal']) {
					
						<?php if (isset($poip_theme_name) && $poip_theme_name=='moneymaker' && $poip_moneymaker_settings['mmr_product_gallery_type']=='photobox') { ?>
							
							// use main gallery with options filter, main image click transferring to gallery image click
							
							//$('.photobox').data("_photobox").destroy(); - глючит
							
							// remove standard photobox if exists
							if ($('.photobox').data("_photobox")) {
								var _photobox = $('.photobox').data("_photobox");
								_photobox.selector.off('click.photobox', _photobox.target)
								$('.photobox').removeData('_photobox');
							}
								
							// remove our photobox if exists
							if ($('div.images .photobox').data("_photobox")) {
								var _photobox = $('div.images .photobox').data("_photobox");
								_photobox.selector.off('click.photobox', _photobox.target)
								$('div.images .photobox').removeData('_photobox');
							}	
								
							$('div.images .photobox').photobox('a:visible');
							
							poip_main_image().parent().unbind('click', poip_photobox_main_image_click_function);
							poip_main_image().parent().bind('click', poip_photobox_main_image_click_function);
							
							return;
						<?php } ?>
						
						<?php if (isset($poip_theme_name) && $poip_theme_name=='moneymaker' && $poip_moneymaker_settings['mmr_product_gallery_type']=='fancybox') { ?>
							
							// make gallery copy, only with visible images, images clicks transfers to gallery
							
							$('#poip_fancybox').remove();
							poipImageAdditional().after('<div style="display: none" id="poip_fancybox"></div>');
							
							var fancybox_images = [];
							$('div.images a.fancybox:visible').each(function(){
								if ( $.inArray($(this).attr('href'), fancybox_images)==-1 ) {
									$('#poip_fancybox').append( poip_outerHTML($(this)).replace('data-rel="fancybox"', 'data-rel="poip_fancybox"').replace('fancybox', 'poip_fancybox') );
									fancybox_images.push($(this).attr('href'));
								}
							});
							
							$(document).unbind("click.fb-start");
							
							$('.poip_fancybox').removeData('fancybox');
							$('.fancybox').removeData('fancybox');
							//$('div[id^=fancybox-]').remove();
							//$.fancybox.init();
							
							$('.poip_fancybox').fancybox({
								'padding'	:	20,
								'transitionIn'	:	'fade',
								'transitionOut'	:	'fade',
								'overlayOpacity' : 0.7,
								'overlayColor' : '#000',
								'opacity'		: true,
								'titleShow'		: false,
								'showNavArrows'		: true,
								onStart: function() { if(navigator.appVersion.indexOf("MSIE 8.")!=-1) {$("html, body").animate({scrollTop:0}, 'slow');}; },
								onComplete: function() {
									$("#fancybox-wrap").prepend("<div id='image-appendix'><div class='title hidden-xs'><?php echo $heading_title; ?></div><div class='btn-group btn-group-lg hidden-xs additional-buttons'><?php if (!$mmr_buyhide) { ?><button class='btn btn-primary' type='button' onclick='$(\"#image-appendix\").remove();$(\"#button-cart\").click();$.fancybox.close()'><i class='fa fa-shopping-cart'></i> <?php echo $button_cart; ?></button><input type='text' data-toggle='tooltip' class='form-control input-lg' name='quantities' size='2' value='<?php echo $minimum; ?>' title='<?php echo $text_qty; ?>' /><?php if ($mmr_qorder&&$poip_moneymaker_settings['mmr_quickorder_popup_button_disabled']!=1) { ?><a class='btn btn-default' onclick='$(\"#image-appendix\").remove();$.fancybox.close();$(\".btn-quickorder\").click();'><i class='fa fa-flip-horizontal fa-reply-all'></i> <span><?php echo $this->language->get('text_mmr_quickorder_button'); ?></span></a><?php } ?><?php } ?><?php if (!$poip_moneymaker_settings['mmr_common_btn_wishlist_hidden']) { ?><button type='button' data-toggle='tooltip' class='btn btn-default' title='<?php echo $button_wishlist; ?>' onclick='addToWishList(<?php echo $product_id; ?>);$.fancybox.close()'><i class='fa fa-heart'></i></button><?php } ?><?php if (!$poip_moneymaker_settings['mmr_common_btn_compare_hidden']) { ?><button type='button' data-toggle='tooltip' class='btn btn-default' title='<?php echo $button_compare; ?>' onclick='addToCompare(<?php echo $product_id; ?>);$.fancybox.close()'><i class='fa fa-bar-chart-o'></i></button><?php } ?></div></div>");
									$('input[name=\"quantities\"]').keyup(function(){document.getElementsByName('quantity')[0].value = $(this).val(); });
								},
								onCleanup: function() {
									$("#image-appendix").remove()
								}
							});
							
							$('.fancybox').unbind('click', poip_fancybox_click_function);
							$('.fancybox').bind( 'click', poip_fancybox_click_function );
							
							return;
						<?php } ?>	
						
						
					
						$('#poip_colorbox').remove();
						
						poipImageAdditional().after('<div style="display: none" id="poip_colorbox"></div>');
						
						var colorbox_images = [];
	
						if (poip_theme_name == 'cosyone') {
							var visible_images = $('div.image-additional ul.image_carousel a[href!="#"]');
						} else if (poip_theme_name == 'ava_store') {
							var visible_images = poipImageAdditional().find('a:visible[data-image]');
						} else {
							// more compatible
							var visible_images = poipImageAdditional().find('a:visible[href!="#"]');
						}
						// more compatible
						visible_images.each(function(){
							var img_href = poip_theme_name == 'ava_store' ? $(this).attr('data-image') : $(this).attr('href') ;
							if ($.inArray( img_href, colorbox_images) == -1) {
								$('#poip_colorbox').append( poip_outerHTML($(this)).replace('colorbox', 'poip_colorbox') );
								colorbox_images.push(img_href);
							}
						});
						
						
						/* add main image to gallery, even if it's not included in additional images */
						if ($.inArray(poip_main_image().parent().attr('href'), colorbox_images) == -1) {
							$('#poip_colorbox').append( poip_outerHTML(poip_main_image().parent()).replace('colorbox', 'poip_colorbox') );
							colorbox_images.push(poip_main_image().parent().attr('href'));
						}
						
						// for ava store and, possible, other templates, poip_colorbox should be additionally filled
						$('#poip_colorbox a[href!="#"], #poip_colorbox a[href="#"][data-image]').each(function(){
							if ( !$(this).hasClass('poip_colorbox') ) {
								$(this).addClass('poip_colorbox');
							}
							if ($(this).attr('href') == '#' && $(this).attr('data-image')) {
								$(this).attr('href', $(this).attr('data-image'));
							}
						});
						
						if (typeof($.colorbox) !== 'undefined') {
							$.colorbox.remove();
						}
						
						// << pav fashion theme compatibility
						if ((poip_theme_name == 'pav_fashion' || poip_theme_name == 'pav_styleshop' || poip_theme_name == 'megashop'
						|| poip_theme_name == 'lexus_shopping' || poip_theme_name == 'pav_sportshop' ) && $.colorbox) {
							
							// for quickview
							$('.pav-colorbox').colorbox({
									width: '980px', 
									height: '80%',
									overlayClose: true,
									opacity: 0.5,
									iframe: true, 
							});
							
							// if used zoom, colorbox for images not used
							if ($('#image-additional').find('a[data-zoom-image][data-image]').length && $('.zoomWindowContainer').find('div').length) {
								$('#image-additional').find('a[data-zoom-image][data-image]').click(function (event) {
									event.preventDefault();
								});
								return;
							}
						}
						// >> pav fashion theme compatibility
						
						if ($.colorbox) {
						
							if (poip_theme_name == 'moneymaker') {
							
								colorbox_settings = {
									next: "<button class='btn btn-default' type='button'><i class='fa fa-fw fa-chevron-right'></i></button>",
									previous: "<button class='btn btn-default' type='button'><i class='fa fa-fw fa-chevron-left'></i></button>",
									close: "<button class='btn btn-default' type='button'><i class='fa fa-fw fa-times'></i></button>",
									rel: "colorbox",
									onOpen: function() {
										$("#colorbox").prepend("<div id='image-appendix'><div class='title hidden-xs'>iPhone</div><div class='btn-group btn-group-lg hidden-xs additional-buttons'><button class='btn btn-primary' type='button'  onclick='$(\"#image-appendix\").remove();$(\"#button-cart\").click();'><i class='fa fa-shopping-cart'></i> Купить</button><input type='text' data-toggle='tooltip' class='form-control input-lg' name='quantities' size='2' value='1' title='Количество:' /><button type='button' data-toggle='tooltip' class='btn btn-default' title='в закладки' onclick='addToWishList(40);'><i class='fa fa-heart'></i></button><button type='button' data-toggle='tooltip' class='btn btn-default' title='сравнение' onclick='addToCompare(40);'><i class='fa fa-bar-chart-o'></i></button></div></div>");
										$('input[name=\"quantities\"]').keyup(function(){document.getElementsByName('quantity')[0].value = $(this).val(); });
									},
									onComplete: function() { if(navigator.appVersion.indexOf("MSIE 8.")!=-1) {$("html, body").animate({scrollTop:0}, 'slow');}; },
									onClosed: function() {
										$("#image-appendix").remove()
									}
								}
							
							} else {
								var colorbox_settings = false;
								try {
									var scripts = $('script:contains(".colorbox")');
									for (var i=0; i<scripts.length; i++) {
										var script_html  =$(scripts[i]).html();
										if (script_html.indexOf('$(\'.colorbox\').colorbox(') != -1 ) {
											var str_pos = script_html.indexOf('$(\'.colorbox\').colorbox(');
											var str = script_html.substr(str_pos+24);
											str_pos = str.indexOf('});');
											str = str.substr(0,str_pos+1);
											colorbox_settings = eval('('+str+')');
											break;
										}
									}
								} catch (e) {
									console.debug(e);
									colorbox_settings = false
								}
								
								if (!colorbox_settings || (typeof colorbox_settings) != 'object') {
									console.log('colorbox settings not found');
									colorbox_settings = {
										overlayClose: true,
										opacity: 0.5,
										rel: "colorbox"
									};
								}
							}
							
							//if (poip_theme_name != 'cosyone' || !$('#zoom-btn').length) {
								$('.poip_colorbox').colorbox(colorbox_settings);
								//$('.colorbox').colorbox(colorbox_settings);
							//}
						
						
							try {
								$('[id^=option-images-]').each( function() {
									
									colorbox_settings['rel'] = $(this).attr('id');
									// more compatible
									$(this).find('a').colorbox(colorbox_settings);
									//$(this).children('a').colorbox(colorbox_settings);
									
								});
							} catch(e) {
								console.debug(e);
								console.debug("colorbox under options gallery error");
							}
						
						}
						
						if (poip_theme_name == 'polianna') {
							$('#plus').click(function(event){
								event.preventDefault();
								var poip_colorbox = $('a.poip_colorbox[href!="#"]');
								for (var i=0; i<poip_colorbox.length; i++) {
									if ($(this).parent().attr('href') == poip_colorbox[i].href || $(this).parent().attr('href') == decodeURIComponent(poip_colorbox[i].href)) {
										$(poip_colorbox[i]).trigger('click');
										break;
									}
								}
							});
						} else if (poip_theme_name == 'cosyone' && $('#zoom-btn').length) {
							// in cosyone depending on settings zoom may be enabled, then popup only on plus "+"
							$('#zoom-btn').unbind('click');
							$('#zoom-btn').click(function(event){
								event.preventDefault();
								var poip_colorbox = $('a.poip_colorbox[href!="#"]');
								for (var i=0; i<poip_colorbox.length; i++) {
									if ($(this).attr('href') == poip_colorbox[i].href || $(this).attr('href') == decodeURIComponent(poip_colorbox[i].href)) {
										$(poip_colorbox[i]).trigger('click');
										break;
									}
								}
							});
							
						} else if (poip_theme_name == 'ava_store' && $('#zoom_link1').length) {
							$('#zoom_link1').unbind('click');
							$('#zoom_link1').click(function(event){
								event.preventDefault();
								
								if ($('.zoomWindowContainer').find('div').css('background-image')) {
									// should be the same image like in zoom
									var back_image = $('.zoomWindowContainer').find('div').css('background-image');
									if (back_image.substr(0,4)=='url(' && back_image.substr(-1) == ')') {
										back_image = back_image.substr(4,back_image.length-5);
									}
									$('#zoom_link1').attr('href', back_image);
									$('#zoom_link1').attr('data-image', back_image);
								}
								
								var poip_colorbox = $('#poip_colorbox a.poip_colorbox[data-image]');
								
								for (var i=0; i<poip_colorbox.length; i++) {
									var poip_colorbox_href = $(poip_colorbox[i]).attr('data-image');
									if ($(this).attr('href') == poip_colorbox_href || $(this).attr('href') == decodeURIComponent(poip_colorbox_href)) {
										$(poip_colorbox[i]).trigger('click');
										break;
									}
								}
							});	
							
						} else {
							
							$('.colorbox').unbind('click', poip_colorbox_click_function);
							$('.colorbox').bind( 'click', poip_colorbox_click_function );
						}
						
					}
				
      }
			
			var poip_colorbox_click_function = function(event) {
			
				event.preventDefault();
			
				var this_data = ( poip_theme_name=='moneymaker' ? $(this).find('a') : $(this) );
				var poip_colorbox = $('a.poip_colorbox[href!="#"]');
				
				for (var i=0; i<poip_colorbox.length; i++) {
					if (this_data.attr('href') == poip_colorbox[i].href || this_data.attr('href') == decodeURIComponent(poip_colorbox[i].href)) {
						$(poip_colorbox[i]).trigger('click');
						break;
					}
				}
			}
			
			var poip_fancybox_click_function = function(event) {
			
				event.preventDefault();
			
				var this_data = $(this);
				var poip_box = $('a.poip_fancybox');
				
				for (var i=0; i<poip_box.length; i++) {
					if (this_data.attr('href') == $(poip_box[i]).attr('href') ) {
						$(poip_box[i]).trigger('click');
						break;
					}
				}
			}
			
			var poip_photobox_main_image_click_function = function(event) {
			
				event.preventDefault();
			
				var this_data = $(this);
				var poip_box = $('div.images a:visible');
				
				for (var i=0; i<poip_box.length; i++) {
					if (this_data.attr('href') == $(poip_box[i]).attr('href') ) {
						$(poip_box[i]).trigger('click');
						break;
					}
				}
			}
			
			function poip_is_video_href(href) {
			
				if ( href ) {
				
					if ( href.indexOf('https://www.youtube.com')==0 || href.indexOf('http://www.youtube.com')==0
					|| href.indexOf('https://youtube.com')==0 || href.indexOf('http://youtube.com')==0
					|| href.indexOf('https://www.vimeo.com')==0 || href.indexOf('http://www.vimeo.com')==0
					|| href.indexOf('https://vimeo.com')==0 || href.indexOf('http://vimeo.com')==0
					|| href.indexOf('www.youtube.com')==0
					|| href.indexOf('youtube.com')==0
					|| href.indexOf('www.vimeo.com')==0
					|| href.indexOf('vimeo.com')==0 ) {
						return true;
					}
					
				}
				
				return false;
				
			}
      
      function poip_image_mouseover(image_a) {
			
				if ($(image_a).is('img')) {
					href = $(image_a).attr('src');
				} else if ( (poip_theme_name == 'mattimeo' || poip_theme_name == 'marketshop' || poip_theme_name == 'lexus_shopping') && $(image_a).attr('data-zoom-image')) {
					href = $(image_a).attr('data-zoom-image') ;
				} else {
					href = $(image_a).attr('href')!='#' ? $(image_a).attr('href') : $(image_a).attr('data-image') ;
				}
				
				if ( poip_is_video_href(href) ) {
					return;
				}
				
        for (var i=0;i<poip_images.length;i++) {
				
          if (poip_images[i]['popup'] && poip_images[i]['popup'] == href) {
						
						<?php if ( !($poip_theme_name == 'mattimeo' && $poip_mattimeo_settings['product_zoom']==1) ) { ?>
							poip_main_image().attr('src', poip_images[i]['main']);
							poip_main_image().closest('a').attr('href', poip_images[i]['popup']);
						<?php } ?>
						
						image_zoom_click(poip_images[i]['popup']);
				
            break;
          }
        }
				
        poip_popup_refresh();
				
      }
      
      function set_option_value(value) {
			
        var options = $('select[name^="'+option_prefix+'["]').children('option');
        for (var i=0; i<options.length;i++) {
          if (options[i].value == value) {
					
						// Product Block Option compatibility
						if ( $('a[option-value='+value+']').length ) {
							$('a[option-value='+value+']').click();
							return;
						}
					
            $(options[i]).parent().val(value);
            $(options[i]).parent().trigger('change');
						
           return;
          }
        }
        
        var options = $('input[type=radio][name^='+option_prefix+'\\[]');
        for (var i=0; i<options.length;i++) {
				
          if (options[i].value == value) {
					
						// Product Block Option compatibility
						if ( $('a[option-value='+value+']').length ) {
							$('a[option-value='+value+']').click();
							return;
						}
						
						// bt_comohos compatibility
						
						if ( $(options[i]).parent().parent().is('.bt-image-option') ) {
							$(options[i]).parent().click();
							return;
						}
						
					
            options[i].checked = true;
            $(options[i]).trigger('change');
            return;
          }
        }
        
        var options = $('input[type=checkbox][name^='+option_prefix+'\\[]');
        for (var i=0; i<options.length;i++) {
          if (options[i].value == value) {
            options[i].checked = true;
            $(options[i]).trigger('change');
            return;
          }
        }
        
      }
			
			function poip_image_mouseover_pavilion_turn_on(counter) {
			
				$('#product').on('mouseover', '.fotorama__thumb img.fotorama__img', function() {
					if ( $('.fotorama').length && $('.fotorama').data('fotorama') ) {
						for (var i in $('.fotorama').data('fotorama').data) {
							var fotorama_img = $('.fotorama').data('fotorama').data[i];
							if (fotorama_img['thumb'] == $(this).attr('src')) {
								$('.fotorama').data('fotorama').show(i);
								return;
							}
						}
					}
				});
			
			}
      
			function poipCheckEventsForSelects(first_time) {

				$('select[name^="'+option_prefix+'["]').each(function () {
					var select_events = $(this).data('events');
					var found_poip = false;
					
					if (select_events && select_events.change) {
						for (var i=0; i<select_events.change.length; i++) {
							if ( (''+select_events.change[i].handler).indexOf('poip_option_value_selected') != -1 ) {
								found_poip = true;
								break;
							}
						}
					}
					
					if (!found_poip) {
						$(this).change( function(){poip_option_value_selected(this);} );
						// event should be called, may be select value is reseted
						if (!first_time) {
							poip_option_value_selected(this);
						}
					}
				});
				
			}
      
			
			
			
			<?php
			if (isset($poip_theme_name)
			&& ($poip_theme_name == 'journal2' || $poip_theme_name == 'pav_fashion' || $poip_theme_name == 'pav_styleshop' || $poip_theme_name == 'megashop'
			|| $poip_theme_name == 'lexus_shopping' || $poip_theme_name == 'pav_sportshop' 
			|| $poip_theme_name == 'cosyone' || $poip_theme_name == 'mattimeo' || $poip_theme_name == 'moneymaker'
			|| $poip_theme_name == 'sellegance' || $poip_theme_name == 'polianna')) { 
			?>
			
				// old style
				
				
			
				
				poipCheckEventsForSelects(true);
				
				$('div.options').click(function(){poipCheckEventsForSelects();});
				
				$("input[type=radio][name^="+option_prefix+"\\[]").each(function (i) {
					$(this).change(function(){
						poip_option_value_selected(this);
					})
				})
				
				if (poip_theme_name == "journal2") {
					if ( $('div.option').find('input:radio').length && $('div.option').find('li[data-value]').length ) {
						$('div.option').find('li[data-value]').click(function(){
							$(this).parents('div.option').find('input:radio[value='+$(this).attr('data-value')+']').change();
						});
					}
					if ( $('div.option').find('select').length && $('div.option').find('li[data-value]').length ) {
						$('div.option').find('li[data-value]').click(function(){
							$(this).parents('div.option').find('select').change();
						});
					}
				}
				
				$("input[type=checkbox][name^="+option_prefix+"\\[]").each(function (i) {
					$(this).change(function(){
						poip_option_value_selected(this);
					})
				})
				
				//images_to_mouseover();
				if (poip_settings['img_hover']) {
					if (poip_theme_name == 'pavilion') {
						poip_image_mouseover_pavilion_turn_on();
					} else {
						// more compatible
						poipImageAdditional().on('mouseover', 'a' ,function(){
							poip_image_mouseover(this);
						});
					}
				}
		
				
				
				
				$(document).ready(function(){
					poip_set_visible_images(poip_get_global_visible_images());
					poip_popup_refresh();
				
					if (poip_theme_name == 'pavilion') {
						// some options may be selected
						$("[name^="+option_prefix+"\\[]:first").change();
						
					}
					
					<?php
						
						if (isset($poip_ov) && $poip_ov) {
							echo "var poip_ov = '".(int)$poip_ov."';";
						} else {
							echo "var poip_ov = false;";
						}
					?>
					
					if (poip_ov) {
						// journal 2 compatibility
						setTimeout(function() {
						if ($('.option ul li[data-value='+poip_ov+']').length) {
							$('.option ul li[data-value='+poip_ov+']').click();
						} else {
							set_option_value(poip_ov);
						}
						},1);
					}
				
				});
				
			<?php } else { ?>
				
				
				
				// new style
				if ( $.magnificPopup ) {
					poipImageAdditional().find('a').each(function(){
						if ( poip_is_video_href( $(this).attr('href') ) ) {
							if ( !$(this).hasClass('mfp-iframe') ) {
								$(this).addClass('mfp-iframe');
							}
						}
					});
				}
				
				$('#product').on('change', 'select[name^="'+option_prefix+'["], input[type=radio][name^="'+option_prefix+'["], input[type=checkbox][name^="'+option_prefix+'["]', function(){
					poip_option_value_selected(this);
				});
				
				if ( poip_theme_name == 'art' ) {
					$('#product input:radio.image_radio').siblings('img').click(function(){
						var elem = $(this);
						setTimeout( function(){
							elem.siblings('input:radio.image_radio').change();
						}, 100);
					});
				}
				
				//images_to_mouseover();
				if (poip_settings['img_hover']) {
					// more compatible
					if (poip_theme_name == 'pavilion') {
						poip_image_mouseover_pavilion_turn_on();
					} else {
						poipImageAdditional().on('mouseover', 'a' ,function(){
							poip_image_mouseover(this);
						});
					}
				}
				
				$(document).ready(function(){
					poip_set_visible_images(poip_get_global_visible_images());
					poip_popup_refresh();
				
					<?php
						if (isset($poip_ov) && $poip_ov) {
							echo "var poip_ov = '".(int)$poip_ov."';";
						} else {
							echo "var poip_ov = false;";
						}
					?>
					
					if (poip_ov) {
						set_option_value(poip_ov);
					}
				
				});
				
				
			<?php }  ?>
      
      //--></script>  
        
      <?php  }  ?>
      <!-- >> Product Option Image PRO module -->
      
<!-- Related Options PRO / Связанные опции PRO << -->

			<script type="text/javascript">
			
				<?php
					// << Product Image Option DropDown compatibility
					if ( isset($text_select_your) && isset($options) && is_array($options) ) {
						echo "var ro_piodd_select_texts = [];\n";
						foreach ($options as $option) {
							if ($option['type'] == 'image') {
								echo "ro_piodd_select_texts[".$option['product_option_id']."] = '".$text_select_your.$option['name']."';\n";
							}
						}
					
					}
					// >> Product Image Option DropDown compatibility
				?>
			
				// << Product Image Option DropDown compatibility
				function ro_piodd_set_value(product_option_id, value) {
				
					var radio_elems = $('input[type=radio][name="'+option_prefix+'['+product_option_id+']"]');
					if (radio_elems.length) {
						var piodd_option_div = radio_elems.closest('div[id^=option-]').find('[id^=image-option]');
						if (piodd_option_div.length) {
							
							piodd_option_div.find('a.dd-option').removeClass('dd-option-selected');
							piodd_option_div.find('input.dd-selected-value').val(value);
							if (value) {
								var piodd_selected_a = piodd_option_div.find('input.dd-option-value[value='+value+']').parent().addClass('dd-option-selected');
								piodd_option_div.find('a.dd-selected').html('');
								piodd_option_div.find('a.dd-selected').append( piodd_selected_a.find('img').clone().removeClass('dd-option-image').addClass('dd-selected-image') );
								piodd_option_div.find('a.dd-selected').append( piodd_selected_a.find('label').clone().removeClass('dd-option-text').addClass('dd-selected-text') );
							} else {
								if (ro_piodd_select_texts[product_option_id]) {
									piodd_option_div.find('a.dd-selected').html(ro_piodd_select_texts[product_option_id]);
								}
							}
						}
					}
					
				}
				// >> Product Image Option DropDown compatibility
			
			
				function ro_clear_options() {
				
					// << Product Image Option DropDown compatibility
					options = $('input[type=radio][name^="'+option_prefix+'"]:checked');
					for (i=0;i<options.length;i++) {

						var product_option_id = ro_get_product_option_id_from_name($(options[i]).attr('name'));
						ro_piodd_set_value(product_option_id, '');
					}
					// >> Product Image Option DropDown compatibility
					
					$('input[type=radio][name^="'+option_prefix+'"]').attr('checked', false);
					
					$('select[name^="'+option_prefix+'"]').val('');
					
					$('textarea[name^="'+option_prefix+'"]').val('')
					
					$('input[type=text][name^="'+option_prefix+'"]').val('');
					
					$('input[type=checkbox][name^="'+option_prefix+'"]').attr('checked', false);
					
					$('input[type=hidden][name^="'+option_prefix+'"]').val('')
					
					ro_options_values_access();
					ro_set_block_options();
					ro_set_journal2_options();
					
					$('#input-quantity').trigger('change');
					
					<?php if (isset($ro_theme_name) && $ro_theme_name=='journal2') { ?>
					if (Journal.updatePrice) {
						Journal.updateProductPrice();
					}
					<?php } ?>
					
					return false;
				}
				
				// Product Block Option & Product Color Option compatibility
				// make option block selected (the same as in original input/select)
				function ro_set_block_options() {
					if (use_block_options) {
					
						// Product Block Option & Product Color Option text clear
						$('.option span[id^="option-text-"]').html('');
						
						$('select[name^="'+option_prefix+'["]').find('option').each( function () {
							var poid = ro_get_product_option_id_from_name($(this).parent().attr('name'));
							//$(this).parent().attr('name').substr(7, $(this).parent().attr('name').length-8);
							
							// Product Block Option
							// disable all SELECT blocks
							$('a[id^="block-"][option-text-id$="-'+poid+'"]').removeClass('block-active');
							if ($(this).parent().val()) {
								$('a[id^="block-"][option-text-id$="-'+poid+'"][option-value="'+$(this).parent().val()+'"]').addClass('block-active').click();
							}
							
							// Product Color Option
							$('a[id^="color-"][option-text-id$="-'+poid+'"]').removeClass('color-active');
							if ($(this).parent().val()) {
								$('a[id^="color-"][option-text-id$="-'+poid+'"][optval="'+$(this).parent().val()+'"]').addClass('color-active').click();
							}
							
						});
						
						// block options use RADIOs for images
						$('input[type=radio][name^="'+option_prefix+'["]').each( function () {
							var poid = ro_get_product_option_id_from_name($(this).attr('name'));
							//$(this).attr('name').substr(7, $(this).attr('name').length-8);
							
							// Product Block Option
							// disable only current RADIO block
							$('a[id^="block-"][option-text-id$="-'+poid+'"][option-value="'+$(this).val()+'"]').removeClass('block-active');
							if ($(this).is(':checked')) {
								$('a[id^="block-"][option-text-id$="-'+poid+'"][option-value="'+$(this).val()+'"]').addClass('block-active').click();
							}
							
							// Product Color Option
							$('a[id^="color-"][option-text-id$="-'+poid+'"][optval="'+$(this).val()+'"]').removeClass('color-active');
							if ($(this).is(':checked')) {
								$('a[id^="color-"][option-text-id$="-'+poid+'"][optval="'+$(this).val()+'"]').addClass('color-active').click();
								
							}
							
						});
						
					}
					
				}
				
			</script>
			
			
			
			<?php 
			
			//if (	$this->model_module_related_options->installed() ) {
			if ( isset($ro_installed) &&	$ro_installed && isset($ro_data) && $ro_data ) {
				
				?>
				
				<style>
					.ro_option_disabled { color: #e1e1e1; }
				</style>
			
				<?php if ( $ro_theme_name == 'theme638' ) { ?>
					<script src="catalog/view/theme/theme638/js/jquery.selectbox-0.2.min.js" type="text/javascript"></script>
					<style>
						.sbDisabled { padding-left:10px; padding-top:8px; padding-bottom:8px; opacity:0.4; line-height:37px; }
					</style>
				<?php } ?>
				
				<script type="text/javascript">
				
				var hide_inaccessible = <?php if (isset($ro_settings['hide_inaccessible']) && $ro_settings['hide_inaccessible']) echo "true"; else echo "false"; ?>;
				var options_types = [];
				var ro_data = <?php echo json_encode($ro_data); ?>;
				var ro_product_options = <?php echo json_encode($ro_product_options); ?>;
				var ro_step_by_step = <?php if (isset($ro_settings['step_by_step']) && $ro_settings['step_by_step']) echo "true"; else echo "false"; ?>;
				var auto_select_last = <?php if (isset($ro_settings['select_first']) && $ro_settings['select_first'] == 2) echo "true"; else echo "false"; ?>;
				var use_block_options = ($('a[id^=block-option][option-value]').length || $('a[id^=block-image-option][option-value]').length || $('a[id^=color-][optval]').length);
				var use_journal2 = <?php echo (isset($ro_theme_name) && $ro_theme_name=='journal2') ? 'true' : 'false'; ?>;
				var ro_theme_name = "<?php echo $ro_theme_name; ?>";
				var ro_settings = <?php echo json_encode($ro_settings); ?>;
				
				var option_prefix = "option";
				if ($('#mijoshop').length && $('[name^="option_oc["]').length) { // 
					option_prefix = "option_oc";
				}
				var option_prefix_length = option_prefix.length;
				
				var all_select_ov = {};
				$('select[name^="'+option_prefix+'["]').each( function (si, sel_elem) {
					all_select_ov[sel_elem.name] = [];
					
					$.each(sel_elem.options, function (oi, op_elem) {
						all_select_ov[sel_elem.name].push(op_elem.value);
					});
					
				} );
				
				
				var ro_options_steps = ro_get_options_steps();
				var ro_all_options_values = [];
				for (var i=0; i < ro_options_steps.length; i++) {
					ro_all_options_values[ro_options_steps[i]] = ro_get_all_possible_option_values(ro_options_steps[i]);
				}
				
				
				<?php
				
				if (isset($options) && is_array($options)) {
					foreach ($options as $option) {
						echo "options_types[".$option['product_option_id']."]='".$option['type']."';\n";
					}
				}
				
				if ( isset($ros_to_select) && $ros_to_select ) {
					echo "var ros_to_select = ".json_encode($ros_to_select).";";
					echo "var filter_name = false;";
				} elseif (isset($_GET['filter_name'])) {
					echo "var filter_name=\"".$_GET['filter_name']."\";";
				} elseif (isset($_GET['search'])) {
					echo "var filter_name=\"".$_GET['search']."\";";
				} else {
					echo "var filter_name = false;";
				}
				
				
				?>
				
				(function ($) {
					$.fn.toggleOption = function (value, show) {
						/// <summary>Show or hide the desired option</summary>
						return this.filter('select').each(function () {
							var select = $(this);
							if (typeof show === 'undefined') {
								show = select.find('option[value="' + value + '"]').length == 0;
							}
							if (show) {
								select.showOption(value);
							}
							else {
								select.hideOption(value);
							}
						});
					};
					$.fn.showOption = function (value) {
						/// <summary>Show the desired option in the location it was in when hideOption was first used</summary>
						return this.filter('select').each(function () {
							var select = $(this);
							var found = select.find('option[value="' + value + '"]').length != 0;
							if (found) return; // already there
				
							var info = select.data('opt' + value);
							if (!info) return; // abort... hideOption has not been used yet
				
							var targetIndex = info.data('i');
							var options = select.find('option');
							var lastIndex = options.length - 1;
							if (lastIndex == -1) {
								select.prepend(info);
							}
							else {
								options.each(function (i, e) {
									var opt = $(e);
									if (opt.data('i') > targetIndex) {
										opt.before(info);
										return false;
									}
									else if (i == lastIndex) {
										opt.after(info);
										return false;
									}
								});
							}
							return;
						});
					};
					$.fn.hideOption = function (value) {
						/// <summary>Hide the desired option, but remember where it was to be able to put it back where it was</summary>
						return this.filter('select').each(function () {
							var select = $(this);
							var opt = select.find('option[value="' + value + '"]').eq(0);
							if (!opt.length) return;
				
							if (!select.data('optionsModified')) {
								// remember the order
								select.find('option').each(function (i, e) {
									$(e).data('i', i);
								});
								select.data('optionsModified', true);
							}
				
							select.data('opt' + value, opt.detach());
							return;
						});
					};
				})(jQuery);					
				
				function ro_stock_control(add_to_cart) {
				
					<?php  if (!isset($ro_settings['stock_control']) || !$ro_settings['stock_control']) { ?>
					if (add_to_cart) {
						$('#button-cart').attr('allow_add_to_cart','allow_add_to_cart');
						$('#button-cart').click();
					}
					return;
					<?php } ?>
				
					var erros_msg = '<?php echo $entry_stock_control_error; ?>';
					
					var options_values = ro_get_options_values([]);
					var roids = ro_get_current_ro_ids(options_values);
					
					$('.alert-warning, .alert-warning').remove();
					
					if (roids.length) {
					
						$.ajax({
								url: '<?php echo HTTP_SERVER; ?>index.php?route=module/related_options/get_ro_free_quantity',
								data: {roids: roids},
								dataType : "text",         
								success: function (data) { 
								
									if (parseInt(data) < parseInt( $('input[type=text][name=quantity]').val() )) {
										$('.alert-warning, .alert-warning').remove();
										$('#input-quantity').parent().after('<div class="alert alert-warning">' + erros_msg.replace('%s',parseInt(data)) + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
										
									} else {
																				
										if (add_to_cart) {
											$('#button-cart').attr('allow_add_to_cart','allow_add_to_cart');
											$('#button-cart').click();
										}
									}
								},
								error: function(error) {
									console.log(error);
								}
						});
					} else { // if there's no selected related options combination - use standard algorithm
						if (add_to_cart) {
							$('#button-cart').attr('allow_add_to_cart','allow_add_to_cart');
							$('#button-cart').click();
						}
					
					}
					
				}
				
				function ro_get_current_ro_ids(options_values) {
				
					var ro_ids = [];
				
					for (var i in ro_data) {
						if((ro_data[i] instanceof Function) ) { continue; }
					
						var ro_dt = ro_data[i];
				
						var all_ok;
						for(var ro_id in ro_dt['ro']) {
							if((ro_dt['ro'][ro_id] instanceof Function) ) { continue; }
							
							all_ok = true;
							for(var product_option_id in ro_dt['ro'][ro_id]['options']) {
								if((ro_dt['ro'][ro_id]['options'][product_option_id] instanceof Function) ) { continue; }
								
								if (!(product_option_id in options_values && options_values[product_option_id]==ro_dt['ro'][ro_id]['options'][product_option_id])) {
									all_ok = false;
								}
							}
							if (all_ok) ro_ids.push(ro_id); 
						}
						
					}
					return ro_ids;
				}
				
				
				
				function ro_arrays_intersection(arr1, arr2) {
					var new_arr = [];
					
					for (var i in arr1) {
						if ($.inArray(arr1[i], arr2) != -1) {
							new_arr.push(arr1[i]);
						}
					}
					
					return new_arr;
					
				}
				
				function ro_get_array_copy(arr) {
				
					var new_arr = [];
					
					for (var i in arr) {
						if ( $.isArray(arr[i]) ) {
							new_arr[i] = ro_get_array_copy(arr[i]);
						} else {
							new_arr[i] = arr[i];
						}
					}
					
					return new_arr;
				}
				
				
				function ro_get_all_possible_option_values(product_option_id) {
					
					var values = [];
					
					if ($('select[name="'+option_prefix+'['+product_option_id+']"]').length) {
					
						var select_options = all_select_ov[option_prefix+"["+product_option_id+"]"];
						for (var i=0;i<select_options.length;i++) {
							if (select_options[i]) {
								values.push(select_options[i]);
							}
						}
					
					} else if ($('input[type=radio][name="'+option_prefix+'['+product_option_id+']"]').length) {
						
						$('input[type=radio][name="'+option_prefix+'['+product_option_id+']"]').each(function(){
							values.push($(this).val());
						});
						
					}
					
					return values;
					
				}
				
				// get available options values
				// option_id - опция (product_option_id)
				// param_options_values - current options values (selected) - only for related options
				// param_skip_ropv_ids - don't make values addition for this related options combinations
				function ro_get_accessible_option_values(option_id, param_options_values, param_skip_options) {
				
					// make copies od arrays
					var options_values = ro_get_array_copy(param_options_values);
					var skip_options = ro_get_array_copy(param_skip_options);
					skip_options.push(option_id);
					
					for (var current_option_id in options_values) {
						if ( !options_values[current_option_id].length && current_option_id != option_id) {
							if ( $.inArray(current_option_id, skip_options) == -1 ) {
								options_values[current_option_id] = ro_get_accessible_option_values(current_option_id, options_values, skip_options);
							}
						}
					}
					
					var common_accessible_values = false;
					
					var possible_current_option_values = ro_all_options_values[option_id];
					
					for (var i in ro_data) {
					
						if ($.inArray(option_id,ro_data[i]['options_ids'])==-1) {
							continue;
						}
						
						var accessible_values = [];
					
						var ro_array = ro_data[i]['ro'];
						
						var options_for_check = []; // optimization
						for(var current_option_id in options_values) {
							if (current_option_id != option_id && options_values[current_option_id].length
							&& $.inArray(current_option_id, skip_options) == -1 && $.inArray(current_option_id,ro_data[i]['options_ids'])!=-1) {
								options_for_check.push(current_option_id);
							}
						}
						
						if (!options_for_check.length) {
							if (ro_data[i]['options_ids'].length == 1) { // combination contains only one option (this option)
								for(var ro_id in ro_array) {
									if( !ro_array.hasOwnProperty(ro_id) ) continue;
									if ( ro_array[ro_id]['options'][option_id] && $.inArray(ro_array[ro_id]['options'][option_id], accessible_values) == -1 ) {
										accessible_values.push(ro_array[ro_id]['options'][option_id]);
									}
								}
							} else {
								accessible_values = ro_get_array_copy(possible_current_option_values);
							}
						} else {
							for(var ro_id in ro_array) {
								if((ro_array[ro_id] instanceof Function) ) { continue; }
								
								all_ok = true;
								
								for (var j =0; j < options_for_check.length; j++) {
								
									var current_option_id = options_for_check[j];
								
								//for(var current_option_id in options_values) {
									
									//if (current_option_id != option_id && options_values[current_option_id].length
									//&& $.inArray(current_option_id, skip_options) == -1 && $.inArray(current_option_id,ro_data[i]['options_ids'])!=-1) {
										
										if ( $.inArray(ro_array[ro_id]['options'][current_option_id], options_values[current_option_id]) == -1  ) {
											all_ok = false;
										}
										
									//}
									
									if (!all_ok) {
										break;
									}
									
								}
								
								if (all_ok && ($.inArray(ro_array[ro_id]['options'][option_id], accessible_values) == -1 )) {
									accessible_values.push(ro_array[ro_id]['options'][option_id]);
									if (possible_current_option_values.length == accessible_values.length) { // optimization
										break;
									}
								}
								
							}
						}
						
						if (common_accessible_values === false) {
							common_accessible_values = accessible_values;
						} else {
							common_accessible_values = ro_arrays_intersection(common_accessible_values, accessible_values);
						}
						
					}
					
					return common_accessible_values;
					
				}
				
				// only for options with values
				// returns array of accessible values
				function ro_option_values_access(param_options_values, option_id) {
					
					var options_values = [];
					for (var product_option_id in param_options_values) {
						options_values[product_option_id] = [];
						if (param_options_values[product_option_id]) {
							options_values[product_option_id].push(param_options_values[product_option_id]);
						}
					}
					
					var skip_ropv_ids = [];
					var accessible_values = ro_get_accessible_option_values(option_id, options_values, skip_ropv_ids)
					
					ro_set_accessible_values(option_id, accessible_values);
					
					return accessible_values;
				}
				
				function ro_toggle_option_block(option_id, toggle_flag) {
						
					$('#input-option'+option_id).parent().toggle(toggle_flag);
					
				}
				
				function ro_option_is_available(option_id) {
					
					if ($('select[name="'+option_prefix+'['+option_id+']"]').length) {
						return $('select[name="'+option_prefix+'['+option_id+']"] option[value][value!=""]:not(:disabled)').length ? true : false;
					} else if ($('input[type=radio][name="'+option_prefix+'['+option_id+']"]').length) {
						return $('input[type=radio][name="'+option_prefix+'['+option_id+']"]:not(:disabled)').length ? true : false;
					}
					
				}
				
				function ro_hide_unavailable_option(option_id) {

					if (ro_settings && ro_settings['hide_option']) {
						ro_toggle_option_block(option_id, ro_option_is_available(option_id));
					}
				}
				
				function ro_unavailable_options_not_required(option_id) {
					
					if (ro_settings && ro_settings['unavailable_not_required']) {
						var current_ids = [];
						if ($('#ro_not_required').length) {
							current_ids = $('#ro_not_required').val().split(',');
						} else {
							$('#product').append('<input type="hidden" name="ro_not_required" id="ro_not_required" value="">');
						}
						var new_ids = [];
						for (var i in current_ids) {
							if (current_ids[i] != option_id) {
								new_ids.push(current_ids[i]);
							}
						}
						if (!ro_option_is_available(option_id)) {
							new_ids.push(option_id);
						}
						$('#ro_not_required').val( new_ids.toString());
					}
					
				}
				
				function ro_set_accessible_values(option_id, accessible_values) {
				
					var current_value = ($('input[type=radio][name="'+option_prefix+'['+option_id+']"]:checked').val() || $('select[name="'+option_prefix+'['+option_id+']"]').val());
				
					if ($('select[name="'+option_prefix+'['+option_id+']"]').length) {
					
						if (current_value && $.inArray(current_value, accessible_values)==-1) {
							$('select[name="'+option_prefix+'['+option_id+']"]').val("");
						}
						
						if (hide_inaccessible) {
						
							select_options = all_select_ov[option_prefix+"["+option_id+"]"];
							for (var i=0;i<select_options.length;i++) {
								if (select_options[i]) {
									option_value_disabled = ($.inArray(select_options[i],accessible_values) == -1);
									// hiding options for IE
									$('select[name="'+option_prefix+'['+option_id+']"]').toggleOption(select_options[i], !option_value_disabled);
									
								}
							}
							
						} else {
						
							select_options = $('select[name="'+option_prefix+'['+option_id+']"]')[0].options;
							for (var i=0;i<select_options.length;i++) {
								if (select_options[i].value) {
									option_value_disabled = ($.inArray(select_options[i].value,accessible_values) == -1);
									select_options[i].disabled = option_value_disabled;
									if (option_value_disabled) {
										$(select_options[i]).addClass('ro_option_disabled');
									} else {
										$(select_options[i]).removeClass('ro_option_disabled');
									}
								}
							}
							
						}
						
						if ( ro_theme_name == 'theme638' ) { // VIVA theme
							$('select[name="'+option_prefix+'['+option_id+']"]').selectbox("detach");
							
							$('select[name="'+option_prefix+'['+option_id+']"]').selectbox({
								effect: "slide",
								speed: 400
							});
							
						}
						
					} else if ($('input[type=radio][name="'+option_prefix+'['+option_id+']"]').length) {	
						
						if (current_value && $.inArray(current_value, accessible_values)==-1) {
							$('input[type=radio][name="'+option_prefix+'['+option_id+']"]:checked')[0].checked=false;
							
							// << Product Image Option DropDown compatibility
							var piodd_option_div = $('#image-option-'+option_id);
							if (piodd_option_div.length) {
								ro_piodd_set_value(option_id, '');
							}
							// >> Product Image Option DropDown compatibility
						}
						
						radio_options = $('input[type=radio][name="'+option_prefix+'['+option_id+']"]');
						for (var i=0;i<radio_options.length;i++) {
							option_value_disabled = ($.inArray(radio_options[i].value,accessible_values) == -1);
							$(radio_options[i]).prop('disabled', option_value_disabled); // hidden should be disabled too
							
							if (hide_inaccessible) {
							
								//$(radio_options[i]).attr('disabled', option_value_disabled); // disable anyway
								
								if ( ro_theme_name == 'theme638' ) { // VIVA theme
									$(radio_options[i]).parent().toggle(!option_value_disabled);
									
									// style change for padding change
									if (i == 0) {
										if (option_value_disabled) {
											if ($(radio_options[i]).parent().hasClass('radio')) {
												$(radio_options[i]).parent().removeClass('radio');
												$(radio_options[i]).parent().addClass('_radio_ro');
											}
										} else {
											if ($(radio_options[i]).parent().hasClass('_radio_ro')) {
												$(radio_options[i]).parent().removeClass('_radio_ro');
												$(radio_options[i]).parent().addClass('radio');
											}
										}
									}
								} else {
									$(radio_options[i]).parent().parent().toggle(!option_value_disabled);
									$(radio_options[i]).toggle(!option_value_disabled);
									
									// style change for padding change
									if (i == 0) {
										if (option_value_disabled) {
											if ($(radio_options[i]).parent().parent().hasClass('radio')) {
												$(radio_options[i]).parent().parent().removeClass('radio');
												$(radio_options[i]).parent().parent().addClass('_radio_ro');
											}
										} else {
											if ($(radio_options[i]).parent().parent().hasClass('_radio_ro')) {
												$(radio_options[i]).parent().parent().removeClass('_radio_ro');
												$(radio_options[i]).parent().parent().addClass('radio');
											}
										}
									}
								} 
								
								
								
								
								// << Product Image Option DropDown compatibility
								var piodd_option_div = $('#image-option-'+option_id);
								var piodd_value = piodd_option_div.find('ul.dd-options input.dd-option-value[value='+radio_options[i].value+']');
								if (piodd_value.length) {
									piodd_value.parent().toggle(!option_value_disabled);
								}
								// >> Product Image Option DropDown compatibility
							
							} else {
								
								if (option_value_disabled) {
									$(radio_options[i]).parent().fadeTo("fast", 0.2);
								} else {
									$(radio_options[i]).parent().fadeTo("fast", 1);
								}
								
								// << Product Image Option DropDown compatibility
								// make copies of unavailable elements, originals hide in hidden div, when element became available again - place it back
								var piodd_option_div = $('#image-option-'+option_id);
								
								if ( piodd_option_div.find('ul.dd-options').length ) {
									
									var ro_hidden_div_id = piodd_option_div.attr('id')+'-ro-hidden';
									
									if ( !$('#'+ro_hidden_div_id).length ) {
										piodd_option_div.after('<div id="'+ro_hidden_div_id+'" style="display: none;"></div>');
									}
									var ro_hidden_div = $('#'+ro_hidden_div_id);
									
									
									var clone_id = 'clone_'+radio_options[i].value;
									if (option_value_disabled) {
									
										var piodd_value = piodd_option_div.find('ul.dd-options input.dd-option-value[value='+radio_options[i].value+']');
										
										if (piodd_value.length) {
									
											if ( !piodd_option_div.find('[clone_id='+clone_id+']').length ) {
												var ro_clone = piodd_value.parent().clone(true, true).appendTo(ro_hidden_div);
												ro_clone.clone().insertAfter(piodd_value.parent()).attr('clone_id', clone_id).fadeTo('fast', 0.2);
												piodd_value.parent().remove();
											}
										}
										
									} else {
										if (ro_hidden_div.find('[value='+radio_options[i].value+']').length) {
											ro_hidden_div.find('[value='+radio_options[i].value+']').parent().clone(true, true).insertAfter(piodd_option_div.find('[clone_id='+clone_id+']'));
											ro_hidden_div.find('[value='+radio_options[i].value+']').parent().remove();
											piodd_option_div.find('[clone_id='+clone_id+']').remove();
										}
									}
									
								}
								// >> Product Image Option DropDown compatibility
								
							}
							
							
						}
						
						
						
					}
					
					ro_hide_unavailable_option(option_id);
					ro_unavailable_options_not_required(option_id);
				
				}
				
				function ro_get_options_values(options_keys) {
				
					var options_values = {};
				
					$('select[name^="'+option_prefix+'["], input[type=radio][name^="'+option_prefix+'["]').each(function(){
						option_id = ro_get_product_option_id_from_name( $(this).attr('name') );
						
						if ($.inArray(option_id,ro_product_options) != -1) {
							
							if ($.inArray(option_id,options_keys) == -1) {
								options_values[option_id] = 0;
								options_keys.push(option_id);
							}
							
							if ( $(this).find('option[value]').length ) { // select
								options_values[option_id] = $(this).val();
							} else { // radio
								if ( $(this).is(':checked') ) {
									options_values[option_id] = $(this).val();
								}
							}
							
							
						}
					});
					
					return options_values;
				
					
				}
				
				// correct auto selection for options some values already selected
				function ro_use_first_values(set_anyway) {
					
					var options_values = ro_get_options_values([]);
					
					var selected_options = [];
					var has_selected = false;
					for (var optkey in options_values) {
						if((options_values[optkey] instanceof Function) ) { continue; }
						if (options_values[optkey]) {
							has_selected = true;
							selected_options.push(optkey);
							//break;
						}
					}
					
					if (has_selected || set_anyway) {
					
						for (var i in ro_options_steps) {
							
							var product_option_id = ro_options_steps[i];
							
							if ( $.inArray(product_option_id, ro_product_options) != -1 ) {
							
								var product_option_value_id = false;
								
								if ($('select[name="'+option_prefix+'['+product_option_id+']"]').length) {
									var product_option_value_id = $('select[name="'+option_prefix+'['+product_option_id+']"] option[value][value!=""]:not(:disabled)').val();
								} else if ($('input[type=radio][name="'+option_prefix+'['+product_option_id+']"]').length > 0) {
									var product_option_value_id = $('input[type=radio][name="'+option_prefix+'['+product_option_id+']"]:not(:disabled):first').val();
								}
								
								if (product_option_value_id && ($.inArray(product_option_id, selected_options) != -1 || set_anyway) ) {
									ro_set_option_value(product_option_id, product_option_value_id);
									ro_options_values_access();
									ro_set_block_options();
									ro_set_journal2_options();
								}
								
							}
							
						}
					
					}
					
					
				}
				
				function ro_journal2_set_value(product_option_value_id) {
					if (use_journal2 && $('li[data-value="'+product_option_value_id+'"]').length) {
						$('li[data-value="'+product_option_value_id+'"]').siblings('li').removeClass('selected');
						$('li[data-value="'+product_option_value_id+'"]').removeClass('selected').addClass('selected');
					}
				}
				
				function ro_set_option_value(product_option_id, product_option_value_id) {
					
					if ($('select[name="'+option_prefix+'['+product_option_id+']"]').length > 0) {
						$('[name="'+option_prefix+'['+product_option_id+']"]').val(product_option_value_id);
						
						ro_journal2_set_value(product_option_value_id);
						
					} else if ($('input[type=radio][name="'+option_prefix+'['+product_option_id+']"]').length > 0) {
						$('input[type=radio][name="'+option_prefix+'['+product_option_id+']"]').prop('checked', false);
						$('input[type=radio][name="'+option_prefix+'['+product_option_id+']"][value='+product_option_value_id+']').prop('checked', true);
						
						// << Product Image Option DropDown compatibility
						ro_piodd_set_value(product_option_id, product_option_value_id);
						// >> Product Image Option DropDown compatibility
						
						ro_journal2_set_value(product_option_value_id);
						
					}
					
				}
				
				function ro_set_selected_combination(ro_id, skip_access) {
				
					if (ro_data) {
						for (var i in ro_data) {
							if (ro_data[i]['ro'][ro_id]) {
								
								for (var product_option_id in ro_data[i]['ro'][ro_id]['options']) {
									ro_set_option_value(product_option_id, ro_data[i]['ro'][ro_id]['options'][product_option_id]);
								}
								
								break;
							}
						}
					}
				
					if ( typeof(skip_access) == 'undefined' || !skip_access ) {

						ro_options_values_access();
						ro_set_block_options();
						ro_set_journal2_options();
						
					}
					
				}
				
				function ro_get_product_option_id_from_name(name) {
					return name.substr(option_prefix_length+1, name.indexOf(']')-(option_prefix_length+1) )
				}
				
				// for step-by-step way
				function ro_get_options_steps() {
					var options_steps = [];
					var product_option_id = "";
					
					//for (var i=0;i<$('input[name^="'+option_prefix+'["]').length;i++) {
					$('input[name^="'+option_prefix+'["], select[name^="'+option_prefix+'["]').each(function(){
					
						product_option_id = ro_get_product_option_id_from_name($(this).attr('name'));
						//if (!isNaN(product_option_id)) product_option_id = parseInt(product_option_id);
						
						if ($.inArray(product_option_id, ro_product_options) != -1) {
							if ($.inArray(product_option_id, options_steps) == -1) {
								options_steps.push(product_option_id);
							}
						}
						
					});
					
					return options_steps;
				}
				
				function ro_options_values_access() {
					
					if (!ro_data || !Object.keys(ro_data).length) return;
					
					if (ro_step_by_step) {
					
						var prev_options_values = {};
						var prev_options = [];
						var option_accessible_values = [];
						var one_prev_value_is_not_set = false;
						
						for (var i=0;i<ro_options_steps.length;i++) {
							if (i>0) {
								// if previous option value is selected or if previous option has no available values
								//if (prev_options[i-1] || (one_prev_value_is_set && (!prev_option_accessible_values || prev_option_accessible_values.length==0) ) ) {
								if (!one_prev_value_is_not_set) {
									// limitaion on previous
									option_accessible_values = ro_option_values_access(prev_options_values, ro_options_steps[i]);
									
								} else {
									// disable all
									ro_set_accessible_values(ro_options_steps[i], []);
									option_accessible_values = [];
								}
							}
							prev_options.push( ($('input[type=radio][name="'+option_prefix+'['+ro_options_steps[i]+']"]:checked').val() || $('select[name="'+option_prefix+'['+ro_options_steps[i]+']"]').val()) );
							//one_prev_value_is_set = one_prev_value_is_set || prev_options[i];
							prev_options_values[ro_options_steps[i]] = prev_options[prev_options.length-1];
							
							if ((option_accessible_values.length || i==0) && !prev_options[i] ) { // option has available values, but none of them is selected
								one_prev_value_is_not_set = true;
							}
							
						}
					
					} else {
					
						var options_keys = [];
						var options_values = ro_get_options_values(options_keys);
						
						for (var i=0;i<options_keys.length;i++) {
							ro_option_values_access(options_values, options_keys[i]);
						}
						
					}
					
					ro_stock_control(0);
					
					
					ro_check_block_options();
					
					ro_check_auto_select();
					
					<?php if (isset($ro_settings['spec_model']) && $ro_settings['spec_model']) { ?>
						ro_set_model();
					<?php } ?>
					
					<?php if (isset($ro_settings['spec_ofs']) && $ro_settings['spec_ofs']) { ?>
						ro_set_stock();
					<?php } ?>
					
				}
				
				// autoselection for last available option value
				function ro_check_auto_select() {
				
					if (auto_select_last) {
					
						for (var i in ro_options_steps) {
							
							var product_option_id = ro_options_steps[i];
							
							if ( $('select[name="'+option_prefix+'['+product_option_id+']"]').length ) {
								
								var options_elems = $('select[name="'+option_prefix+'['+product_option_id+']"]').find('option[value][value!=""]:not(:disabled)');
								
								if (options_elems.length == 1 && !$(options_elems[0]).is(':selected')) {
								
									var product_option_value_id = $(options_elems[0]).val();
									
									ro_set_option_value(product_option_id, product_option_value_id);
									$(options_elems[0]).parent().change();
									return;
								}
								
							} else if ( $('input:radio[name="'+option_prefix+'['+product_option_id+']"]').length ) {
							
								var radio_elems = $('input:radio[name="'+option_prefix+'['+product_option_id+']"]:not(:disabled):visible');
								
								if (radio_elems.length == 1 && !$(radio_elems[0]).is(':checked')) {
									
									var product_option_value_id = $(radio_elems[0]).val();
									
									ro_set_option_value(product_option_id, product_option_value_id);
									
									$(radio_elems[0]).change();
									return;
									
								}
							
							}
							
						}
					
					}
				
				}
				
				// autorelection for first values
				function ro_auto_select_first() {
					
					if (ro_settings && ro_settings['select_first'] && ro_settings['select_first'] == 1) {
						
						for (var i in ro_options_steps) {
							if (!ro_options_steps.hasOwnProperty(i)) continue;
							
							var product_option_id = ro_options_steps[i];
							
							if ( $('select[name="'+option_prefix+'['+product_option_id+']"]').length ) {
								
								var elem = $('select[name="'+option_prefix+'['+product_option_id+']"]');
								if ( !elem.val() ) {
									
									var elem_option = elem.find('option[value][value!=""]:not(:disabled)');
									if (elem_option.length) {
										elem.val(elem_option.val());
										elem.change();
									}
									
								}
								
							} else if ( $('input:radio[name="'+option_prefix+'['+product_option_id+']"]').length ) {
								
								if ( !$('input:radio[name="'+option_prefix+'['+product_option_id+']"]:checked').length ) {
									var elem = $('input:radio[name="'+option_prefix+'['+product_option_id+']"]:not(:disabled):first');
									if (elem.length) {
										elem.prop('checked', true);
										elem.change();
										
									}
								}
								
							}
							
						}
						
					}
				
				}
				
				function ro_set_model() {
				
					var options_values = ro_get_options_values([]);
					var ro_ids = ro_get_current_ro_ids(options_values);
					var product_model = "<?php echo addslashes($model); ?>";
					var model = "";
					
					if (ro_ids.length) {
						for (var i in ro_data) {
							var ro_dt = ro_data[i];
							
							for (var j in ro_ids) {
								var ro_id = ro_ids[j];
								if (ro_dt['ro'][ro_id] && ro_dt['ro'][ro_id]['model']) {
									if (ro_settings['spec_model'] == 1) {
										model = ro_dt['ro'][ro_id]['model'];
									} else if (ro_settings['spec_model'] == 2 || ro_settings['spec_model'] == 3) {
										model+= ro_dt['ro'][ro_id]['model'];
									}
								}
							}
						}
					}
					
					if (model) {
						if (ro_settings['spec_model'] == 3) {
							model = product_model + model;
						}
					} else {
						model = product_model;
					}
					$('#product_model').html(model);
				}
				
				function ro_set_stock() {
				
				
					var stock_text = "<?php echo addslashes($text_stock); ?>";
					var stock = "<?php echo addslashes($stock); ?>";
					if (use_journal2) {
						var journal2_stock_status = "<?php echo isset($stock_status) ? $stock_status : ''; ?>";
					}
					
					var options_values = ro_get_options_values([]);
					var ro_ids = ro_get_current_ro_ids(options_values);
					
					if (ro_ids.length) {
						for (var i in ro_data) {
							var ro_dt = ro_data[i];
							
							for (var j in ro_ids) {
								var ro_id = ro_ids[j];
							
								if (ro_dt['ro'][ro_id] && ro_dt['ro'][ro_id]['stock']) {
									var stock = ro_dt['ro'][ro_id]['stock'];
									
									if (use_journal2) {
										var journal2_stock_status = ro_prices[roid]['in_stock'] ? 'instock' : 'outofstock';
									}
									
									break;
								}
							}
						}
					}
					
					if (use_journal2) {
						//journal2 uses specific price and stock update, but it's slow and doesn't swith block class (style)
						$('#product .p-stock .journal-stock').removeClass('instock, outofstock').addClass(journal2_stock_status);
						$('#product .p-stock .journal-stock').html(stock);
					} else {
						$('#product_stock').html(stock);
					}
					
					
				}
				
				function ro_set_combination_by_model(model) {
				
					if (model && ro_data) {
						for (var i in ro_data) {
							for (var ro_id in ro_data[i]['ro']) {
								if (ro_data[i]['ro'][ro_id][model] && ro_data[i]['ro'][ro_id][model].toLowerCase() == model.toLowerCase()) {
									ro_set_selected_combination(ro_id);
									return true;
								}
							}
						}
					}
				
					return false;
				}
				
				// Block Option & journal2 compatibility
				// show/hide enable/disable options block
				function ro_check_block_options() {
			
					if (use_block_options || use_journal2) {
						
						var available_values = [];
						
						// block options use SELECTs for select & radio
						$('select[name^="'+option_prefix+'["]').find('option').each( function () {
							
							if ($(this).val()) {
								if (hide_inaccessible) {
									available_values.push( $(this).val() );
								} else {
									if (! $(this).attr('disabled')) {
										available_values.push( $(this).val() );
									}
								}
							}
							
						});
						
						// block options use RADIOs for images
						$('input[type=radio][name^="'+option_prefix+'["]').each( function () {
							
							if (hide_inaccessible) {
								if ($(this)[0].style.display != 'none') {
									available_values.push( $(this).val() );
								}
							} else {
								if (!$(this).attr('disabled')) {
									available_values.push( $(this).val() );
								}
							}
							
						});
						
						// Product Block Option Module
						if (use_block_options) {
							$('a[id^=block-option],a[id^=block-image-option]').each( function () {
								if ($.inArray($(this).attr('option-value'), available_values) == -1) {
									$(this).removeClass('block-active');
									if (hide_inaccessible) {
										$(this).hide();
									} else {
										if (!$(this).attr('disabled')) {
											$(this).attr('disabled', true);
											$(this).fadeTo("fast", 0.2);
										}
									}
								} else {
									if (hide_inaccessible) {
										$(this).show();
									} else {
										if ($(this).attr('disabled')) {
											$(this).attr('disabled', false);
											$(this).fadeTo("fast", 1);
										}
									}
								}
								
							} );
						}
						
						// Journal2
						if (use_journal2) {
						
							$('#product').find('li[data-value]').each(function() {
							
								if ($.inArray($(this).attr('data-value'), available_values) == -1) {
									$(this).removeClass('selected');
									if (hide_inaccessible) {
										$(this).hide();
									} else {
										if (!$(this).attr('disabled')) {
											$(this).attr('disabled', true);
											$(this).fadeTo("fast", 0.2);
										}
									}
								} else {
									if (hide_inaccessible) {
										$(this).show();
									} else {
										if ($(this).attr('disabled')) {
											$(this).attr('disabled', false);
											$(this).fadeTo("fast", 1);
										}
									}
								}
								
								// change standart Journal2 function
								$(this).unbind('click');
								
								
								$(this).click(function () {
									if ($(this).attr('disabled')) {
										return;
									}
									$(this).siblings().removeClass('selected');
									$(this).addClass('selected');
									$(this).parent().siblings('select').find('option[value=' + $(this).attr('data-value') + ']').attr('selected', 'selected');
									$(this).parent().siblings('select').trigger('change');
									
									$(this).parent().parent().find('.radio input[type=radio][name^="'+option_prefix+'"]').attr('checked', false);
									$(this).parent().parent().find('.radio input[type=radio][name^="'+option_prefix+'"][value='+$(this).attr('data-value')+']').attr('checked', true).trigger('change');
									
									if (Journal.updatePrice) {
										Journal.updateProductPrice();
									}
									
								});
								
								
							});
							
						}
						
					}
					
				}
				
				// Journal2 compatibility
				// make option block selected (the same as in original input/select)
				function ro_set_journal2_options() {
					
					if (use_journal2) {
						$('select[name^="'+option_prefix+'["]').find('option').each( function () {
							var poid = $(this).parent().attr('name').substr(7, $(this).parent().attr('name').length-8);
							
							// выключаем все блоки для SELECT
							//$(this).parent().parent().find('li[data-value]').removeClass('selected');
							
							if ($(this).parent().val()) {
								$(this).parent().parent().find('li[data-value='+$(this).parent().val()+']').removeClass('selected').addClass('selected');
							} else {
								$(this).parent().parent().find('li[data-value]').removeClass('selected');
							}
							
						});
						
						// block options use RADIOs for images
						$('input[type=radio][name^="'+option_prefix+'["]').each( function () {
							var poid = $(this).attr('name').substr(7, $(this).attr('name').length-8);
							
							// turn off only current block for RADIO
							//$(this).parent().find('li[data-value]').removeClass('selected');

							if ($(this).is(':checked')) {
							
								$('#input-option'+poid).parent().find('li[data-value='+$(this).val()+']').removeClass('selected').addClass('selected');
							} else {
							
								$('#input-option'+poid).parent().find('li[data-value]').removeClass('selected');
							}
							
						});
						
					}
					
				}
				
				
				
				$('select[name^="'+option_prefix+'"]').change(function(){
					ro_options_values_access();
				})
				
				$('input[type=radio][name^="'+option_prefix+'"]').change(function(){
					ro_options_values_access();
				})
				
				$("input[type=text][name=quantity]").change(function(){
					ro_stock_control(0);
				})
				
				
				ro_options_values_access();
				
				$(document).ready( function() {
				
					if ( typeof(ros_to_select) != 'undefined' && ros_to_select && ros_to_select.length) {
					
						var ro_id = false;
						for (var i in ros_to_select) {
							if (ros_to_select.hasOwnProperty(i)) {
								var ro_id = ros_to_select[i];
								ro_set_selected_combination(ro_id, true); // without limitaions
							}
						}
						if (ro_id) {
							ro_set_selected_combination(ro_id); /// with limitations
						}
					
					} else {
				
						// if there's filter and it's equal to related options model - this related options combination should be selected
						if (!ro_set_combination_by_model(filter_name)) { // if there's not filter relevant to related options 
							// if any value is selected - all values should be reselected (to be relevant to available related options)
							//if (ro_default !== false) {
							//	ro_set_selected_combination(ro_default);
							//} else {
								<?php if (!isset($poip_ov)) { ?>
									setTimeout(function () { ro_use_first_values(); }, 1); // if any combination is selected (may be other extension), check it and change if it's not relevant to available related options
								<?php } ?>
							//}
						}
						ro_options_values_access();
						ro_auto_select_first();
					}
					
					
				
				});
				
				<?php
				
					if (isset($ro_settings) && isset($ro_settings['show_clear_options']) && $ro_settings['show_clear_options']) {
						if ((int)$ro_settings['show_clear_options'] == 1) { ?>
							$(document).ready( function() {
								$('#product').find('h3').after('<div class="form-group"><a href="#" id="clear_options"><?php echo $text_ro_clear_options; ?></a></div>');
							});
						<?php } else { ?>
							$(document).ready( function() {
								<?php if ($ro_theme_name=='journal2') { ?>
									$('#product .options').append('<div class="form-group"><a href="#" id="clear_options" ><?php echo $text_ro_clear_options; ?></a></div>');
									//$('#product').find('h3:first').parent().append('<div class="form-group"><a href="#" id="clear_options" ><?php echo $text_ro_clear_options; ?></a></div>');
								<?php } else { ?>
									$('#product #input-quantity').parent().before('<div class="form-group"><a href="#" id="clear_options"><?php echo $text_ro_clear_options; ?></a></div>');
								<?php } ?>
							});
						<?php } ?>
						
						$('#product').on('click', '#clear_options', function(e){
							e.preventDefault();
							ro_clear_options();
						});
						
				<?php		
					}
				?>
				
				if (use_journal2) { // compatibility for live price update with specials in related options
				
					var div_prod_opt = $('div.product-options');
				
					if (div_prod_opt.length == 1) {
						if ( div_prod_opt.find('div.price').find('span.product-price').length ) {
							div_prod_opt.find('div.price').find('span.product-price').after('<span class="price-old" style="display: none"></span><span class="price-new" style="display: none"></span>');
							
						} else if ($('div.price').find('span.price-old').length) {
							div_prod_opt.find('div.price').find('span.price-old').before('<span class="product-price" itemprop="price" style="display: none"></span>');
						}
						
						setInterval( function() {
						
							if ( div_prod_opt.find('div.price').find('span.product-price').html() && div_prod_opt.find('div.price').find('span.price-old').html() && div_prod_opt.find('div.price').find('span.price-new').html() ) {
							
								if ( div_prod_opt.find('div.price').find('span.price-old').html() == div_prod_opt.find('div.price').find('span.price-new').html()
									|| Number($('div.product-options').find('div.price').find('span.price-new').html().replace(/\D/g, '')) == 0 ) {
									div_prod_opt.find('div.price').find('span.price-old').hide();
									div_prod_opt.find('div.price').find('span.price-new').hide();
									div_prod_opt.find('div.price').find('span.product-price').show();
								} else {
									div_prod_opt.find('div.price').find('span.price-old').show();
									div_prod_opt.find('div.price').find('span.price-new').show();
									div_prod_opt.find('div.price').find('span.product-price').hide();
								}
							}
						}, 200 );
					
					}
					
				}
				
				</script>
				
			

			
			<?php } ?>

<!-- >> Related Options PRO / Связанные опции PRO -->
<?php echo $footer; ?>
