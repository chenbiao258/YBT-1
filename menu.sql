prompt PL/SQL Developer import file
prompt Created on 2017��10��15�� by suojinyu
set feedback off
set define off
prompt Dropping MENU...
drop table MENU cascade constraints;
prompt Creating MENU...
create table MENU
(
  id               VARCHAR2(64) not null,
  par_uid          VARCHAR2(64),
  menu_name        VARCHAR2(40),
  menu_desc        VARCHAR2(100),
  menu_status      CHAR(1),
  menu_link        VARCHAR2(200),
  menu_index       NUMBER,
  t_s_uid          VARCHAR2(64),
  meddle_menu      NUMBER,
  meddle_menu_name VARCHAR2(64),
  crt_time         DATE,
  upd_time         DATE,
  sub_menu_name    VARCHAR2(64),
  sub_menu         NUMBER
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
alter table MENU
  add primary key (ID)
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

prompt Disabling triggers for MENU...
alter table MENU disable all triggers;
prompt Loading MENU...
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a12633c-04fde300662ea89f4840c7447dbb1345', '0', '�û���Ȩ', '4', '1', '/application/menumang/newMenuMang/jsp/menuauto.jsp', 0, null, 0, 'Ȩ�޹���', to_date('15-10-2017', 'dd-mm-yyyy'), to_date('15-10-2017', 'dd-mm-yyyy'), 'ϵͳ����', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a66633c-04fde300662ea89f4870c7447dbb1345', '0', 'Holiday��������', '1', '1', '/application/holiday/newHoliday/jsp/holidayUpload.jsp', 0, null, 1, 'Holiday����', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), 'ϵͳ����', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a76633c-04fde300662ea89f4870c7447dbb1345', '0', 'Holiday������������', '2', '1', '/application/holiday/newHoliday/jsp/holidayCheck.jsp', 0, null, 1, 'Holiday����', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), 'ϵͳ����', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a89633c-04fde300662ea89f4870c7447dbb1345', '0', 'Holiday�����޸�', '3', '1', '/application/holiday/newHoliday/jsp/holidayModify.jsp', 0, null, 1, 'Holiday����', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), 'ϵͳ����', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a32633c-04fde300662ea89f4870c7447dbb1345', '0', '�û�Ȩ�޲�ѯ', '1', '1', '/application/menumang/newMenuMang/jsp/menuGrpSee.jsp', 0, null, 0, 'Ȩ�޹���', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), 'ϵͳ����', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a12633c-04fde300662ea89f4870c7447dbb1345', '0', 'Ȩ�޹���', '2', '1', '/application/menumang/newMenuMang/jsp/menuGrpCheck.jsp', 0, null, 0, 'Ȩ�޹���', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), 'ϵͳ����', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a33633c-04fde300662ea89f4870c7447dbb1345', '0', '�켣��־��ѯ', '1', '1', '/application/menumang/newMenuMang/jsp/menuGrpCheck.jsp', 0, null, 3, '�켣��־����', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), 'ϵͳ����', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a77633c-04fde300662ea89f4870c7447dbb1345', '0', '�˵����ܲ�ѯ', '1', '1', '/application/newSystemManage/menuManage/jsp/menuManage.jsp', 0, null, 4, '�˵����ܹ���', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), 'ϵͳ����', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758438d7a69e2789a8b56', null, '���л������', '2', null, '/application/newBankInstitutionManage/bankInstitutionCheck/jsp/BankCheck.jsp', 0, null, 1, '���л�������', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('7aec8a9-15ea9375da8-1d76e73bcd3d0dae045c248a02a188e4', null, 'Ͷ�����ϴ�', '1', null, '/application/newContImageUpload/jsp/contImageUpload.jsp', 0, null, 5, 'Ͷ�����ϴ�', to_date('22-01-2017', 'dd-mm-yyyy'), to_date('22-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('2b9f5491-15ea9797bc6-1d76e73bcd3d0dae045c248a02a188e4', null, 'RM�ڲ���������', '2', null, '/application/customermanager/newCustomermanager/jsp/innerAdd.jsp', 0, null, 3, 'RM���ʹ���ģ��', to_date('22-01-2017', 'dd-mm-yyyy'), to_date('22-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('f9ebcd-15ec708286a-068fa46f1dc11d0c2b400336e03d31ce', null, '��Ӳ�Ʒ ', '2', null, '/application/laprodquali/newLaprodquali/jsp/laprodqualiAdd.jsp', 0, null, 7, '��Ʒ����ģ��', to_date('28-01-2017', 'dd-mm-yyyy'), to_date('28-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('f9ebcd-15ec708d992-068fa46f1dc11d0c2b400336e03d31ce', null, '��Ʒ����', '1', null, '/application/laprodquali/newLaprodquali/jsp/laprodquali.jsp', 0, null, 7, '��Ʒ����ģ��', to_date('28-01-2017', 'dd-mm-yyyy'), to_date('28-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('f9ebcd-15ec709f67a-068fa46f1dc11d0c2b400336e03d31ce', '0', 'Ȩ������', '3', '1', '/application/menumang/newMenuMang/jsp/menuGrp.jsp', 0, null, 0, 'Ȩ�޹���', to_date('28-01-2017', 'dd-mm-yyyy'), to_date('28-01-2017', 'dd-mm-yyyy'), 'ϵͳ����', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4916c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '��Ʒ����������Ϣ��ѯ��Ȩ', '9', null, '/application/newBankInstitutionManage/authorizationInformationSelect/jsp/GrantInfoSelect.jsp', 0, null, 3, '���ղ�Ʒ����', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d573f5-67213c8f0e8758438d7a34e7819a8b34', null, '�û���ѯ', '3', null, '/application/newSystemManage/userManage/jsp/UserAddInputCheck.jsp', 0, null, 2, '�û�����', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('14-09-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4926c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '��Ʒ����������Ȩ����', '8', null, '/application/newBankInstitutionManage/productBranchAuthorizationCheck/jsp/ProductAuthorizationCheck.jsp', 0, null, 3, '���ղ�Ʒ����', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4936c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '��Ʒ����������Ȩ', '7', null, '/application/newBankInstitutionManage/productBranchAuthorization/jsp/ProductAuthorization.jsp', 0, null, 3, '���ղ�Ʒ����', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4946c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '��Ʒ�������ʲ�ѯ', '6', null, '/application/laprodquali/newLaprodquali/jsp/laprodquali.jsp', 0, null, 3, '���ղ�Ʒ����', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4988c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '��Ʒ������������', '5', null, '/application/laprodquali/newLaprodquali/jsp/laprodqualiAdd.jsp', 0, null, 3, '���ղ�Ʒ����', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d873f5-49213c8f0e8758438d7a69e2789a987d', null, 'Ͷ������ѯ', '2', null, '/application/newTestingCenter/newCont/jsp/newPolicyQuery.jsp', 0, null, 1, 'Ͷ��ҵ��', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('20-09-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d773f5-49213c8f0e8758438d7a69e2789a987d', null, 'Ͷ����¼��', '1', null, '/application/newTestingCenter/newCont/jsp/newContApply.jsp', 0, null, 1, 'Ͷ��ҵ��', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('20-09-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d573f5-67213c8f0e8358438d7a34e7889a8b34', null, '�û��ϴ�', '1', null, '/application/newSystemManage/userManage/jsp/userUpload.jsp', 0, null, 2, '�û�����', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d573f5-67213c8f0e8758438d4a34e7889a8b34', null, '�û�����', '2', null, '/application/newSystemManage/userManage/jsp/userAdd.jsp', 0, null, 2, '�û�����', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15c46d573f5-67213c8f0e8758438d7a34e7889a8b34', null, 'RM���ʲ�ѯ', '4', null, '/application/customermanager/newCustomermanager/jsp/select.jsp', 0, null, 3, 'RM���ʹ���ģ��', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d523f5-67213c8f0e8758438d7a34e7889a8b34', null, 'RM�����ϴ�', '3', null, '/application/customermanager/newCustomermanager/jsp/DocUploadDownloadManage.jsp', 0, null, 3, 'RM���ʹ���ģ��', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5986c47-15d46d573f5-67213c8f0e8758438d7a34e7889a8b34', null, '֤������ά��', '2', null, '/application/aptitude/newAptitude/jsp/add.jsp', 0, null, 5, '��������ά��', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('6986c47-15d46d573f5-67213c8f0e8758438d7a34e7889a8b34', null, '�γ�����ά��', '3', null, '/application/aptitude/newAptitude/jsp/addCounse.jsp', 0, null, 5, '��������ά��', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('7986c47-15d46d573f5-67213c8f0e8758438d7a34e7889a8b34', null, '��ѯ', '4', null, '/application/aptitude/newAptitude/jsp/MyJsp.jsp', 0, null, 5, '��������ά��', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('20-09-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758438d7a69e2789a8b34', null, '���л�������', '1', null, '/application/newBankInstitutionManage/bankInstitutionAdd/jsp/Bankadd.jsp', 0, null, 1, '���л�������', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758438d7a69e2789a8b13', null, '���л����޸�', '3', null, '/application/newBankInstitutionManage/bankInstitutionModify/jsp/BankModify.jsp', 0, null, 1, '���л�������', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758438d7a69e2789a567d', null, '���л�����ѯ', '4', null, '/application/newBankInstitutionManage/bankInstitutionSelect/jsp/Bankselect.jsp', 0, null, 1, '���л�������', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758476d7a69e2789a8b34', null, '��֤�Ŷ�����', '1', null, '/application/newCertifySectionManage/certifySectionAdd/jsp/CertifySectionAdd.jsp', 0, null, 4, '��֤�Ŷι���', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758453d7a69e2789a8b34', null, '��֤�Ŷ����', '2', null, '/application/newCertifySectionManage/certifySectionCheck/jsp/CertifySectionCheckSelect.jsp', 0, null, 4, '��֤�Ŷι���', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758424d7a69e2789a8b34', null, '��֤�Ŷ��޸�', '3', null, '/application/newCertifySectionManage/certifySectionModify/jsp/CertifySectionModifySelect.jsp', 0, null, 4, '��֤�Ŷι���', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758497d7a69e2789a8b34', null, '��֤�Ŷβ�ѯ', '4', null, '/application/newCertifySectionManage/certifySectionSelect/jsp/CertifySectionSelect.jsp', 0, null, 4, '��֤�Ŷι���', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49256c8f0e8758438d7a69e278945b34', null, '���ղ�Ʒ����', '1', null, '/application/insuranceproducts/newinsuranceproducts/jsp/add.jsp', 0, null, 3, '���ղ�Ʒ����', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49278c8f0e8758438d7a6967789a8b34', null, '���ղ�Ʒ���', '2', null, '/application/insuranceproducts/newinsuranceproducts/jsp/sh.jsp', 0, null, 3, '���ղ�Ʒ����', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49232c8f0e8758438d7a98e2789a8b34', null, '���ղ�Ʒ�޸�', '3', null, '/application/insuranceproducts/newinsuranceproducts/jsp/update.jsp', 0, null, 3, '���ղ�Ʒ����', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '���ղ�Ʒ��ѯ', '4', null, '/application/insuranceproducts/newinsuranceproducts/jsp/select.jsp', 0, null, 3, '���ղ�Ʒ����', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-56d54d573f5-49213c8f0e8758438d7a34e1289a8b34', null, '���չ�˾����', '1', null, '/application/insurance/newinsurance/jsp/companyadd.jsp', 0, null, 2, '���չ�˾����', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-97d54d573f5-49213c8f0e8758438d7a34e3489a8b34', null, '���չ�˾���', '2', null, '/application/insurance/newinsurance/jsp/companysh.jsp', 0, null, 2, '���չ�˾����', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d12d573f5-49213c8f0e8758438d7a34e5689a8b34', null, '���չ�˾�޸�', '3', null, '/application/insurance/newinsurance/jsp/companyupdate.jsp', 0, null, 2, '���չ�˾����', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758438d7a34e7889a8b34', null, '���չ�˾��ѯ', '4', null, '/application/insurance/newinsurance/jsp/insuQuery.jsp', 0, null, 2, '���չ�˾����', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '����ҵ��', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d573f5-67213c8f0e8758438d7a34e7889a8b34', null, 'RM�ⲿ֤������', '1', null, '/application/customermanager/newCustomermanager/jsp/externalAdd.jsp', 0, null, 3, 'RM���ʹ���ģ��', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d573f5-49213c8f0e8758438d7a34e7889a8b34', null, 'RM�����ʸ��ѯ', '1', null, '/application/customermanager/newCustomermanager/jsp/sale.jsp', 0, null, 6, 'RM�����ʸ��ѯ', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d89d573f5-49213c8f0e8758438d7a34e7889a8b34', null, '������������', '1', null, '/application/laqualiinfo/newlaqualiinfo/jsp/laqualiinfoAdd.jsp', 0, null, 4, '�������͹���', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-22d54d573f5-49213c8f0e8758438d7a34e7889a8b34', null, '�������Ͳ�ѯ', '2', null, '/application/laqualiinfo/newlaqualiinfo/jsp/laqualiinfo.jsp', 0, null, 4, '�������͹���', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('3386c47-15d54d573f5-49213c8f0e8758438d7a34e7889a8b34', null, '��������ά��', '1', null, '/application/aptitude/newAptitude/jsp/addType.jsp', 0, null, 5, '��������ά��', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '��Ա����', 2);
commit;
prompt 49 records loaded
prompt Enabling triggers for MENU...
alter table MENU enable all triggers;
set feedback on
set define on
prompt Done.
