<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title><t:insertAttribute name="title"/></title>
<style type="text/css">
#container 
{
  
}
header
{
   text-align: center;
   width: 100%;
}
nav
{
      
}
#top
{
   
}
#body
{
   text-align: center;
   width: 100%;
   padding-bottom:50px;
}
#footer
{
   bottom: 0px;
   width: 100%;
   text-align: center;
   font-size: 15px;
   line-height: 30px;
   background-color: #ddd;
   color: white; 
}
</style>
</head>
<body>
   <div id="container">
      <div id="top">
         <t:insertAttribute name="top"/>
      </div>
      <div id="body">
         <t:insertAttribute name="body"/>
         <t:insertAttribute name="side-right"/>
      </div>
      <div id="footer">
         <t:insertAttribute name="footer"/>
      </div>
   </div>
</body>
</html>


