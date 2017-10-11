prompt PL/SQL Developer import file
prompt Created on 2017年10月11日 by suojinyu
set feedback off
set define off
prompt Creating PLACCOUNTINSUREDDETAIL...
create table PLACCOUNTINSUREDDETAIL
(
  serno         VARCHAR2(30) not null,
  serialno      VARCHAR2(20) not null,
  transrno      VARCHAR2(20) not null,
  insurcecom    VARCHAR2(8),
  comcode       VARCHAR2(8),
  insuredaccno  VARCHAR2(30),
  paymoney      NUMBER(12,2),
  clientname    VARCHAR2(30),
  clientidtype  VARCHAR2(6),
  clientidno    VARCHAR2(30),
  payresult     VARCHAR2(4),
  prtno         VARCHAR2(30),
  contno        VARCHAR2(30),
  proposalno    VARCHAR2(30),
  flag          VARCHAR2(20),
  paymodetimes  VARCHAR2(20),
  selltype      VARCHAR2(20),
  authrizedyear VARCHAR2(20),
  paymode       VARCHAR2(20),
  state         VARCHAR2(20),
  remark        VARCHAR2(20),
  socketflag    VARCHAR2(20),
  dealsuccflag  VARCHAR2(20),
  rightflag     VARCHAR2(20),
  makedate      DATE,
  maketime      VARCHAR2(20),
  modifydate    DATE,
  modifytime    VARCHAR2(20),
  standbyflag   VARCHAR2(100),
  bak1          VARCHAR2(20),
  bak2          VARCHAR2(20),
  bak3          VARCHAR2(20),
  bak4          VARCHAR2(20),
  bak5          VARCHAR2(20)
)
;
comment on column PLACCOUNTINSUREDDETAIL.payresult
  is '扣款状态';
comment on column PLACCOUNTINSUREDDETAIL.flag
  is '保单所处状态';
comment on column PLACCOUNTINSUREDDETAIL.state
  is '交易所处的按钮状态 01试算成功的状态';
comment on column PLACCOUNTINSUREDDETAIL.socketflag
  is '和NDS扣款连接';
comment on column PLACCOUNTINSUREDDETAIL.dealsuccflag
  is 'NDS转账是否成功';
comment on column PLACCOUNTINSUREDDETAIL.rightflag
  is '是否要冲正';
comment on column PLACCOUNTINSUREDDETAIL.standbyflag
  is '扣款结果描述   初始化是文件出错';
comment on column PLACCOUNTINSUREDDETAIL.bak1
  is '柜员代码';
comment on column PLACCOUNTINSUREDDETAIL.bak2
  is '表示是否已经对过帐';
comment on column PLACCOUNTINSUREDDETAIL.bak4
  is '当前对应的是哪一条扣款信息  为冲正做准备';
alter table PLACCOUNTINSUREDDETAIL
  add constraint PK_PLACCOUNTINSUREDDETAIL primary key (SERNO, SERIALNO, TRANSRNO);

prompt Creating PROVINCE...
create table PROVINCE
(
  provinceid   NUMBER(5) not null,
  provincename VARCHAR2(50)
)
;
alter table PROVINCE
  add primary key (PROVINCEID);

prompt Creating RECORDALL...
create table RECORDALL
(
  transno  VARCHAR2(120),
  fileid   VARCHAR2(100),
  filetype VARCHAR2(100),
  counts   VARCHAR2(22),
  loser    VARCHAR2(5),
  succeed  VARCHAR2(22),
  operator VARCHAR2(30),
  makedate DATE,
  maketime VARCHAR2(22)
)
;

prompt Creating REGION...
create table REGION
(
  regionid VARCHAR2(20) not null,
  region   VARCHAR2(100)
)
;
alter table REGION
  add constraint PK_REGION primary key (REGIONID);

prompt Creating REVENUE...
create table REVENUE
(
  transno         VARCHAR2(20) not null,
  statement       VARCHAR2(10),
  cn_firstname    VARCHAR2(10),
  en_firstname    VARCHAR2(10),
  cnlastname      VARCHAR2(10),
  enlastname      VARCHAR2(10),
  cnlivingaddress VARCHAR2(100),
  enlivingaddress VARCHAR2(100),
  cnnativeheath   VARCHAR2(100),
  ennativeheath   VARCHAR2(100),
  tiveheath       CHAR(1),
  reason1         CHAR(1),
  reason2         CHAR(1),
  reason2desc     VARCHAR2(100),
  bak1            VARCHAR2(100),
  bak2            VARCHAR2(100),
  bak3            VARCHAR2(100)
)
;
alter table REVENUE
  add primary key (TRANSNO);

