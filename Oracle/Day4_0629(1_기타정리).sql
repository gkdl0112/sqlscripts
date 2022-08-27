-- DDL : create, alter, drop, truncate(대상은 user, table, sequence,  view, ... 단 truncate는 테이블만)
-- DML : insert, update, delete

-- drop table students0 ; --오류 : student0 테이블 먼저 삭제하면
						 --원인 : 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다.

-- UPDATE 테이블명 SET 컬럼명 = 값,컬럼명 = 값,컬럼명 = 값,....WHERE 조건컬럼 관계식
-- DELETE FROM 테이블명 WHERE 조건컬럼관계식
-- 주의 할점 : update와 delete 는 where 없이 사용하는 것은 위험한 동작.
--				truncate는 실행을 취소(rollback)할수 없기 때문에 DDL에 속한다.
SELECT * FROM STUDENTS0 ;
-- update, delete, select 에서 where 의 컬럼이 기본키 컬럼이면 실행되는 결과 반영되는 행은 최대 1개
-- 기본키의 목적은 테이블의 여러행들을 구분(식별)
UPDATE STUDENTS0 SET AGE = 17 WHERE NUM = 2021001;

--rollback, commit 테스트 (데이터베이스 메뉴에서 트랜잭션 모드를 manual로 변경한다.)
UPDATE STUDENTS0 SET ADDRESS = '성북구', AGE = 16 WHERE NUM = 2021001;
ROLLBACK; -- 위의 UPDATE 실행을 취소

UPDATE STUDENTS0 SET ADDRESS = '성북구', AGE = 16 WHERE NUM = 2021001;
COMMIT;
ROLLBACK;	--이미 COMMIT 이 된 명령어는 ROLLBACK 못함.
----------------------------여기 까지 첫번째 예시 . 트랜잭션 관리명령 : rollback, commit
DELETE FROM SCORES0 ;
ROLLBACK;
DELETE FROM SCORES0 WHERE NUM = 2019019;
ROLLBACK;
SELECT * FROM STUDENTS0 ;
SELECT * FROM SCORES0 ;
--이 편집기는 트랜잭션 수동 모드이므로 select 결과가 2019019가 없다.
--다른 편집기는 다른 클라이언트 이므로 이전 상태(최종 커밋한 상태)로 보여진다.
ROLLBACK;
SELECT * FROM SCORES0 ;

---------------------------------------------------- 여기까지 두번째 예시
TRUNCATE TABLE SCORES0 ;	-- 모든 데이터를 지운다. ROLLBACK 여부 확인 ?
						 	-- 답 : ROLLBACK 불가능.
-- 모든 데이터를 지울것이 확실하다면 다른것들과 섞여서 롤백되지 않게 확실하게 TRUNCATE 해라.
--------------------------------
/*
 * 	INSERT
 * 	DELETE
 * 	COMMIT;		(1) 라인 41,42
 * 	UPDATE
 * 	DELETE;
 * 	ROLLBACK;	(2) 라인 44,45
 * 	INSERT;
 * 	INSERT;
 * 	ROLLBACK;	(3) 라인 47,48
 * 	INSERT
 * 	UPDATE;
 * 	COMMIT;		(4) 라인 50,51
 * 
 */
