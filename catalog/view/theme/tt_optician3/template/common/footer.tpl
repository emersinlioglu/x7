<?php if(isset($block4)){ echo $block4; }?>
<footer>
  <div class="top-footer">
    <div id="back-top" class=""></div>
    <div class="container">
    <div class="col-sm-3 col-sm-6 col-xs-12">
      <?php if ($informations) { ?>
        <div class="footer-title">
        <h2><?php echo $text_information; ?></h2>
        </div>
        <div class="footer-content">
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
        </div>
      <?php } ?>
    </div>
    <div class="col-sm-3 col-sm-6 col-xs-12">
      <div class="footer-title">
      <h2><?php echo $text_account; ?></h2>
      </div>
      <div class="footer-content">
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <div class="col-sm-3 col-sm-6 col-xs-12">
      <div class="footer-title">
      <h2><?php echo $text_extra; ?></h2>
      </div>
      <div class="footer-content">
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></li>
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
        </div>
    </div>
    <div class="col-sm-3 col-sm-6 col-xs-12">
      <div class="footer-title">                
              <h2><?php echo $text_contact; ?></h2>
          </div>
          <div class="footer-content">
            <span class="address icon"><?php echo $address; ?></span>
            <span class="phone icon"><?php echo $telephone; ?><br /><?php echo $fax; ?></span>
            <span class="email icon"><?php echo $email; ?></span>
          </div>
      </div>
    </div>
  </div><!-- top-footer -->
  <div class="middle-footer">
    <div class="container">
    <div class="col-md-4 col-sm-6 col-xs-12">
        <?php if(isset($block5)) echo $block5; ?>
    </div>
    <div class="col-md-4 col-sm-6 col-xs-12">
        <ul class="link-follow">
          <li><a class="facebook fa fa-facebook" href="https://www.facebook.com/plazathemes"><span>facebook</span></a></li>
          <li><a class="twitter fa fa-twitter" href="#"><span>twitter</span></a></li>
          <li><a class="skype fa fa-skype" href="https://twitter.com/plazathemes"><span>skype</span></a></li>
          <li><a class="dribbble fa fa-dribbble" href="#"><span>dribbble</span></a></li>
        </ul>
    </div>
    <div class="col-md-4 col-sm-6 col-xs-12">
      <p class="payment">
        <img src="image/catalog/demo/paypal.png" alt=""/>
      </p>
    </div>
    </div>
  </div><!-- middle-footer -->
  <div class="bottom-footer">
    <div class="copyright">
        <?php echo $powered;?>
    </div>
  </div>
  <script type="text/javascript">
            	$(document).ready(function(){
            	 // hide #back-top first
            	 $("#back-top").hide();
            	 // fade in #back-top
            	 $(function () {
            	  $(window).scroll(function () {
            	   if ($(this).scrollTop() > 300) {
            		$('#back-top').fadeIn();
            	   } else {
            		$('#back-top').fadeOut();
            	   }
            	  });
            	  // scroll body to 0px on click
            	  $('#back-top').click(function () {
            	   $('body,html').animate({
            		scrollTop: 0
            	   }, 800);
            	   return false;
            	  });
            	 });
            	});
            </script>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>