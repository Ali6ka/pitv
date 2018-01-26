<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>

<tiles:insertDefinition name="master">

    <tiles:putAttribute name="title" value="Dashboard-Block" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebarAdmin/>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-header">
        <h1 class="page-title">Device form</h1>
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
                            <form action="<c:url value='/dashboard/device/save'/>" method="post" class="admin-form">
                                <div class="tab-content">
                                    <div class="form-group">
                                        <label class="form-control-label" for="ip">IP address <sup class="requiredStar">*</sup>
                                        </label>
                                        <input type="text" name="ip" id="ip"
                                               class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${device.ip}" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="login">Login <sup class="requiredStar">*</sup>
                                        </label>
                                        <input type="text" name="login" id="login"
                                               class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${device.login}" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="password">Password <sup class="requiredStar">*</sup>
                                        </label>
                                        <input type="text" name="password" id="password"
                                               class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${device.password}" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="block"> Block <sup class="requiredStar">*</sup></label>
                                        <select class="form-control select2-hidden-accessible" data-plugin="select2"
                                                data-select2-id="4" tabindex="-1" aria-hidden="true"
                                                name="block" id="block" placeholder="Choose block"
                                                oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                oninput="setCustomValidity('')" required>
                                            <c:forEach items="${blocks}" var="block">
                                                <c:choose>
                                                    <c:when test="${block eq device.block}">
                                                        <option value="${block.id}" selected>${block.name}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${block.id}">${block.name}</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <input type="hidden" name="deviceId" value="${device.id}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="text-right taxes-form__submit-wrapper">
                                        <button type="submit" class="btn btn-primary">Save device<i class="icon-arrow-right14 position-right"></i></button>
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