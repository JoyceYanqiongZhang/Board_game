<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="basic_class.*" %>
<%@ page import="model.*" %>

<% Users current_user = (Users)session.getAttribute("current_user"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Board Game Platform</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="http://localhost:8080/BoardGamePlatform/view/css/css.css" rel="stylesheet" type="text/css" />
    <link href="http://libs.baidu.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="http://localhost:8080/BoardGamePlatform/view/css/css_joyce.css" rel="stylesheet" type="text/css" />
    <link href="http://localhost:8080/BoardGamePlatform/view/css/css_joyce_pre.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="http://localhost:8080/BoardGamePlatform/view/js/jquery-1.8.2.min.js"></script>
    <script src="http://localhost:8080/BoardGamePlatform/view/general_script.js"></script>
    
    <script src="http://localhost:8080/BoardGamePlatform/view/js/switch.js"></script>
    <script src="http://localhost:8080/BoardGamePlatform/view/js/js.js"></script>
    
    