# Innovation Portfolio Studio

Portfolio-ready SAP Fiori Elements application built with SAP Cloud Application Programming Model (CAP), OData V4 and draft-enabled Object Pages.

The demo scenario is an **Innovation Portfolio Studio** for SAP consulting teams. It helps showcase how a business team can track strategic initiatives, client context, delivery milestones, risks, expected value, AI readiness and sustainability impact from one Fiori workspace.

## Projektbeschreibung auf Deutsch

**Innovation Portfolio Studio** ist eine portfolio-taugliche SAP-Fiori-Elements-Anwendung auf Basis von SAP CAP, OData V4 und draft-fähigen Object Pages.

Die Anwendung zeigt, wie Beratungsteams strategische Innovationsinitiativen strukturiert verwalten können: Kundenkontext, verantwortliche Consultants, Status, Priorität, Budget, erwarteter Geschäftswert, Meilensteine, Risiken, KI-Reifegrad und Nachhaltigkeitswirkung werden in einer modernen Fiori-Oberfläche zusammengeführt.

Das Demo-Szenario eignet sich besonders für ein Bewerbungs- oder Projektportfolio, weil es typische SAP-Kompetenzen sichtbar macht:

- Modellierung von Geschäftsobjekten mit SAP CAP und CDS
- Bereitstellung eines OData-V4-Services
- Fiori Elements List Report und Object Page
- Draft Handling für professionelle Bearbeitungsprozesse
- UI-Annotationen für Filter, Facets, Fortschritt, Kritikalität und Kennzahlen
- realistische Demo-Daten für eine sofort präsentierbare Anwendung

Kurzbeschreibung für Lebenslauf oder LinkedIn:

> Entwicklung einer SAP-Fiori-Elements-Demoanwendung mit SAP CAP und OData V4 zur Verwaltung eines Innovationsportfolios. Die Lösung umfasst draft-fähige Geschäftsobjekte, semantische UI-Annotationen, Meilenstein- und Risikomanagement sowie realistische Demo-Daten für Portfolio-Präsentationen.

## What this project demonstrates

- SAP CAP domain modeling with compositions, associations and managed data
- OData V4 service generated from CDS
- Draft-enabled main business object for create/edit flows
- SAP Fiori Elements List Report and Object Page
- UI annotations for selection fields, line items, facets, progress indicators and criticality
- Demo CSV data loaded into SQLite for instant portfolio presentations

## Business scenario

The app manages innovation initiatives such as:

- **AI Guided Warranty Triage** for automotive service teams
- **Retail Replenishment Control Tower** for omnichannel planning
- **Patient Journey Experience Hub** for healthcare coordinators
- **Sustainability Ledger Assistant** for utility asset programs

Each initiative includes:

- client and lead consultant
- status and priority with semantic criticality
- budget, expected value and portfolio scores
- milestones with progress
- risks with mitigation actions
- links to GitHub/demo assets for portfolio storytelling

## Project structure

```text
app/portfolio/              Fiori Elements application
  annotations.cds           UI annotations consumed by Fiori Elements
  webapp/manifest.json      List Report/Object Page routing and OData model
db/
  schema.cds                CAP domain model
  data/*.csv                Demo data loaded by CAP
srv/
  service.cds               OData V4 PortfolioService
package.json                Scripts, dependencies and CAP runtime config
```

## Run in SAP Business Application Studio

Open a terminal in BAS and run:

```bash
npm install
npm run watch
```

Then open the application from the CAP welcome page:

```text
http://localhost:4004
```

Choose **Innovation Portfolio Studio** from the apps list.

## Run with persisted SQLite demo data

For a local SQLite database with the CSV demo data:

```bash
npx cds deploy --to sqlite
npm run watch
```

Useful service endpoints:

- OData service: `http://localhost:4004/odata/v4/portfolio/`
- Metadata: `http://localhost:4004/odata/v4/portfolio/$metadata`
- Portfolio items: `http://localhost:4004/odata/v4/portfolio/PortfolioItems`

## Public portfolio link

The BAS preview URL is not intended to be a permanent public portfolio link. For employers, use one of these options:

1. **SAP BTP Free Tier / Cloud Foundry** - best SAP-aligned option for a live CAP + Fiori demo.
2. **A public Node.js host** such as Render, Railway or Fly.io - practical option for a simple public demo of the CAP app.
3. **GitHub repository + screenshots/video** - most stable fallback if the live runtime is not required.

For a professional portfolio, combine a live demo link with the GitHub repository and a short screen recording.

## Deploy to SAP BTP Cloud Foundry

This repository contains a simple `manifest.yml` for a portfolio demo deployment with `cf push`.

> Note: this demo uses SQLite and recreates demo data on app start. That is fine for a portfolio showcase. For production, replace SQLite with SAP HANA Cloud.

### 1. Login to Cloud Foundry

In SAP Business Application Studio, open a terminal and login to the Cloud Foundry endpoint of your SAP BTP subaccount:

```bash
cf login -a https://api.cf.us10-001.hana.ondemand.com
```

If your subaccount is in Europe, the endpoint is often:

```bash
cf login -a https://api.cf.eu10.hana.ondemand.com
```

After login, choose your org and space when prompted. You can verify the target with:

```bash
cf target
```

### 2. Deploy the app

From the project root:

```bash
npm install
cf push
```

Cloud Foundry reads `manifest.yml`, installs dependencies and runs:

```bash
npm run cf:start
```

That command deploys the CSV demo data to SQLite and starts the CAP server.

### 3. Get the public URL

After deployment:

```bash
cf apps
cf app innovation-portfolio-studio-sap17
```

The app route will look similar to:

```text
https://innovation-portfolio-studio-sap17.cfapps.us10-001.hana.ondemand.com
```

or, depending on your region:

```text
https://innovation-portfolio-studio-sap17.cfapps.eu10.hana.ondemand.com
```

Open that URL in a browser and choose **Innovation Portfolio Studio** from the CAP welcome page.

### Troubleshooting a crashed app

If `cf push` ends with `Start unsuccessful`, check the app logs:

```bash
cf logs innovation-portfolio-studio-sap17 --recent
```

This project uses `scripts/cf-start.js` as the Cloud Foundry start command. The script logs:

- the SQLite file used by the app
- the CAP demo data deployment step
- the CAP server port

If you changed the app name in `manifest.yml`, use that name in the `cf logs` command.

### 4. Keep the link stable

The link stays stable as long as:

- the SAP BTP subaccount/space remains active
- the Cloud Foundry app is not deleted
- the route is not deleted or changed
- the app name in `manifest.yml` stays the same

If the route name is already taken, change only the `name` in `manifest.yml`, for example:

```yaml
applications:
  - name: innovation-portfolio-studio-yourname
```

Then deploy again with:

```bash
cf push
```

## Development commands

```bash
npm run compile   # compile CDS service to EDMX metadata
npm run build     # run CAP build
npm test          # currently validates CDS compilation
```

## Next portfolio enhancements

Good follow-up additions for a stronger portfolio story:

- custom bound actions such as "Promote to Executive Focus"
- analytical chart page for value vs. risk
- SAP Build Work Zone launchpad configuration
- mocked Integration Suite adapter for external initiative data
- authentication roles for portfolio manager and consultant personas