select * from Attendance
select * from Discipline
select * from DisciplineInSemester
select * from Lesson
select * from Registration
select * from semester
select * from student
select * from teacher
select * from teacherindiscipline
CREATE TABLE Attendance
(
	TimeCome  varchar(15)  NOT NULL ,
	TimeQuit  varchar(15)  NOT NULL ,
	LessonNumber  integer  NOT NULL ,
	DisciplineCode  varchar(10)  NOT NULL ,
	SemesterName  varchar(20)  NOT NULL ,
	IdStudent  varchar(10)  NOT NULL 
)
go
DROP TABLE Discipline

ALTER TABLE Attendance
	ADD CONSTRAINT  XPKAttendance PRIMARY KEY   NONCLUSTERED (LessonNumber  ASC,DisciplineCode  ASC,SemesterName  ASC,IdStudent  ASC)
go


CREATE TABLE Discipline
(
	DisciplineCode  varchar(10)  NOT NULL ,
	DisciplineName  varchar(30)  NOT NULL ,
	Credits  integer  NOT NULL 
)
go


ALTER TABLE Discipline
	ADD CONSTRAINT  XPKDiscipline PRIMARY KEY   NONCLUSTERED (DisciplineCode  ASC)
go


CREATE TABLE DisciplineInSemester
(
	DisciplineStart  varchar(20)  NOT NULL ,
	DisciplineEnd  varchar(20)  NOT NULL ,
	DisciplineCode  varchar(10)  NOT NULL ,
	SemesterName  varchar(20)  NOT NULL 
)
go


ALTER TABLE DisciplineInSemester
	ADD CONSTRAINT  XPKDisciplineInSemester PRIMARY KEY   NONCLUSTERED (DisciplineCode  ASC,SemesterName  ASC)
go


CREATE TABLE Lesson
(
	LessonName  varchar(30)  NOT NULL ,
	LessonNumber  integer  NOT NULL ,
	LessonDate  varchar(20)  NOT NULL ,
	StartTime  varchar(20)  NOT NULL ,
	EndTime  varchar(20)  NOT NULL ,
	DisciplineCode  varchar(10)  NOT NULL ,
	SemesterName  varchar(20)  NOT NULL 
)
go


ALTER TABLE Lesson
	ADD CONSTRAINT  XPKLesson PRIMARY KEY   NONCLUSTERED (LessonNumber  ASC,DisciplineCode  ASC,SemesterName  ASC)
go


CREATE TABLE Registration
(
	RegistrationDate  varchar(10)  NOT NULL ,
	IdStudent  varchar(10)  NOT NULL ,
	DisciplineCode  varchar(10)  NOT NULL ,
	SemesterName  varchar(20)  NOT NULL 
)
go


ALTER TABLE Registration
	ADD CONSTRAINT  XPKRegistration PRIMARY KEY   NONCLUSTERED (IdStudent  ASC,DisciplineCode  ASC,SemesterName  ASC)
go


CREATE TABLE Semester
(
	SemesterName  varchar(20)  NOT NULL 
	CONSTRAINT  Semester_SemesterName_SemesterName_246394031
		CHECK  ( SemesterName IN ('����� 2022-23', '����� 2022-23', '����� 2021-22', '����� 2021-22', '����� 2020-21', '����� 2020-21', '����� 2019-20', '����� 2019-20') ) ,
	SemesterStart  varchar(20)  NOT NULL ,
	SemesterEnd  varchar(20)  NOT NULL 
)
go


ALTER TABLE Semester
	ADD CONSTRAINT  XPKSemester PRIMARY KEY   NONCLUSTERED (SemesterName  ASC)
go


CREATE TABLE Student
(
	IdStudent  varchar(10)  NOT NULL ,
	StudentFIO  varchar(50)  NOT NULL ,
	Post  varchar(30)  NOT NULL ,
	MobNumber  varchar(20)  NOT NULL ,
	Course  integer  NOT NULL 
	CONSTRAINT  Student_Course_Student_Course_1239611636
		CHECK  ( Course BETWEEN 1 AND 5 ) 
)
go


ALTER TABLE Student
	ADD CONSTRAINT  XPKStudent PRIMARY KEY   NONCLUSTERED (IdStudent  ASC)
go


CREATE TABLE Teacher
(
	IdTeacher  varchar(10)  NOT NULL ,
	TeacherFIO  varchar(50)  NOT NULL ,
	Post  varchar(30)  NOT NULL ,
	MobNumber  varchar(20)  NOT NULL 
)
go


ALTER TABLE Teacher
	ADD CONSTRAINT  XPKTeacher PRIMARY KEY   NONCLUSTERED (IdTeacher  ASC)
go


