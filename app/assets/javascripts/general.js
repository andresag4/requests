/**
 * Created by davidvilla on 09/07/16.
 */
$(window).bind('page:change', function () {
    $(ClientSideValidations.selectors.forms).enableClientSideValidations();
    //iCheck initializer
    $('input').iCheck({
        checkboxClass: 'icheckbox_square-orange',
        radioClass: 'iradio_square-red',
        increaseArea: '20%' // optional
    });
    $('[data-toggle="tooltip"]').tooltip();
    $.AdminLTE.layout.fix();
    $.AdminLTE.pushMenu.activate($.AdminLTE.options.sidebarToggleSelector);

    $('.date-picker-form').datetimepicker({
        locale: locale,
        format: 'D/M/YYYY',
        showTodayButton: true
    });
});
