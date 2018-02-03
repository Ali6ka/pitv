<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="f" uri="http://pitv/jstl_functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="MCMS-User" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebar/>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-header">
        <h1 class="page-title">User Details</h1>
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
            <div class="panel-body container-fluid">
                <div class="row row-lg">
                    <div class="col-md-6">
                        <div class="nav-tabs-vertical" data-plugin="tabs">
                            <ul class="nav nav-tabs nav-tabs-line mr-25" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link active" data-toggle="tab" href="#exampleTabsLineLeftOne"
                                        aria-controls="exampleTabsLineLeftOne" role="tab">Personal information</a></li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link" data-toggle="tab" href="#exampleTabsLineLeftTwo"
                                        aria-controls="exampleTabsLineLeftTwo" role="tab">Password</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="exampleTabsLineLeftOne" role="tabpanel">
                                    <!-- Example Basic Form (Form row) -->
                                    <div class="example-wrap">
                                        <c:if test="${!empty result}">
                                            <cm:alert_wizard title="${result == 'success' ? 'Your changes successfully saved' :
                                                                            'Sorry, the error was occured, try again'}"
                                                             alert_type="${result == 'success' ? 'success' : 'danger'}" />
                                        </c:if>
                                        <div id="exampleAddRow_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                            <form action="<c:url value='/user/details/save-info'/>" method="post" class="admin-form" enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <label class="form-control-label" for="username">Username <sup class="requiredStar">*</sup></label>
                                                    <input type="text" name= "username" id="username" class="form-control" value="${user.username}"
                                                           placeholder="Enter username"
                                                           oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                           oninput="setCustomValidity('')" required>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-control-label" for="email">Email <sup class="requiredStar">*</sup></label>
                                                    <input type="email" name="email" id="email" class="form-control" value="${user.email}"
                                                           placeholder="Enter email"
                                                           oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                           oninput="setCustomValidity('')" required>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-control-label" for="avatar">Avatar <sup class="requiredStar">*</sup></label>
                                                    <input type="file" name="avatar" id="avatar" id="input-file-max-fs" data-plugin="dropify" data-max-file-size="2M"
                                                           value="${post.mediaFilePath}" data-default-file="<c:url value='/resources/${user.avatar}'/>"
                                                           placeholder="Enter email"
                                                           oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                           oninput="setCustomValidity('')" required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <div class="text-right">
                                                        <button type="submit" class="btn btn-primary">Save<i class="icon-arrow-right14 position-right"></i></button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- End Example Basic Form (Form row) -->
                                </div>
                                <div class="tab-pane" id="exampleTabsLineLeftTwo" role="tabpanel">
                                    <!-- Example Basic Form (Form row) -->
                                    <div class="example-wrap">
                                        <div id="exampleAddRow_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                            <form action="<c:url value='/user/details/save-password'/>" method="post" class="admin-form">
                                                <div class="form-group">
                                                    <label class="form-control-label" for="current">Current password <sup class="requiredStar">*</sup></label>
                                                    <input name= "current" id="current" class="form-control" placeholder="Enter current password"
                                                           oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                           oninput="setCustomValidity('')" required>
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-control-label" for="new">New password <sup class="requiredStar">*</sup></label>
                                                    <input name="new" id="new" class="form-control" placeholder="Enter email"
                                                           oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                           oninput="setCustomValidity('')" required>
                                                </div>
                                                <div class="form-group">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <div class="text-right">
                                                        <button type="submit" class="btn btn-primary">Save<i class="icon-arrow-right14 position-right"></i></button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- End Example Basic Form (Form row) -->
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>