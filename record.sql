drop table recordall;
  
--���¼�¼�� ��¼�ļ��ϴ�ʧ�ܻ�ɹ���������
create table recordall(
  transno varchar2(120),--������ˮ��
  fileid varchar2(100),--�ļ�id
  filetype varchar2(100),--���ݿ����
  counts varchar2(22),--�ļ�������
  loser varchar2(22),--ʧ������
  succeed varchar2(22),--�ɹ�������
  operator varchar2(30),--����Ա
  makedate date,--��������
  maketime varchar2(22)--����ʱ��
  );
  
  
  
drop sequence seq_detailall;
create sequence seq_detailall;

drop table detailall;

--������ϸ��--ÿ�����ݵ�״̬�ɹ���ʧ��
create table detailall(
  transno varchar2(120),--������ˮ��--���ڼ����к�
  staffid varchar2(8),
  flag varchar2(5),--״̬
  descs varchar2(200),--ԭ��
  fileid varchar2(100),--�ļ�id
  operator varchar2(30),--����Ա
  makedate date,--��������
  maketime varchar2(22)--����ʱ��
  );
