<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>

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
                            <form action="<c:url value='/admin/department/save'/>" method="post" class="admin-form">
                                <div class="tab-content">
                                    <div class="form-group">
                                        <label class="form-control-label" for="name">Name<sup class="requiredStar">*</sup>
                                        </label>
                                        <input type="text" name="name" id="name"
                                               class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${department.name}" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="code">Short Name <sup class="requiredStar">*</sup>
                                        </label>
                                        <input type="text" name="code" id="code"
                                               class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${department.code}" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="calendarId">Calendar ID <sup class="requiredStar">*</sup>
                                        </label>
                                        <input type="text" name="calendarId" id="calendarId"
                                               class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${department.calendarId}" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="faculty"> Faculty <sup class="requiredStar">*</sup></label>
                                        <select class="form-control select2-hidden-accessible" data-plugin="select2"
                                                data-select2-id="4" tabindex="-1" aria-hidden="true"
                                                name="faculty" id="faculty" placeholder="Choose faculty"
                                                oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                oninput="setCustomValidity('')" required>
                                            <c:forEach items="${faculties}" var="faculty">
                                                <c:choose>
                                                    <c:when test="${faculty eq department.faculty}">
                                                        <option value="${faculty.id}" selected>${faculty.name}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${faculty.id}">${faculty.name}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <input type="hidden" name="departmentId" value="${department.id}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="text-right taxes-form__submit-wrapper">
                                        <button type="submit" class="btn btn-primary">Save department<i class="icon-arrow-right14 position-right"></i></button>
                                    </div>
                                </div> <!-- .tab-content -->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>