<div class="buttons">
  <div class="pull-right">
    <button type="button" id="button-confirm" class="button" data-loading-text="<?php echo $text_loading; ?>"><span><span><?php echo $button_confirm; ?></span></span></button>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({
		type: 'get',
		url: 'index.php?route=payment/cod/confirm',
		cache: false,
		beforeSend: function() {
			$('#button-confirm').button('loading');
		},
		complete: function() {
			$('#button-confirm').button('reset');
		},
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//--></script>
