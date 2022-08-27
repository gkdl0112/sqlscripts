CREATE TABLE tbl_custom# (
	custom_id varchar2(20) PRIMARY KEY,
	name nvarchar2(20) NOT NULL,
	email varchar2(20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);

CREATE TABLE TBL_PRODUCT# (
	pcode varchar2(20) PRIMARY KEY,
	category char(2),
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT NULL
);

CREATE TABLE tbl_buy# (
	buy_seq number(8),
	custom_id varchar2(20),
	pcode varchar2(20),
	quantity number(5) NOT NULL,
	buy_date timestamp,
	PRIMARY KEY (buy_seq),
	FOREIGN KEY (custom_id)
		REFERENCES tbl_custom#(custom_id),
	FOREIGN KEY (pcode)
		REFERENCES tbl_product#(pcode)
);

CREATE SEQUENCE tblbuy_seq1 START WITH 2001;

CREATE TABLE tbl_postcode (
postcode char(5) PRIMARY KEY,
area1 varchar2(200) NOT NULL
);

ALTER TABLE "TBL_CUSTOM#" ADD (postcode char(5));

ALTER TABLE "TBL_CUSTOM#" ADD CONSTRAINTS fk_postcode
FOREIGN KEY (postcode) REFERENCES tbl_postcode(postcode);

