<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Dashboard-User" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebar/>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-header">
        <h1 class="page-title">My post list</h1>
        <cm:breadcrumb/>
        <div class="page-header-actions">
            <div class="mb-15">
                <a href="<c:url value="/post/new/media"/> ">
                    <button class="btn btn-outline btn-primary" type="button">
                        <i class="icon wb-plus" aria-hidden="true"></i> Create new
                    </button>
                </a>
            </div>
        </div>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-content">
        <div class="panel">
            <div class="panel-body">
                <c:if test="${!empty result}">
                    <cm:alert_wizard title="${result == 'success' ? 'Post successfuly deleted' :
                    'Sorry, the error was occured, try again'}"
                                     alert_type="${result == 'success' ? 'success' : 'danger'}" />
                </c:if>
                <table class="table table-bordered table-hover table-striped" cellspacing="0" id="exampleAddRow">
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Dead Line</th>
                        <th>Blocks</th>
                        <th>Publisher</th>
                        <th class="text-center">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${posts}" var="post">
                        <c:if test="${post.status.title eq 'ACTIVE'}">
                        <tr class="gradeA">
                            <td>${post.title}</td>
                            <fmt:formatDate value="${post.date}" var="date" pattern="dd.MM.yyyy"/>
                            <td>${date}</td>
                            <fmt:formatDate value="${post.dateUntil}" var="dateUntil" pattern="dd.MM.yyyy"/>
                            <td>${dateUntil}</td>
                            <td>
                                <c:forEach items="${post.blocks}" var="block">
                                    <span class="badge badge-outline badge-primary">${block.name}</span>
                                </c:forEach>
                            </td>
                            <td>${post.author.username}</td>
                            <td class="actions text-center">
                                <a href="<c:url value="/post/delete/${post.id}"/>"
                                   class="btn btn-sm btn-icon btn-pure btn-default on-default remove-row"
                                   data-toggle="tooltip" data-original-title="Remove">
                                    <i class="icon wb-trash" aria-hidden="true"></i>
                                </a>
                            </td>
                        </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>


