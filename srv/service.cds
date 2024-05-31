using { testfs123 as my } from '../db/schema.cds';

@path: '/service/testfs123'
@requires: 'authenticated-user'
service testfs123Srv {
  @odata.draft.enabled
  entity Teacher as projection on my.Teacher;
  @odata.draft.enabled
  entity Student as projection on my.Student;
  @odata.draft.enabled
  entity Class as projection on my.Class;
}