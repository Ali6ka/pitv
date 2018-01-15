<%@ page pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Домашняя страница" />
    <tiles:putAttribute name="body">
        BODY
    </tiles:putAttribute>
</tiles:insertDefinition>