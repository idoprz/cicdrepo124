using { testfs123Srv } from '../srv/service.cds';

annotate testfs123Srv.Teacher with @UI.HeaderInfo: { TypeName: 'Teacher', TypeNamePlural: 'Teachers' };
annotate testfs123Srv.Teacher with @UI.DataPoint #firstName: {
  Value: firstName,
  Title: 'First Name',
};
annotate testfs123Srv.Teacher with @UI.DataPoint #lastName: {
  Value: lastName,
  Title: 'Last Name',
};
annotate testfs123Srv.Teacher with @UI.DataPoint #subject: {
  Value: subject,
  Title: 'Subject',
};
annotate testfs123Srv.Teacher with {
  firstName @title: 'First Name';
  lastName @title: 'Last Name';
  subject @title: 'Subject'
};

annotate testfs123Srv.Teacher with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: subject }
];

annotate testfs123Srv.Teacher with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: subject }
  ]
};

annotate testfs123Srv.Teacher with {
  classes @Common.Label: 'Classes'
};

annotate testfs123Srv.Teacher with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#firstName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#lastName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#subject' }
];

annotate testfs123Srv.Teacher with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate testfs123Srv.Student with @UI.HeaderInfo: { TypeName: 'Student', TypeNamePlural: 'Students' };
annotate testfs123Srv.Student with {
  class @Common.ValueList: {
    CollectionPath: 'Class',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: class_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'className'
      },
    ],
  }
};
annotate testfs123Srv.Student with @UI.DataPoint #firstName: {
  Value: firstName,
  Title: 'First Name',
};
annotate testfs123Srv.Student with @UI.DataPoint #lastName: {
  Value: lastName,
  Title: 'Last Name',
};
annotate testfs123Srv.Student with {
  firstName @title: 'First Name';
  lastName @title: 'Last Name'
};

annotate testfs123Srv.Student with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Label: 'Class', Value: class_ID }
];

annotate testfs123Srv.Student with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Label: 'Class', Value: class_ID }
  ]
};

annotate testfs123Srv.Student with {
  classes @Common.Label: 'Classes';
  class @Common.Label: 'Class'
};

annotate testfs123Srv.Student with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#firstName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#lastName' }
];

annotate testfs123Srv.Student with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate testfs123Srv.Student with @UI.SelectionFields: [
  class_ID
];

annotate testfs123Srv.Class with @UI.HeaderInfo: { TypeName: 'Class', TypeNamePlural: 'Classes' };
annotate testfs123Srv.Class with {
  teacher @Common.ValueList: {
    CollectionPath: 'Teacher',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: teacher_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'firstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'lastName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'subject'
      },
    ],
  }
};
annotate testfs123Srv.Class with {
  student @Common.ValueList: {
    CollectionPath: 'Student',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: student_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'firstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'lastName'
      },
    ],
  }
};
annotate testfs123Srv.Class with @UI.DataPoint #className: {
  Value: className,
  Title: 'Class Name',
};
annotate testfs123Srv.Class with {
  className @title: 'Class Name'
};

annotate testfs123Srv.Class with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: className },
    { $Type: 'UI.DataField', Label: 'Teacher', Value: teacher_ID },
    { $Type: 'UI.DataField', Label: 'Student', Value: student_ID }
];

annotate testfs123Srv.Class with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: className },
    { $Type: 'UI.DataField', Label: 'Teacher', Value: teacher_ID },
    { $Type: 'UI.DataField', Label: 'Student', Value: student_ID }
  ]
};

annotate testfs123Srv.Class with {
  teacher @Common.Label: 'Teacher';
  students @Common.Label: 'Students';
  student @Common.Label: 'Student'
};

annotate testfs123Srv.Class with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#className' }
];

annotate testfs123Srv.Class with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate testfs123Srv.Class with @UI.SelectionFields: [
  teacher_ID,
  student_ID
];

