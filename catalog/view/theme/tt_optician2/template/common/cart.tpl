<div id="cart">
  <div class="cart-inner">
  <button type="button" data-toggle="" data-loading-text="<?php echo $text_loading; ?>" class="button-cart"><span id="cart-total"><?php echo $text_items; ?></span></button>
  <ul class="dropdown-menu-cart pull-right">
    <?php if ($products || $vouchers) { ?>
    
        <?php foreach ($products as $product) { ?>
        <li>
          <?php if ($product['thumb']) { ?>
            <a class="product-image" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
          <?php } ?>
          
          
          <div class="product-details">
            <p class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
            <button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>">remove</button>
            <strong><?php echo $product['quantity']; ?></strong> x <span class="price"><?php echo $product['total']; ?></span>
            <?php if ($product['option']) { ?>
              <?php foreach ($product['option'] as $option) { ?>
                <br />
                - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
              <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
                <br />
                - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?>
          </div>
        <?php } ?>
        <div class="top-voucher">
        <?php foreach ($vouchers as $voucher) { ?>
          <?php echo $voucher['description']; ?>
          x&nbsp;1
          <?php echo $voucher['amount']; ?>
          <button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs">remove</button>
        <?php } ?>
        </div>
      </li>
    
    <li>
      <div class="top-subtotal">
          <?php foreach ($totals as $total) { ?>
          <div class="<?php echo $total['class']; ?>">
            <strong><?php echo $total['title']; ?>:&nbsp;</strong>
            <span class="price"><?php echo $total['text']; ?></span>
          </div>
          <?php } ?>
      </div>
      <div class="actions">
        <button class="button" onClick="window.location.href='<?php echo $checkout; ?>'"><span><span><?php echo $text_checkout; ?></span></span></button>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
</div>