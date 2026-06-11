using PortfolioService as service from '../../srv/service';

annotate service.PortfolioItems with @(
  Common.SemanticKey : [title],
  UI.HeaderInfo : {
    TypeName       : 'Initiative',
    TypeNamePlural : 'Initiatives',
    Title          : {
      $Type : 'UI.DataField',
      Value : title
    },
    Description    : {
      $Type : 'UI.DataField',
      Value : tagline
    }
  },
  UI.SelectionFields : [
    status_code,
    priority_code,
    client_ID,
    lead_ID
  ],
  UI.LineItem : [
    {
      $Type : 'UI.DataField',
      Label : 'Initiative',
      Value : title
    },
    {
      $Type : 'UI.DataField',
      Label : 'Client',
      Value : client.name
    },
    {
      $Type       : 'UI.DataField',
      Label       : 'Status',
      Value       : status.name,
      Criticality : status.criticality
    },
    {
      $Type       : 'UI.DataField',
      Label       : 'Priority',
      Value       : priority.name,
      Criticality : priority.criticality
    },
    {
      $Type  : 'UI.DataFieldForAnnotation',
      Label  : 'Progress',
      Target : '@UI.DataPoint#Progress'
    },
    {
      $Type  : 'UI.DataFieldForAnnotation',
      Label  : 'Impact',
      Target : '@UI.DataPoint#ImpactScore'
    },
    {
      $Type : 'UI.DataField',
      Label : 'Target Date',
      Value : targetDate
    },
    {
      $Type : 'UI.DataField',
      Label : 'Expected Value',
      Value : expectedValue
    }
  ],
  UI.DataPoint #Progress : {
    Title         : 'Progress',
    Value         : progress,
    TargetValue   : 100,
    Visualization : #Progress
  },
  UI.DataPoint #ImpactScore : {
    Title                  : 'Impact Score',
    Value                  : impactScore,
    CriticalityCalculation : {
      ImprovementDirection  : #Maximize,
      DeviationRangeLowValue : 45,
      ToleranceRangeLowValue : 70
    }
  },
  UI.DataPoint #AIReadiness : {
    Title                  : 'AI Readiness',
    Value                  : aiReadinessScore,
    CriticalityCalculation : {
      ImprovementDirection  : #Maximize,
      DeviationRangeLowValue : 45,
      ToleranceRangeLowValue : 70
    }
  },
  UI.DataPoint #Sustainability : {
    Title                  : 'Sustainability',
    Value                  : sustainabilityScore,
    CriticalityCalculation : {
      ImprovementDirection  : #Maximize,
      DeviationRangeLowValue : 45,
      ToleranceRangeLowValue : 70
    }
  },
  UI.FieldGroup #Overview : {
    Data : [
      {
        $Type : 'UI.DataField',
        Label : 'Client',
        Value : client.name
      },
      {
        $Type : 'UI.DataField',
        Label : 'Industry',
        Value : client.industry
      },
      {
        $Type : 'UI.DataField',
        Label : 'Lead Consultant',
        Value : lead.lastName
      },
      {
        $Type : 'UI.DataField',
        Label : 'Business Goal',
        Value : businessGoal
      },
      {
        $Type : 'UI.DataField',
        Label : 'Next Step',
        Value : nextStep
      }
    ]
  },
  UI.FieldGroup #Scores : {
    Data : [
      {
        $Type  : 'UI.DataFieldForAnnotation',
        Label  : 'Progress',
        Target : '@UI.DataPoint#Progress'
      },
      {
        $Type  : 'UI.DataFieldForAnnotation',
        Label  : 'Impact',
        Target : '@UI.DataPoint#ImpactScore'
      },
      {
        $Type  : 'UI.DataFieldForAnnotation',
        Label  : 'AI Readiness',
        Target : '@UI.DataPoint#AIReadiness'
      },
      {
        $Type  : 'UI.DataFieldForAnnotation',
        Label  : 'Sustainability',
        Target : '@UI.DataPoint#Sustainability'
      },
      {
        $Type : 'UI.DataField',
        Label : 'Budget',
        Value : budget
      },
      {
        $Type : 'UI.DataField',
        Label : 'Expected Value',
        Value : expectedValue
      }
    ]
  },
  UI.FieldGroup #Links : {
    Data : [
      {
        $Type : 'UI.DataFieldWithUrl',
        Label : 'GitHub',
        Value : githubUrl,
        Url   : githubUrl
      },
      {
        $Type : 'UI.DataFieldWithUrl',
        Label : 'Demo',
        Value : demoUrl,
        Url   : demoUrl
      }
    ]
  },
  UI.Facets : [
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'OverviewFacet',
      Label  : 'Overview',
      Target : '@UI.FieldGroup#Overview'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'ScoresFacet',
      Label  : 'Portfolio Scores',
      Target : '@UI.FieldGroup#Scores'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'LinksFacet',
      Label  : 'Portfolio Links',
      Target : '@UI.FieldGroup#Links'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'MilestonesFacet',
      Label  : 'Milestones',
      Target : 'milestones/@UI.LineItem'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'RisksFacet',
      Label  : 'Risks',
      Target : 'risks/@UI.LineItem'
    }
  ]
);

