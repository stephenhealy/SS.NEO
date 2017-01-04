// On Load
jQuery(window).load(function () {
    Resize();

    // Smooth scroll to position on page
    $('.scrolly').click(function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 1000);
                return false;
            }
        }
    });
});

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
    var newWidth = jQuery(window).width();

    // Resize home page carousel
    var HomeCarousel = (newWidth / 4);
    if (HomeCarousel < 300)
        HomeCarousel = 300;
    if (jQuery("#masthead-carousel").length > 0) {
        jQuery("#masthead-carousel .carousel-inner").css({ "height": HomeCarousel + "px" });
    }
}
function LoadModal(Modal, Src, Title, Registration) {
    var ModalID = $("#" + Modal);
    if (Title == null)
        ModalID.find(".modal-header").hide();
    else
        ModalID.find(".modal-title").html(Title);
    ModalID.find("iframe").attr("src", Src);
    if (Registration != "") {
        ModalID.find(".btn-register").attr("target", "_blank");
        ModalID.find(".btn-register").attr("href", Registration);
    }
    else {
        ModalID.find(".btn-register").attr("target", "_self");
        ModalID.find(".btn-register").attr("href", "javascript:alert('Registration for this league has not been configured.\\n\\nPlease try back later...');");
    }
    ModalID.modal();
    CloseModal(ModalID);
}
function CloseModal(ModalID) {
    ModalID.on("hidden.bs.modal", function () {
        ModalID.find("iframe").attr("src", RelativePath + "/Loading.aspx");
    });
}
function HideModal(Modal) {
    var ModalID = $("#" + Modal);
    ModalID.modal('hide');
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
