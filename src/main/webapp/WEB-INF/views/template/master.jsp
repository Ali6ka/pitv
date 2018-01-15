<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<%--    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>--%>
    <title><tiles:insertAttribute name="title" /></title>
</head>

<body class="navbar-bottom">
<div class="wrapper">

    <div class="content custom">

        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="body" />

    </div>
    <!-- .content -->
    <tiles:insertAttribute name="footer" />
</div>
<!-- .wrapper -->

</body>
</html>