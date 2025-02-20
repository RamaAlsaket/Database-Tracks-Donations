create database donationDataBaseTracking;

create database DonayionDataBaseFinal;

create table Donor (
 DonorID int Primary key,
 FirstName Varchar(20) not null,
 LastName Varchar(50) not null,
 EmailDonor Varchar(50) unique not null,
 BirthDate date not null default '1988-01-01'  check (BirthDate >= '1988-01-01' )
 );
 
create table PhoneDonor (
 DonID int not null,
 DonorPhoneNumber int not null primary key,
 foreign key (DonID) references Donor(DonorID) on update cascade on delete cascade
 );
 
create table Event (
 NumberEvent int not null primary key,
 EventDate date not null unique default '2020-11-01',
 EvenType varchar(35) not null default 'Tuition fees',
 check (EvenType in ('Tuition fees', 'Educational materials', 'Educational books')),
 EventName varchar(35) not null,
 City varchar(35) not null,
 Country varchar(35) not null,
 Street varchar(40) not null
 );
 
create table SupportPaticipation (
 DonID int not null,
 EventNumber int not null,
 foreign key (DonID) references Donor(DonorID) on update no action on delete no action,
 foreign key (EventNumber) references Event(NumberEvent) on update no action on delete no action
 );
 
create table Scholarship (
 ScholarshipNumber int primary key,
 ScholarshipType varchar(40) not null default 'Tuition fees', 
 Check (ScholarshipType in ('Tuition fees', 'Educational materials', 'Educational books')),
 ScholarAmount decimal not null default 5.00,
 Check (ScholarAmount > 0.00),
 ScholarStartDate date not null default '2017-01-01',
 check (ScholarStartDate >= '2016-01-01'),
 ScholarEndDate date not null default '2024-01-01',
 check (ScholarEndDate >= ScholarStartDate)
 );

create table Student (
 StudentID int not null primary key,
 FirstName Varchar(20) not null,
 LastName Varchar(50) not null,
 EmailStudent Varchar(50) unique not null,
 DateOfEnroll date not null default '2017-01-01',
 check (DateOfEnroll  > '2016-01-01'),
 ScholarID int not null unique,
 foreign key (ScholarID) references Scholarship(ScholarshipNumber) on update cascade on delete no action
 );
 
create table StudentPhone (
 StudID int not null,
 StudentMobile varchar(50) not null primary key,
 foreign key (StudID) references Student(StudentID) on update cascade on delete cascade
 );
 
create table Donation (
 DonationNumber int not null primary key,
 TypeDonation varchar(40) not null default 'Tuition fees', 
 Check (TypeDonation in ('Tuition fees', 'Educational materials', 'Educational books')),
 DateOfDonation date not null default '2024-01-01',
 DonationStatus varchar(30) not null default 'One time',
 Check (DonationStatus in ('One time', 'Always')),
 DonationAmount decimal not null default 5.00,
 Check (DonationAmount > 0.00),
 DonID int not null, 
 EventNum int not null,
 ScholorshipID int not null,
 foreign key (DonID) references Donor(DonorID) on update cascade on delete no action,
 foreign key (EventNum) references Event(NumberEvent) on update cascade on delete no action,
 foreign key (ScholorshipID) references Scholarship(ScholarshipNumber) on update cascade on delete no action
 );
 
insert into Donor (DonorID, FirstName, LastName, EmailDonor, BirthDate) values (5500, 'Sara', 'Shadi', 'saraalshadi@gmail.com', '2001-05-23');
insert into Donor (DonorID, FirstName, LastName, EmailDonor, BirthDate) values (4400, 'Roze', 'Ahmad', 'rozeahmad@gmail.com', '2002-09-03');
insert into Donor (DonorID, FirstName, LastName, EmailDonor, BirthDate) values (3300, 'Anas', 'Zoubi', 'zoubianas@gmail.com', '2002-12-25');
insert into Donor (DonorID, FirstName, LastName, EmailDonor, BirthDate) values (2200, 'Rand', 'Ayman', 'randayman@gmail.com', '1999-11-14');
insert into Donor (DonorID, FirstName, LastName, EmailDonor, BirthDate) values (1100,'Mohammad', 'Al-Saket', 'mohmmadsaket@gmail.com','2000-01-04');

