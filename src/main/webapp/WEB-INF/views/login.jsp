<%@ page pageEncoding="UTF-8" session="true"%><%@
        taglib
        uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%><%@
        taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@
        taglib
        prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<tiles:insertDefinition name="master">
    <tiles:putAttribute name="title" value="Войти" />
    <tiles:putAttribute name="body">
        <!-- Page container -->
        <div class="page-container">

            <!-- Page content -->
            <div class="page-content">

                <!-- Main content -->
                <div class="content-wrapper">

                    <div class="login-container">
                        <div class="page-container">
                            <c:url var="loginUrl" value="/login" />
                            <!-- Simple login form -->
                            <form action="${loginUrl}" method="post">

                                <div class="panel panel-body login-form">
                                    <c:if test="${param.error != null}">
                                        <div class="alert alert-danger">
                                            <p>Invalid username and password.</p>
                                        </div>
                                    </c:if>
                                    <c:if test="${param.logout != null}">
                                        <div class="alert alert-success">
                                            <p>You have been logged out successfully.</p>
                                        </div>
                                    </c:if>
                                    <div class="text-center">
                                        <div class="icon-object border-slate-300 text-slate-300">
                                            <i class="icon-reading"></i>
                                        </div>
                                        <h5 class="content-group">
                                            Login to your account <small class="display-block">Enter
                                            your credentials below</small>
                                        </h5>
                                    </div>

                                    <div class="form-group has-feedback has-feedback-left">
                                        <input type="text" class="form-control" placeholder="Username"
                                               name="ssoId">
                                        <div class="form-control-feedback">
                                            <i class="icon-user text-muted"></i>
                                        </div>
                                    </div>

                                    <div class="form-group has-feedback has-feedback-left">
                                        <input type="password" class="form-control" name="password"
                                               placeholder="Password">
                                        <div class="form-control-feedback">
                                            <i class="icon-lock2 text-muted"></i>
                                        </div>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}"
                                           value="${_csrf.token}" />

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            Sign in <i class="icon-circle-right2 position-right"></i>
                                        </button>
                                    </div>

                                    <!-- 											<div class="text-center"> -->
                                    <!-- 												<a href="login_password_recover.html">Forgot password?</a> -->
                                    <!-- 											</div> -->
                                </div>
                            </form>
                            <!-- /simple login form -->
                        </div>
                    </div>
                </div>
                <!-- /main content -->
            </div>
            <!-- /page content -->
        </div>
        <!-- /page container -->
    </tiles:putAttribute>
</tiles:insertDefinition>