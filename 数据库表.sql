prompt PL/SQL Developer import file
prompt Created on 2017年10月12日 by chen
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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HESITATIONTOBANK
  add primary key (TRANSNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating LCCONT...
create table LCCONT
(
  transno            VARCHAR2(35) not null,
  contno             VARCHAR2(20) not null,
  proposalcontno     VARCHAR2(20),
  prtno              VARCHAR2(20),
  conttype           VARCHAR2(1),
  familytype         VARCHAR2(40),
  familyid           VARCHAR2(200),
  poltype            VARCHAR2(1),
  cardflag           VARCHAR2(1),
  managecom          VARCHAR2(10),
  executecom         VARCHAR2(10),
  agentcom           VARCHAR2(20),
  agentcode          VARCHAR2(10),
  agentgroup         VARCHAR2(40),
  agentcode1         VARCHAR2(200),
  agenttype          VARCHAR2(20),
  insurancecom       VARCHAR2(20),
  insurancemanagecom VARCHAR2(30),
  salechnl           VARCHAR2(2),
  handler            VARCHAR2(20),
  password           VARCHAR2(20),
  appntno            VARCHAR2(24),
  appntname          VARCHAR2(120),
  appntsex           VARCHAR2(1),
  appntbirthday      DATE,
  appntidtype        VARCHAR2(2),
  appntidno          VARCHAR2(20),
  insuredno          VARCHAR2(24),
  insuredname        VARCHAR2(120),
  insuredsex         VARCHAR2(1),
  insuredbirthday    DATE,
  insuredidtype      VARCHAR2(2),
  insuredidno        VARCHAR2(20),
  paylocation        VARCHAR2(1),
  outpayflag         VARCHAR2(20),
  getpolmode         VARCHAR2(1),
  signcom            VARCHAR2(10),
  signdate           DATE,
  signtime           VARCHAR2(8),
  bankcode           VARCHAR2(10),
  bankaccno          VARCHAR2(40),
  accname            VARCHAR2(60),
  printcount         INTEGER,
  losttimes          INTEGER,
  remark             VARCHAR2(1600),
  peoples            INTEGER,
  mult               NUMBER(20,5),
  prem               NUMBER(16,2),
  amnt               NUMBER(16,2),
  sumprem            NUMBER(16,2),
  firstpaydate       DATE,
  approvetime        VARCHAR2(20),
  appflag            VARCHAR2(2),
  polapplydate       DATE,
  state              VARCHAR2(10),
  firsttrialoperator VARCHAR2(10),
  firsttrialdate     DATE,
  firsttrialtime     VARCHAR2(8),
  receiveoperator    VARCHAR2(10),
  receivedate        DATE,
  chargerate         VARCHAR2(8),
  tempfeeno          VARCHAR2(20),
  selltype           VARCHAR2(2),
  forceuwflag        VARCHAR2(1),
  forceuwreason      VARCHAR2(500),
  newbankcode        VARCHAR2(10),
  newbankaccno       VARCHAR2(40),
  newaccname         VARCHAR2(60),
  newpaymode         VARCHAR2(1),
  agentbankcode      VARCHAR2(50),
  bankagent          VARCHAR2(50),
  organcomcode       VARCHAR2(30),
  operator           VARCHAR2(10),
  makedate           DATE,
  maketime           VARCHAR2(10),
  modifydate         DATE,
  modifytime         VARCHAR2(10),
  agentname          VARCHAR2(120),
  grpcontno          VARCHAR2(35),
  receivetime        VARCHAR2(3),
  riskcode           VARCHAR2(40),
  accountbalance     INTEGER,
  debitflag          VARCHAR2(10),
  delayeddebit       DATE,
  hesitationflag     VARCHAR2(10)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column LCCONT.transno
  is '交易流水号';
comment on column LCCONT.contno
  is '投保单号';
comment on column LCCONT.proposalcontno
  is '投保单号';
comment on column LCCONT.prtno
  is '投保单号';
comment on column LCCONT.conttype
  is '默认1';
comment on column LCCONT.poltype
  is '默认0';
comment on column LCCONT.agentcode
  is '理财经理代码';
comment on column LCCONT.insurancecom
  is '保险公司';
comment on column LCCONT.salechnl
  is '默认写死 ';
comment on column LCCONT.appntno
  is '投保人号 序列生成';
comment on column LCCONT.appntname
  is '投保人姓名';
comment on column LCCONT.appntsex
  is '投保人行性别';
comment on column LCCONT.appntbirthday
  is '投保人生日';
comment on column LCCONT.appntidtype
  is '投保人证件类型';
comment on column LCCONT.appntidno
  is '投保人证件号码';
comment on column LCCONT.insuredno
  is '被保人号，序列生成';
comment on column LCCONT.insuredname
  is '被保人姓名';
comment on column LCCONT.insuredsex
  is '被保人性别';
comment on column LCCONT.insuredbirthday
  is '被保人生日';
comment on column LCCONT.insuredidtype
  is '被保人证件类型';
comment on column LCCONT.insuredidno
  is '被保人证件号码';
comment on column LCCONT.getpolmode
  is '投保单递送方式';
comment on column LCCONT.appflag
  is '承保状态 00 默认保存';
comment on column LCCONT.polapplydate
  is '投保日期';
comment on column LCCONT.state
  is '保单状态 默认 0';
comment on column LCCONT.selltype
  is '销售方式默认08';
comment on column LCCONT.forceuwflag
  is '默认 0';
comment on column LCCONT.operator
  is '操作员';
comment on column LCCONT.makedate
  is '创建日期';
comment on column LCCONT.maketime
  is '创建时间';
comment on column LCCONT.modifydate
  is '修改日期';
comment on column LCCONT.modifytime
  is '修改时间';
comment on column LCCONT.agentname
  is '理财经理姓名';
comment on column LCCONT.grpcontno
  is 'cif号';
comment on column LCCONT.receivetime
  is '理财经理手续费比例';
comment on column LCCONT.riskcode
  is '保险产品代码';
comment on column LCCONT.accountbalance
  is '余额';
comment on column LCCONT.debitflag
  is '延迟扣款';
comment on column LCCONT.delayeddebit
  is '延迟扣款日期';
comment on column LCCONT.hesitationflag
  is '犹豫期退保';
alter table LCCONT
  add constraint PK_LCCONT primary key (TRANSNO, CONTNO)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating REVENUE...
create table REVENUE
(
  transno       VARCHAR2(20) not null,
  statement     VARCHAR2(10),
  firstname     VARCHAR2(10),
  lastname      VARCHAR2(10),
  livingaddress VARCHAR2(100),
  cnnativeheath VARCHAR2(100),
  ennativeheath VARCHAR2(100),
  tiveheath     VARCHAR2(10),
  reason1       VARCHAR2(10),
  reason2       VARCHAR2(10),
  reason2desc   VARCHAR2(100),
  bak1          VARCHAR2(100),
  bak2          VARCHAR2(100),
  bak3          VARCHAR2(100),
  liveheath     CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REVENUE
  add primary key (TRANSNO)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for HESITATIONTOBANK...
alter table HESITATIONTOBANK disable all triggers;
prompt Disabling triggers for HESITATIONTOBANKDETAIL...
alter table HESITATIONTOBANKDETAIL disable all triggers;
prompt Disabling triggers for LCCONT...
alter table LCCONT disable all triggers;
prompt Disabling triggers for REVENUE...
alter table REVENUE disable all triggers;
prompt Disabling triggers for TAXREVENUE...
alter table TAXREVENUE disable all triggers;
prompt Deleting TAXREVENUE...
delete from TAXREVENUE;
commit;
prompt Deleting REVENUE...
delete from REVENUE;
commit;
prompt Deleting LCCONT...
delete from LCCONT;
commit;
prompt Deleting HESITATIONTOBANKDETAIL...
delete from HESITATIONTOBANKDETAIL;
commit;
prompt Deleting HESITATIONTOBANK...
delete from HESITATIONTOBANK;
commit;
prompt Loading HESITATIONTOBANK...
insert into HESITATIONTOBANK (transno, insurancecom, bankcode, totalcount, totalmoney, succmoney, succcount, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('63', '014', null, 6, 10000.23, 10000.23, 6, '1', '20171011', null, null, null, null, null, null);
insert into HESITATIONTOBANK (transno, insurancecom, bankcode, totalcount, totalmoney, succmoney, succcount, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('64', '015', null, 0, 0, 0, 0, '1', '20171011', null, null, null, null, null, null);
insert into HESITATIONTOBANK (transno, insurancecom, bankcode, totalcount, totalmoney, succmoney, succcount, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('61', '014', null, 6, 10000.23, 10000.23, 6, '1', '20171011', null, null, null, null, null, null);
insert into HESITATIONTOBANK (transno, insurancecom, bankcode, totalcount, totalmoney, succmoney, succcount, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('62', '015', null, 0, 0, 0, 0, '1', '20171011', null, null, null, null, null, null);
insert into HESITATIONTOBANK (transno, insurancecom, bankcode, totalcount, totalmoney, succmoney, succcount, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('53', '014', null, 6, 10000.23, 10000.23, 6, '1', '20171010', null, null, null, null, null, null);
insert into HESITATIONTOBANK (transno, insurancecom, bankcode, totalcount, totalmoney, succmoney, succcount, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('54', '015', null, 0, 0, 0, 0, '1', '20171010', null, null, null, null, null, null);
insert into HESITATIONTOBANK (transno, insurancecom, bankcode, totalcount, totalmoney, succmoney, succcount, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('65', '014', null, 6, 10000.23, 10000.23, 6, '1', '20171011', null, null, null, null, null, null);
insert into HESITATIONTOBANK (transno, insurancecom, bankcode, totalcount, totalmoney, succmoney, succcount, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('66', '015', null, 0, 0, 0, 0, '1', '20171011', null, null, null, null, null, null);
commit;
prompt 8 records loaded
prompt Loading HESITATIONTOBANKDETAIL...
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('63', '014', '99', '22222226', null, '01', '1', '20170926', '14:36:31', '22222226', '0', 'ybt没有找到投保单号为:22222226的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('63', '014', '99', '22222228', null, '01', '1', '20170926', '14:36:31', '22222228', '0', 'ybt没有找到投保单号为:22222228的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('63', '014', '99', '22222229', 10000, '01', '1', '20170926', '14:36:31', '22222229', '0', 'ybt没有找到投保单号为:22222229的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('63', '014', '99', '22222230', .23, '01', '1', '20170926', '14:36:31', '22222230', '0', 'ybt没有找到投保单号为:22222230的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('63', '014', '99', '22222223', 10000, '01', '1', '20170926', '14:36:31', '22222223', '0', 'ybt没有找到投保单号为:22222223的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('63', '014', '99', '22222225', .23, '01', '1', '20170926', '14:36:31', '22222225', '0', 'ybt没有找到投保单号为:22222225的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('53', '014', '99', '22222226', null, '01', '1', '20170926', '21:27:23', '22222226', '0', 'ybt没有找到投保单号为:22222226的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('53', '014', '99', '22222228', null, '01', '1', '20170926', '21:27:23', '22222228', '0', 'ybt没有找到投保单号为:22222228的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('53', '014', '99', '22222229', 10000, '01', '1', '20170926', '21:27:23', '22222229', '0', 'ybt没有找到投保单号为:22222229的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('53', '014', '99', '22222230', .23, '01', '1', '20170926', '21:27:23', '22222230', '0', 'ybt没有找到投保单号为:22222230的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('61', '014', '99', '22222223', 10000, '01', '1', '20170926', '13:10:00', '22222223', '0', 'ybt没有找到投保单号为:22222223的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('61', '014', '99', '22222225', .23, '01', '1', '20170926', '13:10:00', '22222225', '0', 'ybt没有找到投保单号为:22222225的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('53', '014', '99', '22222223', 10000, '01', '1', '20170926', '21:27:22', '22222223', '0', 'ybt没有找到投保单号为:22222223的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('53', '014', '99', '22222225', .23, '01', '1', '20170926', '21:27:23', '22222225', '0', 'ybt没有找到投保单号为:22222225的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('61', '014', '99', '22222226', null, '01', '1', '20170926', '13:10:00', '22222226', '0', 'ybt没有找到投保单号为:22222226的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('61', '014', '99', '22222228', null, '01', '1', '20170926', '13:10:00', '22222228', '0', 'ybt没有找到投保单号为:22222228的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('61', '014', '99', '22222229', 10000, '01', '1', '20170926', '13:10:00', '22222229', '0', 'ybt没有找到投保单号为:22222229的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('61', '014', '99', '22222230', .23, '01', '1', '20170926', '13:10:00', '22222230', '0', 'ybt没有找到投保单号为:22222230的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('65', '014', '99', '22222226', null, '01', '1', '20170926', '14:38:38', '22222226', '0', 'ybt没有找到投保单号为:22222226的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('65', '014', '99', '22222228', null, '01', '1', '20170926', '14:38:38', '22222228', '0', 'ybt没有找到投保单号为:22222228的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('65', '014', '99', '22222229', 10000, '01', '1', '20170926', '14:38:38', '22222229', '0', 'ybt没有找到投保单号为:22222229的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('65', '014', '99', '22222230', .23, '01', '1', '20170926', '14:38:38', '22222230', '0', 'ybt没有找到投保单号为:22222230的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('65', '014', '99', '22222223', 10000, '01', '1', '20170926', '14:38:38', '22222223', '0', 'ybt没有找到投保单号为:22222223的数据', null, null);
insert into HESITATIONTOBANKDETAIL (transno, insurancecom, bankcode, proposalcontno, hesitationmoney, succflag, state, makedate, maketime, bak1, bak2, bak3, bak4, bak5)
values ('65', '014', '99', '22222225', .23, '01', '1', '20170926', '14:38:38', '22222225', '0', 'ybt没有找到投保单号为:22222225的数据', null, null);
commit;
prompt 24 records loaded
prompt Loading LCCONT...
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance, debitflag, delayeddebit, hesitationflag)
values ('63', '22222232', '22222232', null, '1', null, null, '0', null, null, null, null, '43540444', null, null, null, '014', null, '3', null, null, '64', '张三', '0', to_date('06-09-2017', 'dd-mm-yyyy'), '2', '147896325', '63', '张三', '0', to_date('06-01-2017', 'dd-mm-yyyy'), '2', '147896325', null, null, '2', null, null, null, null, '61', null, null, null, null, null, null, 100000, .32, null, null, null, '02', to_date('27-09-2017', 'dd-mm-yyyy'), '01', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, '10', null, '63', 'admin', to_date('11-10-2017', 'dd-mm-yyyy'), '09:54:25', to_date('11-10-2017 20:26:13', 'dd-mm-yyyy hh24:mi:ss'), '2017-10-11', 'Mai,Wei Dong', '123456', '100', 'LeCh', 63, '0', null, '0');
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance, debitflag, delayeddebit, hesitationflag)
values ('65', '10', '10', null, '1', null, null, '0', null, null, null, null, '43536391', null, null, null, '014', null, '3', null, null, '65', '1', '1', to_date('29-09-2017', 'dd-mm-yyyy'), '3', '1', '64', '1', '1', to_date('29-01-2017', 'dd-mm-yyyy'), '3', '1', null, null, '1', null, null, null, null, '61', null, null, null, null, null, null, 1, .32, null, null, null, '00', to_date('27-09-2017', 'dd-mm-yyyy'), '01', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, '10', null, '65', 'admin', to_date('30-09-2017', 'dd-mm-yyyy'), '10:28:45', to_date('30-09-2017', 'dd-mm-yyyy'), '10:50:36', 'Wang,Lei', '123456', '100', '003', 63, '1', to_date('29-09-2017', 'dd-mm-yyyy'), '0');
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance, debitflag, delayeddebit, hesitationflag)
values ('83', '11', '11', null, '1', null, null, '0', null, '458', null, null, '001', null, null, null, '014', null, '3', null, null, '82', '1', '1', to_date('30-08-2017', 'dd-mm-yyyy'), '2', '1', '82', '1', '1', to_date('30-08-2017', 'dd-mm-yyyy'), '2', '1', null, null, '1', null, null, null, null, '61', null, null, null, null, null, null, null, null, null, null, null, '01', to_date('30-09-2017', 'dd-mm-yyyy'), '00', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, null, null, null, 'admin', to_date('30-09-2017', 'dd-mm-yyyy'), '15:23:44', to_date('30-09-2017 16:25:56', 'dd-mm-yyyy hh24:mi:ss'), '2017-09-30', 'Chung,Yu-Feng', '123456', '100', null, 63, '0', null, '0');
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance, debitflag, delayeddebit, hesitationflag)
values ('62', '22222231', '22222231', null, '1', null, null, '0', null, null, null, null, '43540444', null, null, null, '014', null, '3', null, null, '63', '张三', '0', to_date('06-09-2017', 'dd-mm-yyyy'), '1', '610425199405150618', '62', '张三', '0', to_date('06-01-2017', 'dd-mm-yyyy'), '1', '610425199405150618', null, null, '1', null, null, null, null, '61', null, null, null, null, null, null, .23, .32, null, null, null, '04', to_date('26-09-2017', 'dd-mm-yyyy'), '01', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, '10', null, '62', 'admin', to_date('26-09-2017', 'dd-mm-yyyy'), '20:23:31', to_date('26-09-2017', 'dd-mm-yyyy'), '19:39:57', 'Mai,Wei Dong', '123456', '100', '003', 63, '0', null, '0');
commit;
prompt 4 records loaded
prompt Loading REVENUE...
insert into REVENUE (transno, statement, firstname, lastname, livingaddress, cnnativeheath, ennativeheath, tiveheath, reason1, reason2, reason2desc, bak1, bak2, bak3, liveheath)
values ('62', '1,2', 'zhang', 'san', 'zhongguo&shanxi&xian&xianyang', '中国&陕西&西安&咸阳', 'zhongguo &shanxi&xian&xxianyang', null, '1,2', null, '没有原因', null, null, null, '1');
commit;
prompt 1 records loaded
prompt Loading TAXREVENUE...
insert into TAXREVENUE (transno, residentcountry, residentnumber, residentdesc, bak1, bak2, bak3)
values ('62', '456', '654', null, null, null, null);
insert into TAXREVENUE (transno, residentcountry, residentnumber, residentdesc, bak1, bak2, bak3)
values ('62', '789', '321', null, null, null, null);
insert into TAXREVENUE (transno, residentcountry, residentnumber, residentdesc, bak1, bak2, bak3)
values ('62', '123', '987', null, null, null, null);
commit;
prompt 3 records loaded
prompt Enabling triggers for HESITATIONTOBANK...
alter table HESITATIONTOBANK enable all triggers;
prompt Enabling triggers for HESITATIONTOBANKDETAIL...
alter table HESITATIONTOBANKDETAIL enable all triggers;
prompt Enabling triggers for LCCONT...
alter table LCCONT enable all triggers;
prompt Enabling triggers for REVENUE...
alter table REVENUE enable all triggers;
prompt Enabling triggers for TAXREVENUE...
alter table TAXREVENUE enable all triggers;
set feedback on
set define on
prompt Done.
