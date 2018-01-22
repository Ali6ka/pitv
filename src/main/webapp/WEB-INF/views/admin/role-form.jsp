<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Dashboard-User" />
    <tiles:putAttribute name="body">

        <c:set var="lang" value="${pageContext.response.locale.language}"/>

        <!-- Page container -->
        <div class="page-container">

            <!-- Page content -->
            <div class="page-content">

                <cm:sidebarAdmin/>

                <!-- Main content -->
                <div class="content-wrapper">
                    <!-- News -->
                    <div class="panel panel-flat">
                        <div class="panel-heading">
                            <h2 class="panel-title">Create User</h2>
                        </div>
                        <div class="panel-body">
                            <form action="<c:url value='/dashboardrole'/>" method="post" class="admin-form">
                                <div class="tab-content">
                                    <div class="form-group row">
                                        <label class="control-label col-lg-3" for="name">Title : <sup class="requiredStar">*</sup>
                                        </label>
                                        <div class="col-lg-9">
                                            <input type="text" name="name" id="name"
                                                   class="form-control"
                                                   oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                   oninput="setCustomValidity('')" value="${role.name}" required>
                                        </div>
                                    </div>
                                    <input type="hidden" name="roleId" value="${role.id}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="text-right taxes-form__submit-wrapper">
                                        <input type="submit" class="btn btn-primary" name="submit" value="Save">
                                    </div>
                                </div> <!-- .tab-content -->
                            </form>
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