<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-banner" data-toggle="tooltip" onclick="$('#form').submit();" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div></div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-info"><?php echo $error_warning; ?></div>
        <?php } ?>

        <?php if (isset($success)) { ?>
          <div class="alert alert-info"><i class="fa fa-info-circle"></i><?php echo $success; ?></div>
     
        <?php  } ?>

        <?php if ($error_product_from_value) { ?>
        <div class="alert alert-info"><i class="fa fa-info-circle"></i><?php echo $error_product_from_value; ?></div>
        <?php } ?>
        <?php if ($error_product_to_value) { ?>
        <div class="alert alert-info"><i class="fa fa-info-circle"></i><?php echo $error_product_to_value; ?></div>
        <?php } ?>


        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                    <table class="form" style="width:48%; float:left;">
                        <tr>
                            <td><b><?php echo $entry_product_from; ?></b></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td><span class="required">*</span><?php echo $entry_product; ?></td>
                            <td><div class="col-sm-8"><input type="text" class="form-control" name="product_from" value="" id="product_from" autocomplete="off"/></div>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="javascript:void(0);" class="btn btn-primary" data-toggle="tooltip" form="form-banner" type="submit" data-original-title="Check Options" id="check_options">Check Options</a>
                                <input type="hidden" name="product_from_value" value="" id="product_from_value" /></td>
                        </tr>


                    </table>

                    <table class="form" style="width:48%; float:right;">
                        <tr>
                            <td><b><?php echo $entry_product_to; ?></b></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td><span class="required">*</span><?php echo $entry_product; ?></td>
                            <td><input type="text" name="product_to" value="" class="form-control"/>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><div style="height: 150px; overflow: auto;" class="well well-sm" id="product_to">
                                
                                
                                
                                
                              </div>

                                </div>
                                <input type="hidden" name="product_to_value" value="" /></td>
                        </tr>
                    </table>
                    <div id="search-result" style="float:left;  background:#D1D0CE;"></div>
                </form> </div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
$('input[name=\'product_from\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['product_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('#product_from').val(item['label']);
            $('#product_from_value').val(item['value']);
            return false;
        }
    });

   
//--></script> 

  <script type="text/javascript"><!--
$('input[name=\'product_to\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#product_to' + item['value']).remove();
		
		$('#product_to').append('<div id="featured-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" value="' + item['value'] + '" /></div>');	
	
		data = $.map($('#product_to input'), function(element) {
			return $(element).attr('value');
		});
						
		$('input[name=\'product_to_value\']').attr('value', data.join());	
	}	
});

$('#product_to').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();

	data = $.map($('#product_to input'), function(element) {
		return $(element).attr('value');
	});
					
	$('input[name=\'product_to_value\']').attr('value', data.join());	
});
//--></script> 

<script type="text/javascript"><!--


    $("#check_options").bind('click', function() {
        $.ajax({
            url: 'index.php?route=module/copy_product_options/getAProductOptions&token=<?php echo $token;?>',
            type: 'post',
            data: 'product_id=' + $('#product_from_value').val(),
            dataType: 'html',
            success: function(html) {
                $("#search-result").html(html);

            }
        });
    });

//--></script> 
<?php echo $footer; ?>