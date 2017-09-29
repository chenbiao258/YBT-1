prompt PL/SQL Developer import file
prompt Created on 2017年9月29日 by suojinyu
set feedback off
set define off
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
;
alter table MENU
  add primary key (ID);

prompt Deleting MENU...
delete from MENU;
commit;
prompt Loading MENU...
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4916c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '产品销售网点信息查询授权', '9', null, '/application/newBankInstitutionManage/authorizationInformationSelect/jsp/GrantInfoSelect.jsp', 0, null, 3, '保险产品管理', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d573f5-67213c8f0e8758438d7a34e7819a8b34', null, '用户查询', '3', null, '/application/newSystemManage/userManage/jsp/UserAddInputCheck.jsp', 0, null, 2, '用户管理', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('14-09-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4926c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '产品销售网点授权审批', '8', null, '/application/newBankInstitutionManage/productBranchAuthorizationCheck/jsp/ProductAuthorizationCheck.jsp', 0, null, 3, '保险产品管理', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4936c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '产品销售网点授权', '7', null, '/application/newBankInstitutionManage/productBranchAuthorization/jsp/ProductAuthorization.jsp', 0, null, 3, '保险产品管理', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4946c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '产品销售资质查询', '6', null, '/application/laprodquali/newLaprodquali/jsp/laprodquali.jsp', 0, null, 3, '保险产品管理', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4988c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '产品销售资质新增', '5', null, '/application/laprodquali/newLaprodquali/jsp/laprodqualiAdd.jsp', 0, null, 3, '保险产品管理', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d873f5-49213c8f0e8758438d7a69e2789a987d', null, '投保单查询', '2', null, '/application/newTestingCenter/newCont/jsp/newPolicyQuery.jsp', 0, null, 1, '投保业务', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('20-09-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d773f5-49213c8f0e8758438d7a69e2789a987d', null, '投保单录入', '1', null, '/application/newTestingCenter/newCont/jsp/newContApply.jsp', 0, null, 1, '投保业务', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('20-09-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d573f5-67213c8f0e8358438d7a34e7889a8b34', null, '用户上传', '1', null, '/application/newSystemManage/userManage/jsp/userUpload.jsp', 0, null, 2, '用户管理', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d573f5-67213c8f0e8758438d4a34e7889a8b34', null, '用户新增', '2', null, '/application/newSystemManage/userManage/jsp/userAdd.jsp', 0, null, 2, '用户管理', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15c46d573f5-67213c8f0e8758438d7a34e7889a8b34', null, 'RM资质查询', '4', null, '/application/customermanager/newCustomermanager/jsp/select.jsp', 0, null, 3, 'RM资质管理模块', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d523f5-67213c8f0e8758438d7a34e7889a8b34', null, 'RM资质上传', '3', null, '/application/customermanager/newCustomermanager/jsp/DocUploadDownloadManage.jsp', 0, null, 3, 'RM资质管理模块', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5986c47-15d46d573f5-67213c8f0e8758438d7a34e7889a8b34', null, '证书类型维护', '2', null, '/application/aptitude/newAptitude/jsp/add.jsp', 0, null, 5, '资质数据维护', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('6986c47-15d46d573f5-67213c8f0e8758438d7a34e7889a8b34', null, '课程类型维护', '3', null, '/application/aptitude/newAptitude/jsp/addCounse.jsp', 0, null, 5, '资质数据维护', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('21-09-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('7986c47-15d46d573f5-67213c8f0e8758438d7a34e7889a8b34', null, '查询', '4', null, '/application/aptitude/newAptitude/jsp/MyJsp.jsp', 0, null, 5, '资质数据维护', to_date('21-09-2017', 'dd-mm-yyyy'), to_date('20-09-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758438d7a69e2789a8b34', null, '银行机构新增', '1', null, '/application/newBankInstitutionManage/bankInstitutionAdd/jsp/Bankadd.jsp', 0, null, 1, '银行机构管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758438d7a69e2789a8b13', null, '银行机构修改', '3', null, '/application/newBankInstitutionManage/bankInstitutionModify/jsp/BankModify.jsp', 0, null, 1, '银行机构管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758438d7a69e2789a567d', null, '银行机构查询', '4', null, '/application/newBankInstitutionManage/bankInstitutionSelect/jsp/Bankselect.jsp', 0, null, 1, '银行机构管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758476d7a69e2789a8b34', null, '单证号段新增', '1', null, '/application/newCertifySectionManage/certifySectionAdd/jsp/CertifySectionAdd.jsp', 0, null, 4, '单证号段管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758453d7a69e2789a8b34', null, '单证号段审核', '2', null, '/application/newCertifySectionManage/certifySectionCheck/jsp/CertifySectionCheckSelect.jsp', 0, null, 4, '单证号段管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758424d7a69e2789a8b34', null, '单证号段修改', '3', null, '/application/newCertifySectionManage/certifySectionModify/jsp/CertifySectionModifySelect.jsp', 0, null, 4, '单证号段管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758497d7a69e2789a8b34', null, '单证号段查询', '4', null, '/application/newCertifySectionManage/certifySectionSelect/jsp/CertifySectionSelect.jsp', 0, null, 4, '单证号段管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49256c8f0e8758438d7a69e278945b34', null, '保险产品新增', '1', null, '/application/insuranceproducts/newinsuranceproducts/jsp/add.jsp', 0, null, 3, '保险产品管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49278c8f0e8758438d7a6967789a8b34', null, '保险产品审核', '2', null, '/application/insuranceproducts/newinsuranceproducts/jsp/sh.jsp', 0, null, 3, '保险产品管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49232c8f0e8758438d7a98e2789a8b34', null, '保险产品修改', '3', null, '/application/insuranceproducts/newinsuranceproducts/jsp/update.jsp', 0, null, 3, '保险产品管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49214c8f0e8758438d7a34e2789a8b34', null, '保险产品查询', '4', null, '/application/insuranceproducts/newinsuranceproducts/jsp/select.jsp', 0, null, 3, '保险产品管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-56d54d573f5-49213c8f0e8758438d7a34e1289a8b34', null, '保险公司新增', '1', null, '/application/insurance/newinsurance/jsp/companyadd.jsp', 0, null, 2, '保险公司管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-97d54d573f5-49213c8f0e8758438d7a34e3489a8b34', null, '保险公司审核', '2', null, '/application/insurance/newinsurance/jsp/companysh.jsp', 0, null, 2, '保险公司管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d12d573f5-49213c8f0e8758438d7a34e5689a8b34', null, '保险公司修改', '3', null, '/application/insurance/newinsurance/jsp/companyupdate.jsp', 0, null, 2, '保险公司管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758438d7a34e7889a8b34', null, '保险公司查询', '4', null, '/application/insurance/newinsurance/jsp/insuQuery.jsp', 0, null, 2, '保险公司管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d573f5-67213c8f0e8758438d7a34e7889a8b34', null, 'RM外部证书新增', '1', null, '/application/customermanager/newCustomermanager/jsp/externalAdd.jsp', 0, null, 3, 'RM资质管理模块', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d46d573f5-49213c8f0e8758438d7a34e7889a8b34', null, 'RM销售资格查询', '1', null, '/application/customermanager/newCustomermanager/jsp/sale.jsp', 0, null, 6, 'RM销售资格查询', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d89d573f5-49213c8f0e8758438d7a34e7889a8b34', null, '资质类型新增', '1', null, '/application/laqualiinfo/newlaqualiinfo/jsp/laqualiinfoAdd.jsp', 0, null, 4, '资质类型管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-22d54d573f5-49213c8f0e8758438d7a34e7889a8b34', null, '资质类型查询', '2', null, '/application/laqualiinfo/newlaqualiinfo/jsp/laqualiinfo.jsp', 0, null, 4, '资质类型管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('3386c47-15d54d573f5-49213c8f0e8758438d7a34e7889a8b34', null, '资质类型维护', '1', null, '/application/aptitude/newAptitude/jsp/addType.jsp', 0, null, 5, '资质数据维护', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a66633c-04fde300662ea89f4870c7447dbb1345', '0', 'Holiday日期设置', '1', '1', '/application/holiday/newHoliday/jsp/holidayUpload.jsp', 0, null, 1, 'Holiday管理', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '系统管理', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a76633c-04fde300662ea89f4870c7447dbb1345', '0', 'Holiday日期设置审批', '2', '1', '/application/holiday/newHoliday/jsp/holidayCheck.jsp', 0, null, 1, 'Holiday管理', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '系统管理', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a89633c-04fde300662ea89f4870c7447dbb1345', '0', 'Holiday日期修改', '3', '1', '/application/holiday/newHoliday/jsp/holidayModify.jsp', 0, null, 1, 'Holiday管理', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '系统管理', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a32633c-04fde300662ea89f4870c7447dbb1345', '0', '权限查询', '1', '1', '/application/menumang/newMenuMang/jsp/menuGrpSee.jsp', 0, null, 2, '权限管理', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '系统管理', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a12633c-04fde300662ea89f4870c7447dbb1345', '0', '权限审核', '2', '1', '/application/menumang/newMenuMang/jsp/menuGrpCheck.jsp', 0, null, 2, '权限管理', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '系统管理', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a33633c-04fde300662ea89f4870c7447dbb1345', '0', '轨迹日志查询', '1', '1', '/application/menumang/newMenuMang/jsp/menuGrpCheck.jsp', 0, null, 3, '轨迹日志管理', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '系统管理', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('5f0ee5b8-15b7a77633c-04fde300662ea89f4870c7447dbb1345', '0', '菜单功能查询', '1', '1', '/application/newSystemManage/menuManage/jsp/menuManage.jsp', 0, null, 4, '菜单功能管理', to_date('12-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '系统管理', 3);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('4986c47-15d54d573f5-49213c8f0e8758438d7a69e2789a8b56', null, '银行机构审核', '2', null, '/application/newBankInstitutionManage/bankInstitutionCheck/jsp/BankCheck.jsp', 0, null, 1, '银行机构管理', to_date('15-01-2017', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), '人员管理', 2);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('7aec8a9-15ea9375da8-1d76e73bcd3d0dae045c248a02a188e4', null, '投保单上传', '1', null, '/application/newContImageUpload/jsp/contImageUpload.jsp', 0, null, 5, '投保单上传', to_date('22-01-2017', 'dd-mm-yyyy'), to_date('22-01-2017', 'dd-mm-yyyy'), '银保业务', 1);
insert into MENU (id, par_uid, menu_name, menu_desc, menu_status, menu_link, menu_index, t_s_uid, meddle_menu, meddle_menu_name, crt_time, upd_time, sub_menu_name, sub_menu)
values ('2b9f5491-15ea9797bc6-1d76e73bcd3d0dae045c248a02a188e4', null, 'RM内部资质新增', '2', null, '/application/customermanager/newCustomermanager/jsp/innerAdd.jsp', 0, null, 3, 'RM资质管理模块', to_date('22-01-2017', 'dd-mm-yyyy'), to_date('22-01-2017', 'dd-mm-yyyy'), '人员管理', 2);
commit;
prompt 45 records loaded
set feedback on
set define on
prompt Done.
