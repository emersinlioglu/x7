<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-countdown" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-countdown" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                            <?php if ($error_name) { ?>
                            <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="status" id="input-status" class="form-control">
                                <?php if ($status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
                            <?php if ($error_width) { ?>
                            <div class="text-danger"><?php echo $error_width; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
                            <?php if ($error_height) { ?>
                            <div class="text-danger"><?php echo $error_height; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-item"><?php echo $entry_item; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="item" value="<?php echo $item; ?>" placeholder="<?php echo $entry_item; ?>" id="input-item" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-speed"><?php echo $entry_speed; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="speed" value="<?php echo $speed; ?>" placeholder="<?php echo $entry_speed; ?>" id="input-speed" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-autoplay"><?php echo $entry_autoplay; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="autoplay" value="<?php echo $autoplay; ?>" placeholder="<?php echo $entry_autoplay; ?>" id="input-autoplay" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-shownextback"><?php echo $entry_shownextback ?></label>
                        <div class="col-sm-10">
                            <select id="input-shownextback" name="shownextback" class="form-control">
                                <option value="0" <?php if($shownextback == 0) { ?> selected="selected" <?php } ?> >No</option>
                                <option value="1" <?php if($shownextback == 1) { ?> selected="selected" <?php } ?> >Yes</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-shownav"><?php echo $entry_shownav ?></label>
                        <div class="col-sm-10">
                            <select id="input-shownav" name="shownav" class="form-control">
                                <option value="0" <?php if($shownav == 0) { ?> selected="selected" <?php } ?> >No</option>
                                <option value="1" <?php if($shownav == 1) { ?> selected="selected" <?php } ?> >Yes</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-usethumbslide"><?php echo $entry_usethumbslide ?></label>
                        <div class="col-sm-10">
                            <select id="input-usethumbslide" name="usethumbslide" class="form-control">
                                <option value="0" <?php if($usethumbslide == 0) { ?> selected="selected" <?php } ?> >No</option>
                                <option value="1" <?php if($usethumbslide == 1) { ?> selected="selected" <?php } ?> >Yes</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group thumbmode-group">
                        <label class="col-sm-2 control-label" for="input-thumbslidemode"><?php echo $entry_thumbslidemode ?></label>
                        <div class="col-sm-10">
                            <select id="input-thumbslidemode" name="thumbslidemode" class="form-control">
                                <option value="horizontal" <?php if($thumbslidemode == "horizontal") { ?> selected="selected" <?php } ?> >Horizontal</option>
                                <option value="vertical"   <?php if($thumbslidemode == "vertical")   { ?> selected="selected" <?php } ?> >Vertical</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
    $(document).ready(function() {
        var value = $('#input-usethumbslide').val();
        if(value == 0) {
            $('.thumbmode-group').hide();
        } else {
            $('.thumbmode-group').show();
        }
    });

    $('#input-usethumbslide').change(function() {
        var value = $(this).val();
        if(value == 0) {
            $('.thumbmode-group').hide();
        } else {
            $('.thumbmode-group').show();
        }
    });
</script>