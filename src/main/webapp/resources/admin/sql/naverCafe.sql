CREATE TABLE `project_members` (
	`user_id`	varchar2(20)	NOT NULL,
	`user_pw`	varchar2(20)	NOT NULL,
	`user_name`	varchar2(20)	NULL,
	`user_phone`	varchar2(20)	NULL,
	`user_email`	varchar2(20)	NULL,
	`postalCode`	varchar2(20)	NULL,
	`roadAddr`	varchar2(50)	NULL,
	`jibunAddr`	varchar2(50)	NULL,
	`certAddr`	varchar2(20)	NULL,
	`user_regDate`	Date	NULL	DEFAULT sysdate,
	`user_point`	number(5)	NULL	DEFAULT 0,
	`user_level`	number(2)	NULL	DEFAULT 1
);

CREATE TABLE `project_board` (
	`board_num`	number(6)	NOT NULL,
	`board_title`	varchar2(200)	NULL,
	`board_content`	clob	NULL,
	`board_savedate`	Date	NULL	DEFAULT sysdate,
	`board_likes`	number(5)	NULL,
	`board_notice`	char(2)	NULL	DEFAULT N,
	`board_reply_allow`	char(2)	NULL	DEFAULT Y,
	`board_prefix`	varchar2(20)	NULL,
	`user_id`	varchar2(20)	NOT NULL,
	`board_menu_num`	number(6)	NULL,
	`hit`	number(6)	NULL	DEFAULT 0
);

CREATE TABLE `project_boardType` (
	`board_menu_num`	number(6)	NOT NULL	COMMENT '게시판고유번호(시퀀스)',
	`board_menu_desc`	varchar2(20)	NULL,
	`board_write_auth`	number(2)	NULL,
	`board_reply_auth`	number(2)	NULL,
	`board_read_auth`	number(2)	NULL,
	`board_menu_name`	varchar2(20)	NOT NULL,
	`cafe_id`	varchar2(20)	NULL,
	`board_order`	number(5)	NULL
);

CREATE TABLE `project_likes` (
	`board_num`	number(6)	NOT NULL,
	`user_id`	varchar2(20)	NOT NULL
);

CREATE TABLE `project_reply` (
	`reply_num`	number(6)	NULL,
	`board_num`	number(6)	NULL,
	`reply_content`	varchar2(500)	NULL,
	`reply_saveDate`	Date	NULL	DEFAULT sysdate,
	`user_id`	varchar2(20)	NOT NULL,
	`reply_image_name`	varchar2(100)	NULL
);

CREATE TABLE `project_member_grade` (
	`cafe_id`	varchar2(20)	NOT NULL,
	`cafe_user_grade`	number	NOT NULL	DEFAULT 1,
	`cut_visit`	number(4)	NULL,
	`cut_reply`	number(4)	NULL,
	`cut_board`	number(4)	NULL,
	`cut_desc`	varchar2(100)	NOT NULL,
	`cut_name`	varchar2(20)	NOT NULL
);

CREATE TABLE `project_upgrade_board` (
	`user_id`	varchar2(20)	NOT NULL,
	`varchar2(20)`	VARCHAR(255)	NULL,
	`grade_now`	varchar2(20)	NULL,
	`visit`	number(5)	NULL,
	`board_count`	number(5)	NULL,
	`reply_count`	number(5)	NULL,
	`regdate`	date	NULL,
	`apply_date`	date	NULL
);

CREATE TABLE `project_memo_board` (
	`memo_num`	number(6)	NOT NULL,
	`user_id`	varchar2(20)	NOT NULL,
	`memo_content`	varchar2(500)	NOT NULL,
	`memo_saveDate`	Date	NULL	DEFAULT sysdate,
	`memo_step_only`	char(2)	NULL	DEFAULT N
);

CREATE TABLE `project_prefixes` (
	`prefix_num`	number(6)	NOT NULL,
	`prefix_name`	varchar2(15)	NULL,
	`board_menu_num`	number(6)	NOT NULL
);

