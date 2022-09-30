-- drop table
/*
drop table PROJECT_MEMBERS;
drop table PROJECT_BOARD;
drop table PROJECT_BOARD_TYPE;
drop table PROJECT_LIKES;
drop table PROJECT_REPLY;
drop table PROJECT_MEMBER_GRADE;
drop table PROJECT_MEMO_BOARD;
drop table PROJECT_PREFIXES;
drop table PROJECT_MEMO_REPLY;
drop table PROJECT_CAFE_INFO;
drop table PROJECT_CAFE_MEMBER;
drop table PROJECT_BLACKLIST;
drop table PROJECT_JOIN_QUESTION;
drop table PROJECT_JOIN_ANSWERS;
drop table PROJECT_CAFE_JOIN_REQUEST;
drop table PROJECT_CAFE_DEPORTED;
drop table PROJECT_FILE;
*/

-- drop sequence
/*
drop sequence CAFE_ICON_NUM_SEQ;
drop sequence CAFE_TITLE_NUM_SEQ;
drop sequence CAFE_USER_IMAGE_NUM_SEQ;
drop sequence PROJECT_BLACKLIST_SEQ;
drop sequence PROJECT_BOARD_SEQ;
drop sequence PROJECT_BOARD_TYPE_SEQ;
drop sequence PROJECT_CAFE_DEPORTED_SEQ;
drop sequence PROJECT_CAFE_JOIN_REQUEST_SEQ;
drop sequence PROJECT_CAFE_MEMBER_SEQ;
drop sequence PROJECT_FILE_SEQ;
drop sequence PROJECT_JOIN_ANSWERS_SEQ;
drop sequence PROJECT_MEMO_BOARD_SEQ;
drop sequence PROJECT_MEMO_REPLY_SEQ;
drop sequence PROJECT_PREFIXES_SEQ;
drop sequence PROJECT_REPLY_SEQ;
*/
CREATE TABLE project_members (
    user_id    varchar2(20)    NOT NULL,
    user_pw    varchar2(100)    NOT NULL,
    user_name    varchar2(20)    NULL,
    user_phone    varchar2(20)    NULL,
    user_email    varchar2(20)    NULL,
    user_postalcode    varchar2(20)    NULL,
    user_addr    varchar2(50)    NULL,
    user_detail_addr    varchar2(20)    NULL,
    user_regDate    Date        DEFAULT sysdate,
    user_point    number(5)        DEFAULT 0,
    user_level    number(2)        DEFAULT 1,
    user_gender    char(1)    NULL,
    user_birthdate    int    NULL
);

CREATE TABLE project_board (
    board_num    number(6)    NOT NULL,
    board_title    varchar2(200)    NULL,
    board_content    clob    NULL,
    board_savedate    Date        DEFAULT sysdate,
    board_likes    number(5)    NULL,
    board_notice    char(2)        DEFAULT 'N',
    board_reply_allow    char(2)        DEFAULT 'Y',
    board_prefix    varchar2(20)    NULL,
    user_id    varchar2(20)    NOT NULL,
    board_menu_num    number(6)    NULL,
    hit    number(6)        DEFAULT 0
);

CREATE TABLE project_board_type (
    board_menu_num    number(6)    NOT NULL    ,
    board_menu_desc    varchar2(200)    NULL,
    board_write_auth    number(2)    NULL,
    board_reply_auth    number(2)    NULL,
    board_read_auth    number(2)    NULL,
    board_menu_name    varchar2(200)    NOT NULL,
    cafe_id    varchar2(20)    NULL,
    board_order    number(5)    NULL,
    board_menu_type    number(2)    NOT NULL,
    board_likes_flag    char(1)        DEFAULT 'Y',
    board_reply_flag    char(1)        DEFAULT 'Y',
    board_prefixes_flag    char(1)        DEFAULT 'N',
    board_public_flag    char(1)        DEFAULT 'Y'
);

CREATE TABLE project_likes (
    board_num    number(6)    NOT NULL,
    user_id    varchar2(20)    NOT NULL
);

