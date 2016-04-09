<?php if (count($currencies) > 1) { ?>
<div class="lang-curren">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
  <ul class="select-menu">
    <li class="select-menu-item">
    <?php foreach ($currencies as $currency) { ?>
      <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
        <span><?php echo $currency['code']; ?></span>
      <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
        <span><?php echo $currency['code']; ?></span>
      <?php } ?>
    <?php } ?>
     <i class="fa fa-angle-down"></i>
    <ul class="dropdown-select-menu">
      <?php foreach ($currencies as $currency) { ?>
        <?php if ($currency['symbol_left']) { ?>
          <li><a class="currency-select" id="<?php echo $currency['code']; ?>" ><?php echo $currency['code']; ?></a></li>
        <?php } else { ?>
          <li><a class="currency-select" id="<?php echo $currency['code']; ?>" ><?php echo $currency['code']; ?></a></li>
        <?php } ?>
      <?php } ?>
    </ul>
    </li>
  </ul>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
