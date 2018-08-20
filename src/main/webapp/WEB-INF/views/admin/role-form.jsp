<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="master">

<tiles:putAttribute name="title" value="Dashboard-Role" />
<tiles:putAttribute name="sidebar">
    <cm:sidebarAdmin/>
</tiles:putAttribute>

<tiles:putAttribute name="page-header">
    <h1 class="page-title">Role form</h1>
    <cm:breadcrumb/>
    <div class="page-header-actions">
        <div class="mb-15">
            <a href="<c:url value="/admin/role/list"/> ">
                <button class="btn btn-outline btn-primary" type="button">
                    <i class="icon wb-list" aria-hidden="true"></i> Role list
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
                            <cm:alert_wizard title="${result == 'success' ? 'Role successfuly saved' :
                                                                            'Sorry, the error was occured, try again'}"
                                             alert_type="${result == 'success' ? 'success' : 'danger'}" />
                        </c:if>
                        <spring:url value="/admin/role/save" var="roleActionUrl" />
                        <form:form action="${roleActionUrl}" method="post" class="admin-form" modelAttribute="role">
                            <div class="tab-content">
                                <div class="form-group">
                                    <spring:bind path="name">
                                        <form:label class="form-control-label" for="name" path="name">Title : <sup class="requiredStar">*</sup></form:label>
                                        <form:input type="text" path="name" id="name"
                                               class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${role.name}" required="true"/>
                                    </spring:bind>
                                </div>
                                <spring:bind path="id">
                                    <form:input type="hidden" name="roleId" path="id" value="${role.id}"/>
                                </spring:bind>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="text-right taxes-form__submit-wrapper">
                                    <button type="submit" class="btn btn-primary">Save role<i class="icon-arrow-right14 position-right"></i></button>
                                </div>
                            </div> <!-- .tab-content -->
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</tiles:putAttribute>
</tiles:insertDefinition>