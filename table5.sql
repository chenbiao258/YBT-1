prompt PL/SQL Developer import file
prompt Created on 2017年10月11日 by suojinyu
set feedback off
set define off
prompt Creating HESITATIONTOBANK...
create table HESITATIONTOBANK
(
  transno      VARCHAR2(20) not null,
  insurancecom VARCHAR2(20),
  bankcode     VARCHAR2(20),
  totalcount   INTEGER,
  totalmoney   NUMBER(15,2),
  succmoney    NUMBER(15,2),
  succcount    INTEGER,
  state        VARCHAR2(10),
  makedate     VARCHAR2(8),
  maketime     VARCHAR2(10),
  bak1         VARCHAR2(100),
  bak2         VARCHAR2(100),
  bak3         VARCHAR2(100),
  bak4         VARCHAR2(100),
  bak5         VARCHAR2(100)
)
;
alter table HESITATIONTOBANK
  add primary key (TRANSNO);

prompt Creating HESITATIONTOBANKDETAIL...
create table HESITATIONTOBANKDETAIL
(
  transno         VARCHAR2(20) not null,
  insurancecom    VARCHAR2(20),
  bankcode        VARCHAR2(10),
  proposalcontno  VARCHAR2(12),
  hesitationmoney NUMBER(15,2),
  succflag        VARCHAR2(2),
  state           VARCHAR2(10),
  makedate        VARCHAR2(8),
  maketime        VARCHAR2(10),
  bak1            VARCHAR2(100),
  bak2            VARCHAR2(100),
  bak3            VARCHAR2(100),
  bak4            VARCHAR2(100),
  bak5            VARCHAR2(100)
)
;
alter table HESITATIONTOBANKDETAIL
  add primary key (TRANSNO);

prompt Creating HOLIDAY...
create table HOLIDAY
(
  seqnumber VARCHAR2(20) not null,
  holiday   VARCHAR2(20),
  workday   DATE,
  flag      VARCHAR2(2),
  operator  VARCHAR2(30),
  bak1      VARCHAR2(20),
  bak2      VARCHAR2(20),
  bak3      VARCHAR2(20)
)
;
alter table HOLIDAY
  add constraint PK_HOLIDAY primary key (SEQNUMBER);

prompt Creating HOLIDAYA...
create table HOLIDAYA
(
  seqnumber VARCHAR2(20) not null,
  holiday   VARCHAR2(20),
  workday   DATE,
  flag      VARCHAR2(2),
  operator  VARCHAR2(30),
  bak1      VARCHAR2(20),
  bak2      VARCHAR2(20),
  bak3      VARCHAR2(20)
)
;
alter table HOLIDAYA
  add constraint PK_HOLIDAYA primary key (SEQNUMBER);

prompt Creating HOLIDAYB...
create table HOLIDAYB
(
  seqnumber VARCHAR2(20) not null,
  holiday   VARCHAR2(20),
  workday   DATE,
  flag      VARCHAR2(2),
  operator  VARCHAR2(30),
  bak1      VARCHAR2(20),
  bak2      VARCHAR2(20),
  bak3      VARCHAR2(20)
)
;

prompt Creating IMPARTCONTENT...
create table IMPARTCONTENT
(
  contnoimpartcode     VARCHAR2(40) not null,
  transno              VARCHAR2(20),
  contno               VARCHAR2(20),
  insuredcompany       VARCHAR2(1000),
  impartcode           VARCHAR2(1000),
  insuredimpart        VARCHAR2(1000),
  ownerimpart          VARCHAR2(1000),
  insuredyesorno       VARCHAR2(2),
  owneryesorno         VARCHAR2(2),
  impartno             VARCHAR2(40),
  insuredyesornoimpart VARCHAR2(1000)
)
;
alter table IMPARTCONTENT
  add constraint PK_IMPARTCONTENT primary key (CONTNOIMPARTCODE);