prompt Creating SUBBRANCH...
create table SUBBRANCH
(
  subbranchid VARCHAR2(20) not null,
  subbranch   VARCHAR2(100),
  cityid      VARCHAR2(20)
)
;
alter table SUBBRANCH
  add constraint PK_SUBBRANCH primary key (SUBBRANCHID);

prompt Creating TAXREVENUE...
create table TAXREVENUE
(
  transno         VARCHAR2(20) not null,
  residentcountry VARCHAR2(100),
  residentnumber  VARCHAR2(20),
  residentdesc    VARCHAR2(100),
  bak1            VARCHAR2(100),
  bak2            VARCHAR2(100),
  bak3            VARCHAR2(100)
)
;
alter table TAXREVENUE
  add primary key (TRANSNO);

prompt Deleting TAXREVENUE...
delete from TAXREVENUE;
commit;
prompt Deleting SUBBRANCH...
delete from SUBBRANCH;
commit;
prompt Deleting REVENUE...
delete from REVENUE;
commit;
prompt Deleting REGION...
delete from REGION;
commit;
prompt Deleting RECORDALL...
delete from RECORDALL;
commit;
prompt Deleting PROVINCE...
delete from PROVINCE;
commit;
prompt Deleting PLACCOUNTINSUREDDETAIL...
delete from PLACCOUNTINSUREDDETAIL;
commit;
prompt Loading PLACCOUNTINSUREDDETAIL...
insert into PLACCOUNTINSUREDDETAIL (serno, serialno, transrno, insurcecom, comcode, insuredaccno, paymoney, clientname, clientidtype, clientidno, payresult, prtno, contno, proposalno, flag, paymodetimes, selltype, authrizedyear, paymode, state, remark, socketflag, dealsuccflag, rightflag, makedate, maketime, modifydate, modifytime, standbyflag, bak1, bak2, bak3, bak4, bak5)
values ('1', '0142017-09-13', '10', '014', '86111712', '61323123123213', .23, '张三', '1', '610425199405150618', '8000', null, '10', '10006', '04', null, null, null, '0', '01', null, '0', '0', '0', to_date('13-09-2017', 'dd-mm-yyyy'), '17:53:43', to_date('13-09-2017', 'dd-mm-yyyy'), '17:53:43', '试算成功', null, null, null, null, null);
insert into PLACCOUNTINSUREDDETAIL (serno, serialno, transrno, insurcecom, comcode, insuredaccno, paymoney, clientname, clientidtype, clientidno, payresult, prtno, contno, proposalno, flag, paymodetimes, selltype, authrizedyear, paymode, state, remark, socketflag, dealsuccflag, rightflag, makedate, maketime, modifydate, modifytime, standbyflag, bak1, bak2, bak3, bak4, bak5)
values ('2', '0142017-09-13', '9', '014', '86111712', null, .23, 'zhangsan', '2', '3213', '8000', null, '10', '10005', '04', null, null, null, '0', '01', null, '0', '0', '0', to_date('13-09-2017', 'dd-mm-yyyy'), '18:43:44', to_date('13-09-2017', 'dd-mm-yyyy'), '18:43:44', '试算成功', '310100', null, null, null, null);
commit;
prompt 2 records loaded
prompt Loading PROVINCE...
insert into PROVINCE (provinceid, provincename)
values (1, '北京市');
insert into PROVINCE (provinceid, provincename)
values (2, '天津市');
insert into PROVINCE (provinceid, provincename)
values (3, '河北省');
insert into PROVINCE (provinceid, provincename)
values (4, '山西省');
insert into PROVINCE (provinceid, provincename)
values (5, '内蒙古自治区');
insert into PROVINCE (provinceid, provincename)
values (6, '辽宁省');
insert into PROVINCE (provinceid, provincename)
values (7, '吉林省');
insert into PROVINCE (provinceid, provincename)
values (8, '黑龙江省');
insert into PROVINCE (provinceid, provincename)
values (9, '上海市');
insert into PROVINCE (provinceid, provincename)
values (10, '江苏省');
insert into PROVINCE (provinceid, provincename)
values (11, '浙江省');
insert into PROVINCE (provinceid, provincename)
values (12, '安徽省');
insert into PROVINCE (provinceid, provincename)
values (13, '福建省');
insert into PROVINCE (provinceid, provincename)
values (14, '江西省');
insert into PROVINCE (provinceid, provincename)
values (15, '山东省');
insert into PROVINCE (provinceid, provincename)
values (16, '河南省');
insert into PROVINCE (provinceid, provincename)
values (17, '湖北省');
insert into PROVINCE (provinceid, provincename)
values (18, '湖南省');
insert into PROVINCE (provinceid, provincename)
values (19, '广东省');
insert into PROVINCE (provinceid, provincename)
values (20, '广西壮族自治区');
insert into PROVINCE (provinceid, provincename)
values (21, '海南省');
insert into PROVINCE (provinceid, provincename)
values (22, '重庆市');
insert into PROVINCE (provinceid, provincename)
values (23, '四川省');
insert into PROVINCE (provinceid, provincename)
values (24, '贵州省');
insert into PROVINCE (provinceid, provincename)
values (25, '云南省');
insert into PROVINCE (provinceid, provincename)
values (26, '西藏自治区');
insert into PROVINCE (provinceid, provincename)
values (27, '陕西省');
insert into PROVINCE (provinceid, provincename)
values (28, '甘肃省');
insert into PROVINCE (provinceid, provincename)
values (29, '青海省');
insert into PROVINCE (provinceid, provincename)
values (30, '宁夏回族自治区');
insert into PROVINCE (provinceid, provincename)
values (31, '新疆维吾尔自治区');
insert into PROVINCE (provinceid, provincename)
values (32, '香港特别行政区');
insert into PROVINCE (provinceid, provincename)
values (33, '澳门特别行政区');
insert into PROVINCE (provinceid, provincename)
values (34, '台湾省');
commit;
prompt 34 records loaded
prompt Loading RECORDALL...
prompt Table is empty
prompt Loading REGION...
insert into REGION (regionid, region)
values ('R1', 'CCSS');
insert into REGION (regionid, region)
values ('R2', 'Credit Card');
insert into REGION (regionid, region)
values ('R3', 'Digital');
insert into REGION (regionid, region)
values ('R4', 'EAR');
insert into REGION (regionid, region)
values ('R5', 'NA');
insert into REGION (regionid, region)
values ('R6', 'NOR');
insert into REGION (regionid, region)
values ('R7', 'RBB');
insert into REGION (regionid, region)
values ('R8', 'RCS');
insert into REGION (regionid, region)
values ('R9', 'SOR');
insert into REGION (regionid, region)
values ('R10', 'wealth coach');
commit;
prompt 10 records loaded
prompt Loading REVENUE...
prompt Table is empty
prompt Loading SUBBRANCH...
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S18', 'CDJ', 'C18');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S19', 'CDL', 'C19');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S20', 'CGU', 'C17');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S21', 'CSG', 'C20');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S22', 'CNG', 'C21');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S23', 'CQB', 'C23');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S24', 'CQG', 'C21');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S25', 'CQH', 'C24');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S26', 'CQS', 'C25');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S27', 'DLN', 'C26');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S28', 'DLP', 'C27');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S29', 'DLS', 'C28');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S30', 'DPP', 'C29');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S32', 'DCZ', 'C31');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S33', 'DDF', 'C32');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S34', 'DHM', 'C33');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S35', 'DHZ', 'C34');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S36', 'DJY', 'C35');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S37', 'DLH', 'C36');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S38', 'DMZ', 'C37');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S39', 'DNG', 'C30');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S40', 'DST', 'C38');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S41', 'DSW', 'C39');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S42', 'DYB', 'C40');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S43', 'DZK', 'C41');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S44', 'GCC', 'C46');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S45', 'GCH', 'C45');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S46', 'GDR', 'C47');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S47', 'GDS', 'C50');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S48', 'GFN', 'C158');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S49', 'GFS', 'C159');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S50', 'GHA', 'C51');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S51', 'GHS', 'C52');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S52', 'GHY', 'C53');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S53', 'GJH', 'C54');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S54', 'GJM', 'C55');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S55', 'GMM', 'C56');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S56', 'GPA', 'C57');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S57', 'GQU', 'C58');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S58', 'GQY', 'C59');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S59', 'GSD', 'C160');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S60', 'GSG', 'C60');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S61', 'GTH', 'C61');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S62', 'GTT', 'C62');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S63', 'GUH', 'C63');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S64', 'GXH', 'C64');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S65', 'GYF', 'C65');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S66', 'GYJ', 'C66');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S67', 'GZA', 'C67');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S68', 'GZF', 'C45');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S69', 'GZH', 'C48');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S70', 'GZJ', 'C68');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S71', 'GZQ', 'C69');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S72', 'GZS', 'C70');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S73', 'HAZ', 'C77');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S74', 'HRG', 'C78');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S75', 'HZH', 'C79');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S77', 'SGO', 'C71');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S78', 'SGS', 'C72');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S79', 'SLH', 'C73');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S80', 'SSQ', 'C74');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S81', 'SXL', 'C75');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S82', 'SZU', 'C76');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S83', 'HBB', 'C80');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S84', 'HEF', 'C81');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S85', 'HKP', 'C93');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S86', 'IEH', 'C94');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S87', 'JIN', 'C82');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S88', 'KRN', 'C95');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S89', 'KUM', '83');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S90', 'KWC', 'C82');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S92', 'NGB', 'C85');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S93', 'NHY', 'C153');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S94', 'NJN', 'C86');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S95', 'NJX', 'C87');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S96', 'PUD', 'C97');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S97', 'QDO', 'C88');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S98', 'QHG', 'C89');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S99', 'QSD', 'C90');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S100', 'RGL', 'C98');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S101', 'SAF', 'C99');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S102', 'SCR', 'C100');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S103', 'SCT', 'C101');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S104', 'SCX', 'C102');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S105', 'SEC', 'C129');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S106', 'SFL', 'C118');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S107', 'SGB', 'C82');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S108', 'SGC', 'C82');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S109', 'SGL', 'C103');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S110', 'SHB', 'C104');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S111', 'SHC', 'C105');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S112', 'SHD', 'C106');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S113', 'SHF', 'C107');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S114', 'SHK', 'C108');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S115', 'SHN', 'C109');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S116', 'SHT', 'C110');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S117', 'SHU', 'C111');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S118', 'SHY', 'C112');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S119', 'SHZ', 'C113');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S120', 'SJK', 'C114');
commit;
prompt 100 records committed...
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S121', 'SKP', 'C115');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S122', 'SKS', 'C119');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S123', 'SLY', 'C116');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S124', 'SNI', 'C120');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S126', 'SQH', 'C169');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S127', 'STA', 'C173');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S129', 'SUS', 'C121');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S130', 'SUZ', 'C117');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S131', 'SYA', 'C122');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S132', 'SYH', 'C124');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S133', 'SYW', 'C123');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S134', 'SZF', 'C174');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S135', 'SZJ', 'C135');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S136', 'SZM', 'C165');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S137', 'SZN', 'C128');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S138', 'SZO', 'C166');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S139', 'SZQ', 'C167');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S140', 'TGH', 'C136');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S141', 'TIB', 'C139');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S142', 'TJB', 'C140');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S143', 'TJH', 'C179');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S144', 'TJN', 'C138');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S145', 'TYU', 'C141');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S146', 'WHZ', 'C143');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S147', 'WNW', 'C144');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S148', 'WUN', 'C142');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S149', 'WUX', 'C145');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S150', 'XAK', 'C146');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S151', 'XAX', 'C147');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S152', 'XBI', 'C149');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S153', 'XIA', 'C148');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S154', 'XJA', 'C150');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S155', 'XMH', 'C151');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S156', 'ZHE', 'C152');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S1', 'BCP', 'C4');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S2', 'BCU', 'C5');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S3', 'BGH', 'C6');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S4', 'BHM', 'C7');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S5', 'BJD', 'C8');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S6', 'BJG', 'C3');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S7', 'BJU', 'C9');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S8', 'BJY', 'C10');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S9', 'BLC', 'C11');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S10', 'BLD', 'C12');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S11', 'BNS', 'C13');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S12', 'BTP', 'C14');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S13', 'BWI', 'C15');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S14', 'BWJ', 'C16');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S15', 'BZW', 'C17');
insert into SUBBRANCH (subbranchid, subbranch, cityid)
values ('S17', 'ZGC', 'C155');
commit;
prompt 150 records loaded
prompt Loading TAXREVENUE...
prompt Table is empty
set feedback on
set define on
prompt Done.
