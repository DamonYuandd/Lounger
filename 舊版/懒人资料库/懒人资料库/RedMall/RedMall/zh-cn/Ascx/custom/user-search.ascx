<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Tags" Assembly="Hishop.Web.Tags" %>

    <!--À—À˜¿∏Ω· ¯-->
	 <table border="0" align="left" cellpadding="0" cellspacing="0" class="search-simple">
          <tr>
		  <td width="80" >			</td>
		  
            <td class="searchclass">
		
			</td>
            <td>
			
		<Hishop:Private_Search_Class ID="Search_Class" runat="server" />
			
			</td>
            <td>
		<Hishop:Private_Search_Keywords ID="Search_Keywords"  CssClass="search-input" Width="190" runat="server" />
		
			
			</td><td >
	<input name="À—À˜" type="button" class="search-btn" id="À—À˜" onclick="search()" />
	<input id="url" type="hidden" value="<%= Globals.GetSiteUrls().UrlData.FormatUrl("SearchResult")%>" />
		
			
			</td>
			
		    <td   class="xiatian_1">
			
			<div class="keywords">
			»»√≈£∫<Hishop:HotKeywords ID="HotKeywords1" runat="server"  />	</div></td>
			
            <td>
			<nobr>
			
			
			<span class="float_left" >
		
		<Hishop:SiteUrl UrlName="ProductSearch" runat="server"><Hishop:ThemesImage ID="ThemesImage2" src="images/btn-search-senior.jpg" runat="server"></Hishop:SiteUrl>
			
			
			</span></nobr></td>
          </tr>
    </table>
	
	
	
	
               
  
  <script type="text/javascript">
      function search() {
          var item = $("#drop_Private_Search_Class").val();
          var key = $("#txt_Private_Search_Keywords").val();
          if (key == undefined)
              key = "";

          var url = $("#url").val() + "?keywords=" + key + "&categoryId=" + item;
          window.location.href = encodeURI(url);
      }

      $(document).ready(function() {
          $('#txt_Private_Search_Keywords').keydown(function(e) {
              if (e.keyCode == 13) {
                  search();
              }
          })

//          var urlLocationStr = document.location.href;
//          var Keyword = /keywords=/;
//          Keyword.exec(urlLocationStr);
//          var keywordString = RegExp.rightContext;

//          keywordString = keywordString.substr(0, keywordString.indexOf("&"));
//          $('#txt_Private_Search_Keywords').val(decodeURI(keywordString));
      });
  </script>

