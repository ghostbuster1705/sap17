using innovation.portfolio as db from '../db/schema';

@path: '/odata/v4/portfolio'
service PortfolioService {
  @odata.draft.enabled
  entity PortfolioItems as projection on db.PortfolioItems;

  entity Milestones as projection on db.Milestones;
  entity Risks as projection on db.Risks;
  entity Clients as projection on db.Clients;
  entity Consultants as projection on db.Consultants;
  entity ConsultantSkills as projection on db.ConsultantSkills;

  @readonly
  entity Skills as projection on db.Skills;

  @readonly
  entity Statuses as projection on db.Statuses;

  @readonly
  entity Priorities as projection on db.Priorities;
}
