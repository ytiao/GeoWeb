<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cht.emap.webservice.sdk.RoutingService" %>
<%@ page import="net.hinet.map.wfs.RoutingService.RS_GetCHTRouting_Result" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="com.google.gson.Gson" %>
<!doctype html>
<html>
<head>
	<meta charset=utf-8>
	<meta http-equiv="X-UA-Compatible" content="chrome=1">
	<title>GEOWEB Planning</title>
</head>
<body>
<h1>GEOWEB Planning</h1>
<%
String isv ="367f7deaa1ce47b185a0c91cb6d8f714";
String isvkey="n+ABj+1w6e1Ht2A2ziBh0Q==";
//取得路徑規劃instance
com.cht.emap.webservice.sdk.RoutingService Rservice = new com.cht.emap.webservice.sdk.RoutingService(isv, isvkey, "http", "api.hicloud.hinet.net", 80);
// 進行路徑規劃
net.hinet.map.wfs.RoutingService.RS_GetCHTRouting_Result RoutingResult = null; 
try
{
//依照參數進行路徑規劃
    String[] RoutintType = new String[1];
    RoutintType[0] = "Best";
    RoutingResult = Rservice.GetCHTRouting(RoutintType, "121.518,25.0448;121.51831,25.04136", false);
        	                    	    
}
catch (Exception e){
    // 本元件功能異常
    //out.println(e.getMessage());
    out.println("error");
}
// 取得規劃結果後，可參考6.6資料結構圖存取內部資料
//return code, return message
out.println(RoutingResult.getInformation().getCode()) ;
out.println("<br>");
out.println(RoutingResult.getInformation().getMessage());
out.println("<br>");
//規劃結果矩形範圍、總距離
out.println("規劃結果矩形範圍x值:"+RoutingResult.getJourney().getSummary().getMBR().getLowerLeft().getSysX());
out.println("<br>");
out.println("規劃結果總距離:"+RoutingResult.getJourney().getSummary().getDistance());
out.println("<br>");
//規劃結果路名
out.println("<br>");
out.println("規劃結果路名:"+RoutingResult.getJourney().getRoute(0).getRoadList());
//所有道路的轉折點經緯度座標
out.println("<br>");
out.println("道路的轉折點經緯度座標:"+RoutingResult.getPointList().getPoints());

%>
</body>
</html>
