namespace testfs123;

entity Teacher {
  key ID: UUID;
  firstName: String(50);
  lastName: String(50);
  subject: String(50);
  classes: Association to many Class on classes.teacher = $self;
}

entity Student {
  key ID: UUID;
  firstName: String(50);
  lastName: String(50);
  classes: Association to many Class on classes.student = $self;
  class: Association to Class;
}

entity Class {
  key ID: UUID;
  className: String(50);
  teacher: Association to Teacher;
  students: Association to many Student on students.class = $self;
  student: Association to Student;
}

