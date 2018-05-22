(function($){
	$.baseWin={		
		open: function(opts){
			var defaults = {  
	            width: 500,  
	            height: 400,
	            minimizable: false,  
	            maximizable: false,  
	            collapsible: false,  
	            resizable: false, 
	            modal:true,
	            isFrame: true,   
	            self: false, 
	            data: null, 
	            url: null,
	            callback: null,
	            onClose: function(){
	            	if(window.top.winIds.length>0){
	            		window.top.$("#" + window.top.winIds[window.top.winIds.length-1]).dialog("destroy");
	            		window.top.winIds.pop(window.top.winIds.length-1);
	            	}
	            }
			};
		        
		    var options = $.extend({}, defaults, opts);

	        //如填写ID属性，则窗体唯一  
	        var winId;  
	        if(options.id){  
	            winId = options.id;  
	            delete options.id;  
	              
	            //检查创建窗口是否已经存在，存在则不在创建  
	            if($('#'+winId).length>0){  
	                return;
	            }  
	        }
	          
	        var url = options.url;
	        //重构访问路径
	        var pos=url.indexOf(".jsp");
	        if(pos>0){
	        	var star1=url.indexOf("//");
	        	var star2=url.indexOf("/",star1 + 2);
	        	var star3=url.indexOf("/",star2 + 1);
	        	var webApp=url.substring(0,star3 + 1);
	        	var funcUrl=url.substring(star3+1,pos);
	        	var url=webApp + "rest/sysfunc/querysysfuncbyurl?param=" + funcUrl;
	        }
	  
	        //构建iframe加载方式  
	        if(options.isFrame){  
	            var iframe = $('<iframe></iframe>')  
	                        .attr('height', '100%')  
	                        .attr('width', '100%')  
	                        .attr('marginheight', '0')  
	                        .attr('marginwidth', '0')  
	                        .attr('frameborder','0');  
	              
	            setTimeout(function(){  
	                iframe.attr('src', url);  
	            }, 1);
	        };
	        if(window.top.winIds==null){
	        	window.top.winIds=new Array();
	        }
	        
	        //获取最顶层的window
	        var _top=window.top;
		    _top.$('<div>', {id: winId}).css({"overflow-y":"hidden","margin":"0px"}).append(iframe).dialog(options);
		    window.top.winIds.push(winId);
		},
		callback:function(data){
			var options=window.top.$("#" + window.top.winIds[window.top.winIds.length-1]).dialog("options");
			var closeCallback=options.callback;
			if(closeCallback!=null){
				closeCallback(data);
			}
		},
		close: function(data){
			window.top.$("#" + window.top.winIds[window.top.winIds.length-1]).dialog("close");
			//window.top.winIds.slice(window.top.winIds.length-1);
		},
		getParams: function(){
			var data=window.top.$("#" + window.top.winIds[window.top.winIds.length-1]).dialog("options").data;
			return data;
		}
	};
	
	$.lock=function(){
		var html="<div id='mark'>"
			    + "<div id='subDiv'>"
			    + "<img src='images/load.gif' alt='加载'>"
			    + "</div>"
			    + "</div>"
		$(window.top.document.body).append(html);
		window.top.$("#mark").width(window.top.document.body.offsetWidth);
		window.top.$("#mark").height(window.top.document.body.offsetHeight);
		window.top.$("#mark").css({
			"position": "absolute",
			"width": "100%",
			"height": "100%",
			"top": "0px",
			"filter": "alpha(opacity=60)",
			"background-color": "#000000",
			"z-index":"999999",
			"left": "0px",
			"opacity": "0.2",
			"-moz-opacity": "0.2"
		});
		
		window.top.$("#subDiv").css({
			"position": "absolute",
			"width": "100%", 
			"top": "50%", 
			"left": "50%"
		})
	};
	
	$.unlock=function(){
		window.top.$("#mark").remove();
	};
	
	$.dataGridLoad=function(dataGridId){
		$("#" + dataGridId).datagrid("load");
	};
	
	$.showToolTip=function(dataGridId){
		$('#' + dataGridId).datagrid({
			onLoadSuccess:function(){
				$('#dataGridId').datagrid('doCellTip', {
					onlyShowInterrupt : false,
		       		position : 'bottom',
		       		maxWidth : '200px',
		       		tipStyler : {
		           		'backgroundColor' : '#fff000',
		           		borderColor : '#ff0000',
		           		boxShadow : '1px 1px 3px #292929'
		       		}
	            });
	        }
	    });
	};
	
	$.markError=function(obj,msg){
		obj.next().css("border","1px solid red");
		obj.next().tooltip({
			content: msg,
			defaultPosition : "bottom"
		});
		$.removeMarkError(obj);
	};
	
	$.removeMarkError=function(obj){
		obj.next().find("input").on("keyup",function(){
			var descValue =obj.next().find("input").val();
			if (descValue.length > 0) {
				obj.next().css("border-color", "#95b8e7");
				obj.next().toolTip("destroy");
			}
		});
		if(obj.hasClass("easyui-combobox")){
			obj.combobox({
				onChange:function(){
					obj.next().css("border-color", "#95b8e7");
					obj.next().toolTip("destroy");
				}
			});
		}else if(obj.hasClass("easyui-datebox")){
			obj.datebox({
				onChange:function(){
					if(obj.datebox("getValue")!=null && obj.datebox("getValue")!=""){
						obj.next().css("border-color", "#95b8e7");
						obj.next().toolTip("destroy");
					}
				}
			});
		}
	};
	
	/**
	 * 1.控制datagrid在有checkbox和操作列的情况下充满整个屏幕
	 */
	$.resizeDataGrid = function(dataGridId,paddWidth) {
        var width = $(document.body).width() - 10;
        var setWidth;
        var rate=0;
        var realWidth=0;
        var overWidth=0;
        var isCheckBox=false;
        var isAction=false;
        var totalWidth=0;
        var lastField;
        
        width=width - paddWidth;
        //datagrid 的属性
        var opts=$("#" + dataGridId).datagrid("options");
        if(opts.rownumbers){
        	//如果自带行号
        	width = width - 30;
        }
        
        //判断是否出现竖向滚动条,行高为28像素
        if(opts.height<(opts.pageSize + 1)*28){
        	//上面的判断条件加1是因为还有列头
        	//如果datagrid的总高度小于每页条数和每行像素的乘积
        	width = width - 15;
        }
        
        //字体加粗,居中
        $("table[class='datagrid-htable']").css({"font-weight":"bold","text-align":"center"});
        
        var fields=$("#" + dataGridId).datagrid("getColumnFields");
        for(var i=0;i<fields.length;i++){
        	var opt=$("#" + dataGridId).datagrid("getColumnOption",fields[i]);
        	if(!opt.hidden){
	        	if(opt.checkbox){
	        		isCheckBox=true;
	        		width=width - 30;
	        	}
	        	if(fields[i]=="action"){
	        		isAction=true;
	        		width=width - 130;
	        	}
	        	if(!opt.checkbox && fields[i]!="action"){
	        		lastField=fields[i];
	        		totalWidth=totalWidth + parseInt(opt.width.substring(0,opt.width.length-1));
	        	}
        	}
        }
        
        //if(totalWidth<=100){
	        overWidth=width;
	        for(var i=0;i<fields.length;i++){
	        	var opt=$("#" + dataGridId).datagrid("getColumnOption",fields[i]);
	        	if(!opt.hidden){
		        	if(!opt.checkbox){
		        		if(fields[i]!="action"){
		            		if(fields[i]!=lastField){
		    	        		setWidth=opt.width;
		    	        		if(setWidth!=""){
		    	        			rate=setWidth.substring(0,setWidth.length-1);
		    	        			realWidth=parseInt((width * rate)/100);
		    	        			overWidth=overWidth - realWidth;
		    	        		}
		            		}else{
		            			realWidth=overWidth;
		            		}
		        		}else if(fields[i]=="action"){
		            		realWidth = 130;
		            	}
		        		
		        		//设置列宽
		        		realWidth=realWidth - 8;
		            	$("td[field='" + fields[i] + "']").find("div[class^='datagrid-cell datagrid-cell-c1']").css({"width":realWidth});
		        	}
	        	}
	        } 
        //}
        
        $('#' + dataGridId).datagrid('doCellTip', {
			onlyShowInterrupt : false,
       		position : 'bottom',
       		maxWidth : '200px',
       		tipStyler : {
           		'backgroundColor' : '#F8F8F5',
           		borderColor : '#8C7D7B',
           		boxShadow : '1px 1px 3px #292929'
       		}
        });
    };
    
    $.fullHeight=function(){
    	//高度上充满，下方不留空隙
        var obj=$("div[class='datagrid-wrap panel-body panel-body-noheader panel-body-noborder']");
        obj.height(obj.height() + 5);
        obj.parent().parent().height(obj.parent().parent().height() + 5);
    }
})(jQuery);


