-------------------------------------------------
-- Export file for user YBT                    --
-- Created by suojinyu on 2017/10/15, 17:22:00 --
-------------------------------------------------

set define off
spool sequence.log

prompt
prompt Creating sequence APPNTNO
prompt =========================
prompt
create sequence YBT.APPNTNO
minvalue 1
maxvalue 99999999999999
start with 50
increment by 1
cache 20
order;

prompt
prompt Creating sequence BANKID_SEQ
prompt ============================
prompt
create sequence YBT.BANKID_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 130
increment by 1
cache 20
order;

prompt
prompt Creating sequence DOC_ID_SEQ
prompt ============================
prompt
create sequence YBT.DOC_ID_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 41
increment by 1
cache 20
order;

prompt
prompt Creating sequence INSUREDNO
prompt ===========================
prompt
create sequence YBT.INSUREDNO
minvalue 1
maxvalue 999999999999999
start with 49
increment by 1
cache 20
order;

prompt
prompt Creating sequence LZCARDA_SEQUENCE
prompt ==================================
prompt
create sequence YBT.LZCARDA_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 10120
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_CUSTOMER
prompt ==============================
prompt
create sequence YBT.SEQ_CUSTOMER
minvalue 1
maxvalue 99999999
start with 154
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_DETAILALL
prompt ===============================
prompt
create sequence YBT.SEQ_DETAILALL
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_ID
prompt ========================
prompt
create sequence YBT.SEQ_ID
minvalue 1
maxvalue 9999999999999
start with 71
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_LATRAINING
prompt ================================
prompt
create sequence YBT.SEQ_LATRAINING
minvalue 1
maxvalue 9999999999999999999999999999
start with 381
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_LDCOMCOMCODE
prompt ==================================
prompt
create sequence YBT.SEQ_LDCOMCOMCODE
minvalue 1
maxvalue 9999999999999999999999999999
start with 520
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_LDCUSTOMERNO
prompt ==================================
prompt
create sequence YBT.SEQ_LDCUSTOMERNO
minvalue 1
maxvalue 999999
start with 154
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_LDMENUGRPA
prompt ================================
prompt
create sequence YBT.SEQ_LDMENUGRPA
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SERNO
prompt ===========================
prompt
create sequence YBT.SEQ_SERNO
minvalue 1
maxvalue 99999999999
start with 2
increment by 1
cache 20
order;

prompt
prompt Creating sequence SEQ_TRACERT
prompt =============================
prompt
create sequence YBT.SEQ_TRACERT
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SQE_ACCOUNT
prompt =============================
prompt
create sequence YBT.SQE_ACCOUNT
minvalue 1
maxvalue 999999
start with 394
increment by 1
cache 20
order;


spool off
