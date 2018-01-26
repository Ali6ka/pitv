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
    <h1 class="page-title">User form</h1>
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
                <div class="col-md-4">
                    <!-- Example Basic Form (Form row) -->
                    <div class="example-wrap">
                        <c:if test="${!empty result}">
                            <cm:alert_wizard title="${result == 'success' ? 'User successfuly saved' :
                                                                            'Sorry, the error was occured, try again'}"
                                             alert_type="${result == 'success' ? 'success' : 'danger'}" />
                        </c:if>
                        <div id="exampleAddRow_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                            <form action="<c:url value='/dashboard/user/save'/>" method="post" class="admin-form">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label class="form-control-label" for="username">Username <sup class="requiredStar">*</sup></label>
                                        <input type="text" name= "username" id="username" class="form-control" value="${user.username}"
                                               placeholder="Enter username"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="form-control-label" for="password">Password <sup class="requiredStar">*</sup></label>
                                        <input type="password" name="password" id="password"  class="form-control" placeholder="Your strong password"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" required>
                                    </div>
                                </div>
<%--                                <div class="form-group">
                                    <label class="form-control-label">Gender</label>
                                    <div>
                                        <div class="radio-custom radio-default radio-inline">
                                            <input type="radio" id="inputBasicMale" name="inputGender">
                                            <label for="inputBasicMale">Male</label>
                                        </div>
                                        <div class="radio-custom radio-default radio-inline">
                                            <input type="radio" id="inputBasicFemale" name="inputGender" checked="">
                                            <label for="inputBasicFemale">Female</label>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="form-group">
                                    <label class="form-control-label" for="roles"> Roles: <sup class="requiredStar">*</sup></label>
                                    <select class="form-control select2-hidden-accessible" multiple="" data-plugin="select2"
                                            data-select2-id="4" tabindex="-1" aria-hidden="true"
                                            name="roles" id="roles" placeholder="Choose roles"
                                            oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                            oninput="setCustomValidity('')" required>
                                        <c:forEach items="${roles}" var="role">
                                            <option value="${role.id}"
                                                ${user.}>${fn:toLowerCase(role.name)}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label" for="email">Email <sup class="requiredStar">*</sup></label>
                                    <input type="email" name="email" id="email" class="form-control" value="${user.email}"
                                           placeholder="Enter email"
                                           oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                           oninput="setCustomValidity('')" required>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="userId" value="${user.id}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="text-right">
                                        <button type="submit" class="btn btn-primary">Save user<i class="icon-arrow-right14 position-right"></i></button>
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
</tiles:putAttribute>


  <%--      <!-- Page container -->
        <div class="page-container">

            <!-- Page content -->
            <div class="page-content"
                <!-- Main content -->
                <div class="content-wrapper"
                    <!-- News -->
                    <div class="panel panel-flat">

                        <div class="panel-body">
                            <form action="<c:url value='/dashboard/user/save'/>" method="post" class="admin-form">
                                <div class="row">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label>Username: <sup class="requiredStar">*</sup></label>
                                            <input type="text" name="username" class="form-control" value="${user.username}"
                                                   oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                   oninput="setCustomValidity('')" required>
                                        </div>

                                        <div class="form-group">
                                            <label>Password: <sup class="requiredStar">*</sup></label>
                                            <input type="password" name="password"  class="form-control" placeholder="Your strong password"
                                                   oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                   oninput="setCustomValidity('')" required>
                                        </div>

                                        <div class="form-group">
                                            <label>Email: <sup class="requiredStar">*</sup></label>
                                            <input type="email" name="email" class="form-control" value="${user.email}"
                                                   oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                   oninput="setCustomValidity('')" required>
                                        </div>

                                        <div class="form-group">
                                            <label>Roles: <sup class="requiredStar">*</sup></label>
                                            <div class="multi-select-full">
                                                <select name="roles" class="multiselect-full-featured" multiple="multiple" style="display: none;"
                                                   oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                    oninput="setCustomValidity('')" required>"
                                                    <c:forEach items="${roles}" var="role">
                                                        <option value="${role.id}" >${fn:toLowerCase(role.name)}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

&lt;%&ndash;                                                <div class="form-group">
                                            <label>Attach screenshot:</label>
                                            <div class="uploader"><input type="file" class="file-styled"><span class="filename" style="user-select: none;">No file selected</span><span class="action btn bg-pink-400" style="user-select: none;">Choose File</span></div>
                                            <span class="help-block">Accepted formats: gif, png, jpg. Max file size 2Mb</span>
                                        </div>&ndash;%&gt;

&lt;%&ndash;                                                <div class="form-group">
                                            <label>Your message:</label>
                                            <textarea rows="5" cols="5" class="form-control" placeholder="Enter your message here"></textarea>
                                        </div>&ndash;%&gt;

                                        <input type="hidden" name="userId" value="${user.id}">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary">Save user<i class="icon-arrow-right14 position-right"></i></button>
                                        </div>
                                    </div>
                                </div>
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
        <!-- /page container -->--%>
</tiles:insertDefinition>
