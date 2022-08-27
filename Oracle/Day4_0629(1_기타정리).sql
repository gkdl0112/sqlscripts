-- DDL : create, alter, drop, truncate(����� user, table, sequence,  view, ... �� truncate�� ���̺�)
-- DML : insert, update, delete

-- drop table students0 ; --���� : student0 ���̺� ���� �����ϸ�
						 --���� : �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�.

-- UPDATE ���̺�� SET �÷��� = ��,�÷��� = ��,�÷��� = ��,....WHERE �����÷� �����
-- DELETE FROM ���̺�� WHERE �����÷������
-- ���� ���� : update�� delete �� where ���� ����ϴ� ���� ������ ����.
--				truncate�� ������ ���(rollback)�Ҽ� ���� ������ DDL�� ���Ѵ�.
SELECT * FROM STUDENTS0 ;
-- update, delete, select ���� where �� �÷��� �⺻Ű �÷��̸� ����Ǵ� ��� �ݿ��Ǵ� ���� �ִ� 1��
-- �⺻Ű�� ������ ���̺��� ��������� ����(�ĺ�)
UPDATE STUDENTS0 SET AGE = 17 WHERE NUM = 2021001;

--rollback, commit �׽�Ʈ (�����ͺ��̽� �޴����� Ʈ����� ��带 manual�� �����Ѵ�.)
UPDATE STUDENTS0 SET ADDRESS = '���ϱ�', AGE = 16 WHERE NUM = 2021001;
ROLLBACK; -- ���� UPDATE ������ ���

UPDATE STUDENTS0 SET ADDRESS = '���ϱ�', AGE = 16 WHERE NUM = 2021001;
COMMIT;
ROLLBACK;	--�̹� COMMIT �� �� ��ɾ�� ROLLBACK ����.
----------------------------���� ���� ù��° ���� . Ʈ����� ������� : rollback, commit
DELETE FROM SCORES0 ;
ROLLBACK;
DELETE FROM SCORES0 WHERE NUM = 2019019;
ROLLBACK;
SELECT * FROM STUDENTS0 ;
SELECT * FROM SCORES0 ;
--�� ������� Ʈ����� ���� ����̹Ƿ� select ����� 2019019�� ����.
--�ٸ� ������� �ٸ� Ŭ���̾�Ʈ �̹Ƿ� ���� ����(���� Ŀ���� ����)�� ��������.
ROLLBACK;
SELECT * FROM SCORES0 ;

---------------------------------------------------- ������� �ι�° ����
TRUNCATE TABLE SCORES0 ;	-- ��� �����͸� �����. ROLLBACK ���� Ȯ�� ?
						 	-- �� : ROLLBACK �Ұ���.
-- ��� �����͸� ������� Ȯ���ϴٸ� �ٸ��͵�� ������ �ѹ���� �ʰ� Ȯ���ϰ� TRUNCATE �ض�.
--------------------------------
/*
 * 	INSERT
 * 	DELETE
 * 	COMMIT;		(1) ���� 41,42
 * 	UPDATE
 * 	DELETE;
 * 	ROLLBACK;	(2) ���� 44,45
 * 	INSERT;
 * 	INSERT;
 * 	ROLLBACK;	(3) ���� 47,48
 * 	INSERT
 * 	UPDATE;
 * 	COMMIT;		(4) ���� 50,51
 * 
 */
