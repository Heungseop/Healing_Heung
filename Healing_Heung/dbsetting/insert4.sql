
alter table course add (course_reg_date date default sysdate);
--select * from member;
--select * from course;
--select * from course_like_unlike;
--select * from mncourse;

insert into course values(course_seq.nextval, 'first course', 1234, 500000, 'admin', sysdate);
insert into course values(course_seq.nextval, 'second course', 1234, 500000, 'admin', sysdate);
insert into course values(course_seq.nextval, 'third course', 1234, 500000, 'admin', sysdate);

insert into COURSE_LIKE_UNLIKE values(course_like_unlike_seq.nextval, 1, 1, 'admin',sysdate); 

insert into COURSE_LIKE_UNLIKE values(course_like_unlike_seq.nextval, 1, 2, 'admin',sysdate); 
insert into COURSE_LIKE_UNLIKE values(course_like_unlike_seq.nextval, 1, 2, 'admin',sysdate); 

insert into COURSE_LIKE_UNLIKE values(course_like_unlike_seq.nextval, 1, 3, 'admin',sysdate); 

insert into mncourse values(mncourse_seq.nextval, 1, 3);
insert into mncourse values(mncourse_seq.nextval, 1, 5);
insert into mncourse values(mncourse_seq.nextval, 1, 34);
insert into mncourse values(mncourse_seq.nextval, 1, 87);
insert into mncourse values(mncourse_seq.nextval, 1, 100);

insert into mncourse values(mncourse_seq.nextval, 2, 19);
insert into mncourse values(mncourse_seq.nextval, 2, 91);
insert into mncourse values(mncourse_seq.nextval, 2, 76);
insert into mncourse values(mncourse_seq.nextval, 2, 55);
insert into mncourse values(mncourse_seq.nextval, 2, 103);

insert into mncourse values(mncourse_seq.nextval, 3, 59);
insert into mncourse values(mncourse_seq.nextval, 3, 71);
insert into mncourse values(mncourse_seq.nextval, 3, 96);
insert into mncourse values(mncourse_seq.nextval, 3, 75);
insert into mncourse values(mncourse_seq.nextval, 3, 23);


alter table course add(course_comment varchar2(4000));
