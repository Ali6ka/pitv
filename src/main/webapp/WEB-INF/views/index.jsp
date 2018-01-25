<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Home" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebar/>
    </tiles:putAttribute>

    <tiles:putAttribute name="page-header">
        <h1 class="page-title">Home page</h1>
        <cm:breadcrumb/>
    </tiles:putAttribute>
    <tiles:putAttribute name="page-content">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Welcome</h3>
            </div>
            <div class="panel-body __web-inspector-hide-shortcut__">
                <p>Media content monitoring system of International Alatoo University</p>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
