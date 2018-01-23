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
                    <cm:breadcrumb/>
                    <!-- .panel .panel-flat -->
                    <div class="panel panel-flat">
                        <c:if test="${!empty result}">
                            <cm:alert_wizard title="${result == 'success' ? 'User successfuly deleted' :
                                                                            'Sorry, the error was occured, try again'}"
                                             alert_type="${result == 'success' ? 'success' : 'danger'}" />
                        </c:if>
                        <div class="panel-body">
                            <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
                                <div class="datatable-scroll-wrap">
                                    <table class="table datatable-responsive dataTable no-footer dtr-inline"
                                           id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                            <thead>
                                            <tr role="row">
                                                <th>
                                                    Avatar
                                                </th>
                                                <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0"
                                                    rowspan="1" colspan="1" aria-sort="ascending" aria-label="First Name: activate to sort column descending">
                                                    Username
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
                                                    colspan="1" aria-label="Last Name: activate to sort column ascending">
                                                    Email
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
                                                    colspan="1" aria-label="Job Title: activate to sort column ascending">
                                                    Roles
                                                </th>
                                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
                                                    colspan="1" aria-label="Status: activate to sort column ascending">
                                                    Status
                                                </th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 100px;"
                                                    aria-label="Actions">
                                                    Actions
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${users}" var="user">
                                                <tr role="row" class="odd">
                                                    <td tabindex="0" class="sorting_1">
                                                        <a href="#" class="media-left">
                                                            <img src="/assets/custom/images/default_avatar.png" class="img-circle img-sm" alt="">
                                                        </a>
                                                    </td>
                                                    <td>${user.username}</td>
                                                    <td>${user.email}</td>
                                                    <td>
                                                        <c:forEach items="${user.roles}" var="role">
                                                            ${fn:toLowerCase(role.name)} /
                                                        </c:forEach>
                                                    </td>
                                                    <c:if test="${user.enabled == 0}">
                                                    <td><span class="label label-danger">
                                                            DISABLED
                                                        </span>
                                                    </td>
                                                    </c:if>
                                                    <c:if test="${user.enabled == 1}">
                                                        <td><span class="label label-success">
                                                            ENABLED
                                                        </span>
                                                        </td>
                                                    </c:if>

                                                    <td class="text-center">
                                                        <ul class="icons-list">
                                                            <li class="text-primary-600">
                                                                <a href="<c:url value="/dashboard/user/update/${user.id}"/>">
                                                                    <i class="icon-pencil7"></i>
                                                                </a>
                                                            </li>
                                                            <li class="text-danger-600">
                                                                <a href="<c:url value="/dashboard/user/delete/${user.id}"/>">
                                                                    <i class="icon-trash"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                    </table>
                                </div>
                            </div>
                        <!-- .panel-body -->
                    </div>
                    <!-- .panel.panel-flat -->
                </div>
                <!-- /main content -->
            </div>
            <!-- /page content -->
        </div>
        <!-- /page container -->
    </tiles:putAttribute>
</tiles:insertDefinition>

<script type="text/javascript" src="<c:url value='/assets/js/plugins/tables/datatables/datatables.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/plugins/tables/datatables/extensions/responsive.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/js/pages/datatables_responsive.js' />"></script>