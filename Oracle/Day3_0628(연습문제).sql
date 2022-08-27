CREATE TABLE students0(
num char(7) PRIMARY KEY,
name nvarchar2(20) NOT NULL,
age number(3) CHECK (age BETWEEN 10 AND 30),
 address nvarchar2(50)
);

INSERT INTO students0(num,name,age,address)
VALUES ('2021001','����',16,'���ʱ�');
INSERT INTO students0(num,name,age,address)
VALUES ('2019019','������',18,'������');

CREATE TABLE scores0(
   num char(7) NOT NULL,
   subject nvarchar2(20) NOT NULL,
   score number(3) NOT NULL,   -- ����
   teacher nvarchar2(20) NOT NULL,
   semester char(7) NOT NULL,   -- �б�
   PRIMARY KEY (num,subject),	--�⺻Ű ����(not null + unique)
   FOREIGN KEY (num) REFERENCES students0(num) 
   --�ܷ�Ű���� REFERENCES(����) Ű���� �ڿ� �������̺�(�����÷�)
   --			�ܷ�Ű �÷��� �����÷� ��� stuno �� ������ (�����÷�) ��������.
   --�ܷ�Ű �÷��� FOREIGN KEY Ű���� �ڿ� () �ȿ� �ۼ�.
   --�����÷��� ������? �⺻Ű �Ǵ� unique �������� �÷��� �ȴ�.
);

--alter table ~ add constraint
ALTER TABLE SCORES0
	ADD CONSTRAINT pk_jumsu PRIMARY KEY (stuno,subject);
ALTER TABLE SCORES0 
	ADD CONSTRAINT fk_jumsu FOREIGN KEY (stuno)
	REFERENCES students0(stuno);

INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2021001','����',89,'�̳���','2022_1');
INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2021001','����',78,'��浿','2022_1');
INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2021001','����',67,'�ڼ���','2021_2');
INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2019019','����',92,'�̳���','2019_2');
INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2019019','����',85,'������','2019_2');
INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2019019','����',88,'�ڼ���','2020_1');