CREATE TABLE TeacherInDiscipline
(
	DisciplineCode  varchar(10)  NOT NULL ,
	SemesterName  varchar(20)  NOT NULL ,
	IdTeacher  varchar(10)  NOT NULL 
)
go


ALTER TABLE TeacherInDiscipline
	ADD CONSTRAINT  XPKTeacherInDiscipline PRIMARY KEY   NONCLUSTERED (DisciplineCode  ASC,SemesterName  ASC,IdTeacher  ASC)
go



ALTER TABLE Attendance
	ADD CONSTRAINT  R_9 FOREIGN KEY (LessonNumber,DisciplineCode,SemesterName) REFERENCES Lesson(LessonNumber,DisciplineCode,SemesterName)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Attendance
	ADD CONSTRAINT  R_10 FOREIGN KEY (IdStudent) REFERENCES Student(IdStudent)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE DisciplineInSemester
	ADD CONSTRAINT  R_1 FOREIGN KEY (DisciplineCode) REFERENCES Discipline(DisciplineCode)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE DisciplineInSemester
	ADD CONSTRAINT  R_2 FOREIGN KEY (SemesterName) REFERENCES Semester(SemesterName)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Lesson
	ADD CONSTRAINT  R_8 FOREIGN KEY (DisciplineCode,SemesterName) REFERENCES DisciplineInSemester(DisciplineCode,SemesterName)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE Registration
	ADD CONSTRAINT  R_3 FOREIGN KEY (IdStudent) REFERENCES Student(IdStudent)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE Registration
	ADD CONSTRAINT  R_4 FOREIGN KEY (DisciplineCode,SemesterName) REFERENCES DisciplineInSemester(DisciplineCode,SemesterName)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE TeacherInDiscipline
	ADD CONSTRAINT  R_5 FOREIGN KEY (DisciplineCode,SemesterName) REFERENCES DisciplineInSemester(DisciplineCode,SemesterName)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE TeacherInDiscipline
	ADD CONSTRAINT  R_6 FOREIGN KEY (IdTeacher) REFERENCES Teacher(IdTeacher)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('����� 2022-23', '1 ��������', ' 30 �������')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('����� 2021-22', '2 ��������', ' 29 �������')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('����� 2020-21', '3 ��������', ' 28 �������')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('����� 2019-20', '4 ��������', ' 27 �������')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('����� 2022-23', '20 ������', ' 10 ���')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('����� 2021-22', '21 ������', ' 11 ���')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('����� 2020-21', '22 ������', ' 12 ���')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('����� 2019-20', '23 ������', ' 13 ���')
--select * from semester
delete from semester
where semestername like '�����%'

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1842', '���������� ������ ����������', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1832', '���������� ���������', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1912', '��������� �����������', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1852', '������� ����������', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1801', '�������� ������������', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1892', '������������ ��� ������', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1882', '������ ��� ����������', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1902', '����������������� ������', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1732', '�������� ����������', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1062', '������������ �������', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1182', '�������������� ������', 3)


insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1172', '������ ������������', 3)

--select * from Discipline

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('6AC874', '�������� ����� ����������', 'sultanov@mail.ru', '+77071549735', 4) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('6HT513', '�������� ������ ���������', 'dzenisov@gmail.com', '+77051244478', 3) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('5FC258', '����������� ������ ����������', 'aleksandrov@mail.ru', '+77023578945', 2) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('2LU852', '��������� �������� ���������', 'nikiforov@gmail.com', '+77014525256', 1) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('9QW564', '������� ������ ����������', 'aliubaev@gmail.com', '+77772325874', 4) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('5YU361', '������� �������� ����������', 'abenova@gmail.com', '+77772325874', 4)

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('9QW564', '������� ������ ����������', 'aliubaev@gmail.com', '+77772325874', 4) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('8EQ245', '�������� ���� ���������', 'yadskevich@mail.ru', '+77711469731', 2) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('3OI389', '���������� ����� ���������', 'boranbaeva@gmail.com', '+77015467244', 3) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('7NB998', '������������ ����� ����������', 'saukimbekova@gmail.com', '+77025468732', 4)

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('2RQ989', '�������� ������ ����������', 'shekimova@gmail.com', '+77054569872', 3) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('9FL354', '�������� ������� ����������', 'sokolova@mail.ru', '+77075432159', 4) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('6��741', '������� ������� ����������', 'ivanova@mail.ru', '+77023125497', 2) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('7CZ332', '������������ ��������� �������', 'perepelyatnik@gmail.com', '+77773214569', 4) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('3NB992', '����� ����� ����������', 'surin@gmail.com', '+77052236498', 3) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('7IO334', '������ ������ ����������', 'kopaev@mail.ru', '+77074485136', 1) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('2XC885', '����� ���������� �������������', 'zhukov@mail.ru', '+77012135252', 2) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('9PP568', '������� ������ ���������', 'meiram@gmail.com', '+77022584976', 1) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('5GA925', '������� ������ ���������', 'zhumashev@mail.ru', '+77011123658', 3) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('8KK412', '����������� ������� ����������', 'farafontova@gmail.com', '+77052194774', 1) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('1AA778', '������� ����� ��������', 'bolatov@gmail.com', '+77071711141', 1) 

