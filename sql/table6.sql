prompt PL/SQL Developer import file
prompt Created on 2017年10月11日 by suojinyu
set feedback off
set define off
prompt Creating LAAGENT...
create table LAAGENT
(
  staffid            VARCHAR2(20) not null,
  region             VARCHAR2(22),
  locationcode       VARCHAR2(22),
  city               VARCHAR2(10),
  subbranch          VARCHAR2(10),
  companyname        VARCHAR2(40),
  department         VARCHAR2(40),
  name               VARCHAR2(20) not null,
  preferredfirstname VARCHAR2(20),
  jobcode            VARCHAR2(20),
  positiontitle      VARCHAR2(40),
  checkflag          VARCHAR2(10),
  salesrole          VARCHAR2(40),
  actnrsneffdt       DATE,
  hiredate           DATE,
  rehiredate         DATE
)
;
alter table LAAGENT
  add constraint PK_LAAGENT primary key (STAFFID);

prompt Creating LAAGENTA...
create table LAAGENTA
(
  staffid            VARCHAR2(20) not null,
  region             VARCHAR2(22),
  locationcode       VARCHAR2(22),
  city               VARCHAR2(10),
  subbranch          VARCHAR2(10),
  companyname        VARCHAR2(40),
  department         VARCHAR2(40),
  name               VARCHAR2(20) not null,
  preferredfirstname VARCHAR2(20),
  jobcode            VARCHAR2(20),
  positiontitle      VARCHAR2(40),
  checkflag          VARCHAR2(10),
  salesrole          VARCHAR2(40),
  actnrsneffdt       DATE,
  hiredate           DATE,
  rehiredate         DATE
)
;
alter table LAAGENTA
  add constraint PK_LAAGENTA primary key (STAFFID);

prompt Creating LAAGENTB...
create table LAAGENTB
(
  staffid            VARCHAR2(20) not null,
  region             VARCHAR2(22),
  locationcode       VARCHAR2(22),
  city               VARCHAR2(10),
  subbranch          VARCHAR2(10),
  companyname        VARCHAR2(40),
  department         VARCHAR2(40),
  name               VARCHAR2(20) not null,
  preferredfirstname VARCHAR2(20),
  jobcode            VARCHAR2(20),
  positiontitle      VARCHAR2(40),
  checkflag          VARCHAR2(10),
  salesrole          VARCHAR2(40),
  actnrsneffdt       DATE,
  hiredate           DATE,
  rehiredate         DATE
)
;

prompt Creating LAAUTHORIZE...
create table LAAUTHORIZE
(
  riskcode        VARCHAR2(10) not null,
  insurancecom    VARCHAR2(20) not null,
  authorobj       VARCHAR2(20) not null,
  authortype      VARCHAR2(2) not null,
  authorflow      VARCHAR2(2) not null,
  authorstartdate DATE,
  authorenddate   DATE,
  operator        VARCHAR2(20) not null,
  makedate        DATE,
  maketime        VARCHAR2(8),
  modifydate      DATE,
  modifytime      VARCHAR2(8),
  branchtype      VARCHAR2(2) not null,
  risktype        VARCHAR2(2) not null,
  risktypename    VARCHAR2(50),
  branchattr      VARCHAR2(20),
  agentcode       VARCHAR2(10),
  branchtype2     VARCHAR2(2)
)
;
comment on column LAAUTHORIZE.authortype
  is '0-按业务员授权
1-按职级授权
2-按网点授权';
comment on column LAAUTHORIZE.authorflow
  is '01-正向（允许销售）
02-反向（禁止销售）';
comment on column LAAUTHORIZE.branchtype
  is '展业类型(1-个人营销，2-团险，3－银行保险，9－其他)';
comment on column LAAUTHORIZE.risktype
  is 'L--寿险(Life)、
A--意外险(Accident)、
H--健康险(Health)"
';
comment on column LAAUTHORIZE.branchtype2
  is '01 or null -直销
02-中介
03-交叉销售';
alter table LAAUTHORIZE
  add constraint PK_LAAUTHORIZE primary key (RISKCODE, AUTHOROBJ, AUTHORTYPE, INSURANCECOM);

