<?php echo $header; ?>
<div class="layer-category">
    <div class="layered-navigation-block"></div>
    <div class="ajax-loader">
        <img src="<?php echo $oclayerednavigation_loader_img; ?>" alt="" />
    </div>
    
    <div class="container">
		<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
        <div class="main">
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-xs-12 col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class="page-title name-category"><h2><?php echo $heading_title; ?></h2></div>
            <?php if ($thumb || $description) { ?>
            <div class="">
                <?php if ($thumb) { ?>
                <div class="thumb-img"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <?php if ($description) { ?>
                <div class="description-category"><?php echo $description; ?></div>
                <?php } ?>
            </div>
            <?php } ?>
            <div class="custom-category ">
                <?php if ($products) { ?>
                <p class="compare-total"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
                <!-- product fillter -->
                <div class="product-filter">
                  <div class="sort-lg">
                      <button type="button"  class="btn btn-default grid-view" id="grid-view"  title="<?php echo $button_grid; ?>"><span>grid</span></button>
                      <button type="button"   class="btn btn-default list-view" id="list-view"  title="<?php echo $button_list; ?>"><span>list</span></button>
                    <select id="input-sort" onchange="oclayerednavigationajax.filter(this.value)">
                            <?php foreach ($sorts as $sorts2) { ?>
                            <?php if ($sorts2['value'] == $sort . '-' . $order) { ?>
                                <option value="<?php echo $sorts2['href']; ?>" selected="selected"><?php echo $sorts2['text']; ?></option>
                            <?php } else { ?>
                                <option value="<?php echo $sorts2['href']; ?>"><?php echo $sorts2['text']; ?></option>
                            <?php } ?>
                        <?php } ?>
                        </select>
                    <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
                  </div>
                  <div class="show-page">
                    <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
                    <select id="input-limit" onchange="oclayerednavigationajax.filter(this.value)">
                            <?php foreach ($limits as $limits2) { ?>
                            <?php if ($limits2['value'] == $limit) { ?>
                            <option value="<?php echo $limits2['href']; ?>" selected="selected"><?php echo $limits2['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $limits2['href']; ?>"><?php echo $limits2['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                    </select>
                    
                      <?php echo $pagination; ?>
                  </div>
                </div>
                <!-- product fillter -->
                <div class="custom-products add-quickview">
                    <div class="row">
                    <?php foreach ($products as $product) { ?>
                    <div class="product-layout product-list col-xs-12">
                        <div class="product-thumb item">
                            <div class="item-inner">
							
							<div class="images-container">
								<?php if($product['special']){
									$a = ($product['special2']);
									$b = ($product['price2']);
									$c = round(($a-$b)/$b,2)*100;
								}?>
								<?php $class_sale="sale-only"; if ($product['is_new']){ ?>
									<?php if($product['special']){ ?>
										<?php $class_sale="sale-percent"; ?>
									<?php } ?>
								<?php } ?>
								<?php if($product['special']){?><div class="<?php echo $class_sale ?>"><?php echo $c;?>%</div><?php }?>
								<?php if ($product['is_new']){ ?>
									<div class="label_new"><?php echo $text_label_new; ?></div>
								 <?php } ?>
								<?php if ($product['thumb']) { ?>
									<a class="product-image" href="<?php echo $product['href']; ?>">
										<?php if(isset($product['rotator_image']) && $product['rotator_image']!="") { ?><?php if($product['rotator_image']!=""){ ?>                                             <img class="img2" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />                                         <?php }?><?php } ?>
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
					
								
								
					
					<!--<div class="description"><?php echo $product['description']; ?></div>-->
					
					<div class="price-wrapper">
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
								</div>
					
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
							<!--<a href="<?php //echo $product['href']; ?>"><?php //echo $product['reviews']; ?></a>-->
						</div>
						
					<?php } ?>
					
					
					<div class="short-des"><?php echo substr($product['description'],0,300).' . . .'; ?><a class="readmore" href="<?php echo $product['href']; ?>"><?php echo $text_readmore; ?></a></div>
				</div><!--des-container-->
								
								
							<div class="actions">
								<div class="cart-wrapper">
						<button class="button btn-cart" type="button"  onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><span><?php echo $button_cart; ?></span></span></button>
						</div>
								<div class="link-wc">
						<button class="btn-wlsit" type="button"  title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></button>
						<button class="btn-compare" type="button" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></button>
						</div>
					</div>
						</div> <!-- item-inner -->

                        </div>
                    </div>
                    <?php } ?>
                </div>
                </div><!--custom-products-->
                <!-- product fillter -->
                <div class="product-filter fillter2">
                  <div class="sort-lg">
                      <button type="button"  class="btn btn-default grid-view" id="grid-view"  title="<?php echo $button_grid; ?>"><span>grid</span></button>
                      <button type="button"   class="btn btn-default list-view" id="list-view"  title="<?php echo $button_list; ?>"><span>list</span></button>
                    
                    <select id="input-sort" onchange="oclayerednavigationajax.filter(this.value)">
                        <?php foreach ($sorts as $sorts2) { ?>
                            <?php if ($sorts2['value'] == $sort . '-' . $order) { ?>
                                <option value="<?php echo $sorts2['href']; ?>" selected="selected"><?php echo $sorts2['text']; ?></option>
                            <?php } else { ?>
                                <option value="<?php echo $sorts2['href']; ?>"><?php echo $sorts2['text']; ?></option>
                            <?php } ?>
                        <?php } ?>
                        </select>
                    <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
                  </div>
                  <div class="show-page">
                    <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
                    <select id="input-limit" onchange="oclayerednavigationajax.filter(this.value)">
                            <?php foreach ($limits as $limits2) { ?>
                            <?php if ($limits2['value'] == $limit) { ?>
                            <option value="<?php echo $limits2['href']; ?>" selected="selected"><?php echo $limits2['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $limits2['href']; ?>"><?php echo $limits2['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                    </select>
                      <?php echo $pagination; ?>
                  </div>
                </div>
                <!-- product fillter -->
                <?php } ?>
                <?php if (!$categories && !$products) { ?>
                <p><?php echo $text_empty; ?></p>
                <div class="buttons">
                    <div class="pull-right"><button class="button" onclick="window.location.href='<?php echo $continue; ?>'"><span><?php echo $button_continue; ?></span></button></div>
                </div>
                <?php } ?>
            </div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?>
        </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>