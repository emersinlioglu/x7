<?php $tab_effect = 'wiggle'; ?>
<script type="text/javascript">
$(document).ready(function() {
	$(".<?php echo $cateogry_alias;?> .tab_content_category").hide();
	$(".<?php echo $cateogry_alias;?> .tab_content_category:first").show(); 
    $(".<?php echo $cateogry_alias;?> ul.tabs-categorys li:first").addClass("active");
	$(".<?php echo $cateogry_alias;?> ul.tabs-categorys li").click(function() {
		$(".<?php echo $cateogry_alias;?> ul.tabs-categorys li").removeClass("active");
		$(this).addClass("active");
		$(".<?php echo $cateogry_alias;?> .tab_content_category").hide();
		$(".<?php echo $cateogry_alias;?> .tab_content_category").removeClass("animate1 <?php echo $tab_effect;?>");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 <?php echo $tab_effect;?>");
		$("#"+activeTab).fadeIn(); 
	});
});
</script>
<?php 
	$row=1;
	$row = $config_slide['f_rows']; 
	if(!$row) {$row=1;}
?>
<div class="product-tabs-category-container-slider special-button-owl <?php echo $cateogry_alias;?>">
    <div class="tab-title group-title">
        <h2><?php echo $config_slide['tab_name'];?></h2>
        <ul class="tabs-categorys"> 
    	<?php $count=0; ?>
    	<?php foreach($category_products as $cate_id => $products ){ ?>
    		<li rel="tab_cate<?php echo $cate_id; ?>"  >
    				<?php echo $array_cates[$cate_id]; ?>
    		</li>
    			<?php $count= $count+1; ?>
    	<?php } ?>	
    	</ul>
    
    </div><!-- tab-title -->
	<div class="row">
		<div class="tab_container_category"> 
		<?php foreach($category_products as $cate_id => $products ){ ?>
			<div id="tab_cate<?php echo $cate_id; ?>" class="tab_content_category">
				<ul class="productTabContent owl-demo-tabcate">
				<?php $i=0; ?>
				<?php foreach ($products as $product){ ?>
							<?php if($i++ % $row ==0){  echo  "<li class='row_item'><div class='product-thumb'>"; } ?>
							 <div class="item">
						<div class="item-inner">
							
							<div class="images-container">
								<?php if($product['is_new']) { ?>
									<?php if($product['special']) { ?>
										<div class="label_sale"><span><?php echo $text_label_sale ?></span></div>
									<?php } else { ?>
										<div class="label_new"><span><?php echo $text_label_new ?></span></div>
									<?php } ?>
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
									<?php if($config_slide['tab_cate_show_addtocart']) { ?>
									<button class="button btn-cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
										<span><span><?php echo $button_cart; ?></span></span>
									</button>
								<?php } ?>
								</div><!-- actions -->
								<div class="des-inner">
									<?php if($config_slide['tab_cate_show_des']) { ?>
									<h2 class="product-name">
											<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
									</h2>
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
									<?php if($config_slide['tab_cate_show_price']) { ?>
									<?php if ($product['price']) { ?>
										<?php if (!$product['special']) { ?>
											<div class="price-box box-regular">
												<span class="regular-price">
													<span class="price"><?php echo $product['price']; ?></span>
												</span>
											</div>
										<?php } else { ?>
											<div class="price-box box-special">
												<p class="special-price"><span class="price"><?php echo $product['special']; ?></span></p>
												<p class="old-price"><span class="price"><?php echo $product['price']; ?></span></p>
											</div>
										<?php } ?>
									<?php } ?>
								<?php } ?>
								</div>
								
							</div><!--des-container-->
							
						</div> <!-- item-inner -->
					</div> <!-- item -->
					<?php if($i % $row == 0 ): ?>
					</div></li><!-- row_items-->
				 <?php else: ?>
					<?php if($i == count($products)): ?>
						</div></li><!-- row_items-->
					<?php endif; ?>
				 <?php endif; ?>
				<?php } ?>
				</ul><!-- productTabContent -->
			</div>
		<?php } ?>
	 </div> <!-- .tab_container_category -->
	 </div>
</div><!-- <?php echo $cateogry_alias;?> -->
<script type="text/javascript">
$(document).ready(function() { 
  $(".<?php echo $cateogry_alias;?> .owl-demo-tabcate").owlCarousel({
	autoPlay: <?php if($config_slide['tab_cate_ani_speed']<1) { echo "false";} else{ echo "true" ;}?>,
	items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
	slideSpeed : <?php if($config_slide['tab_cate_speed_slide']) { echo $config_slide['tab_cate_speed_slide'] ;} else { echo 200;} ?>,
	navigation : <?php if($config_slide['tab_cate_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	paginationNumbers : true,
	pagination : <?php if($config_slide['tab_cate_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	stopOnHover : false,
	itemsDesktop : [1199,3],
	itemsDesktopSmall : [991,2],
	itemsTablet: [700,2],
	itemsMobile : [400,1],
  });
});
</script>