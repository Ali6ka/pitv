<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="f" uri="http://pitv/jstl_functions" %>

<tiles:insertDefinition name="master">

    <tiles:putAttribute name="title" value="Dashboard-Block" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebarAdmin/>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-header">
        <h1 class="page-title">Block form</h1>
        <cm:breadcrumb/>
        <div class="page-header-actions">
            <div class="mb-15">
                <a href="<c:url value="/admin/block/list"/> ">
                    <button id="addToTable" class="btn btn-outline btn-primary" type="button">
                        <i class="icon wb-list" aria-hidden="true"></i> Block list
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
                                <cm:alert_wizard title="${result == 'success' ? 'Block successfuly saved' :
                                                                            'Sorry, the error was occured, try again'}"
                                                 alert_type="${result == 'success' ? 'success' : 'danger'}" />
                            </c:if>
                            <form action="<c:url value='/admin/block/save'/>" method="post" class="admin-form">
                                <div class="tab-content">
                                    <div class="form-group">
                                        <label class="form-control-label" for="name">Title : <sup class="requiredStar">*</sup>
                                        </label>
                                        <input type="text" name="name" id="name"
                                               class="form-control"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" value="${block.name}" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="roles"> Roles <sup class="requiredStar">*</sup></label>
                                        <select class="form-control select2-hidden-accessible" multiple="" data-plugin="select2"
                                                data-select2-id="4" tabindex="-1" aria-hidden="true"
                                                name="roles" id="roles" placeholder="Choose roles"
                                                oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                oninput="setCustomValidity('')" required>
                                            <c:forEach items="${roles}" var="role">
                                                <c:if test="${isNew}">
                                                    <option value="${role.id}">${fn:toLowerCase(role.name)}</option>
                                                </c:if>
                                                <c:if test="${!isNew}">
                                                    <c:choose>
                                                        <c:when test='${f:containsValue(block.roles, role)}'>
                                                            <option value="${role.id}" selected>${fn:toLowerCase(role.name)}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${role.id}">${fn:toLowerCase(role.name)}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <input type="hidden" name="blockId" value="${block.id}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="text-right taxes-form__submit-wrapper">
                                        <button type="submit" class="btn btn-primary">Save block<i class="icon-arrow-right14 position-right"></i></button>
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