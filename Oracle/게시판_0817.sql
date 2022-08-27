--���α� ���̺�
CREATE TABLE freeboard(
	idx number(5) NOT NULL,
	writer varchar2(30) NOT NULL,		-- �ۼ���
	password varchar2(10) NOT NULL,		-- �ۺ�й�ȣ
	subject varchar2(40) NOT NULL,		-- ������
	content varchar2(2000) NOT NULL,	-- ��ȸ��
	readCount number(5) DEFAULT '0',	-- �ۼ���¥�� �ð� �⺻��
	wdate DATE DEFAULT sysdate,			-- ����
	ip varchar2(15) DEFAULT '127.0.0.1',-- ��� ����
	commentCount number(3) DEFAULT '0',
	PRIMARY KEY(idx)
	);

CREATE SEQUENCE board_idx_seq;

-- ������ ���� �߰�
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '����','1111','�˸��ϴ�.','���� ���� ����ȳ��Դϴ�.');
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '�ֻ糪','2222','����','��������');
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '�ڼ���','1234','����','��������!!');
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '�趯��','1111','�̺�Ʈ','�̺�Ʈ �ȳ��Դϴ�.');
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '������','2222','�����','����������');
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '�̻糪','1234','��ȸ�� ����','��ȸ�� �ȳ��Դϴ�.');



CREATE TABLE COMMENTS (
	IDX NUMBER(3) NOT NULL,		-- ��� ���̺��� �⺻Ű
	MREF NUMBER(5) NOT NULL,		-- FREEBOARD ���̺��� IDX
	WRITER VARCHAR2(30) NOT NULL,		-- �̸���, �Ǹ�, �г���, ...
	CONTENT VARCHAR2(2000) NOT NULL,
	WDATE DATE DEFAULT SYSDATE,
	IP VARCHAR2(15) DEFAULT '127.0.0.1',
	HEART NUMBER(3) DEFAULT '0',		-- ���ƿ� ����
	PRIMARY KEY (IDX)
);

CREATE SEQUENCE cmt_idx_seq;

INSERT INTO COMMENTS (idx,mref,writer,content)
VALUES (cmt_idx_seq.nextval,300,'���ϴ�','�̱��� ���α� 300�� ���~');
INSERT INTO COMMENTS (idx,mref,writer,content)
VALUES (cmt_idx_seq.nextval,300,'�趯��','�̱��� ���α� 300�� ���~2');
INSERT INTO COMMENTS (idx,mref,writer,content)
VALUES (cmt_idx_seq.nextval,333,'���ϴ�','�̱��� ���α� 333�� ���~');
INSERT INTO COMMENTS (idx,mref,writer,content)
VALUES (cmt_idx_seq.nextval,333,'�趯��','�̱��� ���α� 333�� ���2~');
INSERT INTO COMMENTS (idx,mref,writer,content)
VALUES (cmt_idx_seq.nextval,333,'�趯��','����!!����~~');

--���α� idx�� ��� ����

SELECT count(*) FROM COMMENTS  WHERE mref=333;

UPDATE FREEBOARD 
SET COMMENTCOUNT = (SELECT count (*) FROM COMMENTS  WHERE mref=300)
WHERE IDX =300;

SELECT * FROM FREEBOARD f WHERE IDX =300;

-- ���� ���ε� ���� ���̺�
CREATE TABLE gallery(
idx number(5) NOT NULL,
title varchar2(40),
wdate DATE DEFAULT sysdate,
filenames varchar2(200),
PRIMARY KEY (idx)
);

CREATE SEQUENCE gal_idx_seq;

CREATE TABLE application( 
idx number(5) NOT NULL, 
title varchar2(40), 
wdate DATE DEFAULT sysdate,
filenames varchar2(200), --���ε� �� ���ϸ� ���� �÷� 
PRIMARY KEY(idx) );

CREATE SEQUENCE app_idx_seq;




