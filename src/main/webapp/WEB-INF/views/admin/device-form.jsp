<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="master">

    <tiles:putAttribute name="title" value="Dashboard-Device" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebarAdmin/>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-header">
        <h1 class="page-title">Device form</h1>
        <cm:breadcrumb/>
        <div class="page-header-actions">
            <div class="mb-15">
                <a href="<c:url value="/admin/device/list"/> ">
                    <button class="btn btn-outline btn-primary" type="button">
                        <i class="icon wb-list" aria-hidden="true"></i> Device list
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
                                <cm:alert_wizard title="${result == 'success' ? 'Device successfuly saved' :
                                                                            'Sorry, the error was occured, try again'}"
                                                 alert_type="${result == 'success' ? 'success' : 'danger'}" />
                            </c:if>
                            <spring:url value="/admin/device/save" var="actionUrl"/>
                            <form:form action="${actionUrl}" method="post" class="admin-form" modelAttribute="device">
                                <div class="tab-content">
                                    <spring:bind path="ip">
                                    <div class="form-group">
                                        <form:label class="form-control-label" path="ip" for="ip">IP address <sup class="requiredStar">*</sup>
                                        </form:label>
                                        <form:input type="text" path="ip" id="ip" class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${device.ip}" required="true"/>
                                    </div>
                                    </spring:bind>
                                    <spring:bind path="login">
                                    <div class="form-group">
                                        <form:label class="form-control-label" path="login" for="login">Login <sup class="requiredStar">*</sup>
                                        </form:label>
                                        <form:input type="text" path="login" id="login"
                                               class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${device.login}" required="true"/>
                                    </div>
                                    </spring:bind>
                                    <spring:bind path="password">
                                    <div class="form-group">
                                        <form:label class="form-control-label" path="password" for="password">Password <sup class="requiredStar">*</sup>
                                        </form:label>
                                        <form:input type="text" path="password" id="password"
                                               class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${device.password}" required="true"/>
                                    </div>
                                    </spring:bind>
                                    <spring:bind path="block">
                                    <div class="form-group">
                                        <form:label class="form-control-label" path="block" for="block"> Block <sup class="requiredStar">*</sup></form:label>
                                        <form:select path="block" class="form-control select2-hidden-accessible" data-plugin="select2"
                                                     data-select2-id="4" tabindex="-1" aria-hidden="true"
                                                     name="roles" id="block" placeholder="Choose roles"
                                                     oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                     oninput="setCustomValidity('')" required="true">
                                            <form:options items="${blocks}" itemValue="id" itemLabel="name"/>
                                        </form:select>
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
                                        <form:input type="hidden" path="id" value="${device.id}"/>
                                    </spring:bind>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="text-right taxes-form__submit-wrapper">
                                        <button type="submit" class="btn btn-primary">Save device<i class="icon-arrow-right14 position-right"></i></button>
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