delete from student
where studentfio='�������� ����'



insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('8456FAEW', '������� ������ ������������', 'muratov@satbayev.university', '+77778847417')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('9987UMCR', '��� ������� ����������', 'pak@satbayev.university', '+77023248516')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('8495JHLH', '���������� ������ ���������', 'sydyrbekov@satbayev.university', '+77015951473')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('2231YTRT', '������������� ���� ���������', 'aliya@satbayev.university', '+77089753641')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('8987OOPQ', '������� ����� ���������', 'zhienbay@satbayev.university', '+77085258523')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('6452CMZV', '�������� ������ ���������', 'zhumabayev@satbayev.university', '+77051593482')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('7679OQZH', '���������� ����� ���������', 'igrabimova@satbayev.university', '+77022197474')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('4451HGHA', '������ ������ ���������', 'ibraev@satbayev.university', '+77086497613')

select * from Discipline
select * from semester


insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1842', '����� 2022-23','1 ��������', ' 30 �������')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1832', '����� 2022-23', '20 ������', ' 10 ���')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1912', '����� 2021-22', '2 ��������', ' 29 �������')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1852', '����� 2021-22', '21 ������', ' 11 ���')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1801', '����� 2020-21', '3 ��������', ' 28 �������')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1892', '����� 2020-21', '22 ������', ' 12 ���')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1882', '����� 2019-20', '4 ��������', ' 27 �������')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1902', '����� 2019-20', '23 ������', ' 13 ���')

select  * from Discipline
SELECT * FROM SEMESTER
select * from DisciplineInSemester

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1842', '����� 2022-23','8456FAEW')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1832', '����� 2022-23', '9987UMCR')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1912', '����� 2021-22', '8495JHLH')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1852', '����� 2021-22', '2231YTRT')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1801', '����� 2020-21', '8987OOPQ')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1892', '����� 2020-21', '6452CMZV')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1882', '����� 2019-20', '7679OQZH')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1902', '����� 2019-20', '4451HGHA')



insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('25 �������', '6AC874', 'SEC 1842', '����� 2022-23')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('26 �������', '6HT513', 'SEC 1912', '����� 2021-22')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('27 �������', '5FC258', 'SEC 1801', '����� 2020-21')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('28 �������', '2LU852', 'SEC 1882', '����� 2019-20')




insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('5 ������', '6AC874', 'SEC 1842', '����� 2022-23')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('26 �������', '6HT513', 'SEC 1912', '����� 2021-22')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('27 �������', '5FC258', 'SEC 1801', '����� 2020-21')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('28 �������', '2LU852', 'SEC 1882', '����� 2019-20')


insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('�������� � ���� ������', 1, '23 ������', '11:05', '12:10', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('���������� ������ ��� ������', 2, '26 ������', '16:30', '17:20', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('���������� �� � ������� ERWin', 3, '30 ������', '11:05', '12:10', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('���������� ������ ��� ������', 4, '2 �������', '16:30', '17:20', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('����� � ���������� ������', 5, '5 �������', '11:05', '12:10', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('������ ������ � MSSQL Server', 6, '9 �������', '16:30', '17:20', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('�������� ������', 7, '12 �������', '11:05', '12:10', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('���� ��������������� �������', 8, '16 �������', '16:30', '17:20', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('���� ����������� ������', 9, '19 �������', '11:05', '12:10', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('�������, ���� ��������', 10, '16 �������', '16:30', '17:20', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('������������� � ����� ������', 11, '26 �������', '11:05', '12:10', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('�������� ���������', 12, '2 �����', '16:30', '17:20', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('��������', 13, '5 �����', '11:05', '12:10', 'SEC 1892', '����� 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('���������� ����� � MSSQL', 14, '9 �����', '16:30', '17:20', 'SEC 1892', '����� 2020-21')

SELECT * FROM disciplineinsemester
select * from lesson



insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:30', '12:00', 1, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:45', '17:10', 2, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:25', '12:00', 3, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:40', '17:10', 4, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:20', '12:00', 5, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:35', '17:10', 6, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:15', '12:00', 7, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:30', '17:10', 8, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:10', '12:00', 9, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:30', '17:15', 10, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:05', '12:00', 11, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:30', '17:20', 12, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:05', '12:10', 13, 'SEC 1892', '����� 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:30', '17:20', 14, 'SEC 1892', '����� 2020-21', '6AC874')