prompt Creating LAAUTHORIZEA...
create table LAAUTHORIZEA
(
  riskcode        VARCHAR2(10) not null,
  insurancecom    VARCHAR2(20) not null,
  authorobj       VARCHAR2(20) not null,
  authortype      VARCHAR2(2) not null,
  authorflow      VARCHAR2(2) not null,
  authorstartdate DATE,
  authorenddate   DATE,
  operator        VARCHAR2(20) not null,
  makedate        DATE,
  maketime        VARCHAR2(8),
  modifydate      DATE,
  modifytime      VARCHAR2(8),
  branchtype      VARCHAR2(2) not null,
  risktype        VARCHAR2(2) not null,
  risktypename    VARCHAR2(50),
  branchattr      VARCHAR2(20),
  agentcode       VARCHAR2(10),
  branchtype2     VARCHAR2(2)
)
;
alter table LAAUTHORIZEA
  add constraint PK_LAAUTHORIZEA primary key (RISKCODE, INSURANCECOM, AUTHOROBJ, AUTHORTYPE);

prompt Creating LAAUTHORIZEB...
create table LAAUTHORIZEB
(
  riskcode        VARCHAR2(10) not null,
  insurancecom    VARCHAR2(20) not null,
  authorobj       VARCHAR2(20) not null,
  authortype      VARCHAR2(2) not null,
  authorflow      VARCHAR2(2) not null,
  authorstartdate DATE,
  authorenddate   DATE,
  operator        VARCHAR2(20) not null,
  makedate        DATE,
  maketime        VARCHAR2(8),
  modifydate      DATE,
  modifytime      VARCHAR2(8),
  branchtype      VARCHAR2(2) not null,
  risktype        VARCHAR2(2) not null,
  risktypename    VARCHAR2(50),
  branchattr      VARCHAR2(20),
  agentcode       VARCHAR2(10),
  branchtype2     VARCHAR2(2)
)
;

prompt Creating LACOM...
create table LACOM
(
  agentcom         VARCHAR2(20) not null,
  name             VARCHAR2(60) not null,
  states           VARCHAR2(1),
  cooperationdate  DATE,
  channeltype      VARCHAR2(2),
  licensestartdate DATE,
  operator         VARCHAR2(20) not null,
  remark           VARCHAR2(200),
  amend            VARCHAR2(1),
  makedate         DATE,
  maketime         VARCHAR2(8),
  modifydate       DATE,
  modifytime       VARCHAR2(8)
)
;
alter table LACOM
  add constraint PK_LACOM primary key (AGENTCOM, NAME);

prompt Creating LACOMA...
create table LACOMA
(
  agentcom         VARCHAR2(20) not null,
  name             VARCHAR2(60) not null,
  states           VARCHAR2(1),
  cooperationdate  DATE,
  channeltype      VARCHAR2(2),
  licensestartdate DATE,
  operator         VARCHAR2(20) not null,
  remark           VARCHAR2(200),
  amend            VARCHAR2(1),
  makedate         DATE,
  maketime         VARCHAR2(8),
  modifydate       DATE,
  modifytime       VARCHAR2(8)
)
;
alter table LACOMA
  add constraint PK_LACOMA primary key (AGENTCOM, NAME);

prompt Creating LACOMB...
create table LACOMB
(
  agentcom         VARCHAR2(20) not null,
  name             VARCHAR2(60),
  states           VARCHAR2(1),
  cooperationdate  DATE,
  channeltype      VARCHAR2(2),
  licensestartdate DATE,
  operator         VARCHAR2(20) not null,
  remark           VARCHAR2(200),
  amend            VARCHAR2(1),
  makedate         DATE,
  maketime         VARCHAR2(8),
  modifydate       DATE,
  modifytime       VARCHAR2(8)
)
;