prompt Creating JOBCODE...
create table JOBCODE
(
  jobcode    VARCHAR2(20),
  salesrole1 VARCHAR2(20),
  salesrole2 VARCHAR2(20)
)
;

prompt Creating JOINACCOUNT...
create table JOINACCOUNT
(
  ic         VARCHAR2(20) not null,
  fundname   VARCHAR2(120) not null,
  fundcode   VARCHAR2(20),
  riskrating VARCHAR2(20)
)
;
alter table JOINACCOUNT
  add constraint PK_JOINACCOUNT primary key (IC, FUNDNAME);

prompt Creating JOINACCOUNTA...
create table JOINACCOUNTA
(
  ic         VARCHAR2(20) not null,
  fundname   VARCHAR2(120) not null,
  fundcode   VARCHAR2(20),
  riskrating VARCHAR2(20)
)
;
alter table JOINACCOUNTA
  add constraint PK_JOINACCOUNTA primary key (IC, FUNDNAME);

prompt Creating JOINACCOUNTB...
create table JOINACCOUNTB
(
  ic         VARCHAR2(20),
  fundname   VARCHAR2(120),
  fundcode   VARCHAR2(20),
  riskrating VARCHAR2(20)
)
;

prompt Deleting JOINACCOUNTB...
delete from JOINACCOUNTB;
commit;
prompt Deleting JOINACCOUNTA...
delete from JOINACCOUNTA;
commit;
prompt Deleting JOINACCOUNT...
delete from JOINACCOUNT;
commit;
prompt Deleting JOBCODE...
delete from JOBCODE;
commit;
prompt Deleting IMPARTCONTENT...
delete from IMPARTCONTENT;
commit;
prompt Deleting HOLIDAYB...
delete from HOLIDAYB;
commit;
prompt Deleting HOLIDAYA...
delete from HOLIDAYA;
commit;
prompt Deleting HOLIDAY...
delete from HOLIDAY;
commit;
prompt Deleting HESITATIONTOBANKDETAIL...
delete from HESITATIONTOBANKDETAIL;
commit;
prompt Deleting HESITATIONTOBANK...
delete from HESITATIONTOBANK;
commit;
prompt Loading HESITATIONTOBANK...
prompt Table is empty
prompt Loading HESITATIONTOBANKDETAIL...
prompt Table is empty
prompt Loading HOLIDAY...
insert into HOLIDAY (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('237', '2015-01-02', null, 'Y', '001', null, null, null);
insert into HOLIDAY (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('238', '2015-01-01', null, 'Y', '001', null, null, null);
commit;
prompt 2 records loaded
prompt Loading HOLIDAYA...
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('123', '2015-01-03', null, 'N', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('124', '2015-01-09', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('125', '2015-01-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('126', '2015-01-16', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('127', '2015-01-17', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('128', '2015-01-23', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('129', '2015-01-24', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('130', '2015-01-30', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('131', '2015-01-31', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('132', '2015-02-07', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('133', '2015-02-08', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('134', '2015-02-09', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('135', '2015-02-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('136', '2015-02-11', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('137', '2015-02-12', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('138', '2015-02-13', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('139', '2015-02-20', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('140', '2015-02-21', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('141', '2015-02-27', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('142', '2015-02-28', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('143', '2015-03-05', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('144', '2015-03-06', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('145', '2015-03-12', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('146', '2015-03-13', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('147', '2015-03-19', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('148', '2015-03-20', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('149', '2015-03-26', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('150', '2015-03-27', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('151', '2015-04-02', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('152', '2015-04-03', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('153', '2015-04-04', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('154', '2015-04-09', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('155', '2015-04-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('156', '2015-04-16', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('157', '2015-04-17', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('158', '2015-04-23', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('159', '2015-04-24', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('160', '2015-04-30', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('161', '2015-05-01', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('162', '2015-05-02', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('163', '2015-05-07', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('164', '2015-05-08', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('165', '2015-05-14', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('166', '2015-05-15', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('167', '2015-05-21', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('168', '2015-05-22', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('169', '2015-05-28', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('170', '2015-05-29', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('171', '2015-06-04', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('172', '2015-06-05', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('173', '2015-06-09', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('174', '2015-06-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('175', '2015-06-11', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('176', '2015-06-18', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('177', '2015-06-19', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('178', '2015-06-25', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('179', '2015-06-26', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('180', '2015-07-02', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('181', '2015-07-03', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('182', '2015-07-09', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('183', '2015-07-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('184', '2015-07-16', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('185', '2015-07-17', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('186', '2015-07-23', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('187', '2015-07-24', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('188', '2015-07-30', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('189', '2015-07-31', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('190', '2015-08-06', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('191', '2015-08-07', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('192', '2015-08-13', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('193', '2015-08-14', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('194', '2015-08-20', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('195', '2015-08-21', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('196', '2015-08-27', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('197', '2015-08-28', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('198', '2015-09-03', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('199', '2015-09-04', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('200', '2015-09-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('201', '2015-09-11', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('202', '2015-09-15', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('203', '2015-09-16', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('204', '2015-09-17', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('205', '2015-09-24', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('206', '2015-09-25', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('207', '2015-10-01', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('208', '2015-10-02', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('209', '2015-10-03', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('210', '2015-10-04', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('211', '2015-10-05', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('212', '2015-10-06', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('213', '2015-10-07', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('214', '2015-10-15', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('215', '2015-10-16', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('216', '2015-10-22', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('217', '2015-10-23', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('218', '2015-10-29', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('219', '2015-10-30', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('220', '2015-11-05', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('221', '2015-11-06', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('222', '2015-11-12', null, 'W', '001', null, null, null);
commit;
prompt 100 records committed...
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('223', '2015-11-13', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('224', '2015-11-19', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('225', '2015-11-20', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('226', '2015-11-26', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('227', '2015-11-27', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('228', '2015-12-03', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('229', '2015-12-04', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('230', '2015-12-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('231', '2015-12-11', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('232', '2015-12-17', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('233', '2015-12-18', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('234', '2015-12-24', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('235', '2015-12-25', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('236', '2015-12-31', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('3', '2015-01-03', null, 'N', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('4', '2015-01-09', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('5', '2015-01-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('6', '2015-01-16', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('7', '2015-01-17', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('8', '2015-01-23', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('9', '2015-01-24', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('10', '2015-01-30', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('11', '2015-01-31', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('12', '2015-02-07', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('13', '2015-02-08', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('14', '2015-02-09', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('15', '2015-02-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('16', '2015-02-11', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('17', '2015-02-12', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('18', '2015-02-13', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('19', '2015-02-20', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('20', '2015-02-21', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('21', '2015-02-27', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('22', '2015-02-28', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('23', '2015-03-05', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('24', '2015-03-06', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('25', '2015-03-12', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('26', '2015-03-13', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('27', '2015-03-19', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('28', '2015-03-20', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('29', '2015-03-26', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('30', '2015-03-27', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('31', '2015-04-02', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('32', '2015-04-03', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('33', '2015-04-04', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('34', '2015-04-09', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('241', '2029-06-14', null, 'M', 'undefined', 'undefined', '2014-06-14', null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('35', '2015-04-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('36', '2015-04-16', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('37', '2015-04-17', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('38', '2015-04-23', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('39', '2015-04-24', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('40', '2015-04-30', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('41', '2015-05-01', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('42', '2015-05-02', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('43', '2015-05-07', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('44', '2015-05-08', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('45', '2015-05-14', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('46', '2015-05-15', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('47', '2015-05-21', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('48', '2015-05-22', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('49', '2015-05-28', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('50', '2015-05-29', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('51', '2015-06-04', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('52', '2015-06-05', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('53', '2015-06-09', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('54', '2015-06-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('55', '2015-06-11', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('56', '2015-06-18', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('57', '2015-06-19', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('58', '2015-06-25', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('59', '2015-06-26', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('60', '2015-07-02', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('61', '2015-07-03', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('62', '2015-07-09', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('63', '2015-07-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('64', '2015-07-16', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('65', '2015-07-17', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('66', '2015-07-23', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('67', '2015-07-24', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('68', '2015-07-30', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('69', '2015-07-31', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('70', '2015-08-06', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('71', '2015-08-07', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('72', '2015-08-13', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('73', '2015-08-14', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('74', '2015-08-20', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('75', '2015-08-21', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('76', '2015-08-27', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('77', '2015-08-28', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('78', '2015-09-03', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('79', '2015-09-04', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('80', '2015-09-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('81', '2015-09-11', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('82', '2015-09-15', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('83', '2015-09-16', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('84', '2015-09-17', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('85', '2015-09-24', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('86', '2015-09-25', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('87', '2015-10-01', null, 'W', '001', null, null, null);
commit;
prompt 200 records committed...
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('88', '2015-10-02', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('89', '2015-10-03', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('90', '2015-10-04', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('91', '2015-10-05', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('92', '2015-10-06', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('93', '2015-10-07', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('94', '2015-10-15', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('95', '2015-10-16', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('96', '2015-10-22', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('97', '2015-10-23', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('98', '2015-10-29', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('99', '2015-10-30', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('100', '2015-11-05', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('101', '2015-11-06', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('102', '2015-11-12', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('103', '2015-11-13', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('104', '2015-11-19', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('105', '2015-11-20', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('106', '2015-11-26', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('107', '2015-11-27', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('108', '2015-12-03', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('109', '2015-12-04', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('110', '2015-12-10', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('111', '2015-12-11', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('112', '2015-12-17', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('113', '2015-12-18', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('114', '2015-12-24', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('115', '2015-12-25', null, 'W', '001', null, null, null);
insert into HOLIDAYA (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('116', '2015-12-31', null, 'W', '001', null, null, null);
commit;
prompt 229 records loaded
prompt Loading HOLIDAYB...
insert into HOLIDAYB (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('239', '2015-01-02', null, 'Y', '001', null, null, null);
insert into HOLIDAYB (seqnumber, holiday, workday, flag, operator, bak1, bak2, bak3)
values ('240', '2015-01-01', null, 'Y', '001', null, null, null);
commit;
prompt 2 records loaded
prompt Loading IMPARTCONTENT...
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0001', '31', '111', null, 'IA0001', null, null, null, null, '1', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0002', '31', '111', null, 'IA0002', null, null, null, null, '1', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0003', '31', '111', null, 'IA0003', null, null, 'N', 'N', '2', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0004', '31', '111', null, 'IA0004', null, null, null, null, '2', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0005', '31', '111', null, 'IA0005', null, null, 'N', 'N', '3', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0006', '31', '111', null, 'IA0006', null, null, 'N', 'N', '4', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0007', '31', '111', null, 'IA0007', null, null, 'N', 'N', '5', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0008', '31', '111', null, 'IA0008', null, null, null, null, '5', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0009', '31', '111', null, 'IA0009', null, null, 'N', 'N', '6', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0010', '31', '111', null, 'IA0010', null, null, 'N', 'N', '7', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0011', '31', '111', null, 'IA0011', null, null, 'N', 'N', '8', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0012', '31', '111', null, 'IA0012', null, null, 'N', 'N', '9', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0013', '31', '111', null, 'IA0013', null, null, 'N', null, '10', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0014', '31', '111', null, 'IA0014', null, null, 'N', null, '11', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0015', '31', '111', null, 'IA0015', null, null, null, null, '12', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0016', '31', '111', null, 'IA0016', null, null, null, null, '13', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0017', '31', '111', null, 'IA0017', null, null, null, null, '13', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0018', '31', '111', null, 'IA0018', null, null, null, null, '13', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0019', '31', '111', null, 'IA0019', null, null, null, null, '13', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0020', '31', '111', null, 'IA0020', null, null, null, null, '14', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0021', '31', '111', null, 'IA0021', null, null, 'N', null, '14', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0022', '31', '111', null, 'IA0022', null, null, null, null, '14', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0023', '31', '111', null, 'IA0023', null, null, 'N', null, '15', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0024', '31', '111', null, 'IA0024', null, null, null, null, '15', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0025', '31', '111', null, 'IA0025', null, null, 'N', null, '16', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0026', '31', '111', null, 'IA0026', null, null, 'N', null, '17', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0027', '31', '111', null, 'IA0027', null, null, 'N', null, '18', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0028', '31', '111', null, 'IA0028', null, null, 'N', null, '19', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0029', '31', '111', null, 'IA0029', null, null, null, null, '19', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0030', '31', '111', null, 'IA0030', null, null, null, null, '19', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0031', '31', '111', null, 'IA0031', null, null, null, null, '19', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0032', '31', '111', null, 'IA0032', null, null, null, null, '19', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0033', '31', '111', null, 'IA0033', null, null, null, null, '19', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0034', '31', '111', null, 'IA0034', null, null, null, null, '19', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0035', '31', '111', null, 'IA0035', null, null, null, null, '19', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0036', '31', '111', null, 'IA0036', null, null, 'N', 'N', '20', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0037', '31', '111', null, 'IA0037', null, null, null, null, '20', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0038', '31', '111', null, 'IA0038', null, null, null, null, '20', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno, impartno, insuredyesornoimpart)
values ('111IA0039', '31', '111', null, 'IA0039', null, null, 'N', 'N', '21', null);
commit;
prompt 39 records loaded
prompt Loading JOBCODE...
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1037', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1615', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ1676', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ2001', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ2444', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ3543', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ4334', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ4359', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ4619', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ4629', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ4631', 'HML', 'HML');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ4815', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ4845', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ4847', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ4868', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ4869', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5224', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5274', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5432', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5435', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5453', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5479', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5481', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5482', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5525', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5538', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5550', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5551', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5552', 'REF', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5553', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5654', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5669', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5675', 'Y', 'Y5(only insurance)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('BJ5689', 'Y', 'Y5(only insurance)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD2001', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD2416', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD5453', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD5487', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CD5820', 'HML', 'HML');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN0005', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN0633', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1037', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1615', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN1676', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN2001', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN2444', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN2605', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN3461', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN3543', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN3550', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN3857', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4334', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4359', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4574', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4576', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4596', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4619', 'N', 'N');
commit;
prompt 100 records committed...
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4629', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4631', 'HML', 'HML');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4638', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4765', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4767', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4775', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4776', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4777', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4815', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4847', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4848', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4868', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4869', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4910', 'N', 'CCSS(VRM)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4911', 'N', 'CCSS(VRM)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4939', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN4956', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5016', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5152', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5203', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5217', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5274', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5324', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5341', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5388', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5435', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5445', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5446', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5447', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5448', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5451', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5452', 'N', 'CCSS(VRM)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5453', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5472', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5479', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5481', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5482', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5487', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5491', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5498', 'N', 'CCSS(VRM)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5523', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5525', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5526', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5527', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5528', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5531', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5538', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5546', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5550', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5551', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5552', 'REF', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5553', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5571', 'N', 'CCSS(VRM)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5572', 'N', 'CCSS(VRM)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5594', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5595', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5619', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5624', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5654', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5669', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5675', 'Y', 'Y5(only insurance)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5676', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5680', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5683', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5684', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5687', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5688', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5689', 'Y', 'Y5(only insurance)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5690', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5691', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5704', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5731', 'Y', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5747', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5784', 'N', 'CCSS(VRM)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5785', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5805', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5806', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CN5807', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ2001', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ2808', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ5487', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CQ5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CS1585', 'Y', 'Y1');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CS1632', 'N', 'N');
commit;
prompt 200 records committed...
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('CS4281', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG1037', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG1585', 'Y', 'Y1');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG1676', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG2605', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG2808', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG4847', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DG5679', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL2416', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL2808', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL4847', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('DL5821', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10011', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10298', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10333', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10512', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10514', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10515', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10522', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10523', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10524', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10525', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10527', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10530', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10532', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10533', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10535', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10539', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10540', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10543', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10544', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10545', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10547', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10548', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10549', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10552', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10554', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10555', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10561', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10563', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10564', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10565', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10566', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10567', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10568', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10569', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10570', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10572', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10573', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10574', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10575', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10578', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10580', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10581', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F10582', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F11658', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F11659', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F11797', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F11922', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F11923', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('F11924', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS4765', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS4767', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS4775', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS4777', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS4911', 'N', 'CCSS(VRM)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5016', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5324', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5388', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5447', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5448', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5450', 'N', 'CCSS');
commit;
prompt 300 records committed...
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5531', 'REF', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5550', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5551', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5553', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5619', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5679', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5686', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5688', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5728', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5731', 'Y', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5742', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5781', 'Y', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5782', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('FS5960', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD0633', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD0947', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1037', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1091', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1585', 'Y', 'Y1');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1676', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD1763', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD2001', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD2325', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD2605', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD2808', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD4276', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD4281', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD4329', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD4460', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD4481', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD4631', 'HML', 'HML');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD4837', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5307', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5404', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5449', 'N', 'CCSS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5472', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5543', 'Y', 'Y1');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5583', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5796', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5797', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5798', 'N', 'RCS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5822', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GD5823', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1037', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1615', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ1676', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ2001', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ2444', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ2605', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ3543', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ4281', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ4334', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ4359', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ4631', 'HML', 'HML');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ4815', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ4845', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ4847', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ4868', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5419', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5432', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5472', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5479', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5481', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5482', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5525', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5538', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5550', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5551', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5552', 'REF', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5553', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5611', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5614', 'N', 'N');
commit;
prompt 400 records committed...
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5625', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5627', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5647', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5649', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5654', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5655', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5661', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5675', 'Y', 'Y5(only insurance)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5679', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5681', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5689', 'Y', 'Y5(only insurance)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5698', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5704', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5707', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5709', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('GZ5734', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HB1585', 'Y', 'Y1');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HB2416', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HF0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HF1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HF1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HF1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HF4281', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HF4626', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ1037', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ2001', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ2808', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ4815', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ4845', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ4847', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ5453', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ5472', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ5487', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('HZ5689', 'Y', 'Y5(only insurance)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('JN1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('JN1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('JN2416', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('JN2605', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('JN4626', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('JN5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('JN5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('KM1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('KM4281', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB1037', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB2605', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB2808', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB4848', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NB5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ2808', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ4281', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ4815', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('NJ5487', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD2001', 'HML', 'HMA');
commit;
prompt 500 records committed...
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD4281', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD4631', 'HML', 'HML');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD4815', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD4848', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD4956', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD5487', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('QD5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('RR1292', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU0633', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU2001', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU2605', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU2808', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU4334', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU4631', 'HML', 'HML');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU4847', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU5453', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SU5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY4626', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SY5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ0947', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ1037', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ1676', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ2001', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ2152', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ2605', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ3258', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ3543', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ3862', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ4281', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ4359', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ4574', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ4575', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ4583', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ4619', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ4631', 'HML', 'HML');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ4845', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ4847', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5065', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5203', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5274', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5390', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5391', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5425', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5427', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5429', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5435', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5474', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5479', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5481', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5482', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5487', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5491', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5492', 'N', 'Card');
commit;
prompt 600 records committed...
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5493', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5523', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5525', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5538', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5545', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5550', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5551', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5552', 'REF', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5553', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5554', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5624', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5627', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5631', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5641', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5642', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5643', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5651', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5654', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5655', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5661', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5669', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5675', 'Y', 'Y5(only insurance)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5677', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5678', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5679', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5689', 'Y', 'Y5(only insurance)');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5692', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5707', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5714', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5716', 'N', 'RBB');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5727', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5732', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5734', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5760', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5801', 'N', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('SZ5824', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ1183', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ2416', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ2808', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ4847', 'Wealth Sales', 'Wealth Sales');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ5487', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ5488', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TJ5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TS1585', 'Y', 'Y1');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TS4281', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TY0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TY1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TY1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TY1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TY2416', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TY4626', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TY5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TY5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('TY5487', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH1351', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH2001', 'HML', 'HMA');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH2605', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH4281', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH4631', 'HML', 'HML');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH5487', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WH5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WX0633', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('WX5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XA0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XA0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XA1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XA1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XA1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XA1182', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XA1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XA3796', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XA5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XA5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM0106', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM0566', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM1036', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM1038', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM1181', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM1182', 'N', 'N');
commit;
prompt 700 records committed...
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM1263', 'REF', 'REF');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM2416', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM2808', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM3466', 'HML', 'HMS');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM5095', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM5486', 'Y', 'Y4');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM5490', 'Y', 'Y');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('XM5646', 'Y', 'Card');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('ZZ1585', 'Y', 'Y1');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('ZZ1632', 'N', 'N');
insert into JOBCODE (jobcode, salesrole1, salesrole2)
values ('ZZ2416', 'N', 'N');
commit;
prompt 712 records loaded
prompt Loading JOINACCOUNT...
insert into JOINACCOUNT (ic, fundname, fundcode, riskrating)
values ('3', '股票型投资账户', '5', '1');
insert into JOINACCOUNT (ic, fundname, fundcode, riskrating)
values ('3', '混合偏股型投资账户', '4', '2');
insert into JOINACCOUNT (ic, fundname, fundcode, riskrating)
values ('3', '混合偏债型投资账户', '3', '3');
insert into JOINACCOUNT (ic, fundname, fundcode, riskrating)
values ('3', '货币型投资账户', '1', '5');
insert into JOINACCOUNT (ic, fundname, fundcode, riskrating)
values ('3', '债券型投资账户', '2', '4');
commit;
prompt 5 records loaded
prompt Loading JOINACCOUNTA...
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('12', '债券型投资账户', '2', '2');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('4', '股票型投资账户', '5', '1');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('4', '混合偏股型投资账户', '4', '2');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('4', '债券型投资账户', '2', '4');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('1', '混合偏股型投资账户', '4', '4');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('4', '货币型投资账户', '1', '5');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('2', '货币型投资账户', '1', '3');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('2', '债券型投资账户', '2', '2');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('2', '混合偏股型投资账户', '4', '3');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('2', '混合偏债型投资账户', '3', '2');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('2', '股票型投资账户', '5', '2');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('1', '混合偏债型投资账户', '3', '3');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('1', '股票型投资账户', '5', '5');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('4', '混合偏债型投资账户', '3', '3');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('1', '货币型投资账户', '1', '5');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('1', '债券型投资账户', '2', '2');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('12', '货币型投资账户', '1', '2');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('12', '混合偏债型投资账户', '3', '1');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('12', '股票型投资账户', '5', '2');
insert into JOINACCOUNTA (ic, fundname, fundcode, riskrating)
values ('12', '混合偏股型投资账户', '4', '1');
commit;
prompt 20 records loaded
prompt Loading JOINACCOUNTB...
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('1', '股票型投资账户', '5', '5');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('1', '混合偏股型投资账户', '4', '4');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('1', '混合偏债型投资账户', '3', '3');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('1', '货币型投资账户', '1', '1');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('1', '债券型投资账户', '2', '2');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('3', '股票型投资账户', '5', '1');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('3', '混合偏股型投资账户', '4', '2');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('3', '混合偏债型投资账户', '3', '3');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('3', '货币型投资账户', '1', '5');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('3', '债券型投资账户', '2', '4');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('1', '股票型投资账户', '5', '5');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('1', '混合偏股型投资账户', '4', '4');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('1', '混合偏债型投资账户', '3', '3');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('1', '货币型投资账户', '1', '5');
insert into JOINACCOUNTB (ic, fundname, fundcode, riskrating)
values ('1', '债券型投资账户', '2', '2');
commit;
prompt 15 records loaded
set feedback on
set define on
prompt Done.
