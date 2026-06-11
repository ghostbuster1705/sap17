# Innovation Portfolio Studio

Portfolio-ready SAP Fiori Elements application built with SAP Cloud Application Programming Model (CAP), OData V4 and draft-enabled Object Pages.

The demo scenario is an **Innovation Portfolio Studio** for SAP consulting teams. It helps showcase how a business team can track strategic initiatives, client context, delivery milestones, risks, expected value, AI readiness and sustainability impact from one Fiori workspace.

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