prompt Deleting LACOMB...
delete from LACOMB;
commit;
prompt Deleting LACOMA...
delete from LACOMA;
commit;
prompt Deleting LACOM...
delete from LACOM;
commit;
prompt Deleting LAAUTHORIZEB...
delete from LAAUTHORIZEB;
commit;
prompt Deleting LAAUTHORIZEA...
delete from LAAUTHORIZEA;
commit;
prompt Deleting LAAUTHORIZE...
delete from LAAUTHORIZE;
commit;
prompt Deleting LAAGENTB...
delete from LAAGENTB;
commit;
prompt Deleting LAAGENTA...
delete from LAAGENTA;
commit;
prompt Deleting LAAGENT...
delete from LAAGENT;
commit;
prompt Loading LAAGENT...
insert into LAAGENT (staffid, region, locationcode, city, subbranch, companyname, department, name, preferredfirstname, jobcode, positiontitle, checkflag, salesrole, actnrsneffdt, hiredate, rehiredate)
values ('44063624', 'NOR', 'TGHBCH', 'TGH', 'TGH', 'HBCN Tangshan Branch', 'Counter Services, TGH', 'Bi,Ying', 'Jennie', 'BJ5689', 'Associate Relp Assistant', 'Y', 'Y', to_date('01-06-2017', 'dd-mm-yyyy'), to_date('22-05-2017', 'dd-mm-yyyy'), to_date('31-12-1899', 'dd-mm-yyyy'));
commit;
prompt 1 records loaded
prompt Loading LAAGENTA...
insert into LAAGENTA (staffid, region, locationcode, city, subbranch, companyname, department, name, preferredfirstname, jobcode, positiontitle, checkflag, salesrole, actnrsneffdt, hiredate, rehiredate)
values ('43668968', 'Credit Card', 'SHHPUD', 'SHH', 'PUD', 'HSBC Bank (China) Co., Ltd.', 'CNQ RBWM -Cards and Loans', 'Liang,Qi Wei', 'Michael', 'BJ5435', 'Jade Relp Manager(JadeRM)', 'W', 'Card', to_date('01-06-2017', 'dd-mm-yyyy'), to_date('17-08-2011', 'dd-mm-yyyy'), to_date('31-12-1899', 'dd-mm-yyyy'));
commit;
prompt 1 records loaded
prompt Loading LAAGENTB...
insert into LAAGENTB (staffid, region, locationcode, city, subbranch, companyname, department, name, preferredfirstname, jobcode, positiontitle, checkflag, salesrole, actnrsneffdt, hiredate, rehiredate)
values ('44063624', 'NOR', 'TGHBCH', 'TGH', 'TGH', 'HBCN Tangshan Branch', 'Counter Services, TGH', 'Bi,Ying', 'Jennie', 'BJ5689', 'Associate Relp Assistant', 'W', 'Y', to_date('01-06-2017', 'dd-mm-yyyy'), to_date('22-05-2017', 'dd-mm-yyyy'), to_date('31-12-1899', 'dd-mm-yyyy'));
insert into LAAGENTB (staffid, region, locationcode, city, subbranch, companyname, department, name, preferredfirstname, jobcode, positiontitle, checkflag, salesrole, actnrsneffdt, hiredate, rehiredate)
values ('44063624', 'NOR', 'TGHBCH', 'TGH', 'TGH', 'HBCN Tangshan Branch', 'Counter Services, TGH', 'Bi,Ying', 'Jennie', 'BJ5689', 'Associate Relp Assistant', 'Y', 'Y', to_date('01-06-2017', 'dd-mm-yyyy'), to_date('22-05-2017', 'dd-mm-yyyy'), to_date('31-12-1899', 'dd-mm-yyyy'));
commit;
prompt 2 records loaded
prompt Loading LAAUTHORIZE...
insert into LAAUTHORIZE (riskcode, insurancecom, authorobj, authortype, authorflow, authorstartdate, authorenddate, operator, makedate, maketime, modifydate, modifytime, branchtype, risktype, risktypename, branchattr, agentcode, branchtype2)
values ('001', '001', '004', '2', '01', null, to_date('18-09-2017', 'dd-mm-yyyy'), 'admin', null, null, null, null, '3', '03', null, 'Y', null, 'Y');
insert into LAAUTHORIZE (riskcode, insurancecom, authorobj, authortype, authorflow, authorstartdate, authorenddate, operator, makedate, maketime, modifydate, modifytime, branchtype, risktype, risktypename, branchattr, agentcode, branchtype2)
values ('1', '001', '004', '2', '01', null, to_date('18-09-2017', 'dd-mm-yyyy'), 'admin', null, null, null, null, '3', '03', null, 'Y', null, 'Y');
insert into LAAUTHORIZE (riskcode, insurancecom, authorobj, authortype, authorflow, authorstartdate, authorenddate, operator, makedate, maketime, modifydate, modifytime, branchtype, risktype, risktypename, branchattr, agentcode, branchtype2)
values ('666', '001', '004', '2', '01', null, to_date('18-09-2017', 'dd-mm-yyyy'), 'admin', null, null, null, null, '3', '03', null, 'Y', null, 'Y');
commit;
prompt 3 records loaded
prompt Loading LAAUTHORIZEA...
prompt Table is empty
prompt Loading LAAUTHORIZEB...
insert into LAAUTHORIZEB (riskcode, insurancecom, authorobj, authortype, authorflow, authorstartdate, authorenddate, operator, makedate, maketime, modifydate, modifytime, branchtype, risktype, risktypename, branchattr, agentcode, branchtype2)
values ('001', '001', '004', '2', '01', null, to_date('18-09-2017', 'dd-mm-yyyy'), 'admin', null, null, null, null, '3', '03', null, 'Y', null, 'W');
insert into LAAUTHORIZEB (riskcode, insurancecom, authorobj, authortype, authorflow, authorstartdate, authorenddate, operator, makedate, maketime, modifydate, modifytime, branchtype, risktype, risktypename, branchattr, agentcode, branchtype2)
values ('1', '001', '004', '2', '01', null, to_date('18-09-2017', 'dd-mm-yyyy'), 'admin', null, null, null, null, '3', '03', null, 'Y', null, 'W');
insert into LAAUTHORIZEB (riskcode, insurancecom, authorobj, authortype, authorflow, authorstartdate, authorenddate, operator, makedate, maketime, modifydate, modifytime, branchtype, risktype, risktypename, branchattr, agentcode, branchtype2)
values ('666', '001', '004', '2', '01', null, to_date('18-09-2017', 'dd-mm-yyyy'), 'admin', null, null, null, null, '3', '03', null, 'Y', null, 'W');
insert into LAAUTHORIZEB (riskcode, insurancecom, authorobj, authortype, authorflow, authorstartdate, authorenddate, operator, makedate, maketime, modifydate, modifytime, branchtype, risktype, risktypename, branchattr, agentcode, branchtype2)
values ('001', '001', '004', '2', '01', null, to_date('15-09-2017', 'dd-mm-yyyy'), 'admin', null, null, null, null, '3', '03', null, 'Y', null, 'W');
insert into LAAUTHORIZEB (riskcode, insurancecom, authorobj, authortype, authorflow, authorstartdate, authorenddate, operator, makedate, maketime, modifydate, modifytime, branchtype, risktype, risktypename, branchattr, agentcode, branchtype2)
values ('1', '001', '004', '2', '01', null, to_date('15-09-2017', 'dd-mm-yyyy'), 'admin', null, null, null, null, '3', '03', null, 'Y', null, 'W');
insert into LAAUTHORIZEB (riskcode, insurancecom, authorobj, authortype, authorflow, authorstartdate, authorenddate, operator, makedate, maketime, modifydate, modifytime, branchtype, risktype, risktypename, branchattr, agentcode, branchtype2)
values ('001', '001', '004', '2', '01', null, to_date('13-09-2017', 'dd-mm-yyyy'), 'admin', null, null, null, null, '3', '03', null, 'Y', null, 'W');
commit;
prompt 6 records loaded
prompt Loading LACOM...
prompt Table is empty
prompt Loading LACOMA...
prompt Table is empty
prompt Loading LACOMB...
prompt Table is empty
set feedback on
set define on
prompt Done.
