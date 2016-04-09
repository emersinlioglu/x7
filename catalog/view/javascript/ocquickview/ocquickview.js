//<![CDATA[


$(window).load(function() {
	ocquickview.initQuickViewContainer();
});

$(document).ajaxComplete(function() {
	var qvcontainer = $('#qv-container').val();
	var qvstatus = $('#qv-status').val();
	if(qvstatus == 1) {
		var containers = qvcontainer.split(';');
		containers.forEach(function(container) {
			ocquickview.initQuickViewButton(container);
		});
	}	
});

var ocquickview = {
	'initQuickViewButton' : function(divContain) {
		$(divContain + ' a').each(function() {
			var hasImg = $(this).has('img').length;
			if(hasImg == 1) {
				var url = $(this).attr('href');
				var isExist = $(this).data('exist');
				if(url.search('route=product/product') != -1) {
					if(isExist != 1) {
						var divContainer = $(this).closest('.item-inner');
						divContainer.find('.add-to-links').append('<div class="qv-button-container"><button class="btn-quickview" type="button">Quick View</button></div>');
						url = url.replace('route=product/product', 'route=module/ocquickview');
						divContainer.find('.btn-quickview').attr('onclick', "ocquickview.ajaxView('"+ url +"')");
						$(this).attr('data-exist', 1);
					}
				}
			} 
		});
	},

	'initQuickViewContainer' : function() {
		$('body').append('<div class="quickview-container"></div>');
		$('div.quickview-container').load('index.php?route=module/ocquickview/appendcontainer');
	},

	'appendCloseFrameLink' : function() {
		$('div.quickview-container').prepend("<a href='javascript:void(0);' class='a-qv-close' onclick='ocquickview.closeQVFrame()'>Close</a>");
	},

	'closeQVFrame' : function() {
		$('#quickview-bg-block').hide();
    	$('.quickview-load-img').hide();
    	$('div#quickview-content').hide();
    	$('div#quickview-content').html('');
		$('.a-qv-close').hide();
	},

	'ajaxView'	: function(url) {
		$.ajax({
			url 		: url,
			type		: 'get',
			beforeSend	: function() {
				$('#quickview-bg-block').show();
				$('.quickview-load-img').show();
			},
			success		: function(json) {
				if(json['success'] == true) {
					$('#quickview-content').html(json['html']);
					ocquickview.appendCloseFrameLink();
					$('#quickview-content').show();
					$('.quickview-load-img').hide();
				}
			}
		});
	}

};
//]]>
