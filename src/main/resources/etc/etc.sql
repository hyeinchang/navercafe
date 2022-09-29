-- project 관련 테이블 drop sql 조회
SELECT 'drop table ' || table_name || ';' drop_project_table FROM user_tables 
WHERE LOWER(table_name) LIKE 'project_%';

-- project 관련 테이블 시퀀스 drop sql 조회
SELECT 'drop sequence ' || table_name || '_seq;' drop_project_table FROM user_tables 
WHERE LOWER(table_name) LIKE 'project_%';

-- 일련번호가 있는 테이블 create sequence문 조회
SELECT 'create sequence ' || LOWER(table_name) || '_seq;' create_table_seq FROM user_tables 
WHERE REGEXP_LIKE(LOWER(table_name), '^project_') AND NOT REGEXP_LIKE(LOWER(table_name), 'likes|members|member_grade|cafe_info|upgrade_board|black_list|join_question');

-- project_file 테이블의 file_num을 제외한 create sequence문 조회
SELECT 'create sequence ' || LOWER(column_name) || '_seq;' create_file_col_seq FROM  user_tab_cols 
WHERE LOWER(table_name) LIKE 'project_file' AND REGEXP_LIKE(LOWER(column_name), 'num') AND NOT LOWER(column_name) IN ('file_num', 'board_num', 'reply_num', 'memo_reply_num');

-- project 관련 테이블 시퀀스 drop sql 조회
SELECT 'drop sequence ' || sequence_name || ';' drop_project_sequence FROM user_sequences 
WHERE LOWER(sequence_name) LIKE 'project_%' OR LOWER(sequence_name) IN ('cafe_title_num_seq', 'cafe_user_image_num_seq', 'cafe_icon_num_seq');