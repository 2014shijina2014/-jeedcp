1. FLOAT闭合（clearing float）

```
	网页在某些浏览器上显示错位很多时候都是因为使用了float浮动而没有真正闭合，这也是div无法自适应高度的一个原因。如果父div没有设float而其子div却设了float的话,父div无法包住整个子DIV，这种情况一般出现在一个父DIV下包含多个子DIV。解决办法：
	1) 给父DIV也设上float
	2) 在所有子DIV后新加一个空DIV（目前Ext是这么做的）
```	
	比如：
	
.parent{width:100px;}

.son1{float:left;width:20px;}
.son2{float:left;width:80px;}
.clear{clear:both;margin:0;parding0;height:0px;font-size:0px;}



<div class="parent">
   <div class="son1"></div>
   <div class="son2"></div>
   <div class="clear"></div>
</div>


```

3)  万能 float 闭合

将以下代码加入Global CSS 中，给需要闭合的div加上 class=”clearfix” 即可，屡试不爽。

```	
<style>
/* Clear Fix */
.clearfix:after {
content:".";
display:block;
height:0;
clear:both;
visibility:hidden;
}
.clearfix {
display:inline-block;
}
/* Hide from IE Mac \*/
.clearfix {display:block;}
/* End hide from IE Mac */
/* end of clearfix */
</style>
```
:after（伪对象）,设置在对象后发生的内容，通常和content配合使用，IE不支持此伪对象，非Ie 浏览器支持，所以并不影响到IE/WIN浏览器。这种的最麻烦。

 4) overflow:auto

只要在父DIV的CSS中加上overflow:auto就搞定。举例：
?
1
2
3
4
5
6
7
	
.parent{width:100px;overflow:auto}
.son1{float:left;width:20px;}
.son2{float:left;width:80px;}
<div class="parent">
   <div class="son1"></div>
   <div class="son2"></div>
</div>

原理是，外围元素之所以不能很好的延伸，问题出在了overflow上，因为overflow不可见（见W3C的解释）。现在只要将给外围元素添 加一个“overflow:auto”，就可以解决问题，结果是除了IE，真的可以解决。下来就要解决IE的问题了，再加上“_height:1%”，这个问题就完全解决了。我试了一下，其实不加"_height:1%“在IE下也行，留着吧。

 2.截字省略号
?
1
2
3
4
5
6
	
.hh {
-o-text-overflow:ellipsis;
text-overflow:ellipsis;
white-space:nowrap;
overflow:hidden;
}

这个是在越出长度后会自行的截掉多出部分的文字，并以省略号结尾。技术是好技术，很多人都喜欢乱用，但注意Firefox并不支持。

<meta http-equiv="x-ua-compatible" content="ie=7" />

页面加上这句就可以让页面兼容IE7了

供参考！ 给大家提醒一个漂浮需要注意的问题 注意设置DIV宽和高 注意设置overflow:hidden; 注意闭合针对火狐 父div样式display:inline-block;

3.  cursor:hand和cursor:pointer

firefox不支持hand，但ie支持pointer
解决方法：统一使用pointer

4. CSS透明

几款浏览器对透明度的支持方式各不相同，为了保证在IE, Firefox, Chrome, Safari等主流浏览器下都能正常显示透明度的效果，我们可以定义一个透明度的class，因为一写就要写3条，省的每次都复制来复制去了。

具体代码如下：
?
1
2
3
4
5
	
.transparent{
filter:alpha(opacity=60); /*支持 IE 浏览器*/
-moz-opacity:0.6; /*支持 FireFox 浏览器*/
opacity:0.6; /*支持 Chrome, Opera, Safari 等浏览器*/
}

5.css中的width和padding

在IE7和FF中width宽度不包括padding，在Ie6中包括padding。