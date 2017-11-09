drop table recordall;
  
--更新记录表 记录文件上传失败或成功的总数量
create table recordall(
  transno varchar2(120),--交易流水号
  fileid varchar2(100),--文件id
  filetype varchar2(100),--数据库表名
  counts varchar2(22),--文件总条数
  loser varchar2(22),--失败条数
  succeed varchar2(22),--成功的条数
  operator varchar2(30),--操作员
  makedate date,--创建日期
  maketime varchar2(22)--创建时间
  );
  
  
  
drop sequence seq_detailall;
create sequence seq_detailall;

drop table detailall;

--更新明细表--每条数据的状态成功或失败
create table detailall(
  transno varchar2(120),--交易流水号--日期加序列号
  staffid varchar2(8),
  flag varchar2(5),--状态
  descs varchar2(200),--原因
  fileid varchar2(100),--文件id
  operator varchar2(30),--操作员
  makedate date,--创建日期
  maketime varchar2(22)--创建时间
  );
