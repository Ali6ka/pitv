<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ taglib prefix="f" uri="http://www.ctechnology.kg/jstl_functions"%>--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Main sidebar -->
<div class="site-menubar">
    <div class="site-menubar-body scrollable scrollable-inverse scrollable-vertical hoverscorll-disabled is-enabled" style="position: relative;">
        <div class="scrollable-container" style="height: 844.984px; width: 275px;">
            <div class="scrollable-content" style="width: 260px;">
                <ul class="site-menu" data-plugin="menu" style="transform: translate3d(0px, 0px, 0px);">
                    <li class="site-menu-category">General</li>
                    <li class="site-menu-item has-sub">
                        <a href="javascript:void(0)">
                            <i class="site-menu-icon fa-users" aria-hidden="true"></i>
                            <span class="site-menu-title">User</span>
                            <span class="site-menu-arrow"></span>
                        </a>
                        <ul class="site-menu-sub">
                            <li class="site-menu-item">
                                <a class="animsition-link" href="<c:url value="/dashboard/user/list"/>">
                                    <span class="site-menu-title">User list</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="<c:url value="/dashboard/user/new"/>">
                                    <span class="site-menu-title">Create user</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="site-menu-item has-sub">
                        <a href="javascript:void(0)">
                            <i class="site-menu-icon fa-drivers-license-o" aria-hidden="true"></i>
                            <span class="site-menu-title">Role</span>
                            <span class="site-menu-arrow"></span>
                        </a>
                        <ul class="site-menu-sub">
                            <li class="site-menu-item">
                                <a class="animsition-link" href="<c:url value="/dashboard/role/list"/>">
                                    <span class="site-menu-title">Role list</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="<c:url value="/dashboard/role/new"/>">
                                    <span class="site-menu-title">Create role</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <div class="site-menubar-section">
                        <h5>
                            Milestone
                            <span class="float-right">30%</span>
                        </h5>
                        <div class="progress progress-xs">
                            <div class="progress-bar active" style="width: 30%;" role="progressbar"></div>
                        </div>
                        <h5>
                            Release
                            <span class="float-right">60%</span>
                        </h5>
                        <div class="progress progress-xs">
                            <div class="progress-bar progress-bar-warning" style="width: 60%;" role="progressbar"></div>
                        </div>
                    </div>
            </div>
        </div>
        <div class="scrollable-bar scrollable-bar-vertical is-disabled scrollable-bar-hide" draggable="false">
            <div class="scrollable-bar-handle" style="height: 701.914px;">
            </div>
        </div>
    </div>
    <div class="site-menubar-footer">
        <a href="javascript: void(0);" class="fold-show" data-placement="top" data-toggle="tooltip" data-original-title="Settings">
            <span class="icon wb-settings" aria-hidden="true"></span>
        </a>
        <a href="javascript: void(0);" data-placement="top" data-toggle="tooltip" data-original-title="Lock">
            <span class="icon wb-eye-close" aria-hidden="true"></span>
        </a>
        <a href="<c:url value="/logout"/>" data-placement="top" data-toggle="tooltip" data-original-title="Logout">
            <span class="icon wb-power" aria-hidden="true"></span>
        </a>
    </div>
</div>
<!-- /main sidebar -->