<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="cm" tagdir="/WEB-INF/tags"%>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Admin" />
    <tiles:putAttribute name="sidebar">
        <cm:sidebarAdmin/>
    </tiles:putAttribute>

    <tiles:putAttribute name="body">
        <div class="page-header">
            <h1 class="page-title">Menu Collapsed</h1>
        </div>
        <div class="page-content">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">DEMO CONTENT</h3>
                </div>
                <div class="panel-body __web-inspector-hide-shortcut__">
                    <p>Liberatione, pueros dissentio athenis inventore morborum efficiat facere</p>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>