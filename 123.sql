prompt PL/SQL Developer import file
prompt Created on 2017年9月15日 by suojinyu
set feedback off
set define off
prompt Creating PROVINCE...
create table PROVINCE
(
  provinceid   NUMBER(5) not null,
  provincename VARCHAR2(50)
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
alter table PROVINCE
  add primary key (PROVINCEID)
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

prompt Creating CITY...
create table CITY
(
  cityid     NUMBER(5) not null,
  cityname   VARCHAR2(50),
  zipcode    VARCHAR2(50),
  provinceid NUMBER(5)
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
alter table CITY
  add primary key (CITYID)
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
alter table CITY
  add constraint FOR_PROVINCEID foreign key (PROVINCEID)
  references PROVINCE (PROVINCEID) on delete cascade;

prompt Creating COUNTY...
create table COUNTY
(
  countyid   NUMBER(5) not null,
  countyname VARCHAR2(50),
  cityid     NUMBER(5)
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
alter table COUNTY
  add primary key (COUNTYID)
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
alter table COUNTY
  add constraint FOR_CITYID foreign key (CITYID)
  references CITY (CITYID) on delete cascade;

prompt Creating IMPARTCONTENT...
create table IMPARTCONTENT
(
  contnoimpartcode VARCHAR2(40) not null,
  transno          VARCHAR2(20),
  contno           VARCHAR2(20),
  insuredcompany   VARCHAR2(1000),
  impartcode       VARCHAR2(1000),
  insuredimpart    VARCHAR2(1000),
  ownerimpart      VARCHAR2(1000),
  insuredyesorno   VARCHAR2(2),
  owneryesorno     VARCHAR2(2)
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
alter table IMPARTCONTENT
  add constraint PK_IMPARTCONTENT primary key (CONTNOIMPARTCODE)
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

prompt Creating LCACCOUNTINFO...
create table LCACCOUNTINFO
(
  transno        VARCHAR2(30) not null,
  insurcecom     VARCHAR2(30) not null,
  proposalcontno VARCHAR2(30) not null,
  riskcode       VARCHAR2(30) not null,
  accno          VARCHAR2(30) not null,
  accrate        VARCHAR2(30),
  bak1           VARCHAR2(30),
  bak2           VARCHAR2(130),
  bak3           VARCHAR2(120),
  bak4           VARCHAR2(30),
  bak5           VARCHAR2(30)
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
comment on column LCACCOUNTINFO.transno
  is '交易号';
comment on column LCACCOUNTINFO.insurcecom
  is 'CIFID';
comment on column LCACCOUNTINFO.proposalcontno
  is '投保单号';
comment on column LCACCOUNTINFO.riskcode
  is '险种代码';
comment on column LCACCOUNTINFO.accno
  is '账号类型代码';
comment on column LCACCOUNTINFO.bak1
  is 'POLNO';
alter table LCACCOUNTINFO
  add constraint PK_LCACCOUNTINFO primary key (TRANSNO, PROPOSALCONTNO, RISKCODE, ACCNO)
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

prompt Creating LCADDRESS...
create table LCADDRESS
(
  transno       VARCHAR2(35) not null,
  customerno    VARCHAR2(24) not null,
  addressno     INTEGER not null,
  postaladdress VARCHAR2(1000),
  zipcode       VARCHAR2(6),
  phone         VARCHAR2(30),
  homeaddress   VARCHAR2(1000),
  homezipcode   VARCHAR2(6),
  homephone     VARCHAR2(30),
  mobile        VARCHAR2(30),
  email         VARCHAR2(160),
  operator      VARCHAR2(50) not null,
  makedate      VARCHAR2(10) not null,
  maketime      VARCHAR2(10) not null,
  modifydate    VARCHAR2(10) not null,
  modifytime    VARCHAR2(10) not null,
  otheraddress  VARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column LCADDRESS.addressno
  is '地址序号         0投保人 1被保人     ';
alter table LCADDRESS
  add constraint PK_LCADDRESS primary key (TRANSNO, CUSTOMERNO, ADDRESSNO)
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

prompt Creating LCAPPNT...
create table LCAPPNT
(
  transno             VARCHAR2(35) not null,
  contno              VARCHAR2(20) not null,
  prtno               VARCHAR2(20),
  appntno             VARCHAR2(20),
  relationtolcinsured VARCHAR2(2),
  appntstartdate      DATE,
  appntname           VARCHAR2(120) not null,
  appntsex            VARCHAR2(1),
  appntbirthday       DATE,
  appntenddate        DATE,
  idtype              VARCHAR2(2),
  idno                VARCHAR2(20),
  nativeplace         VARCHAR2(3),
  idsubmit            VARCHAR2(2),
  rgtaddress          VARCHAR2(80),
  health              VARCHAR2(6),
  stature             NUMBER(5,2),
  avoirdupois         NUMBER(5,2),
  creditgrade         VARCHAR2(1),
  bankcode            VARCHAR2(10),
  bankaccno           VARCHAR2(40),
  accname             VARCHAR2(60),
  salary              NUMBER(12,2),
  occupationcode      VARCHAR2(10),
  company             VARCHAR2(40),
  responsibility      VARCHAR2(80),
  managecom           VARCHAR2(10),
  operator            VARCHAR2(10),
  makedate            DATE,
  maketime            VARCHAR2(10),
  modifydate          DATE,
  modifytime          VARCHAR2(10),
  grpcontno           VARCHAR2(20)
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
comment on column LCAPPNT.transno
  is '交易流水号';
comment on column LCAPPNT.contno
  is '投保单号';
comment on column LCAPPNT.prtno
  is '投保单号';
comment on column LCAPPNT.appntno
  is '投保人号';
comment on column LCAPPNT.relationtolcinsured
  is '与被保人的关系';
comment on column LCAPPNT.appntstartdate
  is '投保人证件有效起期';
comment on column LCAPPNT.appntname
  is '投保人姓名';
comment on column LCAPPNT.appntsex
  is '投保人性别';
comment on column LCAPPNT.appntbirthday
  is '投保人生日';
comment on column LCAPPNT.appntenddate
  is '投保人证件有效止期';
comment on column LCAPPNT.idtype
  is '证件类型';
comment on column LCAPPNT.idno
  is '证件号码';
comment on column LCAPPNT.nativeplace
  is '国籍';
comment on column LCAPPNT.idsubmit
  is '是否提交标识';
comment on column LCAPPNT.rgtaddress
  is '投保人年收入';
comment on column LCAPPNT.health
  is '有无健康标识';
comment on column LCAPPNT.stature
  is '身高';
comment on column LCAPPNT.avoirdupois
  is '体重';
comment on column LCAPPNT.creditgrade
  is '投保人居住类型';
comment on column LCAPPNT.salary
  is '投保人工资';
comment on column LCAPPNT.occupationcode
  is '投保人职业编码';
comment on column LCAPPNT.company
  is '投保人工作单位及名称';
comment on column LCAPPNT.responsibility
  is '职位及工作内容';
comment on column LCAPPNT.makedate
  is '创建日期';
comment on column LCAPPNT.maketime
  is '创建时间';
comment on column LCAPPNT.modifydate
  is '修改时间';
comment on column LCAPPNT.modifytime
  is '修改日期';
comment on column LCAPPNT.grpcontno
  is 'cif';
alter table LCAPPNT
  add constraint PK_LCAPPNT primary key (TRANSNO, CONTNO)
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

prompt Creating LCBNF...
create table LCBNF
(
  transno           VARCHAR2(35) not null,
  contno            VARCHAR2(20),
  polno             VARCHAR2(20) not null,
  insuredno         VARCHAR2(24) not null,
  bnftype           VARCHAR2(1) not null,
  bnfno             INTEGER not null,
  bnfgrade          VARCHAR2(1) not null,
  relationtoinsured VARCHAR2(2),
  bnflot            NUMBER(10,4),
  customerno        VARCHAR2(24),
  name              VARCHAR2(120),
  sex               VARCHAR2(1),
  birthday          DATE,
  idtype            VARCHAR2(2),
  idno              VARCHAR2(20),
  getform           VARCHAR2(1),
  getbankcode       VARCHAR2(10),
  getbankaccno      VARCHAR2(40),
  getaccname        VARCHAR2(60),
  operator          VARCHAR2(10),
  makedate          DATE,
  maketime          VARCHAR2(8),
  modifydate        DATE,
  modifytime        VARCHAR2(8)
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
alter table LCBNF
  add constraint PK_LCBNF primary key (POLNO, INSUREDNO, BNFTYPE, BNFNO, BNFGRADE, TRANSNO)
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
  accountbalance     INTEGER
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

prompt Creating LCINSURED...
create table LCINSURED
(
  transno                  VARCHAR2(35) not null,
  contno                   VARCHAR2(20) not null,
  insuredno                VARCHAR2(24) not null,
  prtno                    VARCHAR2(20),
  appntno                  VARCHAR2(20),
  managecom                VARCHAR2(10),
  executecom               VARCHAR2(10),
  relationtoappnt          VARCHAR2(2),
  lcinsuredname            VARCHAR2(120),
  lcinsuredsex             VARCHAR2(1),
  lcinsuredbirthday        DATE,
  lcinsuredidtype          VARCHAR2(2),
  lcinsuredidno            VARCHAR2(20),
  insureidenddate          DATE,
  insureidstartdate        DATE,
  lcinsurednativeplace     VARCHAR2(3),
  lcinsuredidsubmit        VARCHAR2(2),
  rgtaddress               VARCHAR2(80),
  health                   VARCHAR2(6),
  stature                  NUMBER(5,2),
  avoirdupois              NUMBER(5,2),
  lcinsuredrgtaddress      NUMBER(12,2),
  lcinsuredcompany         VARCHAR2(40),
  lcinsuredresponsibility  VARCHAR2(80),
  lcinsuredroccupationcode VARCHAR2(10),
  operator                 VARCHAR2(10),
  makedate                 DATE,
  maketime                 VARCHAR2(10),
  modifydate               DATE,
  modifytime               VARCHAR2(10),
  grpcontno                VARCHAR2(20) not null
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
comment on column LCINSURED.transno
  is '交易流水号';
comment on column LCINSURED.contno
  is '投保单号';
comment on column LCINSURED.insuredno
  is '被保人号';
comment on column LCINSURED.prtno
  is '投保单号';
comment on column LCINSURED.appntno
  is '投保人号';
comment on column LCINSURED.managecom
  is '机构代码';
comment on column LCINSURED.executecom
  is '机构代码';
comment on column LCINSURED.relationtoappnt
  is '与投保人的关系';
comment on column LCINSURED.lcinsuredname
  is '被保人姓名';
comment on column LCINSURED.lcinsuredsex
  is '被保人性别';
comment on column LCINSURED.lcinsuredbirthday
  is '被保人生日';
comment on column LCINSURED.lcinsuredidtype
  is '被保人证件类型';
comment on column LCINSURED.lcinsuredidno
  is '被保人证件号码';
comment on column LCINSURED.insureidenddate
  is '证件有效止期';
comment on column LCINSURED.insureidstartdate
  is '证件有效起期';
comment on column LCINSURED.lcinsurednativeplace
  is '被保人国籍';
comment on column LCINSURED.health
  is '被保人健康标识';
comment on column LCINSURED.stature
  is '身高';
comment on column LCINSURED.avoirdupois
  is '体重';
comment on column LCINSURED.lcinsuredcompany
  is '被保人工作单位及名称';
comment on column LCINSURED.lcinsuredresponsibility
  is '被保人职业及工作内容';
comment on column LCINSURED.lcinsuredroccupationcode
  is '被保人职业代码';
comment on column LCINSURED.operator
  is '操作员';
comment on column LCINSURED.makedate
  is '创建日期';
comment on column LCINSURED.maketime
  is '创建时间';
comment on column LCINSURED.modifydate
  is '修改日期';
comment on column LCINSURED.modifytime
  is '修改时间';
comment on column LCINSURED.grpcontno
  is 'cif';
alter table LCINSURED
  add constraint PK_LCINSURED primary key (CONTNO, TRANSNO)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 320K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating LCPOL...
create table LCPOL
(
  transno            VARCHAR2(35) not null,
  grpcontno          VARCHAR2(20),
  grppolno           VARCHAR2(20),
  contno             VARCHAR2(20),
  polno              VARCHAR2(20) not null,
  proposalno         VARCHAR2(20) not null,
  prtno              VARCHAR2(20),
  conttype           VARCHAR2(20),
  poltypeflag        VARCHAR2(20),
  mainpolno          VARCHAR2(20),
  masterpolno        VARCHAR2(20),
  kindcode           VARCHAR2(20),
  riskcode           VARCHAR2(20) not null,
  riskversion        VARCHAR2(20),
  managecom          VARCHAR2(20),
  agentcom           VARCHAR2(20),
  agenttype          VARCHAR2(20),
  agentcode          VARCHAR2(100),
  agentgroup         VARCHAR2(120),
  agentcode1         VARCHAR2(20),
  insurancecom       VARCHAR2(20),
  insurancemanagecom VARCHAR2(30),
  salechnl           VARCHAR2(20),
  handler            VARCHAR2(20),
  insuredno          VARCHAR2(24),
  insuredname        VARCHAR2(120),
  insuredsex         VARCHAR2(20),
  insuredbirthday    DATE,
  insuredappage      INTEGER,
  insuredpeoples     INTEGER,
  occupationtype     VARCHAR2(50),
  appntno            VARCHAR2(24),
  appntname          VARCHAR2(120),
  cvalidate          DATE,
  signcom            VARCHAR2(20),
  signdate           DATE,
  signtime           VARCHAR2(20),
  firstpaydate       DATE,
  payenddate         DATE,
  paytodate          DATE,
  getstartdate       DATE,
  enddate            DATE,
  accienddate        DATE,
  getyearflag        VARCHAR2(2),
  getyear            INTEGER,
  payendyearflag     VARCHAR2(2),
  payendyear         VARCHAR2(5),
  insuyearflag       VARCHAR2(2),
  insuyear           VARCHAR2(5),
  acciyearflag       VARCHAR2(2),
  acciyear           INTEGER,
  getstarttype       VARCHAR2(2),
  specifyvalidate    VARCHAR2(2),
  paymode            VARCHAR2(2),
  paylocation        VARCHAR2(2),
  payintv            VARCHAR2(5),
  payyears           INTEGER,
  years              INTEGER,
  managefeerate      FLOAT,
  floatrate          NUMBER(16,10),
  premtoamnt         VARCHAR2(1),
  mult               NUMBER(20,5) not null,
  standprem          NUMBER(12,2) not null,
  prem               NUMBER(12,2) not null,
  sumprem            NUMBER(12,2) not null,
  amnt               NUMBER(12,2) not null,
  riskamnt           NUMBER(12,2) not null,
  leavingmoney       NUMBER(12,2),
  endorsetimes       INTEGER,
  claimtimes         INTEGER,
  livetimes          INTEGER,
  renewcount         INTEGER,
  lastgetdate        DATE,
  lastloandate       DATE,
  lastregetdate      DATE,
  lastedordate       DATE,
  lastrevdate        DATE,
  rnewflag           VARCHAR2(50),
  stopflag           VARCHAR2(1),
  expiryflag         VARCHAR2(1),
  autopayflag        VARCHAR2(1),
  interestdifflag    VARCHAR2(1),
  subflag            VARCHAR2(1),
  bnfflag            VARCHAR2(1),
  healthcheckflag    VARCHAR2(1),
  impartflag         VARCHAR2(1),
  reinsureflag       VARCHAR2(1),
  agentpayflag       VARCHAR2(1),
  agentgetflag       VARCHAR2(1),
  livegetmode        VARCHAR2(1),
  deadgetmode        VARCHAR2(1),
  bonusgetmode       VARCHAR2(1),
  bonusman           VARCHAR2(1),
  deadflag           VARCHAR2(1),
  smokeflag          VARCHAR2(1),
  remark             VARCHAR2(300),
  approveflag        VARCHAR2(1),
  approvecode        VARCHAR2(40),
  approvedate        DATE,
  approvetime        VARCHAR2(8),
  uwflag             VARCHAR2(1),
  uwcode             VARCHAR2(10),
  uwdate             DATE,
  uwtime             VARCHAR2(8),
  polapplydate       DATE,
  appflag            VARCHAR2(2),
  polstate           VARCHAR2(10),
  standbyflag1       VARCHAR2(10),
  standbyflag2       VARCHAR2(10),
  standbyflag3       VARCHAR2(10),
  waitperiod         INTEGER,
  getform            VARCHAR2(1),
  getbankcode        VARCHAR2(10),
  getbankaccno       VARCHAR2(40),
  getaccname         VARCHAR2(60),
  keepvalueopt       VARCHAR2(1),
  payrulecode        VARCHAR2(2),
  ascriptionrulecode VARCHAR2(2),
  autopubaccflag     VARCHAR2(1),
  ascriptionflag     VARCHAR2(1),
  investrulecode     VARCHAR2(20),
  uintlinkvaliflag   VARCHAR2(2),
  operator           VARCHAR2(50) not null,
  makedate           DATE not null,
  maketime           VARCHAR2(8) not null,
  modifydate         DATE not null,
  modifytime         VARCHAR2(8) not null,
  bonuspaymode       VARCHAR2(20),
  getintv            VARCHAR2(20),
  getstartage        VARCHAR2(20),
  getendage          VARCHAR2(20),
  fullbonusgetmode   VARCHAR2(20),
  autorenewflag      VARCHAR2(20),
  setflag            VARCHAR2(20),
  setcycleflag       VARCHAR2(20),
  setcycle           VARCHAR2(20),
  setno              VARCHAR2(20),
  setmoney           VARCHAR2(20),
  bak1               VARCHAR2(120),
  bak2               VARCHAR2(20),
  bak3               VARCHAR2(20),
  bak4               VARCHAR2(20),
  bak5               VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table LCPOL
  is '个人险种表';
comment on column LCPOL.prtno
  is '冗余，标准在个人保单表
第3,4位的意义如下：
11：个人印刷号码
12：集体印刷号码
15：银行险印刷号码';
comment on column LCPOL.conttype
  is '险种类型';
comment on column LCPOL.masterpolno
  is '在无名单补名单的时候，存补的无名单的号码。';
comment on column LCPOL.agentcom
  is '通过该字段对应银行专有属性表(可能是银行信息表）';
comment on column LCPOL.agenttype
  is '对不同的代理机构号进行内部的分类。
柜员
';
comment on column LCPOL.salechnl
  is '1-个人营销,2-团险直销,3-银行代理';
comment on column LCPOL.insuredname
  is '冗余，标准在个人客户表';
comment on column LCPOL.insuredsex
  is '冗余，标准在个人客户表';
comment on column LCPOL.insuredbirthday
  is '冗余，标准在个人客户表';
comment on column LCPOL.occupationtype
  is '冗余，标准在个人客户表';
comment on column LCPOL.appntname
  is '冗余，标准在个人客户表';
comment on column LCPOL.firstpaydate
  is '为责任表中最早的首交日期';
comment on column LCPOL.payenddate
  is '为责任表中最晚的终交日期';
comment on column LCPOL.getstartdate
  is '为责任表中最早的起领日期';
comment on column LCPOL.enddate
  is '为责任表中最晚的终止日期';
comment on column LCPOL.accienddate
  is '为责任表中最晚的意外责任终止日期';
comment on column LCPOL.payendyearflag
  is 'A－年龄，M－月，D－日，Y－年';
comment on column LCPOL.insuyearflag
  is '保险期间分类';
comment on column LCPOL.getstarttype
  is '生日对应日或者保单生效对应日
0 --生日对应
1 --起保对应
';
comment on column LCPOL.paymode
  is '0--老系统数据补录
1--现金
2--现金送款簿
3--支票
4--银行转帐（非制返盘）
5--内部转帐
6--POS收款
7--银行代扣（制返盘）
8--邮政业务
9--银行收款"
';
comment on column LCPOL.payintv
  is '交费间隔
-1 -- 不定期交,
0  -- 趸交,
1  -- 月交
3  -- 季交
6  -- 半年交
12 -- 年交
';
comment on column LCPOL.payyears
  is '对于终交年期标志为“年”：  表示需要交费的年数。
对于终交年期标志为“月”：  表示需要交费的月数
对于终交年期标志为“日”：  表示需要交费的天数
对于终交年期标志为“年龄”：该字段存放将根据年龄折算成的需要交费的年数。
';
comment on column LCPOL.years
  is '保险责任区间';
comment on column LCPOL.claimtimes
  is '该字段记录立案的次数。只要立案了就认为进行理赔了，在该字段上加1。
';
comment on column LCPOL.renewcount
  is 'n --续保n次,n>0';
comment on column LCPOL.stopflag
  is '0 --正常
1 --停交
';
comment on column LCPOL.expiryflag
  is '0 --正常
1 --满期,
2 --死亡续领
';
comment on column LCPOL.bnfflag
  is '0 -- 生存受益人
1 -- 死亡受益人';
comment on column LCPOL.impartflag
  is '0 --没有健康告知
1 --有健康告知
';
comment on column LCPOL.reinsureflag
  is '0 --不需要商业分保
1 --需要商业分保';
comment on column LCPOL.agentgetflag
  is '0 ---表示补通过银行代付
1 ---表示通过银行代付
';
comment on column LCPOL.livegetmode
  is '1--累积生息
2--领取现金
3--抵缴保费
4--其他
5--增额交清
';
comment on column LCPOL.deadgetmode
  is '1--累积生息
2--领取现金
3--抵缴保费
4--其他
5--增额交清
';
comment on column LCPOL.bonusgetmode
  is '1--累积生息
2--领取现金
3--抵缴保费
4--其他
5--增额交清
';
comment on column LCPOL.bonusman
  is '0 －－ 同投保人
1 －－ 同被保人';
comment on column LCPOL.deadflag
  is '1 被保人死亡标志
2 投保人死亡标志
';
comment on column LCPOL.approveflag
  is '0 －－ 未复核
1 －－ 复核没有通过
9 －－ 复核通过
';
comment on column LCPOL.appflag
  is '0 - 投保
1 - 承保
2 - 团体保单增人后未生效状态 或 新增附加险未生效状态
4 - 终止
9 - 附加险自动续保期间';
comment on column LCPOL.standbyflag1
  is '根据不同险种的特殊要求，存放不同的数据
对于险种编码：311603，存放的是同心卡的开卡日期';
comment on column LCPOL.standbyflag2
  is '根据不同险种的特殊要求，存放不同的数据
银代险的内部优惠标志：（该字段对所有银代险有效）
1 默认 其他
0 民生
';
comment on column LCPOL.standbyflag3
  is '根据不同险种的特殊要求，存放不同的数据';
comment on column LCPOL.getform
  is '0：银行转帐
1：自行领取（上柜领取）
2：网上支付';
comment on column LCPOL.uintlinkvaliflag
  is '记录客户选择的投连账户生效的信息，在录入时进行信息记录，在签单时进行业务逻辑处理
1－个单生效日生效（约定时间）
2－签单日生效（系统时间）
3－财务到账日
4－过犹豫期后生效';
comment on column LCPOL.bak1
  is '险种名称';
alter table LCPOL
  add constraint PK_LCPOL primary key (POLNO, TRANSNO)
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

prompt Creating LDCUSTOMER...
create table LDCUSTOMER
(
  ldcustomerno   VARCHAR2(100) not null,
  cifid          VARCHAR2(30) not null,
  fullname       VARCHAR2(22),
  formername     VARCHAR2(22),
  idtype         VARCHAR2(30),
  idnumber       VARCHAR2(150),
  idexpiry       VARCHAR2(30),
  age            VARCHAR2(30),
  gender         VARCHAR2(10),
  censusregister VARCHAR2(10),
  maritalstatus  VARCHAR2(22),
  contactphoneno VARCHAR2(100),
  mobilephoneno  VARCHAR2(100),
  callback       VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table LDCUSTOMER
  add primary key (LDCUSTOMERNO)
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
alter table LDCUSTOMER
  add constraint AAA unique (CIFID)
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

prompt Creating LDCUSTOMERACCOUNT...
create table LDCUSTOMERACCOUNT
(
  countno        VARCHAR2(100) not null,
  ldcustomerno   VARCHAR2(100),
  cifid          VARCHAR2(100),
  accountnumber  VARCHAR2(100),
  accountccy     VARCHAR2(100),
  accountbalance VARCHAR2(100),
  accountstatus  VARCHAR2(100),
  bak1           VARCHAR2(50),
  bak2           VARCHAR2(50),
  bak3           VARCHAR2(50),
  bak4           VARCHAR2(50),
  bak5           VARCHAR2(50),
  bak6           VARCHAR2(50),
  bak7           VARCHAR2(50),
  bak8           VARCHAR2(50),
  bak9           VARCHAR2(50),
  bak10          VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table LDCUSTOMERACCOUNT
  add primary key (COUNTNO)
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

prompt Creating LDCUSTOMERADDRESS...
create table LDCUSTOMERADDRESS
(
  ldcustomerno               VARCHAR2(100) not null,
  cifid                      VARCHAR2(100) not null,
  residentialaddresstype     VARCHAR2(100),
  residentialprovince        VARCHAR2(100),
  residentialcity            VARCHAR2(100),
  residentialdistrict        VARCHAR2(100),
  residentialdetailedaddress VARCHAR2(100),
  residentialpostcode        VARCHAR2(100),
  contactaddresstype         VARCHAR2(100),
  contactprovince            VARCHAR2(100),
  contactcity                VARCHAR2(100),
  contactdistrict            VARCHAR2(100),
  contactdetailedaddress     VARCHAR2(100),
  contactpostcode            VARCHAR2(100),
  homeaddresstype            VARCHAR2(100),
  homeprovince               VARCHAR2(100),
  homecity                   VARCHAR2(100),
  homedistrict               VARCHAR2(100),
  homedetailedaddress        VARCHAR2(100),
  homepostcode               VARCHAR2(100),
  permanentaddresstype       VARCHAR2(100),
  permanentprovince          VARCHAR2(100),
  permanentcity              VARCHAR2(100),
  permanentdistrict          VARCHAR2(100),
  permanentdetailedaddress   VARCHAR2(100),
  permanentpostcode          VARCHAR2(100),
  previouaddresstype         VARCHAR2(100),
  previouprovince            VARCHAR2(100),
  previoucity                VARCHAR2(100),
  previoudistrict            VARCHAR2(100),
  previoudetailedaddress     VARCHAR2(100),
  previoupostcode            VARCHAR2(100),
  previoucompany             VARCHAR2(100),
  previoucompanyaddress      VARCHAR2(100),
  previouposition            VARCHAR2(100),
  previouindustrytype        VARCHAR2(100),
  previouoccupation          VARCHAR2(100),
  previouemailaddress        VARCHAR2(100),
  previouincome              VARCHAR2(100),
  previoumaritalstatus       VARCHAR2(100),
  previouheight              VARCHAR2(100),
  previouweight              VARCHAR2(100),
  previouincomesource        VARCHAR2(100),
  previouwealthsource        VARCHAR2(100),
  previoutelephonesource     VARCHAR2(100),
  previouhealthcare          VARCHAR2(100),
  previoufamilyincome        VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table LDCUSTOMERADDRESS
  add constraint CCC primary key (CIFID)
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

prompt Creating LDOCCUPATION...
create table LDOCCUPATION
(
  occupationcode VARCHAR2(10) not null,
  occupationname VARCHAR2(120),
  occupationtype VARCHAR2(10),
  worktype       VARCHAR2(10),
  workname       VARCHAR2(60),
  medrate        INTEGER,
  suddrisk       VARCHAR2(30),
  disearisk      VARCHAR2(30),
  hosiprisk      VARCHAR2(30)
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
comment on column LDOCCUPATION.occupationtype
  is '对于正常的职业类别，都采用大于0的数字。
对于非正常的职业类别，都采用小于0的数字。
-1 －－ 拒保
-2 －－ 特殊费率
';
comment on column LDOCCUPATION.workname
  is '保险公司代码';
comment on column LDOCCUPATION.medrate
  is '对于正常的比例，都采用大于0的数字。
标准费用使用1
对于非正常的比例，都采用小于0的数字。
1 －－ 标准费率
-1－－ 拒保
-2－－ 未定义
';
alter table LDOCCUPATION
  add constraint PK_LDOCCUPATION primary key (OCCUPATIONCODE)
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
  add constraint PK_PLACCOUNTINSUREDDETAIL primary key (SERNO, SERIALNO, TRANSRNO)
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

prompt Disabling triggers for PROVINCE...
alter table PROVINCE disable all triggers;
prompt Disabling triggers for CITY...
alter table CITY disable all triggers;
prompt Disabling triggers for COUNTY...
alter table COUNTY disable all triggers;
prompt Disabling triggers for IMPARTCONTENT...
alter table IMPARTCONTENT disable all triggers;
prompt Disabling triggers for LCACCOUNTINFO...
alter table LCACCOUNTINFO disable all triggers;
prompt Disabling triggers for LCADDRESS...
alter table LCADDRESS disable all triggers;
prompt Disabling triggers for LCAPPNT...
alter table LCAPPNT disable all triggers;
prompt Disabling triggers for LCBNF...
alter table LCBNF disable all triggers;
prompt Disabling triggers for LCCONT...
alter table LCCONT disable all triggers;
prompt Disabling triggers for LCINSURED...
alter table LCINSURED disable all triggers;
prompt Disabling triggers for LCPOL...
alter table LCPOL disable all triggers;
prompt Disabling triggers for LDCUSTOMER...
alter table LDCUSTOMER disable all triggers;
prompt Disabling triggers for LDCUSTOMERACCOUNT...
alter table LDCUSTOMERACCOUNT disable all triggers;
prompt Disabling triggers for LDCUSTOMERADDRESS...
alter table LDCUSTOMERADDRESS disable all triggers;
prompt Disabling triggers for LDOCCUPATION...
alter table LDOCCUPATION disable all triggers;
prompt Disabling triggers for PLACCOUNTINSUREDDETAIL...
alter table PLACCOUNTINSUREDDETAIL disable all triggers;
prompt Disabling foreign key constraints for CITY...
alter table CITY disable constraint FOR_PROVINCEID;
prompt Disabling foreign key constraints for COUNTY...
alter table COUNTY disable constraint FOR_CITYID;
prompt Deleting PLACCOUNTINSUREDDETAIL...
delete from PLACCOUNTINSUREDDETAIL;
commit;
prompt Deleting LDOCCUPATION...
delete from LDOCCUPATION;
commit;
prompt Deleting LDCUSTOMERADDRESS...
delete from LDCUSTOMERADDRESS;
commit;
prompt Deleting LDCUSTOMERACCOUNT...
delete from LDCUSTOMERACCOUNT;
commit;
prompt Deleting LDCUSTOMER...
delete from LDCUSTOMER;
commit;
prompt Deleting LCPOL...
delete from LCPOL;
commit;
prompt Deleting LCINSURED...
delete from LCINSURED;
commit;
prompt Deleting LCCONT...
delete from LCCONT;
commit;
prompt Deleting LCBNF...
delete from LCBNF;
commit;
prompt Deleting LCAPPNT...
delete from LCAPPNT;
commit;
prompt Deleting LCADDRESS...
delete from LCADDRESS;
commit;
prompt Deleting LCACCOUNTINFO...
delete from LCACCOUNTINFO;
commit;
prompt Deleting IMPARTCONTENT...
delete from IMPARTCONTENT;
commit;
prompt Deleting COUNTY...
delete from COUNTY;
commit;
prompt Deleting CITY...
delete from CITY;
commit;
prompt Deleting PROVINCE...
delete from PROVINCE;
commit;
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
prompt Loading CITY...
insert into CITY (cityid, cityname, zipcode, provinceid)
values (170, '黄石市', '435000', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (171, '十堰市', '442000', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (172, '宜昌市', '443000', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (173, '襄樊市', '441000', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (174, '鄂州市', '436000', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (175, '荆门市', '448000', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (176, '孝感市', '432100', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (177, '荆州市', '434000', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (178, '黄冈市', '438000', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (179, '咸宁市', '437000', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (180, '随州市', '441300', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (181, '恩施土家族苗族自治州', '445000', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (182, '神农架', '442400', 17);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (183, '长沙市', '410000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (184, '株洲市', '412000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (185, '湘潭市', '411100', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (186, '衡阳市', '421000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (187, '邵阳市', '422000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (188, '岳阳市', '414000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (189, '常德市', '415000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (190, '张家界市', '427000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (191, '益阳市', '413000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (192, '郴州市', '423000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (193, '永州市', '425000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (194, '怀化市', '418000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (195, '娄底市', '417000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (196, '湘西土家族苗族自治州', '416000', 18);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (197, '广州市', '510000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (198, '韶关市', '521000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (199, '深圳市', '518000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (200, '珠海市', '519000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (201, '汕头市', '515000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (202, '佛山市', '528000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (203, '江门市', '529000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (204, '湛江市', '524000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (205, '茂名市', '525000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (206, '肇庆市', '526000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (207, '惠州市', '516000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (208, '梅州市', '514000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (209, '汕尾市', '516600', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (210, '河源市', '517000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (211, '阳江市', '529500', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (212, '清远市', '511500', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (213, '东莞市', '511700', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (214, '中山市', '528400', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (215, '潮州市', '515600', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (216, '揭阳市', '522000', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (217, '云浮市', '527300', 19);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (218, '南宁市', '530000', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (219, '柳州市', '545000', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (220, '桂林市', '541000', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (221, '梧州市', '543000', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (222, '北海市', '536000', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (223, '防城港市', '538000', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (224, '钦州市', '535000', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (225, '贵港市', '537100', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (226, '玉林市', '537000', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (227, '百色市', '533000', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (228, '贺州市', '542800', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (229, '河池市', '547000', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (230, '来宾市', '546100', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (231, '崇左市', '532200', 20);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (232, '海口市', '570000', 21);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (233, '三亚市', '572000', 21);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (234, '重庆市', '400000', 22);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (235, '成都市', '610000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (236, '自贡市', '643000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (237, '攀枝花市', '617000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (238, '泸州市', '646100', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (239, '德阳市', '618000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (240, '绵阳市', '621000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (241, '广元市', '628000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (242, '遂宁市', '629000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (243, '内江市', '641000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (244, '乐山市', '614000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (245, '南充市', '637000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (246, '眉山市', '612100', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (247, '宜宾市', '644000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (248, '广安市', '638000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (249, '达州市', '635000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (250, '雅安市', '625000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (251, '巴中市', '635500', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (252, '资阳市', '641300', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (253, '阿坝藏族羌族自治州', '624600', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (254, '甘孜藏族自治州', '626000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (255, '凉山彝族自治州', '615000', 23);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (256, '贵阳市', '55000', 24);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (257, '六盘水市', '553000', 24);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (258, '遵义市', '563000', 24);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (259, '安顺市', '561000', 24);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (260, '铜仁地区', '554300', 24);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (261, '黔西南布依族苗族自治州', '551500', 24);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (262, '毕节地区', '551700', 24);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (263, '黔东南苗族侗族自治州', '551500', 24);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (264, '黔南布依族苗族自治州', '550100', 24);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (265, '昆明市', '650000', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (266, '曲靖市', '655000', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (267, '玉溪市', '653100', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (268, '保山市', '678000', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (269, '昭通市', '657000', 25);
commit;
prompt 100 records committed...
insert into CITY (cityid, cityname, zipcode, provinceid)
values (270, '丽江市', '674100', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (271, '思茅市', '665000', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (272, '临沧市', '677000', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (273, '楚雄彝族自治州', '675000', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (274, '红河哈尼族彝族自治州', '654400', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (275, '文山壮族苗族自治州', '663000', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (276, '西双版纳傣族自治州', '666200', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (277, '大理白族自治州', '671000', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (278, '德宏傣族景颇族自治州', '678400', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (279, '怒江傈僳族自治州', '671400', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (280, '迪庆藏族自治州', '674400', 25);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (281, '拉萨市', '850000', 26);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (282, '昌都地区', '854000', 26);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (283, '山南地区', '856000', 26);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (284, '日喀则地区', '857000', 26);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (285, '那曲地区', '852000', 26);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (286, '阿里地区', '859100', 26);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (287, '林芝地区', '860100', 26);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (288, '西安市', '710000', 27);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (289, '铜川市', '727000', 27);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (290, '宝鸡市', '721000', 27);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (291, '咸阳市', '712000', 27);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (292, '渭南市', '714000', 27);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (293, '延安市', '716000', 27);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (294, '汉中市', '723000', 27);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (295, '榆林市', '719000', 27);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (296, '安康市', '725000', 27);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (297, '商洛市', '711500', 27);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (298, '兰州市', '730000', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (299, '嘉峪关市', '735100', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (300, '金昌市', '737100', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (301, '白银市', '730900', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (302, '天水市', '741000', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (303, '武威市', '733000', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (304, '张掖市', '734000', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (305, '平凉市', '744000', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (306, '酒泉市', '735000', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (307, '庆阳市', '744500', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (308, '定西市', '743000', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (309, '陇南市', '742100', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (310, '临夏回族自治州', '731100', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (311, '甘南藏族自治州', '747000', 28);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (312, '西宁市', '810000', 29);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (313, '海东地区', '810600', 29);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (314, '海北藏族自治州', '810300', 29);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (315, '黄南藏族自治州', '811300', 29);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (316, '海南藏族自治州', '813000', 29);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (317, '果洛藏族自治州', '814000', 29);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (318, '玉树藏族自治州', '815000', 29);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (319, '海西蒙古族藏族自治州', '817000', 29);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (320, '银川市', '750000', 30);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (321, '石嘴山市', '753000', 30);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (322, '吴忠市', '751100', 30);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (323, '固原市', '756000', 30);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (324, '中卫市', '751700', 30);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (325, '乌鲁木齐市', '830000', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (326, '克拉玛依市', '834000', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (327, '吐鲁番地区', '838000', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (328, '哈密地区', '839000', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (329, '昌吉回族自治州', '831100', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (330, '博尔塔拉蒙古自治州', '833400', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (331, '巴音郭楞蒙古自治州', '841000', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (332, '阿克苏地区', '843000', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (333, '克孜勒苏柯尔克孜自治州', '835600', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (334, '喀什地区', '844000', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (335, '和田地区', '848000', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (336, '伊犁哈萨克自治州', '833200', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (337, '塔城地区', '834700', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (338, '阿勒泰地区', '836500', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (339, '石河子市', '832000', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (340, '阿拉尔市', '843300', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (341, '图木舒克市', '843900', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (342, '五家渠市', '831300', 31);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (343, '香港特别行政区', '000000', 32);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (344, '澳门特别行政区', '000000', 33);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (345, '台湾省', '000000', 34);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (1, '北京市', '100000', 1);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (2, '天津市', '100000', 2);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (3, '石家庄市', '050000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (4, '唐山市', '063000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (5, '秦皇岛市', '066000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (6, '邯郸市', '056000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (7, '邢台市', '054000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (8, '保定市', '071000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (9, '张家口市', '075000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (10, '承德市', '067000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (11, '沧州市', '061000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (12, '廊坊市', '065000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (13, '衡水市', '053000', 3);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (14, '太原市', '030000', 4);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (15, '大同市', '037000', 4);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (16, '阳泉市', '045000', 4);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (17, '长治市', '046000', 4);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (18, '晋城市', '048000', 4);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (19, '朔州市', '036000', 4);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (20, '晋中市', '030600', 4);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (21, '运城市', '044000', 4);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (22, '忻州市', '034000', 4);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (23, '临汾市', '041000', 4);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (24, '吕梁市', '030500', 4);
commit;
prompt 200 records committed...
insert into CITY (cityid, cityname, zipcode, provinceid)
values (25, '呼和浩特市', '010000', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (26, '包头市', '014000', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (27, '乌海市', '016000', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (28, '赤峰市', '024000', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (29, '通辽市', '028000', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (30, '鄂尔多斯市', '010300', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (31, '呼伦贝尔市', '021000', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (32, '巴彦淖尔市', '014400', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (33, '乌兰察布市', '011800', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (34, '兴安盟', '137500', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (35, '锡林郭勒盟', '011100', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (36, '阿拉善盟', '016000', 5);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (37, '沈阳市', '110000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (38, '大连市', '116000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (39, '鞍山市', '114000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (40, '抚顺市', '113000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (41, '本溪市', '117000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (42, '丹东市', '118000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (43, '锦州市', '121000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (44, '营口市', '115000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (45, '阜新市', '123000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (46, '辽阳市', '111000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (47, '盘锦市', '124000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (48, '铁岭市', '112000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (49, '朝阳市', '122000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (50, '葫芦岛市', '125000', 6);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (51, '长春市', '130000', 7);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (52, '吉林市', '132000', 7);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (53, '四平市', '136000', 7);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (54, '辽源市', '136200', 7);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (55, '通化市', '134000', 7);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (56, '白山市', '134300', 7);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (57, '松原市', '131100', 7);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (58, '白城市', '137000', 7);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (59, '延边朝鲜族自治州', '133000', 7);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (60, '哈尔滨市', '150000', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (61, '齐齐哈尔市', '161000', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (62, '鸡西市', '158100', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (63, '鹤岗市', '154100', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (64, '双鸭山市', '155100', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (65, '大庆市', '163000', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (66, '伊春市', '152300', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (67, '佳木斯市', '154000', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (68, '七台河市', '154600', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (69, '牡丹江市', '157000', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (70, '黑河市', '164300', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (71, '绥化市', '152000', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (72, '大兴安岭地区', '165000', 8);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (73, '上海市', '200000', 9);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (74, '南京市', '210000', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (75, '无锡市', '214000', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (76, '徐州市', '221000', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (77, '常州市', '213000', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (78, '苏州市', '215000', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (79, '南通市', '226000', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (80, '连云港市', '222000', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (81, '淮安市', '223200', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (82, '盐城市', '224000', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (83, '扬州市', '225000', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (84, '镇江市', '212000', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (85, '泰州市', '225300', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (86, '宿迁市', '223800', 10);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (87, '杭州市', '310000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (88, '宁波市', '315000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (89, '温州市', '325000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (90, '嘉兴市', '314000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (91, '湖州市', '313000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (92, '绍兴市', '312000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (93, '金华市', '321000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (94, '衢州市', '324000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (95, '舟山市', '316000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (96, '台州市', '318000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (97, '丽水市', '323000', 11);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (98, '合肥市', '230000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (99, '芜湖市', '241000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (100, '蚌埠市', '233000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (101, '淮南市', '232000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (102, '马鞍山市', '243000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (103, '淮北市', '235000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (104, '铜陵市', '244000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (105, '安庆市', '246000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (106, '黄山市', '242700', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (107, '滁州市', '239000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (108, '阜阳市', '236100', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (109, '宿州市', '234100', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (110, '巢湖市', '238000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (111, '六安市', '237000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (112, '亳州市', '236800', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (113, '池州市', '247100', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (114, '宣城市', '366000', 12);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (115, '福州市', '350000', 13);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (116, '厦门市', '361000', 13);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (117, '莆田市', '351100', 13);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (118, '三明市', '365000', 13);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (119, '泉州市', '362000', 13);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (120, '漳州市', '363000', 13);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (121, '南平市', '353000', 13);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (122, '龙岩市', '364000', 13);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (123, '宁德市', '352100', 13);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (124, '南昌市', '330000', 14);
commit;
prompt 300 records committed...
insert into CITY (cityid, cityname, zipcode, provinceid)
values (125, '景德镇市', '333000', 14);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (126, '萍乡市', '337000', 14);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (127, '九江市', '332000', 14);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (128, '新余市', '338000', 14);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (129, '鹰潭市', '335000', 14);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (130, '赣州市', '341000', 14);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (131, '吉安市', '343000', 14);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (132, '宜春市', '336000', 14);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (133, '抚州市', '332900', 14);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (134, '上饶市', '334000', 14);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (135, '济南市', '250000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (136, '青岛市', '266000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (137, '淄博市', '255000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (138, '枣庄市', '277100', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (139, '东营市', '257000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (140, '烟台市', '264000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (141, '潍坊市', '261000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (142, '济宁市', '272100', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (143, '泰安市', '271000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (144, '威海市', '265700', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (145, '日照市', '276800', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (146, '莱芜市', '271100', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (147, '临沂市', '276000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (148, '德州市', '253000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (149, '聊城市', '252000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (150, '滨州市', '256600', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (151, '荷泽市', '255000', 15);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (152, '郑州市', '450000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (153, '开封市', '475000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (154, '洛阳市', '471000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (155, '平顶山市', '467000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (156, '安阳市', '454900', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (157, '鹤壁市', '456600', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (158, '新乡市', '453000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (159, '焦作市', '454100', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (160, '濮阳市', '457000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (161, '许昌市', '461000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (162, '漯河市', '462000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (163, '三门峡市', '472000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (164, '南阳市', '473000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (165, '商丘市', '476000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (166, '信阳市', '464000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (167, '周口市', '466000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (168, '驻马店市', '463000', 16);
insert into CITY (cityid, cityname, zipcode, provinceid)
values (169, '武汉市', '430000', 17);
commit;
prompt 345 records loaded
prompt Loading COUNTY...
insert into COUNTY (countyid, countyname, cityid)
values (1950, '昭平县', 228);
insert into COUNTY (countyid, countyname, cityid)
values (2296, '丹寨县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2297, '都匀市', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2298, '福泉市', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2299, '荔波县', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2300, '贵定县', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2301, '瓮安县', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2302, '独山县', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2303, '平塘县', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2304, '罗甸县', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2305, '长顺县', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2306, '龙里县', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2307, '惠水县', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2308, '三都水族自治县', 264);
insert into COUNTY (countyid, countyname, cityid)
values (2309, '五华区', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2310, '盘龙区', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2311, '官渡区', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2312, '西山区', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2313, '东川区', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2314, '呈贡县', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2315, '晋宁县', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2316, '富民县', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2317, '宜良县', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2318, '石林彝族自治县', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2319, '嵩明县', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2320, '禄劝彝族苗族自治县', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2321, '寻甸回族彝族自治县', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2322, '安宁市', 265);
insert into COUNTY (countyid, countyname, cityid)
values (2323, '麒麟区', 266);
insert into COUNTY (countyid, countyname, cityid)
values (2324, '马龙县', 266);
insert into COUNTY (countyid, countyname, cityid)
values (2325, '陆良县', 266);
insert into COUNTY (countyid, countyname, cityid)
values (2326, '师宗县', 266);
insert into COUNTY (countyid, countyname, cityid)
values (2327, '罗平县', 266);
insert into COUNTY (countyid, countyname, cityid)
values (2328, '富源县', 266);
insert into COUNTY (countyid, countyname, cityid)
values (2329, '会泽县', 266);
insert into COUNTY (countyid, countyname, cityid)
values (2330, '沾益县', 266);
insert into COUNTY (countyid, countyname, cityid)
values (2331, '宣威市', 266);
insert into COUNTY (countyid, countyname, cityid)
values (2332, '红塔区', 267);
insert into COUNTY (countyid, countyname, cityid)
values (2333, '江川县', 267);
insert into COUNTY (countyid, countyname, cityid)
values (2334, '澄江县', 267);
insert into COUNTY (countyid, countyname, cityid)
values (2335, '通海县', 267);
insert into COUNTY (countyid, countyname, cityid)
values (2336, '华宁县', 267);
insert into COUNTY (countyid, countyname, cityid)
values (2337, '易门县', 267);
insert into COUNTY (countyid, countyname, cityid)
values (2338, '峨山彝族自治县', 267);
insert into COUNTY (countyid, countyname, cityid)
values (2339, '新平彝族傣族自治县', 267);
insert into COUNTY (countyid, countyname, cityid)
values (2340, '元江哈尼族彝族傣族自治县', 267);
insert into COUNTY (countyid, countyname, cityid)
values (2341, '隆阳区', 268);
insert into COUNTY (countyid, countyname, cityid)
values (2342, '施甸县', 268);
insert into COUNTY (countyid, countyname, cityid)
values (2343, '腾冲县', 268);
insert into COUNTY (countyid, countyname, cityid)
values (2344, '龙陵县', 268);
insert into COUNTY (countyid, countyname, cityid)
values (2345, '昌宁县', 268);
insert into COUNTY (countyid, countyname, cityid)
values (2346, '昭阳区', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2347, '鲁甸县', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2348, '巧家县', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2349, '盐津县', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2350, '大关县', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2351, '永善县', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2352, '绥江县', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2353, '镇雄县', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2354, '彝良县', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2355, '威信县', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2356, '水富县', 269);
insert into COUNTY (countyid, countyname, cityid)
values (2357, '古城区', 270);
insert into COUNTY (countyid, countyname, cityid)
values (2358, '玉龙纳西族自治县', 270);
insert into COUNTY (countyid, countyname, cityid)
values (2359, '永胜县', 270);
insert into COUNTY (countyid, countyname, cityid)
values (2360, '华坪县', 270);
insert into COUNTY (countyid, countyname, cityid)
values (2361, '宁蒗彝族自治县', 270);
insert into COUNTY (countyid, countyname, cityid)
values (2362, '翠云区', 271);
insert into COUNTY (countyid, countyname, cityid)
values (2363, '普洱哈尼族彝族自治县', 271);
insert into COUNTY (countyid, countyname, cityid)
values (2364, '墨江哈尼族自治县', 271);
insert into COUNTY (countyid, countyname, cityid)
values (2365, '景东彝族自治县', 271);
insert into COUNTY (countyid, countyname, cityid)
values (2366, '景谷傣族彝族自治县', 271);
insert into COUNTY (countyid, countyname, cityid)
values (2367, '镇沅彝族哈尼族拉祜族自治县', 271);
insert into COUNTY (countyid, countyname, cityid)
values (2368, '江城哈尼族彝族自治县', 271);
insert into COUNTY (countyid, countyname, cityid)
values (2369, '孟连傣族拉祜族佤族自治县', 271);
insert into COUNTY (countyid, countyname, cityid)
values (2370, '澜沧拉祜族自治县', 271);
insert into COUNTY (countyid, countyname, cityid)
values (2371, '西盟佤族自治县', 271);
insert into COUNTY (countyid, countyname, cityid)
values (2372, '临翔区', 272);
insert into COUNTY (countyid, countyname, cityid)
values (2373, '凤庆县', 272);
insert into COUNTY (countyid, countyname, cityid)
values (2374, '云县', 272);
insert into COUNTY (countyid, countyname, cityid)
values (2375, '永德县', 272);
insert into COUNTY (countyid, countyname, cityid)
values (2376, '镇康县', 272);
insert into COUNTY (countyid, countyname, cityid)
values (2377, '双江拉祜族佤族布朗族傣族自治县', 272);
insert into COUNTY (countyid, countyname, cityid)
values (2378, '耿马傣族佤族自治县', 272);
insert into COUNTY (countyid, countyname, cityid)
values (2379, '沧源佤族自治县', 272);
insert into COUNTY (countyid, countyname, cityid)
values (2380, '楚雄市', 273);
insert into COUNTY (countyid, countyname, cityid)
values (2381, '双柏县', 273);
insert into COUNTY (countyid, countyname, cityid)
values (2382, '牟定县', 273);
insert into COUNTY (countyid, countyname, cityid)
values (2383, '南华县', 273);
insert into COUNTY (countyid, countyname, cityid)
values (2384, '姚安县', 273);
insert into COUNTY (countyid, countyname, cityid)
values (2385, '大姚县', 273);
insert into COUNTY (countyid, countyname, cityid)
values (2386, '永仁县', 273);
insert into COUNTY (countyid, countyname, cityid)
values (2387, '元谋县', 273);
insert into COUNTY (countyid, countyname, cityid)
values (2388, '武定县', 273);
insert into COUNTY (countyid, countyname, cityid)
values (2389, '禄丰县', 273);
insert into COUNTY (countyid, countyname, cityid)
values (2390, '个旧市', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2391, '开远市', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2392, '蒙自县', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2393, '屏边苗族自治县', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2394, '建水县', 274);
commit;
prompt 100 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (2395, '石屏县', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2396, '弥勒县', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2397, '泸西县', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2398, '元阳县', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2399, '红河县', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2400, '金平苗族瑶族傣族自治县', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2401, '绿春县', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2402, '河口瑶族自治县', 274);
insert into COUNTY (countyid, countyname, cityid)
values (2403, '文山县', 275);
insert into COUNTY (countyid, countyname, cityid)
values (2404, '砚山县', 275);
insert into COUNTY (countyid, countyname, cityid)
values (2405, '西畴县', 275);
insert into COUNTY (countyid, countyname, cityid)
values (2406, '麻栗坡县', 275);
insert into COUNTY (countyid, countyname, cityid)
values (2407, '马关县', 275);
insert into COUNTY (countyid, countyname, cityid)
values (2408, '丘北县', 275);
insert into COUNTY (countyid, countyname, cityid)
values (2409, '广南县', 275);
insert into COUNTY (countyid, countyname, cityid)
values (2410, '富宁县', 275);
insert into COUNTY (countyid, countyname, cityid)
values (2411, '景洪市', 276);
insert into COUNTY (countyid, countyname, cityid)
values (2412, '勐海县', 276);
insert into COUNTY (countyid, countyname, cityid)
values (2413, '勐腊县', 276);
insert into COUNTY (countyid, countyname, cityid)
values (2414, '大理市', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2415, '漾濞彝族自治县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2416, '祥云县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2417, '宾川县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2418, '弥渡县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2419, '南涧彝族自治县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2420, '巍山彝族回族自治县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2421, '永平县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2422, '云龙县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2423, '洱源县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2424, '剑川县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2425, '鹤庆县', 277);
insert into COUNTY (countyid, countyname, cityid)
values (2426, '瑞丽市', 278);
insert into COUNTY (countyid, countyname, cityid)
values (2427, '潞西市', 278);
insert into COUNTY (countyid, countyname, cityid)
values (2428, '梁河县', 278);
insert into COUNTY (countyid, countyname, cityid)
values (2429, '盈江县', 278);
insert into COUNTY (countyid, countyname, cityid)
values (2430, '陇川县', 278);
insert into COUNTY (countyid, countyname, cityid)
values (2431, '泸水县', 279);
insert into COUNTY (countyid, countyname, cityid)
values (2432, '福贡县', 279);
insert into COUNTY (countyid, countyname, cityid)
values (2433, '贡山独龙族怒族自治县', 279);
insert into COUNTY (countyid, countyname, cityid)
values (2434, '兰坪白族普米族自治县', 279);
insert into COUNTY (countyid, countyname, cityid)
values (2435, '香格里拉县', 280);
insert into COUNTY (countyid, countyname, cityid)
values (2436, '德钦县', 280);
insert into COUNTY (countyid, countyname, cityid)
values (2437, '维西傈僳族自治县', 280);
insert into COUNTY (countyid, countyname, cityid)
values (2438, '城关区', 281);
insert into COUNTY (countyid, countyname, cityid)
values (2439, '林周县', 281);
insert into COUNTY (countyid, countyname, cityid)
values (2440, '当雄县', 281);
insert into COUNTY (countyid, countyname, cityid)
values (2441, '尼木县', 281);
insert into COUNTY (countyid, countyname, cityid)
values (2442, '曲水县', 281);
insert into COUNTY (countyid, countyname, cityid)
values (2443, '堆龙德庆县', 281);
insert into COUNTY (countyid, countyname, cityid)
values (2444, '达孜县', 281);
insert into COUNTY (countyid, countyname, cityid)
values (2445, '墨竹工卡县', 281);
insert into COUNTY (countyid, countyname, cityid)
values (2446, '昌都县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2447, '江达县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2448, '贡觉县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2449, '类乌齐县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2450, '丁青县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2451, '察雅县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2452, '八宿县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2453, '左贡县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2454, '芒康县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2455, '洛隆县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2456, '边坝县', 282);
insert into COUNTY (countyid, countyname, cityid)
values (2457, '乃东县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2458, '扎囊县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2459, '贡嘎县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2460, '桑日县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2461, '琼结县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2462, '曲松县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2463, '措美县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2464, '洛扎县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2465, '加查县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2466, '隆子县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2467, '错那县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2468, '浪卡子县', 283);
insert into COUNTY (countyid, countyname, cityid)
values (2469, '日喀则市', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2470, '南木林县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2471, '江孜县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2472, '定日县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2473, '萨迦县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2474, '拉孜县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2475, '昂仁县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2476, '谢通门县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2477, '白朗县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2478, '仁布县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2479, '康马县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2480, '定结县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2481, '仲巴县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2482, '亚东县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2483, '吉隆县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2484, '聂拉木县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2486, '岗巴县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2487, '那曲县', 285);
insert into COUNTY (countyid, countyname, cityid)
values (2488, '嘉黎县', 285);
insert into COUNTY (countyid, countyname, cityid)
values (2489, '比如县', 285);
insert into COUNTY (countyid, countyname, cityid)
values (2490, '聂荣县', 285);
insert into COUNTY (countyid, countyname, cityid)
values (2491, '安多县', 285);
insert into COUNTY (countyid, countyname, cityid)
values (2492, '申扎县', 285);
insert into COUNTY (countyid, countyname, cityid)
values (2493, '索县', 285);
insert into COUNTY (countyid, countyname, cityid)
values (2494, '班戈县', 285);
insert into COUNTY (countyid, countyname, cityid)
values (2495, '巴青县', 285);
commit;
prompt 200 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (2496, '尼玛县', 285);
insert into COUNTY (countyid, countyname, cityid)
values (2497, '普兰县', 286);
insert into COUNTY (countyid, countyname, cityid)
values (2498, '札达县', 286);
insert into COUNTY (countyid, countyname, cityid)
values (2499, '噶尔县', 286);
insert into COUNTY (countyid, countyname, cityid)
values (2500, '日土县', 286);
insert into COUNTY (countyid, countyname, cityid)
values (2501, '革吉县', 286);
insert into COUNTY (countyid, countyname, cityid)
values (2502, '改则县', 286);
insert into COUNTY (countyid, countyname, cityid)
values (2503, '措勤县', 286);
insert into COUNTY (countyid, countyname, cityid)
values (2504, '林芝县', 287);
insert into COUNTY (countyid, countyname, cityid)
values (2505, '工布江达县', 287);
insert into COUNTY (countyid, countyname, cityid)
values (2506, '米林县', 287);
insert into COUNTY (countyid, countyname, cityid)
values (2507, '墨脱县', 287);
insert into COUNTY (countyid, countyname, cityid)
values (2508, '波密县', 287);
insert into COUNTY (countyid, countyname, cityid)
values (2509, '察隅县', 287);
insert into COUNTY (countyid, countyname, cityid)
values (2510, '朗县', 287);
insert into COUNTY (countyid, countyname, cityid)
values (2511, '新城区', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2512, '碑林区', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2513, '莲湖区', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2514, '灞桥区', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2515, '未央区', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2516, '雁塔区', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2517, '阎良区', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2518, '临潼区', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2519, '长安区', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2520, '蓝田县', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2521, '周至县', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2522, '户县', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2523, '高陵县', 288);
insert into COUNTY (countyid, countyname, cityid)
values (2524, '王益区', 289);
insert into COUNTY (countyid, countyname, cityid)
values (2525, '印台区', 289);
insert into COUNTY (countyid, countyname, cityid)
values (2526, '耀州区', 289);
insert into COUNTY (countyid, countyname, cityid)
values (2527, '宜君县', 289);
insert into COUNTY (countyid, countyname, cityid)
values (2528, '渭滨区', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2529, '金台区', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2530, '陈仓区', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2531, '凤翔县', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2532, '岐山县', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2533, '扶风县', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2534, '眉县', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2535, '陇县', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2536, '千阳县', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2537, '麟游县', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2538, '凤县', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2539, '太白县', 290);
insert into COUNTY (countyid, countyname, cityid)
values (2540, '秦都区', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2541, '杨凌区', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2542, '渭城区', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2543, '三原县', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2544, '泾阳县', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2545, '乾县', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2546, '礼泉县', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2547, '永寿县', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2548, '彬县', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2549, '长武县', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2550, '旬邑县', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2551, '淳化县', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2552, '武功县', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2553, '兴平市', 291);
insert into COUNTY (countyid, countyname, cityid)
values (2554, '临渭区', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2555, '华县', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2556, '潼关县', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2557, '大荔县', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2558, '合阳县', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2559, '澄城县', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2560, '蒲城县', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2561, '白水县', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2562, '富平县', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2563, '韩城市', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2564, '华阴市', 292);
insert into COUNTY (countyid, countyname, cityid)
values (2565, '宝塔区', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2566, '延长县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2567, '延川县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2568, '子长县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2569, '安塞县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2570, '志丹县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2571, '吴旗县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2572, '甘泉县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2573, '富县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2574, '洛川县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2575, '宜川县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2576, '黄龙县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2577, '黄陵县', 293);
insert into COUNTY (countyid, countyname, cityid)
values (2578, '汉台区', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2579, '南郑县', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2580, '城固县', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2581, '洋县', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2582, '西乡县', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2583, '勉县', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2584, '宁强县', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2585, '略阳县', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2586, '镇巴县', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2587, '留坝县', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2588, '佛坪县', 294);
insert into COUNTY (countyid, countyname, cityid)
values (2589, '榆阳区', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2590, '神木县', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2591, '府谷县', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2592, '横山县', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2593, '靖边县', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2594, '定边县', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2595, '绥德县', 295);
commit;
prompt 300 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (2596, '米脂县', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2597, '佳县', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2598, '吴堡县', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2599, '清涧县', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2600, '子洲县', 295);
insert into COUNTY (countyid, countyname, cityid)
values (2601, '汉滨区', 296);
insert into COUNTY (countyid, countyname, cityid)
values (2602, '汉阴县', 296);
insert into COUNTY (countyid, countyname, cityid)
values (2603, '石泉县', 296);
insert into COUNTY (countyid, countyname, cityid)
values (2604, '宁陕县', 296);
insert into COUNTY (countyid, countyname, cityid)
values (2605, '紫阳县', 296);
insert into COUNTY (countyid, countyname, cityid)
values (2606, '岚皋县', 296);
insert into COUNTY (countyid, countyname, cityid)
values (2607, '平利县', 296);
insert into COUNTY (countyid, countyname, cityid)
values (2608, '镇坪县', 296);
insert into COUNTY (countyid, countyname, cityid)
values (2609, '旬阳县', 296);
insert into COUNTY (countyid, countyname, cityid)
values (2610, '白河县', 296);
insert into COUNTY (countyid, countyname, cityid)
values (2611, '商州区', 297);
insert into COUNTY (countyid, countyname, cityid)
values (2612, '洛南县', 297);
insert into COUNTY (countyid, countyname, cityid)
values (2613, '丹凤县', 297);
insert into COUNTY (countyid, countyname, cityid)
values (2614, '商南县', 297);
insert into COUNTY (countyid, countyname, cityid)
values (2615, '山阳县', 297);
insert into COUNTY (countyid, countyname, cityid)
values (2616, '镇安县', 297);
insert into COUNTY (countyid, countyname, cityid)
values (2617, '柞水县', 297);
insert into COUNTY (countyid, countyname, cityid)
values (2618, '城关区', 298);
insert into COUNTY (countyid, countyname, cityid)
values (2619, '七里河区', 298);
insert into COUNTY (countyid, countyname, cityid)
values (2620, '西固区', 298);
insert into COUNTY (countyid, countyname, cityid)
values (2621, '安宁区', 298);
insert into COUNTY (countyid, countyname, cityid)
values (2622, '红古区', 298);
insert into COUNTY (countyid, countyname, cityid)
values (2623, '永登县', 298);
insert into COUNTY (countyid, countyname, cityid)
values (2624, '皋兰县', 298);
insert into COUNTY (countyid, countyname, cityid)
values (2625, '榆中县', 298);
insert into COUNTY (countyid, countyname, cityid)
values (2626, '金川区', 300);
insert into COUNTY (countyid, countyname, cityid)
values (2627, '永昌县', 300);
insert into COUNTY (countyid, countyname, cityid)
values (2628, '白银区', 301);
insert into COUNTY (countyid, countyname, cityid)
values (2629, '平川区', 301);
insert into COUNTY (countyid, countyname, cityid)
values (2630, '靖远县', 301);
insert into COUNTY (countyid, countyname, cityid)
values (2631, '会宁县', 301);
insert into COUNTY (countyid, countyname, cityid)
values (2632, '景泰县', 301);
insert into COUNTY (countyid, countyname, cityid)
values (2633, '秦城区', 302);
insert into COUNTY (countyid, countyname, cityid)
values (2634, '北道区', 302);
insert into COUNTY (countyid, countyname, cityid)
values (2635, '清水县', 302);
insert into COUNTY (countyid, countyname, cityid)
values (2636, '秦安县', 302);
insert into COUNTY (countyid, countyname, cityid)
values (2637, '甘谷县', 302);
insert into COUNTY (countyid, countyname, cityid)
values (2638, '武山县', 302);
insert into COUNTY (countyid, countyname, cityid)
values (2639, '张家川回族自治县', 302);
insert into COUNTY (countyid, countyname, cityid)
values (2640, '凉州区', 303);
insert into COUNTY (countyid, countyname, cityid)
values (2641, '民勤县', 303);
insert into COUNTY (countyid, countyname, cityid)
values (2642, '古浪县', 303);
insert into COUNTY (countyid, countyname, cityid)
values (2643, '天祝藏族自治县', 303);
insert into COUNTY (countyid, countyname, cityid)
values (2644, '甘州区', 304);
insert into COUNTY (countyid, countyname, cityid)
values (2645, '肃南裕固族自治县', 304);
insert into COUNTY (countyid, countyname, cityid)
values (2646, '民乐县', 304);
insert into COUNTY (countyid, countyname, cityid)
values (2647, '临泽县', 304);
insert into COUNTY (countyid, countyname, cityid)
values (2648, '高台县', 304);
insert into COUNTY (countyid, countyname, cityid)
values (2649, '山丹县', 304);
insert into COUNTY (countyid, countyname, cityid)
values (2650, '崆峒区', 305);
insert into COUNTY (countyid, countyname, cityid)
values (2651, '泾川县', 305);
insert into COUNTY (countyid, countyname, cityid)
values (2652, '灵台县', 305);
insert into COUNTY (countyid, countyname, cityid)
values (2653, '崇信县', 305);
insert into COUNTY (countyid, countyname, cityid)
values (2654, '华亭县', 305);
insert into COUNTY (countyid, countyname, cityid)
values (2655, '庄浪县', 305);
insert into COUNTY (countyid, countyname, cityid)
values (2656, '静宁县', 305);
insert into COUNTY (countyid, countyname, cityid)
values (2657, '肃州区', 306);
insert into COUNTY (countyid, countyname, cityid)
values (2658, '金塔县', 306);
insert into COUNTY (countyid, countyname, cityid)
values (2659, '安西县', 306);
insert into COUNTY (countyid, countyname, cityid)
values (2660, '肃北蒙古族自治县', 306);
insert into COUNTY (countyid, countyname, cityid)
values (2661, '阿克塞哈萨克族自治县', 306);
insert into COUNTY (countyid, countyname, cityid)
values (2662, '玉门市', 306);
insert into COUNTY (countyid, countyname, cityid)
values (2663, '敦煌市', 306);
insert into COUNTY (countyid, countyname, cityid)
values (2664, '西峰区', 307);
insert into COUNTY (countyid, countyname, cityid)
values (2665, '庆城县', 307);
insert into COUNTY (countyid, countyname, cityid)
values (2666, '环县', 307);
insert into COUNTY (countyid, countyname, cityid)
values (2667, '华池县', 307);
insert into COUNTY (countyid, countyname, cityid)
values (2668, '合水县', 307);
insert into COUNTY (countyid, countyname, cityid)
values (2669, '正宁县', 307);
insert into COUNTY (countyid, countyname, cityid)
values (2670, '宁县', 307);
insert into COUNTY (countyid, countyname, cityid)
values (2671, '镇原县', 307);
insert into COUNTY (countyid, countyname, cityid)
values (2672, '安定区', 308);
insert into COUNTY (countyid, countyname, cityid)
values (2673, '通渭县', 308);
insert into COUNTY (countyid, countyname, cityid)
values (2674, '陇西县', 308);
insert into COUNTY (countyid, countyname, cityid)
values (2675, '渭源县', 308);
insert into COUNTY (countyid, countyname, cityid)
values (2676, '临洮县', 308);
insert into COUNTY (countyid, countyname, cityid)
values (2677, '漳县', 308);
insert into COUNTY (countyid, countyname, cityid)
values (2678, '岷县', 308);
insert into COUNTY (countyid, countyname, cityid)
values (2679, '武都区', 309);
insert into COUNTY (countyid, countyname, cityid)
values (2680, '成县', 309);
insert into COUNTY (countyid, countyname, cityid)
values (2681, '文县', 309);
insert into COUNTY (countyid, countyname, cityid)
values (2682, '宕昌县', 309);
insert into COUNTY (countyid, countyname, cityid)
values (2683, '康县', 309);
insert into COUNTY (countyid, countyname, cityid)
values (2684, '西和县', 309);
insert into COUNTY (countyid, countyname, cityid)
values (2685, '礼县', 309);
insert into COUNTY (countyid, countyname, cityid)
values (2686, '徽县', 309);
insert into COUNTY (countyid, countyname, cityid)
values (2687, '两当县', 309);
insert into COUNTY (countyid, countyname, cityid)
values (2688, '临夏市', 310);
insert into COUNTY (countyid, countyname, cityid)
values (2689, '临夏县', 310);
insert into COUNTY (countyid, countyname, cityid)
values (2690, '康乐县', 310);
insert into COUNTY (countyid, countyname, cityid)
values (2691, '永靖县', 310);
insert into COUNTY (countyid, countyname, cityid)
values (2692, '广河县', 310);
insert into COUNTY (countyid, countyname, cityid)
values (2693, '和政县', 310);
insert into COUNTY (countyid, countyname, cityid)
values (2694, '东乡族自治县', 310);
insert into COUNTY (countyid, countyname, cityid)
values (2695, '积石山保安族东乡族撒拉族自治县', 310);
commit;
prompt 400 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (2696, '合作市', 311);
insert into COUNTY (countyid, countyname, cityid)
values (2697, '临潭县', 311);
insert into COUNTY (countyid, countyname, cityid)
values (2698, '卓尼县', 311);
insert into COUNTY (countyid, countyname, cityid)
values (2699, '舟曲县', 311);
insert into COUNTY (countyid, countyname, cityid)
values (2700, '迭部县', 311);
insert into COUNTY (countyid, countyname, cityid)
values (2701, '玛曲县', 311);
insert into COUNTY (countyid, countyname, cityid)
values (2702, '碌曲县', 311);
insert into COUNTY (countyid, countyname, cityid)
values (2703, '夏河县', 311);
insert into COUNTY (countyid, countyname, cityid)
values (2704, '城东区', 312);
insert into COUNTY (countyid, countyname, cityid)
values (2705, '城中区', 312);
insert into COUNTY (countyid, countyname, cityid)
values (2706, '城西区', 312);
insert into COUNTY (countyid, countyname, cityid)
values (2707, '城北区', 312);
insert into COUNTY (countyid, countyname, cityid)
values (2708, '大通回族土族自治县', 312);
insert into COUNTY (countyid, countyname, cityid)
values (2709, '湟中县', 312);
insert into COUNTY (countyid, countyname, cityid)
values (2710, '湟源县', 312);
insert into COUNTY (countyid, countyname, cityid)
values (2711, '平安县', 313);
insert into COUNTY (countyid, countyname, cityid)
values (2712, '民和回族土族自治县', 313);
insert into COUNTY (countyid, countyname, cityid)
values (2713, '乐都县', 313);
insert into COUNTY (countyid, countyname, cityid)
values (2714, '互助土族自治县', 313);
insert into COUNTY (countyid, countyname, cityid)
values (2715, '化隆回族自治县', 313);
insert into COUNTY (countyid, countyname, cityid)
values (2716, '循化撒拉族自治县', 313);
insert into COUNTY (countyid, countyname, cityid)
values (2717, '门源回族自治县', 314);
insert into COUNTY (countyid, countyname, cityid)
values (2718, '祁连县', 314);
insert into COUNTY (countyid, countyname, cityid)
values (2719, '海晏县', 314);
insert into COUNTY (countyid, countyname, cityid)
values (2720, '刚察县', 314);
insert into COUNTY (countyid, countyname, cityid)
values (2721, '同仁县', 315);
insert into COUNTY (countyid, countyname, cityid)
values (2722, '尖扎县', 315);
insert into COUNTY (countyid, countyname, cityid)
values (2723, '泽库县', 315);
insert into COUNTY (countyid, countyname, cityid)
values (2724, '河南蒙古族自治县', 315);
insert into COUNTY (countyid, countyname, cityid)
values (2725, '共和县', 316);
insert into COUNTY (countyid, countyname, cityid)
values (2726, '同德县', 316);
insert into COUNTY (countyid, countyname, cityid)
values (2727, '贵德县', 316);
insert into COUNTY (countyid, countyname, cityid)
values (2728, '兴海县', 316);
insert into COUNTY (countyid, countyname, cityid)
values (2729, '贵南县', 316);
insert into COUNTY (countyid, countyname, cityid)
values (2730, '玛沁县', 317);
insert into COUNTY (countyid, countyname, cityid)
values (2731, '班玛县', 317);
insert into COUNTY (countyid, countyname, cityid)
values (2732, '甘德县', 317);
insert into COUNTY (countyid, countyname, cityid)
values (2733, '达日县', 317);
insert into COUNTY (countyid, countyname, cityid)
values (2734, '久治县', 317);
insert into COUNTY (countyid, countyname, cityid)
values (2735, '玛多县', 317);
insert into COUNTY (countyid, countyname, cityid)
values (2736, '玉树县', 318);
insert into COUNTY (countyid, countyname, cityid)
values (2737, '杂多县', 318);
insert into COUNTY (countyid, countyname, cityid)
values (2738, '称多县', 318);
insert into COUNTY (countyid, countyname, cityid)
values (2739, '治多县', 318);
insert into COUNTY (countyid, countyname, cityid)
values (2740, '囊谦县', 318);
insert into COUNTY (countyid, countyname, cityid)
values (2741, '曲麻莱县', 318);
insert into COUNTY (countyid, countyname, cityid)
values (2742, '格尔木市', 319);
insert into COUNTY (countyid, countyname, cityid)
values (2743, '德令哈市', 319);
insert into COUNTY (countyid, countyname, cityid)
values (2744, '乌兰县', 319);
insert into COUNTY (countyid, countyname, cityid)
values (2745, '都兰县', 319);
insert into COUNTY (countyid, countyname, cityid)
values (2746, '天峻县', 319);
insert into COUNTY (countyid, countyname, cityid)
values (2747, '兴庆区', 320);
insert into COUNTY (countyid, countyname, cityid)
values (2748, '西夏区', 320);
insert into COUNTY (countyid, countyname, cityid)
values (2749, '金凤区', 320);
insert into COUNTY (countyid, countyname, cityid)
values (2750, '永宁县', 320);
insert into COUNTY (countyid, countyname, cityid)
values (2751, '贺兰县', 320);
insert into COUNTY (countyid, countyname, cityid)
values (2752, '灵武市', 320);
insert into COUNTY (countyid, countyname, cityid)
values (2753, '大武口区', 321);
insert into COUNTY (countyid, countyname, cityid)
values (2754, '惠农区', 321);
insert into COUNTY (countyid, countyname, cityid)
values (2755, '平罗县', 321);
insert into COUNTY (countyid, countyname, cityid)
values (2756, '利通区', 322);
insert into COUNTY (countyid, countyname, cityid)
values (2757, '盐池县', 322);
insert into COUNTY (countyid, countyname, cityid)
values (2758, '同心县', 322);
insert into COUNTY (countyid, countyname, cityid)
values (2759, '青铜峡市', 322);
insert into COUNTY (countyid, countyname, cityid)
values (2760, '原州区', 323);
insert into COUNTY (countyid, countyname, cityid)
values (2761, '西吉县', 323);
insert into COUNTY (countyid, countyname, cityid)
values (2762, '隆德县', 323);
insert into COUNTY (countyid, countyname, cityid)
values (2763, '泾源县', 323);
insert into COUNTY (countyid, countyname, cityid)
values (2764, '彭阳县', 323);
insert into COUNTY (countyid, countyname, cityid)
values (2765, '沙坡头区', 324);
insert into COUNTY (countyid, countyname, cityid)
values (2766, '中宁县', 324);
insert into COUNTY (countyid, countyname, cityid)
values (2767, '海原县', 324);
insert into COUNTY (countyid, countyname, cityid)
values (2768, '天山区', 325);
insert into COUNTY (countyid, countyname, cityid)
values (2769, '沙依巴克区', 325);
insert into COUNTY (countyid, countyname, cityid)
values (2770, '新市区', 325);
insert into COUNTY (countyid, countyname, cityid)
values (2771, '水磨沟区', 325);
insert into COUNTY (countyid, countyname, cityid)
values (2772, '头屯河区', 325);
insert into COUNTY (countyid, countyname, cityid)
values (2773, '达坂城区', 325);
insert into COUNTY (countyid, countyname, cityid)
values (2774, '东山区', 325);
insert into COUNTY (countyid, countyname, cityid)
values (2775, '乌鲁木齐县', 325);
insert into COUNTY (countyid, countyname, cityid)
values (2776, '独山子区', 326);
insert into COUNTY (countyid, countyname, cityid)
values (2777, '克拉玛依区', 326);
insert into COUNTY (countyid, countyname, cityid)
values (2778, '白碱滩区', 326);
insert into COUNTY (countyid, countyname, cityid)
values (2779, '乌尔禾区', 326);
insert into COUNTY (countyid, countyname, cityid)
values (2780, '吐鲁番市', 327);
insert into COUNTY (countyid, countyname, cityid)
values (2781, '鄯善县', 327);
insert into COUNTY (countyid, countyname, cityid)
values (2782, '托克逊县', 327);
insert into COUNTY (countyid, countyname, cityid)
values (2783, '哈密市', 328);
insert into COUNTY (countyid, countyname, cityid)
values (2784, '巴里坤哈萨克自治县', 328);
insert into COUNTY (countyid, countyname, cityid)
values (2785, '伊吾县', 328);
insert into COUNTY (countyid, countyname, cityid)
values (2786, '昌吉市', 329);
insert into COUNTY (countyid, countyname, cityid)
values (2485, '萨嘎县', 284);
insert into COUNTY (countyid, countyname, cityid)
values (2787, '阜康市', 329);
insert into COUNTY (countyid, countyname, cityid)
values (2788, '米泉市', 329);
insert into COUNTY (countyid, countyname, cityid)
values (2789, '呼图壁县', 329);
insert into COUNTY (countyid, countyname, cityid)
values (2790, '玛纳斯县', 329);
insert into COUNTY (countyid, countyname, cityid)
values (2791, '奇台县', 329);
insert into COUNTY (countyid, countyname, cityid)
values (2792, '吉木萨尔县', 329);
insert into COUNTY (countyid, countyname, cityid)
values (2793, '木垒哈萨克自治县', 329);
insert into COUNTY (countyid, countyname, cityid)
values (2794, '博乐市', 330);
commit;
prompt 500 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (2795, '精河县', 330);
insert into COUNTY (countyid, countyname, cityid)
values (2796, '温泉县', 330);
insert into COUNTY (countyid, countyname, cityid)
values (2797, '库尔勒市', 331);
insert into COUNTY (countyid, countyname, cityid)
values (2798, '轮台县', 331);
insert into COUNTY (countyid, countyname, cityid)
values (2799, '尉犁县', 331);
insert into COUNTY (countyid, countyname, cityid)
values (2800, '若羌县', 331);
insert into COUNTY (countyid, countyname, cityid)
values (2801, '且末县', 331);
insert into COUNTY (countyid, countyname, cityid)
values (2802, '焉耆回族自治县', 331);
insert into COUNTY (countyid, countyname, cityid)
values (2803, '和静县', 331);
insert into COUNTY (countyid, countyname, cityid)
values (2804, '和硕县', 331);
insert into COUNTY (countyid, countyname, cityid)
values (2805, '博湖县', 331);
insert into COUNTY (countyid, countyname, cityid)
values (2806, '阿克苏市', 332);
insert into COUNTY (countyid, countyname, cityid)
values (2807, '温宿县', 332);
insert into COUNTY (countyid, countyname, cityid)
values (2808, '库车县', 332);
insert into COUNTY (countyid, countyname, cityid)
values (2809, '沙雅县', 332);
insert into COUNTY (countyid, countyname, cityid)
values (2810, '新和县', 332);
insert into COUNTY (countyid, countyname, cityid)
values (2811, '拜城县', 332);
insert into COUNTY (countyid, countyname, cityid)
values (2812, '乌什县', 332);
insert into COUNTY (countyid, countyname, cityid)
values (2813, '阿瓦提县', 332);
insert into COUNTY (countyid, countyname, cityid)
values (2814, '柯坪县', 332);
insert into COUNTY (countyid, countyname, cityid)
values (2815, '阿图什市', 333);
insert into COUNTY (countyid, countyname, cityid)
values (2816, '阿克陶县', 333);
insert into COUNTY (countyid, countyname, cityid)
values (2817, '阿合奇县', 333);
insert into COUNTY (countyid, countyname, cityid)
values (2818, '乌恰县', 333);
insert into COUNTY (countyid, countyname, cityid)
values (2819, '喀什市', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2820, '疏附县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2821, '疏勒县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2822, '英吉沙县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2823, '泽普县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2824, '莎车县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2825, '叶城县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2826, '麦盖提县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2827, '岳普湖县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2828, '伽师县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2829, '巴楚县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2830, '塔什库尔干塔吉克自治县', 334);
insert into COUNTY (countyid, countyname, cityid)
values (2831, '和田市', 335);
insert into COUNTY (countyid, countyname, cityid)
values (2832, '和田县', 335);
insert into COUNTY (countyid, countyname, cityid)
values (2833, '墨玉县', 335);
insert into COUNTY (countyid, countyname, cityid)
values (2834, '皮山县', 335);
insert into COUNTY (countyid, countyname, cityid)
values (2835, '洛浦县', 335);
insert into COUNTY (countyid, countyname, cityid)
values (2836, '策勒县', 335);
insert into COUNTY (countyid, countyname, cityid)
values (2837, '于田县', 335);
insert into COUNTY (countyid, countyname, cityid)
values (2838, '民丰县', 335);
insert into COUNTY (countyid, countyname, cityid)
values (2839, '伊宁市', 336);
insert into COUNTY (countyid, countyname, cityid)
values (2840, '奎屯市', 336);
insert into COUNTY (countyid, countyname, cityid)
values (2841, '伊宁县', 336);
insert into COUNTY (countyid, countyname, cityid)
values (2842, '察布查尔锡伯自治县', 336);
insert into COUNTY (countyid, countyname, cityid)
values (2843, '霍城县', 336);
insert into COUNTY (countyid, countyname, cityid)
values (2844, '巩留县', 336);
insert into COUNTY (countyid, countyname, cityid)
values (2845, '新源县', 336);
insert into COUNTY (countyid, countyname, cityid)
values (2846, '昭苏县', 336);
insert into COUNTY (countyid, countyname, cityid)
values (2847, '特克斯县', 336);
insert into COUNTY (countyid, countyname, cityid)
values (2848, '尼勒克县', 336);
insert into COUNTY (countyid, countyname, cityid)
values (2849, '塔城市', 337);
insert into COUNTY (countyid, countyname, cityid)
values (2850, '乌苏市', 337);
insert into COUNTY (countyid, countyname, cityid)
values (2851, '额敏县', 337);
insert into COUNTY (countyid, countyname, cityid)
values (2852, '沙湾县', 337);
insert into COUNTY (countyid, countyname, cityid)
values (2853, '托里县', 337);
insert into COUNTY (countyid, countyname, cityid)
values (2854, '裕民县', 337);
insert into COUNTY (countyid, countyname, cityid)
values (2855, '和布克赛尔蒙古自治县', 337);
insert into COUNTY (countyid, countyname, cityid)
values (2856, '阿勒泰市', 338);
insert into COUNTY (countyid, countyname, cityid)
values (2857, '布尔津县', 338);
insert into COUNTY (countyid, countyname, cityid)
values (2858, '富蕴县', 338);
insert into COUNTY (countyid, countyname, cityid)
values (2859, '福海县', 338);
insert into COUNTY (countyid, countyname, cityid)
values (2860, '哈巴河县', 338);
insert into COUNTY (countyid, countyname, cityid)
values (2861, '青河县', 338);
insert into COUNTY (countyid, countyname, cityid)
values (2862, '吉木乃县', 338);
insert into COUNTY (countyid, countyname, cityid)
values (1, '东城区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (2, '西城区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (3, '崇文区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (4, '宣武区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (5, '朝阳区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (6, '丰台区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (7, '石景山区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (8, '海淀区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (9, '门头沟区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (10, '房山区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (11, '通州区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (12, '顺义区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (13, '昌平区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (14, '大兴区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (15, '怀柔区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (16, '平谷区', 1);
insert into COUNTY (countyid, countyname, cityid)
values (17, '密云县', 1);
insert into COUNTY (countyid, countyname, cityid)
values (18, '延庆县', 1);
insert into COUNTY (countyid, countyname, cityid)
values (19, '和平区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (20, '河东区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (21, '河西区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (22, '南开区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (23, '河北区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (24, '红桥区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (25, '塘沽区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (26, '汉沽区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (27, '大港区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (28, '东丽区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (29, '西青区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (30, '津南区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (31, '北辰区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (32, '武清区', 2);
commit;
prompt 600 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (33, '宝坻区', 2);
insert into COUNTY (countyid, countyname, cityid)
values (34, '宁河县', 2);
insert into COUNTY (countyid, countyname, cityid)
values (35, '静海县', 2);
insert into COUNTY (countyid, countyname, cityid)
values (36, '蓟县', 2);
insert into COUNTY (countyid, countyname, cityid)
values (37, '长安区', 3);
insert into COUNTY (countyid, countyname, cityid)
values (38, '桥东区', 3);
insert into COUNTY (countyid, countyname, cityid)
values (39, '桥西区', 3);
insert into COUNTY (countyid, countyname, cityid)
values (40, '新华区', 3);
insert into COUNTY (countyid, countyname, cityid)
values (41, '井陉矿区', 3);
insert into COUNTY (countyid, countyname, cityid)
values (42, '裕华区', 3);
insert into COUNTY (countyid, countyname, cityid)
values (43, '井陉县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (44, '正定县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (45, '栾城县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (46, '行唐县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (47, '灵寿县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (48, '高邑县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (49, '深泽县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (50, '赞皇县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (51, '无极县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (52, '平山县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (53, '元氏县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (54, '赵县', 3);
insert into COUNTY (countyid, countyname, cityid)
values (55, '辛集市', 3);
insert into COUNTY (countyid, countyname, cityid)
values (56, '藁城市', 3);
insert into COUNTY (countyid, countyname, cityid)
values (57, '晋州市', 3);
insert into COUNTY (countyid, countyname, cityid)
values (58, '新乐市', 3);
insert into COUNTY (countyid, countyname, cityid)
values (59, '鹿泉市', 3);
insert into COUNTY (countyid, countyname, cityid)
values (60, '路南区', 4);
insert into COUNTY (countyid, countyname, cityid)
values (61, '路北区', 4);
insert into COUNTY (countyid, countyname, cityid)
values (62, '古冶区', 4);
insert into COUNTY (countyid, countyname, cityid)
values (63, '开平区', 4);
insert into COUNTY (countyid, countyname, cityid)
values (64, '丰南区', 4);
insert into COUNTY (countyid, countyname, cityid)
values (65, '丰润区', 4);
insert into COUNTY (countyid, countyname, cityid)
values (66, '滦县', 4);
insert into COUNTY (countyid, countyname, cityid)
values (67, '滦南县', 4);
insert into COUNTY (countyid, countyname, cityid)
values (68, '乐亭县', 4);
insert into COUNTY (countyid, countyname, cityid)
values (69, '迁西县', 4);
insert into COUNTY (countyid, countyname, cityid)
values (70, '玉田县', 4);
insert into COUNTY (countyid, countyname, cityid)
values (71, '唐海县', 4);
insert into COUNTY (countyid, countyname, cityid)
values (72, '遵化市', 4);
insert into COUNTY (countyid, countyname, cityid)
values (73, '迁安市', 4);
insert into COUNTY (countyid, countyname, cityid)
values (74, '海港区', 5);
insert into COUNTY (countyid, countyname, cityid)
values (75, '山海关区', 5);
insert into COUNTY (countyid, countyname, cityid)
values (76, '北戴河区', 5);
insert into COUNTY (countyid, countyname, cityid)
values (77, '青龙满族自治县', 5);
insert into COUNTY (countyid, countyname, cityid)
values (78, '昌黎县', 5);
insert into COUNTY (countyid, countyname, cityid)
values (79, '抚宁县', 5);
insert into COUNTY (countyid, countyname, cityid)
values (80, '卢龙县', 5);
insert into COUNTY (countyid, countyname, cityid)
values (81, '邯山区', 6);
insert into COUNTY (countyid, countyname, cityid)
values (82, '丛台区', 6);
insert into COUNTY (countyid, countyname, cityid)
values (83, '复兴区', 6);
insert into COUNTY (countyid, countyname, cityid)
values (84, '峰峰矿区', 6);
insert into COUNTY (countyid, countyname, cityid)
values (85, '邯郸县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (86, '临漳县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (87, '成安县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (88, '大名县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (89, '涉县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (90, '磁县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (91, '肥乡县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (92, '永年县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (93, '邱县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (94, '鸡泽县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (95, '广平县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (96, '馆陶县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (97, '魏县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (98, '曲周县', 6);
insert into COUNTY (countyid, countyname, cityid)
values (99, '武安市', 6);
insert into COUNTY (countyid, countyname, cityid)
values (100, '桥东区', 7);
insert into COUNTY (countyid, countyname, cityid)
values (101, '桥西区', 7);
insert into COUNTY (countyid, countyname, cityid)
values (102, '邢台县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (103, '临城县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (104, '内丘县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (105, '柏乡县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (106, '隆尧县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (107, '任县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (108, '南和县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (109, '宁晋县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (110, '巨鹿县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (111, '新河县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (112, '广宗县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (113, '平乡县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (114, '威县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (115, '清河县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (116, '临西县', 7);
insert into COUNTY (countyid, countyname, cityid)
values (117, '南宫市', 7);
insert into COUNTY (countyid, countyname, cityid)
values (118, '沙河市', 7);
insert into COUNTY (countyid, countyname, cityid)
values (119, '新市区', 8);
insert into COUNTY (countyid, countyname, cityid)
values (120, '北市区', 8);
insert into COUNTY (countyid, countyname, cityid)
values (121, '南市区', 8);
insert into COUNTY (countyid, countyname, cityid)
values (122, '满城县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (123, '清苑县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (124, '涞水县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (125, '阜平县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (126, '徐水县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (127, '定兴县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (128, '唐县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (129, '高阳县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (130, '容城县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (131, '涞源县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (132, '望都县', 8);
commit;
prompt 700 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (133, '安新县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (134, '易县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (135, '曲阳县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (136, '蠡县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (137, '顺平县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (138, '博野县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (139, '雄县', 8);
insert into COUNTY (countyid, countyname, cityid)
values (140, '涿州市', 8);
insert into COUNTY (countyid, countyname, cityid)
values (141, '定州市', 8);
insert into COUNTY (countyid, countyname, cityid)
values (142, '安国市', 8);
insert into COUNTY (countyid, countyname, cityid)
values (143, '高碑店市', 8);
insert into COUNTY (countyid, countyname, cityid)
values (144, '桥东区', 9);
insert into COUNTY (countyid, countyname, cityid)
values (145, '桥西区', 9);
insert into COUNTY (countyid, countyname, cityid)
values (146, '宣化区', 9);
insert into COUNTY (countyid, countyname, cityid)
values (147, '下花园区', 9);
insert into COUNTY (countyid, countyname, cityid)
values (148, '宣化县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (149, '张北县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (150, '康保县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (151, '沽源县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (152, '尚义县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (153, '蔚县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (154, '阳原县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (155, '怀安县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (156, '万全县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (157, '怀来县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (158, '涿鹿县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (159, '赤城县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (160, '崇礼县', 9);
insert into COUNTY (countyid, countyname, cityid)
values (161, '双桥区', 10);
insert into COUNTY (countyid, countyname, cityid)
values (162, '双滦区', 10);
insert into COUNTY (countyid, countyname, cityid)
values (163, '鹰手营子矿区', 10);
insert into COUNTY (countyid, countyname, cityid)
values (164, '承德县', 10);
insert into COUNTY (countyid, countyname, cityid)
values (165, '兴隆县', 10);
insert into COUNTY (countyid, countyname, cityid)
values (166, '平泉县', 10);
insert into COUNTY (countyid, countyname, cityid)
values (167, '滦平县', 10);
insert into COUNTY (countyid, countyname, cityid)
values (168, '隆化县', 10);
insert into COUNTY (countyid, countyname, cityid)
values (169, '丰宁满族自治县', 10);
insert into COUNTY (countyid, countyname, cityid)
values (170, '宽城满族自治县', 10);
insert into COUNTY (countyid, countyname, cityid)
values (171, '围场满族蒙古族自治县', 10);
insert into COUNTY (countyid, countyname, cityid)
values (172, '新华区', 11);
insert into COUNTY (countyid, countyname, cityid)
values (173, '运河区', 11);
insert into COUNTY (countyid, countyname, cityid)
values (174, '沧县', 11);
insert into COUNTY (countyid, countyname, cityid)
values (175, '青县', 11);
insert into COUNTY (countyid, countyname, cityid)
values (176, '东光县', 11);
insert into COUNTY (countyid, countyname, cityid)
values (177, '海兴县', 11);
insert into COUNTY (countyid, countyname, cityid)
values (178, '盐山县', 11);
insert into COUNTY (countyid, countyname, cityid)
values (179, '肃宁县', 11);
insert into COUNTY (countyid, countyname, cityid)
values (180, '南皮县', 11);
insert into COUNTY (countyid, countyname, cityid)
values (181, '吴桥县', 11);
insert into COUNTY (countyid, countyname, cityid)
values (182, '献县', 11);
insert into COUNTY (countyid, countyname, cityid)
values (183, '孟村回族自治县', 11);
insert into COUNTY (countyid, countyname, cityid)
values (184, '泊头市', 11);
insert into COUNTY (countyid, countyname, cityid)
values (185, '任丘市', 11);
insert into COUNTY (countyid, countyname, cityid)
values (186, '黄骅市', 11);
insert into COUNTY (countyid, countyname, cityid)
values (187, '河间市', 11);
insert into COUNTY (countyid, countyname, cityid)
values (188, '安次区', 12);
insert into COUNTY (countyid, countyname, cityid)
values (189, '广阳区', 12);
insert into COUNTY (countyid, countyname, cityid)
values (190, '固安县', 12);
insert into COUNTY (countyid, countyname, cityid)
values (191, '永清县', 12);
insert into COUNTY (countyid, countyname, cityid)
values (192, '香河县', 12);
insert into COUNTY (countyid, countyname, cityid)
values (193, '大城县', 12);
insert into COUNTY (countyid, countyname, cityid)
values (194, '文安县', 12);
insert into COUNTY (countyid, countyname, cityid)
values (195, '大厂回族自治县', 12);
insert into COUNTY (countyid, countyname, cityid)
values (196, '霸州市', 12);
insert into COUNTY (countyid, countyname, cityid)
values (197, '三河市', 12);
insert into COUNTY (countyid, countyname, cityid)
values (198, '桃城区', 13);
insert into COUNTY (countyid, countyname, cityid)
values (199, '枣强县', 13);
insert into COUNTY (countyid, countyname, cityid)
values (200, '武邑县', 13);
insert into COUNTY (countyid, countyname, cityid)
values (201, '武强县', 13);
insert into COUNTY (countyid, countyname, cityid)
values (202, '饶阳县', 13);
insert into COUNTY (countyid, countyname, cityid)
values (203, '安平县', 13);
insert into COUNTY (countyid, countyname, cityid)
values (204, '故城县', 13);
insert into COUNTY (countyid, countyname, cityid)
values (205, '景县', 13);
insert into COUNTY (countyid, countyname, cityid)
values (206, '阜城县', 13);
insert into COUNTY (countyid, countyname, cityid)
values (207, '冀州市', 13);
insert into COUNTY (countyid, countyname, cityid)
values (208, '深州市', 13);
insert into COUNTY (countyid, countyname, cityid)
values (209, '小店区', 14);
insert into COUNTY (countyid, countyname, cityid)
values (210, '迎泽区', 14);
insert into COUNTY (countyid, countyname, cityid)
values (211, '杏花岭区', 14);
insert into COUNTY (countyid, countyname, cityid)
values (212, '尖草坪区', 14);
insert into COUNTY (countyid, countyname, cityid)
values (213, '万柏林区', 14);
insert into COUNTY (countyid, countyname, cityid)
values (214, '晋源区', 14);
insert into COUNTY (countyid, countyname, cityid)
values (215, '清徐县', 14);
insert into COUNTY (countyid, countyname, cityid)
values (216, '阳曲县', 14);
insert into COUNTY (countyid, countyname, cityid)
values (217, '娄烦县', 14);
insert into COUNTY (countyid, countyname, cityid)
values (218, '古交市', 14);
insert into COUNTY (countyid, countyname, cityid)
values (219, '城区', 15);
insert into COUNTY (countyid, countyname, cityid)
values (220, '矿区', 15);
insert into COUNTY (countyid, countyname, cityid)
values (221, '南郊区', 15);
insert into COUNTY (countyid, countyname, cityid)
values (222, '新荣区', 15);
insert into COUNTY (countyid, countyname, cityid)
values (223, '阳高县', 15);
insert into COUNTY (countyid, countyname, cityid)
values (224, '天镇县', 15);
insert into COUNTY (countyid, countyname, cityid)
values (225, '广灵县', 15);
insert into COUNTY (countyid, countyname, cityid)
values (226, '灵丘县', 15);
insert into COUNTY (countyid, countyname, cityid)
values (227, '浑源县', 15);
insert into COUNTY (countyid, countyname, cityid)
values (228, '左云县', 15);
insert into COUNTY (countyid, countyname, cityid)
values (229, '大同县', 15);
insert into COUNTY (countyid, countyname, cityid)
values (230, '城区', 16);
insert into COUNTY (countyid, countyname, cityid)
values (231, '矿区', 16);
insert into COUNTY (countyid, countyname, cityid)
values (232, '郊区', 16);
commit;
prompt 800 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (233, '平定县', 16);
insert into COUNTY (countyid, countyname, cityid)
values (234, '盂县', 16);
insert into COUNTY (countyid, countyname, cityid)
values (235, '城区', 17);
insert into COUNTY (countyid, countyname, cityid)
values (236, '郊区', 17);
insert into COUNTY (countyid, countyname, cityid)
values (237, '长治县', 17);
insert into COUNTY (countyid, countyname, cityid)
values (238, '襄垣县', 17);
insert into COUNTY (countyid, countyname, cityid)
values (239, '屯留县', 17);
insert into COUNTY (countyid, countyname, cityid)
values (240, '平顺县', 17);
insert into COUNTY (countyid, countyname, cityid)
values (241, '黎城县', 17);
insert into COUNTY (countyid, countyname, cityid)
values (242, '壶关县', 17);
insert into COUNTY (countyid, countyname, cityid)
values (243, '长子县', 17);
insert into COUNTY (countyid, countyname, cityid)
values (244, '武乡县', 17);
insert into COUNTY (countyid, countyname, cityid)
values (245, '沁县', 17);
insert into COUNTY (countyid, countyname, cityid)
values (246, '沁源县', 17);
insert into COUNTY (countyid, countyname, cityid)
values (247, '潞城市', 17);
insert into COUNTY (countyid, countyname, cityid)
values (248, '城区', 18);
insert into COUNTY (countyid, countyname, cityid)
values (249, '沁水县', 18);
insert into COUNTY (countyid, countyname, cityid)
values (250, '阳城县', 18);
insert into COUNTY (countyid, countyname, cityid)
values (251, '陵川县', 18);
insert into COUNTY (countyid, countyname, cityid)
values (252, '泽州县', 18);
insert into COUNTY (countyid, countyname, cityid)
values (253, '高平市', 18);
insert into COUNTY (countyid, countyname, cityid)
values (254, '朔城区', 19);
insert into COUNTY (countyid, countyname, cityid)
values (255, '平鲁区', 19);
insert into COUNTY (countyid, countyname, cityid)
values (256, '山阴县', 19);
insert into COUNTY (countyid, countyname, cityid)
values (257, '应县', 19);
insert into COUNTY (countyid, countyname, cityid)
values (258, '右玉县', 19);
insert into COUNTY (countyid, countyname, cityid)
values (259, '怀仁县', 19);
insert into COUNTY (countyid, countyname, cityid)
values (260, '榆次区', 20);
insert into COUNTY (countyid, countyname, cityid)
values (261, '榆社县', 20);
insert into COUNTY (countyid, countyname, cityid)
values (262, '左权县', 20);
insert into COUNTY (countyid, countyname, cityid)
values (263, '和顺县', 20);
insert into COUNTY (countyid, countyname, cityid)
values (264, '昔阳县', 20);
insert into COUNTY (countyid, countyname, cityid)
values (265, '寿阳县', 20);
insert into COUNTY (countyid, countyname, cityid)
values (266, '太谷县', 20);
insert into COUNTY (countyid, countyname, cityid)
values (267, '祁县', 20);
insert into COUNTY (countyid, countyname, cityid)
values (268, '平遥县', 20);
insert into COUNTY (countyid, countyname, cityid)
values (269, '灵石县', 20);
insert into COUNTY (countyid, countyname, cityid)
values (270, '介休市', 20);
insert into COUNTY (countyid, countyname, cityid)
values (271, '盐湖区', 21);
insert into COUNTY (countyid, countyname, cityid)
values (272, '临猗县', 21);
insert into COUNTY (countyid, countyname, cityid)
values (273, '万荣县', 21);
insert into COUNTY (countyid, countyname, cityid)
values (274, '闻喜县', 21);
insert into COUNTY (countyid, countyname, cityid)
values (275, '稷山县', 21);
insert into COUNTY (countyid, countyname, cityid)
values (276, '新绛县', 21);
insert into COUNTY (countyid, countyname, cityid)
values (277, '绛县', 21);
insert into COUNTY (countyid, countyname, cityid)
values (278, '垣曲县', 21);
insert into COUNTY (countyid, countyname, cityid)
values (279, '夏县', 21);
insert into COUNTY (countyid, countyname, cityid)
values (280, '平陆县', 21);
insert into COUNTY (countyid, countyname, cityid)
values (281, '芮城县', 21);
insert into COUNTY (countyid, countyname, cityid)
values (282, '永济市', 21);
insert into COUNTY (countyid, countyname, cityid)
values (283, '河津市', 21);
insert into COUNTY (countyid, countyname, cityid)
values (284, '忻府区', 22);
insert into COUNTY (countyid, countyname, cityid)
values (285, '定襄县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (286, '五台县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (287, '代县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (288, '繁峙县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (289, '宁武县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (290, '静乐县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (291, '神池县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (292, '五寨县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (293, '岢岚县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (294, '河曲县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (295, '保德县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (296, '偏关县', 22);
insert into COUNTY (countyid, countyname, cityid)
values (297, '原平市', 22);
insert into COUNTY (countyid, countyname, cityid)
values (298, '尧都区', 23);
insert into COUNTY (countyid, countyname, cityid)
values (299, '曲沃县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (300, '翼城县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (301, '襄汾县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (302, '洪洞县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (303, '古县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (304, '安泽县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (305, '浮山县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (306, '吉县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (307, '乡宁县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (308, '大宁县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (309, '隰县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (310, '永和县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (311, '蒲县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (312, '汾西县', 23);
insert into COUNTY (countyid, countyname, cityid)
values (313, '侯马市', 23);
insert into COUNTY (countyid, countyname, cityid)
values (314, '霍州市', 23);
insert into COUNTY (countyid, countyname, cityid)
values (315, '离石区', 24);
insert into COUNTY (countyid, countyname, cityid)
values (316, '文水县', 24);
insert into COUNTY (countyid, countyname, cityid)
values (317, '交城县', 24);
insert into COUNTY (countyid, countyname, cityid)
values (318, '兴县', 24);
insert into COUNTY (countyid, countyname, cityid)
values (319, '临县', 24);
insert into COUNTY (countyid, countyname, cityid)
values (320, '柳林县', 24);
insert into COUNTY (countyid, countyname, cityid)
values (321, '石楼县', 24);
insert into COUNTY (countyid, countyname, cityid)
values (322, '岚县', 24);
insert into COUNTY (countyid, countyname, cityid)
values (323, '方山县', 24);
insert into COUNTY (countyid, countyname, cityid)
values (324, '中阳县', 24);
insert into COUNTY (countyid, countyname, cityid)
values (325, '交口县', 24);
insert into COUNTY (countyid, countyname, cityid)
values (326, '孝义市', 24);
insert into COUNTY (countyid, countyname, cityid)
values (327, '汾阳市', 24);
insert into COUNTY (countyid, countyname, cityid)
values (328, '新城区', 25);
insert into COUNTY (countyid, countyname, cityid)
values (329, '回民区', 25);
insert into COUNTY (countyid, countyname, cityid)
values (330, '玉泉区', 25);
insert into COUNTY (countyid, countyname, cityid)
values (331, '赛罕区', 25);
insert into COUNTY (countyid, countyname, cityid)
values (332, '土默特左旗', 25);
commit;
prompt 900 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (333, '托克托县', 25);
insert into COUNTY (countyid, countyname, cityid)
values (334, '和林格尔县', 25);
insert into COUNTY (countyid, countyname, cityid)
values (335, '清水河县', 25);
insert into COUNTY (countyid, countyname, cityid)
values (336, '武川县', 25);
insert into COUNTY (countyid, countyname, cityid)
values (337, '东河区', 26);
insert into COUNTY (countyid, countyname, cityid)
values (338, '昆都仑区', 26);
insert into COUNTY (countyid, countyname, cityid)
values (339, '青山区', 26);
insert into COUNTY (countyid, countyname, cityid)
values (340, '石拐区', 26);
insert into COUNTY (countyid, countyname, cityid)
values (341, '白云矿区', 26);
insert into COUNTY (countyid, countyname, cityid)
values (342, '九原区', 26);
insert into COUNTY (countyid, countyname, cityid)
values (343, '土默特右旗', 26);
insert into COUNTY (countyid, countyname, cityid)
values (344, '固阳县', 26);
insert into COUNTY (countyid, countyname, cityid)
values (345, '达尔罕茂明安联合旗', 26);
insert into COUNTY (countyid, countyname, cityid)
values (346, '海勃湾区', 27);
insert into COUNTY (countyid, countyname, cityid)
values (347, '海南区', 27);
insert into COUNTY (countyid, countyname, cityid)
values (348, '乌达区', 27);
insert into COUNTY (countyid, countyname, cityid)
values (349, '红山区', 28);
insert into COUNTY (countyid, countyname, cityid)
values (350, '元宝山区', 28);
insert into COUNTY (countyid, countyname, cityid)
values (351, '松山区', 28);
insert into COUNTY (countyid, countyname, cityid)
values (352, '阿鲁科尔沁旗', 28);
insert into COUNTY (countyid, countyname, cityid)
values (353, '巴林左旗', 28);
insert into COUNTY (countyid, countyname, cityid)
values (354, '巴林右旗', 28);
insert into COUNTY (countyid, countyname, cityid)
values (355, '林西县', 28);
insert into COUNTY (countyid, countyname, cityid)
values (356, '克什克腾旗', 28);
insert into COUNTY (countyid, countyname, cityid)
values (357, '翁牛特旗', 28);
insert into COUNTY (countyid, countyname, cityid)
values (358, '喀喇沁旗', 28);
insert into COUNTY (countyid, countyname, cityid)
values (359, '宁城县', 28);
insert into COUNTY (countyid, countyname, cityid)
values (360, '敖汉旗', 28);
insert into COUNTY (countyid, countyname, cityid)
values (361, '科尔沁区', 29);
insert into COUNTY (countyid, countyname, cityid)
values (362, '科尔沁左翼中旗', 29);
insert into COUNTY (countyid, countyname, cityid)
values (363, '科尔沁左翼后旗', 29);
insert into COUNTY (countyid, countyname, cityid)
values (364, '开鲁县', 29);
insert into COUNTY (countyid, countyname, cityid)
values (365, '库伦旗', 29);
insert into COUNTY (countyid, countyname, cityid)
values (366, '奈曼旗', 29);
insert into COUNTY (countyid, countyname, cityid)
values (367, '扎鲁特旗', 29);
insert into COUNTY (countyid, countyname, cityid)
values (368, '霍林郭勒市', 29);
insert into COUNTY (countyid, countyname, cityid)
values (369, '东胜区', 30);
insert into COUNTY (countyid, countyname, cityid)
values (370, '达拉特旗', 30);
insert into COUNTY (countyid, countyname, cityid)
values (371, '准格尔旗', 30);
insert into COUNTY (countyid, countyname, cityid)
values (372, '鄂托克前旗', 30);
insert into COUNTY (countyid, countyname, cityid)
values (373, '鄂托克旗', 30);
insert into COUNTY (countyid, countyname, cityid)
values (374, '杭锦旗', 30);
insert into COUNTY (countyid, countyname, cityid)
values (375, '乌审旗', 30);
insert into COUNTY (countyid, countyname, cityid)
values (376, '伊金霍洛旗', 30);
insert into COUNTY (countyid, countyname, cityid)
values (377, '海拉尔区', 31);
insert into COUNTY (countyid, countyname, cityid)
values (378, '阿荣旗', 31);
insert into COUNTY (countyid, countyname, cityid)
values (379, '莫力达瓦达斡尔族自治旗', 31);
insert into COUNTY (countyid, countyname, cityid)
values (380, '鄂伦春自治旗', 31);
insert into COUNTY (countyid, countyname, cityid)
values (381, '鄂温克族自治旗', 31);
insert into COUNTY (countyid, countyname, cityid)
values (382, '陈巴尔虎旗', 31);
insert into COUNTY (countyid, countyname, cityid)
values (383, '新巴尔虎左旗', 31);
insert into COUNTY (countyid, countyname, cityid)
values (384, '新巴尔虎右旗', 31);
insert into COUNTY (countyid, countyname, cityid)
values (385, '满洲里市', 31);
insert into COUNTY (countyid, countyname, cityid)
values (386, '牙克石市', 31);
insert into COUNTY (countyid, countyname, cityid)
values (387, '扎兰屯市', 31);
insert into COUNTY (countyid, countyname, cityid)
values (388, '额尔古纳市', 31);
insert into COUNTY (countyid, countyname, cityid)
values (389, '根河市', 31);
insert into COUNTY (countyid, countyname, cityid)
values (390, '临河区', 32);
insert into COUNTY (countyid, countyname, cityid)
values (391, '五原县', 32);
insert into COUNTY (countyid, countyname, cityid)
values (392, '磴口县', 32);
insert into COUNTY (countyid, countyname, cityid)
values (393, '乌拉特前旗', 32);
insert into COUNTY (countyid, countyname, cityid)
values (394, '乌拉特中旗', 32);
insert into COUNTY (countyid, countyname, cityid)
values (395, '乌拉特后旗', 32);
insert into COUNTY (countyid, countyname, cityid)
values (396, '杭锦后旗', 32);
insert into COUNTY (countyid, countyname, cityid)
values (397, '集宁区', 33);
insert into COUNTY (countyid, countyname, cityid)
values (398, '卓资县', 33);
insert into COUNTY (countyid, countyname, cityid)
values (399, '化德县', 33);
insert into COUNTY (countyid, countyname, cityid)
values (400, '商都县', 33);
insert into COUNTY (countyid, countyname, cityid)
values (401, '兴和县', 33);
insert into COUNTY (countyid, countyname, cityid)
values (402, '凉城县', 33);
insert into COUNTY (countyid, countyname, cityid)
values (403, '察哈尔右翼前旗', 33);
insert into COUNTY (countyid, countyname, cityid)
values (404, '察哈尔右翼中旗', 33);
insert into COUNTY (countyid, countyname, cityid)
values (405, '察哈尔右翼后旗', 33);
insert into COUNTY (countyid, countyname, cityid)
values (406, '四子王旗', 33);
insert into COUNTY (countyid, countyname, cityid)
values (407, '丰镇市', 33);
insert into COUNTY (countyid, countyname, cityid)
values (408, '乌兰浩特市', 34);
insert into COUNTY (countyid, countyname, cityid)
values (409, '阿尔山市', 34);
insert into COUNTY (countyid, countyname, cityid)
values (410, '科尔沁右翼前旗', 34);
insert into COUNTY (countyid, countyname, cityid)
values (411, '科尔沁右翼中旗', 34);
insert into COUNTY (countyid, countyname, cityid)
values (412, '扎赉特旗', 34);
insert into COUNTY (countyid, countyname, cityid)
values (413, '突泉县', 34);
insert into COUNTY (countyid, countyname, cityid)
values (414, '二连浩特市', 35);
insert into COUNTY (countyid, countyname, cityid)
values (415, '锡林浩特市', 35);
insert into COUNTY (countyid, countyname, cityid)
values (416, '阿巴嘎旗', 35);
insert into COUNTY (countyid, countyname, cityid)
values (417, '苏尼特左旗', 35);
insert into COUNTY (countyid, countyname, cityid)
values (418, '苏尼特右旗', 35);
insert into COUNTY (countyid, countyname, cityid)
values (419, '东乌珠穆沁旗', 35);
insert into COUNTY (countyid, countyname, cityid)
values (420, '西乌珠穆沁旗', 35);
insert into COUNTY (countyid, countyname, cityid)
values (421, '太仆寺旗', 35);
insert into COUNTY (countyid, countyname, cityid)
values (422, '镶黄旗', 35);
insert into COUNTY (countyid, countyname, cityid)
values (423, '正镶白旗', 35);
insert into COUNTY (countyid, countyname, cityid)
values (424, '正蓝旗', 35);
insert into COUNTY (countyid, countyname, cityid)
values (425, '多伦县', 35);
insert into COUNTY (countyid, countyname, cityid)
values (426, '阿拉善左旗', 36);
insert into COUNTY (countyid, countyname, cityid)
values (427, '阿拉善右旗', 36);
insert into COUNTY (countyid, countyname, cityid)
values (428, '额济纳旗', 36);
insert into COUNTY (countyid, countyname, cityid)
values (429, '和平区', 37);
insert into COUNTY (countyid, countyname, cityid)
values (430, '沈河区', 37);
insert into COUNTY (countyid, countyname, cityid)
values (431, '大东区', 37);
insert into COUNTY (countyid, countyname, cityid)
values (432, '皇姑区', 37);
commit;
prompt 1000 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (433, '铁西区', 37);
insert into COUNTY (countyid, countyname, cityid)
values (434, '苏家屯区', 37);
insert into COUNTY (countyid, countyname, cityid)
values (435, '东陵区', 37);
insert into COUNTY (countyid, countyname, cityid)
values (436, '新城子区', 37);
insert into COUNTY (countyid, countyname, cityid)
values (437, '于洪区', 37);
insert into COUNTY (countyid, countyname, cityid)
values (438, '辽中县', 37);
insert into COUNTY (countyid, countyname, cityid)
values (439, '康平县', 37);
insert into COUNTY (countyid, countyname, cityid)
values (440, '法库县', 37);
insert into COUNTY (countyid, countyname, cityid)
values (441, '新民市', 37);
insert into COUNTY (countyid, countyname, cityid)
values (442, '中山区', 38);
insert into COUNTY (countyid, countyname, cityid)
values (443, '西岗区', 38);
insert into COUNTY (countyid, countyname, cityid)
values (444, '沙河口区', 38);
insert into COUNTY (countyid, countyname, cityid)
values (445, '甘井子区', 38);
insert into COUNTY (countyid, countyname, cityid)
values (446, '旅顺口区', 38);
insert into COUNTY (countyid, countyname, cityid)
values (447, '金州区', 38);
insert into COUNTY (countyid, countyname, cityid)
values (448, '长海县', 38);
insert into COUNTY (countyid, countyname, cityid)
values (449, '瓦房店市', 38);
insert into COUNTY (countyid, countyname, cityid)
values (450, '普兰店市', 38);
insert into COUNTY (countyid, countyname, cityid)
values (451, '庄河市', 38);
insert into COUNTY (countyid, countyname, cityid)
values (452, '铁东区', 39);
insert into COUNTY (countyid, countyname, cityid)
values (453, '铁西区', 39);
insert into COUNTY (countyid, countyname, cityid)
values (454, '立山区', 39);
insert into COUNTY (countyid, countyname, cityid)
values (455, '千山区', 39);
insert into COUNTY (countyid, countyname, cityid)
values (456, '台安县', 39);
insert into COUNTY (countyid, countyname, cityid)
values (457, '岫岩满族自治县', 39);
insert into COUNTY (countyid, countyname, cityid)
values (458, '海城市', 39);
insert into COUNTY (countyid, countyname, cityid)
values (459, '新抚区', 40);
insert into COUNTY (countyid, countyname, cityid)
values (460, '东洲区', 40);
insert into COUNTY (countyid, countyname, cityid)
values (461, '望花区', 40);
insert into COUNTY (countyid, countyname, cityid)
values (462, '顺城区', 40);
insert into COUNTY (countyid, countyname, cityid)
values (463, '抚顺县', 40);
insert into COUNTY (countyid, countyname, cityid)
values (464, '新宾满族自治县', 40);
insert into COUNTY (countyid, countyname, cityid)
values (465, '清原满族自治县', 40);
insert into COUNTY (countyid, countyname, cityid)
values (466, '平山区', 41);
insert into COUNTY (countyid, countyname, cityid)
values (467, '溪湖区', 41);
insert into COUNTY (countyid, countyname, cityid)
values (468, '明山区', 41);
insert into COUNTY (countyid, countyname, cityid)
values (469, '南芬区', 41);
insert into COUNTY (countyid, countyname, cityid)
values (470, '本溪满族自治县', 41);
insert into COUNTY (countyid, countyname, cityid)
values (471, '桓仁满族自治县', 41);
insert into COUNTY (countyid, countyname, cityid)
values (472, '元宝区', 42);
insert into COUNTY (countyid, countyname, cityid)
values (473, '振兴区', 42);
insert into COUNTY (countyid, countyname, cityid)
values (474, '振安区', 42);
insert into COUNTY (countyid, countyname, cityid)
values (475, '宽甸满族自治县', 42);
insert into COUNTY (countyid, countyname, cityid)
values (476, '东港市', 42);
insert into COUNTY (countyid, countyname, cityid)
values (477, '凤城市', 42);
insert into COUNTY (countyid, countyname, cityid)
values (478, '古塔区', 43);
insert into COUNTY (countyid, countyname, cityid)
values (479, '凌河区', 43);
insert into COUNTY (countyid, countyname, cityid)
values (480, '太和区', 43);
insert into COUNTY (countyid, countyname, cityid)
values (481, '黑山县', 43);
insert into COUNTY (countyid, countyname, cityid)
values (482, '义县', 43);
insert into COUNTY (countyid, countyname, cityid)
values (483, '凌海市', 43);
insert into COUNTY (countyid, countyname, cityid)
values (484, '北宁市', 43);
insert into COUNTY (countyid, countyname, cityid)
values (485, '站前区', 44);
insert into COUNTY (countyid, countyname, cityid)
values (486, '西市区', 44);
insert into COUNTY (countyid, countyname, cityid)
values (487, '鲅鱼圈区', 44);
insert into COUNTY (countyid, countyname, cityid)
values (488, '老边区', 44);
insert into COUNTY (countyid, countyname, cityid)
values (489, '盖州市', 44);
insert into COUNTY (countyid, countyname, cityid)
values (490, '大石桥市', 44);
insert into COUNTY (countyid, countyname, cityid)
values (491, '海州区', 45);
insert into COUNTY (countyid, countyname, cityid)
values (492, '新邱区', 45);
insert into COUNTY (countyid, countyname, cityid)
values (493, '太平区', 45);
insert into COUNTY (countyid, countyname, cityid)
values (494, '清河门区', 45);
insert into COUNTY (countyid, countyname, cityid)
values (495, '细河区', 45);
insert into COUNTY (countyid, countyname, cityid)
values (496, '阜新蒙古族自治县', 45);
insert into COUNTY (countyid, countyname, cityid)
values (497, '彰武县', 45);
insert into COUNTY (countyid, countyname, cityid)
values (498, '白塔区', 46);
insert into COUNTY (countyid, countyname, cityid)
values (499, '文圣区', 46);
insert into COUNTY (countyid, countyname, cityid)
values (500, '宏伟区', 46);
insert into COUNTY (countyid, countyname, cityid)
values (501, '弓长岭区', 46);
insert into COUNTY (countyid, countyname, cityid)
values (502, '太子河区', 46);
insert into COUNTY (countyid, countyname, cityid)
values (1951, '钟山县', 228);
insert into COUNTY (countyid, countyname, cityid)
values (1952, '富川瑶族自治县', 228);
insert into COUNTY (countyid, countyname, cityid)
values (1953, '金城江区', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1954, '南丹县', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1955, '天峨县', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1956, '凤山县', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1957, '东兰县', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1958, '罗城仫佬族自治县', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1959, '环江毛南族自治县', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1960, '巴马瑶族自治县', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1961, '都安瑶族自治县', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1962, '大化瑶族自治县', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1963, '宜州市', 229);
insert into COUNTY (countyid, countyname, cityid)
values (1964, '兴宾区', 230);
insert into COUNTY (countyid, countyname, cityid)
values (1965, '忻城县', 230);
insert into COUNTY (countyid, countyname, cityid)
values (1966, '象州县', 230);
insert into COUNTY (countyid, countyname, cityid)
values (1967, '武宣县', 230);
insert into COUNTY (countyid, countyname, cityid)
values (1968, '金秀瑶族自治县', 230);
insert into COUNTY (countyid, countyname, cityid)
values (1969, '合山市', 230);
insert into COUNTY (countyid, countyname, cityid)
values (1970, '江洲区', 231);
insert into COUNTY (countyid, countyname, cityid)
values (1971, '扶绥县', 231);
insert into COUNTY (countyid, countyname, cityid)
values (1972, '宁明县', 231);
insert into COUNTY (countyid, countyname, cityid)
values (1973, '龙州县', 231);
insert into COUNTY (countyid, countyname, cityid)
values (1974, '大新县', 231);
insert into COUNTY (countyid, countyname, cityid)
values (1975, '天等县', 231);
insert into COUNTY (countyid, countyname, cityid)
values (1976, '凭祥市', 231);
insert into COUNTY (countyid, countyname, cityid)
values (1977, '秀英区', 232);
insert into COUNTY (countyid, countyname, cityid)
values (1978, '龙华区', 232);
insert into COUNTY (countyid, countyname, cityid)
values (1979, '琼山区', 232);
insert into COUNTY (countyid, countyname, cityid)
values (1980, '美兰区', 232);
commit;
prompt 1100 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (1981, '五指山市', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1982, '琼海市', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1983, '儋州市', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1984, '文昌市', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1985, '万宁市', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1986, '东方市', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1987, '定安县', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1988, '屯昌县', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1989, '澄迈县', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1990, '临高县', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1991, '白沙黎族自治县', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1992, '昌江黎族自治县', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1993, '乐东黎族自治县', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1994, '陵水黎族自治县', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1995, '保亭黎族苗族自治县', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1996, '琼中黎族苗族自治县', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1997, '西沙群岛', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1998, '南沙群岛', 233);
insert into COUNTY (countyid, countyname, cityid)
values (1999, '中沙群岛的岛礁及其海域', 233);
insert into COUNTY (countyid, countyname, cityid)
values (2000, '万州区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2001, '涪陵区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2002, '渝中区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2003, '大渡口区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2004, '江北区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2005, '沙坪坝区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2006, '九龙坡区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2007, '南岸区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2008, '北碚区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2009, '万盛区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2010, '双桥区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2011, '渝北区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2012, '巴南区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2013, '黔江区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2014, '长寿区', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2015, '綦江县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2016, '潼南县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2017, '铜梁县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2018, '大足县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2019, '荣昌县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2020, '璧山县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2021, '梁平县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2022, '城口县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2023, '丰都县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2024, '垫江县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2025, '武隆县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2026, '忠县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2027, '开县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2028, '云阳县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2029, '奉节县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2030, '巫山县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2031, '巫溪县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2032, '石柱土家族自治县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2033, '秀山土家族苗族自治县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2034, '酉阳土家族苗族自治县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2035, '彭水苗族土家族自治县', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2036, '江津市', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2037, '合川市', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2038, '永川市', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2039, '南川市', 234);
insert into COUNTY (countyid, countyname, cityid)
values (2040, '锦江区', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2041, '青羊区', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2042, '金牛区', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2043, '武侯区', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2044, '成华区', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2045, '龙泉驿区', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2046, '青白江区', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2047, '新都区', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2048, '温江区', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2049, '金堂县', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2050, '双流县', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2051, '郫县', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2052, '大邑县', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2053, '蒲江县', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2054, '新津县', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2055, '都江堰市', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2056, '彭州市', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2057, '邛崃市', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2058, '崇州市', 235);
insert into COUNTY (countyid, countyname, cityid)
values (2059, '自流井区', 236);
insert into COUNTY (countyid, countyname, cityid)
values (2060, '贡井区', 236);
insert into COUNTY (countyid, countyname, cityid)
values (2061, '大安区', 236);
insert into COUNTY (countyid, countyname, cityid)
values (2062, '沿滩区', 236);
insert into COUNTY (countyid, countyname, cityid)
values (2063, '荣县', 236);
insert into COUNTY (countyid, countyname, cityid)
values (2064, '富顺县', 236);
insert into COUNTY (countyid, countyname, cityid)
values (2065, '东区', 237);
insert into COUNTY (countyid, countyname, cityid)
values (2066, '西区', 237);
insert into COUNTY (countyid, countyname, cityid)
values (2067, '仁和区', 237);
insert into COUNTY (countyid, countyname, cityid)
values (2068, '米易县', 237);
insert into COUNTY (countyid, countyname, cityid)
values (2069, '盐边县', 237);
insert into COUNTY (countyid, countyname, cityid)
values (2070, '江阳区', 238);
insert into COUNTY (countyid, countyname, cityid)
values (2071, '纳溪区', 238);
insert into COUNTY (countyid, countyname, cityid)
values (2072, '龙马潭区', 238);
insert into COUNTY (countyid, countyname, cityid)
values (2073, '泸县', 238);
insert into COUNTY (countyid, countyname, cityid)
values (2074, '合江县', 238);
insert into COUNTY (countyid, countyname, cityid)
values (2075, '叙永县', 238);
insert into COUNTY (countyid, countyname, cityid)
values (2076, '古蔺县', 238);
insert into COUNTY (countyid, countyname, cityid)
values (2077, '旌阳区', 239);
insert into COUNTY (countyid, countyname, cityid)
values (2078, '中江县', 239);
insert into COUNTY (countyid, countyname, cityid)
values (2079, '罗江县', 239);
insert into COUNTY (countyid, countyname, cityid)
values (2080, '广汉市', 239);
commit;
prompt 1200 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (2081, '什邡市', 239);
insert into COUNTY (countyid, countyname, cityid)
values (2082, '绵竹市', 239);
insert into COUNTY (countyid, countyname, cityid)
values (2083, '涪城区', 240);
insert into COUNTY (countyid, countyname, cityid)
values (2084, '游仙区', 240);
insert into COUNTY (countyid, countyname, cityid)
values (2085, '三台县', 240);
insert into COUNTY (countyid, countyname, cityid)
values (2086, '盐亭县', 240);
insert into COUNTY (countyid, countyname, cityid)
values (2087, '安县', 240);
insert into COUNTY (countyid, countyname, cityid)
values (2088, '梓潼县', 240);
insert into COUNTY (countyid, countyname, cityid)
values (2089, '北川羌族自治县', 240);
insert into COUNTY (countyid, countyname, cityid)
values (2090, '平武县', 240);
insert into COUNTY (countyid, countyname, cityid)
values (2091, '江油市', 240);
insert into COUNTY (countyid, countyname, cityid)
values (2092, '市中区', 241);
insert into COUNTY (countyid, countyname, cityid)
values (2093, '元坝区', 241);
insert into COUNTY (countyid, countyname, cityid)
values (2094, '朝天区', 241);
insert into COUNTY (countyid, countyname, cityid)
values (2095, '旺苍县', 241);
insert into COUNTY (countyid, countyname, cityid)
values (2096, '青川县', 241);
insert into COUNTY (countyid, countyname, cityid)
values (2097, '剑阁县', 241);
insert into COUNTY (countyid, countyname, cityid)
values (2098, '苍溪县', 241);
insert into COUNTY (countyid, countyname, cityid)
values (2099, '船山区', 242);
insert into COUNTY (countyid, countyname, cityid)
values (2100, '安居区', 242);
insert into COUNTY (countyid, countyname, cityid)
values (2101, '蓬溪县', 242);
insert into COUNTY (countyid, countyname, cityid)
values (2102, '射洪县', 242);
insert into COUNTY (countyid, countyname, cityid)
values (2103, '大英县', 242);
insert into COUNTY (countyid, countyname, cityid)
values (2104, '市中区', 243);
insert into COUNTY (countyid, countyname, cityid)
values (2105, '东兴区', 243);
insert into COUNTY (countyid, countyname, cityid)
values (2106, '威远县', 243);
insert into COUNTY (countyid, countyname, cityid)
values (2107, '资中县', 243);
insert into COUNTY (countyid, countyname, cityid)
values (2108, '隆昌县', 243);
insert into COUNTY (countyid, countyname, cityid)
values (2109, '市中区', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2110, '沙湾区', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2111, '五通桥区', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2112, '金口河区', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2113, '犍为县', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2114, '井研县', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2115, '夹江县', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2116, '沐川县', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2117, '峨边彝族自治县', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2118, '马边彝族自治县', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2119, '峨眉山市', 244);
insert into COUNTY (countyid, countyname, cityid)
values (2120, '顺庆区', 245);
insert into COUNTY (countyid, countyname, cityid)
values (2121, '高坪区', 245);
insert into COUNTY (countyid, countyname, cityid)
values (2122, '嘉陵区', 245);
insert into COUNTY (countyid, countyname, cityid)
values (2123, '南部县', 245);
insert into COUNTY (countyid, countyname, cityid)
values (2124, '营山县', 245);
insert into COUNTY (countyid, countyname, cityid)
values (2125, '蓬安县', 245);
insert into COUNTY (countyid, countyname, cityid)
values (2126, '仪陇县', 245);
insert into COUNTY (countyid, countyname, cityid)
values (2127, '西充县', 245);
insert into COUNTY (countyid, countyname, cityid)
values (2128, '阆中市', 245);
insert into COUNTY (countyid, countyname, cityid)
values (2129, '东坡区', 246);
insert into COUNTY (countyid, countyname, cityid)
values (2130, '仁寿县', 246);
insert into COUNTY (countyid, countyname, cityid)
values (2131, '彭山县', 246);
insert into COUNTY (countyid, countyname, cityid)
values (2132, '洪雅县', 246);
insert into COUNTY (countyid, countyname, cityid)
values (2133, '丹棱县', 246);
insert into COUNTY (countyid, countyname, cityid)
values (2134, '青神县', 246);
insert into COUNTY (countyid, countyname, cityid)
values (2135, '翠屏区', 247);
insert into COUNTY (countyid, countyname, cityid)
values (2136, '宜宾县', 247);
insert into COUNTY (countyid, countyname, cityid)
values (2137, '南溪县', 247);
insert into COUNTY (countyid, countyname, cityid)
values (2138, '江安县', 247);
insert into COUNTY (countyid, countyname, cityid)
values (2139, '长宁县', 247);
insert into COUNTY (countyid, countyname, cityid)
values (2140, '高县', 247);
insert into COUNTY (countyid, countyname, cityid)
values (2141, '珙县', 247);
insert into COUNTY (countyid, countyname, cityid)
values (2142, '筠连县', 247);
insert into COUNTY (countyid, countyname, cityid)
values (2143, '兴文县', 247);
insert into COUNTY (countyid, countyname, cityid)
values (2144, '屏山县', 247);
insert into COUNTY (countyid, countyname, cityid)
values (2145, '广安区', 248);
insert into COUNTY (countyid, countyname, cityid)
values (2146, '岳池县', 248);
insert into COUNTY (countyid, countyname, cityid)
values (2147, '武胜县', 248);
insert into COUNTY (countyid, countyname, cityid)
values (2148, '邻水县', 248);
insert into COUNTY (countyid, countyname, cityid)
values (2149, '华蓥市', 248);
insert into COUNTY (countyid, countyname, cityid)
values (2150, '通川区', 249);
insert into COUNTY (countyid, countyname, cityid)
values (2151, '达县', 249);
insert into COUNTY (countyid, countyname, cityid)
values (2152, '宣汉县', 249);
insert into COUNTY (countyid, countyname, cityid)
values (2153, '开江县', 249);
insert into COUNTY (countyid, countyname, cityid)
values (2154, '大竹县', 249);
insert into COUNTY (countyid, countyname, cityid)
values (2155, '渠县', 249);
insert into COUNTY (countyid, countyname, cityid)
values (2156, '万源市', 249);
insert into COUNTY (countyid, countyname, cityid)
values (2157, '雨城区', 250);
insert into COUNTY (countyid, countyname, cityid)
values (2158, '名山县', 250);
insert into COUNTY (countyid, countyname, cityid)
values (2159, '荥经县', 250);
insert into COUNTY (countyid, countyname, cityid)
values (2160, '汉源县', 250);
insert into COUNTY (countyid, countyname, cityid)
values (2161, '石棉县', 250);
insert into COUNTY (countyid, countyname, cityid)
values (2162, '天全县', 250);
insert into COUNTY (countyid, countyname, cityid)
values (2163, '芦山县', 250);
insert into COUNTY (countyid, countyname, cityid)
values (2164, '宝兴县', 250);
insert into COUNTY (countyid, countyname, cityid)
values (2165, '巴州区', 251);
insert into COUNTY (countyid, countyname, cityid)
values (2166, '通江县', 251);
insert into COUNTY (countyid, countyname, cityid)
values (2167, '南江县', 251);
insert into COUNTY (countyid, countyname, cityid)
values (2168, '平昌县', 251);
insert into COUNTY (countyid, countyname, cityid)
values (2169, '雁江区', 252);
insert into COUNTY (countyid, countyname, cityid)
values (2170, '安岳县', 252);
insert into COUNTY (countyid, countyname, cityid)
values (2171, '乐至县', 252);
insert into COUNTY (countyid, countyname, cityid)
values (2172, '简阳市', 252);
insert into COUNTY (countyid, countyname, cityid)
values (2173, '汶川县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2174, '理县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2175, '茂县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2176, '松潘县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2177, '九寨沟县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2178, '金川县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2179, '小金县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2180, '黑水县', 253);
commit;
prompt 1300 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (2181, '马尔康县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2182, '壤塘县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2183, '阿坝县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2184, '若尔盖县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2185, '红原县', 253);
insert into COUNTY (countyid, countyname, cityid)
values (2186, '康定县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2187, '泸定县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2188, '丹巴县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2189, '九龙县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2190, '雅江县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2191, '道孚县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2192, '炉霍县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2193, '甘孜县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2194, '新龙县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2195, '德格县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2196, '白玉县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2197, '石渠县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2198, '色达县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2199, '理塘县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2200, '巴塘县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2201, '乡城县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2202, '稻城县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2203, '得荣县', 254);
insert into COUNTY (countyid, countyname, cityid)
values (2204, '西昌市', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2205, '木里藏族自治县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2206, '盐源县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2207, '德昌县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2208, '会理县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2209, '会东县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2210, '宁南县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2211, '普格县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2212, '布拖县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2213, '金阳县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2214, '昭觉县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2215, '喜德县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2216, '冕宁县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2217, '越西县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2218, '甘洛县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2219, '美姑县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2220, '雷波县', 255);
insert into COUNTY (countyid, countyname, cityid)
values (2221, '南明区', 256);
insert into COUNTY (countyid, countyname, cityid)
values (2222, '云岩区', 256);
insert into COUNTY (countyid, countyname, cityid)
values (2223, '花溪区', 256);
insert into COUNTY (countyid, countyname, cityid)
values (2224, '乌当区', 256);
insert into COUNTY (countyid, countyname, cityid)
values (2225, '白云区', 256);
insert into COUNTY (countyid, countyname, cityid)
values (2226, '小河区', 256);
insert into COUNTY (countyid, countyname, cityid)
values (2227, '开阳县', 256);
insert into COUNTY (countyid, countyname, cityid)
values (2228, '息烽县', 256);
insert into COUNTY (countyid, countyname, cityid)
values (2229, '修文县', 256);
insert into COUNTY (countyid, countyname, cityid)
values (2230, '清镇市', 256);
insert into COUNTY (countyid, countyname, cityid)
values (2231, '钟山区', 257);
insert into COUNTY (countyid, countyname, cityid)
values (2232, '六枝特区', 257);
insert into COUNTY (countyid, countyname, cityid)
values (2233, '水城县', 257);
insert into COUNTY (countyid, countyname, cityid)
values (2234, '盘县', 257);
insert into COUNTY (countyid, countyname, cityid)
values (2235, '红花岗区', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2236, '汇川区', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2237, '遵义县', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2238, '桐梓县', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2239, '绥阳县', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2240, '正安县', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2241, '道真仡佬族苗族自治县', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2242, '务川仡佬族苗族自治县', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2243, '凤冈县', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2244, '湄潭县', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2245, '余庆县', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2246, '习水县', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2247, '赤水市', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2248, '仁怀市', 258);
insert into COUNTY (countyid, countyname, cityid)
values (2249, '西秀区', 259);
insert into COUNTY (countyid, countyname, cityid)
values (2250, '平坝县', 259);
insert into COUNTY (countyid, countyname, cityid)
values (2251, '普定县', 259);
insert into COUNTY (countyid, countyname, cityid)
values (2252, '镇宁布依族苗族自治县', 259);
insert into COUNTY (countyid, countyname, cityid)
values (2253, '关岭布依族苗族自治县', 259);
insert into COUNTY (countyid, countyname, cityid)
values (2254, '紫云苗族布依族自治县', 259);
insert into COUNTY (countyid, countyname, cityid)
values (2255, '铜仁市', 260);
insert into COUNTY (countyid, countyname, cityid)
values (2256, '江口县', 260);
insert into COUNTY (countyid, countyname, cityid)
values (2257, '玉屏侗族自治县', 260);
insert into COUNTY (countyid, countyname, cityid)
values (2258, '石阡县', 260);
insert into COUNTY (countyid, countyname, cityid)
values (2259, '思南县', 260);
insert into COUNTY (countyid, countyname, cityid)
values (2260, '印江土家族苗族自治县', 260);
insert into COUNTY (countyid, countyname, cityid)
values (2261, '德江县', 260);
insert into COUNTY (countyid, countyname, cityid)
values (2262, '沿河土家族自治县', 260);
insert into COUNTY (countyid, countyname, cityid)
values (2263, '松桃苗族自治县', 260);
insert into COUNTY (countyid, countyname, cityid)
values (2264, '万山特区', 260);
insert into COUNTY (countyid, countyname, cityid)
values (2265, '兴义市', 261);
insert into COUNTY (countyid, countyname, cityid)
values (2266, '兴仁县', 261);
insert into COUNTY (countyid, countyname, cityid)
values (2267, '普安县', 261);
insert into COUNTY (countyid, countyname, cityid)
values (2268, '晴隆县', 261);
insert into COUNTY (countyid, countyname, cityid)
values (2269, '贞丰县', 261);
insert into COUNTY (countyid, countyname, cityid)
values (2270, '望谟县', 261);
insert into COUNTY (countyid, countyname, cityid)
values (2271, '册亨县', 261);
insert into COUNTY (countyid, countyname, cityid)
values (2272, '安龙县', 261);
insert into COUNTY (countyid, countyname, cityid)
values (2273, '毕节市', 262);
insert into COUNTY (countyid, countyname, cityid)
values (2274, '大方县', 262);
insert into COUNTY (countyid, countyname, cityid)
values (2275, '黔西县', 262);
insert into COUNTY (countyid, countyname, cityid)
values (2276, '金沙县', 262);
insert into COUNTY (countyid, countyname, cityid)
values (2277, '织金县', 262);
insert into COUNTY (countyid, countyname, cityid)
values (2278, '纳雍县', 262);
insert into COUNTY (countyid, countyname, cityid)
values (2279, '威宁彝族回族苗族自治县', 262);
insert into COUNTY (countyid, countyname, cityid)
values (2280, '赫章县', 262);
commit;
prompt 1400 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (2281, '凯里市', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2282, '黄平县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2283, '施秉县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2284, '三穗县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2285, '镇远县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2286, '岑巩县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2287, '天柱县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2288, '锦屏县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2289, '剑河县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2290, '台江县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2291, '黎平县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2292, '榕江县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2293, '从江县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2294, '雷山县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (2295, '麻江县', 263);
insert into COUNTY (countyid, countyname, cityid)
values (1593, '洪湖市', 177);
insert into COUNTY (countyid, countyname, cityid)
values (1594, '松滋市', 177);
insert into COUNTY (countyid, countyname, cityid)
values (1595, '黄州区', 178);
insert into COUNTY (countyid, countyname, cityid)
values (1596, '团风县', 178);
insert into COUNTY (countyid, countyname, cityid)
values (1597, '红安县', 178);
insert into COUNTY (countyid, countyname, cityid)
values (1598, '罗田县', 178);
insert into COUNTY (countyid, countyname, cityid)
values (1599, '英山县', 178);
insert into COUNTY (countyid, countyname, cityid)
values (1600, '浠水县', 178);
insert into COUNTY (countyid, countyname, cityid)
values (1601, '蕲春县', 178);
insert into COUNTY (countyid, countyname, cityid)
values (1602, '黄梅县', 178);
insert into COUNTY (countyid, countyname, cityid)
values (1603, '麻城市', 178);
insert into COUNTY (countyid, countyname, cityid)
values (1604, '武穴市', 178);
insert into COUNTY (countyid, countyname, cityid)
values (1605, '咸安区', 179);
insert into COUNTY (countyid, countyname, cityid)
values (1606, '嘉鱼县', 179);
insert into COUNTY (countyid, countyname, cityid)
values (1607, '通城县', 179);
insert into COUNTY (countyid, countyname, cityid)
values (1608, '崇阳县', 179);
insert into COUNTY (countyid, countyname, cityid)
values (1609, '通山县', 179);
insert into COUNTY (countyid, countyname, cityid)
values (1610, '赤壁市', 179);
insert into COUNTY (countyid, countyname, cityid)
values (1611, '曾都区', 180);
insert into COUNTY (countyid, countyname, cityid)
values (1612, '广水市', 180);
insert into COUNTY (countyid, countyname, cityid)
values (1613, '恩施市', 181);
insert into COUNTY (countyid, countyname, cityid)
values (1614, '利川市', 181);
insert into COUNTY (countyid, countyname, cityid)
values (1615, '建始县', 181);
insert into COUNTY (countyid, countyname, cityid)
values (1616, '巴东县', 181);
insert into COUNTY (countyid, countyname, cityid)
values (1617, '宣恩县', 181);
insert into COUNTY (countyid, countyname, cityid)
values (1618, '咸丰县', 181);
insert into COUNTY (countyid, countyname, cityid)
values (1619, '来凤县', 181);
insert into COUNTY (countyid, countyname, cityid)
values (1620, '鹤峰县', 181);
insert into COUNTY (countyid, countyname, cityid)
values (1621, '仙桃市', 182);
insert into COUNTY (countyid, countyname, cityid)
values (1622, '潜江市', 182);
insert into COUNTY (countyid, countyname, cityid)
values (1623, '天门市', 182);
insert into COUNTY (countyid, countyname, cityid)
values (1624, '神农架林区', 182);
insert into COUNTY (countyid, countyname, cityid)
values (1625, '芙蓉区', 183);
insert into COUNTY (countyid, countyname, cityid)
values (1626, '天心区', 183);
insert into COUNTY (countyid, countyname, cityid)
values (1627, '岳麓区', 183);
insert into COUNTY (countyid, countyname, cityid)
values (1628, '开福区', 183);
insert into COUNTY (countyid, countyname, cityid)
values (1629, '雨花区', 183);
insert into COUNTY (countyid, countyname, cityid)
values (1630, '长沙县', 183);
insert into COUNTY (countyid, countyname, cityid)
values (1631, '望城县', 183);
insert into COUNTY (countyid, countyname, cityid)
values (1632, '宁乡县', 183);
insert into COUNTY (countyid, countyname, cityid)
values (1633, '浏阳市', 183);
insert into COUNTY (countyid, countyname, cityid)
values (1634, '荷塘区', 184);
insert into COUNTY (countyid, countyname, cityid)
values (1635, '芦淞区', 184);
insert into COUNTY (countyid, countyname, cityid)
values (1636, '石峰区', 184);
insert into COUNTY (countyid, countyname, cityid)
values (1637, '天元区', 184);
insert into COUNTY (countyid, countyname, cityid)
values (1638, '株洲县', 184);
insert into COUNTY (countyid, countyname, cityid)
values (1639, '攸县', 184);
insert into COUNTY (countyid, countyname, cityid)
values (1640, '茶陵县', 184);
insert into COUNTY (countyid, countyname, cityid)
values (1641, '炎陵县', 184);
insert into COUNTY (countyid, countyname, cityid)
values (1642, '醴陵市', 184);
insert into COUNTY (countyid, countyname, cityid)
values (1643, '雨湖区', 185);
insert into COUNTY (countyid, countyname, cityid)
values (1644, '岳塘区', 185);
insert into COUNTY (countyid, countyname, cityid)
values (1645, '湘潭县', 185);
insert into COUNTY (countyid, countyname, cityid)
values (1646, '湘乡市', 185);
insert into COUNTY (countyid, countyname, cityid)
values (1647, '韶山市', 185);
insert into COUNTY (countyid, countyname, cityid)
values (1648, '珠晖区', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1649, '雁峰区', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1650, '石鼓区', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1651, '蒸湘区', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1652, '南岳区', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1653, '衡阳县', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1654, '衡南县', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1655, '衡山县', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1656, '衡东县', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1657, '祁东县', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1658, '耒阳市', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1659, '常宁市', 186);
insert into COUNTY (countyid, countyname, cityid)
values (1660, '双清区', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1661, '大祥区', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1662, '北塔区', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1663, '邵东县', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1664, '新邵县', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1665, '邵阳县', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1666, '隆回县', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1667, '洞口县', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1668, '绥宁县', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1669, '新宁县', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1670, '城步苗族自治县', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1671, '武冈市', 187);
insert into COUNTY (countyid, countyname, cityid)
values (1672, '岳阳楼区', 188);
insert into COUNTY (countyid, countyname, cityid)
values (1673, '云溪区', 188);
insert into COUNTY (countyid, countyname, cityid)
values (1674, '君山区', 188);
insert into COUNTY (countyid, countyname, cityid)
values (1675, '岳阳县', 188);
insert into COUNTY (countyid, countyname, cityid)
values (1676, '华容县', 188);
insert into COUNTY (countyid, countyname, cityid)
values (1677, '湘阴县', 188);
commit;
prompt 1500 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (1678, '平江县', 188);
insert into COUNTY (countyid, countyname, cityid)
values (1679, '汨罗市', 188);
insert into COUNTY (countyid, countyname, cityid)
values (1680, '临湘市', 188);
insert into COUNTY (countyid, countyname, cityid)
values (1681, '武陵区', 189);
insert into COUNTY (countyid, countyname, cityid)
values (1682, '鼎城区', 189);
insert into COUNTY (countyid, countyname, cityid)
values (1683, '安乡县', 189);
insert into COUNTY (countyid, countyname, cityid)
values (1684, '汉寿县', 189);
insert into COUNTY (countyid, countyname, cityid)
values (1685, '澧县', 189);
insert into COUNTY (countyid, countyname, cityid)
values (1686, '临澧县', 189);
insert into COUNTY (countyid, countyname, cityid)
values (1687, '桃源县', 189);
insert into COUNTY (countyid, countyname, cityid)
values (1688, '石门县', 189);
insert into COUNTY (countyid, countyname, cityid)
values (1689, '津市市', 189);
insert into COUNTY (countyid, countyname, cityid)
values (1690, '永定区', 190);
insert into COUNTY (countyid, countyname, cityid)
values (1691, '武陵源区', 190);
insert into COUNTY (countyid, countyname, cityid)
values (1692, '慈利县', 190);
insert into COUNTY (countyid, countyname, cityid)
values (1693, '桑植县', 190);
insert into COUNTY (countyid, countyname, cityid)
values (1694, '资阳区', 191);
insert into COUNTY (countyid, countyname, cityid)
values (1695, '赫山区', 191);
insert into COUNTY (countyid, countyname, cityid)
values (1696, '南县', 191);
insert into COUNTY (countyid, countyname, cityid)
values (1697, '桃江县', 191);
insert into COUNTY (countyid, countyname, cityid)
values (1698, '安化县', 191);
insert into COUNTY (countyid, countyname, cityid)
values (1699, '沅江市', 191);
insert into COUNTY (countyid, countyname, cityid)
values (1700, '北湖区', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1701, '苏仙区', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1702, '桂阳县', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1703, '宜章县', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1704, '永兴县', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1705, '嘉禾县', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1706, '临武县', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1707, '汝城县', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1708, '桂东县', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1709, '安仁县', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1710, '资兴市', 192);
insert into COUNTY (countyid, countyname, cityid)
values (1711, '芝山区', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1712, '冷水滩区', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1713, '祁阳县', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1714, '东安县', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1715, '双牌县', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1716, '道县', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1717, '江永县', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1718, '宁远县', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1719, '蓝山县', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1720, '新田县', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1721, '江华瑶族自治县', 193);
insert into COUNTY (countyid, countyname, cityid)
values (1722, '鹤城区', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1723, '中方县', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1724, '沅陵县', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1725, '辰溪县', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1726, '溆浦县', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1727, '会同县', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1728, '麻阳苗族自治县', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1729, '新晃侗族自治县', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1730, '芷江侗族自治县', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1731, '靖州苗族侗族自治县', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1732, '通道侗族自治县', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1733, '洪江市', 194);
insert into COUNTY (countyid, countyname, cityid)
values (1734, '娄星区', 195);
insert into COUNTY (countyid, countyname, cityid)
values (1735, '双峰县', 195);
insert into COUNTY (countyid, countyname, cityid)
values (1736, '新化县', 195);
insert into COUNTY (countyid, countyname, cityid)
values (1737, '冷水江市', 195);
insert into COUNTY (countyid, countyname, cityid)
values (1738, '涟源市', 195);
insert into COUNTY (countyid, countyname, cityid)
values (1739, '吉首市', 196);
insert into COUNTY (countyid, countyname, cityid)
values (1740, '泸溪县', 196);
insert into COUNTY (countyid, countyname, cityid)
values (1741, '凤凰县', 196);
insert into COUNTY (countyid, countyname, cityid)
values (1742, '花垣县', 196);
insert into COUNTY (countyid, countyname, cityid)
values (1743, '保靖县', 196);
insert into COUNTY (countyid, countyname, cityid)
values (1744, '古丈县', 196);
insert into COUNTY (countyid, countyname, cityid)
values (1745, '永顺县', 196);
insert into COUNTY (countyid, countyname, cityid)
values (1746, '龙山县', 196);
insert into COUNTY (countyid, countyname, cityid)
values (1747, '东山区', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1748, '荔湾区', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1749, '越秀区', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1750, '海珠区', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1751, '天河区', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1752, '芳村区', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1753, '白云区', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1754, '黄埔区', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1755, '番禺区', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1756, '花都区', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1757, '增城市', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1758, '从化市', 197);
insert into COUNTY (countyid, countyname, cityid)
values (1759, '武江区', 198);
insert into COUNTY (countyid, countyname, cityid)
values (1760, '浈江区', 198);
insert into COUNTY (countyid, countyname, cityid)
values (1761, '曲江区', 198);
insert into COUNTY (countyid, countyname, cityid)
values (1762, '始兴县', 198);
insert into COUNTY (countyid, countyname, cityid)
values (1763, '仁化县', 198);
insert into COUNTY (countyid, countyname, cityid)
values (1764, '翁源县', 198);
insert into COUNTY (countyid, countyname, cityid)
values (1765, '乳源瑶族自治县', 198);
insert into COUNTY (countyid, countyname, cityid)
values (1766, '新丰县', 198);
insert into COUNTY (countyid, countyname, cityid)
values (1767, '乐昌市', 198);
insert into COUNTY (countyid, countyname, cityid)
values (1768, '南雄市', 198);
insert into COUNTY (countyid, countyname, cityid)
values (1769, '罗湖区', 199);
insert into COUNTY (countyid, countyname, cityid)
values (1770, '福田区', 199);
insert into COUNTY (countyid, countyname, cityid)
values (1771, '南山区', 199);
insert into COUNTY (countyid, countyname, cityid)
values (1772, '宝安区', 199);
insert into COUNTY (countyid, countyname, cityid)
values (1773, '龙岗区', 199);
insert into COUNTY (countyid, countyname, cityid)
values (1774, '盐田区', 199);
insert into COUNTY (countyid, countyname, cityid)
values (1775, '香洲区', 200);
insert into COUNTY (countyid, countyname, cityid)
values (1776, '斗门区', 200);
insert into COUNTY (countyid, countyname, cityid)
values (1777, '金湾区', 200);
commit;
prompt 1600 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (1778, '龙湖区', 201);
insert into COUNTY (countyid, countyname, cityid)
values (1779, '金平区', 201);
insert into COUNTY (countyid, countyname, cityid)
values (1780, '濠江区', 201);
insert into COUNTY (countyid, countyname, cityid)
values (1781, '潮阳区', 201);
insert into COUNTY (countyid, countyname, cityid)
values (1782, '潮南区', 201);
insert into COUNTY (countyid, countyname, cityid)
values (1783, '澄海区', 201);
insert into COUNTY (countyid, countyname, cityid)
values (1784, '南澳县', 201);
insert into COUNTY (countyid, countyname, cityid)
values (1785, '禅城区', 202);
insert into COUNTY (countyid, countyname, cityid)
values (1786, '南海区', 202);
insert into COUNTY (countyid, countyname, cityid)
values (1787, '顺德区', 202);
insert into COUNTY (countyid, countyname, cityid)
values (1788, '三水区', 202);
insert into COUNTY (countyid, countyname, cityid)
values (1789, '高明区', 202);
insert into COUNTY (countyid, countyname, cityid)
values (1790, '蓬江区', 203);
insert into COUNTY (countyid, countyname, cityid)
values (1791, '江海区', 203);
insert into COUNTY (countyid, countyname, cityid)
values (1792, '新会区', 203);
insert into COUNTY (countyid, countyname, cityid)
values (1793, '台山市', 203);
insert into COUNTY (countyid, countyname, cityid)
values (1794, '开平市', 203);
insert into COUNTY (countyid, countyname, cityid)
values (1795, '鹤山市', 203);
insert into COUNTY (countyid, countyname, cityid)
values (1796, '恩平市', 203);
insert into COUNTY (countyid, countyname, cityid)
values (1797, '赤坎区', 204);
insert into COUNTY (countyid, countyname, cityid)
values (1798, '霞山区', 204);
insert into COUNTY (countyid, countyname, cityid)
values (1799, '坡头区', 204);
insert into COUNTY (countyid, countyname, cityid)
values (1800, '麻章区', 204);
insert into COUNTY (countyid, countyname, cityid)
values (1801, '遂溪县', 204);
insert into COUNTY (countyid, countyname, cityid)
values (1802, '徐闻县', 204);
insert into COUNTY (countyid, countyname, cityid)
values (1803, '廉江市', 204);
insert into COUNTY (countyid, countyname, cityid)
values (1804, '雷州市', 204);
insert into COUNTY (countyid, countyname, cityid)
values (1805, '吴川市', 204);
insert into COUNTY (countyid, countyname, cityid)
values (1806, '茂南区', 205);
insert into COUNTY (countyid, countyname, cityid)
values (1807, '茂港区', 205);
insert into COUNTY (countyid, countyname, cityid)
values (1808, '电白县', 205);
insert into COUNTY (countyid, countyname, cityid)
values (1809, '高州市', 205);
insert into COUNTY (countyid, countyname, cityid)
values (1810, '化州市', 205);
insert into COUNTY (countyid, countyname, cityid)
values (1811, '信宜市', 205);
insert into COUNTY (countyid, countyname, cityid)
values (1812, '端州区', 206);
insert into COUNTY (countyid, countyname, cityid)
values (1813, '鼎湖区', 206);
insert into COUNTY (countyid, countyname, cityid)
values (1814, '广宁县', 206);
insert into COUNTY (countyid, countyname, cityid)
values (1815, '怀集县', 206);
insert into COUNTY (countyid, countyname, cityid)
values (1816, '封开县', 206);
insert into COUNTY (countyid, countyname, cityid)
values (1817, '德庆县', 206);
insert into COUNTY (countyid, countyname, cityid)
values (1818, '高要市', 206);
insert into COUNTY (countyid, countyname, cityid)
values (1819, '四会市', 206);
insert into COUNTY (countyid, countyname, cityid)
values (1820, '惠城区', 207);
insert into COUNTY (countyid, countyname, cityid)
values (1821, '惠阳区', 207);
insert into COUNTY (countyid, countyname, cityid)
values (1822, '博罗县', 207);
insert into COUNTY (countyid, countyname, cityid)
values (1823, '惠东县', 207);
insert into COUNTY (countyid, countyname, cityid)
values (1824, '龙门县', 207);
insert into COUNTY (countyid, countyname, cityid)
values (1825, '梅江区', 208);
insert into COUNTY (countyid, countyname, cityid)
values (1826, '梅县', 208);
insert into COUNTY (countyid, countyname, cityid)
values (1827, '大埔县', 208);
insert into COUNTY (countyid, countyname, cityid)
values (1828, '丰顺县', 208);
insert into COUNTY (countyid, countyname, cityid)
values (1829, '五华县', 208);
insert into COUNTY (countyid, countyname, cityid)
values (1830, '平远县', 208);
insert into COUNTY (countyid, countyname, cityid)
values (1831, '蕉岭县', 208);
insert into COUNTY (countyid, countyname, cityid)
values (1832, '兴宁市', 208);
insert into COUNTY (countyid, countyname, cityid)
values (1833, '城区', 209);
insert into COUNTY (countyid, countyname, cityid)
values (1834, '海丰县', 209);
insert into COUNTY (countyid, countyname, cityid)
values (1835, '陆河县', 209);
insert into COUNTY (countyid, countyname, cityid)
values (1836, '陆丰市', 209);
insert into COUNTY (countyid, countyname, cityid)
values (1837, '源城区', 210);
insert into COUNTY (countyid, countyname, cityid)
values (1838, '紫金县', 210);
insert into COUNTY (countyid, countyname, cityid)
values (1839, '龙川县', 210);
insert into COUNTY (countyid, countyname, cityid)
values (1840, '连平县', 210);
insert into COUNTY (countyid, countyname, cityid)
values (1841, '和平县', 210);
insert into COUNTY (countyid, countyname, cityid)
values (1842, '东源县', 210);
insert into COUNTY (countyid, countyname, cityid)
values (1843, '江城区', 211);
insert into COUNTY (countyid, countyname, cityid)
values (1844, '阳西县', 211);
insert into COUNTY (countyid, countyname, cityid)
values (1845, '阳东县', 211);
insert into COUNTY (countyid, countyname, cityid)
values (1846, '阳春市', 211);
insert into COUNTY (countyid, countyname, cityid)
values (1847, '清城区', 212);
insert into COUNTY (countyid, countyname, cityid)
values (1848, '佛冈县', 212);
insert into COUNTY (countyid, countyname, cityid)
values (1849, '阳山县', 212);
insert into COUNTY (countyid, countyname, cityid)
values (1850, '连山壮族瑶族自治县', 212);
insert into COUNTY (countyid, countyname, cityid)
values (1851, '连南瑶族自治县', 212);
insert into COUNTY (countyid, countyname, cityid)
values (1852, '清新县', 212);
insert into COUNTY (countyid, countyname, cityid)
values (1853, '英德市', 212);
insert into COUNTY (countyid, countyname, cityid)
values (1854, '连州市', 212);
insert into COUNTY (countyid, countyname, cityid)
values (1855, '湘桥区', 215);
insert into COUNTY (countyid, countyname, cityid)
values (1856, '潮安县', 215);
insert into COUNTY (countyid, countyname, cityid)
values (1857, '饶平县', 215);
insert into COUNTY (countyid, countyname, cityid)
values (1858, '榕城区', 216);
insert into COUNTY (countyid, countyname, cityid)
values (1859, '揭东县', 216);
insert into COUNTY (countyid, countyname, cityid)
values (1860, '揭西县', 216);
insert into COUNTY (countyid, countyname, cityid)
values (1861, '惠来县', 216);
insert into COUNTY (countyid, countyname, cityid)
values (1862, '普宁市', 216);
insert into COUNTY (countyid, countyname, cityid)
values (1863, '云城区', 217);
insert into COUNTY (countyid, countyname, cityid)
values (1864, '新兴县', 217);
insert into COUNTY (countyid, countyname, cityid)
values (1865, '郁南县', 217);
insert into COUNTY (countyid, countyname, cityid)
values (1866, '云安县', 217);
insert into COUNTY (countyid, countyname, cityid)
values (1867, '罗定市', 217);
insert into COUNTY (countyid, countyname, cityid)
values (1868, '兴宁区', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1869, '青秀区', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1870, '江南区', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1871, '西乡塘区', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1872, '良庆区', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1873, '邕宁区', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1874, '武鸣县', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1875, '隆安县', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1876, '马山县', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1877, '上林县', 218);
commit;
prompt 1700 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (1878, '宾阳县', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1879, '横县', 218);
insert into COUNTY (countyid, countyname, cityid)
values (1880, '城中区', 219);
insert into COUNTY (countyid, countyname, cityid)
values (1881, '鱼峰区', 219);
insert into COUNTY (countyid, countyname, cityid)
values (1882, '柳南区', 219);
insert into COUNTY (countyid, countyname, cityid)
values (1883, '柳北区', 219);
insert into COUNTY (countyid, countyname, cityid)
values (1884, '柳江县', 219);
insert into COUNTY (countyid, countyname, cityid)
values (1885, '柳城县', 219);
insert into COUNTY (countyid, countyname, cityid)
values (1886, '鹿寨县', 219);
insert into COUNTY (countyid, countyname, cityid)
values (1887, '融安县', 219);
insert into COUNTY (countyid, countyname, cityid)
values (1888, '融水苗族自治县', 219);
insert into COUNTY (countyid, countyname, cityid)
values (1889, '三江侗族自治县', 219);
insert into COUNTY (countyid, countyname, cityid)
values (1890, '秀峰区', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1891, '叠彩区', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1892, '象山区', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1893, '七星区', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1894, '雁山区', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1895, '阳朔县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1896, '临桂县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1897, '灵川县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1898, '全州县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1899, '兴安县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1900, '永福县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1901, '灌阳县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1902, '龙胜各族自治县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1903, '资源县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1904, '平乐县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1905, '荔蒲县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1906, '恭城瑶族自治县', 220);
insert into COUNTY (countyid, countyname, cityid)
values (1907, '万秀区', 221);
insert into COUNTY (countyid, countyname, cityid)
values (1908, '蝶山区', 221);
insert into COUNTY (countyid, countyname, cityid)
values (1909, '长洲区', 221);
insert into COUNTY (countyid, countyname, cityid)
values (1910, '苍梧县', 221);
insert into COUNTY (countyid, countyname, cityid)
values (1911, '藤县', 221);
insert into COUNTY (countyid, countyname, cityid)
values (1912, '蒙山县', 221);
insert into COUNTY (countyid, countyname, cityid)
values (1913, '岑溪市', 221);
insert into COUNTY (countyid, countyname, cityid)
values (1914, '海城区', 222);
insert into COUNTY (countyid, countyname, cityid)
values (1915, '银海区', 222);
insert into COUNTY (countyid, countyname, cityid)
values (1916, '铁山港区', 222);
insert into COUNTY (countyid, countyname, cityid)
values (1917, '合浦县', 222);
insert into COUNTY (countyid, countyname, cityid)
values (1918, '港口区', 223);
insert into COUNTY (countyid, countyname, cityid)
values (1919, '防城区', 223);
insert into COUNTY (countyid, countyname, cityid)
values (1920, '上思县', 223);
insert into COUNTY (countyid, countyname, cityid)
values (1921, '东兴市', 223);
insert into COUNTY (countyid, countyname, cityid)
values (1922, '钦南区', 224);
insert into COUNTY (countyid, countyname, cityid)
values (1923, '钦北区', 224);
insert into COUNTY (countyid, countyname, cityid)
values (1924, '灵山县', 224);
insert into COUNTY (countyid, countyname, cityid)
values (1925, '浦北县', 224);
insert into COUNTY (countyid, countyname, cityid)
values (1926, '港北区', 225);
insert into COUNTY (countyid, countyname, cityid)
values (1927, '港南区', 225);
insert into COUNTY (countyid, countyname, cityid)
values (1928, '覃塘区', 225);
insert into COUNTY (countyid, countyname, cityid)
values (1929, '平南县', 225);
insert into COUNTY (countyid, countyname, cityid)
values (1930, '桂平市', 225);
insert into COUNTY (countyid, countyname, cityid)
values (1931, '玉州区', 226);
insert into COUNTY (countyid, countyname, cityid)
values (1932, '容县', 226);
insert into COUNTY (countyid, countyname, cityid)
values (1933, '陆川县', 226);
insert into COUNTY (countyid, countyname, cityid)
values (1934, '博白县', 226);
insert into COUNTY (countyid, countyname, cityid)
values (1935, '兴业县', 226);
insert into COUNTY (countyid, countyname, cityid)
values (1936, '北流市', 226);
insert into COUNTY (countyid, countyname, cityid)
values (1937, '右江区', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1938, '田阳县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1939, '田东县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1940, '平果县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1941, '德保县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1942, '靖西县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1943, '那坡县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1944, '凌云县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1945, '乐业县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1946, '田林县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1947, '西林县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1948, '隆林各族自治县', 227);
insert into COUNTY (countyid, countyname, cityid)
values (1949, '八步区', 228);
insert into COUNTY (countyid, countyname, cityid)
values (503, '辽阳县', 46);
insert into COUNTY (countyid, countyname, cityid)
values (504, '灯塔市', 46);
insert into COUNTY (countyid, countyname, cityid)
values (505, '双台子区', 47);
insert into COUNTY (countyid, countyname, cityid)
values (506, '兴隆台区', 47);
insert into COUNTY (countyid, countyname, cityid)
values (507, '大洼县', 47);
insert into COUNTY (countyid, countyname, cityid)
values (508, '盘山县', 47);
insert into COUNTY (countyid, countyname, cityid)
values (509, '银州区', 48);
insert into COUNTY (countyid, countyname, cityid)
values (510, '清河区', 48);
insert into COUNTY (countyid, countyname, cityid)
values (511, '铁岭县', 48);
insert into COUNTY (countyid, countyname, cityid)
values (512, '西丰县', 48);
insert into COUNTY (countyid, countyname, cityid)
values (513, '昌图县', 48);
insert into COUNTY (countyid, countyname, cityid)
values (514, '调兵山市', 48);
insert into COUNTY (countyid, countyname, cityid)
values (515, '开原市', 48);
insert into COUNTY (countyid, countyname, cityid)
values (516, '双塔区', 49);
insert into COUNTY (countyid, countyname, cityid)
values (517, '龙城区', 49);
insert into COUNTY (countyid, countyname, cityid)
values (518, '朝阳县', 49);
insert into COUNTY (countyid, countyname, cityid)
values (519, '建平县', 49);
insert into COUNTY (countyid, countyname, cityid)
values (520, '喀喇沁左翼蒙古族自治县', 49);
insert into COUNTY (countyid, countyname, cityid)
values (521, '北票市', 49);
insert into COUNTY (countyid, countyname, cityid)
values (522, '凌源市', 49);
insert into COUNTY (countyid, countyname, cityid)
values (523, '连山区', 50);
insert into COUNTY (countyid, countyname, cityid)
values (524, '龙港区', 50);
insert into COUNTY (countyid, countyname, cityid)
values (525, '南票区', 50);
insert into COUNTY (countyid, countyname, cityid)
values (526, '绥中县', 50);
insert into COUNTY (countyid, countyname, cityid)
values (527, '建昌县', 50);
insert into COUNTY (countyid, countyname, cityid)
values (528, '兴城市', 50);
insert into COUNTY (countyid, countyname, cityid)
values (529, '南关区', 51);
insert into COUNTY (countyid, countyname, cityid)
values (530, '宽城区', 51);
commit;
prompt 1800 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (531, '朝阳区', 51);
insert into COUNTY (countyid, countyname, cityid)
values (532, '二道区', 51);
insert into COUNTY (countyid, countyname, cityid)
values (533, '绿园区', 51);
insert into COUNTY (countyid, countyname, cityid)
values (534, '双阳区', 51);
insert into COUNTY (countyid, countyname, cityid)
values (535, '农安县', 51);
insert into COUNTY (countyid, countyname, cityid)
values (536, '九台市', 51);
insert into COUNTY (countyid, countyname, cityid)
values (537, '榆树市', 51);
insert into COUNTY (countyid, countyname, cityid)
values (538, '德惠市', 51);
insert into COUNTY (countyid, countyname, cityid)
values (539, '昌邑区', 52);
insert into COUNTY (countyid, countyname, cityid)
values (540, '龙潭区', 52);
insert into COUNTY (countyid, countyname, cityid)
values (541, '船营区', 52);
insert into COUNTY (countyid, countyname, cityid)
values (542, '丰满区', 52);
insert into COUNTY (countyid, countyname, cityid)
values (543, '永吉县', 52);
insert into COUNTY (countyid, countyname, cityid)
values (544, '蛟河市', 52);
insert into COUNTY (countyid, countyname, cityid)
values (545, '桦甸市', 52);
insert into COUNTY (countyid, countyname, cityid)
values (546, '舒兰市', 52);
insert into COUNTY (countyid, countyname, cityid)
values (547, '磐石市', 52);
insert into COUNTY (countyid, countyname, cityid)
values (548, '铁西区', 53);
insert into COUNTY (countyid, countyname, cityid)
values (549, '铁东区', 53);
insert into COUNTY (countyid, countyname, cityid)
values (550, '梨树县', 53);
insert into COUNTY (countyid, countyname, cityid)
values (551, '伊通满族自治县', 53);
insert into COUNTY (countyid, countyname, cityid)
values (552, '公主岭市', 53);
insert into COUNTY (countyid, countyname, cityid)
values (553, '双辽市', 53);
insert into COUNTY (countyid, countyname, cityid)
values (554, '龙山区', 54);
insert into COUNTY (countyid, countyname, cityid)
values (555, '西安区', 54);
insert into COUNTY (countyid, countyname, cityid)
values (556, '东丰县', 54);
insert into COUNTY (countyid, countyname, cityid)
values (557, '东辽县', 54);
insert into COUNTY (countyid, countyname, cityid)
values (558, '东昌区', 55);
insert into COUNTY (countyid, countyname, cityid)
values (559, '二道江区', 55);
insert into COUNTY (countyid, countyname, cityid)
values (560, '通化县', 55);
insert into COUNTY (countyid, countyname, cityid)
values (561, '辉南县', 55);
insert into COUNTY (countyid, countyname, cityid)
values (562, '柳河县', 55);
insert into COUNTY (countyid, countyname, cityid)
values (563, '梅河口市', 55);
insert into COUNTY (countyid, countyname, cityid)
values (564, '集安市', 55);
insert into COUNTY (countyid, countyname, cityid)
values (565, '八道江区', 56);
insert into COUNTY (countyid, countyname, cityid)
values (566, '抚松县', 56);
insert into COUNTY (countyid, countyname, cityid)
values (567, '靖宇县', 56);
insert into COUNTY (countyid, countyname, cityid)
values (568, '长白朝鲜族自治县', 56);
insert into COUNTY (countyid, countyname, cityid)
values (569, '江源县', 56);
insert into COUNTY (countyid, countyname, cityid)
values (570, '临江市', 56);
insert into COUNTY (countyid, countyname, cityid)
values (571, '宁江区', 57);
insert into COUNTY (countyid, countyname, cityid)
values (572, '前郭尔罗斯蒙古族自治县', 57);
insert into COUNTY (countyid, countyname, cityid)
values (573, '长岭县', 57);
insert into COUNTY (countyid, countyname, cityid)
values (574, '乾安县', 57);
insert into COUNTY (countyid, countyname, cityid)
values (575, '扶余县', 57);
insert into COUNTY (countyid, countyname, cityid)
values (576, '洮北区', 58);
insert into COUNTY (countyid, countyname, cityid)
values (577, '镇赉县', 58);
insert into COUNTY (countyid, countyname, cityid)
values (578, '通榆县', 58);
insert into COUNTY (countyid, countyname, cityid)
values (579, '洮南市', 58);
insert into COUNTY (countyid, countyname, cityid)
values (580, '大安市', 58);
insert into COUNTY (countyid, countyname, cityid)
values (581, '延吉市', 59);
insert into COUNTY (countyid, countyname, cityid)
values (582, '图们市', 59);
insert into COUNTY (countyid, countyname, cityid)
values (583, '敦化市', 59);
insert into COUNTY (countyid, countyname, cityid)
values (584, '珲春市', 59);
insert into COUNTY (countyid, countyname, cityid)
values (585, '龙井市', 59);
insert into COUNTY (countyid, countyname, cityid)
values (586, '和龙市', 59);
insert into COUNTY (countyid, countyname, cityid)
values (587, '汪清县', 59);
insert into COUNTY (countyid, countyname, cityid)
values (588, '安图县', 59);
insert into COUNTY (countyid, countyname, cityid)
values (589, '道里区', 60);
insert into COUNTY (countyid, countyname, cityid)
values (590, '南岗区', 60);
insert into COUNTY (countyid, countyname, cityid)
values (591, '道外区', 60);
insert into COUNTY (countyid, countyname, cityid)
values (592, '香坊区', 60);
insert into COUNTY (countyid, countyname, cityid)
values (593, '动力区', 60);
insert into COUNTY (countyid, countyname, cityid)
values (594, '平房区', 60);
insert into COUNTY (countyid, countyname, cityid)
values (595, '松北区', 60);
insert into COUNTY (countyid, countyname, cityid)
values (596, '呼兰区', 60);
insert into COUNTY (countyid, countyname, cityid)
values (597, '依兰县', 60);
insert into COUNTY (countyid, countyname, cityid)
values (598, '方正县', 60);
insert into COUNTY (countyid, countyname, cityid)
values (599, '宾县', 60);
insert into COUNTY (countyid, countyname, cityid)
values (600, '巴彦县', 60);
insert into COUNTY (countyid, countyname, cityid)
values (601, '木兰县', 60);
insert into COUNTY (countyid, countyname, cityid)
values (602, '通河县', 60);
insert into COUNTY (countyid, countyname, cityid)
values (603, '延寿县', 60);
insert into COUNTY (countyid, countyname, cityid)
values (604, '阿城市', 60);
insert into COUNTY (countyid, countyname, cityid)
values (605, '双城市', 60);
insert into COUNTY (countyid, countyname, cityid)
values (606, '尚志市', 60);
insert into COUNTY (countyid, countyname, cityid)
values (607, '五常市', 60);
insert into COUNTY (countyid, countyname, cityid)
values (608, '龙沙区', 61);
insert into COUNTY (countyid, countyname, cityid)
values (609, '建华区', 61);
insert into COUNTY (countyid, countyname, cityid)
values (610, '铁锋区', 61);
insert into COUNTY (countyid, countyname, cityid)
values (611, '昂昂溪区', 61);
insert into COUNTY (countyid, countyname, cityid)
values (612, '富拉尔基区', 61);
insert into COUNTY (countyid, countyname, cityid)
values (613, '碾子山区', 61);
insert into COUNTY (countyid, countyname, cityid)
values (614, '梅里斯达斡尔族区', 61);
insert into COUNTY (countyid, countyname, cityid)
values (615, '龙江县', 61);
insert into COUNTY (countyid, countyname, cityid)
values (616, '依安县', 61);
insert into COUNTY (countyid, countyname, cityid)
values (617, '泰来县', 61);
insert into COUNTY (countyid, countyname, cityid)
values (618, '甘南县', 61);
insert into COUNTY (countyid, countyname, cityid)
values (619, '富裕县', 61);
insert into COUNTY (countyid, countyname, cityid)
values (620, '克山县', 61);
insert into COUNTY (countyid, countyname, cityid)
values (621, '克东县', 61);
insert into COUNTY (countyid, countyname, cityid)
values (622, '拜泉县', 61);
insert into COUNTY (countyid, countyname, cityid)
values (623, '讷河市', 61);
insert into COUNTY (countyid, countyname, cityid)
values (624, '鸡冠区', 62);
insert into COUNTY (countyid, countyname, cityid)
values (625, '恒山区', 62);
insert into COUNTY (countyid, countyname, cityid)
values (626, '滴道区', 62);
insert into COUNTY (countyid, countyname, cityid)
values (627, '梨树区', 62);
insert into COUNTY (countyid, countyname, cityid)
values (628, '城子河区', 62);
insert into COUNTY (countyid, countyname, cityid)
values (629, '麻山区', 62);
insert into COUNTY (countyid, countyname, cityid)
values (630, '鸡东县', 62);
commit;
prompt 1900 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (631, '虎林市', 62);
insert into COUNTY (countyid, countyname, cityid)
values (632, '密山市', 62);
insert into COUNTY (countyid, countyname, cityid)
values (633, '向阳区', 63);
insert into COUNTY (countyid, countyname, cityid)
values (634, '工农区', 63);
insert into COUNTY (countyid, countyname, cityid)
values (635, '南山区', 63);
insert into COUNTY (countyid, countyname, cityid)
values (636, '兴安区', 63);
insert into COUNTY (countyid, countyname, cityid)
values (637, '东山区', 63);
insert into COUNTY (countyid, countyname, cityid)
values (638, '兴山区', 63);
insert into COUNTY (countyid, countyname, cityid)
values (639, '萝北县', 63);
insert into COUNTY (countyid, countyname, cityid)
values (640, '绥滨县', 63);
insert into COUNTY (countyid, countyname, cityid)
values (641, '尖山区', 64);
insert into COUNTY (countyid, countyname, cityid)
values (642, '岭东区', 64);
insert into COUNTY (countyid, countyname, cityid)
values (643, '四方台区', 64);
insert into COUNTY (countyid, countyname, cityid)
values (644, '宝山区', 64);
insert into COUNTY (countyid, countyname, cityid)
values (645, '集贤县', 64);
insert into COUNTY (countyid, countyname, cityid)
values (646, '友谊县', 64);
insert into COUNTY (countyid, countyname, cityid)
values (647, '宝清县', 64);
insert into COUNTY (countyid, countyname, cityid)
values (648, '饶河县', 64);
insert into COUNTY (countyid, countyname, cityid)
values (649, '萨尔图区', 65);
insert into COUNTY (countyid, countyname, cityid)
values (650, '龙凤区', 65);
insert into COUNTY (countyid, countyname, cityid)
values (651, '让胡路区', 65);
insert into COUNTY (countyid, countyname, cityid)
values (652, '红岗区', 65);
insert into COUNTY (countyid, countyname, cityid)
values (653, '大同区', 65);
insert into COUNTY (countyid, countyname, cityid)
values (654, '肇州县', 65);
insert into COUNTY (countyid, countyname, cityid)
values (655, '肇源县', 65);
insert into COUNTY (countyid, countyname, cityid)
values (656, '林甸县', 65);
insert into COUNTY (countyid, countyname, cityid)
values (657, '杜尔伯特蒙古族自治县', 65);
insert into COUNTY (countyid, countyname, cityid)
values (658, '伊春区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (659, '南岔区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (660, '友好区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (661, '西林区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (662, '翠峦区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (663, '新青区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (664, '美溪区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (665, '金山屯区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (666, '五营区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (667, '乌马河区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (668, '汤旺河区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (669, '带岭区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (670, '乌伊岭区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (671, '红星区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (672, '上甘岭区', 66);
insert into COUNTY (countyid, countyname, cityid)
values (673, '嘉荫县', 66);
insert into COUNTY (countyid, countyname, cityid)
values (674, '铁力市', 66);
insert into COUNTY (countyid, countyname, cityid)
values (675, '永红区', 67);
insert into COUNTY (countyid, countyname, cityid)
values (676, '向阳区', 67);
insert into COUNTY (countyid, countyname, cityid)
values (677, '前进区', 67);
insert into COUNTY (countyid, countyname, cityid)
values (678, '东风区', 67);
insert into COUNTY (countyid, countyname, cityid)
values (679, '郊区', 67);
insert into COUNTY (countyid, countyname, cityid)
values (680, '桦南县', 67);
insert into COUNTY (countyid, countyname, cityid)
values (681, '桦川县', 67);
insert into COUNTY (countyid, countyname, cityid)
values (682, '汤原县', 67);
insert into COUNTY (countyid, countyname, cityid)
values (683, '抚远县', 67);
insert into COUNTY (countyid, countyname, cityid)
values (684, '同江市', 67);
insert into COUNTY (countyid, countyname, cityid)
values (685, '富锦市', 67);
insert into COUNTY (countyid, countyname, cityid)
values (686, '新兴区', 68);
insert into COUNTY (countyid, countyname, cityid)
values (687, '桃山区', 68);
insert into COUNTY (countyid, countyname, cityid)
values (688, '茄子河区', 68);
insert into COUNTY (countyid, countyname, cityid)
values (689, '勃利县', 68);
insert into COUNTY (countyid, countyname, cityid)
values (690, '东安区', 69);
insert into COUNTY (countyid, countyname, cityid)
values (691, '阳明区', 69);
insert into COUNTY (countyid, countyname, cityid)
values (692, '爱民区', 69);
insert into COUNTY (countyid, countyname, cityid)
values (693, '西安区', 69);
insert into COUNTY (countyid, countyname, cityid)
values (694, '东宁县', 69);
insert into COUNTY (countyid, countyname, cityid)
values (695, '林口县', 69);
insert into COUNTY (countyid, countyname, cityid)
values (696, '绥芬河市', 69);
insert into COUNTY (countyid, countyname, cityid)
values (697, '海林市', 69);
insert into COUNTY (countyid, countyname, cityid)
values (698, '宁安市', 69);
insert into COUNTY (countyid, countyname, cityid)
values (699, '穆棱市', 69);
insert into COUNTY (countyid, countyname, cityid)
values (700, '爱辉区', 70);
insert into COUNTY (countyid, countyname, cityid)
values (701, '嫩江县', 70);
insert into COUNTY (countyid, countyname, cityid)
values (702, '逊克县', 70);
insert into COUNTY (countyid, countyname, cityid)
values (703, '孙吴县', 70);
insert into COUNTY (countyid, countyname, cityid)
values (704, '北安市', 70);
insert into COUNTY (countyid, countyname, cityid)
values (705, '五大连池市', 70);
insert into COUNTY (countyid, countyname, cityid)
values (706, '北林区', 71);
insert into COUNTY (countyid, countyname, cityid)
values (707, '望奎县', 71);
insert into COUNTY (countyid, countyname, cityid)
values (708, '兰西县', 71);
insert into COUNTY (countyid, countyname, cityid)
values (709, '青冈县', 71);
insert into COUNTY (countyid, countyname, cityid)
values (710, '庆安县', 71);
insert into COUNTY (countyid, countyname, cityid)
values (711, '明水县', 71);
insert into COUNTY (countyid, countyname, cityid)
values (712, '绥棱县', 71);
insert into COUNTY (countyid, countyname, cityid)
values (713, '安达市', 71);
insert into COUNTY (countyid, countyname, cityid)
values (714, '肇东市', 71);
insert into COUNTY (countyid, countyname, cityid)
values (715, '海伦市', 71);
insert into COUNTY (countyid, countyname, cityid)
values (716, '呼玛县', 72);
insert into COUNTY (countyid, countyname, cityid)
values (717, '塔河县', 72);
insert into COUNTY (countyid, countyname, cityid)
values (718, '漠河县', 72);
insert into COUNTY (countyid, countyname, cityid)
values (719, '黄浦区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (720, '卢湾区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (721, '徐汇区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (722, '长宁区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (723, '静安区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (724, '普陀区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (725, '闸北区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (726, '虹口区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (727, '杨浦区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (728, '闵行区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (729, '宝山区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (730, '嘉定区', 73);
commit;
prompt 2000 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (731, '浦东新区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (732, '金山区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (733, '松江区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (734, '青浦区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (735, '南汇区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (736, '奉贤区', 73);
insert into COUNTY (countyid, countyname, cityid)
values (737, '崇明县', 73);
insert into COUNTY (countyid, countyname, cityid)
values (738, '玄武区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (739, '白下区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (740, '秦淮区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (741, '建邺区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (742, '鼓楼区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (743, '下关区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (744, '浦口区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (745, '栖霞区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (746, '雨花台区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (747, '江宁区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (748, '六合区', 74);
insert into COUNTY (countyid, countyname, cityid)
values (749, '溧水县', 74);
insert into COUNTY (countyid, countyname, cityid)
values (750, '高淳县', 74);
insert into COUNTY (countyid, countyname, cityid)
values (751, '崇安区', 75);
insert into COUNTY (countyid, countyname, cityid)
values (752, '南长区', 75);
insert into COUNTY (countyid, countyname, cityid)
values (753, '北塘区', 75);
insert into COUNTY (countyid, countyname, cityid)
values (754, '锡山区', 75);
insert into COUNTY (countyid, countyname, cityid)
values (755, '惠山区', 75);
insert into COUNTY (countyid, countyname, cityid)
values (756, '滨湖区', 75);
insert into COUNTY (countyid, countyname, cityid)
values (757, '江阴市', 75);
insert into COUNTY (countyid, countyname, cityid)
values (758, '宜兴市', 75);
insert into COUNTY (countyid, countyname, cityid)
values (759, '鼓楼区', 76);
insert into COUNTY (countyid, countyname, cityid)
values (760, '云龙区', 76);
insert into COUNTY (countyid, countyname, cityid)
values (761, '九里区', 76);
insert into COUNTY (countyid, countyname, cityid)
values (762, '贾汪区', 76);
insert into COUNTY (countyid, countyname, cityid)
values (763, '泉山区', 76);
insert into COUNTY (countyid, countyname, cityid)
values (764, '丰县', 76);
insert into COUNTY (countyid, countyname, cityid)
values (765, '沛县', 76);
insert into COUNTY (countyid, countyname, cityid)
values (766, '铜山县', 76);
insert into COUNTY (countyid, countyname, cityid)
values (767, '睢宁县', 76);
insert into COUNTY (countyid, countyname, cityid)
values (768, '新沂市', 76);
insert into COUNTY (countyid, countyname, cityid)
values (769, '邳州市', 76);
insert into COUNTY (countyid, countyname, cityid)
values (770, '天宁区', 77);
insert into COUNTY (countyid, countyname, cityid)
values (771, '钟楼区', 77);
insert into COUNTY (countyid, countyname, cityid)
values (772, '戚墅堰区', 77);
insert into COUNTY (countyid, countyname, cityid)
values (773, '新北区', 77);
insert into COUNTY (countyid, countyname, cityid)
values (774, '武进区', 77);
insert into COUNTY (countyid, countyname, cityid)
values (775, '溧阳市', 77);
insert into COUNTY (countyid, countyname, cityid)
values (776, '金坛市', 77);
insert into COUNTY (countyid, countyname, cityid)
values (777, '沧浪区', 78);
insert into COUNTY (countyid, countyname, cityid)
values (778, '平江区', 78);
insert into COUNTY (countyid, countyname, cityid)
values (779, '金阊区', 78);
insert into COUNTY (countyid, countyname, cityid)
values (780, '虎丘区', 78);
insert into COUNTY (countyid, countyname, cityid)
values (781, '吴中区', 78);
insert into COUNTY (countyid, countyname, cityid)
values (782, '相城区', 78);
insert into COUNTY (countyid, countyname, cityid)
values (783, '常熟市', 78);
insert into COUNTY (countyid, countyname, cityid)
values (784, '张家港市', 78);
insert into COUNTY (countyid, countyname, cityid)
values (785, '昆山市', 78);
insert into COUNTY (countyid, countyname, cityid)
values (786, '吴江市', 78);
insert into COUNTY (countyid, countyname, cityid)
values (787, '太仓市', 78);
insert into COUNTY (countyid, countyname, cityid)
values (788, '崇川区', 79);
insert into COUNTY (countyid, countyname, cityid)
values (789, '港闸区', 79);
insert into COUNTY (countyid, countyname, cityid)
values (790, '海安县', 79);
insert into COUNTY (countyid, countyname, cityid)
values (791, '如东县', 79);
insert into COUNTY (countyid, countyname, cityid)
values (792, '启东市', 79);
insert into COUNTY (countyid, countyname, cityid)
values (793, '如皋市', 79);
insert into COUNTY (countyid, countyname, cityid)
values (794, '通州市', 79);
insert into COUNTY (countyid, countyname, cityid)
values (795, '海门市', 79);
insert into COUNTY (countyid, countyname, cityid)
values (796, '连云区', 80);
insert into COUNTY (countyid, countyname, cityid)
values (797, '新浦区', 80);
insert into COUNTY (countyid, countyname, cityid)
values (798, '海州区', 80);
insert into COUNTY (countyid, countyname, cityid)
values (799, '赣榆县', 80);
insert into COUNTY (countyid, countyname, cityid)
values (800, '东海县', 80);
insert into COUNTY (countyid, countyname, cityid)
values (801, '灌云县', 80);
insert into COUNTY (countyid, countyname, cityid)
values (802, '灌南县', 80);
insert into COUNTY (countyid, countyname, cityid)
values (803, '清河区', 81);
insert into COUNTY (countyid, countyname, cityid)
values (804, '楚州区', 81);
insert into COUNTY (countyid, countyname, cityid)
values (805, '淮阴区', 81);
insert into COUNTY (countyid, countyname, cityid)
values (806, '清浦区', 81);
insert into COUNTY (countyid, countyname, cityid)
values (807, '涟水县', 81);
insert into COUNTY (countyid, countyname, cityid)
values (808, '洪泽县', 81);
insert into COUNTY (countyid, countyname, cityid)
values (809, '盱眙县', 81);
insert into COUNTY (countyid, countyname, cityid)
values (810, '金湖县', 81);
insert into COUNTY (countyid, countyname, cityid)
values (811, '亭湖区', 82);
insert into COUNTY (countyid, countyname, cityid)
values (812, '盐都区', 82);
insert into COUNTY (countyid, countyname, cityid)
values (813, '响水县', 82);
insert into COUNTY (countyid, countyname, cityid)
values (814, '滨海县', 82);
insert into COUNTY (countyid, countyname, cityid)
values (815, '阜宁县', 82);
insert into COUNTY (countyid, countyname, cityid)
values (816, '射阳县', 82);
insert into COUNTY (countyid, countyname, cityid)
values (817, '建湖县', 82);
insert into COUNTY (countyid, countyname, cityid)
values (818, '东台市', 82);
insert into COUNTY (countyid, countyname, cityid)
values (819, '大丰市', 82);
insert into COUNTY (countyid, countyname, cityid)
values (820, '广陵区', 83);
insert into COUNTY (countyid, countyname, cityid)
values (821, '邗江区', 83);
insert into COUNTY (countyid, countyname, cityid)
values (822, '维扬区', 83);
insert into COUNTY (countyid, countyname, cityid)
values (823, '宝应县', 83);
insert into COUNTY (countyid, countyname, cityid)
values (824, '仪征市', 83);
insert into COUNTY (countyid, countyname, cityid)
values (825, '高邮市', 83);
insert into COUNTY (countyid, countyname, cityid)
values (826, '江都市', 83);
insert into COUNTY (countyid, countyname, cityid)
values (827, '京口区', 84);
insert into COUNTY (countyid, countyname, cityid)
values (828, '润州区', 84);
insert into COUNTY (countyid, countyname, cityid)
values (829, '丹徒区', 84);
insert into COUNTY (countyid, countyname, cityid)
values (830, '丹阳市', 84);
commit;
prompt 2100 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (831, '扬中市', 84);
insert into COUNTY (countyid, countyname, cityid)
values (832, '句容市', 84);
insert into COUNTY (countyid, countyname, cityid)
values (833, '海陵区', 85);
insert into COUNTY (countyid, countyname, cityid)
values (834, '高港区', 85);
insert into COUNTY (countyid, countyname, cityid)
values (835, '兴化市', 85);
insert into COUNTY (countyid, countyname, cityid)
values (836, '靖江市', 85);
insert into COUNTY (countyid, countyname, cityid)
values (837, '泰兴市', 85);
insert into COUNTY (countyid, countyname, cityid)
values (838, '姜堰市', 85);
insert into COUNTY (countyid, countyname, cityid)
values (839, '宿城区', 86);
insert into COUNTY (countyid, countyname, cityid)
values (840, '宿豫区', 86);
insert into COUNTY (countyid, countyname, cityid)
values (841, '沭阳县', 86);
insert into COUNTY (countyid, countyname, cityid)
values (842, '泗阳县', 86);
insert into COUNTY (countyid, countyname, cityid)
values (843, '泗洪县', 86);
insert into COUNTY (countyid, countyname, cityid)
values (844, '上城区', 87);
insert into COUNTY (countyid, countyname, cityid)
values (845, '下城区', 87);
insert into COUNTY (countyid, countyname, cityid)
values (846, '江干区', 87);
insert into COUNTY (countyid, countyname, cityid)
values (847, '拱墅区', 87);
insert into COUNTY (countyid, countyname, cityid)
values (848, '西湖区', 87);
insert into COUNTY (countyid, countyname, cityid)
values (849, '滨江区', 87);
insert into COUNTY (countyid, countyname, cityid)
values (850, '萧山区', 87);
insert into COUNTY (countyid, countyname, cityid)
values (851, '余杭区', 87);
insert into COUNTY (countyid, countyname, cityid)
values (852, '桐庐县', 87);
insert into COUNTY (countyid, countyname, cityid)
values (853, '淳安县', 87);
insert into COUNTY (countyid, countyname, cityid)
values (854, '建德市', 87);
insert into COUNTY (countyid, countyname, cityid)
values (855, '富阳市', 87);
insert into COUNTY (countyid, countyname, cityid)
values (856, '临安市', 87);
insert into COUNTY (countyid, countyname, cityid)
values (857, '海曙区', 88);
insert into COUNTY (countyid, countyname, cityid)
values (858, '江东区', 88);
insert into COUNTY (countyid, countyname, cityid)
values (859, '江北区', 88);
insert into COUNTY (countyid, countyname, cityid)
values (860, '北仑区', 88);
insert into COUNTY (countyid, countyname, cityid)
values (861, '镇海区', 88);
insert into COUNTY (countyid, countyname, cityid)
values (862, '鄞州区', 88);
insert into COUNTY (countyid, countyname, cityid)
values (863, '象山县', 88);
insert into COUNTY (countyid, countyname, cityid)
values (864, '宁海县', 88);
insert into COUNTY (countyid, countyname, cityid)
values (865, '余姚市', 88);
insert into COUNTY (countyid, countyname, cityid)
values (866, '慈溪市', 88);
insert into COUNTY (countyid, countyname, cityid)
values (867, '奉化市', 88);
insert into COUNTY (countyid, countyname, cityid)
values (868, '鹿城区', 89);
insert into COUNTY (countyid, countyname, cityid)
values (869, '龙湾区', 89);
insert into COUNTY (countyid, countyname, cityid)
values (870, '瓯海区', 89);
insert into COUNTY (countyid, countyname, cityid)
values (871, '洞头县', 89);
insert into COUNTY (countyid, countyname, cityid)
values (872, '永嘉县', 89);
insert into COUNTY (countyid, countyname, cityid)
values (873, '平阳县', 89);
insert into COUNTY (countyid, countyname, cityid)
values (874, '苍南县', 89);
insert into COUNTY (countyid, countyname, cityid)
values (875, '文成县', 89);
insert into COUNTY (countyid, countyname, cityid)
values (876, '泰顺县', 89);
insert into COUNTY (countyid, countyname, cityid)
values (877, '瑞安市', 89);
insert into COUNTY (countyid, countyname, cityid)
values (878, '乐清市', 89);
insert into COUNTY (countyid, countyname, cityid)
values (879, '秀城区', 90);
insert into COUNTY (countyid, countyname, cityid)
values (880, '秀洲区', 90);
insert into COUNTY (countyid, countyname, cityid)
values (881, '嘉善县', 90);
insert into COUNTY (countyid, countyname, cityid)
values (882, '海盐县', 90);
insert into COUNTY (countyid, countyname, cityid)
values (883, '海宁市', 90);
insert into COUNTY (countyid, countyname, cityid)
values (884, '平湖市', 90);
insert into COUNTY (countyid, countyname, cityid)
values (885, '桐乡市', 90);
insert into COUNTY (countyid, countyname, cityid)
values (886, '吴兴区', 91);
insert into COUNTY (countyid, countyname, cityid)
values (887, '南浔区', 91);
insert into COUNTY (countyid, countyname, cityid)
values (888, '德清县', 91);
insert into COUNTY (countyid, countyname, cityid)
values (889, '长兴县', 91);
insert into COUNTY (countyid, countyname, cityid)
values (890, '安吉县', 91);
insert into COUNTY (countyid, countyname, cityid)
values (891, '越城区', 92);
insert into COUNTY (countyid, countyname, cityid)
values (892, '绍兴县', 92);
insert into COUNTY (countyid, countyname, cityid)
values (893, '新昌县', 92);
insert into COUNTY (countyid, countyname, cityid)
values (894, '诸暨市', 92);
insert into COUNTY (countyid, countyname, cityid)
values (895, '上虞市', 92);
insert into COUNTY (countyid, countyname, cityid)
values (896, '嵊州市', 92);
insert into COUNTY (countyid, countyname, cityid)
values (897, '婺城区', 93);
insert into COUNTY (countyid, countyname, cityid)
values (898, '金东区', 93);
insert into COUNTY (countyid, countyname, cityid)
values (899, '武义县', 93);
insert into COUNTY (countyid, countyname, cityid)
values (900, '浦江县', 93);
insert into COUNTY (countyid, countyname, cityid)
values (901, '磐安县', 93);
insert into COUNTY (countyid, countyname, cityid)
values (902, '兰溪市', 93);
insert into COUNTY (countyid, countyname, cityid)
values (903, '义乌市', 93);
insert into COUNTY (countyid, countyname, cityid)
values (904, '东阳市', 93);
insert into COUNTY (countyid, countyname, cityid)
values (905, '永康市', 93);
insert into COUNTY (countyid, countyname, cityid)
values (906, '柯城区', 94);
insert into COUNTY (countyid, countyname, cityid)
values (907, '衢江区', 94);
insert into COUNTY (countyid, countyname, cityid)
values (908, '常山县', 94);
insert into COUNTY (countyid, countyname, cityid)
values (909, '开化县', 94);
insert into COUNTY (countyid, countyname, cityid)
values (910, '龙游县', 94);
insert into COUNTY (countyid, countyname, cityid)
values (911, '江山市', 94);
insert into COUNTY (countyid, countyname, cityid)
values (912, '定海区', 95);
insert into COUNTY (countyid, countyname, cityid)
values (913, '普陀区', 95);
insert into COUNTY (countyid, countyname, cityid)
values (914, '岱山县', 95);
insert into COUNTY (countyid, countyname, cityid)
values (915, '嵊泗县', 95);
insert into COUNTY (countyid, countyname, cityid)
values (916, '椒江区', 96);
insert into COUNTY (countyid, countyname, cityid)
values (917, '黄岩区', 96);
insert into COUNTY (countyid, countyname, cityid)
values (918, '路桥区', 96);
insert into COUNTY (countyid, countyname, cityid)
values (919, '玉环县', 96);
insert into COUNTY (countyid, countyname, cityid)
values (920, '三门县', 96);
insert into COUNTY (countyid, countyname, cityid)
values (921, '天台县', 96);
insert into COUNTY (countyid, countyname, cityid)
values (922, '仙居县', 96);
insert into COUNTY (countyid, countyname, cityid)
values (923, '温岭市', 96);
insert into COUNTY (countyid, countyname, cityid)
values (924, '临海市', 96);
insert into COUNTY (countyid, countyname, cityid)
values (925, '莲都区', 97);
insert into COUNTY (countyid, countyname, cityid)
values (926, '青田县', 97);
insert into COUNTY (countyid, countyname, cityid)
values (927, '缙云县', 97);
insert into COUNTY (countyid, countyname, cityid)
values (928, '遂昌县', 97);
insert into COUNTY (countyid, countyname, cityid)
values (929, '松阳县', 97);
insert into COUNTY (countyid, countyname, cityid)
values (930, '云和县', 97);
commit;
prompt 2200 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (931, '庆元县', 97);
insert into COUNTY (countyid, countyname, cityid)
values (932, '景宁畲族自治县', 97);
insert into COUNTY (countyid, countyname, cityid)
values (933, '龙泉市', 97);
insert into COUNTY (countyid, countyname, cityid)
values (934, '瑶海区', 98);
insert into COUNTY (countyid, countyname, cityid)
values (935, '庐阳区', 98);
insert into COUNTY (countyid, countyname, cityid)
values (936, '蜀山区', 98);
insert into COUNTY (countyid, countyname, cityid)
values (937, '包河区', 98);
insert into COUNTY (countyid, countyname, cityid)
values (938, '长丰县', 98);
insert into COUNTY (countyid, countyname, cityid)
values (939, '肥东县', 98);
insert into COUNTY (countyid, countyname, cityid)
values (940, '肥西县', 98);
insert into COUNTY (countyid, countyname, cityid)
values (941, '镜湖区', 99);
insert into COUNTY (countyid, countyname, cityid)
values (942, '马塘区', 99);
insert into COUNTY (countyid, countyname, cityid)
values (943, '新芜区', 99);
insert into COUNTY (countyid, countyname, cityid)
values (944, '鸠江区', 99);
insert into COUNTY (countyid, countyname, cityid)
values (945, '芜湖县', 99);
insert into COUNTY (countyid, countyname, cityid)
values (946, '繁昌县', 99);
insert into COUNTY (countyid, countyname, cityid)
values (947, '南陵县', 99);
insert into COUNTY (countyid, countyname, cityid)
values (948, '龙子湖区', 100);
insert into COUNTY (countyid, countyname, cityid)
values (949, '蚌山区', 100);
insert into COUNTY (countyid, countyname, cityid)
values (950, '禹会区', 100);
insert into COUNTY (countyid, countyname, cityid)
values (951, '淮上区', 100);
insert into COUNTY (countyid, countyname, cityid)
values (952, '怀远县', 100);
insert into COUNTY (countyid, countyname, cityid)
values (953, '五河县', 100);
insert into COUNTY (countyid, countyname, cityid)
values (954, '固镇县', 100);
insert into COUNTY (countyid, countyname, cityid)
values (955, '大通区', 101);
insert into COUNTY (countyid, countyname, cityid)
values (956, '田家庵区', 101);
insert into COUNTY (countyid, countyname, cityid)
values (957, '谢家集区', 101);
insert into COUNTY (countyid, countyname, cityid)
values (958, '八公山区', 101);
insert into COUNTY (countyid, countyname, cityid)
values (959, '潘集区', 101);
insert into COUNTY (countyid, countyname, cityid)
values (960, '凤台县', 101);
insert into COUNTY (countyid, countyname, cityid)
values (961, '金家庄区', 102);
insert into COUNTY (countyid, countyname, cityid)
values (962, '花山区', 102);
insert into COUNTY (countyid, countyname, cityid)
values (963, '雨山区', 102);
insert into COUNTY (countyid, countyname, cityid)
values (964, '当涂县', 102);
insert into COUNTY (countyid, countyname, cityid)
values (965, '杜集区', 103);
insert into COUNTY (countyid, countyname, cityid)
values (966, '相山区', 103);
insert into COUNTY (countyid, countyname, cityid)
values (967, '烈山区', 103);
insert into COUNTY (countyid, countyname, cityid)
values (968, '濉溪县', 103);
insert into COUNTY (countyid, countyname, cityid)
values (969, '铜官山区', 104);
insert into COUNTY (countyid, countyname, cityid)
values (970, '狮子山区', 104);
insert into COUNTY (countyid, countyname, cityid)
values (971, '郊区', 104);
insert into COUNTY (countyid, countyname, cityid)
values (972, '铜陵县', 104);
insert into COUNTY (countyid, countyname, cityid)
values (973, '迎江区', 105);
insert into COUNTY (countyid, countyname, cityid)
values (974, '大观区', 105);
insert into COUNTY (countyid, countyname, cityid)
values (975, '郊区', 105);
insert into COUNTY (countyid, countyname, cityid)
values (976, '怀宁县', 105);
insert into COUNTY (countyid, countyname, cityid)
values (977, '枞阳县', 105);
insert into COUNTY (countyid, countyname, cityid)
values (978, '潜山县', 105);
insert into COUNTY (countyid, countyname, cityid)
values (979, '太湖县', 105);
insert into COUNTY (countyid, countyname, cityid)
values (980, '宿松县', 105);
insert into COUNTY (countyid, countyname, cityid)
values (981, '望江县', 105);
insert into COUNTY (countyid, countyname, cityid)
values (982, '岳西县', 105);
insert into COUNTY (countyid, countyname, cityid)
values (983, '桐城市', 105);
insert into COUNTY (countyid, countyname, cityid)
values (984, '屯溪区', 106);
insert into COUNTY (countyid, countyname, cityid)
values (985, '黄山区', 106);
insert into COUNTY (countyid, countyname, cityid)
values (986, '徽州区', 106);
insert into COUNTY (countyid, countyname, cityid)
values (987, '歙县', 106);
insert into COUNTY (countyid, countyname, cityid)
values (988, '休宁县', 106);
insert into COUNTY (countyid, countyname, cityid)
values (989, '黟县', 106);
insert into COUNTY (countyid, countyname, cityid)
values (990, '祁门县', 106);
insert into COUNTY (countyid, countyname, cityid)
values (991, '琅琊区', 107);
insert into COUNTY (countyid, countyname, cityid)
values (992, '南谯区', 107);
insert into COUNTY (countyid, countyname, cityid)
values (993, '来安县', 107);
insert into COUNTY (countyid, countyname, cityid)
values (994, '全椒县', 107);
insert into COUNTY (countyid, countyname, cityid)
values (995, '定远县', 107);
insert into COUNTY (countyid, countyname, cityid)
values (996, '凤阳县', 107);
insert into COUNTY (countyid, countyname, cityid)
values (997, '天长市', 107);
insert into COUNTY (countyid, countyname, cityid)
values (998, '明光市', 107);
insert into COUNTY (countyid, countyname, cityid)
values (999, '颍州区', 108);
insert into COUNTY (countyid, countyname, cityid)
values (1000, '颍东区', 108);
insert into COUNTY (countyid, countyname, cityid)
values (1001, '颍泉区', 108);
insert into COUNTY (countyid, countyname, cityid)
values (1002, '临泉县', 108);
insert into COUNTY (countyid, countyname, cityid)
values (1003, '太和县', 108);
insert into COUNTY (countyid, countyname, cityid)
values (1004, '阜南县', 108);
insert into COUNTY (countyid, countyname, cityid)
values (1005, '颍上县', 108);
insert into COUNTY (countyid, countyname, cityid)
values (1006, '界首市', 108);
insert into COUNTY (countyid, countyname, cityid)
values (1007, '埇桥区', 109);
insert into COUNTY (countyid, countyname, cityid)
values (1008, '砀山县', 109);
insert into COUNTY (countyid, countyname, cityid)
values (1009, '萧县', 109);
insert into COUNTY (countyid, countyname, cityid)
values (1010, '灵璧县', 109);
insert into COUNTY (countyid, countyname, cityid)
values (1011, '泗县', 109);
insert into COUNTY (countyid, countyname, cityid)
values (1012, '居巢区', 110);
insert into COUNTY (countyid, countyname, cityid)
values (1013, '庐江县', 110);
insert into COUNTY (countyid, countyname, cityid)
values (1014, '无为县', 110);
insert into COUNTY (countyid, countyname, cityid)
values (1015, '含山县', 110);
insert into COUNTY (countyid, countyname, cityid)
values (1016, '和县', 110);
insert into COUNTY (countyid, countyname, cityid)
values (1017, '金安区', 111);
insert into COUNTY (countyid, countyname, cityid)
values (1018, '裕安区', 111);
insert into COUNTY (countyid, countyname, cityid)
values (1019, '寿县', 111);
insert into COUNTY (countyid, countyname, cityid)
values (1020, '霍邱县', 111);
insert into COUNTY (countyid, countyname, cityid)
values (1021, '舒城县', 111);
insert into COUNTY (countyid, countyname, cityid)
values (1022, '金寨县', 111);
insert into COUNTY (countyid, countyname, cityid)
values (1023, '霍山县', 111);
insert into COUNTY (countyid, countyname, cityid)
values (1024, '谯城区', 112);
insert into COUNTY (countyid, countyname, cityid)
values (1025, '涡阳县', 112);
insert into COUNTY (countyid, countyname, cityid)
values (1026, '蒙城县', 112);
insert into COUNTY (countyid, countyname, cityid)
values (1027, '利辛县', 112);
insert into COUNTY (countyid, countyname, cityid)
values (1028, '贵池区', 113);
insert into COUNTY (countyid, countyname, cityid)
values (1029, '东至县', 113);
insert into COUNTY (countyid, countyname, cityid)
values (1030, '石台县', 113);
commit;
prompt 2300 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (1031, '青阳县', 113);
insert into COUNTY (countyid, countyname, cityid)
values (1032, '宣州区', 114);
insert into COUNTY (countyid, countyname, cityid)
values (1033, '郎溪县', 114);
insert into COUNTY (countyid, countyname, cityid)
values (1034, '广德县', 114);
insert into COUNTY (countyid, countyname, cityid)
values (1035, '泾县', 114);
insert into COUNTY (countyid, countyname, cityid)
values (1036, '绩溪县', 114);
insert into COUNTY (countyid, countyname, cityid)
values (1037, '旌德县', 114);
insert into COUNTY (countyid, countyname, cityid)
values (1038, '宁国市', 114);
insert into COUNTY (countyid, countyname, cityid)
values (1039, '鼓楼区', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1040, '台江区', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1041, '仓山区', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1042, '马尾区', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1043, '晋安区', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1044, '闽侯县', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1045, '连江县', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1046, '罗源县', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1047, '闽清县', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1048, '永泰县', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1049, '平潭县', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1050, '福清市', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1051, '长乐市', 115);
insert into COUNTY (countyid, countyname, cityid)
values (1052, '思明区', 116);
insert into COUNTY (countyid, countyname, cityid)
values (1053, '海沧区', 116);
insert into COUNTY (countyid, countyname, cityid)
values (1054, '湖里区', 116);
insert into COUNTY (countyid, countyname, cityid)
values (1055, '集美区', 116);
insert into COUNTY (countyid, countyname, cityid)
values (1056, '同安区', 116);
insert into COUNTY (countyid, countyname, cityid)
values (1057, '翔安区', 116);
insert into COUNTY (countyid, countyname, cityid)
values (1058, '城厢区', 117);
insert into COUNTY (countyid, countyname, cityid)
values (1059, '涵江区', 117);
insert into COUNTY (countyid, countyname, cityid)
values (1060, '荔城区', 117);
insert into COUNTY (countyid, countyname, cityid)
values (1061, '秀屿区', 117);
insert into COUNTY (countyid, countyname, cityid)
values (1062, '仙游县', 117);
insert into COUNTY (countyid, countyname, cityid)
values (1063, '梅列区', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1064, '三元区', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1065, '明溪县', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1066, '清流县', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1067, '宁化县', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1068, '大田县', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1069, '尤溪县', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1070, '沙县', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1071, '将乐县', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1072, '泰宁县', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1073, '建宁县', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1074, '永安市', 118);
insert into COUNTY (countyid, countyname, cityid)
values (1075, '鲤城区', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1076, '丰泽区', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1077, '洛江区', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1078, '泉港区', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1079, '惠安县', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1080, '安溪县', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1081, '永春县', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1082, '德化县', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1083, '金门县', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1084, '石狮市', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1085, '晋江市', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1086, '南安市', 119);
insert into COUNTY (countyid, countyname, cityid)
values (1087, '芗城区', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1088, '龙文区', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1089, '云霄县', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1090, '漳浦县', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1091, '诏安县', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1092, '长泰县', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1093, '东山县', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1094, '南靖县', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1095, '平和县', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1096, '华安县', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1097, '龙海市', 120);
insert into COUNTY (countyid, countyname, cityid)
values (1098, '延平区', 121);
insert into COUNTY (countyid, countyname, cityid)
values (1099, '顺昌县', 121);
insert into COUNTY (countyid, countyname, cityid)
values (1100, '浦城县', 121);
insert into COUNTY (countyid, countyname, cityid)
values (1101, '光泽县', 121);
insert into COUNTY (countyid, countyname, cityid)
values (1102, '松溪县', 121);
insert into COUNTY (countyid, countyname, cityid)
values (1103, '政和县', 121);
insert into COUNTY (countyid, countyname, cityid)
values (1104, '邵武市', 121);
insert into COUNTY (countyid, countyname, cityid)
values (1105, '武夷山市', 121);
insert into COUNTY (countyid, countyname, cityid)
values (1106, '建瓯市', 121);
insert into COUNTY (countyid, countyname, cityid)
values (1107, '建阳市', 121);
insert into COUNTY (countyid, countyname, cityid)
values (1108, '新罗区', 122);
insert into COUNTY (countyid, countyname, cityid)
values (1109, '长汀县', 122);
insert into COUNTY (countyid, countyname, cityid)
values (1110, '永定县', 122);
insert into COUNTY (countyid, countyname, cityid)
values (1111, '上杭县', 122);
insert into COUNTY (countyid, countyname, cityid)
values (1112, '武平县', 122);
insert into COUNTY (countyid, countyname, cityid)
values (1113, '连城县', 122);
insert into COUNTY (countyid, countyname, cityid)
values (1114, '漳平市', 122);
insert into COUNTY (countyid, countyname, cityid)
values (1115, '蕉城区', 123);
insert into COUNTY (countyid, countyname, cityid)
values (1116, '霞浦县', 123);
insert into COUNTY (countyid, countyname, cityid)
values (1117, '古田县', 123);
insert into COUNTY (countyid, countyname, cityid)
values (1118, '屏南县', 123);
insert into COUNTY (countyid, countyname, cityid)
values (1119, '寿宁县', 123);
insert into COUNTY (countyid, countyname, cityid)
values (1120, '周宁县', 123);
insert into COUNTY (countyid, countyname, cityid)
values (1121, '柘荣县', 123);
insert into COUNTY (countyid, countyname, cityid)
values (1122, '福安市', 123);
insert into COUNTY (countyid, countyname, cityid)
values (1123, '福鼎市', 123);
insert into COUNTY (countyid, countyname, cityid)
values (1124, '东湖区', 124);
insert into COUNTY (countyid, countyname, cityid)
values (1125, '西湖区', 124);
insert into COUNTY (countyid, countyname, cityid)
values (1126, '青云谱区', 124);
insert into COUNTY (countyid, countyname, cityid)
values (1127, '湾里区', 124);
insert into COUNTY (countyid, countyname, cityid)
values (1128, '青山湖区', 124);
insert into COUNTY (countyid, countyname, cityid)
values (1129, '南昌县', 124);
insert into COUNTY (countyid, countyname, cityid)
values (1130, '新建县', 124);
commit;
prompt 2400 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (1131, '安义县', 124);
insert into COUNTY (countyid, countyname, cityid)
values (1132, '进贤县', 124);
insert into COUNTY (countyid, countyname, cityid)
values (1133, '昌江区', 125);
insert into COUNTY (countyid, countyname, cityid)
values (1134, '珠山区', 125);
insert into COUNTY (countyid, countyname, cityid)
values (1135, '浮梁县', 125);
insert into COUNTY (countyid, countyname, cityid)
values (1136, '乐平市', 125);
insert into COUNTY (countyid, countyname, cityid)
values (1137, '安源区', 126);
insert into COUNTY (countyid, countyname, cityid)
values (1138, '湘东区', 126);
insert into COUNTY (countyid, countyname, cityid)
values (1139, '莲花县', 126);
insert into COUNTY (countyid, countyname, cityid)
values (1140, '上栗县', 126);
insert into COUNTY (countyid, countyname, cityid)
values (1141, '芦溪县', 126);
insert into COUNTY (countyid, countyname, cityid)
values (1142, '庐山区', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1143, '浔阳区', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1144, '九江县', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1145, '武宁县', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1146, '修水县', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1147, '永修县', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1148, '德安县', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1149, '星子县', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1150, '都昌县', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1151, '湖口县', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1152, '彭泽县', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1153, '瑞昌市', 127);
insert into COUNTY (countyid, countyname, cityid)
values (1154, '渝水区', 128);
insert into COUNTY (countyid, countyname, cityid)
values (1155, '分宜县', 128);
insert into COUNTY (countyid, countyname, cityid)
values (1156, '月湖区', 129);
insert into COUNTY (countyid, countyname, cityid)
values (1157, '余江县', 129);
insert into COUNTY (countyid, countyname, cityid)
values (1158, '贵溪市', 129);
insert into COUNTY (countyid, countyname, cityid)
values (1159, '章贡区', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1160, '赣县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1161, '信丰县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1162, '大余县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1163, '上犹县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1164, '崇义县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1165, '安远县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1166, '龙南县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1167, '定南县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1168, '全南县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1169, '宁都县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1170, '于都县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1171, '兴国县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1172, '会昌县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1173, '寻乌县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1174, '石城县', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1175, '瑞金市', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1176, '南康市', 130);
insert into COUNTY (countyid, countyname, cityid)
values (1177, '吉州区', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1178, '青原区', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1179, '吉安县', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1180, '吉水县', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1181, '峡江县', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1182, '新干县', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1183, '永丰县', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1184, '泰和县', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1185, '遂川县', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1186, '万安县', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1187, '安福县', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1188, '永新县', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1189, '井冈山市', 131);
insert into COUNTY (countyid, countyname, cityid)
values (1190, '袁州区', 132);
insert into COUNTY (countyid, countyname, cityid)
values (1191, '奉新县', 132);
insert into COUNTY (countyid, countyname, cityid)
values (1192, '万载县', 132);
insert into COUNTY (countyid, countyname, cityid)
values (1193, '上高县', 132);
insert into COUNTY (countyid, countyname, cityid)
values (1194, '宜丰县', 132);
insert into COUNTY (countyid, countyname, cityid)
values (1195, '靖安县', 132);
insert into COUNTY (countyid, countyname, cityid)
values (1196, '铜鼓县', 132);
insert into COUNTY (countyid, countyname, cityid)
values (1197, '丰城市', 132);
insert into COUNTY (countyid, countyname, cityid)
values (1198, '樟树市', 132);
insert into COUNTY (countyid, countyname, cityid)
values (1199, '高安市', 132);
insert into COUNTY (countyid, countyname, cityid)
values (1200, '临川区', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1201, '南城县', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1202, '黎川县', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1203, '南丰县', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1204, '崇仁县', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1205, '乐安县', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1206, '宜黄县', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1207, '金溪县', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1208, '资溪县', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1209, '东乡县', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1210, '广昌县', 133);
insert into COUNTY (countyid, countyname, cityid)
values (1211, '信州区', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1212, '上饶县', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1213, '广丰县', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1214, '玉山县', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1215, '铅山县', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1216, '横峰县', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1217, '弋阳县', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1218, '余干县', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1219, '鄱阳县', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1220, '万年县', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1221, '婺源县', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1222, '德兴市', 134);
insert into COUNTY (countyid, countyname, cityid)
values (1223, '历下区', 135);
insert into COUNTY (countyid, countyname, cityid)
values (1224, '市中区', 135);
insert into COUNTY (countyid, countyname, cityid)
values (1225, '槐荫区', 135);
insert into COUNTY (countyid, countyname, cityid)
values (1226, '天桥区', 135);
insert into COUNTY (countyid, countyname, cityid)
values (1227, '历城区', 135);
insert into COUNTY (countyid, countyname, cityid)
values (1228, '长清区', 135);
insert into COUNTY (countyid, countyname, cityid)
values (1229, '平阴县', 135);
insert into COUNTY (countyid, countyname, cityid)
values (1230, '济阳县', 135);
commit;
prompt 2500 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (1231, '商河县', 135);
insert into COUNTY (countyid, countyname, cityid)
values (1232, '章丘市', 135);
insert into COUNTY (countyid, countyname, cityid)
values (1233, '市南区', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1234, '市北区', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1235, '四方区', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1236, '黄岛区', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1237, '崂山区', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1238, '李沧区', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1239, '城阳区', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1240, '胶州市', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1241, '即墨市', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1242, '平度市', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1243, '胶南市', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1244, '莱西市', 136);
insert into COUNTY (countyid, countyname, cityid)
values (1245, '淄川区', 137);
insert into COUNTY (countyid, countyname, cityid)
values (1246, '张店区', 137);
insert into COUNTY (countyid, countyname, cityid)
values (1247, '博山区', 137);
insert into COUNTY (countyid, countyname, cityid)
values (1248, '临淄区', 137);
insert into COUNTY (countyid, countyname, cityid)
values (1249, '周村区', 137);
insert into COUNTY (countyid, countyname, cityid)
values (1250, '桓台县', 137);
insert into COUNTY (countyid, countyname, cityid)
values (1251, '高青县', 137);
insert into COUNTY (countyid, countyname, cityid)
values (1252, '沂源县', 137);
insert into COUNTY (countyid, countyname, cityid)
values (1253, '市中区', 138);
insert into COUNTY (countyid, countyname, cityid)
values (1254, '薛城区', 138);
insert into COUNTY (countyid, countyname, cityid)
values (1255, '峄城区', 138);
insert into COUNTY (countyid, countyname, cityid)
values (1256, '台儿庄区', 138);
insert into COUNTY (countyid, countyname, cityid)
values (1257, '山亭区', 138);
insert into COUNTY (countyid, countyname, cityid)
values (1258, '滕州市', 138);
insert into COUNTY (countyid, countyname, cityid)
values (1259, '东营区', 139);
insert into COUNTY (countyid, countyname, cityid)
values (1260, '河口区', 139);
insert into COUNTY (countyid, countyname, cityid)
values (1261, '垦利县', 139);
insert into COUNTY (countyid, countyname, cityid)
values (1262, '利津县', 139);
insert into COUNTY (countyid, countyname, cityid)
values (1263, '广饶县', 139);
insert into COUNTY (countyid, countyname, cityid)
values (1264, '芝罘区', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1265, '福山区', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1266, '牟平区', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1267, '莱山区', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1268, '长岛县', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1269, '龙口市', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1270, '莱阳市', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1271, '莱州市', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1272, '蓬莱市', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1273, '招远市', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1274, '栖霞市', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1275, '海阳市', 140);
insert into COUNTY (countyid, countyname, cityid)
values (1276, '潍城区', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1277, '寒亭区', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1278, '坊子区', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1279, '奎文区', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1280, '临朐县', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1281, '昌乐县', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1282, '青州市', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1283, '诸城市', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1284, '寿光市', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1285, '安丘市', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1286, '高密市', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1287, '昌邑市', 141);
insert into COUNTY (countyid, countyname, cityid)
values (1288, '市中区', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1289, '任城区', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1290, '微山县', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1291, '鱼台县', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1292, '金乡县', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1293, '嘉祥县', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1294, '汶上县', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1295, '泗水县', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1296, '梁山县', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1297, '曲阜市', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1298, '兖州市', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1299, '邹城市', 142);
insert into COUNTY (countyid, countyname, cityid)
values (1300, '泰山区', 143);
insert into COUNTY (countyid, countyname, cityid)
values (1301, '岱岳区', 143);
insert into COUNTY (countyid, countyname, cityid)
values (1302, '宁阳县', 143);
insert into COUNTY (countyid, countyname, cityid)
values (1303, '东平县', 143);
insert into COUNTY (countyid, countyname, cityid)
values (1304, '新泰市', 143);
insert into COUNTY (countyid, countyname, cityid)
values (1305, '肥城市', 143);
insert into COUNTY (countyid, countyname, cityid)
values (1306, '环翠区', 144);
insert into COUNTY (countyid, countyname, cityid)
values (1307, '文登市', 144);
insert into COUNTY (countyid, countyname, cityid)
values (1308, '荣成市', 144);
insert into COUNTY (countyid, countyname, cityid)
values (1309, '乳山市', 144);
insert into COUNTY (countyid, countyname, cityid)
values (1310, '东港区', 145);
insert into COUNTY (countyid, countyname, cityid)
values (1311, '岚山区', 145);
insert into COUNTY (countyid, countyname, cityid)
values (1312, '五莲县', 145);
insert into COUNTY (countyid, countyname, cityid)
values (1313, '莒县', 145);
insert into COUNTY (countyid, countyname, cityid)
values (1314, '莱城区', 146);
insert into COUNTY (countyid, countyname, cityid)
values (1315, '钢城区', 146);
insert into COUNTY (countyid, countyname, cityid)
values (1316, '兰山区', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1317, '罗庄区', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1318, '河东区', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1319, '沂南县', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1320, '郯城县', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1321, '沂水县', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1322, '苍山县', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1323, '费县', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1324, '平邑县', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1325, '莒南县', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1326, '蒙阴县', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1327, '临沭县', 147);
insert into COUNTY (countyid, countyname, cityid)
values (1328, '德城区', 148);
insert into COUNTY (countyid, countyname, cityid)
values (1329, '陵县', 148);
insert into COUNTY (countyid, countyname, cityid)
values (1330, '宁津县', 148);
commit;
prompt 2600 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (1331, '庆云县', 148);
insert into COUNTY (countyid, countyname, cityid)
values (1332, '临邑县', 148);
insert into COUNTY (countyid, countyname, cityid)
values (1333, '齐河县', 148);
insert into COUNTY (countyid, countyname, cityid)
values (1334, '平原县', 148);
insert into COUNTY (countyid, countyname, cityid)
values (1335, '夏津县', 148);
insert into COUNTY (countyid, countyname, cityid)
values (1336, '武城县', 148);
insert into COUNTY (countyid, countyname, cityid)
values (1337, '乐陵市', 148);
insert into COUNTY (countyid, countyname, cityid)
values (1338, '禹城市', 148);
insert into COUNTY (countyid, countyname, cityid)
values (1339, '东昌府区', 149);
insert into COUNTY (countyid, countyname, cityid)
values (1340, '阳谷县', 149);
insert into COUNTY (countyid, countyname, cityid)
values (1341, '莘县', 149);
insert into COUNTY (countyid, countyname, cityid)
values (1342, '茌平县', 149);
insert into COUNTY (countyid, countyname, cityid)
values (1343, '东阿县', 149);
insert into COUNTY (countyid, countyname, cityid)
values (1344, '冠县', 149);
insert into COUNTY (countyid, countyname, cityid)
values (1345, '高唐县', 149);
insert into COUNTY (countyid, countyname, cityid)
values (1346, '临清市', 149);
insert into COUNTY (countyid, countyname, cityid)
values (1347, '滨城区', 150);
insert into COUNTY (countyid, countyname, cityid)
values (1348, '惠民县', 150);
insert into COUNTY (countyid, countyname, cityid)
values (1349, '阳信县', 150);
insert into COUNTY (countyid, countyname, cityid)
values (1350, '无棣县', 150);
insert into COUNTY (countyid, countyname, cityid)
values (1351, '沾化县', 150);
insert into COUNTY (countyid, countyname, cityid)
values (1352, '博兴县', 150);
insert into COUNTY (countyid, countyname, cityid)
values (1353, '邹平县', 150);
insert into COUNTY (countyid, countyname, cityid)
values (1354, '牡丹区', 151);
insert into COUNTY (countyid, countyname, cityid)
values (1355, '曹县', 151);
insert into COUNTY (countyid, countyname, cityid)
values (1356, '单县', 151);
insert into COUNTY (countyid, countyname, cityid)
values (1357, '成武县', 151);
insert into COUNTY (countyid, countyname, cityid)
values (1358, '巨野县', 151);
insert into COUNTY (countyid, countyname, cityid)
values (1359, '郓城县', 151);
insert into COUNTY (countyid, countyname, cityid)
values (1360, '鄄城县', 151);
insert into COUNTY (countyid, countyname, cityid)
values (1361, '定陶县', 151);
insert into COUNTY (countyid, countyname, cityid)
values (1362, '东明县', 151);
insert into COUNTY (countyid, countyname, cityid)
values (1363, '中原区', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1364, '二七区', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1365, '管城回族区', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1366, '金水区', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1367, '上街区', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1368, '惠济区', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1369, '中牟县', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1370, '巩义市', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1371, '荥阳市', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1372, '新密市', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1373, '新郑市', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1374, '登封市', 152);
insert into COUNTY (countyid, countyname, cityid)
values (1375, '龙亭区', 153);
insert into COUNTY (countyid, countyname, cityid)
values (1376, '顺河回族区', 153);
insert into COUNTY (countyid, countyname, cityid)
values (1377, '鼓楼区', 153);
insert into COUNTY (countyid, countyname, cityid)
values (1378, '南关区', 153);
insert into COUNTY (countyid, countyname, cityid)
values (1379, '郊区', 153);
insert into COUNTY (countyid, countyname, cityid)
values (1380, '杞县', 153);
insert into COUNTY (countyid, countyname, cityid)
values (1381, '通许县', 153);
insert into COUNTY (countyid, countyname, cityid)
values (1382, '尉氏县', 153);
insert into COUNTY (countyid, countyname, cityid)
values (1383, '开封县', 153);
insert into COUNTY (countyid, countyname, cityid)
values (1384, '兰考县', 153);
insert into COUNTY (countyid, countyname, cityid)
values (1385, '老城区', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1386, '西工区', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1387, '廛河回族区', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1388, '涧西区', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1389, '吉利区', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1390, '洛龙区', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1391, '孟津县', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1392, '新安县', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1393, '栾川县', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1394, '嵩县', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1395, '汝阳县', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1396, '宜阳县', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1397, '洛宁县', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1398, '伊川县', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1399, '偃师市', 154);
insert into COUNTY (countyid, countyname, cityid)
values (1400, '新华区', 155);
insert into COUNTY (countyid, countyname, cityid)
values (1401, '卫东区', 155);
insert into COUNTY (countyid, countyname, cityid)
values (1402, '石龙区', 155);
insert into COUNTY (countyid, countyname, cityid)
values (1403, '湛河区', 155);
insert into COUNTY (countyid, countyname, cityid)
values (1404, '宝丰县', 155);
insert into COUNTY (countyid, countyname, cityid)
values (1405, '叶县', 155);
insert into COUNTY (countyid, countyname, cityid)
values (1406, '鲁山县', 155);
insert into COUNTY (countyid, countyname, cityid)
values (1407, '郏县', 155);
insert into COUNTY (countyid, countyname, cityid)
values (1408, '舞钢市', 155);
insert into COUNTY (countyid, countyname, cityid)
values (1409, '汝州市', 155);
insert into COUNTY (countyid, countyname, cityid)
values (1410, '文峰区', 156);
insert into COUNTY (countyid, countyname, cityid)
values (1411, '北关区', 156);
insert into COUNTY (countyid, countyname, cityid)
values (1412, '殷都区', 156);
insert into COUNTY (countyid, countyname, cityid)
values (1413, '龙安区', 156);
insert into COUNTY (countyid, countyname, cityid)
values (1414, '安阳县', 156);
insert into COUNTY (countyid, countyname, cityid)
values (1415, '汤阴县', 156);
insert into COUNTY (countyid, countyname, cityid)
values (1416, '滑县', 156);
insert into COUNTY (countyid, countyname, cityid)
values (1417, '内黄县', 156);
insert into COUNTY (countyid, countyname, cityid)
values (1418, '林州市', 156);
insert into COUNTY (countyid, countyname, cityid)
values (1419, '鹤山区', 157);
insert into COUNTY (countyid, countyname, cityid)
values (1420, '山城区', 157);
insert into COUNTY (countyid, countyname, cityid)
values (1421, '淇滨区', 157);
insert into COUNTY (countyid, countyname, cityid)
values (1422, '浚县', 157);
insert into COUNTY (countyid, countyname, cityid)
values (1423, '淇县', 157);
insert into COUNTY (countyid, countyname, cityid)
values (1424, '红旗区', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1425, '卫滨区', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1426, '凤泉区', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1427, '牧野区', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1428, '新乡县', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1429, '获嘉县', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1430, '原阳县', 158);
commit;
prompt 2700 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (1431, '延津县', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1432, '封丘县', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1433, '长垣县', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1434, '卫辉市', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1435, '辉县市', 158);
insert into COUNTY (countyid, countyname, cityid)
values (1436, '解放区', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1437, '中站区', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1438, '马村区', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1439, '山阳区', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1440, '修武县', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1441, '博爱县', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1442, '武陟县', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1443, '温县', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1444, '济源市', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1445, '沁阳市', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1446, '孟州市', 159);
insert into COUNTY (countyid, countyname, cityid)
values (1447, '华龙区', 160);
insert into COUNTY (countyid, countyname, cityid)
values (1448, '清丰县', 160);
insert into COUNTY (countyid, countyname, cityid)
values (1449, '南乐县', 160);
insert into COUNTY (countyid, countyname, cityid)
values (1450, '范县', 160);
insert into COUNTY (countyid, countyname, cityid)
values (1451, '台前县', 160);
insert into COUNTY (countyid, countyname, cityid)
values (1452, '濮阳县', 160);
insert into COUNTY (countyid, countyname, cityid)
values (1453, '魏都区', 161);
insert into COUNTY (countyid, countyname, cityid)
values (1454, '许昌县', 161);
insert into COUNTY (countyid, countyname, cityid)
values (1455, '鄢陵县', 161);
insert into COUNTY (countyid, countyname, cityid)
values (1456, '襄城县', 161);
insert into COUNTY (countyid, countyname, cityid)
values (1457, '禹州市', 161);
insert into COUNTY (countyid, countyname, cityid)
values (1458, '长葛市', 161);
insert into COUNTY (countyid, countyname, cityid)
values (1459, '源汇区', 162);
insert into COUNTY (countyid, countyname, cityid)
values (1460, '郾城区', 162);
insert into COUNTY (countyid, countyname, cityid)
values (1461, '召陵区', 162);
insert into COUNTY (countyid, countyname, cityid)
values (1462, '舞阳县', 162);
insert into COUNTY (countyid, countyname, cityid)
values (1463, '临颍县', 162);
insert into COUNTY (countyid, countyname, cityid)
values (1464, '市辖区', 163);
insert into COUNTY (countyid, countyname, cityid)
values (1465, '湖滨区', 163);
insert into COUNTY (countyid, countyname, cityid)
values (1466, '渑池县', 163);
insert into COUNTY (countyid, countyname, cityid)
values (1467, '陕县', 163);
insert into COUNTY (countyid, countyname, cityid)
values (1468, '卢氏县', 163);
insert into COUNTY (countyid, countyname, cityid)
values (1469, '义马市', 163);
insert into COUNTY (countyid, countyname, cityid)
values (1470, '灵宝市', 163);
insert into COUNTY (countyid, countyname, cityid)
values (1471, '宛城区', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1472, '卧龙区', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1473, '南召县', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1474, '方城县', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1475, '西峡县', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1476, '镇平县', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1477, '内乡县', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1478, '淅川县', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1479, '社旗县', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1480, '唐河县', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1481, '新野县', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1482, '桐柏县', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1483, '邓州市', 164);
insert into COUNTY (countyid, countyname, cityid)
values (1484, '梁园区', 165);
insert into COUNTY (countyid, countyname, cityid)
values (1485, '睢阳区', 165);
insert into COUNTY (countyid, countyname, cityid)
values (1486, '民权县', 165);
insert into COUNTY (countyid, countyname, cityid)
values (1487, '睢县', 165);
insert into COUNTY (countyid, countyname, cityid)
values (1488, '宁陵县', 165);
insert into COUNTY (countyid, countyname, cityid)
values (1489, '柘城县', 165);
insert into COUNTY (countyid, countyname, cityid)
values (1490, '虞城县', 165);
insert into COUNTY (countyid, countyname, cityid)
values (1491, '夏邑县', 165);
insert into COUNTY (countyid, countyname, cityid)
values (1492, '永城市', 165);
insert into COUNTY (countyid, countyname, cityid)
values (1493, '浉河区', 166);
insert into COUNTY (countyid, countyname, cityid)
values (1494, '平桥区', 166);
insert into COUNTY (countyid, countyname, cityid)
values (1495, '罗山县', 166);
insert into COUNTY (countyid, countyname, cityid)
values (1496, '光山县', 166);
insert into COUNTY (countyid, countyname, cityid)
values (1497, '新县', 166);
insert into COUNTY (countyid, countyname, cityid)
values (1498, '商城县', 166);
insert into COUNTY (countyid, countyname, cityid)
values (1499, '固始县', 166);
insert into COUNTY (countyid, countyname, cityid)
values (1500, '潢川县', 166);
insert into COUNTY (countyid, countyname, cityid)
values (1501, '淮滨县', 166);
insert into COUNTY (countyid, countyname, cityid)
values (1502, '息县', 166);
insert into COUNTY (countyid, countyname, cityid)
values (1503, '川汇区', 167);
insert into COUNTY (countyid, countyname, cityid)
values (1504, '扶沟县', 167);
insert into COUNTY (countyid, countyname, cityid)
values (1505, '西华县', 167);
insert into COUNTY (countyid, countyname, cityid)
values (1506, '商水县', 167);
insert into COUNTY (countyid, countyname, cityid)
values (1507, '沈丘县', 167);
insert into COUNTY (countyid, countyname, cityid)
values (1508, '郸城县', 167);
insert into COUNTY (countyid, countyname, cityid)
values (1509, '淮阳县', 167);
insert into COUNTY (countyid, countyname, cityid)
values (1510, '太康县', 167);
insert into COUNTY (countyid, countyname, cityid)
values (1511, '鹿邑县', 167);
insert into COUNTY (countyid, countyname, cityid)
values (1512, '项城市', 167);
insert into COUNTY (countyid, countyname, cityid)
values (1513, '驿城区', 168);
insert into COUNTY (countyid, countyname, cityid)
values (1514, '西平县', 168);
insert into COUNTY (countyid, countyname, cityid)
values (1515, '上蔡县', 168);
insert into COUNTY (countyid, countyname, cityid)
values (1516, '平舆县', 168);
insert into COUNTY (countyid, countyname, cityid)
values (1517, '正阳县', 168);
insert into COUNTY (countyid, countyname, cityid)
values (1518, '确山县', 168);
insert into COUNTY (countyid, countyname, cityid)
values (1519, '泌阳县', 168);
insert into COUNTY (countyid, countyname, cityid)
values (1520, '汝南县', 168);
insert into COUNTY (countyid, countyname, cityid)
values (1521, '遂平县', 168);
insert into COUNTY (countyid, countyname, cityid)
values (1522, '新蔡县', 168);
insert into COUNTY (countyid, countyname, cityid)
values (1523, '江岸区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1524, '江汉区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1525, '硚口区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1526, '汉阳区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1527, '武昌区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1528, '青山区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1529, '洪山区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1530, '东西湖区', 169);
commit;
prompt 2800 records committed...
insert into COUNTY (countyid, countyname, cityid)
values (1531, '汉南区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1532, '蔡甸区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1533, '江夏区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1534, '黄陂区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1535, '新洲区', 169);
insert into COUNTY (countyid, countyname, cityid)
values (1536, '黄石港区', 170);
insert into COUNTY (countyid, countyname, cityid)
values (1537, '西塞山区', 170);
insert into COUNTY (countyid, countyname, cityid)
values (1538, '下陆区', 170);
insert into COUNTY (countyid, countyname, cityid)
values (1539, '铁山区', 170);
insert into COUNTY (countyid, countyname, cityid)
values (1540, '阳新县', 170);
insert into COUNTY (countyid, countyname, cityid)
values (1541, '大冶市', 170);
insert into COUNTY (countyid, countyname, cityid)
values (1542, '茅箭区', 171);
insert into COUNTY (countyid, countyname, cityid)
values (1543, '张湾区', 171);
insert into COUNTY (countyid, countyname, cityid)
values (1544, '郧县', 171);
insert into COUNTY (countyid, countyname, cityid)
values (1545, '郧西县', 171);
insert into COUNTY (countyid, countyname, cityid)
values (1546, '竹山县', 171);
insert into COUNTY (countyid, countyname, cityid)
values (1547, '竹溪县', 171);
insert into COUNTY (countyid, countyname, cityid)
values (1548, '房县', 171);
insert into COUNTY (countyid, countyname, cityid)
values (1549, '丹江口市', 171);
insert into COUNTY (countyid, countyname, cityid)
values (1550, '西陵区', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1551, '伍家岗区', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1552, '点军区', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1553, '猇亭区', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1554, '夷陵区', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1555, '远安县', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1556, '兴山县', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1557, '秭归县', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1558, '长阳土家族自治县', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1559, '五峰土家族自治县', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1560, '宜都市', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1561, '当阳市', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1562, '枝江市', 172);
insert into COUNTY (countyid, countyname, cityid)
values (1563, '襄城区', 173);
insert into COUNTY (countyid, countyname, cityid)
values (1564, '樊城区', 173);
insert into COUNTY (countyid, countyname, cityid)
values (1565, '襄阳区', 173);
insert into COUNTY (countyid, countyname, cityid)
values (1566, '南漳县', 173);
insert into COUNTY (countyid, countyname, cityid)
values (1567, '谷城县', 173);
insert into COUNTY (countyid, countyname, cityid)
values (1568, '保康县', 173);
insert into COUNTY (countyid, countyname, cityid)
values (1569, '老河口市', 173);
insert into COUNTY (countyid, countyname, cityid)
values (1570, '枣阳市', 173);
insert into COUNTY (countyid, countyname, cityid)
values (1571, '宜城市', 173);
insert into COUNTY (countyid, countyname, cityid)
values (1572, '梁子湖区', 174);
insert into COUNTY (countyid, countyname, cityid)
values (1573, '华容区', 174);
insert into COUNTY (countyid, countyname, cityid)
values (1574, '鄂城区', 174);
insert into COUNTY (countyid, countyname, cityid)
values (1575, '东宝区', 175);
insert into COUNTY (countyid, countyname, cityid)
values (1576, '掇刀区', 175);
insert into COUNTY (countyid, countyname, cityid)
values (1577, '京山县', 175);
insert into COUNTY (countyid, countyname, cityid)
values (1578, '沙洋县', 175);
insert into COUNTY (countyid, countyname, cityid)
values (1579, '钟祥市', 175);
insert into COUNTY (countyid, countyname, cityid)
values (1580, '孝南区', 176);
insert into COUNTY (countyid, countyname, cityid)
values (1581, '孝昌县', 176);
insert into COUNTY (countyid, countyname, cityid)
values (1582, '大悟县', 176);
insert into COUNTY (countyid, countyname, cityid)
values (1583, '云梦县', 176);
insert into COUNTY (countyid, countyname, cityid)
values (1584, '应城市', 176);
insert into COUNTY (countyid, countyname, cityid)
values (1585, '安陆市', 176);
insert into COUNTY (countyid, countyname, cityid)
values (1586, '汉川市', 176);
insert into COUNTY (countyid, countyname, cityid)
values (1587, '沙市区', 177);
insert into COUNTY (countyid, countyname, cityid)
values (1588, '荆州区', 177);
insert into COUNTY (countyid, countyname, cityid)
values (1589, '公安县', 177);
insert into COUNTY (countyid, countyname, cityid)
values (1590, '监利县', 177);
insert into COUNTY (countyid, countyname, cityid)
values (1591, '江陵县', 177);
insert into COUNTY (countyid, countyname, cityid)
values (1592, '石首市', 177);
commit;
prompt 2862 records loaded
prompt Loading IMPARTCONTENT...
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0001', '9', '10005', null, 'IA0001', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0002', '9', '10005', null, 'IA0002', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0003', '9', '10005', null, 'IA0003', null, null, 'N', 'N');
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0004', '9', '10005', null, 'IA0004', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0005', '9', '10005', null, 'IA0005', null, null, 'N', 'N');
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0006', '9', '10005', null, 'IA0006', null, null, 'N', 'N');
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0007', '9', '10005', null, 'IA0007', null, null, 'N', 'N');
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0008', '9', '10005', null, 'IA0008', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0009', '9', '10005', null, 'IA0009', null, null, 'N', 'N');
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0010', '9', '10005', null, 'IA0010', null, null, 'N', 'N');
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0011', '9', '10005', null, 'IA0011', null, null, 'N', 'N');
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0012', '9', '10005', null, 'IA0012', null, null, 'N', 'N');
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0013', '9', '10005', null, 'IA0013', null, null, 'N', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0014', '9', '10005', null, 'IA0014', null, null, 'N', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0015', '9', '10005', null, 'IA0015', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0016', '9', '10005', null, 'IA0016', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0017', '9', '10005', null, 'IA0017', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0018', '9', '10005', null, 'IA0018', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0019', '9', '10005', null, 'IA0019', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0020', '9', '10005', null, 'IA0020', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0021', '9', '10005', null, 'IA0021', null, null, 'N', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0022', '9', '10005', null, 'IA0022', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0023', '9', '10005', null, 'IA0023', null, null, 'N', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0024', '9', '10005', null, 'IA0024', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0025', '9', '10005', null, 'IA0025', null, null, 'N', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0026', '9', '10005', null, 'IA0026', null, null, 'N', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0027', '9', '10005', null, 'IA0027', null, null, 'N', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0028', '9', '10005', null, 'IA0028', null, null, 'N', null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0029', '9', '10005', null, 'IA0029', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0030', '9', '10005', null, 'IA0030', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0031', '9', '10005', null, 'IA0031', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0032', '9', '10005', null, 'IA0032', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0033', '9', '10005', null, 'IA0033', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0034', '9', '10005', null, 'IA0034', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0035', '9', '10005', null, 'IA0035', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0036', '9', '10005', null, 'IA0036', null, null, 'N', 'N');
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0037', '9', '10005', null, 'IA0037', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0038', '9', '10005', null, 'IA0038', null, null, null, null);
insert into IMPARTCONTENT (contnoimpartcode, transno, contno, insuredcompany, impartcode, insuredimpart, ownerimpart, insuredyesorno, owneryesorno)
values ('10005IA0039', '9', '10005', null, 'IA0039', null, null, 'N', 'N');
commit;
prompt 39 records loaded
prompt Loading LCACCOUNTINFO...
insert into LCACCOUNTINFO (transno, insurcecom, proposalcontno, riskcode, accno, accrate, bak1, bak2, bak3, bak4, bak5)
values ('10', '014', '10006', '002', '1', '10', null, '1111111111111', null, null, null);
insert into LCACCOUNTINFO (transno, insurcecom, proposalcontno, riskcode, accno, accrate, bak1, bak2, bak3, bak4, bak5)
values ('10', '014', '10006', '002', '4', '10', null, '4444444444444', null, null, null);
insert into LCACCOUNTINFO (transno, insurcecom, proposalcontno, riskcode, accno, accrate, bak1, bak2, bak3, bak4, bak5)
values ('10', '014', '10006', '002', '2', '100', null, '2222222222222222', null, null, null);
insert into LCACCOUNTINFO (transno, insurcecom, proposalcontno, riskcode, accno, accrate, bak1, bak2, bak3, bak4, bak5)
values ('9', '014', '10005', '002', '5', '10', null, '555555555555', null, null, null);
insert into LCACCOUNTINFO (transno, insurcecom, proposalcontno, riskcode, accno, accrate, bak1, bak2, bak3, bak4, bak5)
values ('9', '014', '10005', '002', '4', '20', null, '4444444444444', null, null, null);
insert into LCACCOUNTINFO (transno, insurcecom, proposalcontno, riskcode, accno, accrate, bak1, bak2, bak3, bak4, bak5)
values ('9', '014', '10005', '002', '3', '30', null, '33333333333', null, null, null);
insert into LCACCOUNTINFO (transno, insurcecom, proposalcontno, riskcode, accno, accrate, bak1, bak2, bak3, bak4, bak5)
values ('9', '014', '10005', '002', '2', '10', null, '2222222222222222', null, null, null);
insert into LCACCOUNTINFO (transno, insurcecom, proposalcontno, riskcode, accno, accrate, bak1, bak2, bak3, bak4, bak5)
values ('9', '014', '10005', '002', '1', '30', null, '1111111111111', null, null, null);
commit;
prompt 8 records loaded
prompt Loading LCADDRESS...
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('5', '123456', 0, '2&2&20&浦东i西南区', '300000', '13621720352', '1&1&1&浦东i西南区', '600000', '029-6564596', '13621720352', 'shannian@163.com', '001', '2017-09-13', '11:39:31', '2017-09-13', '11:39:31', null);
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('6', '123456', 0, '1&1&1&浦东新区', '122112', '13621720352', '2&2&20&高清哭', '600000', '029-659846262', '13621720352', 'shannian@163.com', '001', '2017-09-13', '11:43:15', '2017-09-13', '11:43:15', null);
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('4', '123456', 1, '2&2&20&浦东i西南区', '300000', null, '1&1&1&浦东i西南区', null, '029-6564596', '13621720352', 'shannian@163.com', '001', '2017-09-13', '11:55:42', '2017-09-13', '11:55:42', null);
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('7', '123456', 0, '8&66&664&浦东新区', '200000', '13621720352', '5&29&366&浦东新区', '600000', '029-646161', '13621720352', 'shannian@163.com', '001', '2017-09-13', '11:47:54', '2017-09-13', '11:47:54', null);
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('8', '123456', 0, '7&57&574&3123', '200000', '13621720352', '6&43&482&213123', '600000', '321-3123', '13621720352', 'shannian@163.com', '001', '2017-09-13', '11:53:08', '2017-09-13', '11:53:08', null);
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('9', '123456', 0, '1&1&1&浦东新区', '300000', '13621725669', '8&66&664&高青路', '600000', '029-26594615', '13621725669', 'chenbiao139@qq.com', '001', '2017-09-13', '11:54:59', '2017-09-13', '14:49:15', '4&17&237&陆家嘴');
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('9', '123456', 1, '1&1&1&浦东新区', '300000', null, '8&66&664&高青路', null, '029-26594615', '13621725669', 'chenbiao139@qq.com', '001', '2017-09-13', '14:29:33', '2017-09-13', '14:29:33', '4&17&237&陆家嘴');
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('10', '123456', 0, '6&42&476&浦东新区', '600000', '13621720352', '1&1&6&陆家嘴', '300000', '029-35778695', '13621720352', 'chenbiao139@qq.com', 'admin', '2017-09-13', '17:25:06', '2017-09-13', '17:25:06', '2&2&24&东方明珠');
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('10', '123456', 1, '6&42&476&浦东新区', '600000', null, '1&1&6&陆家嘴', null, '029-35778695', '13621720352', 'chenbiao139@qq.com', 'admin', '2017-09-13', '17:26:05', '2017-09-13', '17:26:05', '2&2&24&东方明珠');
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('4', '123456', 0, '2&2&20&浦东i西南区', '300000', '13621720352', '1&1&1&浦东i西南区', '600000', '029-6564596', '13621720352', 'shannian@163.com', '001', '2017-09-13', '11:38:19', '2017-09-13', '11:38:19', null);
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('11', '123456', 0, '1&1&5&123沙达菲斯', '123456', '13501221234', '1&1&5&当事方', null, '012-12321321', '13501221234', 'sd@12.com', 'admin', '2017-09-13', '20:10:13', '2017-09-13', '20:10:13', '1&1&2&手动阀');
insert into LCADDRESS (transno, customerno, addressno, postaladdress, zipcode, phone, homeaddress, homezipcode, homephone, mobile, email, operator, makedate, maketime, modifydate, modifytime, otheraddress)
values ('11', '123456', 1, '1&1&5&123沙达菲斯', '123456', null, '1&1&5&当事方', null, '012-12321321', '13501221234', 'sd@12.com', 'admin', '2017-09-13', '20:12:13', '2017-09-13', '20:12:13', '1&1&2&手动阀');
commit;
prompt 12 records loaded
prompt Loading LCAPPNT...
insert into LCAPPNT (transno, contno, prtno, appntno, relationtolcinsured, appntstartdate, appntname, appntsex, appntbirthday, appntenddate, idtype, idno, nativeplace, idsubmit, rgtaddress, health, stature, avoirdupois, creditgrade, bankcode, bankaccno, accname, salary, occupationcode, company, responsibility, managecom, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('4', '10000', '10000', '3', null, to_date('21-09-2017', 'dd-mm-yyyy'), '张三', '0', to_date('30-08-2017', 'dd-mm-yyyy'), to_date('08-09-2017', 'dd-mm-yyyy'), '2', '2321124124', 'AE', null, '1', 'N', 170, 65, '1', null, null, null, 321, 'F89D', '上海i中科软', 'it技术', null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:38:19', to_date('13-09-2017', 'dd-mm-yyyy'), '11:38:19', '123456');
insert into LCAPPNT (transno, contno, prtno, appntno, relationtolcinsured, appntstartdate, appntname, appntsex, appntbirthday, appntenddate, idtype, idno, nativeplace, idsubmit, rgtaddress, health, stature, avoirdupois, creditgrade, bankcode, bankaccno, accname, salary, occupationcode, company, responsibility, managecom, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('5', '10001', '10001', '4', null, to_date('21-09-2017', 'dd-mm-yyyy'), '张三', '0', to_date('30-08-2017', 'dd-mm-yyyy'), to_date('08-09-2017', 'dd-mm-yyyy'), '2', '2321124124', 'AE', null, '1', 'N', 170, 65, '1', null, null, null, 321, 'F89D', '上海i中科软', 'it技术', null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:39:31', to_date('13-09-2017', 'dd-mm-yyyy'), '11:39:31', '123456');
insert into LCAPPNT (transno, contno, prtno, appntno, relationtolcinsured, appntstartdate, appntname, appntsex, appntbirthday, appntenddate, idtype, idno, nativeplace, idsubmit, rgtaddress, health, stature, avoirdupois, creditgrade, bankcode, bankaccno, accname, salary, occupationcode, company, responsibility, managecom, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('6', '10002', '10002', '5', null, to_date('29-08-2017', 'dd-mm-yyyy'), '李四', '0', to_date('01-09-2017', 'dd-mm-yyyy'), to_date('01-09-2017', 'dd-mm-yyyy'), '2', '3213124214', 'AE', null, '1', 'N', 170, 65, '1', null, null, null, 1, 'G654', '中科软', 'it技术', null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:43:15', to_date('13-09-2017', 'dd-mm-yyyy'), '11:43:15', '123456');
insert into LCAPPNT (transno, contno, prtno, appntno, relationtolcinsured, appntstartdate, appntname, appntsex, appntbirthday, appntenddate, idtype, idno, nativeplace, idsubmit, rgtaddress, health, stature, avoirdupois, creditgrade, bankcode, bankaccno, accname, salary, occupationcode, company, responsibility, managecom, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('7', '10003', '10003', '6', null, to_date('29-08-2017', 'dd-mm-yyyy'), '张三', '0', to_date('01-09-2017', 'dd-mm-yyyy'), to_date('15-09-2017', 'dd-mm-yyyy'), '2', '4565多锕的', 'AF', null, '1', 'N', 170, 65, '2', null, null, null, 23123, 'F89D', 'itjishu ', 'dsadas', null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:47:54', to_date('13-09-2017', 'dd-mm-yyyy'), '11:47:54', '123456');
insert into LCAPPNT (transno, contno, prtno, appntno, relationtolcinsured, appntstartdate, appntname, appntsex, appntbirthday, appntenddate, idtype, idno, nativeplace, idsubmit, rgtaddress, health, stature, avoirdupois, creditgrade, bankcode, bankaccno, accname, salary, occupationcode, company, responsibility, managecom, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('8', '10004', '10004', '7', null, to_date('28-08-2017', 'dd-mm-yyyy'), '张三', '0', to_date('06-09-2017', 'dd-mm-yyyy'), to_date('06-09-2017', 'dd-mm-yyyy'), '4', '131231', 'AE', null, '231', 'N', 170, 65, '1', null, null, null, 13, 'F89D', '131', '3123', null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:53:08', to_date('13-09-2017', 'dd-mm-yyyy'), '11:53:08', '123456');
insert into LCAPPNT (transno, contno, prtno, appntno, relationtolcinsured, appntstartdate, appntname, appntsex, appntbirthday, appntenddate, idtype, idno, nativeplace, idsubmit, rgtaddress, health, stature, avoirdupois, creditgrade, bankcode, bankaccno, accname, salary, occupationcode, company, responsibility, managecom, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('9', '10005', '10005', '8', null, to_date('29-08-2017', 'dd-mm-yyyy'), 'zhangsan', '1', to_date('29-08-2017', 'dd-mm-yyyy'), to_date('30-08-2017', 'dd-mm-yyyy'), '2', '3213', 'AF', null, '4', 'N', 170, 65, '2', null, null, null, 1, 'G654', 'dasd', 'it技术', null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:54:59', to_date('13-09-2017', 'dd-mm-yyyy'), '14:49:15', '123456');
insert into LCAPPNT (transno, contno, prtno, appntno, relationtolcinsured, appntstartdate, appntname, appntsex, appntbirthday, appntenddate, idtype, idno, nativeplace, idsubmit, rgtaddress, health, stature, avoirdupois, creditgrade, bankcode, bankaccno, accname, salary, occupationcode, company, responsibility, managecom, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('10', '10006', '10006', '9', null, to_date('13-09-2017', 'dd-mm-yyyy'), '张三', '0', to_date('06-09-2017', 'dd-mm-yyyy'), to_date('08-09-2017', 'dd-mm-yyyy'), '1', '610425199405150618', 'AE', null, '1', 'N', 170, 65, '1', null, null, null, 10000, 'F89D', '上海中科软', 'it技术', null, 'admin', to_date('13-09-2017', 'dd-mm-yyyy'), '17:25:06', to_date('13-09-2017', 'dd-mm-yyyy'), '17:25:06', '123456');
insert into LCAPPNT (transno, contno, prtno, appntno, relationtolcinsured, appntstartdate, appntname, appntsex, appntbirthday, appntenddate, idtype, idno, nativeplace, idsubmit, rgtaddress, health, stature, avoirdupois, creditgrade, bankcode, bankaccno, accname, salary, occupationcode, company, responsibility, managecom, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('11', '111', '111', '10', null, to_date('29-08-2017', 'dd-mm-yyyy'), '里斯', '0', to_date('13-09-2017', 'dd-mm-yyyy'), to_date('28-09-2017', 'dd-mm-yyyy'), '2', '12345678', 'NA', null, '223', 'N', 123, 12, '1', null, null, null, 2121, '001', '1231sdf', '士大夫似的', null, 'admin', to_date('13-09-2017', 'dd-mm-yyyy'), '20:10:13', to_date('13-09-2017', 'dd-mm-yyyy'), '20:10:13', '123456');
commit;
prompt 8 records loaded
prompt Loading LCBNF...
insert into LCBNF (transno, contno, polno, insuredno, bnftype, bnfno, bnfgrade, relationtoinsured, bnflot, customerno, name, sex, birthday, idtype, idno, getform, getbankcode, getbankaccno, getaccname, operator, makedate, maketime, modifydate, modifytime)
values ('10', '10006', '10006', '8', '1', 1, '1', '02', 100, '123456', '张三', '0', to_date('30-08-2017', 'dd-mm-yyyy'), '0', '121212', '2', null, null, null, 'admin', to_date('13-09-2017', 'dd-mm-yyyy'), '17:35:35', to_date('13-09-2017', 'dd-mm-yyyy'), '17:35:35');
insert into LCBNF (transno, contno, polno, insuredno, bnftype, bnfno, bnfgrade, relationtoinsured, bnflot, customerno, name, sex, birthday, idtype, idno, getform, getbankcode, getbankaccno, getaccname, operator, makedate, maketime, modifydate, modifytime)
values ('9', '10005', '10005', '7', '0', 1, '1', null, 100, '123456', '法定', null, null, null, null, '1', null, null, null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:55:10', to_date('13-09-2017', 'dd-mm-yyyy'), '11:55:10');
insert into LCBNF (transno, contno, polno, insuredno, bnftype, bnfno, bnfgrade, relationtoinsured, bnflot, customerno, name, sex, birthday, idtype, idno, getform, getbankcode, getbankaccno, getaccname, operator, makedate, maketime, modifydate, modifytime)
values ('11', '111', '111', '9', '1', 1, '1', '02', 100, '123456', '李四', '0', to_date('13-09-2017', 'dd-mm-yyyy'), '2', '12321', '2', null, null, null, 'admin', to_date('13-09-2017', 'dd-mm-yyyy'), '20:49:49', to_date('13-09-2017', 'dd-mm-yyyy'), '20:49:49');
commit;
prompt 3 records loaded
prompt Loading LCCONT...
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance)
values ('4', '10000', '10000', '10000', '1', null, null, '0', null, null, null, null, '001', null, null, null, '014', null, '3', null, null, '3', '张三', '0', to_date('30-08-2017', 'dd-mm-yyyy'), '2', '2321124124', '2', '张三', '0', to_date('30-01-2017', 'dd-mm-yyyy'), '2', '2321124124', null, null, '1', null, null, null, null, '61323123123213', null, null, null, null, null, null, null, null, null, null, null, '00', to_date('13-09-2017', 'dd-mm-yyyy'), '00', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, null, null, null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:38:19', to_date('13-09-2017 11:55:42', 'dd-mm-yyyy hh24:mi:ss'), '2017-09-13', '001', '123456', '100', '002', 2000000);
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance)
values ('5', '10001', '10001', '10001', '1', null, null, '0', null, null, null, null, '001', null, null, null, '014', null, '3', null, null, '4', '张三', '0', to_date('30-08-2017', 'dd-mm-yyyy'), '2', '2321124124', '3', null, null, null, null, null, null, null, '1', null, null, null, null, '61323123123213', null, null, null, null, null, null, null, null, null, null, null, '00', to_date('13-09-2017', 'dd-mm-yyyy'), '00', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, null, null, null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:39:31', to_date('13-09-2017', 'dd-mm-yyyy'), '11:39:31', '001', '123456', '100', '002', 2000000);
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance)
values ('6', '10002', '10002', '10002', '1', null, null, '0', null, null, null, null, '001', null, null, null, '014', null, '3', null, null, '5', '李四', '0', to_date('01-09-2017', 'dd-mm-yyyy'), '2', '3213124214', '4', null, null, null, null, null, null, null, '1', null, null, null, null, '61323123123213', null, null, null, null, null, null, null, null, null, null, null, '00', to_date('13-09-2017', 'dd-mm-yyyy'), '00', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, null, null, null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:43:15', to_date('13-09-2017', 'dd-mm-yyyy'), '11:43:15', '001', '123456', '100', '002', 2000000);
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance)
values ('7', '10003', '10003', '10003', '1', null, null, '0', null, null, null, null, '001', null, null, null, '014', null, '3', null, null, '6', '张三', '0', to_date('01-09-2017', 'dd-mm-yyyy'), '2', '4565多锕的', '5', null, null, null, null, null, null, null, '1', null, null, null, null, '61323123123213', null, null, null, null, null, null, null, null, null, null, null, '00', to_date('13-09-2017', 'dd-mm-yyyy'), '00', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, null, null, null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:47:54', to_date('13-09-2017', 'dd-mm-yyyy'), '11:47:54', '001', '123456', '100', '002', 2000000);
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance)
values ('8', '10004', '10004', '10004', '1', null, null, '0', null, null, null, null, '001', null, null, null, '014', null, '3', null, null, '7', '张三', '0', to_date('06-09-2017', 'dd-mm-yyyy'), '4', '131231', '6', null, null, null, null, null, null, null, '1', null, null, null, null, '61323123123213', null, null, null, null, null, null, null, null, null, null, null, '00', to_date('13-09-2017', 'dd-mm-yyyy'), '00', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, null, null, null, '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:53:08', to_date('13-09-2017', 'dd-mm-yyyy'), '11:53:08', '001', '123456', '100', '002', 2000000);
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance)
values ('9', '10005', '10005', '10005', '1', null, null, '0', null, null, null, null, '001', null, null, null, '014', null, '3', null, null, '8', 'zhangsan', '1', to_date('29-08-2017', 'dd-mm-yyyy'), '2', '3213', '7', 'zhangsan', '1', to_date('29-01-2017', 'dd-mm-yyyy'), '2', '3213', null, null, '1', null, null, null, null, null, null, null, null, null, null, null, .23, .96, null, null, null, '04', to_date('13-09-2017', 'dd-mm-yyyy'), '01', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, '10', null, '9', '001', to_date('13-09-2017', 'dd-mm-yyyy'), '18:43:44', to_date('13-09-2017', 'dd-mm-yyyy'), '14:49:15', '001', '123456', '100', '002', 2000000);
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance)
values ('10', '10006', '10006', '10006', '1', null, null, '0', null, null, null, null, 'admin', null, null, null, '014', null, '3', null, null, '9', '张三', '0', to_date('06-09-2017', 'dd-mm-yyyy'), '1', '610425199405150618', '8', '张三', '0', to_date('06-01-2017', 'dd-mm-yyyy'), '1', '610425199405150618', null, null, '1', null, null, null, null, '61323123123213', null, null, null, null, null, null, .23, .96, null, null, null, '04', to_date('13-09-2017', 'dd-mm-yyyy'), '01', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, '10', null, '10', 'admin', to_date('13-09-2017', 'dd-mm-yyyy'), '17:53:43', to_date('13-09-2017', 'dd-mm-yyyy'), '17:50:56', 'admin', '123456', '100', '002', 2000000);
insert into LCCONT (transno, contno, proposalcontno, prtno, conttype, familytype, familyid, poltype, cardflag, managecom, executecom, agentcom, agentcode, agentgroup, agentcode1, agenttype, insurancecom, insurancemanagecom, salechnl, handler, password, appntno, appntname, appntsex, appntbirthday, appntidtype, appntidno, insuredno, insuredname, insuredsex, insuredbirthday, insuredidtype, insuredidno, paylocation, outpayflag, getpolmode, signcom, signdate, signtime, bankcode, bankaccno, accname, printcount, losttimes, remark, peoples, mult, prem, amnt, sumprem, firstpaydate, approvetime, appflag, polapplydate, state, firsttrialoperator, firsttrialdate, firsttrialtime, receiveoperator, receivedate, chargerate, tempfeeno, selltype, forceuwflag, forceuwreason, newbankcode, newbankaccno, newaccname, newpaymode, agentbankcode, bankagent, organcomcode, operator, makedate, maketime, modifydate, modifytime, agentname, grpcontno, receivetime, riskcode, accountbalance)
values ('11', '111', '111', '111', '1', null, null, '0', null, null, null, null, 'admin', null, null, null, '001', null, '3', null, null, '10', '里斯', '0', to_date('13-09-2017', 'dd-mm-yyyy'), '2', '12345678', '9', '里斯', '0', to_date('13-01-2017', 'dd-mm-yyyy'), '2', '12345678', null, null, '1', null, null, null, null, '61323123123213', null, null, null, null, null, null, null, null, null, null, null, '00', to_date('13-09-2017', 'dd-mm-yyyy'), '00', null, null, null, null, null, null, null, '08', '0', null, null, null, null, null, null, null, null, 'admin', to_date('13-09-2017', 'dd-mm-yyyy'), '20:10:13', to_date('13-09-2017 20:12:13', 'dd-mm-yyyy hh24:mi:ss'), '2017-09-13', null, '123456', '100', '001', 2000000);
commit;
prompt 8 records loaded
prompt Loading LCINSURED...
insert into LCINSURED (transno, contno, insuredno, prtno, appntno, managecom, executecom, relationtoappnt, lcinsuredname, lcinsuredsex, lcinsuredbirthday, lcinsuredidtype, lcinsuredidno, insureidenddate, insureidstartdate, lcinsurednativeplace, lcinsuredidsubmit, rgtaddress, health, stature, avoirdupois, lcinsuredrgtaddress, lcinsuredcompany, lcinsuredresponsibility, lcinsuredroccupationcode, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('9', '10005', '7', '10005', null, '536', '536', '01', 'zhangsan', '1', to_date('29-01-2017', 'dd-mm-yyyy'), '2', '3213', to_date('30-08-2017', 'dd-mm-yyyy'), to_date('29-08-2017', 'dd-mm-yyyy'), 'AF', null, null, null, 170, null, null, 'dasd', 'it技术', 'G654', '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:55:06', to_date('13-09-2017', 'dd-mm-yyyy'), '14:29:33', '123456');
insert into LCINSURED (transno, contno, insuredno, prtno, appntno, managecom, executecom, relationtoappnt, lcinsuredname, lcinsuredsex, lcinsuredbirthday, lcinsuredidtype, lcinsuredidno, insureidenddate, insureidstartdate, lcinsurednativeplace, lcinsuredidsubmit, rgtaddress, health, stature, avoirdupois, lcinsuredrgtaddress, lcinsuredcompany, lcinsuredresponsibility, lcinsuredroccupationcode, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('4', '10000', '2', '10000', null, '536', '536', '01', '张三', '0', to_date('30-01-2017', 'dd-mm-yyyy'), '2', '2321124124', to_date('08-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), 'AE', null, null, 'N', 170, 65, null, '上海i中科软', 'it技术', 'F89D', '001', to_date('13-09-2017', 'dd-mm-yyyy'), '11:55:42', to_date('13-09-2017', 'dd-mm-yyyy'), '11:55:42', '123456');
insert into LCINSURED (transno, contno, insuredno, prtno, appntno, managecom, executecom, relationtoappnt, lcinsuredname, lcinsuredsex, lcinsuredbirthday, lcinsuredidtype, lcinsuredidno, insureidenddate, insureidstartdate, lcinsurednativeplace, lcinsuredidsubmit, rgtaddress, health, stature, avoirdupois, lcinsuredrgtaddress, lcinsuredcompany, lcinsuredresponsibility, lcinsuredroccupationcode, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('10', '10006', '8', '10006', null, '536', '536', '01', '张三', '0', to_date('06-01-2017', 'dd-mm-yyyy'), '1', '610425199405150618', to_date('08-09-2017', 'dd-mm-yyyy'), to_date('13-09-2017', 'dd-mm-yyyy'), 'AE', null, null, 'N', 170, 65, null, '上海中科软', 'it技术', 'F89D', 'admin', to_date('13-09-2017', 'dd-mm-yyyy'), '17:26:05', to_date('13-09-2017', 'dd-mm-yyyy'), '17:26:05', '123456');
insert into LCINSURED (transno, contno, insuredno, prtno, appntno, managecom, executecom, relationtoappnt, lcinsuredname, lcinsuredsex, lcinsuredbirthday, lcinsuredidtype, lcinsuredidno, insureidenddate, insureidstartdate, lcinsurednativeplace, lcinsuredidsubmit, rgtaddress, health, stature, avoirdupois, lcinsuredrgtaddress, lcinsuredcompany, lcinsuredresponsibility, lcinsuredroccupationcode, operator, makedate, maketime, modifydate, modifytime, grpcontno)
values ('11', '111', '9', '111', null, '001', '001', '01', '里斯', '0', to_date('13-01-2017', 'dd-mm-yyyy'), '2', '12345678', to_date('28-09-2017', 'dd-mm-yyyy'), to_date('29-08-2017', 'dd-mm-yyyy'), 'NA', null, null, 'N', 123, 12, null, '1231sdf', '士大夫似的', '001', 'admin', to_date('13-09-2017', 'dd-mm-yyyy'), '20:12:13', to_date('13-09-2017', 'dd-mm-yyyy'), '20:12:13', '123456');
commit;
prompt 4 records loaded
prompt Loading LCPOL...
insert into LCPOL (transno, grpcontno, grppolno, contno, polno, proposalno, prtno, conttype, poltypeflag, mainpolno, masterpolno, kindcode, riskcode, riskversion, managecom, agentcom, agenttype, agentcode, agentgroup, agentcode1, insurancecom, insurancemanagecom, salechnl, handler, insuredno, insuredname, insuredsex, insuredbirthday, insuredappage, insuredpeoples, occupationtype, appntno, appntname, cvalidate, signcom, signdate, signtime, firstpaydate, payenddate, paytodate, getstartdate, enddate, accienddate, getyearflag, getyear, payendyearflag, payendyear, insuyearflag, insuyear, acciyearflag, acciyear, getstarttype, specifyvalidate, paymode, paylocation, payintv, payyears, years, managefeerate, floatrate, premtoamnt, mult, standprem, prem, sumprem, amnt, riskamnt, leavingmoney, endorsetimes, claimtimes, livetimes, renewcount, lastgetdate, lastloandate, lastregetdate, lastedordate, lastrevdate, rnewflag, stopflag, expiryflag, autopayflag, interestdifflag, subflag, bnfflag, healthcheckflag, impartflag, reinsureflag, agentpayflag, agentgetflag, livegetmode, deadgetmode, bonusgetmode, bonusman, deadflag, smokeflag, remark, approveflag, approvecode, approvedate, approvetime, uwflag, uwcode, uwdate, uwtime, polapplydate, appflag, polstate, standbyflag1, standbyflag2, standbyflag3, waitperiod, getform, getbankcode, getbankaccno, getaccname, keepvalueopt, payrulecode, ascriptionrulecode, autopubaccflag, ascriptionflag, investrulecode, uintlinkvaliflag, operator, makedate, maketime, modifydate, modifytime, bonuspaymode, getintv, getstartage, getendage, fullbonusgetmode, autorenewflag, setflag, setcycleflag, setcycle, setno, setmoney, bak1, bak2, bak3, bak4, bak5)
values ('18', '1', '123456', '22222223', '18003', '22222223', '22222223', '01', null, '012', null, '003', '003', '年缴', '2568', '年缴', null, '2568', '001', '缴费85年', null, '累积生息', null, null, '16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 123123, '1', '85Y', '1', '10Y', null, null, null, null, null, null, 'Y', null, null, null, null, null, 1231, 0, 131, 0, 3, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Y', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00', null, null, null, null, null, '1', null, null, null, null, null, null, null, null, '012', null, '001', to_date('15-09-2017', 'dd-mm-yyyy'), '15:34:26', to_date('15-09-2017', 'dd-mm-yyyy'), '15:34:26', null, null, null, null, null, null, null, null, null, null, null, '华夏一号', 'Y', '缴费85年', '保障10年', null);
commit;
prompt 1 records loaded
prompt Loading LDCUSTOMER...
insert into LDCUSTOMER (ldcustomerno, cifid, fullname, formername, idtype, idnumber, idexpiry, age, gender, censusregister, maritalstatus, contactphoneno, mobilephoneno, callback)
values ('107', '123456', '3', '4', '5', '6', '7', '9', '10', '11', '12', '13', '14', '15');
commit;
prompt 1 records loaded
prompt Loading LDCUSTOMERACCOUNT...
insert into LDCUSTOMERACCOUNT (countno, ldcustomerno, cifid, accountnumber, accountccy, accountbalance, accountstatus, bak1, bak2, bak3, bak4, bak5, bak6, bak7, bak8, bak9, bak10)
values ('1097a2a7-15e7b62f301-1d76e73bcd3d0dae045c248a02a188e4', '348', '123456', '61323123123213', '62', '2000000.00', '64', null, null, null, null, null, null, null, null, null, null);
insert into LDCUSTOMERACCOUNT (countno, ldcustomerno, cifid, accountnumber, accountccy, accountbalance, accountstatus, bak1, bak2, bak3, bak4, bak5, bak6, bak7, bak8, bak9, bak10)
values ('1097a2a7-15e7b62f333-1d76e73bcd3d0dae045c248a02a188e4', '349', '123456', '421412412412', '62', '1000.00', '64', null, null, null, null, null, null, null, null, null, null);
insert into LDCUSTOMERACCOUNT (countno, ldcustomerno, cifid, accountnumber, accountccy, accountbalance, accountstatus, bak1, bak2, bak3, bak4, bak5, bak6, bak7, bak8, bak9, bak10)
values ('1097a2a7-15e7b62f299-1d76e73bcd3d0dae045c248a02a188e4', '346', '123456', '610425199405150689', '62', '100000.013', '64', null, null, null, null, null, null, null, null, null, null);
insert into LDCUSTOMERACCOUNT (countno, ldcustomerno, cifid, accountnumber, accountccy, accountbalance, accountstatus, bak1, bak2, bak3, bak4, bak5, bak6, bak7, bak8, bak9, bak10)
values ('1097a2a7-15e7b62f2cd-1d76e73bcd3d0dae045c248a02a188e4', '347', '123456', '610425199405150618', '62', '10000000.00', '64', null, null, null, null, null, null, null, null, null, null);
commit;
prompt 4 records loaded
prompt Loading LDCUSTOMERADDRESS...
insert into LDCUSTOMERADDRESS (ldcustomerno, cifid, residentialaddresstype, residentialprovince, residentialcity, residentialdistrict, residentialdetailedaddress, residentialpostcode, contactaddresstype, contactprovince, contactcity, contactdistrict, contactdetailedaddress, contactpostcode, homeaddresstype, homeprovince, homecity, homedistrict, homedetailedaddress, homepostcode, permanentaddresstype, permanentprovince, permanentcity, permanentdistrict, permanentdetailedaddress, permanentpostcode, previouaddresstype, previouprovince, previoucity, previoudistrict, previoudetailedaddress, previoupostcode, previoucompany, previoucompanyaddress, previouposition, previouindustrytype, previouoccupation, previouemailaddress, previouincome, previoumaritalstatus, previouheight, previouweight, previouincomesource, previouwealthsource, previoutelephonesource, previouhealthcare, previoufamilyincome)
values ('107', '123456', null, null, '18', '19', '20', '21', null, '23', '24', '25', '26', '27', null, '29', '30', '31', '32', '33', null, '35', '36', '37', '38', '39', null, '41', '42', '43', '44', '45', '46', '47', null, '49', '50', '54', '52', null, '55', '56', '57', '58', '59', '60', '53');
commit;
prompt 1 records loaded
prompt Loading LDOCCUPATION...
insert into LDOCCUPATION (occupationcode, occupationname, occupationtype, worktype, workname, medrate, suddrisk, disearisk, hosiprisk)
values ('001', 'IT', '1', 'YD', '1', 1, '1', '1', '1');
commit;
prompt 1 records loaded
prompt Loading PLACCOUNTINSUREDDETAIL...
insert into PLACCOUNTINSUREDDETAIL (serno, serialno, transrno, insurcecom, comcode, insuredaccno, paymoney, clientname, clientidtype, clientidno, payresult, prtno, contno, proposalno, flag, paymodetimes, selltype, authrizedyear, paymode, state, remark, socketflag, dealsuccflag, rightflag, makedate, maketime, modifydate, modifytime, standbyflag, bak1, bak2, bak3, bak4, bak5)
values ('1', '0142017-09-13', '10', '014', '86111712', '61323123123213', .23, '张三', '1', '610425199405150618', '8000', null, '10', '10006', '04', null, null, null, '0', '01', null, '0', '0', '0', to_date('13-09-2017', 'dd-mm-yyyy'), '17:53:43', to_date('13-09-2017', 'dd-mm-yyyy'), '17:53:43', '试算成功', null, null, null, null, null);
insert into PLACCOUNTINSUREDDETAIL (serno, serialno, transrno, insurcecom, comcode, insuredaccno, paymoney, clientname, clientidtype, clientidno, payresult, prtno, contno, proposalno, flag, paymodetimes, selltype, authrizedyear, paymode, state, remark, socketflag, dealsuccflag, rightflag, makedate, maketime, modifydate, modifytime, standbyflag, bak1, bak2, bak3, bak4, bak5)
values ('2', '0142017-09-13', '9', '014', '86111712', null, .23, 'zhangsan', '2', '3213', '8000', null, '10', '10005', '04', null, null, null, '0', '01', null, '0', '0', '0', to_date('13-09-2017', 'dd-mm-yyyy'), '18:43:44', to_date('13-09-2017', 'dd-mm-yyyy'), '18:43:44', '试算成功', '310100', null, null, null, null);
commit;
prompt 2 records loaded
prompt Enabling foreign key constraints for CITY...
alter table CITY enable constraint FOR_PROVINCEID;
prompt Enabling foreign key constraints for COUNTY...
alter table COUNTY enable constraint FOR_CITYID;
prompt Enabling triggers for PROVINCE...
alter table PROVINCE enable all triggers;
prompt Enabling triggers for CITY...
alter table CITY enable all triggers;
prompt Enabling triggers for COUNTY...
alter table COUNTY enable all triggers;
prompt Enabling triggers for IMPARTCONTENT...
alter table IMPARTCONTENT enable all triggers;
prompt Enabling triggers for LCACCOUNTINFO...
alter table LCACCOUNTINFO enable all triggers;
prompt Enabling triggers for LCADDRESS...
alter table LCADDRESS enable all triggers;
prompt Enabling triggers for LCAPPNT...
alter table LCAPPNT enable all triggers;
prompt Enabling triggers for LCBNF...
alter table LCBNF enable all triggers;
prompt Enabling triggers for LCCONT...
alter table LCCONT enable all triggers;
prompt Enabling triggers for LCINSURED...
alter table LCINSURED enable all triggers;
prompt Enabling triggers for LCPOL...
alter table LCPOL enable all triggers;
prompt Enabling triggers for LDCUSTOMER...
alter table LDCUSTOMER enable all triggers;
prompt Enabling triggers for LDCUSTOMERACCOUNT...
alter table LDCUSTOMERACCOUNT enable all triggers;
prompt Enabling triggers for LDCUSTOMERADDRESS...
alter table LDCUSTOMERADDRESS enable all triggers;
prompt Enabling triggers for LDOCCUPATION...
alter table LDOCCUPATION enable all triggers;
prompt Enabling triggers for PLACCOUNTINSUREDDETAIL...
alter table PLACCOUNTINSUREDDETAIL enable all triggers;
set feedback on
set define on
prompt Done.
