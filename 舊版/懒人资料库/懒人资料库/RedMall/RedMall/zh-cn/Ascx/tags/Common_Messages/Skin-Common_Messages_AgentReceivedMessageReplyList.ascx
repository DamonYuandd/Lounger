<%@ Control Language="C#" %>
<%@ Import Namespace="Hishop.SystemServices"%>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Components" Assembly="Hishop.Web.Components" %>
<%@ Register TagPrefix="Hishop" Namespace="Hishop.Web.Controls" Assembly="Hishop.Web.Controls" %>

<p><label>回复：</label><asp:Literal ID="Literal1" Text='<%# Eval("Title") %>' runat="server"></asp:Literal> 时间：<span style="color:#5b5b5b; font-size:11px;"><Hishop:FormatedTimeLabel Time='<%# Eval("PublishDate") %>' runat="server" /></span></p>
<p><label></label><textarea rows="2" cols="20" id="Textarea1" readonly="readonly" style="height:40px;width:320px;vertical-align:top;"><%# Eval("PublishContent")%></textarea></p>