$.extend($.fn.datagrid.methods, {
    /**
     * 开打提示功能（基于1.3.3+版本）
     * @param {} jq
     * @param {} params 提示消息框的样式
     * @return {}
     */
    doCellTip:function (jq, params) {
        function showTip(showParams, td, e, dg) {
            //无文本，不提示。
            if ($(td).text() == "") return;
            params = params || {};
            var options = dg.data('datagrid');
            var styler = 'style="';
            if(showParams.width){
                styler = styler + "width:" + showParams.width + ";";
            }
            if(showParams.maxWidth){
                styler = styler + "max-width:" + showParams.maxWidth + ";";
            }
            if(showParams.minWidth){
                styler = styler + "min-width:" + showParams.minWidth + ";";
            }
            styler = styler + '"';
            showParams.content = '<div class="tipcontent" ' + styler + '>' + showParams.content + '</div>';
            $(td).tooltip({
                content:showParams.content,
                trackMouse:true,
                position:params.position,
                onHide:function () {
                    $(this).tooltip('destroy');
                },
                onShow:function () {
                    var tip = $(this).tooltip('tip');
                    if(showParams.tipStyler){
                        tip.css(showParams.tipStyler);
                    }
                    if(showParams.contentStyler){
                        tip.find('div.tipcontent').css(showParams.contentStyler);
                    }
                }
            }).tooltip('show');
        };
        return jq.each(function () {
            var grid = $(this);
            var options = $(this).data('datagrid');
            if (!options.tooltip) {
                var panel = grid.datagrid('getPanel').panel('panel');
                panel.find('.datagrid-body').each(function () {
                    var delegateEle = $(this).find('> div.datagrid-body-inner').length ? $(this).find('> div.datagrid-body-inner')[0] : this;
                    $(delegateEle).undelegate('td', 'mouseover').undelegate('td', 'mouseout').undelegate('td', 'mousemove').delegate('td[field]', {
                        'mouseover':function (e) {
                            //if($(this).attr('field')===undefined) return;
                            var that = this;
                            var setField = null;
                            if(params.specialShowFields && params.specialShowFields.sort){
                                for(var i=0; i<params.specialShowFields.length; i++){
                                    if(params.specialShowFields[i].field == $(this).attr('field')){
                                        setField = params.specialShowFields[i];
                                    }
                                }
                            }
                            if(setField==null){
                                options.factContent = $(this).find('>div').clone().css({'margin-left':'-5000px', 'width':'auto', 'display':'inline', 'position':'absolute'}).appendTo('body');
                                var factContentWidth = options.factContent.width();
                                params.content = $(this).text();
                                if (params.onlyShowInterrupt) {
                                    if (factContentWidth > $(this).width()) {
                                        showTip(params, this, e, grid);
                                    }
                                } else {
                                    showTip(params, this, e, grid);
                                }
                            }else{
                                panel.find('.datagrid-body').each(function(){
                                    var trs = $(this).find('tr[datagrid-row-index="' + $(that).parent().attr('datagrid-row-index') + '"]');
                                    trs.each(function(){
                                        var td = $(this).find('> td[field="' + setField.showField + '"]');
                                        if(td.length){
                                            params.content = td.text();
                                        }
                                    });
                                });
                                showTip(params, this, e, grid);
                            }
                        },
                        'mouseout':function (e) {
                            if (options.factContent) {
                                options.factContent.remove();
                                options.factContent = null;
                            }
                        }
                    });
                });
            }
        });
    },
    /**
     * 关闭消息提示功能（基于1.3.3版本）
     * @param {} jq
     * @return {}
     */
    cancelCellTip:function (jq) {
        return jq.each(function () {
            var data = $(this).data('datagrid');
            if (data.factContent) {
                data.factContent.remove();
                data.factContent = null;
            }
            var panel = $(this).datagrid('getPanel').panel('panel');
            panel.find('.datagrid-body').undelegate('td', 'mouseover').undelegate('td', 'mouseout').undelegate('td', 'mousemove')
        });
    }
});

$.extend($.fn.validatebox.defaults.rules, {
    /*必须和某个字段相等*/
    equalTo: { validator: function (value, param) { return $(param[0]).val() == value; }, message: '字段不匹配' }
});