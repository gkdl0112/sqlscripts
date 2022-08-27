-- ���ڿ� Ÿ��
-- CHAR(����) : �������� , ������ ����Ʈ 
-- VARCHAR(����)  : ����Ŭ���� ���������� ������� �ʴ� �����ڷ���.
-- VARCHAR2(����) : ���������� ���� ����Ʈ, ���̴� �ִ�����̰� 
--				   ������ �޸𸮴� ������ũ�⸸ŭ ����մϴ�.
--				�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, 
--												����/����/��ȣ�� 1����Ʈ
CREATE TABLE tbl_string (
	acol char(10), 		--10����Ʈ ��������
	bcol varchar2(10),	--10����Ʈ ��������
	ccol nchar(10),		--10�� ���� ��������
	dcol nvarchar2(10)	--10�� ���� ��������
);
--char Ÿ��
INSERT INTO tbl_string(acol) VALUES('abcdefghij');
INSERT INTO tbl_string(acol) VALUES('abcdef');	--acol�� �������� Ÿ�� : ���� 4�� �߰�
INSERT INTO tbl_string(acol) VALUES('abcdefghijklm'); -- ���� : ���� �ʰ�
-- INSERT Ȯ��
SELECT * FROM tbl_string;
--�ѱ� Ȯ��
INSERT INTO tbl_string(acol) VALUES('������'); -- ���� 1�� �߰�
INSERT INTO tbl_string(acol) VALUES('�����ٶ�');--���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
INSERT INTO tbl_string(acol) VALUES('����');  -- ���� 4�� �߰�

--varchar2 Ÿ�� : bcol�� �������� 10����Ʈ
INSERT INTO tbl_string(bcol) VALUES('abcdefghij');
INSERT INTO tbl_string(bcol) VALUES('abcdef');	--bcol�� �������� Ÿ�� . ���� �߰� ����
INSERT INTO tbl_string(bcol) VALUES('abcdefghijklm'); -- ���� : ���� �ʰ�
-- INSERT Ȯ��
SELECT * FROM tbl_string;
--�ѱ� Ȯ��
INSERT INTO tbl_string(bcol) VALUES('������');	--���� �߰� ����
INSERT INTO tbl_string(bcol) VALUES('�����ٶ�');--���� ���� ���� �ʹ� ŭ(����: 12, �ִ밪: 10)
INSERT INTO tbl_string(bcol) VALUES('����');  	--���� �߰� ����

-- char�� varchar2�� ����Ʈ ����. nchar�� nvarchar2�� ���ڰ��� ����(�ٱ��� ���ڰ� ���� ���ԵǴ� �÷��� ����)
--nchar Ÿ��
INSERT INTO tbl_string(ccol) VALUES('������'); 	-- ���� 7�� �߰�
INSERT INTO tbl_string(ccol) VALUES('�����ٶ�');	-- ���� 6�� �߰�
INSERT INTO tbl_string(ccol) VALUES('����');  	-- ���� 8�� �߰�
INSERT INTO tbl_string(ccol) VALUES('�����ٶ󸶹ٻ������ī');  --���� : �����ʰ�


--nvarchar2 Ÿ��
INSERT INTO tbl_string(dcol) VALUES('������'); 
INSERT INTO tbl_string(dcol) VALUES('�����ٶ�');
INSERT INTO tbl_string(dcol) VALUES('����');  
INSERT INTO tbl_string(dcol) VALUES('�����ٶ󸶹ٻ������ī');  --���� : �����ʰ�
