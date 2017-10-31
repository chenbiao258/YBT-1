-------------------------------------------------
-- Export file for user YBT                    --
-- Created by suojinyu on 2017/10/31, 20:48:36 --
-------------------------------------------------

set define off
spool lmriskp.log

prompt
prompt Creating table LMRISKPARAMSDEF
prompt ==============================
prompt
create table YBT.LMRISKPARAMSDEF
(
  riskcode   VARCHAR2(22),
  riskver    VARCHAR2(120),
  dutycode   VARCHAR2(120),
  othercode  VARCHAR2(120),
  ctrltype   VARCHAR2(22),
  paramstype VARCHAR2(60),
  paramscode VARCHAR2(60),
  paramsname VARCHAR2(100),
  char1      VARCHAR2(8),
  char2      VARCHAR2(8)
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

prompt
prompt Creating table LMRISKPARAMSDEFA
prompt ===============================
prompt
create table YBT.LMRISKPARAMSDEFA
(
  riskcode   VARCHAR2(22),
  riskver    VARCHAR2(120),
  dutycode   VARCHAR2(120),
  othercode  VARCHAR2(120),
  ctrltype   VARCHAR2(22),
  paramstype VARCHAR2(60),
  paramscode VARCHAR2(60),
  paramsname VARCHAR2(100),
  char1      VARCHAR2(8),
  char2      VARCHAR2(8)
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

prompt
prompt Creating table LMRISKPARAMSDEFB
prompt ===============================
prompt
create table YBT.LMRISKPARAMSDEFB
(
  riskcode   VARCHAR2(22),
  riskver    VARCHAR2(120),
  dutycode   VARCHAR2(120),
  othercode  VARCHAR2(120),
  ctrltype   VARCHAR2(22),
  paramstype VARCHAR2(60),
  paramscode VARCHAR2(60),
  paramsname VARCHAR2(100),
  char1      VARCHAR2(8),
  char2      VARCHAR2(8)
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


spool off
