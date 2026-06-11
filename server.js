const cds = require("@sap/cds");

const fioriAppPath = "/portfolio/webapp/index.html";

cds.on("bootstrap", (app) => {
  app.get(["/", "/debug", "/app", "/portfolio"], (_req, res) => {
    res.redirect(fioriAppPath);
  });

  app.get("/sap/bc/lrep/flex/data/:appId", (_req, res) => {
    res.json({
      changes: [],
      contexts: [],
      settings: {
        isKeyUser: false,
        isAtoAvailable: false,
        isProductiveSystem: true
      }
    });
  });

  app.get("/sap/bc/lrep/flex/settings", (_req, res) => {
    res.json({
      isKeyUser: false,
      isAtoAvailable: false,
      isProductiveSystem: true
    });
  });

  app.use("/sap/bc/ui2", (req, res, next) => {
    if (req.url.startsWith("/flp;sap-metrics-only")) {
      res.status(204).end();
      return;
    }

    next();
  });
});

module.exports = cds.server;
