</html><%@ page pageEncoding="UTF-8" session="true"%>
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
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title><tiles:insertAttribute name="title" /></title>

    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
    <link href="<c:url value='/assets/css/icons/icomoon/styles.css' />" rel="stylesheet" type="text/css">
    <link href="<c:url value='/assets/css/plugins/bootstrap.css' />" rel="stylesheet" type="text/css">
    <link href="<c:url value='/assets/css/plugins/core.css' />" rel="stylesheet" type="text/css">
    <link href="<c:url value='/assets/css/plugins/components.css' />" rel="stylesheet" type="text/css">
    <link href="<c:url value='/assets/css/plugins/colors.css' />" rel="stylesheet" type="text/css">
    <!-- /global stylesheets -->

    <!-- Custom styles -->
    <link href="<c:url value='/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.css' />" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<c:url value='/assets/font-awesome/css/font-awesome.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/plugins/owl-carousel/owl.carousel.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/plugins/owl-carousel/owl.theme.css' />">
   <%-- <link rel="stylesheet" href="<c:url value='/assets/custom/css/styles.css' />">--%>
    <!-- /custom styles-->
</head>

<body class="navbar-top layout">
<%-- 		<div id="preload">
            <div class="spinner">
                <div class="rect1"></div>
                <div class="rect2"></div>
                <div class="rect3"></div>
                <div class="rect4"></div>
                <div class="rect5"></div>
            </div>
        </div>--%>

<div class="wrapper">

    <div class="content custom">

        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="body" />

    </div>
    <!-- .content -->
    <tiles:insertAttribute name="footer" />
</div>
<!-- .wrapper -->

<!-- Core JS files -->
<script type="text/javascript" src="<c:url value='/assets/js/plugins/loaders/pace.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/core/libraries/jquery.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/core/libraries/bootstrap.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/plugins/loaders/blockui.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/plugins/ui/nicescroll.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/plugins/ui/drilldown.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/plugins/ui/fab.min.js' />"></script>
<!-- /core JS files -->

<!-- Theme JS files -->
<script type="text/javascript" src="<c:url value='/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/plugins/ui/prism.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/core/app.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/plugins/ui/ripple.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/plugins/ui/headroom/headroom.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/plugins/ui/headroom/headroom_jquery.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/pages/navbar_hideable.js' />"></script>

<!-- /theme JS files -->

<!-- Custom JS files -->
<script src="<c:url value='/assets/plugins/owl-carousel/owl.carousel.min.js' />"></script>
<!-- Custom JS files -->

<!-- logic for show/hide sidebar on mobile(less than 768px) -->
</body>
</html>