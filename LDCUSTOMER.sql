drop table LDCUSTOMER

-- Create table
create table LDCUSTOMER
(
  LDCUSTOMERNO    VARCHAR2(100) not null,
  CIFID           VARCHAR2(30) not null,
  FULLNAME        VARCHAR2(22),
  FORMERNAME      VARCHAR2(22),
  IDTYPE          VARCHAR2(30),
  IDNUMBER        VARCHAR2(150),
  IDEXPIRY        VARCHAR2(30),
  AGE             VARCHAR2(30),
  GENDER          VARCHAR2(10),
  CENSUSREGISTER  VARCHAR2(10),
  MARITALSTATUS   VARCHAR2(22),
  CONTACTPHONENO  VARCHAR2(100),
  MOBILEPHONENO   VARCHAR2(100),
  CALLBACK        VARCHAR2(100),
  FULLNAMECHINESE VARCHAR2(280),
  NATIONALITY     VARCHAR2(10),
  DATEOFBIRTH     VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16
    next 8
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column LDCUSTOMER.LDCUSTOMERNO
  is '���к�';
comment on column LDCUSTOMER.CIFID
  is 'CIFID';
comment on column LDCUSTOMER.FULLNAME
  is 'Ӣ����';
comment on column LDCUSTOMER.IDTYPE
  is '֤������';
comment on column LDCUSTOMER.IDNUMBER
  is '֤����';
comment on column LDCUSTOMER.IDEXPIRY
  is '֤��ʧЧ����';
comment on column LDCUSTOMER.MARITALSTATUS
  is '����״��';
comment on column LDCUSTOMER.MOBILEPHONENO
  is '�ֻ�����';
comment on column LDCUSTOMER.FULLNAMECHINESE
  is '������';
comment on column LDCUSTOMER.NATIONALITY
  is '����';
comment on column LDCUSTOMER.DATEOFBIRTH
  is '��������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table LDCUSTOMER
  add constraint CIFID primary key (CIFID)
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