CREATE TABLE project_reply (
    reply_num    number(6)    NULL,
    board_num    number(6)    NULL,
    reply_content    varchar2(500)    NULL,
    reply_saveDate    Date        DEFAULT sysdate,
    user_id    varchar2(20)    NOT NULL,
    reply_group    number(6)    NULL,
    reply_step    number(4)        DEFAULT 0
);

CREATE TABLE project_member_grade (
    cafe_id    varchar2(20)    NOT NULL,
    cafe_user_grade    number        DEFAULT 0,
    cut_visit    number(4)    NULL,
    cut_reply    number(4)    NULL,
    cut_board    number(4)    NULL,
    cut_desc    varchar2(100)    NOT NULL,
    cut_name    varchar2(20)    NOT NULL,
    cut_type    number(1)    NULL,
    cut_removed    varchar2(15)    NULL
);

CREATE TABLE project_memo_board (
    memo_num    number(6)    NOT NULL,
    user_id    varchar2(20)    NOT NULL,
    memo_content    varchar2(500)    NOT NULL,
    memo_saveDate    Date        DEFAULT sysdate,
    memo_step_only    char(2)        DEFAULT 'N',
    board_menu_num    number(6)    NULL
);

CREATE TABLE project_prefixes (
    prefix_num    number(6)    NOT NULL,
    prefix_name    varchar2(15)    NULL,
    board_menu_num    number(6)    NOT NULL
);

CREATE TABLE project_memo_reply (
    memo_reply_num    number(6)    NOT NULL,
    user_id    varchar2(20)    NOT NULL,
    memo_reply_content    varchar2(100)    NOT NULL,
    memo_reply_saveDate    Date        DEFAULT sysdate,
    memo_reply_group    number(6)    NULL
);

CREATE TABLE project_cafe_info (
    cafe_id    varchar2(100)    NOT NULL,
    cafe_name    varchar2(200)    NOT NULL,
    cafe_explanation    varchar2(2000)    NULL,
    cafe_title_num    number(5)    NULL,
    cafe_front    clob    NULL,
    cafe_skin    varchar2(200)    NULL,
    cafe_layout    varchar2(200)    NULL,
    user_id    varchar2(20)    NULL,
    cafe_join_apply    char(1)        DEFAULT 'N',
    cafe_join_gender    varchar2(20)        DEFAULT 'both',
    cafe_join_age    varchar2(100)        DEFAULT 'all',
    cafe_icon_num    number(5)    NULL,
    cafe_join_information    varchar2(2000)    NULL,
    cafe_regdate    date    NULL
);

CREATE TABLE project_cafe_member (
    cafe_id    varchar2(100)    NOT NULL,
    user_id    varchar2(20)    NOT NULL,
    cafe_user_nickname    varchar2(100)    NOT NULL,
    cafe_user_image_num    number    NULL,
    cafe_user_grade    number        DEFAULT 1,
    cafe_user_visit    number    NULL,
    cafe_user_write    number    NULL,
    cafe_user_reply    number    NULL,
    cafe_user_visit_check    number    NULL,
    cafe_user_regdate    date        DEFAULT sysdate,
    cafe_user_applydate    date        DEFAULT sysdate,
    cafe_user_status    char(1)        DEFAULT 'Y',
    cafE_user_email_receieve    char(1)        DEFAULT 'Y',
    cafe_user_gender_reveal    char(1)    NULL
);

CREATE TABLE project_blacklist (
    cafe_id    varchar2(20)    NOT NULL,
    user_id    varchar2(20)    NOT NULL,
    blacklist_regDate    Date        DEFAULT sysdate,
    reason    varchar2(100)    NULL
);

CREATE TABLE project_join_question (
    cafe_question_num    number(1)    NOT NULL,
    cafe_id    varchar2(100)    NOT NULL,
    cafe_question_content    varchar2(200)    NULL
);

CREATE TABLE project_join_answers (
    cafe_answer_num    number(5)    NOT NULL,
    user_id    varchar2(100)    NOT NULL,
    cafe_answer_content    varchar2(200)    NULL,
    cafe_id    varchar2(100)    NULL,
    cafe_question_num    number(1)    NULL
);

CREATE TABLE project_cafe_join_request (
    cafe_request_num    number(5)    NOT NULL,
    cafe_id    varchar2(100)    NOT NULL,
    user_id    varchar2(20)    NOT NULL,
    regDate    date        DEFAULT sysdate
);

