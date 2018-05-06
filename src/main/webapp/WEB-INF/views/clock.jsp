<%@ page pageEncoding="UTF-8" session="true"%><%@
        taglib
        uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%><%@
        taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@
        taglib
        prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<tiles:insertDefinition name="master_second">
    <tiles:putAttribute name="title" value="MCMS: Clock" />
    <tiles:putAttribute name="body">
        <!-- Page -->
        <div class="page vertical-align text-center" data-animsition-in="fade-in" data-animsition-out="fade-out">
            <div class="page-content vertical-align-middle animation-slide-top animation-duration-1" style="padding-top: 0">
                <div class="brand">
                    <img class="brand-img" src="../../assets//images/logo@2x.png" alt="...">
<%--                    <span style="font-size: 25px; color: white; font-weight: 500; margin-left: 15px; font-family:">
                        PITV
                    </span>--%>
                </div>
                <br>
                <div class="panel" style="width:600px">
                    <div class="panel-body" style="padding-left:61px; padding-bottom: 50px">
                        <div class="clock"></div>
                </div>
            </div>
        </div>
        <!-- End Page -->
    </tiles:putAttribute>
    <tiles:putAttribute name="js">
        <script type="text/javascript">
            $(document).ready(function() {
                var clock;
                clock = $('.clock').FlipClock({
                    clockFace: 'TwentyFourHourClock',
                    showSeconds: true
                });
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>