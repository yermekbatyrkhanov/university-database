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
		CHECK  ( SemesterName IN ('Осень 2022-23', 'Весна 2022-23', 'Осень 2021-22', 'Весна 2021-22', 'Осень 2020-21', 'Весна 2020-21', 'Осень 2019-20', 'Весна 2019-20') ) ,
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
values('Осень 2022-23', '1 сентября', ' 30 декабря')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('Осень 2021-22', '2 сентября', ' 29 декабря')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('Осень 2020-21', '3 сентября', ' 28 декабря')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('Осень 2019-20', '4 сентября', ' 27 декабря')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('Весна 2022-23', '20 января', ' 10 мая')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('Весна 2021-22', '21 января', ' 11 мая')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('Весна 2020-21', '22 января', ' 12 мая')

insert into semester(SemesterName, SemesterStart, SemesterEnd)
values('Весна 2019-20', '23 января', ' 13 мая')
--select * from semester
delete from semester
where semestername like 'Весна%'

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1842', 'Технологии Защиты Информации', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1832', 'Социальная Инженерия', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1912', 'Выявление Уязвимостей', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1852', 'Сетевые Технологии', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1801', 'Цифровая Схемотехника', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1892', 'Безопасность Баз Данных', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1882', 'Защита Веб Приложении', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1902', 'Криптографическая Защита', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1732', 'Цифровые Устройства', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1062', 'Операционные системы', 3)

insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1182', 'Информационные основы', 3)


insert into Discipline(DisciplineCode, DisciplineName, Credits)
values('SEC 1172', 'Основы Криптографии', 3)

--select * from Discipline

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('6AC874', 'Султанов Ильяс Фархатович', 'sultanov@mail.ru', '+77071549735', 4) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('6HT513', 'Дженисов Даурен Маратович', 'dzenisov@gmail.com', '+77051244478', 3) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('5FC258', 'Александров Сергей Васильевич', 'aleksandrov@mail.ru', '+77023578945', 2) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('2LU852', 'Никифоров Анатолий Сергеевич', 'nikiforov@gmail.com', '+77014525256', 1) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('9QW564', 'Алюбаев Мейрам Олжабаевич', 'aliubaev@gmail.com', '+77772325874', 4) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('5YU361', 'Абенова Гульмира Шалхаровна', 'abenova@gmail.com', '+77772325874', 4)

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('9QW564', 'Алюбаев Мейрам Олжабаевич', 'aliubaev@gmail.com', '+77772325874', 4) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('8EQ245', 'Ядскевич Юрий Сергеевич', 'yadskevich@mail.ru', '+77711469731', 2) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('3OI389', 'Боранбаева Айман Женисовна', 'boranbaeva@gmail.com', '+77015467244', 3) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('7NB998', 'Саукимбекова Жанна Нурсатовна', 'saukimbekova@gmail.com', '+77025468732', 4)

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('2RQ989', 'Шекимова Нуршат Алибековна', 'shekimova@gmail.com', '+77054569872', 3) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('9FL354', 'Соколова Наталья Алексеевна', 'sokolova@mail.ru', '+77075432159', 4) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('6НК741', 'Иванова Наталья Поправкина', 'ivanova@mail.ru', '+77023125497', 2) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('7CZ332', 'Перепелятник Станислав Юрьевич', 'perepelyatnik@gmail.com', '+77773214569', 4) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('3NB992', 'Сурин Павел Николаевич', 'surin@gmail.com', '+77052236498', 3) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('7IO334', 'Копаев Шухрат Сержанович', 'kopaev@mail.ru', '+77074485136', 1) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('2XC885', 'Жуков Константин Александрович', 'zhukov@mail.ru', '+77012135252', 2) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('9PP568', 'Смаилов Мейрам Сакенович', 'meiram@gmail.com', '+77022584976', 1) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('5GA925', 'Жумашев Степан Канатович', 'zhumashev@mail.ru', '+77011123658', 3) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('8KK412', 'Фарафонтова Наталья Николаевна', 'farafontova@gmail.com', '+77052194774', 1) 

insert into Student(IdStudent, StudentFIO, Post, MobNumber, Course)
values('1AA778', 'Болатов Адиль Саятович', 'bolatov@gmail.com', '+77071711141', 1) 

delete from student
where studentfio='Ядскевич Юрий'



insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('8456FAEW', 'Муратов Фархат Адильбекович', 'muratov@satbayev.university', '+77778847417')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('9987UMCR', 'Пак Валерия Алексеевна', 'pak@satbayev.university', '+77023248516')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('8495JHLH', 'Сыдырбеков Данияр Муратович', 'sydyrbekov@satbayev.university', '+77015951473')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('2231YTRT', 'Абильмажинова Алия Женисовна', 'aliya@satbayev.university', '+77089753641')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('8987OOPQ', 'Жиенбай Ержан Ерланович', 'zhienbay@satbayev.university', '+77085258523')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('6452CMZV', 'Жумабаев Даурен Кенесович', 'zhumabayev@satbayev.university', '+77051593482')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('7679OQZH', 'Ибрагимова Самал Канатовна', 'igrabimova@satbayev.university', '+77022197474')

