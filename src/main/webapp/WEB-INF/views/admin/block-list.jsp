<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Dashboard-Role" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebarAdmin/>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-header">
        <h1 class="page-title">Block list</h1>
        <cm:breadcrumb/>
        <div class="page-header-actions">
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-15">
                        <a href="<c:url value="/dashboard/block/new"/> ">
                            <button class="btn btn-outline btn-primary" type="button">
                                <i class="icon wb-plus" aria-hidden="true"></i> Create new
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-content">
        <div class="panel">
            <div class="panel-body">
                <c:if test="${!empty result}">
                    <cm:alert_wizard title="${result == 'success' ? 'Block successfuly deleted' :
                    'Sorry, the error was occured, try again'}"
                                     alert_type="${result == 'success' ? 'success' : 'danger'}" />
                </c:if>
                <table class="table table-bordered table-hover table-striped" cellspacing="0" id="exampleAddRow">
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Devices</th>
                        <th>Roles</th>
                        <th class="text-center">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${blocks}" var="block">
                        <tr class="gradeA">
                            <td>${block.name}</td>
                            <td>
                                <c:forEach items="${block.devices}" var="device">
                                    ${fn:toLowerCase(device.ip)} /
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach items="${block.roles}" var="role">
                                    <span class="badge badge-outline badge-primary">${fn:toLowerCase(role.name)}  </span>
                                </c:forEach>
                            </td>
                            <td class="actions text-center">
                                <a href="<c:url value="/admin/block/update/${block.id}"/>"
                                   class="btn btn-sm btn-icon btn-pure btn-default on-default"
                                   data-toggle="tooltip" data-original-title="Edit">
                                    <i class="icon wb-edit" aria-hidden="true"></i>
                                </a>
                                <a href="<c:url value="/admin/block/delete/${block.id}"/>"
                                   class="btn btn-sm btn-icon btn-pure btn-default on-default"
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