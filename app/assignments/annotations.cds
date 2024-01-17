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
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Class',
        Parameters    : [
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
    }
};

annotate service.Assignment with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Class.title,
                Label: 'Class',
            },
            {
                $Type: 'UI.DataField',
                Value: Subject.title,
                Label: 'Subject',
            },
            {
                $Type: 'UI.DataField',
                Label: 'Topic',
                Value: Topic,
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
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }, ]
);
annotate service.Assignment with @(
    UI.SelectionFields : []
);
annotate service.Assignment with {
    Beginning @Common.Label : 'Beginning'
};
annotate service.Assignment with @(
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
            SortOrder : [
                {
                    $Type : 'Common.SortOrderType',
                    Property : Beginning,
                    Descending : false,
                },
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    }
);
annotate service.Assignment with @(
    UI.SelectionPresentationVariant #table1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
            SortOrder : [
                {
                    $Type : 'Common.SortOrderType',
                    Property : Beginning,
                    Descending : false,
                },
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    }
);