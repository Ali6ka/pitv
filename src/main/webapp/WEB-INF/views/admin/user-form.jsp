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
                    <!-- News -->
                    <div class="panel panel-flat">
                        <div class="panel-heading">
                            <h2 class="panel-title"> </h2>
                        </div>
                        <div class="panel-body">
                            <form action="/dashboard/user/save" method="post">
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <div class="panel panel-flat">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">Centered panel<a class="heading-elements-toggle"><i class="icon-more"></i></a></h5>
                                            </div>

                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <label>Username: <sup class="requiredStar">*</sup></label>
                                                    <input type="text" name="username" class="form-control" placeholder="Eugene Kopyov"
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
                                                    <input type="email" name="email" class="form-control" placeholder="Eugene Kopyov"
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
                                                                <option value="${role.id}">${fn:toLowerCase(role.name)}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

<%--                                                <div class="form-group">
                                                    <label>Attach screenshot:</label>
                                                    <div class="uploader"><input type="file" class="file-styled"><span class="filename" style="user-select: none;">No file selected</span><span class="action btn bg-pink-400" style="user-select: none;">Choose File</span></div>
                                                    <span class="help-block">Accepted formats: gif, png, jpg. Max file size 2Mb</span>
                                                </div>--%>

<%--                                                <div class="form-group">
                                                    <label>Your message:</label>
                                                    <textarea rows="5" cols="5" class="form-control" placeholder="Enter your message here"></textarea>
                                                </div>--%>

                                                <input type="hidden" name="userId" value="${user.id}">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <div class="text-right">
                                                    <button type="submit" class="btn btn-primary">Submit form <i class="icon-arrow-right14 position-right"></i></button>
                                                </div>
                                            </div>
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
        <!-- /page container -->
    </tiles:putAttribute>
</tiles:insertDefinition>
