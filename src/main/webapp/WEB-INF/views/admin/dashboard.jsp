<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Dashboard" />
    <tiles:putAttribute name="body">

        <c:set var="lang" value="${pageContext.response.locale.language}"/>

        <!-- Page container -->
        <div class="page-container">

            <!-- Page content -->
            <div class="page-content">

                <cm:sidebarAdmin/>

                <!-- Main content -->
                <div class="content-wrapper">

                    <cm:breadcrumb/>

                    <!-- News -->
                    <div class="panel panel-flat">
                        <div class="panel-heading">
                            <h2 class="panel-title">Admin page</h2>
                        </div>
                        <div class="panel-body">

                        </div>
                        <!-- .panel-body -->
                    </div>
                    <!-- .panel.panel-flat -->
                    <!--/news -->
                </div>
                <!-- /main content -->

            </div>
            <!-- /page content -->

        </div>
        <!-- /page container -->
    </tiles:putAttribute>
</tiles:insertDefinition>