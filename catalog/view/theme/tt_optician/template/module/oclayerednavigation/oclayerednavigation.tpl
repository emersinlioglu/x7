<div class="layerednavigation">
    <div class="block-title layered-heading"><strong><span><?php echo $heading_title; ?></span></strong></div>
    <div class="layered">
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
                            <input id="price-from" disabled="disabled" class="input-price" type="text" value="<?php echo $min_price ?>" placeholder="Min" name="price-from"/>
                            <input id="price-to" disabled="disabled" class="input-price" type="text" value="<?php echo $max_price ?>" placeholder="Max" name="price-to" />
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
    </div>
    <input type="hidden" class="filter-url" value="<?php echo $action; ?>" />
    <input type="hidden" class="price-url" value="<?php echo $action; ?>" />
</div>

<script type="text/javascript">
    var filter_url = '';
    var ids = [];
    var min_price = parseFloat('<?php echo $min_price ?>');
    var max_price = parseFloat('<?php echo $max_price ?>');
    var current_min_price = parseFloat($('#price-from').val());
    var current_max_price = parseFloat($('#price-to').val());

    $('#slider-price').slider({
        range   : true,
        min     : min_price,
        max     : max_price,
        values  : [ current_min_price, current_max_price ],
        slide   : function (event, ui) {
            $('#price-from').val(ui.values[0]);
            $('#price-to').val(ui.values[1]);
            current_min_price = ui.values[0];
            current_max_price = ui.values[1];
        },
        stop    : function (event, ui) {
            filter_url = $('.price-url').val();
            filter_url += '&price=' + current_min_price + ',' + current_max_price;
            oclayerednavigationajax.filter(filter_url);
        }
    });

    $('.a-filter').click(function () {
        var id = $(this).attr('name');
        var filter_ids = '';
        filter_url = $('.filter-url').val();
        if($(this).hasClass('add-filter') == true) {
            ids.push(id);
        } else if($(this).hasClass('remove-filter') == true) {
            ids = $.grep(ids, function (value) {
                return value != id;
            });
        }
        filter_ids = ids.join(',');
        filter_url += '&filter=' + filter_ids;
        oclayerednavigationajax.filter(filter_url);
    });

    $('.clear-filter').click(function () {
        ids = [];
    });

    $(document).ajaxComplete(function () {
        var current_min_price = parseFloat($('#price-from').val());
        var current_max_price = parseFloat($('#price-to').val());

        $('#slider-price').slider({
            range   : true,
            min     : min_price,
            max     : max_price,
            values  : [ current_min_price, current_max_price ],
            slide   : function (event, ui) {
                $('#price-from').val(ui.values[0]);
                $('#price-to').val(ui.values[1]);
                current_min_price = ui.values[0];
                current_max_price = ui.values[1];
            },
            stop    : function (event, ui) {
                filter_url = $('.price-url').val();
                filter_url += '&price=' + current_min_price + ',' + current_max_price;
                oclayerednavigationajax.filter(filter_url);
            }
        });

        $('.a-filter').click(function () {
            var id = $(this).attr('name');
            var filter_ids = '';
            filter_url = $('.filter-url').val();

            if($(this).hasClass('add-filter') == true) {
                ids.push(id);
            } else if($(this).hasClass('remove-filter') == true) {
                ids = $.grep(ids, function (value) {
                    return value != id;
                });
            }
            filter_ids = ids.join(',');
            filter_url += '&filter=' + filter_ids;
            oclayerednavigationajax.filter(filter_url);
        });

        $('.clear-filter').click(function () {
            ids = [];
        });
    });
</script>

