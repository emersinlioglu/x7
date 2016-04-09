<div id="blog_home" class="menu-recent">
	 <div>
		  <div class="blog-title group-title module-title2">
			   <h2><?php echo $text_headingtitle; ?></h2>
		  </div>
		  <?php 
	  $count = 0; 
	  
	  $rows = $rows_home3; 
	  if(!$rows) {$rows=1;}
   ?>
   <div class="row">
	 <?php if ($articles) { ?>
      <div class="articles-container">
        <?php foreach ($articles as $article) { ?>
		<?php  if($count % $rows == 0 ) { echo '<div class="articles-inner item-inner">'; } $count++; ?>
          <div class="articles-container-inner">
			   <div class="articles-image">
					<img src="<?php echo $article['image']; ?>" alt="" />
					<div class="articles-date">
						 <span class="day"><?php echo $article['date_added_d']; ?></span>
						 <span class="month"><?php echo $article['date_added_m']; ?></span>
						 <span class="year"><?php echo $article['date_added_y']; ?></span>
					</div>
			   </div>
			   <div class="articles-content">
					<div><a class="articles-name" href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
					<?php echo $article['intro_text'].'...'; ?>
					<a class="readmore" href="<?php echo $article['href']; ?>"><?php echo $button_read_more; ?></a>
					<div class="author">
						 <?php if($article['author'] != null && $article['author'] != ""): ?>
							  <?php echo $article['author']; ?>
						 <?php endif; ?>
					</div>
			   </div>
			   </div>
          <?php if($count % $rows == 0 ): ?>
    	</div><!-- articles-inner item-inner -->
     <?php else: ?>
    	<?php if($count == count($articles)): ?>
    		</div><!-- articles-inner item-inner -->
    	<?php endif; ?>
     <?php endif; ?> 
        <?php } ?>
      </div> <!-- articles-container -->
      <!--<div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>-->
      <?php } ?>
	  </div>
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
	  </div>
	 <script>
	 $(document).ready(function() { 
		  $(".articles-container").owlCarousel({
				autoPlay : false,
				items : 1,
				itemsDesktop : [1199,1],
				itemsDesktopSmall : [991,1],
				itemsTablet: [767,2],
				itemsMobile : [560,1],
				slideSpeed : 1000,
				paginationSpeed : 1000,
				rewindSpeed : 1000,
				navigation : true,
				stopOnHover : true,
				pagination : false,
				scrollPerPage:true,
		  });
	 });
	 </script>
</div>
