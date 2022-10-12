/* 2022-10-13 chi9148
 * REPLY_INDENT : 화면에 들여쓰기 표시하기 위해 필요 - 댓글의 depth 설정
 * REPLY_PARENT : 대댓글 작성시 작성한 순서대로 대댓글 위치 설정하기 위해 필요 - 대댓글의 부모 reply_num을 값 저장
 * */
ALTER TABLE PROJECT_REPLY ADD REPLY_INDENT NUMBER(5) DEFAULT 0;
ALTER TABLE PROJECT_REPLY ADD REPLY_PARENT NUMBER(5) DEFAULT 0;