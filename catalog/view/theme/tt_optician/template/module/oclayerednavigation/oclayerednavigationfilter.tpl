<div class="">
    <ul class="fillter-choose">
                <?php $is_filter = false; ?>
                <?php foreach($filter_groups as $filter_group): ?>
                    <?php foreach ($filter_group['filter'] as $filter) : ?>
                        <?php $filter_id = $filter['filter_id']; ?>
                        <?php if (in_array($filter['filter_id'], $filter_category)) : ?>
                            <?php $is_filter = true; ?>
                            <li>
                                <span class="value"><?php echo $filter['e_name']; ?></span>
                                <a class="a-filter remove-filter btn-remove" href="javascript:void(0);" name="<?php echo $filter_id ?>">Remove</a>
                            </li>
                        <?php endif; ?>
                    <?php endforeach; ?>
                <?php endforeach; ?>
            </ul>
    <?php if($is_filter): ?>
                    <div class="actions">
                        <a class="clear-filter" href="javascript:void(0);" onclick="oclayerednavigationajax.filter('<?php echo $clear_action ?>')">Clear all</a>
                    </div>
                <?php endif; ?>
    <div class="filter-attribute-container">
        <div class="layered-title"><h2>Price</h2></div>
        <div class="layered-content">
            <div class="filter-price">
                <div id="slider-price"></div>
                <div class="slider-values">
                    <span class="price-form"><?php echo $currency_symbol; ?></span>
                    <input id="price-from" disabled="disabled" class="input-price" type="text" value="<?php echo $current_min_price ?>" placeholder="Min" name="price-from"/>
                    <input id="price-to" disabled="disabled" class="input-price" type="text" value="<?php echo $current_max_price ?>" placeholder="Max" name="price-to" />
                    <span class="price-to"><?php echo $currency_symbol; ?></span>
                </div>
            </div>
        </div>
    </div>
    <?php foreach ($filter_groups as $filter_group) { ?>
    <div class="filter-attribute-container">
        <div class="layered-title"><h2><?php echo $filter_group['name']; ?></h2></div>
        <div class="layered-content">
            <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
                <ul>
                <?php foreach ($filter_group['filter'] as $filter) { ?>
                <?php $filter_id = $filter['filter_id']; ?>
                <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                    <!-- Not show filter attribute -->
                <?php } else { ?>
                    <li><a class="a-filter add-filter" href="javascript:void(0);" name="<?php echo $filter_id ?>"><?php echo $filter['name']; ?></a></li>
                <?php } ?>
                <?php } ?>
                </ul>
            </div>
        </div>
    </div>
    <?php } ?>
</div>
