<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Все новости УПМ" />
    <tiles:putAttribute name="body">

        <c:set var="lang" value="${pageContext.response.locale.language}"/>

        <!-- Page container -->
        <div class="page-container">

            <!-- Page content -->
            <div class="page-content">

                <!-- Main content -->
                <div class="content-wrapper">
                    <!-- News -->
                    <div class="panel panel-flat news">
                        <div class="panel-heading">
                            <h2 class="panel-title">Все объявления</h2>
                        </div>
                        <div class="panel-body">
                            gkorekgropekgporewkgporegkreopgkropewkgorpgr
                            grewkgorekgporekwgoprekgoprekgoprekgopwrekgoprekpo
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