<?php echo $header; ?>
<?php if(isset($block2)){ echo $block2; }?>
<div class="content-top">
  <div class="container">
  <div class="row">
    <?php echo $content_top; ?>
</div></div></div>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9 col-sm-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php if(isset($block3)){ echo $block3; }?>
<?php echo $footer; ?>