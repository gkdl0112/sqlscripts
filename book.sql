-- ȸ���� ������ �뿩�ϴ�
CREATE TABLE BOOK_MEMBER (
mem_idx number(5,0) NOT NULL,
name varchar2(20) NOT NULL,
email varchar2(20) UNIQUE,
tel varchar2(20) UNIQUE,
password varchar2(10),
primary key(mem_idx));

CREATE TABLE TBL_BOOK (
bcode char(5) NOT NULL,
title varchar2(30) NOT NULL,
writer varchar2(20),
publisher varchar2(20),
pdate date,
primary key(bcode));

CREATE TABLE TBL_BOOKRENT (
rent_no number(5,0) NOT NULL,
mem_idx number(5,0) NOT NULL,
bcode char(5) NOT NULL,
rent_date date NOT NULL,
exp_date date NOT NULL,
return_date date,
delay_days number(3,0),
primary key(rent_no),
foreign key(mem_idx) references book_member(mem_idx),
foreign key(bcode) references tbl_book(bcode));

CREATE SEQUENCE book_seq START WITH 10001;
CREATE SEQUENCE rent_seq START WITH 1;

INSERT INTO BOOK_MEMBER(MEM_IDX,NAME,EMAIL,TEL,PASSWORD)
VALUES(book_seq.nextval,'���ϴ�','honey@naver.com','010-9889-0567','1122');
INSERT INTO BOOK_MEMBER(MEM_IDX,NAME,EMAIL,TEL,PASSWORD)
VALUES(book_seq.nextval,'�̼���','jong@daum.net','010-2354-6773','2345');
INSERT INTO BOOK_MEMBER(MEM_IDX,NAME,EMAIL,TEL,PASSWORD)
VALUES(book_seq.nextval,'�����','lucky@korea.com','010-5467-8792','9876');
INSERT INTO BOOK_MEMBER(MEM_IDX,NAME,EMAIL,TEL,PASSWORD)
VALUES(book_seq.nextval,'���浿','nadong@kkk.net','010-3456-8765','3456');
INSERT INTO BOOK_MEMBER(MEM_IDX,NAME,EMAIL,TEL,PASSWORD)
VALUES(book_seq.nextval,'������','haha@korea.net','010-3987-9087','1234');

INSERT INTO TBL_BOOK(BCODE,TITLE,WRITER,PUBLISHER,PDATE)
VALUES('A1101','�ڽ���','Į���̰�','���̾𽺺Ͻ�','2006-12-01');
INSERT INTO TBL_BOOK(BCODE,TITLE,WRITER,PUBLISHER,PDATE)
VALUES('B1101','��Ŀ������','����Ŀ','��Ŀ����','2018-07-10');
INSERT INTO TBL_BOOK(BCODE,TITLE,WRITER,PUBLISHER,PDATE)
VALUES('C1101','Ǫ������ �ʹϴ�','����','â��','2015-06-20');
INSERT INTO TBL_BOOK(BCODE,TITLE,WRITER,PUBLISHER,PDATE)
VALUES('A1102','�佺Ʈ','�˺���Ʈ �','������','2011-03-01');

INSERT INTO TBL_BOOKRENT(RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
VALUES(rent_seq.nextval,10001,'B1101','2021-09-01','2021-09-15','2021-09-14');
INSERT INTO TBL_BOOKRENT(RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
VALUES(rent_seq.nextval,10002,'C1101','2021-09-12','2021-09-26','2021-09-29');
INSERT INTO TBL_BOOKRENT(RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
VALUES(rent_seq.nextval,10003,'B1101','2021-09-03','2021-09-17','2021-09-17');
INSERT INTO TBL_BOOKRENT(RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE)
VALUES(rent_seq.nextval,10004,'C1101','2022-06-30','2022-07-14');
INSERT INTO TBL_BOOKRENT(RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE)
VALUES(rent_seq.nextval,10001,'A1101','2022-07-04','2022-07-18');
INSERT INTO TBL_BOOKRENT(RENT_NO,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
VALUES(rent_seq.nextval,10003,'A1102','2022-07-06','2022-07-20','2022-07-13');