annotate service.PortfolioItems with {
  status @Common.Text : status.name;
  priority @Common.Text : priority.name;
  client @Common.Text : client.name;
  lead @Common.Text : lead.lastName;
};

annotate service.Milestones with @(
  UI.LineItem : [
    {
      $Type : 'UI.DataField',
      Label : 'Milestone',
      Value : title
    },
    {
      $Type       : 'UI.DataField',
      Label       : 'Status',
      Value       : status.name,
      Criticality : status.criticality
    },
    {
      $Type  : 'UI.DataFieldForAnnotation',
      Label  : 'Progress',
      Target : '@UI.DataPoint#Progress'
    },
    {
      $Type : 'UI.DataField',
      Label : 'Due Date',
      Value : dueDate
    },
    {
      $Type : 'UI.DataField',
      Label : 'Deliverable',
      Value : deliverable
    }
  ],
  UI.DataPoint #Progress : {
    Title         : 'Milestone Progress',
    Value         : progress,
    TargetValue   : 100,
    Visualization : #Progress
  }
);

annotate service.Milestones with {
  status @Common.Text : status.name;
  owner @Common.Text : owner.lastName;
};

annotate service.Risks with @(
  UI.LineItem : [
    {
      $Type : 'UI.DataField',
      Label : 'Risk',
      Value : title
    },
    {
      $Type : 'UI.DataField',
      Label : 'Probability',
      Value : probability
    },
    {
      $Type : 'UI.DataField',
      Label : 'Impact',
      Value : impact
    },
    {
      $Type       : 'UI.DataField',
      Label       : 'Status',
      Value       : status.name,
      Criticality : status.criticality
    },
    {
      $Type : 'UI.DataField',
      Label : 'Mitigation',
      Value : mitigation
    }
  ]
);

annotate service.Risks with {
  status @Common.Text : status.name;
  owner @Common.Text : owner.lastName;
};

annotate service.Clients with @(
  UI.HeaderInfo : {
    TypeName       : 'Client',
    TypeNamePlural : 'Clients',
    Title          : {
      $Type : 'UI.DataField',
      Value : name
    },
    Description    : {
      $Type : 'UI.DataField',
      Value : industry
    }
  },
  UI.LineItem : [
    {
      $Type : 'UI.DataField',
      Label : 'Client',
      Value : name
    },
    {
      $Type : 'UI.DataField',
      Label : 'Industry',
      Value : industry
    },
    {
      $Type : 'UI.DataField',
      Label : 'Region',
      Value : region
    }
  ]
);

annotate service.Consultants with @(
  UI.HeaderInfo : {
    TypeName       : 'Consultant',
    TypeNamePlural : 'Consultants',
    Title          : {
      $Type : 'UI.DataField',
      Value : lastName
    },
    Description    : {
      $Type : 'UI.DataField',
      Value : role
    }
  },
  UI.LineItem : [
    {
      $Type : 'UI.DataField',
      Label : 'First Name',
      Value : firstName
    },
    {
      $Type : 'UI.DataField',
      Label : 'Last Name',
      Value : lastName
    },
    {
      $Type : 'UI.DataField',
      Label : 'Role',
      Value : role
    },
    {
      $Type  : 'UI.DataFieldForAnnotation',
      Label  : 'Availability',
      Target : '@UI.DataPoint#Availability'
    }
  ],
  UI.DataPoint #Availability : {
    Title         : 'Availability',
    Value         : availability,
    TargetValue   : 100,
    Visualization : #Progress
  }
);
