/**
 * Created by davidvilla on 09/07/16.
 */
$(window).on('ready turbolinks:load', function () {
    $.AdminLTE.layout.fix();
    $.AdminLTE.pushMenu.activate($.AdminLTE.options.sidebarToggleSelector);
});
