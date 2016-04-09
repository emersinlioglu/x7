<?php echo $header; ?>
<pre>
<?php
    //echo print_r($_SESSION);
    //var_dump($_SESSION);
?>
</pre>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <h1><?php echo $heading_title; ?></h1>
            <?php echo $text_message;
       ?>


            <?php if (isset($vertragsarten)): ?>
            <?php foreach ($vertragsarten as $vertragstyp => $istAktiv): ?>
            <?php if ($istAktiv): ?>

                <a target='_blank'
                   href="/X7/index.php?route=checkout/success/createPdf&vertragstyp=<?php echo $vertragstyp; ?>">Download
                    PDF für <?php echo $vertragstyp; ?></a> <br>

            <?php endif; ?>
            <?php endforeach; ?>
            <?php endif; ?>

            <a target='_blank'
               href="/X7/index.php?route=checkout/success/mailpdf&vertragstyp=vodafone">Mail PDF für vodafone</a> <br>

            <div class="buttons">
                <div class="pull-right">
                    <button onclick="window.location.href='<?php echo $continue; ?>'" class="button">
          <span>
            <span>
              <?php echo $button_continue; ?>

              
            </span>
          </span>
                    </button>
                </div>
            </div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>