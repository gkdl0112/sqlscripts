--����3 ������ �̼���


--1)
INSERT INTO TBL_POSTCODE (postcode,area1) VALUES ('137964','����Ư���� ���ʱ� ����2��');
INSERT INTO TBL_POSTCODE (postcode,area1) VALUES ('138761','����Ư���� ���ı� ������ 409880');
INSERT INTO TBL_POSTCODE (postcode,area1) VALUES ('412510','��⵵ ���� ���籸 ������');
INSERT INTO TBL_POSTCODE (postcode,area1) VALUES ('409880','��õ������ ������ �ڿ���');


--2)
UPDATE "TBL_CUSTOM#" SET POSTCODE ='137964' WHERE CUSTOM_ID = 'mina012';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='412510' WHERE CUSTOM_ID = 'hongGD';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='409880' WHERE CUSTOM_ID = 'wonder';
UPDATE "TBL_CUSTOM#" SET POSTCODE ='138761' WHERE CUSTOM_ID = 'sana';

--3)
CREATE VIEW v_custom_info
AS 
SELECT custom_id,tp.POSTCODE ,AREA1 
FROM TBL_POSTCODE tp ,"TBL_CUSTOM#" tc 
WHERE tp.POSTCODE = tc.POSTCODE ;

SELECT * FROM v_custom_info;