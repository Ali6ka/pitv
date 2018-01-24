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
                            <i class="site-menu-icon wb-dashboard" aria-hidden="true"></i>
                            <span class="site-menu-title">Dashboard</span>
                            <div class="site-menu-badge">
                                <span class="badge badge-pill badge-success">3</span>
                            </div>
                        </a>
                        <ul class="site-menu-sub" style="">
                            <li class="site-menu-item active is-shown">
                                <a class="animsition-link" href="index.html">
                                    <span class="site-menu-title">Dashboard v1</span>
                                </a>
                            </li>
                            <li class="site-menu-item is-shown">
                                <a class="animsition-link" href="dashboard/v2.html">
                                    <span class="site-menu-title">Dashboard v2</span>
                                </a>
                            </li>
                            <li class="site-menu-item is-shown">
                                <a class="animsition-link" href="dashboard/ecommerce.html">
                                    <span class="site-menu-title">Ecommerce</span>
                                </a>
                            </li>
                            <li class="site-menu-item is-shown">
                                <a class="animsition-link" href="dashboard/analytics.html">
                                    <span class="site-menu-title">Analytics</span>
                                </a>
                            </li>
                            <li class="site-menu-item is-shown">
                                <a class="animsition-link" href="dashboard/team.html">
                                    <span class="site-menu-title">Team</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="site-menu-category">Elements</li>
                    <li class="site-menu-item has-sub">
                        <a href="javascript:void(0)">
                            <i class="site-menu-icon wb-extension" aria-hidden="true"></i>
                            <span class="site-menu-title">Widgets</span>
                            <span class="site-menu-arrow"></span>
                        </a>
                        <ul class="site-menu-sub">
                            <li class="site-menu-item">
                                <a class="animsition-link" href="widgets/statistics.html">
                                    <span class="site-menu-title">Statistics Widgets</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="widgets/data.html">
                                    <span class="site-menu-title">Data Widgets</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="widgets/blog.html">
                                    <span class="site-menu-title">Blog Widgets</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="widgets/chart.html">
                                    <span class="site-menu-title">Chart Widgets</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="widgets/social.html">
                                    <span class="site-menu-title">Social Widgets</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="widgets/weather.html">
                                    <span class="site-menu-title">Weather Widgets</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="site-menu-item has-sub">
                        <a href="javascript:void(0)">
                            <i class="site-menu-icon wb-table" aria-hidden="true"></i>
                            <span class="site-menu-title">Tables</span>
                            <span class="site-menu-arrow"></span>
                        </a>
                        <ul class="site-menu-sub">
                            <li class="site-menu-item">
                                <a class="animsition-link" href="tables/basic.html">
                                    <span class="site-menu-title">Basic Tables</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="tables/bootstrap.html">
                                    <span class="site-menu-title">Bootstrap Tables</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="tables/floatthead.html">
                                    <span class="site-menu-title">floatThead</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="tables/responsive.html">
                                    <span class="site-menu-title">Responsive Tables</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="tables/editable.html">
                                    <span class="site-menu-title">Editable Tables</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="tables/jsgrid.html">
                                    <span class="site-menu-title">jsGrid</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="tables/footable.html">
                                    <span class="site-menu-title">FooTable</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="tables/datatable.html">
                                    <span class="site-menu-title">DataTables</span>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="tables/jqtabledit.html">
                                    <span class="site-menu-title">Jquery Tabledit</span>
                                    <div class="site-menu-label">
                                        <span class="badge badge badge-info badge-round">new</span>
                                    </div>
                                </a>
                            </li>
                            <li class="site-menu-item">
                                <a class="animsition-link" href="tables/table-dragger.html">
                                    <span class="site-menu-title">Table Dragger</span>
                                    <div class="site-menu-label">
                                        <span class="badge badge badge-warning badge-round">new</span>
                                    </div>
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