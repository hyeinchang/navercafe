-- project 관련 테이블 drop sql 조회
SELECT 'drop table ' || table_name || ';' drop_project_table FROM all_tables WHERE LOWER(table_name) LIKE 'project_%';

-- 일련번호가 있는 테이블 create sequence문 조회
SELECT 'create sequence ' || LOWER(table_name) || '_seq;' create_table_seq FROM all_tables WHERE REGEXP_LIKE(LOWER(table_name), '^project_') AND NOT REGEXP_LIKE(LOWER(table_name), 'likes|members|member_grade|cafe_info|upgrade_board|black_list|join_question');

-- project_file 테이블의 file_num을 제외한 create sequence문 조회
SELECT 'create sequence ' || LOWER(column_name) || '_seq;' create_file_col_seq FROM  user_tab_cols where LOWER(table_name) LIKE 'project_file' AND REGEXP_LIKE(LOWER(column_name), 'num') AND LOWER(column_name) != 'file_num';