insert into PhoneDonor (DonID, DonorPhoneNumber) values (5500, 0798648638);
insert into PhoneDonor (DonID, DonorPhoneNumber) values (5500, 0784638465);
insert into PhoneDonor (DonID, DonorPhoneNumber) values (4400, 0779475937);
insert into PhoneDonor (DonID, DonorPhoneNumber) values (3300, 0798465836);
insert into PhoneDonor (DonID, DonorPhoneNumber) values (2200, 0789948365);
insert into PhoneDonor (DonID, DonorPhoneNumber) values (1100, 0779998734);
insert into PhoneDonor (DonID, DonorPhoneNumber) values (1100, 0770615558);

insert into event (NumberEvent, EventDate, EvenType, EventName, City, Country, Street) values (005, '2025-02-22', 'Educational books', 'Books For Study', 'Amman', 'Jordan', 'HTU');
insert into event (NumberEvent, EventDate, EvenType, EventName, City, Country, Street) values (004, '2024-02-11', 'Tuition fees', 'Help To Study', 'Amman', 'Jordan', 'Jordan University');
insert into event (NumberEvent, EventDate, EvenType, EventName, City, Country, Street) values (002, '2023-11-12', 'Educational materials', 'Matriales Study', 'Amman', 'Jordan', 'Business Park');
insert into event (NumberEvent, EventDate, EvenType, EventName, City, Country, Street) values (001, '2024-03-15', 'Tuition fees', 'Support Study', 'Al-Salt', 'Jordan', 'Akrad Street');
insert into event (NumberEvent, EventDate, EvenType, EventName, City, Country, Street) values (003, '2020-12-22', 'Educational books', 'For Study', 'Zarqa', 'Jordan', 'Hashimiat University');


insert into SupportPaticipation (DonID, EventNumber) values (5500, 005);
insert into SupportPaticipation (DonID, EventNumber) values (4400, 004);
insert into SupportPaticipation (DonID, EventNumber) values (1100, 002);
insert into SupportPaticipation (DonID, EventNumber) values (5500, 002);
insert into SupportPaticipation (DonID, EventNumber) values (4400, 005);
insert into SupportPaticipation (DonID, EventNumber) values (3300, 001);
insert into SupportPaticipation (DonID, EventNumber) values (2200, 002);
insert into SupportPaticipation (DonID, EventNumber) values (1100, 004);

insert into Scholarship (ScholarshipNumber, ScholarshipType, ScholarAmount, ScholarStartDate, ScholarEndDate) values (5, 'Educational materials', 800.00, '2023-07-01', '2024-06-30');
insert into Scholarship (ScholarshipNumber, ScholarshipType, ScholarAmount, ScholarStartDate, ScholarEndDate) values (4, 'Tuition fees', 1200.00, '2023-09-15', '2024-09-14');
insert into Scholarship (ScholarshipNumber, ScholarshipType, ScholarAmount, ScholarStartDate, ScholarEndDate) values (3, 'Educational books', 750.00, '2024-05-01', '2024-11-30');
insert into Scholarship (ScholarshipNumber, ScholarshipType, ScholarAmount, ScholarStartDate, ScholarEndDate) values (2, 'Educational materials', 500.00, '2024-11-11', '2024-12-01');
insert into Scholarship (ScholarshipNumber, ScholarshipType, ScholarAmount, ScholarStartDate, ScholarEndDate) values (1, 'Tuition fees', 1000.00, '2024-01-01', '2025-01-01');

