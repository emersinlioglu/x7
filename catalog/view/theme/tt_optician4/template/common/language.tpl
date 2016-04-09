<?php if (count($languages) >= 1) { ?>
<div class="lang-curren">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
  <ul class="select-menu">
    <li class="select-menu-item">
        <?php foreach ($languages as $language) { ?>
            <?php if ($language['code'] == $code) { ?>
                <!-- <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">-->
                <?php echo $language['code']; ?> <i class="fa fa-angle-down"></i>
            <?php } ?>
        <?php } ?>
    
    <ul class="dropdown-select-menu">
      <?php foreach ($languages as $language) { ?>
      <li>
          <a href="<?php echo $language['code']; ?>">
            <!--<img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />-->
            <?php echo $language['code']; ?>
          </a>
      </li>
      <?php } ?>
    </ul>
    </li>
  </ul>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
