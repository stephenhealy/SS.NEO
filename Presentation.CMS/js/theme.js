var mvpready_admin = function () {

  "use strict"

  var initNavbarNotifications = function () {
    var notifications = $('.navbar-notification')

    notifications.find ('> .dropdown-toggle').click (function (e) {
      if (mvpready_Models.isLayoutCollapsed ()) {
        window.location = $(this).prop ('href')
      }
    })

    notifications.find ('.notification-list').slimScroll ({ height: 225, railVisible: true })
  }

  return {
    init: function () {
      // Layouts
      mvpready_Models.navEnhancedInit ()
      mvpready_Models.navHoverInit ({ delay: { show: 250, hide: 350 } })      

      initNavbarNotifications ()
      mvpready_Models.initLayoutToggles ()
      mvpready_Models.initBackToTop ()  

      // Components
      mvpready_helpers.initAccordions ()		
      mvpready_helpers.initFormValidation ()
      mvpready_helpers.initTooltips ()	
      mvpready_helpers.initLightbox ()
      mvpready_helpers.initSelect ()
      mvpready_helpers.initIcheck ()
      mvpready_helpers.initDataTableHelper ()
      mvpready_helpers.initiTimePicker ()
      mvpready_helpers.initDatePicker ()
    }
  }

}()

$(function () {
  mvpready_admin.init ()
})