insert into Student (StudentID, FirstName, LastName, EmailStudent, DateOfEnroll, ScholarID) values (2400, 'Hadi', 'Jamal', 'hadijamal@gmail.com', '2019-09-10', 3);
insert into Student (StudentID, FirstName, LastName, EmailStudent, DateOfEnroll, ScholarID) values (2312, 'Lina', 'Ahmed', 'linaahmed@gmail.com', '2018-05-20', 2);
insert into Student (StudentID, FirstName, LastName, EmailStudent, DateOfEnroll, ScholarID) values (2311, 'Ali', 'Ahmad','aliahmad@gmail.com' ,'2017-02-15', 1);
insert into Student (StudentID, FirstName, LastName, EmailStudent, DateOfEnroll, ScholarID) values (2401, 'Nour', 'Salem', 'noursalem@gmail.com', '2021-01-05', 4);

insert into StudentPhone (StudID, StudentMobile) value (2401, 0798783583);
insert into StudentPhone (StudID, StudentMobile) value (2401, 0789475284);
insert into StudentPhone (StudID, StudentMobile) value (2400, 0789675482);
insert into StudentPhone (StudID, StudentMobile) value (2312, 0796675494);
insert into StudentPhone (StudID, StudentMobile) value (2311, 0789249374);
insert into StudentPhone (StudID, StudentMobile) value (2311, 0779034567);

insert into Donation (DonationNumber, TypeDonation, DateOfDonation, DonationStatus, DonationAmount, DonID, EventNum, ScholorshipID) values (0002, 'Educational materials', '2023-11-15', 'One time', 300.00, 2200, 002, 2);
insert into Donation (DonationNumber, TypeDonation, DateOfDonation, DonationStatus, DonationAmount, DonID, EventNum, ScholorshipID) values (0001, 'Tuition fees', '2024-03-01', 'One time', 5000.00, 1100, 004, 1);
insert into Donation (DonationNumber, TypeDonation, DateOfDonation, DonationStatus, DonationAmount, DonID, EventNum, ScholorshipID) values (0005, 'Educational materials', '2025-01-10', 'Always', 800.00, 5500, 002, 5);
insert into Donation (DonationNumber, TypeDonation, DateOfDonation, DonationStatus, DonationAmount, DonID, EventNum, ScholorshipID) values (0004, 'Tuition fees', '2024-05-01', 'One time', 1000.00, 4400, 005, 4);
insert into Donation (DonationNumber, TypeDonation, DateOfDonation, DonationStatus, DonationAmount, DonID, EventNum, ScholorshipID) values (0003, 'Educational books', '2024-02-20', 'Always', 700.00, 3300, 001, 3);
insert into Donation (DonationNumber, TypeDonation, DateOfDonation, DonationStatus, DonationAmount, DonID, EventNum, ScholorshipID) values (0006, 'Educational materials', '2023-01-15', 'One time',6300.00, 2200, 002, 2);
insert into Donation (DonationNumber, TypeDonation, DateOfDonation, DonationStatus, DonationAmount, DonID, EventNum, ScholorshipID) values (0007, 'Tuition fees', '2024-03-01', 'One time',85000.00, 1100, 004, 1);
insert into Donation (DonationNumber, TypeDonation, DateOfDonation, DonationStatus, DonationAmount, DonID, EventNum, ScholorshipID) values (0008, 'Educational materials', '2025-01-10', 'Always',4800.00, 5500, 002, 5);

create view DonorDonation as
select
	donor.DonorID, donor.FirstName as DonorFirstName, donor.LastName as DonorLastName, donor.EmailDonor,
    donation.DonationNumber, donation.TypeDonation, donation.DonationStatus, donation.DateOfDonation, donation.DonationAmount
from donor
inner join donation on donation.donID = donor.DonorID;

select * from DonorDonation;

create view TheDonorEventParticipation as
select 
	donor.DonorID, donor.FirstName as DonorFirstName, donor.LastName as DonorLastName, donor.EmailDonor,
    event.NumberEvent, event.EventName, event.EvenType, event.EventDate, event.Country, event.City, event.Street
from donor
inner join supportpaticipation on supportpaticipation.DonID = donor.DonorID
inner join event on event.NumberEvent = supportpaticipation.EventNumber;

select * from TheDonorEventParticipation;

create view DonorScholarship as
select
	donor.DonorID, donor.FirstName as DonorFirstName, donor.LastName as DonorLastName,
    donation.DonationNumber,
    scholarship.ScholarshipNumber, scholarship.ScholarshipType, scholarship.ScholarAmount
