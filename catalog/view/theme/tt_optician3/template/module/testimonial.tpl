<div>
		<div class="testimonial-container">
				<div class="group-title module-title2">
						<h2>
										<?php echo $heading_title; ?></h2>
								
				</div>
				<div class="block-content row">
						<div id="slides">
								<?php $limit=$limits; $i=0; ?>
								<?php foreach ($testimonials as $testimonial) { ?>
										<?php if ($testimonial['content']) { ?>
												<div class="testimonial-content">
														
														<div class="testimonial-box">
																
																<!--<em>-</em>-->
																<!--<span class="testimonial-date">December 14, 2014</span>-->
																<a href="<?php echo $more; ?>"><?php echo substr($testimonial['content'],0,100)."..."; ?></a>
																<!--<div class="testimonial-submit"><a href="<?php echo $submit_testimonial; ?>"><span>Submit Testimonial...</span></a></div> -->
														</div>
														<div class="testimonial-images">
																<?php   if($testimonial['image3'] != null) { ?>
																<img src="<?php echo $testimonial['image3'];?>" alt="towertheme.com">
																<?php } ?>
																<span class="testimonial-author"><?php echo $testimonial['customer_name']; ?></span>
														</div>
														
												</div><!--testimonial-content-->
										<?php $i++; } ?>
								<?php if($i==$limit){break;} } ?>
								
						</div>
				</div><!--block-content-->
		</div><!--testimonial-container-->
</div>
<script type="text/javascript">
    $("#slides").owlCarousel({
        autoPlay : false,
		items : 1,
		itemsDesktop : [1199,1],
		itemsDesktopSmall : [980,1],
		itemsTablet: [768,1],
		itemsMobile : [479,1],
		slideSpeed : 3000,
		paginationSpeed : 3000,
		rewindSpeed : 3000,
		navigation : true,
		stopOnHover : true,
		pagination : false,
		scrollPerPage:true,
    });
</script>