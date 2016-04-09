<div class="clearfix"></div>
<div class="ocnewproductslider special-button-owl">
   <div class="ocnewproduct-title group-title2">
	  <h2><?php echo $heading_title; ?></h2>
   </div>
   <?php 
	  $count = 0; 
	  $row=1;
	  $rows = $config_slide['f_rows']; 
	  if(!$rows) {$rows=1;}
   ?>
   <div class="row">
   <div class="owl-demo-newproduct">
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
					 <?php if($config_slide['f_show_addtocart']) { ?>
					 <button class="button btn-cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
						 <span><?php echo $button_cart; ?></span>
						 <em><?php echo $button_cart; ?></em>
					 </button>
				 <?php } ?>
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
				 <?php if($config_slide['f_show_price']) { ?>
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
</div>
<script type="text/javascript">
$(document).ready(function() { 
  $(".owl-demo-newproduct").owlCarousel({
	  autoPlay: <?php if($config_slide['f_speed_slide']<1) { echo "false";} else { echo $config_slide['f_speed_slide'] ;} ?>, //Set AutoPlay to 3 seconds
      items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
	  slideSpeed : <?php if($config_slide['f_ani_speed']) { echo $config_slide['f_ani_speed'] ;} else { echo 200;} ?>,
	  navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	  paginationNumbers : true,
	  pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	  stopOnHover : false,
	  itemsDesktop : [1199,3],
	  itemsDesktopSmall : [991,2],
	  itemsTablet: [700,2],
	  itemsMobile : [400,1],
 
  });
 
});
</script>