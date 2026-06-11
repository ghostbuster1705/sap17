namespace innovation.portfolio;

using {
  cuid,
  managed,
  Currency
} from '@sap/cds/common';

entity Statuses {
  key code    : String(20);
      name    : localized String(60);
      order   : Integer;
      criticality : Integer;
}

entity Priorities {
  key code    : String(20);
      name    : localized String(60);
      order   : Integer;
      criticality : Integer;
}

entity Clients : cuid, managed {
  name        : String(120);
  industry    : String(80);
  region      : String(60);
  logoUrl     : String(255);
  initiatives : Association to many PortfolioItems on initiatives.client = $self;
}

entity Consultants : cuid, managed {
  firstName   : String(60);
  lastName    : String(60);
  role        : String(80);
  location    : String(80);
  email       : String(120);
  availability : Integer @assert.range: [0, 100];
  skills      : Composition of many ConsultantSkills on skills.consultant = $self;
}

entity Skills {
  key code    : String(30);
      name    : localized String(80);
      category : String(60);
}

entity ConsultantSkills {
  key consultant : Association to Consultants;
  key skill      : Association to Skills;
      proficiency : Integer @assert.range: [1, 5];
}

entity PortfolioItems : cuid, managed {
  title                : String(140);
  tagline              : String(180);
  description          : LargeString;
  client               : Association to Clients;
  lead                 : Association to Consultants;
  status               : Association to Statuses;
  priority             : Association to Priorities;
  startDate            : Date;
  targetDate           : Date;
  budget               : Decimal(15, 2) @Measures.ISOCurrency: currency;
  expectedValue        : Decimal(15, 2) @Measures.ISOCurrency: currency;
  currency             : Currency;
  progress             : Integer @assert.range: [0, 100];
  impactScore          : Integer @assert.range: [0, 100];
  aiReadinessScore     : Integer @assert.range: [0, 100];
  sustainabilityScore  : Integer @assert.range: [0, 100];
  businessGoal         : String(500);
  nextStep             : String(500);
  githubUrl            : String(255);
  demoUrl              : String(255);
  milestones           : Composition of many Milestones on milestones.portfolioItem = $self;
  risks                : Composition of many Risks on risks.portfolioItem = $self;
}

entity Milestones : cuid, managed {
  portfolioItem : Association to PortfolioItems;
  title         : String(140);
  dueDate       : Date;
  owner         : Association to Consultants;
  status        : Association to Statuses;
  progress      : Integer @assert.range: [0, 100];
  deliverable   : String(255);
}

entity Risks : cuid, managed {
  portfolioItem : Association to PortfolioItems;
  title         : String(140);
  description   : String(500);
  owner         : Association to Consultants;
  probability   : Integer @assert.range: [1, 5];
  impact        : Integer @assert.range: [1, 5];
  mitigation    : String(500);
  status        : Association to Statuses;
}
