<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="master">

    <tiles:putAttribute name="title" value="Dashboard-Department" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebarAdmin/>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-header">
        <h1 class="page-title">Department form</h1>
        <cm:breadcrumb/>
        <div class="page-header-actions">
            <div class="mb-15">
                <a href="<c:url value="/admin/department/list"/> ">
                    <button id="" class="btn btn-outline btn-primary" type="button">
                        <i class="icon wb-list" aria-hidden="true"></i> Department list
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
                                <cm:alert_wizard title="${result == 'success' ? 'Department successfuly saved' :
                                                                            'Sorry, the error was occured, try again'}"
                                                 alert_type="${result == 'success' ? 'success' : 'danger'}" />
                            </c:if>
                            <spring:url value="/admin/department/save" var="actionsUrl"/>
                            <form:form action="${actionsUrl}" method="post" class="admin-form" modelAttribute="department">
                                <div class="tab-content">
                                    <spring:bind path="name">
                                    <div class="form-group">
                                        <form:label class="form-control-label" path="name" for="name">Name<sup class="requiredStar">*</sup>
                                        </form:label>
                                        <form:input type="text" path="name" id="name" class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${department.name}" required="true"/>
                                    </div>
                                    </spring:bind>
                                    <spring:bind path="code">
                                    <div class="form-group">
                                        <form:label class="form-control-label" path="code" for="code">Short Name <sup class="requiredStar">*</sup>
                                        </form:label>
                                        <form:input type="text" path="code" id="code" class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${department.code}" required="true"/>
                                    </div>
                                    </spring:bind>
                                    <spring:bind path="calendarId">
                                    <div class="form-group">
                                        <form:label class="form-control-label" path="calendarId" for="calendarId">Calendar ID <sup class="requiredStar">*</sup>
                                        </form:label>
                                        <form:input type="text" path="calendarId" id="calendarId" class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${department.calendarId}" required="true"/>
                                    </div>
                                    </spring:bind>
                                    <spring:bind path="faculty">
                                    <div class="form-group">
                                        <form:label class="form-control-label" path="faculty" for="faculty"> Faculty <sup class="requiredStar">*</sup></form:label>
                                        <form:select path="faculty" class="form-control select2-hidden-accessible" data-plugin="select2"
                                                     data-select2-id="4" tabindex="-1" aria-hidden="true"
                                                     name="roles" id="faculty" placeholder="Choose roles"
                                                     oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                     oninput="setCustomValidity('')" required="true">
                                            <form:options items="${faculties}" itemValue="id" itemLabel="name"/>
                                        </form:select>
                                    </div>
                                    </spring:bind>
                                    <spring:bind path="id">
                                        <form:input type="hidden" path="id" value="${department.id}"/>
                                    </spring:bind>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="text-right taxes-form__submit-wrapper">
                                        <button type="submit" class="btn btn-primary">Save department<i class="icon-arrow-right14 position-right"></i></button>
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