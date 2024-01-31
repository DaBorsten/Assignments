namespace sap.ui.school;

using {managed} from '@sap/cds/common';

entity Class : managed {
    key ID          : UUID @(Core.Computed: true);
        title       : String(5);
        assignments : Association to many Assignment
                          on assignments.Class = $self;
}

entity Subject : managed {
    key ID          : UUID @(Core.Computed: true);
        title       : String(20);
        assignments : Association to many Assignment
                          on assignments.Subject = $self;
}

entity Assignment : managed {
    key ID        : UUID   @(Core.Computed: true);
        Class     : Association to one Class;
        Subject   : Association to one Subject;
        Topic     : String(100);
        Day      : Date;
        Beginning : Time;
        Ending    : Time;
        dayOfWeek : String @readonly;
}
