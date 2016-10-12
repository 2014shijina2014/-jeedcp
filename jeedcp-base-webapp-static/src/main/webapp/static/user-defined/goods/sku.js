/**
 * Created by Administrator on 14-12-01.
 * 模拟淘宝SKU添加组合
 * 页面注意事项：
 *      1、 .div_contentlist   这个类变化这里的js单击事件类名也要改
 *      2、 .Father_Title      这个类作用是取到所有标题的值，赋给表格，如有改变JS也应相应改动
 *      3、 .Father_Item       这个类作用是取类型组数，有多少类型就添加相应的类名：如: Father_Item1、Father_Item2、Father_Item3 ...
 */
$(function () {
    //SKU信息
	initSKU();
});
function initSKU(){
	$(".div_contentlist label").unbind("change").change(function () {
    	var Title = $(this).parent().parent().prev();
    	var ul = $(this).parent().parent();
    	var len = ul.find("input[type=checkbox]:checked").length;
    	
    	var mlen = $(".div_contentlist input[type=checkbox]:checked").length;
    	if(mlen==0){
    		var item = $(".div_contentlist .item");
    		item.prev().attr("class","");
    		item.attr("class","");
    		$("#createTable").html("");
    		return;
    	}
    	
    	if(len==0){
    		Title.removeClass("Father_Title");
    		ul.attr("class","");
    	}else{
    		Title.removeClass("Father_Title");
    		Title.addClass("Father_Title");
    		ul.addClass("item");
    	}
    	
    	var item = $(".div_contentlist .item");
    	for (var i=0;i<item.size();i++) {
    		var it = $(item.get(i));
    		it.removeClass("Father_Item0");
    		it.removeClass("Father_Item1");
    		it.removeClass("Father_Item2");
    		it.removeClass("Father_Item3");
    	}
  	 	for (var i=0;i<item.size();i++) {
    		var it = $(item.get(i));
    		it.addClass("Father_Item"+i);
    	}
        step.Creat_Table();//创建表格
    });
    
    
    var step = {
        //SKU信息组合
        Creat_Table: function () {
            step.hebingFunction();
            var SKUObj = $(".Father_Title");
            //var skuCount = SKUObj.length;//
            var arrayId = new Array();//ID组数
            var arrayTile = new Array();//标题组数
            var arrayInfor = new Array();//盛放每组选中的CheckBox值的对象
            var arrayColumn = new Array();//指定列，用来合并哪些列
            var bCheck = true;//是否全选
            var columnIndex = 0;
            $.each(SKUObj, function (i, item){
                arrayColumn.push(columnIndex);
                columnIndex++;
                arrayTile.push(SKUObj.find(".add-val").eq(i).html().replace("：", ""));
                var itemName = "Father_Item" + i;
                arrayId.push($("."+itemName).attr("id"));
                //选中的CHeckBox取值
                var order = new Array();
                $("." + itemName + " input[type=checkbox]:checked").each(function (){
                    order.push($(this).val());
                });
                arrayInfor.push(order);
                if (order.join() == ""){
                    bCheck = false;
                }
                //var skuValue = SKUObj.find("li").eq(index).html();
            });
            //开始创建Table表
            if (bCheck == true) {
                var RowsCount = 0;
                $("#createTable").html("");
                var table = $("<table id=\"process\" border=\"1\" cellpadding=\"1\" cellspacing=\"0\" style=\"width:100%;padding:5px;\"></table>");
                table.appendTo($("#createTable"));
                var thead = $("<thead></thead>");
                thead.appendTo(table);
                var trHead = $("<tr></tr>");
                trHead.appendTo(thead);
                //创建表头
                $.each(arrayTile, function (index, item) {
                    var td = $("<th>" + item + "</th>");
                    td.appendTo(trHead);
                }); 
                var isBarCode=$("#haveBarCode").val();
                var bar="";
                if(isBarCode=="true"){
                	bar="<th style=\"\">条码</th> ";
                }
                var itemColumHead = $(bar+"<th  style=\"\">价格<th style=\"\">库存</th>");
                itemColumHead.appendTo(trHead);
                //var itemColumHead2 = $("<td >商家编码</td><td >商品条形码</td>");
                //itemColumHead2.appendTo(trHead);
                var tbody = $("<tbody></tbody>");
                tbody.appendTo(table);
                ////生成组合
                var zuheDate = step.doExchange(arrayInfor);
                if (zuheDate.length > 0) {
                    //创建行
                	var blen = $("#byBarCode tr").size()-1;//是否有根据条形码获取数据的操作大于0有--
                	var exitlen = $(".exitBarCode").size();//已存在的sku行数--对于修改页面
                	blen = blen-exitlen;
                	
                	if(blen==-1)blen=0;
                	console.log("blen=="+blen);
                    $.each(zuheDate, function (index, item) {
                        var td_array = item.split(",");
                        var tr = $("<tr></tr>");
                        tr.appendTo(tbody);
                       
                       var appendVal="";//拼接value
                        $.each(td_array, function (i, values) {
                        	appendVal+=values;
                            var td = $("<td>" + values + "</td><input type=\"hidden\" name=\"selectGoodsSkus["+(index+blen)+"].goodsSku."+arrayId[i].toLowerCase()+"\"  value=\""+values+"\">");
                            td.appendTo(tr);
                        });
                        if(isBarCode=="true"){
                        	var td1 = $("<td ><input type=\"hidden\"  name=\"selectGoodsSkus["+(index+blen)+"].goodsSku.isBarcode\" value=\"0\" class=\"isBarcode\" /> <input name=\"selectGoodsSkus["+(index+blen)+"].goodsSku.barCode\" class=\"l-text barCode\" type=\"text\" value=\"\"></td>");
                        	td1.appendTo(tr);
                        }
                        var td4 = $("<td ><input name=\"selectGoodsSkus["+(index+blen)+"].price\" class=\"l-text price\" type=\"text\" value=\"\"></td>");
                        td4.appendTo(tr);
                        var td5 = $("<td ><input name=\"selectGoodsSkus["+(index+blen)+"].inventoryCount\" class=\"l-text count\" type=\"text\" value=\"\"></td>");
                        
                        var inputs = $("#repeat").find("input");
                        var eq=false;//sku已存在不能创建
                        $.each(inputs, function (i, input) {
                        	if($(input).val()==appendVal){
                        		eq=true;
                        		tr.remove();
                        	}
                        });
                        if(!eq){
                        	td5.appendTo(tr);
                        }
                       
                    });
                }
                //结束创建Table表
                arrayColumn.pop();//删除数组中最后一项
                //合并单元格
                $(table).mergeCell({
                    // 目前只有cols这么一个配置项, 用数组表示列的索引,从0开始
                    cols: arrayColumn
                });
                
                
                
                var Txt_PriceSon = $(".price").first();
                Txt_PriceSon.keyup(function(){
                	$(".price").val($(this).val())
                });
                var Txt_CountSon = $(".count").first();
                Txt_CountSon.keyup(function(){
                	$(".count").val($(this).val())
                });
                var Txt_CountSon = $(".count").first();
                Txt_CountSon.keyup(function(){
                	$(".count").val($(this).val())
                });
                var groupCount = $(".groupCount").first();
                groupCount.keyup(function(){
                	var val= $(this).val();
                	$(".groupCount").val(val);
                	$(".lessCount").val(val);
                });
                var lessCount = $(".lessCount").first();
                lessCount.keyup(function(){
                	var lval  =$(this).val();
                	$(".lessCount").val(lval);
                });
                $(".lessCount").blur(function(){
                	var gval = $(this).parent().parent().find(".groupCount").val();
                	var lval  =$(this).val();
                	$(this).val(lval);
                	if((lval%gval)!=0){
                		$(this).val(gval);
                		$(this).tips({
                			side:3,
                			msg:'必须是最小单位的倍数',
                			bg:'#AE81FF',
                			time:2
                		});
                	}
                });
                
            } else{
                //未全选中,清除表格
                document.getElementById('createTable').innerHTML="";
            }
        },//合并行
        hebingFunction: function () {
            $.fn.mergeCell = function (options) {
                return this.each(function () {
                    var cols = options.cols;
                    for (var i = cols.length - 1; cols[i] != undefined; i--) {
                        // fixbug console调试
                        // console.debug(cols[i]);
                        mergeCell($(this), cols[i]);
                    }
                    dispose($(this));
                });
            };
            function mergeCell($table, colIndex) {
                $table.data('col-content', ''); // 存放单元格内容
                $table.data('col-rowspan', 1); // 存放计算的rowspan值 默认为1
                $table.data('col-td', $()); // 存放发现的第一个与前一行比较结果不同td(jQuery封装过的), 默认一个"空"的jquery对象
                $table.data('trNum', $('tbody tr', $table).length); // 要处理表格的总行数, 用于最后一行做特殊处理时进行判断之用
/*                // 进行"扫面"处理 关键是定位col-td, 和其对应的rowspan
                $('tbody tr', $table).each(function (index) {
                    // td:eq中的colIndex即列索引
                    var $td = $('td:eq(' + colIndex + ')', this);
                    // 取出单元格的当前内容
                    var currentContent = $td.html();
                    // 第一次时走此分支
                    if ($table.data('col-content') == '') {
                        $table.data('col-content', currentContent);
                        $table.data('col-td', $td);
                    } else {
                        // 上一行与当前行内容相同
                        if ($table.data('col-content') == currentContent) {
                            // 上一行与当前行内容相同则col-rowspan累加, 保存新值
                            var rowspan = $table.data('col-rowspan') + 1;
                            $table.data('col-rowspan', rowspan);
                            // 值得注意的是 如果用了$td.remove()就会对其他列的处理造成影响
                            $td.hide();
                            // 最后一行的情况比较特殊一点
                            // 比如最后2行 td中的内容是一样的, 那么到最后一行就应该把此时的col-td里保存的td设置rowspan
                            if (++index == $table.data('trNum'))
                                $table.data('col-td').attr('rowspan', $table.data('col-rowspan'));
                        } else { // 上一行与当前行内容不同
                            // col-rowspan默认为1, 如果统计出的col-rowspan没有变化, 不处理
                            if ($table.data('col-rowspan') != 1) {
                                $table.data('col-td').attr('rowspan', $table.data('col-rowspan'));
                            }
                            // 保存第一次出现不同内容的td, 和其内容, 重置col-rowspan
                            $table.data('col-td', $td);
                            $table.data('col-content', $td.html());
                            $table.data('col-rowspan', 1);
                        }
                    }
                });
*/            }
            // 同样是个private函数 清理内存之用
            function dispose($table) {
                $table.removeData();
            }
        },
        //组合数组
        doExchange: function (doubleArrays) {
            var len = doubleArrays.length;
            if (len >= 2) {
                var arr1 = doubleArrays[0];
                var arr2 = doubleArrays[1];
                var len1 = doubleArrays[0].length;
                var len2 = doubleArrays[1].length;
                var newlen = len1 * len2;
                var temp = new Array(newlen);
                var index = 0;
                for (var i = 0; i < len1; i++) {
                    for (var j = 0; j < len2; j++) {
                        temp[index] = arr1[i] + "," + arr2[j];
                        index++;
                    }
                }
                var newArray = new Array(len - 1);
                newArray[0] = temp;
                if (len > 2) {
                    var _count = 1;
                    for (var i = 2; i < len; i++) {
                        newArray[_count] = doubleArrays[i];
                        _count++;
                    }
                }
                //console.log(newArray);
                return step.doExchange(newArray);
            }
            else {
                return doubleArrays[0];
            }
        }
    }
    return step;

}	
	 