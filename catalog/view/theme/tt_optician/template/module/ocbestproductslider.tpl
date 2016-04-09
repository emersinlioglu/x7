<div class="ocbestseller-slider">
	<div class="module-title">
		<h3><?php echo $heading_title; ?></h3>
	</div>
	<div class="row">
<div class="owl-demo-bestsellerproduct">
    <?php
	$count = 0;
	$row=1;
	$rows = $config_slide['f_rows'];
	if(!$rows) {$rows=1;}
  ?>
    <?php foreach ($products as $product) { ?>
    <?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++; ?>
    <div class="item_product">
			   <div class="image">
				  <a href="<?php echo $product['href']; ?>">
					 <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
				  </a>
			   </div>
			<div class="caption">
			   <h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
			   <?php if($config_slide['f_show_des']){ ?>
				  <p class="des-newproduct"><?php echo $product['description']; ?></p>
			   <?php } ?>
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
			<?php if($config_slide['f_show_price']) { ?>
			   <?php if ($product['price']) { ?>
			   <div class="price-box">
				   <?php if (!$product['special']) { ?>
					   <span class="price"><?php echo $product['price']; ?></span>
				   <?php } else { ?>
					   <p class="old-price"><span class="price"><?php echo $product['price']; ?></span></p>
					   <p class="special-price"><span class="price"><?php echo $product['special']; ?></span></p>
				   <?php } ?>
			   </div>
			   <?php } ?>
		   <?php } ?>
			</div><!-- caption-->
			<div class="button-group">
			   <?php if($config_slide['f_show_addtocart']) { ?>
				  <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
				  <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
				  <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
			   <?php } ?>
			</div><!--button-group-->
			</div><!--item_product-->
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
</div>
<script type="text/javascript">
$(document).ready(function() {
  $(".owl-demo-bestsellerproduct").owlCarousel({
	  autoPlay: <?php if($config_slide['f_speed_slide']<1) { echo "false";} else { echo $config_slide['f_speed_slide'] ;} ?>, //Set AutoPlay to 3 seconds
      items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
	  slideSpeed : <?php if($config_slide['f_ani_speed']) { echo $config_slide['f_ani_speed'] ;} else { echo 200;} ?>,
	  navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	  paginationNumbers : false,
	  pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	  stopOnHover : false,
	  itemsDesktop : [1199,1],
	  itemsDesktopSmall : [980,1],
	  itemsTablet: [768,1],
	  itemsMobile : [479,1],
  });

});
</script>