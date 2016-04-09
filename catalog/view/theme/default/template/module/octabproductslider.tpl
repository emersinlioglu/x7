
<?php $tab_effect = 'wiggle'; ?>
<script type="text/javascript">

$(document).ready(function() {

	$(".tab_content").hide();
	$(".tab_content:first").show(); 

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		$(".tab_content").removeClass("animate1 <?php echo $tab_effect;?>");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 <?php echo $tab_effect;?>");
		$("#"+activeTab).fadeIn(); 
	});
});

</script>
<?php 
	$count = 0; 
	$row=1;
	$rows = $config_slide['f_rows']; 
	
	if(!$rows) {$rows=1;}
  ?>
<div class="product-tabs-container-slider">
		<ul class="tabs"> 
		<?php $count=0; ?>
		<?php foreach($productTabslider as $productTab ){ ?>
			<li rel="tab_<?php echo $productTab['id']; ?>"  >
				<span class="tab_<?php echo $productTab['id']; ?>"><?php echo $productTab['name']; ?></span>
			</li>
				<?php $count= $count+1; ?>
		<?php } ?>	
		</ul>
		<div class="tab_container"> 
		<?php foreach($productTabslider as $productTab){ ?>
			<?php $count = 0; ?>
			<div id="tab_<?php echo $productTab['id']; ?>" class="tab_content">
				<div class="row">
				<div class="owl-demo-tabproduct">
				<?php foreach ($productTab['productInfo'] as $product){ ?>
				<?php if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++;  ?>
							<div class="item">
							<div class="item-inner">
									<?php if ($product['special']) { ?>
										<span class="sale"> Sale </span>
									<?php } ?>
									
								<div class="images-container">
									<?php if ($product['thumb']) { ?>
									<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
									<?php } else { ?>
									<div class="image"><a href="<?php echo $product['href']; ?>"><img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" /></a></div>
									<?php } ?>
									<div class="actions">
										<div class="button-group">
											<div class="cart">
												<?php if($config_slide['f_show_addtocart']) { ?>
												<button type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><span><?php echo $button_cart; ?></span></span></button>
												<?php } ?>
											</div>
											<div class="add-to-links">
												<div class="wishlist"><button type="button" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></button></div>
												<div class="compare"><button type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></button></div>
											</div>
										</div>
									</div>
								</div>
								<div class="des-container">
									<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
									<?php if($config_slide['f_show_des']) { ?>
										<div class="des"><?php echo $product['description']; ?></div>
									<?php } ?>
									<div class="review-price">
										<?php if (isset($product['rating'])) { ?>
										<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="" /></div>
										<?php } ?>
										<?php if($config_slide['f_show_price']) { ?>
										<?php if ($product['price']) { ?>
										<div class="price">
										  <?php if (!$product['special']) { ?>
										  <?php echo $product['price']; ?>
										  <?php } else { ?>
										  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
										  <?php } ?>
										</div>
										<?php } ?>
										<?php } ?>
									</div>
								</div>
							</div>
							</div>
							<?php if($count % $rows == 0 ): echo '</div>'; ?>
							<?php else: ?>
							<?php if($count == count($productTab['productInfo'])) { echo '</div>'; } ?>
							<?php endif; ?>
						<?php } ?>
				</div>
				</div><!-- .row -->
			</div>
			
		<?php } ?>
	
	</div><!-- .tab_container -->
</div>
<script type="text/javascript">
$(document).ready(function() { 
 $(".product-tabs-container-slider .tabs li:first").addClass("active");
  $(".owl-demo-tabproduct").owlCarousel({
		items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
		autoPlay : <?php if($config_slide['f_speed_slide']==0) { echo 'false' ;} else { echo 'true';} ?>,
		slideSpeed: <?php if($config_slide['f_ani_speed']) { echo $config_slide['f_ani_speed'] ;} else { echo 3000;} ?>,
		navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
		paginationNumbers : true,
		pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
		stopOnHover : false,
		itemsDesktop : [1199,4], 
		itemsDesktopSmall : [980,3], 
		itemsTablet: [768,2], 
		itemsMobile : [479,1]
  });
 
});
</script>



