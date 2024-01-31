using AssignmentService as service from '../../srv/assignment-service';

annotate service.Assignment with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'Class',
        Value: Class.title,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Subject',
        Value: Subject.title,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Topic',
        Value: Topic,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Day',
        Value: Day,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Beginning',
        Value: Beginning,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Ending',
        Value: Ending,
    },
]);

annotate service.Assignment with {
    Class @Common.ValueList: {
        $Type                       : 'Common.ValueListType',
        CollectionPath              : 'Class',
        Parameters                  : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: Class_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'title',
            },
        ],
        Label                       : 'Class',
        PresentationVariantQualifier: 'vh_Assignment_Class',
    }
};

annotate service.Assignment with {
    Subject @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Subject',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: Subject_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'title',
            },
        ],
        Label         : 'Subject',
    }
};

annotate service.Assignment with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Class_ID,
                Label: 'Class',
            },
            {
                $Type: 'UI.DataField',
                Value: Subject_ID,
                Label: 'Subject',
            },
            {
                $Type: 'UI.DataField',
                Label: 'Topic',
                Value: Topic,
            },
            {
                $Type: 'UI.DataField',
                Value: Day,
                Label: 'Day',
            },
            {
                $Type: 'UI.DataField',
                Label: 'Beginning',
                Value: Beginning,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Ending',
                Value: Ending,
            }
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);

annotate service.Assignment with @(UI.SelectionFields: []);

annotate service.Assignment with {
    Beginning @Common.Label: 'Beginning'
};

annotate service.Assignment with @(UI.SelectionPresentationVariant #table: {
    $Type              : 'UI.SelectionPresentationVariantType',
    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem', ],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : Beginning,
            Descending: false,
        }, ],
    },
    SelectionVariant   : {
        $Type        : 'UI.SelectionVariantType',
        SelectOptions: [],
    },
});

annotate service.Assignment with @(UI.SelectionPresentationVariant #table1: {
    $Type              : 'UI.SelectionPresentationVariantType',
    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem', ],
        SortOrder     : [
            {
                $Type     : 'Common.SortOrderType',
                Property  : Day,
                Descending: false,
            },
            {
                $Type     : 'Common.SortOrderType',
                Property  : Beginning,
                Descending: false,
            },
        ],
        GroupBy       : [Class.title, ],
    },
    SelectionVariant   : {
        $Type        : 'UI.SelectionVariantType',
        SelectOptions: [],
    },
});

annotate service.Class with {
    title @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Class',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: title,
                ValueListProperty: 'title',
            }, ],
            Label         : 'Class',
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.Subject with {
    title @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Subject',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: title,
                ValueListProperty: 'title',
            }, ],
            Label         : 'Subject',
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.Assignment with @(UI.Identification: [
    {
        $Type: 'UI.DataField',
        Value: Class_ID,
        Label: 'Class_ID',
    },
    {
        $Type: 'UI.DataField',
        Value: Subject.ID,
        Label: 'ID',
    },
]);

annotate service.Assignment with {
    Subject @Common.Text: {
        $value                : Subject.title,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate service.Assignment with {
    Class @Common.Text: {
        $value                : Class.title,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate service.Class with @(UI.PresentationVariant #vh_Assignment_Class: {
    $Type    : 'UI.PresentationVariantType',
    SortOrder: [{
        $Type     : 'Common.SortOrderType',
        Property  : title,
        Descending: false,
    }, ],
});

annotate service.Assignment with {
    Class @Common.ValueListWithFixedValues: true
};

annotate service.Class with {
    ID @Common.Text: {
        $value                : title,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate service.Assignment with {
    Subject @Common.ValueListWithFixedValues: true
};

annotate service.Subject with {
    ID @Common.Text: {
        $value                : title,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate service.Class with {
    title @Common.Label: 'Class'
};

annotate service.Assignment with {
    Class @Common.Label: 'Class'
};

annotate service.Class with {
    title @Common.FieldControl: #Mandatory
};

annotate service.Subject with {
    title @Common.FieldControl: #Mandatory
};

annotate service.Assignment with {
    Topic @Common.FieldControl: #Mandatory
};

annotate service.Assignment with {
    Day @Common.FieldControl: #Mandatory
};

annotate service.Assignment with {
    Beginning @Common.FieldControl: #Mandatory
};

annotate service.Assignment with {
    Ending @Common.FieldControl: #Mandatory
};
annotate service.Assignment with {
    Class @Common.FieldControl : #Mandatory
};
annotate service.Assignment with {
    Subject @Common.FieldControl : #Mandatory
};