insert into teacher(IdTeacher,TeacherFIO,Post,MobNumber)
values('4451HGHA', 'Ибраев Нурлан Серикович', 'ibraev@satbayev.university', '+77086497613')

select * from Discipline
select * from semester


insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1842', 'Осень 2022-23','1 сентября', ' 30 декабря')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1832', 'Весна 2022-23', '20 января', ' 10 мая')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1912', 'Осень 2021-22', '2 сентября', ' 29 декабря')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1852', 'Весна 2021-22', '21 января', ' 11 мая')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1801', 'Осень 2020-21', '3 сентября', ' 28 декабря')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1892', 'Весна 2020-21', '22 января', ' 12 мая')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1882', 'Осень 2019-20', '4 сентября', ' 27 декабря')

insert into DisciplineInSemester(DisciplineCode,SemesterName, DisciplineStart, DisciplineEnd)
values('SEC 1902', 'Весна 2019-20', '23 января', ' 13 мая')

select  * from Discipline
SELECT * FROM SEMESTER
select * from DisciplineInSemester

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1842', 'Осень 2022-23','8456FAEW')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1832', 'Весна 2022-23', '9987UMCR')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1912', 'Осень 2021-22', '8495JHLH')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1852', 'Весна 2021-22', '2231YTRT')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1801', 'Осень 2020-21', '8987OOPQ')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1892', 'Весна 2020-21', '6452CMZV')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1882', 'Осень 2019-20', '7679OQZH')

insert into TeacherInDiscipline(DisciplineCode,SemesterName, IdTeacher)
values('SEC 1902', 'Весна 2019-20', '4451HGHA')



insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('25 августа', '6AC874', 'SEC 1842', 'Осень 2022-23')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('26 августа', '6HT513', 'SEC 1912', 'Осень 2021-22')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('27 августа', '5FC258', 'SEC 1801', 'Осень 2020-21')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('28 августа', '2LU852', 'SEC 1882', 'Осень 2019-20')




insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('5 января', '6AC874', 'SEC 1842', 'Осень 2022-23')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('26 августа', '6HT513', 'SEC 1912', 'Осень 2021-22')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('27 августа', '5FC258', 'SEC 1801', 'Осень 2020-21')

insert into Registration(RegistrationDate, IdStudent, DisciplineCode, SemesterName)
values('28 августа', '2LU852', 'SEC 1882', 'Осень 2019-20')


insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Введение в Базы Данных', 1, '23 января', '11:05', '12:10', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Логическая модель Баз Данных', 2, '26 января', '16:30', '17:20', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Построение ЛМ с помощью ERWin', 3, '30 января', '11:05', '12:10', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Физическая Модель Баз Данных', 4, '2 февраля', '16:30', '17:20', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Файлы в Физической Модели', 5, '5 февраля', '11:05', '12:10', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Начало Работы с MSSQL Server', 6, '9 февраля', '16:30', '17:20', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Создание Таблиц', 7, '12 февраля', '11:05', '12:10', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Язык Манипулирования Данными', 8, '16 февраля', '16:30', '17:20', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Язык Определения Данных', 9, '19 февраля', '11:05', '12:10', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Запросы, Виды Запросов', 10, '16 февраля', '16:30', '17:20', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Представления В Базах Данных', 11, '26 февраля', '11:05', '12:10', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Хранимые Процедуры', 12, '2 марта', '16:30', '17:20', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Триггеры', 13, '5 марта', '11:05', '12:10', 'SEC 1892', 'Весна 2020-21')

insert into lesson(LessonName, LessonNumber, LessonDate, StartTime, EndTime, DisciplineCode, SemesterName)
values('Реализация схемы в MSSQL', 14, '9 марта', '16:30', '17:20', 'SEC 1892', 'Весна 2020-21')

SELECT * FROM disciplineinsemester
select * from lesson



insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:30', '12:00', 1, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:45', '17:10', 2, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:25', '12:00', 3, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:40', '17:10', 4, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:20', '12:00', 5, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:35', '17:10', 6, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:15', '12:00', 7, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:30', '17:10', 8, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:10', '12:00', 9, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:30', '17:15', 10, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:05', '12:00', 11, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:30', '17:20', 12, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('11:05', '12:10', 13, 'SEC 1892', 'Весна 2020-21', '6AC874')

insert into Attendance(TimeCome, TimeQuit, LessonNumber, DisciplineCode, SemesterName,IdStudent)
values('16:30', '17:20', 14, 'SEC 1892', 'Весна 2020-21', '6AC874')


