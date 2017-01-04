jQuery(document).ready(function () {
    // ********* Browsers *************
    $('.cms_browserImages').find('a').bind('click', function (e) {   //images
        if (CMS_ExcludeTreeView(this)) {  // exclude treeview +/-
            e.preventDefault();
            var cms_val = $(this).attr("href");
            $("#cms_browser_text").val(cms_val);
            $("#cms_browser_hidden").val(cms_val);
            $(".cms_browserR1_2").children("img").remove();
            $(".cms_browserR1_2").children("p").remove();
            $(".cms_browserR1_2").append("<img id=\"cms_browser_img\" src=\"" + cms_val + "\" alt=\"Loading...\" />");
            CMS_Wait();
            setTimeout(function () { CMS_ResizeBrowserIMG() }, 200)
        }
    });
    $('.cms_browserL0 li').bind('click', function (e) {  // history
        e.preventDefault();
        CMS_Wait();
        $('.cms_browserL0 li').removeClass("cms-clicked");
        $(this).addClass("cms-clicked");
        $('#cms_BrowserIframe').attr("src", $(this).attr("href"));
        //CMS_WaitHide();
    });
    $('.cms_browserTab ul.cms_browserLink li').bind('click', function (e) {   // tabs
        e.preventDefault();
        CMS_Wait();
        $('.cms_browserTab ul.cms_browserLink li').removeClass("cms-clicked");
        $(this).addClass("cms-clicked");
        $('.cms_browserTabbing').hide();
        $('.' + $(this).attr("href")).show();
        //$('.' + $(this).attr("href") + " div.cms-browse-iframe").empty().append("<iframe width='100%' height='100%' frameborder='0' scrolling='auto' allowtransparency='true' src='http://www.sitesteam.com'></iframe>");
        CMS_WaitHide();
    });
    //$('.cms_browserTab ul.cms_browserControls li').bind('click', function (e) {
    //    e.preventDefault();
    //    CMS_Wait();
    //    $('.cms_browserTab ul.cms_browserControls li').removeClass("cms-clicked");
    //    $(this).addClass("cms-clicked");
    //    $('.cms_browserTabbing').hide();
    //    //alert($(this).attr("href"));
    //    $('.' + $(this).attr("href")).show();
    //    CMS_WaitHide();
    //});
    $('.cms_browserTabPage').find('a').bind('click', function (e) {  // page preview
        e.preventDefault();
        if ($(this).attr("href").indexOf("javascript:") < 0) {  // exclude treeview +/-
            CMS_Wait();
            var cms_val = $(this).attr("href");
            $("#cms_browser_text").val(cms_val);
            $(".cms_browserTabPage div.cms-browse-iframe").empty().append("<iframe width='100%' height='100%' frameborder='0' scrolling='auto' allowtransparency='true' src='" + cms_val + "'></iframe>");
            $('.cms_browserTabPage a').removeClass("cms-selected");
            $(this).addClass("cms-selected");
            CMS_WaitHide();
        }
        else   // execute href function
            eval($(this).attr("href"));
    });
    $('.cms_browserTabFile').find('a').bind('click', function (e) {  // file preview
        e.preventDefault();
        if ($(this).attr("href").indexOf("javascript:") < 0) {  // exclude treeview +/-
            CMS_Wait();
            var cms_val = $(this).attr("href");
            $("#cms_browser_text").val(cms_val);
            $(".cms_browserTabFile div.cms-browse-iframe").empty().append("<iframe width='100%' height='100%' frameborder='0' scrolling='auto' allowtransparency='true' src='" + cms_val + "'></iframe>");
            $('.cms_browserTabFile a').removeClass("cms-selected");
            $(this).addClass("cms-selected");
            CMS_WaitHide();
        }
        else   // execute href function
            eval($(this).attr("href"));
    });
    $('.cms_browserTabAdmin').find('a').bind('click', function (e) {  // admin preview
        e.preventDefault();
        if ($(this).attr("href").indexOf("javascript:") < 0) {  // exclude treeview +/-
            CMS_Wait();
            var cms_val = $(this).attr("href");
            $("#cms_browser_text").val(cms_val);
            $(".cms_browserTabAdmin div.cms-browse-iframe").empty().append("<iframe width='100%' height='100%' frameborder='0' scrolling='auto' allowtransparency='true' src='" + cms_val + "'></iframe>");
            $('.cms_browserTabAdmin a').removeClass("cms-selected");
            $(this).addClass("cms-selected");
            CMS_WaitHide();
        }
        else   // execute href function
            eval($(this).attr("href"));
    });
});
function CMS_BrwoserSave(CKEditorFunc, TextControl, HiddenControl, liveURL) {
    var cms_val = $('#cms_browser_text').val();
    if (liveURL != "")
        cms_val = cms_val.replace(liveURL, "");
    if (CKEditorFunc != '') {
        // ckeditor
        try {
            var CKEditorFuncNum = parseInt(CKEditorFunc);
            window.opener.CKEDITOR.tools.callFunction(CKEditorFuncNum, cms_val, '');
            window.close();
        } catch (ex) { }
    }
    else {
        var cms_control = window.parent.CMS_Find(TextControl);
        cms_control.val(cms_val);
        if (HiddenControl != '') {
            var cms_hidden = window.parent.CMS_Find(HiddenControl);
            cms_hidden.val(cms_val);
        }
        CMS_ModalClose();
    }
    return false;
}
function CMS_ResizeBrowserIMG() {
    var greatW = $("#cms_browser_img").width() - $(".cms_browserR1_2").width();
    var greatH = $("#cms_browser_img").height() - $(".cms_browserR1_2").height();
    if (greatW > 0) {
        if (greatH > 0) {
            greatW = greatW / $(".cms_browserR1_2").width();
            greatH = greatH / $(".cms_browserR1_2").height();
            if (greatW > greatH)
                $("#cms_browser_img").width($(".cms_browserR1_2").width());
            else
                $("#cms_browser_img").height($(".cms_browserR1_2").height());
        }
        else
            $("#cms_browser_img").width($(".cms_browserR1_2").width());
    }
    else if (greatH > 0)
        $("#cms_browser_img").height($(".cms_browserR1_2").height());
    CMS_WaitHide();
}
function CMS_ExcludeTreeView(a) {
    // exclude treeview +/-
    return ($(a).attr("href").indexOf("javascript:") < 0);
}