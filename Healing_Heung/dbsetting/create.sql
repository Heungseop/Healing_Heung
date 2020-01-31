-- 생성자 Oracle SQL Developer Data Modeler 4.1.1.888
--   위치:        2015-10-12 13:59:23 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g




CREATE TABLE big_group
  (
    big_group_no     NUMBER (10) NOT NULL ,
    nabig_group_name VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE big_group ADD CONSTRAINT big_group_PK PRIMARY KEY ( big_group_no ) ;


CREATE TABLE board
  (
    board_no       NUMBER (10) NOT NULL ,
    board_title    VARCHAR2 (20) NOT NULL ,
    board_reg_date DATE default sysdate,
    board_comment  VARCHAR2 (4000) ,
    board_read     NUMBER (10) ,
    member_id      VARCHAR2 (20) NOT NULL ,
    course_no      NUMBER (10)
  ) ;
ALTER TABLE board ADD CONSTRAINT board_PK PRIMARY KEY ( board_no ) ;


CREATE TABLE board_like
  (
    board_like_no NUMBER (10) NOT NULL ,
    board_no      NUMBER (10) NOT NULL ,
    member_id     VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE board_like ADD CONSTRAINT board_like_PK PRIMARY KEY ( board_like_no ) ;


CREATE TABLE course
  (
    course_no       NUMBER (10) NOT NULL ,
    course_name     VARCHAR2 (20) NOT NULL ,
    course_distance NUMBER (10) ,
    course_cost     NUMBER (10) ,
    course_vehicle  VARCHAR2 (20) ,
    member_id       VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE course ADD CONSTRAINT course_PK PRIMARY KEY ( course_no ) ;


CREATE TABLE course_like_unlike
  (
    course_like_unlike_no    NUMBER (10) NOT NULL ,
    course_like_unlike_judge CHAR (1) NOT NULL ,
    course_no                NUMBER (10) NOT NULL ,
    member_id                VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE course_like_unlike ADD CONSTRAINT course_like_unlike_PK PRIMARY KEY ( course_like_unlike_no ) ;


CREATE TABLE group_detail
  (
    group_detail_no   NUMBER (10) NOT NULL ,
    group_detail_name VARCHAR2 (20) NOT NULL ,
    big_group_no      NUMBER (10) NOT NULL
  ) ;
ALTER TABLE group_detail ADD CONSTRAINT group_detail_PK PRIMARY KEY ( group_detail_no ) ;


CREATE TABLE image_url
  (
    image_url_no  NUMBER (10) NOT NULL ,
    image_url_url VARCHAR2 (500) ,
    image_url_file VARCHAR2 (100) ,
    place_no      NUMBER (10) NOT NULL
  ) ;
ALTER TABLE image_url ADD CONSTRAINT image_url_PK PRIMARY KEY ( image_url_no ) ;


CREATE TABLE member
  (
    member_id       VARCHAR2 (20) NOT NULL ,
    member_password VARCHAR2 (20) NOT NULL ,
    member_name     VARCHAR2 (20) NOT NULL ,
    member_reg_date DATE default sysdate ,
    member_birth    DATE NOT NULL ,
    member_email    VARCHAR2 (20) NOT NULL ,
    member_phone    VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE member ADD CONSTRAINT member_PK PRIMARY KEY ( member_id ) ;


CREATE TABLE mncourse
  (
    mncourse_no NUMBER (10) NOT NULL ,
    course_no   NUMBER (10) NOT NULL ,
    place_no    NUMBER (10) NOT NULL
  ) ;
ALTER TABLE mncourse ADD CONSTRAINT mncourse_PK PRIMARY KEY ( mncourse_no ) ;


CREATE TABLE place
  (
    place_no         NUMBER (10) NOT NULL ,
    place_name       VARCHAR2 (100) NOT NULL ,
    place_address    VARCHAR2 (300) NOT NULL ,
    place_phone      VARCHAR2 (30) ,
    place_position_x NUMBER NOT NULL ,
    place_position_y NUMBER NOT NULL ,
    place_comment    VARCHAR2 (4000) ,
    place_cert       CHAR (1) NOT NULL ,
    member_id        VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE place ADD CONSTRAINT place_PK PRIMARY KEY ( place_no ) ;


CREATE TABLE place_grouping
  (
    place_grouping_no NUMBER (10) NOT NULL ,
    place_no          NUMBER (10) NOT NULL ,
    group_detail_no   NUMBER (10) NOT NULL 
  ) ;
ALTER TABLE place_grouping ADD CONSTRAINT place_grouping_PK PRIMARY KEY ( place_grouping_no ) ;


CREATE TABLE place_like
  (
    place_like_no NUMBER (10) NOT NULL ,
    place_no      NUMBER (10) NOT NULL ,
    member_id     VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE place_like ADD CONSTRAINT place_like_PK PRIMARY KEY ( place_like_no ) ;


CREATE TABLE reply
  (
    reply_no       NUMBER (10) NOT NULL ,
    reply_reg_date DATE default sysdate ,
    reply_comment  VARCHAR2 (400) ,
    member_id      VARCHAR2 (20) NOT NULL ,
    board_no       NUMBER (10) NOT NULL
  ) ;
ALTER TABLE reply ADD CONSTRAINT reply_PK PRIMARY KEY ( reply_no ) ;


CREATE TABLE reply_like
  (
    reply_like_no NUMBER (10) NOT NULL ,
    reply_no      NUMBER (10) NOT NULL ,
    member_id     VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE reply_like ADD CONSTRAINT reply_like_PK PRIMARY KEY ( reply_like_no ) ;


ALTER TABLE board ADD CONSTRAINT board_course_FK FOREIGN KEY ( course_no ) REFERENCES course ( course_no ) ;

ALTER TABLE board_like ADD CONSTRAINT board_like_board_FK FOREIGN KEY ( board_no ) REFERENCES board ( board_no ) ;

ALTER TABLE board_like ADD CONSTRAINT board_like_member_FK FOREIGN KEY ( member_id ) REFERENCES member ( member_id ) ;

ALTER TABLE board ADD CONSTRAINT board_member_FK FOREIGN KEY ( member_id ) REFERENCES member ( member_id ) ;

ALTER TABLE course_like_unlike ADD CONSTRAINT course_like_unlike_course_FK FOREIGN KEY ( course_no ) REFERENCES course ( course_no ) ;

ALTER TABLE course_like_unlike ADD CONSTRAINT course_like_unlike_member_FK FOREIGN KEY ( member_id ) REFERENCES member ( member_id ) ;

ALTER TABLE course ADD CONSTRAINT course_member_FK FOREIGN KEY ( member_id ) REFERENCES member ( member_id ) ;

ALTER TABLE group_detail ADD CONSTRAINT group_detail_big_group_FK FOREIGN KEY ( big_group_no ) REFERENCES big_group ( big_group_no ) ;

ALTER TABLE image_url ADD CONSTRAINT image_url_place_FK FOREIGN KEY ( place_no ) REFERENCES place ( place_no ) ;

ALTER TABLE mncourse ADD CONSTRAINT mncourse_course_FK FOREIGN KEY ( course_no ) REFERENCES course ( course_no ) ;

ALTER TABLE mncourse ADD CONSTRAINT mncourse_place_FK FOREIGN KEY ( place_no ) REFERENCES place ( place_no ) ;

ALTER TABLE place_grouping ADD CONSTRAINT place_grouping_group_detail_FK FOREIGN KEY ( group_detail_no ) REFERENCES group_detail ( group_detail_no ) ;

ALTER TABLE place_grouping ADD CONSTRAINT place_grouping_place_FK FOREIGN KEY ( place_no ) REFERENCES place ( place_no ) ;

ALTER TABLE place_like ADD CONSTRAINT place_like_member_FK FOREIGN KEY ( member_id ) REFERENCES member ( member_id ) ;

ALTER TABLE place_like ADD CONSTRAINT place_like_place_FK FOREIGN KEY ( place_no ) REFERENCES place ( place_no ) ;

ALTER TABLE place ADD CONSTRAINT place_member_FK FOREIGN KEY ( member_id ) REFERENCES member ( member_id ) ;

ALTER TABLE reply ADD CONSTRAINT reply_board_FK FOREIGN KEY ( board_no ) REFERENCES board ( board_no ) ;

ALTER TABLE reply_like ADD CONSTRAINT reply_like_member_FK FOREIGN KEY ( member_id ) REFERENCES member ( member_id ) ;

ALTER TABLE reply_like ADD CONSTRAINT reply_like_reply_FK FOREIGN KEY ( reply_no ) REFERENCES reply ( reply_no ) ;

ALTER TABLE reply ADD CONSTRAINT reply_member_FK FOREIGN KEY ( member_id ) REFERENCES member ( member_id ) ;

create sequence member_seq;
create sequence board_seq;
create sequence reply_seq;
create sequence place_seq;
create sequence course_seq;
create sequence mncourse_seq;
create sequence course_like_unlike_seq;
create sequence reply_like_seq;
create sequence board_like_seq;
create sequence place_like_seq;
create sequence image_url_seq;
create sequence place_grouping_seq;
create sequence group_detail_seq;
create sequence big_group_seq;

-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

