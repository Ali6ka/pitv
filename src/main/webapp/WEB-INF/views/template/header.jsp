<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page pageEncoding="UTF-8"%>

<!-- Page header -->
<header class="page-header header page-header-inverse bg-brand-color-blue">

 <%--   <c:set var="lang" value="${pageContext.response.locale.language}"/>--%>

    <!-- Main navbar -->
    <div class="navbar navbar-inverse navbar-transparent">
        <div class="navbar-header">
            <div class="navbar-brand-wrapper clearfix">
                <div class="navbar-left">
                    <img class="brand-img" src="<c:url value='/assets/custom/images/main_logo.png' />">
                </div>
                <div class="navbar-left">
                    <a class="navbar-brand" href="<c:url value='/' />">Система мониторинга медиа контента</a><br>
                </div>
            </div>
            <ul class="nav navbar-nav pull-right visible-xs-block">
                <li><a class="sidebar-mobile-main-toggle"><i
                        class="icon-paragraph-justify3"></i></a></li>
            </ul>
        </div>
    </div>
     <!-- /Main navbar -->

     <!-- Second navbar -->
     <div class="navbar navbar-inverse navbar-transparent"
          id="navbar-second">
         <ul class="nav navbar-nav no-border visible-xs-block">
             <li><a class="text-center collapsed" data-toggle="collapse"
                    data-target="#navbar-second-toggle"><i class="icon-menu7"></i></a></li>
         </ul>

         <div class="top-menu navbar-collapse collapse"
              id="navbar-second-toggle">
             <ul class="first-level-menu nav navbar-nav navbar-nav-material">
             </ul>
         </div>

     </div>
     <!-- /second navbar -->

</header>
<!-- /Page header -->