CREATE TABLE `project_memo_reply` (
	`memo_reply_num`	number(6)	NOT NULL,
	`user_id`	varchar2(20)	NOT NULL,
	`memo_reply_content`	varchar2(100)	NOT NULL,
	`memo_reply_saveDate`	Date	NULL	DEFAULT sysdate,
	`memo_reply_image_name`	varchar2(200)	NULL
);

CREATE TABLE `project_cafe_info` (
	`cafe_id`	varchar2(100)	NOT NULL,
	`cafe_name`	varchar2(200)	NOT NULL,
	`cafe_explanation`	varchar2(5000)	NULL,
	`cafe_title`	varchar2(1000)	NULL,
	`cafe_front`	clob	NULL,
	`cafe_skin`	varchar2(200)	NULL,
	`cafe_layout`	varchar2(200)	NULL,
	`user_id`	varchar2(20)	NULL
);

CREATE TABLE `project_cafe_member` (
	`cafe_id`	varchar2(100)	NOT NULL,
	`user_id`	varchar2(20)	NOT NULL,
	`cafe_user_nickname`	varchar2(100)	NOT NULL,
	`cafe_user_image`	varchar2(200)	NULL,
	`cafe_user_grade`	number	NOT NULL	DEFAULT 1,
	`cafe_user_visit`	number	NULL,
	`cafe_user_write`	number	NULL,
	`cafe_user_reply`	number	NULL,
	`cafe_user_visit_check`	number	NULL,
	`cafe_user_regdate`	date	NULL	DEFAULT sysdate
);

CREATE TABLE `project_blacklist` (
	`cafe_id`	varchar2(20)	NOT NULL,
	`userid`	varchar2(20)	NOT NULL,
	`blacklist_regDate`	Date	NULL	DEFAULT sysdate
);

ALTER TABLE `project_members` ADD CONSTRAINT `PK_PROJECT_MEMBERS` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `project_board` ADD CONSTRAINT `PK_PROJECT_BOARD` PRIMARY KEY (
	`board_num`
);

ALTER TABLE `project_boardType` ADD CONSTRAINT `PK_PROJECT_BOARDTYPE` PRIMARY KEY (
	`board_menu_num`
);

ALTER TABLE `project_likes` ADD CONSTRAINT `PK_PROJECT_LIKES` PRIMARY KEY (
	`board_num`,
	`user_id`
);

ALTER TABLE `project_reply` ADD CONSTRAINT `PK_PROJECT_REPLY` PRIMARY KEY (
	`reply_num`
);

ALTER TABLE `project_member_grade` ADD CONSTRAINT `PK_PROJECT_MEMBER_GRADE` PRIMARY KEY (
	`cafe_id`,
	`cafe_user_grade`
);

ALTER TABLE `project_upgrade_board` ADD CONSTRAINT `PK_PROJECT_UPGRADE_BOARD` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `project_memo_board` ADD CONSTRAINT `PK_PROJECT_MEMO_BOARD` PRIMARY KEY (
	`memo_num`
);

ALTER TABLE `project_prefixes` ADD CONSTRAINT `PK_PROJECT_PREFIXES` PRIMARY KEY (
	`prefix_num`
);

ALTER TABLE `project_memo_reply` ADD CONSTRAINT `PK_PROJECT_MEMO_REPLY` PRIMARY KEY (
	`memo_reply_num`
);

ALTER TABLE `project_cafe_info` ADD CONSTRAINT `PK_PROJECT_CAFE_INFO` PRIMARY KEY (
	`cafe_id`
);

ALTER TABLE `project_cafe_member` ADD CONSTRAINT `PK_PROJECT_CAFE_MEMBER` PRIMARY KEY (
	`cafe_id`,
	`user_id`
);

ALTER TABLE `project_blacklist` ADD CONSTRAINT `PK_PROJECT_BLACKLIST` PRIMARY KEY (
	`cafe_id`,
	`userid`
);

ALTER TABLE `project_cafe_member` ADD CONSTRAINT `FK_project_members_TO_project_cafe_member_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `project_members` (
	`user_id`
);

