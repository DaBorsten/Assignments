using {sap.ui.school as my} from '../db/schema';

@path: 'service/Assignment'
service AssignmentService {

  entity Class      as projection on my.Class;
  annotate Class with @odata.draft.enabled;
  entity Subject    as projection on my.Subject;
  annotate Subject with @odata.draft.enabled;
  entity Assignment as projection on my.Assignment;
  annotate Assignment with @odata.draft.enabled;
}
