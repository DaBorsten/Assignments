using {sap.ui.school as my} from '../db/schema';

@path: 'service/Assignment'
service AssignmentService {

  entity Class      as projection on my.Class;
  entity Subject    as projection on my.Subject;
  entity Assignment as projection on my.Assignment;
  annotate Assignment with @odata.draft.enabled;

}
