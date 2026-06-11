sap.ui.require.preload({
  "innovation/portfolio/app/Component.js": function () {
    sap.ui.define(["sap/fe/core/AppComponent"], function (AppComponent) {
      "use strict";

      return AppComponent.extend("innovation.portfolio.app.Component", {
        metadata: {
          manifest: "json"
        }
      });
    });
  }
});
