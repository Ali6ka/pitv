<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>

<tiles:insertDefinition name="master">
<tiles:putAttribute name="title" value="Dashboard-User" />
<tiles:putAttribute name="sidebar">
    <cm:sidebarAdmin/>
</tiles:putAttribute>

<tiles:putAttribute name="page-header">
    <h1 class="page-title">User list</h1>
    <cm:breadcrumb/>
    <div class="page-header-actions">
        <button type="button" class="btn btn-sm btn-icon btn-default btn-outline btn-round"
                data-toggle="tooltip" data-original-title="Edit">
            <i class="icon wb-pencil" aria-hidden="true"></i>
        </button>
        <button type="button" class="btn btn-sm btn-icon btn-default btn-outline btn-round"
                data-toggle="tooltip" data-original-title="Refresh">
            <i class="icon wb-refresh" aria-hidden="true"></i>
        </button>
        <button type="button" class="btn btn-sm btn-icon btn-default btn-outline btn-round"
                data-toggle="tooltip" data-original-title="Setting">
            <i class="icon wb-settings" aria-hidden="true"></i>
        </button>
    </div>
</tiles:putAttribute>

<tiles:putAttribute name="page-content">
    <div class="panel">
        <div class="panel-body">
            <c:if test="${!empty result}">
                <cm:alert_wizard title="${result == 'success' ? 'User successfuly deleted' :
                    'Sorry, the error was occured, try again'}"
                                 alert_type="${result == 'success' ? 'success' : 'danger'}" />
            </c:if>
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-15">
                        <a href="<c:url value="/dashboard/user/new"/> ">
                            <button id="addToTable" class="btn btn-outline btn-primary" type="button">
                                <i class="icon wb-plus" aria-hidden="true"></i> Create new
                            </button>
                        </a>
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-hover table-striped" cellspacing="0" id="exampleAddRow">
                <thead>
                <tr>
                    <th class="text-center">Avatar</th>
                    <th>Username</th>
                    <th>Roles</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${users}" var="user">
                    <tr class="gradeA">
                        <td class="text-center">
                            <a href="#" class="media-left">
                                <img src="/assets/custom/images/default_avatar.png" class="navbar-brand-logo" alt="">
                            </a>
                        </td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>
                            <c:forEach items="${user.roles}" var="role">
                                ${fn:toLowerCase(role.name)} /
                            </c:forEach>
                        </td>
                        <td class="actions">
                            <a href="<c:url value="/dashboard/user/update/${user.id}"/>"
                               class="btn btn-sm btn-icon btn-pure btn-default on-default edit-row"
                               data-toggle="tooltip" data-original-title="Edit">
                                <i class="icon wb-edit" aria-hidden="true"></i>
                            </a>
                            <a href="<c:url value="/dashboard/user/delete/${user.id}"/>"
                               class="btn btn-sm btn-icon btn-pure btn-default on-default remove-row"
                               data-toggle="tooltip" data-original-title="Remove">
                                <i class="icon wb-trash" aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</tiles:putAttribute>
</tiles:insertDefinition>


