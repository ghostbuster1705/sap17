const cds = require("@sap/cds");

const fioriAppPath = "/portfolio/webapp/index.html";

cds.on("bootstrap", (app) => {
  app.get(["/", "/debug", "/app", "/portfolio"], (_req, res) => {
    res.redirect(fioriAppPath);
  });
});

module.exports = cds.server;
