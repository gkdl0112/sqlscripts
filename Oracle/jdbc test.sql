-- commit ?? rollback ?׽?Ʈ
DELETE FROM TBL_CUSTOM tc WHERE CUSTOM_ID = 'sana97';
DELETE FROM TBL_BUY tb  WHERE CUSTOM_ID = 'sana97';

SELECT * FROM TBL_CUSTOM tc ;
ROLLBACK;

ALTER TRIGGER backup_custom disable;

SELECT * FROM TBL_CUSTOM tc ;

SELECT name,email FROM TBL_CUSTOM tc WHERE CUSTOM_ID ='twice';

ALTER TRIGGER secure_custom disable;

UPDATE TBL_CUSTOM SET EMAIL = 'test@gmail.com'
WHERE CUSTOM_ID = 'twice';

SELECT * FROM TBL_CUSTOM tc ;

DELETE FROM TBL_CUSTOM tc WHERE CUSTOM_ID ='gkdl0112';