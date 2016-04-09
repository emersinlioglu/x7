<?php if($status): ?>
	<?php if($exist_fcate): ?>
		<script type="text/javascript">

			$(document).ready(function() {

				$(".<?php echo $category_alias;?> .tab_content_category").hide();
				$(".<?php echo $category_alias;?> .tab_content_category:first").show();

				$(".<?php echo $category_alias;?> ul.tabs-category li").click(function() {
					$("ul.tabs-category li").removeClass("active");
					$(this).addClass("active");
					$(".<?php echo $category_alias;?> .tab_content_category").hide();
					$(".<?php echo $category_alias;?> .tab_content_category").removeClass("animate1 <?php echo $tab_effect;?>");
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
		<div class="product-tabs-category-container-slider <?php echo $category_alias;?>">
			<ul class="tabs-category">
				<?php $count=0; ?>
				<?php foreach($categories as $category ){ ?>
				<li rel="tab_cate<?php echo $category['category_id']; ?>">
					<div>
						<img src="<?php echo $category['homethumb_image'] ?>" alt="" />
						<span><?php echo $category['name']; ?></span>
					</div>
				</li>
				<?php $count= $count+1; ?>
				<?php } ?>
			</ul>
			<div class="tab_container_category">
				<?php foreach($categories as $category): ?>
				<div id="tab_cate<?php echo $category['category_id']; ?>" class="tab_content_category">
					<?php if($category['products']): ?>
						<ul class="productTabContent owl-demo-tabcate">
							<?php $products = $category['products']; $i=0; ?>
							<?php foreach ($products as $product): ?>
								<?php if($i++ % $row ==0){  echo  "<li class='row_item'><ul>"; } ?>
									<li class="item">
										<?php if ($product['thumb']) { ?>
											<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
										<?php } ?>
										<?php if($config_slide['showdes']) { ?>
											<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
										<?php } ?>
										<?php if($config_slide['showprice']) { ?>
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

										<?php if ($product['rating']) { ?>
											<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
										<?php } ?>
										
										<?php if($config_slide['showaddtocart']) { ?>
											<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
										<?php } ?>
									</li>
								<?php if($i % $row ==0 || $i == count($products)) { echo "</ul></li>"; } ?>
							<?php endforeach; ?>
						</ul>
					<?php else: ?>
						<p><?php echo $text_empty_products; ?></p>
					<?php endif; ?>
				</div>
				<?php endforeach; ?>
			</div> <!-- .tab_container_category -->
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".<?php echo $category_alias;?> .owl-demo-tabcate").owlCarousel({
					autoPlay: <?php if($config_slide['autoplay']) { echo 'true'; } else { echo 'false';} ?>,
					items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 4;} ?>,
					slideSpeed : <?php if($config_slide['speed']) { echo $config_slide['speed'] ;} else { echo 3000;} ?>,
					navigation : <?php if($config_slide['shownextback']) { echo 'true' ;} else { echo 'false';} ?>,
					paginationNumbers : true,
					pagination : <?php if($config_slide['shownav']) { echo 'true' ;} else { echo 'false';} ?>,
					stopOnHover : false,
				});
			});
		</script>
	<?php else: ?>
		<p><?php echo $text_empty_categories; ?></p>
	<?php endif; ?>
<?php endif; ?>