CREATE TABLE project_cafe_deported (
    deported_num    number(5)    NOT NULL,
    user_id    varchar2(20)    NOT NULL,
    deported_reason    varchar2(100)    NULL,
    regDate    Date        DEFAULT sysdate
);

CREATE TABLE project_file (
    file_num    number(5)    NOT NULL,
    file_directory    varchar2(200)    NULL,
    file_org_name    varchar2(500)    NULL,
    file_stored_name    varchar2(500)    NULL,
    regdate    date        DEFAULT sysdate,
    board_num    number(5)    NULL,
    cafe_title_num    number(5)    NULL,
    reply_num    number(5)    NULL,
    cafe_user_image_num    number(5)    NULL,
    cafe_icon_num    number(5)    NULL,
    memo_reply_num    number(5)    NULL
);

ALTER TABLE project_members ADD CONSTRAINT PK_PROJECT_MEMBERS PRIMARY KEY (
    user_id
);

ALTER TABLE project_board ADD CONSTRAINT PK_PROJECT_BOARD PRIMARY KEY (
    board_num
);

ALTER TABLE project_board_type ADD CONSTRAINT PK_PROJECT_BOARD_TYPE PRIMARY KEY (
    board_menu_num
);

ALTER TABLE project_likes ADD CONSTRAINT PK_PROJECT_LIKES PRIMARY KEY (
    board_num,
    user_id
);

ALTER TABLE project_reply ADD CONSTRAINT PK_PROJECT_REPLY PRIMARY KEY (
    reply_num
);

ALTER TABLE project_member_grade ADD CONSTRAINT PK_PROJECT_MEMBER_GRADE PRIMARY KEY (
    cafe_id,
    cafe_user_grade
);

ALTER TABLE project_memo_board ADD CONSTRAINT PK_PROJECT_MEMO_BOARD PRIMARY KEY (
    memo_num
);

ALTER TABLE project_prefixes ADD CONSTRAINT PK_PROJECT_PREFIXES PRIMARY KEY (
    prefix_num
);

ALTER TABLE project_memo_reply ADD CONSTRAINT PK_PROJECT_MEMO_REPLY PRIMARY KEY (
    memo_reply_num
);

ALTER TABLE project_cafe_info ADD CONSTRAINT PK_PROJECT_CAFE_INFO PRIMARY KEY (
    cafe_id
);

ALTER TABLE project_cafe_member ADD CONSTRAINT PK_PROJECT_CAFE_MEMBER PRIMARY KEY (
    cafe_id,
    user_id
);

ALTER TABLE project_blacklist ADD CONSTRAINT PK_PROJECT_BLACKLIST PRIMARY KEY (
    cafe_id,
    user_id
);

ALTER TABLE project_join_question ADD CONSTRAINT PK_PROJECT_JOIN_QUESTION PRIMARY KEY (
    cafe_question_num,
    cafe_id
);

ALTER TABLE project_join_answers ADD CONSTRAINT PK_PROJECT_JOIN_ANSWERS PRIMARY KEY (
    cafe_answer_num
);

ALTER TABLE project_cafe_join_request ADD CONSTRAINT PK_PROJECT_CAFE_JOIN_REQUEST PRIMARY KEY (
    cafe_request_num
);

ALTER TABLE project_cafe_deported ADD CONSTRAINT PK_PROJECT_CAFE_DEPORTED PRIMARY KEY (
    deported_num
);

ALTER TABLE project_file ADD CONSTRAINT PK_PROJECT_FILE PRIMARY KEY (
    file_num
);

-- table sequence
create sequence project_reply_seq;
create sequence project_prefixes_seq;
create sequence project_memo_reply_seq;
create sequence project_memo_board_seq;
create sequence project_join_answers_seq;
create sequence project_file_seq;
create sequence project_cafe_member_seq;
create sequence project_cafe_join_request_seq;
create sequence project_cafe_deported_seq;
create sequence project_board_type_seq;
create sequence project_board_seq;
create sequence project_blacklist_seq;

-- colum sequence
create sequence cafe_title_num_seq;
create sequence cafe_user_image_num_seq;
create sequence cafe_icon_num_seq;