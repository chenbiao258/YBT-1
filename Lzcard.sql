prompt Importing table Lzcard...
set feedback off
set define off
insert into Lzcard (ID, AGENTCOM, MANAGECOM, CERTIFYTYPE, CERTIFYCODE, CERTIFYSTATUS, CERTIFYSTART, CERTIFYEND, OPERATOR, WAITSTATUS, MODIFYSTATUS, CERTIFYNO, CERTIFYNUM, MAKEDATE, MAKETIME, MODIFYDATE, MODIFYTIME, BAK1, BAK2, BAK3, BAK4, BAK5, CERTIFYSTATUSFLAG, CITY, CHECKOPERATOR)
values ('10121', 'MELI', null, '1', null, '1', '1', '999', 'admin', 'Y', 'Y', '1', '999', to_date('31-10-2017', 'dd-mm-yyyy'), '15:56:19', null, null, null, null, null, null, null, '1', null, 'admin');

prompt Done.
