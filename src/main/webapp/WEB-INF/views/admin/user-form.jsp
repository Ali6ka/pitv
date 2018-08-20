<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="f" uri="http://pitv/jstl_functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="master">
<tiles:putAttribute name="title" value="Dashboard-User" />
<tiles:putAttribute name="sidebar">
    <cm:sidebarAdmin/>
</tiles:putAttribute>

<tiles:putAttribute name="page-header">
    <h1 class="page-title">User form</h1>
    <cm:breadcrumb/>
    <div class="page-header-actions">
        <div class="mb-15">
            <a href="<c:url value="/admin/user/list"/> ">
                <button class="btn btn-outline btn-primary" type="button">
                    <i class="icon wb-list" aria-hidden="true"></i> User list
                </button>
            </a>
        </div>
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
                            <spring:url value="/admin/user/save" var="userActionUrl" />
                            <form:form action="${userActionUrl}" method="post" class="admin-form" modelAttribute="user">
                                <div class="form-row">
                                    <spring:bind path="username">
                                    <div class="form-group col-md-6">
                                        <form:label class="form-control-label" path="username">Username <sup class="requiredStar">*</sup></form:label>
                                        <form:input type="text" path="username" id="username" class="form-control"
                                               placeholder="Enter username"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')"/>
                                    </div>
                                    </spring:bind>
                                    <spring:bind path="password">
                                    <div class="form-group col-md-6">
                                        <form:label class="form-control-label" path="password">Password <sup class="requiredStar">*</sup></form:label>
                                        <form:input type="password" path="password" id="password"  class="form-control" placeholder="Your strong password"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" />
                                    </div>
                                    </spring:bind>
                                </div>
                                <div class="form-group">
                                    <spring:bind path="roles">
                                    <form:label class="form-control-label" path="roles"> Roles: <sup class="requiredStar">*</sup></form:label>
<%--                                    <select class="form-control select2-hidden-accessible" multiple="" data-plugin="select2"
                                            data-select2-id="4" tabindex="-1" aria-hidden="true"
                                            name="roles" id="roles" placeholder="Choose roles"
                                            oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                            oninput="setCustomValidity('')">
                                        <c:forEach items="${roles}" var="role">
                                            <c:if test="${isNew}">
                                                <form:option value="${role.id}">${fn:toLowerCase(role.name)}</form:option>
                                            </c:if>
                                            <c:if test="${!isNew}">
                                                <c:choose>
                                                    <c:when test='${f:containsValue(user.roles, role)}'>
                                                        <form:option value="${role.id}">${fn:toLowerCase(role.name)}</form:option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form:option value="${role.id}">${fn:toLowerCase(role.name)}</form:option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </c:forEach>
                                    </select>--%>
                                    <form:select path="roles" class="form-control select2-hidden-accessible" multiple="true" data-plugin="select2"
                                                 data-select2-id="4" tabindex="-1" aria-hidden="true"
                                                 name="roles" id="roles" placeholder="Choose roles"
                                                 oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                 oninput="setCustomValidity('')" required="true">
                                        <form:options items="${roles}" itemValue="id" itemLabel="name"/>
                                    </form:select>
                                    </spring:bind>
                                </div>
                                <div class="form-group">
                                    <spring:bind path="email">
                                    <form:label class="form-control-label" path="email">Email <sup class="requiredStar">*</sup></form:label>
                                    <form:input type="email" path="email" id="email" class="form-control" value="${user.email}"
                                           placeholder="Enter email"
                                           oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                           oninput="setCustomValidity('')"/>
                                    </spring:bind>
                                </div>
                                <div class="form-group">
                                    <spring:bind path="id">
                                        <form:input type="hidden" path="id" name="userId" value="${user.id}"/>
                                    </spring:bind>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="text-right">
                                        <button type="submit" class="btn btn-primary">Save user<i class="icon-arrow-right14 position-right"></i></button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                    <!-- End Example Basic Form (Form row) -->
                </div>
            </div>
        </div>
    </div>
</tiles:putAttribute>
</tiles:insertDefinition>
