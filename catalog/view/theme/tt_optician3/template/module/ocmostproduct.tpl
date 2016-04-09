<div class="most-products-container">

<div class="most-products-slider group-title module-title2"><h2><?php echo $heading_title; ?></h2></div>
 <?php 
	$count = 0; 
	$row=1;
	$rows = $config_slide['f_rows'];
	if(!$rows) {$rows=1;}
  ?>
	<div class="row">
		<div class="owl-demo-mostproduct">
		  <?php foreach ($products as $product) { ?>
    <?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++; ?>
    <div class="item-inner">
							<div class="oc-box-content">
								<div class="box-image">
									<?php if ($product['thumb']) { ?>
										<a class="product-image" href="<?php echo $product['href']; ?>">
											<div class="product-image">
												<!--<?php if($product['rotator_image']!=""){ ?>                                             <img class="img2" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />                                         <?php }?>-->
												<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
											</div>
										</a>
									<?php } else { ?>
										<a class="product-image" href="<?php echo $product['href']; ?>">
											<div class="product-image">
												<img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
											</div>
										</a>
									<?php } ?>
								</div>
								<div class="box-des">
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
								</div>
								
							</div><!-- oc-box-content -->
						</div> <!-- item-inner -->
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
  $(".owl-demo-mostproduct").owlCarousel({
	  autoPlay: <?php if($config_slide['f_speed_slide']> 0 ) { echo  'true' ;} else { echo 'false';} ?>, //Set AutoPlay to 3 seconds
      items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
	  slideSpeed : <?php if($config_slide['f_ani_speed']) { echo $config_slide['f_ani_speed'] ;} else { echo 200;} ?>,
	  navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	  paginationNumbers : true,
	  pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	  stopOnHover : false,
	  itemsDesktop : [1199,3],
	  itemsDesktopSmall : [980,2],
	  itemsTablet: [768,2],
	  itemsMobile : [479,1],
  });
 
});
</script>