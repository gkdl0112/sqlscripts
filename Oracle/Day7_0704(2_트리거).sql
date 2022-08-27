-- �����ͺ��̽� Ʈ���� : insert, update, delete �� �� �ڵ����� �����ϴ� ���ν���
-- 		Ư�� ���̺� �����ִ� ��ü

CREATE OR REPLACE TRIGGER secure_custom
BEFORE UPDATE OR DELETE ON tbl_custom		-- Ʈ���� �����ϴ� ���̺�, SQL�� ����
BEGIN 
 	IF to_char(sysdate, 'HH24:MI') BETWEEN '13:00' AND '15:00' THEN 
 		raise_application_error(-20000,'���� ���� 1��~3�ô� �۾��Ҽ� �����ϴ�.');
 	END IF;
END;
-- Ʈ���� ���� �׽�Ʈ
DELETE FROM TBL_CUSTOM WHERE CUSTOM_ID = 'momo';

-- Ʈ���� ��Ȱ��ȭ
ALTER TRIGGER secure_custom disable;	--enable

-- Ʈ���ſ� �ʿ��� ���̺� ������ ����.
CREATE TABLE tbl_temp
AS
SELECT * FROM tbl_buy WHERE CUSTOM_ID = '0';
-- Ʈ���� ����(����)
CREATE OR REPLACE TRIGGER cancel_buy
AFTER DELETE ON tbl_buy	
FOR EACH ROW 	-- ����(����)�ϴ� ���� ������ �϶�, :OLD UPDATE �Ǵ� DELETE �ϱ� �� ��, :NEW �� INSERT �� ��
BEGIN 
	-- ���� �����(tbl_buy ���̺��� ����)�� ������ tbl_temp �ӽ����̺� insert	: �����࿡ ���� �۾�(�� Ʈ����)
	INSERT INTO TBL_TEMP 
	VALUES
	(:OLD.custom_id,:OLD.pcode,:OLD.quantity,:OLD.buy_date,:OLD.buyno);
END;
-- Ʈ���� ���� �׽�Ʈ
DELETE FROM TBL_BUY tb WHERE CUSTOM_ID = 'wonder';
SELECT * FROM TBL_TEMP tt ;


--�߰� view ���� ����
-- grant resource, connect to c##idev -> ���⿡�� view ���������� �����ϴ�.
--grant create view to c##idev;   -> �� �������� ���� ���� ����� �߰� ���� �ο� �ϼ���

CREATE VIEW v_buy
AS
SELECT tb.CUSTOM_ID ,tb.pcode, tc.name, tc.email, tb.quantity
FROM TBL_BUY tb , TBL_CUSTOM tc 
WHERE tb.CUSTOM_ID = tc.CUSTOM_ID ;

