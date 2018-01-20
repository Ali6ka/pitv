<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ taglib prefix="f" uri="http://www.ctechnology.kg/jstl_functions"%>--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Main sidebar -->
<div class="sidebar sidebar-main">
    <div class="sidebar-content">

        <!-- User menu -->
        <div class="sidebar-user">
            <div class="category-content">
                <div class="media">
                    <a href="#" class="media-left"><img src="<c:url value='/assets/custom/images/default_avatar.png'/>" class="img-circle img-sm" alt=""></a>
                    <div class="media-body">
                        <span class="media-heading text-semibold">Admin</span>
                        <div class="text-size-mini text-muted">
                            <i class="icon-pin text-size-small"></i> &nbsp;Santa Ana, CA
                        </div>
                    </div>

                    <div class="media-right media-middle">
                        <ul class="icons-list">
                            <li>
                                <a href="#"><i class="icon-cog3"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- /user menu -->


        <!-- Main navigation -->
        <div class="sidebar-category sidebar-category-visible">
            <div class="category-content no-padding">
                <ul class="navigation navigation-main navigation-accordion">

                    <!-- Main -->
                    <li class="navigation-header"><span>Main</span> <i class="icon-menu" title="" data-original-title="Main pages"></i></li>
                    <li><a href="index.html"><i class="icon-home4"></i> <span>Dashboard</span></a></li>
                    <li class="active">
                        <a href="#" class="has-ul"><i class="icon-stack2"></i> <span>Page layouts</span></a>
                        <ul>
                            <li><a href="layout_navbar_fixed.html">Fixed navbar</a></li>
                            <li><a href="layout_navbar_sidebar_fixed.html">Fixed navbar &amp; sidebar</a></li>
                            <li><a href="layout_sidebar_fixed_native.html">Fixed sidebar native scroll</a></li>
                            <li class="active"><a href="layout_navbar_hideable.html">Hideable navbar</a></li>
                            <li><a href="layout_navbar_hideable_sidebar.html">Hideable &amp; fixed sidebar</a></li>
                            <li><a href="layout_footer_fixed.html">Fixed footer</a></li>
                            <li class="navigation-divider"></li>
                            <li><a href="boxed_default.html">Boxed with default sidebar</a></li>
                            <li><a href="boxed_mini.html">Boxed with mini sidebar</a></li>
                            <li><a href="boxed_full.html">Boxed full width</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="has-ul"><i class="icon-copy"></i> <span>Layouts</span></a>
                        <ul class="hidden-ul">
                            <li><a href="../../../layout_1/LTR/index.html" id="layout1">Layout 1</a></li>
                            <li><a href="index.html" id="layout2">Layout 2 <span class="label bg-warning-400">Current</span></a></li>
                            <li><a href="../../../layout_3/LTR/index.html" id="layout3">Layout 3</a></li>
                            <li><a href="../../../layout_4/LTR/index.html" id="layout4">Layout 4</a></li>
                            <li><a href="../../../layout_5/LTR/index.html" id="layout5">Layout 5</a></li>
                            <li class="disabled"><a href="../../../layout_6/LTR/index.html" id="layout6">Layout 6 <span class="label label-transparent">Coming soon</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="has-ul"><i class="icon-droplet2"></i> <span>Color system</span></a>
                        <ul class="hidden-ul">
                            <li><a href="colors_primary.html">Primary palette</a></li>
                            <li><a href="colors_danger.html">Danger palette</a></li>
                            <li><a href="colors_success.html">Success palette</a></li>
                            <li><a href="colors_warning.html">Warning palette</a></li>
                            <li><a href="colors_info.html">Info palette</a></li>
                            <li class="navigation-divider"></li>
                            <li><a href="colors_pink.html">Pink palette</a></li>
                            <li><a href="colors_violet.html">Violet palette</a></li>
                            <li><a href="colors_purple.html">Purple palette</a></li>
                            <li><a href="colors_indigo.html">Indigo palette</a></li>
                            <li><a href="colors_blue.html">Blue palette</a></li>
                            <li><a href="colors_teal.html">Teal palette</a></li>
                            <li><a href="colors_green.html">Green palette</a></li>
                            <li><a href="colors_orange.html">Orange palette</a></li>
                            <li><a href="colors_brown.html">Brown palette</a></li>
                            <li><a href="colors_grey.html">Grey palette</a></li>
                            <li><a href="colors_slate.html">Slate palette</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="has-ul"><i class="icon-stack"></i> <span>Starter kit</span></a>
                        <ul class="hidden-ul">
                            <li><a href="starters/horizontal_nav.html">Horizontal navigation</a></li>
                            <li><a href="starters/1_col.html">1 column</a></li>
                            <li><a href="starters/2_col.html">2 columns</a></li>
                            <li>
                                <a href="#" class="has-ul">3 columns</a>
                                <ul class="hidden-ul">
                                    <li><a href="starters/3_col_dual.html">Dual sidebars</a></li>
                                    <li><a href="starters/3_col_double.html">Double sidebars</a></li>
                                </ul>
                            </li>
                            <li><a href="starters/4_col.html">4 columns</a></li>
                            <li>
                                <a href="#" class="has-ul">Detached layout</a>
                                <ul class="hidden-ul">
                                    <li><a href="starters/detached_left.html">Left sidebar</a></li>
                                    <li><a href="starters/detached_right.html">Right sidebar</a></li>
                                    <li><a href="starters/detached_sticky.html">Sticky sidebar</a></li>
                                </ul>
                            </li>
                            <li><a href="starters/layout_boxed.html">Boxed layout</a></li>
                            <li class="navigation-divider"></li>
                            <li><a href="starters/layout_navbar_fixed_main.html">Fixed main navbar</a></li>
                            <li><a href="starters/layout_navbar_fixed_secondary.html">Fixed secondary navbar</a></li>
                            <li><a href="starters/layout_navbar_fixed_both.html">Both navbars fixed</a></li>
                            <li><a href="starters/layout_fixed.html">Fixed layout</a></li>
                        </ul>
                    </li>
                    <li><a href="changelog.html"><i class="icon-list-unordered"></i> <span>Changelog <span class="label bg-blue-400">1.6</span></span></a></li>
                    <li><a href="../../RTL/default/index.html"><i class="icon-width"></i> <span>RTL version</span></a></li>
                    <!-- /main -->

                    <!-- Forms -->
                    <li class="navigation-header"><span>Forms</span> <i class="icon-menu" title="" data-original-title="Forms"></i></li>
                    <li>
                        <a href="#" class="has-ul"><i class="icon-pencil3"></i> <span>Form components</span></a>
                        <ul class="hidden-ul">
                            <li><a href="form_inputs_basic.html">Basic inputs</a></li>
                            <li><a href="form_checkboxes_radios.html">Checkboxes &amp; radios</a></li>
                            <li><a href="form_input_groups.html">Input groups</a></li>
                            <li><a href="form_controls_extended.html">Extended controls</a></li>
                            <li><a href="form_floating_labels.html">Floating labels</a></li>
                            <li>
                                <a href="#" class="has-ul">Selects</a>
                                <ul class="hidden-ul">
                                    <li><a href="form_select2.html">Select2 selects</a></li>
                                    <li><a href="form_multiselect.html">Bootstrap multiselect</a></li>
                                    <li><a href="form_select_box_it.html">SelectBoxIt selects</a></li>
                                    <li><a href="form_bootstrap_select.html">Bootstrap selects</a></li>
                                </ul>
                            </li>
                            <li><a href="form_tag_inputs.html">Tag inputs</a></li>
                            <li><a href="form_dual_listboxes.html">Dual Listboxes</a></li>
                            <li><a href="form_editable.html">Editable forms</a></li>
                            <li><a href="form_validation.html">Validation</a></li>
                            <li><a href="form_inputs_grid.html">Inputs grid</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="has-ul"><i class="icon-file-css"></i> <span>JSON forms</span></a>
                        <ul class="hidden-ul">
                            <li><a href="alpaca_basic.html">Basic inputs</a></li>
                            <li><a href="alpaca_advanced.html">Advanced inputs</a></li>
                            <li><a href="alpaca_controls.html">Controls</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="has-ul"><i class="icon-footprint"></i> <span>Wizards</span></a>
                        <ul class="hidden-ul">
                            <li><a href="wizard_steps.html">Steps wizard</a></li>
                            <li><a href="wizard_form.html">Form wizard</a></li>
                            <li><a href="wizard_stepy.html">Stepy wizard</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="has-ul"><i class="icon-spell-check"></i> <span>Editors</span></a>
                        <ul class="hidden-ul">
                            <li><a href="editor_summernote.html">Summernote editor</a></li>
                            <li><a href="editor_ckeditor.html">CKEditor</a></li>
                            <li><a href="editor_wysihtml5.html">WYSIHTML5 editor</a></li>
                            <li><a href="editor_code.html">Code editor</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="has-ul"><i class="icon-select2"></i> <span>Pickers</span></a>
                        <ul class="hidden-ul">
                            <li><a href="picker_date.html">Date &amp; time pickers</a></li>
                            <li><a href="picker_color.html">Color pickers</a></li>
                            <li><a href="picker_location.html">Location pickers</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="has-ul"><i class="icon-insert-template"></i> <span>Form layouts</span></a>
                        <ul class="hidden-ul">
                            <li><a href="form_layout_vertical.html">Vertical form</a></li>
                            <li><a href="form_layout_horizontal.html">Horizontal form</a></li>
                        </ul>
                    </li>
                    <!-- /forms -->
                </ul>
            </div>
        </div>
        <!-- /main navigation -->
    </div>
</div>
<!-- /main sidebar -->