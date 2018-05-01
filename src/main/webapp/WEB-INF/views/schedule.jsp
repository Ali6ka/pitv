<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Schedule" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebar/>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-header">
        <h1 class="page-title">Schedule - Current day</h1>
        <cm:breadcrumb/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page-content">
        <div class="panel">
            <div class="example table-responsive table-bordered">
                <c:forEach items="${schedule}" var="depSchedule">
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="text-center" style="background-color: #263238; color: white" colspan="6">${depSchedule.key}</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${depSchedule.value}" var="groupSchedule">
                            <tr>
                                <th width="100px" style="color: white; background-color: #007bff">${groupSchedule.key}</th>
                                <c:forEach items="${groupSchedule.value}" var="event">
                                    <%--<fmt:formatDate value="${event.start.dateTime}" pattern="HH:MM" var="start"/>--%>
                                    <%--<fmt:formatDate value="${event.end.dateTime}" pattern="HH:MM" var="end"/>--%>
                                    <td>${event.summary}<br>${event.location}</td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <br>
                </c:forEach>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>

<%--                <table class="table">
                    <thead>
                        <tr>
                            <th></th>
                            <th>8:30-9:10</th>
                            <th>9:20-10:00</th>
                            <th>10:10-10:50</th>
                            <th>11:00-11:40</th>
                            <th>11:50-12:30</th>
                            <th>13:20-14:00</th>
                            <th>14:10-14:50</th>
                            <th>15:00-15:40</th>
                            <th>15:50-16:30</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>1-a</th>
                            <td>${schedule[0].summary} / ${schedule[0].location}</td>
                            <td>Prohaska</td>
                            <td>@Elijah</td>
                        </tr>
                    </tbody>
                </table>--%>