from donor
inner join donation on donation.DonID = donor.DonorID
inner join scholarship on scholarship.ScholarshipNumber = donation.ScholorshipID;

select * from DonorScholarship;

create view StudentScholarship as
select
	student.StudentID, student.FirstName as StudentFirstName, student.LastName as StudentLastName,
    scholarship.ScholarshipNumber, scholarship.ScholarshipType, scholarship.ScholarAmount
from student
left join scholarship on student.ScholarID = scholarship.ScholarshipNumber;

select * from StudentScholarship;

create view EventDonation as
select 
	event.NumberEvent, event.EventName, event.EvenType, event.EventDate,
    sum(donation.DonationAmount) as TotalDonation
from event
inner join donation on event.NumberEvent =donation.EventNum
group by event.NumberEvent, event.EventName, event.EvenType, event.EventDate;

select * from EventDonation;

delimiter ||
create procedure searchDonorInformation (in DonID int)
begin
select
	donor.FirstName as DonorFirstName, donor.LastName as DonorLastName, donor.EmailDonor, donor.BirthDate
from Donor
Where DonorID = DonID;
end ||
delimiter ;
call searchDonorInformation(2200);

delimiter ||
create procedure UpdateEventInfomration (in theEventNumber int, in theEventype varchar(35), in theEventDate date, in theEventName varchar(35), in theCity varchar(35), in theCountry varchar(35), in theStreet varchar(40))
begin
update event set event.EventName = theEventName, event.EvenType = theEventype, event.EventDate = theEventDate, event.Country = theCountry, event.City = theCity, event.Street = theStreet where theEventNumber = event.NumberEvent;
end ||
delimiter ;
call UpdateEventInfomration(4, 'Tuition fees','2024-12-12','Help To Study' ,'Amman','	Jordan', 'Jordan University');


delimiter ||
create procedure TheTotalOfTheDonation()
begin
select 
	event.NumberEvent, event.EventName,
    count(donation.DonationAmount) as TotaleDonation
from event
left join donation on event.NumberEvent = donation.EventNum
group by event.NumberEvent, event.EventName;
end ||
delimiter ;
call TheTotalOfTheDonation();

delimiter ||
create procedure CalculateTotalPaticipationEvent()
begin
select 
	event.NumberEvent, event.EventName,
    count(supportpaticipation.EventNumber) as TotalParticipationEchEvent
from event
inner join supportpaticipation on supportpaticipation.EventNumber = event.NumberEvent
group by event.NumberEvent, event.EventName;
end ||
delimiter ;
call CalculateTotalPaticipationEvent();

select event.NumberEvent, count(*) as participationDonor
from event 
left join supportpaticipation on event.NumberEvent = supportpaticipation.EventNumber
group by event.NumberEvent;

select donation.DonationNumber ,donation.DonationAmount from Donation where donation.DonationAmount > 2000.00;


create view DonorOwnInformation as
select
	donor.FirstName as DonorFirstName, donor.LastName as DonorLastName, donor.EmailDonor, donor.BirthDate
from Donor
Where DonorID = DonorID;

create view StudentOwnInformation as
select
	student.StudentID, student.FirstName as StudentFirstName, student.LastName as StudentLastName, student.EmailStudent
from student
Where student.StudentID = StudentID;


create user theManeger identified by '1111';
select * from mysql.user;
grant select, insert, update, delete, create on donayiondatabasefinal.* to theManeger;
grant select, insert, update, delete, create on donayiondatabasefinal.user to theManeger;
show grants for theManeger;

create user TheDonor identified by '0000';
grant select, insert, update on donayiondatabasefinal.donation to TheDonor;
grant select on donayiondatabasefinal.event  to TheDonor;
grant select, update, insert  on donayiondatabasefinal.donor to TheDonor;
show grants for TheDonor;

create user TheStudent identified by '0000';
grant select on donayiondatabasefinal.scholarship to TheStudent;
grant select, update, insert on donayiondatabasefinal.student to TheStudent;
show grants for TheStudent;


