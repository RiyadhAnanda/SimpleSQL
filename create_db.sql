use student_space;
drop table order1;
drop table customer;
drop table product;
drop table registration;

CREATE TABLE customer
	(cc_no	numeric (16),
	exp_mo	numeric (2),
	exp_yr	numeric (4),
	name_first	varchar (20),
	name_last	varchar (20),
	email		varchar (50),
	address1	varchar (50),
	address2	varchar (50),
	city		varchar (20),
	state		varchar (2),
	zip		numeric (50),
	country	varchar (20),
	phone		varchar (20),
	fax		varchar (15),
	mail_list	numeric(1));

CREATE TABLE product
	(item_no	numeric (4),
	ebook_name	varchar (30),
	price		numeric(9,2),
	inventory	numeric(5));

CREATE TABLE registration
	(username	varchar (16),
	password	varchar (16),
	email		varchar (50));

CREATE TABLE order1
	(quantity	numeric (3),
	date_sold	date,
	cc_no		numeric (16),
	item_no	numeric (4));

alter table customer
	add constraint customer_ccno_pk primary key(cc_no);

alter table product
	add constraint product_itemno_pk primary key(item_no);

alter table order1
	add constraint order1_ccno_itemno_pk primary key(cc_no,item_no);

alter table registration
	add constraint registration_username_pk primary key(username);

alter table order1
	add constraint order1_ccno_fk foreign key(cc_no)
	references customer(cc_no);

alter table order1
	add constraint order1_itemno_fk foreign key(item_no)
	references product(item_no);

alter table product
	modify item_no numeric(4) not null;

alter table product
	modify ebook_name varchar(30) not null;

alter table product
	modify price numeric(9,2) not null;

alter table product
	modify inventory numeric(5) not null;

alter table customer
	modify exp_mo numeric(2) not null;

alter table customer
	modify exp_yr numeric(4) not null;

alter table customer
	modify name_first varchar(20) not null;

alter table customer
	modify name_last varchar(20) not null;

alter table customer
	modify email varchar(20) not null;

alter table customer
	modify address1 varchar(50) not null;

alter table customer
	modify city varchar(20) not null;

alter table customer
	modify state varchar(2) not null;

alter table customer
	modify zip numeric(5) not null;

alter table customer
	modify phone varchar(15) not null;

alter table customer
	modify fax varchar(15) not null;

alter table registration 
	modify password varchar(16) not null;

alter table registration
	modify email varchar(50) not null;

insert into product
	values('1','The Exercise Cure', '1.99', 5);

insert into product
	values('2','Daniel', '2.99', 5);

insert into product
	values('3','Soul Healing', '1.99', 5);

insert into product
	values('4','Wheat Belly', '.99', 5);

insert into product
	values('5','What to Expect', '3.99', 5);

insert into product
	values('6','The First Year', '1.99', 5);

insert into product
	values('7','Hands Free Mama', '.99', 5);

insert into product
	values('8','Talk to Kids', '2.99', 5);

commit;