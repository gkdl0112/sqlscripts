--메인글 테이블
CREATE TABLE freeboard(
	idx number(5) NOT NULL,
	writer varchar2(30) NOT NULL,		-- 작성자
	password varchar2(10) NOT NULL,		-- 글비밀번호
	subject varchar2(40) NOT NULL,		-- 글제목
	content varchar2(2000) NOT NULL,	-- 조회수
	readCount number(5) DEFAULT '0',	-- 작성날짜와 시간 기본값
	wdate DATE DEFAULT sysdate,			-- 선택
	ip varchar2(15) DEFAULT '127.0.0.1',-- 댓글 갯수
	commentCount number(3) DEFAULT '0',
	PRIMARY KEY(idx)
	);

CREATE SEQUENCE board_idx_seq;

-- 데이터 샘플 추가
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '김모모','1111','알립니다.','오늘 모임 변경안내입니다.');
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '최사나','2222','공지','공지공지');
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '박세리','1234','하이','하이하이!!');
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '김땡땡','1111','이벤트','이벤트 안내입니다.');
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '강감찬','2222','재공지','재공지재공지');
INSERT INTO freeboard (idx,writer,password,subject,content)
VALUES (board_idx_seq.nextval, '이사나','1234','정회원 공지','정회원 안내입니다.');



CREATE TABLE COMMENTS (
	IDX NUMBER(3) NOT NULL,		-- 댓글 테이블의 기본키
	MREF NUMBER(5) NOT NULL,		-- FREEBOARD 테이블의 IDX
	WRITER VARCHAR2(30) NOT NULL,		-- 이메일, 실명, 닉네임, ...
	CONTENT VARCHAR2(2000) NOT NULL,
	WDATE DATE DEFAULT SYSDATE,
	IP VARCHAR2(15) DEFAULT '127.0.0.1',
	HEART NUMBER(3) DEFAULT '0',		-- 좋아요 개수
	PRIMARY KEY (IDX)
);

CREATE SEQUENCE cmt_idx_seq;

INSERT INTO COMMENTS (idx,mref,writer,content)
VALUES (cmt_idx_seq.nextval,300,'이하니','이글은 메인글 300번 댓글~');
INSERT INTO COMMENTS (idx,mref,writer,content)
VALUES (cmt_idx_seq.nextval,300,'김땡떙','이글은 메인글 300번 댓글~2');
INSERT INTO COMMENTS (idx,mref,writer,content)
VALUES (cmt_idx_seq.nextval,333,'이하니','이글은 메인글 333번 댓글~');
INSERT INTO COMMENTS (idx,mref,writer,content)
VALUES (cmt_idx_seq.nextval,333,'김땡떙','이글은 메인글 333번 댓글2~');
INSERT INTO COMMENTS (idx,mref,writer,content)
VALUES (cmt_idx_seq.nextval,333,'김땡떙','하이!!하이~~');

--메인글 idx의 댓글 갯수

SELECT count(*) FROM COMMENTS  WHERE mref=333;

UPDATE FREEBOARD 
SET COMMENTCOUNT = (SELECT count (*) FROM COMMENTS  WHERE mref=300)
WHERE IDX =300;

SELECT * FROM FREEBOARD f WHERE IDX =300;

-- 파일 업로드 예제 테이블
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
filenames varchar2(200), --업로드 후 파일명 저장 컬럼 
PRIMARY KEY(idx) );

CREATE SEQUENCE app_idx_seq;




