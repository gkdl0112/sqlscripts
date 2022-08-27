CREATE TABLE students0(
num char(7) PRIMARY KEY,
name nvarchar2(20) NOT NULL,
age number(3) CHECK (age BETWEEN 10 AND 30),
 address nvarchar2(50)
);

INSERT INTO students0(num,name,age,address)
VALUES ('2021001','김모모',16,'서초구');
INSERT INTO students0(num,name,age,address)
VALUES ('2019019','강다현',18,'강남구');

CREATE TABLE scores0(
   num char(7) NOT NULL,
   subject nvarchar2(20) NOT NULL,
   score number(3) NOT NULL,   -- 점수
   teacher nvarchar2(20) NOT NULL,
   semester char(7) NOT NULL,   -- 학기
   PRIMARY KEY (num,subject),	--기본키 설정(not null + unique)
   FOREIGN KEY (num) REFERENCES students0(num) 
   --외래키설정 REFERENCES(참조) 키워드 뒤에 참조테이블(참조컬럼)
   --			외래키 컬럼과 참조컬럼 모두 stuno 로 같으면 (참조컬럼) 생략가능.
   --외래키 컬럼은 FOREIGN KEY 키워드 뒤에 () 안에 작성.
   --참조컬럼의 조건은? 기본키 또는 unique 제약조건 컬럼만 된다.
);

--alter table ~ add constraint
ALTER TABLE SCORES0
	ADD CONSTRAINT pk_jumsu PRIMARY KEY (stuno,subject);
ALTER TABLE SCORES0 
	ADD CONSTRAINT fk_jumsu FOREIGN KEY (stuno)
	REFERENCES students0(stuno);

INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2021001','국어',89,'이나연','2022_1');
INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2021001','영어',78,'김길동','2022_1');
INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2021001','과학',67,'박세리','2021_2');
INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2019019','국어',92,'이나연','2019_2');
INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2019019','영어',85,'박지성','2019_2');
INSERT INTO scores0(num,subject,score,teacher,semester)
VALUES ('2019019','과학',88,'박세리','2020_1');
