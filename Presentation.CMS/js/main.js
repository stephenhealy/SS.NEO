// On Resize
var ssResized = false;
jQuery(window).resize(function () {
    if (ssResized) {
        clearTimeout(ssResized);
    }
    ssResized = setTimeout(function () {
        Resize();
    }, 300);
});

function Resize() {
}

function ShowWait() {
    var $div = $('<div id="preloader"><div class="inner"><span class="loader"></span></div></div>').appendTo('body');
}

function HideWait() {
    if (jQuery('#preloader').length > 0) {
        jQuery('#preloader').fadeOut(1000, function () {
            jQuery('#preloader').remove();
        });
    }
}

function Confirm(button, text) {
    if (button != null && ($(button).hasClass("aspNetDisabled") || $(button).is(".disabled")))
        return false;
    else
        return confirm(text);
}

function LoadModal(Modal, Src, Title, BottomLeft) {
    var ModalID = $("#" + Modal);
    if (Title == null)
        ModalID.find(".modal-header").hide();
    else
        ModalID.find(".modal-title").html(Title);
    if (BottomLeft == null)
        ModalID.find(".modal-footer").hide();
    else
        ModalID.find(".modal-title").html(BottomLeft);
    ModalID.find("iframe").attr("src", Src);
    ModalID.modal();
    CloseModal(ModalID);
}
function CloseModal(ModalID) {
    ModalID.on("hidden.bs.modal", function () {
        ModalID.find("iframe").attr("src", RelativePath + "/_Misc/Loading.aspx");
    });
}
function HideModal(Modal) {
    var ModalID = $("#" + Modal);
    ModalID.modal('hide');
}
function HideModalRefresh(Modal) {
    ShowWait();
    var ModalID = $("#" + Modal);
    ModalID.modal('hide');
    window.location = window.location;
}
function HideModalNavigate(Modal, Url) {
    ShowWait();
    var ModalID = $("#" + Modal);
    ModalID.modal('hide');
    window.location = Url;
}
function DoValidation(validationGroup, button) {
    if (button != null && ($(button).hasClass("aspNetDisabled") || $(button).hasClass("disabled") || $(button).is(":disabled")))
        return false;
    else if (typeof (Page_ClientValidate) == "function") {
        var isValid = checkValidationGroup(validationGroup);
        Page_BlockSubmit = false;
        return isValid;
    }
    else
        return true;
}
function checkValidationGroup(valGrp) {
    var rtnVal = true;
    for (ii = 0; ii < Page_Validators.length; ii++) {
        if (Page_Validators[ii].validationGroup == valGrp) {
            var visible = $('#' + Page_Validators[ii].controltovalidate).is(':visible');
            if (visible) {
                ValidatorValidate(Page_Validators[ii]);
                if (!Page_Validators[ii].isvalid) { //at least one is not valid. 
                    //alert(Page_Validators[ii].controltovalidate); 
                    $("#" + Page_Validators[ii].controltovalidate).closest(".form-group").addClass("has-error");
                    rtnVal = false;
                    break; //exit for-loop, we are done. 
                }
                else
                    $("#" + Page_Validators[ii].controltovalidate).closest(".form-group").removeClass("has-error");
            }
        }
    }
    return rtnVal;
}
//function CMS_Find(id) {
//    while (window.parent != window)
//        window = window.parent;
//    return CMS_FindFrame(id, window);
//}
//function CMS_FindFrame(id, frame) {
//    for (var ii = 0; ii < frame.frames.length; ii++) {
//        var cms_control_value = $("#" + id, frame.frames[0].document);
//        if (cms_control_value.length > 0)
//            return cms_control_value;
//        else
//            CMS_FindFrame(id, frame.frames[0]);
//    }
//}
function BrwoserSave(TextControl, Value, ReplaceURL) {
    if (ReplaceURL != "")
        Value = Value.replace(ReplaceURL, "");
    //if (CKEditorFunc != '') {
    //    // ckeditor
    //    try {
    //        var CKEditorFuncNum = parseInt(CKEditorFunc);
    //        window.opener.CKEDITOR.tools.callFunction(CKEditorFuncNum, cms_val, '');
    //        window.close();
    //    } catch (ex) { }
    //}
    //else {
    var cms_control = $("#" + TextControl);
    cms_control.val(Value);
    HideModal('mainModal');
    //}
    return false;
}
