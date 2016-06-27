/*===========================
2. Initialization
==========================*/
$(function () {
    $('#main-menu').on('show.bs.collapse', function () {
        $('#download-menu').removeClass("in");
        $('#account-menu').removeClass("in");
        $('#tomainmenu').addClass("color494949");
        $('#todownloadmenu').removeClass("color494949");
        $('#toaccountmenu').removeClass("color494949");
    }).on('hide.bs.collapse', function () {
        $('#tomainmenu').removeClass("color494949");
    });
    $('#download-menu').on('show.bs.collapse', function () {
        $('#main-menu').removeClass("in");
        $('#account-menu').removeClass("in");
        $('#todownloadmenu').addClass("color494949");
        $('#tomainmenu').removeClass("color494949");
        $('#toaccountmenu').removeClass("color494949");
    }).on('hide.bs.collapse', function () {
        $('#todownloadmenu').removeClass("color494949");
    });
    $('#account-menu').on('show.bs.collapse', function () {
        $('#download-menu').removeClass("in");
        $('#main-menu').removeClass("in");
        $('#toaccountmenu').addClass("color494949");
        $('#todownloadmenu').removeClass("color494949");
        $('#tomainmenu').removeClass("color494949");
    }).on('hide.bs.collapse', function () {
        $('#toaccountmenu').removeClass("color494949");
    });
});
