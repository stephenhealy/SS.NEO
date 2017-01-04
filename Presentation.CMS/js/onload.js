/* On Load - use the following...
    arrLoad.push(new CodeBlock(function () {
    }));
*/
jQuery(window).load(function () {
    jQuery('.wait').on('click', function () {
        ShowWait();
    });
    jQuery('.focus').each(function (i, obj) {
        jQuery(this).focus();
    });
    jQuery('[data-toggle="tooltip"]').tooltip();
    jQuery('[data-toggle="popover"]').popover();
    jQuery(".alert-hide").fadeTo(3000, 500).slideUp(500, function () {
        $(".alert-hide").alert('close');
    });
    // Hide Wait Window
    HideWait();
    // Load page methods
    for (var ii = 0; ii < arrLoad.length; ii++) {
        try {
            arrLoad[ii].exec();
        }
        catch (ex) {
            console.log("Error loading : " + ex);
        }
    }
});
