<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="f" uri="http://pitv/jstl_functions" %>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Dashboard-Post" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebar/>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-header">
        <h1 class="page-title">Post form</h1>
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
                                <cm:alert_wizard title="${result == 'success' ? 'Post successfuly saved' :
                                                                            'Sorry, the error was occured, try again'}"
                                                 alert_type="${result == 'success' ? 'success' : 'danger'}" />
                            </c:if>
                            <div id="exampleAddRow_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                                <form action="<c:url value='/post/save'/>" method="post" class="admin-form" enctype="multipart/form-data">
                                    <div class="form-row">
                                        <div class="form-group col-md-8">
                                            <label class="form-control-label" for="title">Title <sup class="requiredStar">*</sup></label>
                                            <input type="text" name= "title" id="title" class="form-control" value="${post.title}"
                                                   placeholder="Enter title"
                                                   oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                   oninput="setCustomValidity('')" required>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="form-control-label" for="dateUntil">Dead line <sup class="requiredStar">*</sup></label>
                                            <input type="text" name="dateUntil" id="dateUntil" class="form-control datepicker"
                                                   value="<fmt:formatDate value='${post.date}' pattern="dd.M.yyyy"/>"
                                                   oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                   oninput="setCustomValidity('')"  required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="blocks"> Blocks <sup class="requiredStar">*</sup></label>
                                        <select class="form-control select2-hidden-accessible" multiple="" data-plugin="select2"
                                                data-select2-id="4" tabindex="-1" aria-hidden="true"
                                                name="blocks" id="blocks" placeholder="Choose roles"
                                                oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                                oninput="setCustomValidity('')" required>
                                            <c:forEach items="${blocks}" var="block">
                                                <option value="${block.id}">${block.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label" for="file">Media File <sup class="requiredStar">*</sup></label>
                                        <input type="file" name="file" id="file" id="input-file-max-fs" data-plugin="dropify" data-max-file-size="10M"
                                               value="${post.mediaFilePath}"
                                               placeholder="Enter email"
                                               oninvalid="this.setCustomValidity('Это поле обязательно для заполнения')"
                                               oninput="setCustomValidity('')" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" name="userId" value="${post.id}">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-primary">Publish<i class="icon-arrow-right14 position-right"></i></button>
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
</tiles:insertDefinition>

<script type="text/javascript">
    $(function() {
        $('.datepicker').datepicker({
            format: "dd.mm.yyyy",
            changeMonth: true,
            changeYear: true,
            locale: 'ru',
        });
    });
</script>