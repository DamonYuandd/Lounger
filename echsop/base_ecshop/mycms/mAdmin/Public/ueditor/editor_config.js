(function (){
var URL = UEDITOR_HOME_URL;
UEDITOR_CONFIG = {
imagePath : UEDITOR_UPLOAD_PATH + 'images/ueditor/',
compressSide:0,
maxImageSideLength:900,
relativePath:true,
filePath:UEDITOR_UPLOAD_PATH + "files/ueditor/",
catchRemoteImageEnable:true,
catcherUrl:URL +"server/submit/php/getRemoteImage.php",
localDomain:"baidu.com",
imageManagerPath:URL + "server/submit/php/imageManager.php",
UEDITOR_HOME_URL:URL,
/*
toolbars: [
['Source','FontFamily','FontSize','Bold','Italic','Underline','StrikeThrough','ForeColor','BackColor','|','InsertOrderedList','InsertUnorderedList','|','Indent','JustifyLeft','JustifyCenter','JustifyRight','JustifyJustify','|','ImageNone','ImageLeft','ImageRight','ImageCenter','|','InsertImage','WordImage','InsertVideo','GMap','Map','|','Unlink','Link','|','InsertTable','DeleteTable']
],
labelMap: {
'source':'源码','fontfamily':'字体','fontsize':'字号','bold':'加粗','italic':'斜体','underline':'下划线','strikethrough':'删除线','forecolor':'文字颜色','backcolor':'背景颜色','|':'分隔线','insertorderedlist':'有序列表','insertunorderedlist':'无序列表','|':'分隔线','indent':'首行缩进','justifyleft':'左对齐','justifycenter':'居中','justifyright':'右对齐','justifyjustify':'两端对齐','|':'分隔线','imagenone':'图片默认','imageleft':'图片居左','imageright':'图片居右','imagecenter':'图片居中','|':'分隔线','insertimage':'图片','wordimage':'图片转存','insertvideo':'视频','gmap':'谷歌地图','map':'百度地图','|':'分隔线','unlink':'取消链接','link':'超链接','|':'分隔线','inserttable':'插入表格','deletetable':'删除表格'
}*/
toolbars: [
[]
],
labelMap: {},
iframeUrlMap: {
'anchor':'~/dialogs/anchor/anchor.html',
'insertimage':'~/dialogs/image/image.html',
'inserttable':'~/dialogs/table/table.html',
'link':'~/dialogs/link/link.html',
'spechars':'~/dialogs/spechars/spechars.html',
'searchreplace':'~/dialogs/searchreplace/searchreplace.html',
'map':'~/dialogs/map/map.html',
'gmap':'~/dialogs/gmap/gmap.html',
'insertvideo':'~/dialogs/video/video.html',
'help':'~/dialogs/help/help.html',
'highlightcode':'~/dialogs/code/code.html',
'emotion':'~/dialogs/emotion/emotion.html',
'wordimage':'~/dialogs/wordimage/wordimage.html',
'insertframe':'~/dialogs/insertframe/insertframe.html',
'attachment':'~/dialogs/attachment/attachment.html',
'edittd':'~/dialogs/table/edittd.html',
'snapscreen':'~/dialogs/snapscreen/snapscreen.html'
},
listMap: {
'fontfamily': ['宋体', '楷体', '隶书', '黑体','andale mono','arial','arial black','comic sans ms','impact','times new roman'],
'fontsize': [10, 11, 12, 14, 16, 18, 20, 24, 36],
'paragraph': ['p:段落', 'h1:标题 1', 'h2:标题 2', 'h3:标题 3', 'h4:标题 4', 'h5:标题 5', 'h6:标题 6'],
'rowspacing' : ['5', '10', '15', '20', '25'],
'lineheight' : ['1', '1.25','1.5','2', '3', '4', '5'],
'customstyle':[
{tag:'h1', label:'居中标题', style:'border-bottom:#ccc 2px solid;padding:0 4px 0 0;text-align:center;margin:0 0 20px 0;'},
{tag:'h1', label:'居左标题', style:'border-bottom:#ccc 2px solid;padding:0 4px 0 0;margin:0 0 10px 0;'},
{tag:'span', label:'强调', style:'font-style:italic;font-weight:bold;color:#000'},
{tag:'span', label:'明显强调', style:'font-style:italic;font-weight:bold;color:rgb(51, 153, 204)'}
]
},
fontMap: {
'宋体': ['宋体', 'SimSun'],
'楷体': ['楷体', '楷体_GB2312', 'SimKai'],
'黑体': ['黑体', 'SimHei'],
'隶书': ['隶书', 'SimLi'],
'andale mono' : ['andale mono'],
'arial' : ['arial','helvetica','sans-serif'],
'arial black' : ['arial black','avant garde'],
'comic sans ms' : ['comic sans ms'],
'impact' : ['impact','chicago'],
'times new roman' : ['times new roman']
 },
contextMenu: [
{
					label:'删除',
					cmdName:'delete'

				},
{
						label:'取消链接',
						cmdName:'unlink'
					},
{
						group:'段落格式',
						icon:'justifyjustify',

						subMenu:[
							{
								label:'居左对齐',
								cmdName:'justify',
								value:'left'
							},
							{
								label:'居右对齐',
								cmdName:'justify',
								value:'right'
							},
							{
								label:'居中对齐',
								cmdName:'justify',
								value:'center'
							},
							{
								label:'两端对齐',
								cmdName:'justify',
								value:'justify'
							}
						]
					},
{
						label:'表格属性',
						cmdName:'edittable',
						exec:function () {
							this.tableDialog.open();
						}
					},
{
							label:'单元格属性',
							cmdName:'edittd',
							exec:function () {
								this.ui._dialogs['tdDialog'].open();
							}
						},
{
						group:'表格',
						icon:'table',
						subMenu:[
							{
								label:'删除表格',
								cmdName:'deletetable'
							},
							{
								label:'表格前插行',
								cmdName:'insertparagraphbeforetable'
							},
							'-',
							{
								label:'删除行',
								cmdName:'deleterow'
							},
							{
								label:'删除列',
								cmdName:'deletecol'
							},
							'-',
							{
								label:'前插入行',
								cmdName:'insertrow'
							},
							{
								label:'前插入列',
								cmdName:'insertcol'
							},
							'-',
							{
								label:'右合并单元格',
								cmdName:'mergeright'
							},
							{
								label:'下合并单元格',
								cmdName:'mergedown'
							},
							'-',
							{
								label:'拆分成行',
								cmdName:'splittorows'
							},
							{
								label:'拆分成列',
								cmdName:'splittocols'
							},
							{
								label:'合并多个单元格',
								cmdName:'mergecells'
							},
							{
								label:'完全拆分单元格',
								cmdName:'splittocells'
							}
						]
					},
{
					label:'复制(ctrl+c)',
					cmdName:'copy',
					exec:function () {
						alert('请使用ctrl+c进行复制');
					}
				},
{
					label:'粘贴(ctrl+v)',
					cmdName:'paste',
					exec:function () {
						alert( '请使用ctrl+v进行粘贴' );
					}
				}],
initialStyle:
'.selectTdClass{background-color:#3399FF !important}'+
'table{margin-bottom:10px;border-collapse:collapse;}td{padding:2px;}'+
'.pagebreak{display:block;clear:both !important;cursor:default !important;width: 100% !important;margin:0;}'+
'.anchorclass{background: url("' + URL + 'themes/default/images/anchor.gif") no-repeat scroll left center transparent;border: 1px dotted #0000FF;cursor: auto;display: inline-block;height: 16px;width: 15px;}' +
'.view{padding:0;word-wrap:break-word;word-break:break-all;cursor:text;height:100%;}' +
'body{margin:8px;font-family:"宋体";font-size:16px;}' +
'li{clear:both}' +
'p{margin:.5em 0}',
initialContent: '<span style="color:red">欢迎使用易云</span>',
autoClearinitialContent:false,
iframeCssUrl :'themes/default/iframe.css',
removeFormatTags : 'b,big,code,del,dfn,em,font,i,ins,kbd,q,samp,small,span,strike,strong,sub,sup,tt,u,var',
removeFormatAttributes : 'class,style,lang,width,height,align,hspace,valign',
enterTag : 'br',
maxUndoCount : 20,
maxInputCount : 20,
selectedTdClass : 'selectTdClass',
pasteplain : true, 
textarea : 'editorValue',
focus : true,
indentValue : '2em',
pageBreakTag : '_baidu_page_break_tag_',
minFrameHeight: 320,
autoHeightEnabled:true,
autoFloatEnabled: false,
elementPathEnabled : true,
wordCount:true, 
maximumWords:10000,
tabSize : 4,
tabNode : '&nbsp;',
imagePopup:true,
emotionLocalization:false,
sourceEditor: 'codemirror',
tdHeight : '20',
highlightJsUrl:URL+'third-party/SyntaxHighlighter/shCore.js',
highlightCssUrl:URL+'third-party/SyntaxHighlighter/shCoreDefault.css',
codeMirrorJsUrl:URL + 'third-party/codemirror2.15/codemirror.js',
codeMirrorCssUrl:URL + 'third-party/codemirror2.15/codemirror.css',
zIndex : 999, //编辑器z-index的基数
fullscreen : false, //是否上来就是全屏
snapscreenHost: 'localhost',
snapscreenServerFile: URL +"server/upload/php/snapImgUp.php",
snapscreenServerPort: 80,
snapscreenImgAlign: 'center',
snapscreenImgIsUseImagePath: 1,
messages:{
pasteMsg:'编辑器将过滤掉您粘贴内容中的不支持格式！',
wordCountMsg:'当前已输入 {#count} 个字符，您还可以输入{#leave} 个字符 ',
wordOverFlowMsg:'你输入的字符个数已经超出最大允许值，服务器可能会拒绝保存！',
pasteWordImgMsg:'您粘贴的内容中包含本地图片，需要转存后才能正确显示！',
snapScreenNotIETip: '截图功能需要在ie浏览器下使用',
snapScreenMsg:'截图上传失败，请检查你的PHP环境。 '
},
serialize : function(){  
return {
blackList: {style:1,script:1,link:1,object:1,applet:1,input:1,meta:1,base:1,button:1,select:1,textarea:1,'#comment':1,'map':1,'area':1}
};
}(),
ComboxInitial: {
FONT_FAMILY: '字体',
FONT_SIZE: '字号',
PARAGRAPH: '段落格式',
CUSTOMSTYLE :'自定义样式'
},
autotypeset:{
mergeEmptyline : true,          //合并空行
removeClass : true,            //去掉冗余的class
removeEmptyline : false,        //去掉空行
textAlign : "left",             //段落的排版方式，可以是 left,right,center,justify 去掉这个属性表示不执行排版
lineHeight : "1",            //段内间距 %单位 去掉这个属性表示不执行排版
imageBlockLine : "center",      //图片的浮动方式，独占一行剧中,左右浮动，默认: center,left,right,none 去掉这个属性表示不执行排版
pasteFilter : false,             //根据规则过滤没事粘贴进来的内容
clearFontSize : false,           //去掉所有的内嵌字号，使用编辑器默认的字号
clearFontFamily : false,         //去掉所有的内嵌字体，使用编辑器默认的字体
removeEmptyNode : false,         // 去掉空节点
//可以去掉的标签
removeTagNames : {div:1,a:1,abbr:1,acronym:1,address:1,b:1,bdo:1,big:1,cite:1,code:1,del:1,dfn:1,em:1,font:1,i:1,ins:1,label:1,kbd:1,q:1,s:1,samp:1,small:1,span:1,strike:1,strong:1,sub:1,sup:1,tt:1,u:1,"var":1},
indent : false,                  // 行首缩进
indentValue : "2em"             //行首缩进的大小
}
};
})();