-- bucket
create sequence seq_bucket START WITH 1 INCREMENT BY 1 NOCYCLE;

create table bucket
(
    bucket_no number(10,0) not null
);

alter table bucket
    add constraint pk_bucket
        primary key (bucket_no);

-- file
create sequence seq_bucketfile START WITH 1 INCREMENT BY 1 NOCYCLE;

create table bucketfile
(
    uuid             number(10,0)  not null,
    upload_path      varchar2(255) not null,
    file_name        varchar2(255) not null,
    hasing_file_name varchar2(255) not null,
    file_type        varchar2(255) not null,
    file_class       varchar2(255) not null,
    file_size        number(10,0) not null,
    mandatory_status varchar2(255) not null,
    created_at       timestamp default current_timestamp,
    bucket_no        number(10,0) not null,
    constraint fk_bucketfile_bucket_no foreign key (bucket_no) references bucket (bucket_no)
);

alter table bucketfile
    add constraint pk_bucketfile
        primary key (uuid);

-- announcement
create sequence seq_announcement START WITH 1 INCREMENT BY 1 NOCYCLE;

create table announcement
(
    ann_no             number(10,0) not null,
    total_ann_no       varchar2(100) not null,
    total_title        varchar2(255) not null,
    competent_ministry varchar2(255) not null,
    spec_institution   varchar2(100) not null,
    ann_type           varchar2(50) not null,
    sub_ann_count      number(2,0) not null,
    reception_type     varchar2(50) not null,
    status             varchar2(20) not null,
    started_at         timestamp default current_timestamp,
    closed_at          timestamp default current_timestamp,
    created_at         timestamp default current_timestamp,
    updated_at         timestamp default current_timestamp,
    bucket_no          number(10,0)  not null,
    constraint fk_announcement_bucket_no foreign key (bucket_no) references bucket (bucket_no)
);

alter table announcement
    add constraint pk_announcement
        primary key (ann_no);

-- sub_announcement
create sequence seq_sub_announcement START WITH 1 INCREMENT BY 1 NOCYCLE;

create table sub_announcement
(
    sub_ann_no          number(10,0) not null,
    sub_ann_uni_no      varchar2(100) not null,
    sub_title           varchar2(255) not null,
    plan_type           varchar2(50) not null,
    spec_institution_no varchar2(50) not null,
    tech_field_name     varchar2(100) not null,
    mgr_name            varchar2(20) not null,
    manager_tel         varchar2(20) not null,
    planning_year       number(4,0) not null,
    total_subsidy       number(10,0)  not null,
    total_dev_month     number(2,0)  not null,
    one_year_subsidy    number(10,0) not null,
    one_year_dev_month  number(2,0) not null,
    filed               varchar2(50) not null,
    ann_no              number(10,0) not null,
    bucket_no           number(10,0) not null,
    constraint fk_sub_announcement_ann_no foreign key (ann_no) references announcement (ann_no),
    constraint fk_sub_announcement_bucket_no foreign key (bucket_no) references bucket (bucket_no)
);

alter table sub_announcement
    add constraint pk_sub_announcement
        primary key (sub_ann_no);

-- institution
create sequence seq_institution START WITH 1 INCREMENT BY 1 NOCYCLE;

create table institution
(
    institution_no       number(10,0) not null,
    name                 varchar2(50) not null,
    business_register_no varchar2(25) not null,
    address              varchar2(100) not null,
    company_type         varchar2(20) not null,
    iar_type             varchar2(25) not null
);

alter table institution
    add constraint pk_institution
        primary key (institution_no);

-- quarter_earing
create sequence seq_quarter_earning START WITH 1 INCREMENT BY 1 NOCYCLE;

create table quarter_earning
(
    year_no          number(4,0) not null,
    quarter          number(1,0) not null,
    business_profit  number(10,0) not null,
    sales            number(10,0) not null,
    total_asset      number(10,0) not null,
    total_capital    number(10,0) not null,
    total_liabilitie number(10,0) not null,
    institution_no   number(10,0) not null,
    constraint fk_quarter_institution_no foreign key (institution_no) references institution (institution_no)
);

alter table quarter_earning
    add constraint pk_quarter_earning
        primary key (year_no, quarter, institution_no);

-- member
create sequence seq_member START WITH 1 INCREMENT BY 1 NOCYCLE;

create table member
(
    mem_no         number(10,0) not null,
    rsrch_no       number(10,0) null,
    username       varchar2(50) not null,
    password       varchar2(50) not null,
    name           varchar2(20) not null,
    email          varchar2(50) not null,
    birth          timestamp default current_timestamp,
    gender         char(1) not null,
    tel            varchar2(20) not null,
    addr           varchar2(100) not null,
    affil_type     varchar2(25) not null,
    affil_dept     varchar2(25) not null,
    position       varchar2(25) not null,
    status         varchar2(20) not null,
    created_at     timestamp default current_timestamp,
    updated_at     timestamp default current_timestamp,
    deleted_at     timestamp default current_timestamp,
    institution_no number(10,0) not null,
    constraint fk_member_institution_no foreign key (institution_no) references institution (institution_no)
);

alter table member
    add constraint pk_member
        primary key (mem_no);

-- role
create sequence seq_role START WITH 1 INCREMENT BY 1 NOCYCLE;

create table role
(
    role_no   number(10,0) not null,
    role_name varchar2(25) not null
);

alter table role
    add constraint pk_role
        primary key (role_no);

-- mem_role
create table mem_role
(
    mem_no     number(10,0) not null,
    role_no    number(10,0) not null,
    created_at timestamp default current_timestamp,
    constraint pk_mem_role primary key (mem_no, role_no),
    constraint fk_mem_role_mem_no foreign key (mem_no) references member (mem_no),
    constraint fk_mem_role_role_no foreign key (role_no) references role (role_no)
);

-- career
create sequence seq_career START WITH 1 INCREMENT BY 1 NOCYCLE;

create table career
(
    career_no   number(10,0) not null,
    org_name    varchar2(50) not null,
    dept_name   varchar2(25) not null,
    career_type varchar2(20) not null,
    started_at  timestamp default current_timestamp,
    ended_at    timestamp default current_timestamp,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp default current_timestamp,
    mem_no      number(10,0) not null,
    constraint fk_career_mem_no foreign key (mem_no) references member (mem_no)
);

alter table career
    add constraint pk_career
        primary key (career_no);

-- acad_ability
create sequence seq_acad_ability START WITH 1 INCREMENT BY 1 NOCYCLE;

create table acad_ability
(
    acad_ability_no   number(10,0) not null,
    ability_type      varchar2(20) not null,
    org_name          varchar2(50) not null,
    acquired_country  varchar2(25) not null,
    major_affiliation varchar2(50) not null,
    major_field       varchar2(50) not null,
    major_name        varchar2(50) not null,
    acquired_at       timestamp default current_timestamp,
    created_at        timestamp default current_timestamp,
    updated_at        timestamp default current_timestamp,
    mem_no            number(10,0) not null,
    constraint fk_acad_ability_mem_no foreign key (mem_no) references member (mem_no)
);

alter table acad_ability
    add constraint pk_acad_ability
        primary key (acad_ability_no);

-- tech_field
create sequence seq_tech_field START WITH 1 INCREMENT BY 1 NOCYCLE;

create table tech_field
(
    tech_field_no        number(10,0) not null,
    name                 varchar2(25) not null,
    code                 varchar2(25) not null,
    parent_tech_field_no number(10,0)
);

alter table tech_field
    add constraint pk_tech_field
        primary key (tech_field_no);

ALTER TABLE tech_field
    ADD CONSTRAINT fk_tech_field_parent
        FOREIGN KEY (parent_tech_field_no)
            REFERENCES tech_field (tech_field_no);

-- mem_tech_field

create table mem_tech_field
(
    mem_no        number(10,0) not null,
    tech_field_no number(10,0) not null,
    created_at    timestamp default current_timestamp,
    updated_at    timestamp default current_timestamp,
    constraint pk_mem_tech_field primary key (mem_no, tech_field_no),
    constraint fk_mem_tech_field_mem_no foreign key (mem_no) references member (mem_no),
    constraint fk_mem_tech_field_no foreign key (tech_field_no) references tech_field (tech_field_no)
);

-- rnd_plan
create sequence seq_rnd_plan START WITH 1 INCREMENT BY 1 NOCYCLE;

create table rnd_plan
(
    rnd_plan_no       number(10,0)   not null,
    rnd_task_no       varchar2(50)  not null,
    task_name         varchar2(255) not null,
    task_type         varchar2(50)  not null,
    rnd_institution   varchar2(50)  not null,
    curr_step         number(1,0)  not null,
    plan_status       varchar2(20)  not null,
    final_tgt_content clob null,
    rnd_content       clob null,
    perf_content      clob null,
    submitted_at      timestamp default current_timestamp,
    created_at        timestamp default current_timestamp,
    updated_at        timestamp default current_timestamp,
    sub_ann_no        number(10,0)   not null,
    constraint fk_rnd_plan_sub_ann_no foreign key (sub_ann_no) references sub_announcement (sub_ann_no),
    mem_no            number(10,0)   not null,
    constraint fk_rnd_plan_mem_no foreign key (mem_no) references member (mem_no),
    bucket_no         number(10,0)   not null,
    constraint fk_rnd_plan_bucket_no foreign key (bucket_no) references bucket (bucket_no)
);

alter table rnd_plan
    add constraint pk_rnd_plan
        primary key (rnd_plan_no);

-- researcher
create sequence seq_researcher START WITH 1 INCREMENT BY 1 NOCYCLE;

create table researcher
(
    rsrch_no      number(10,0)   not null,
    manpower_role varchar2(20) null,
    part_type     varchar2(20) null,
    rnd_plan_no   number(10,0)   not null,
    mem_no        number(10,0)   not null,
    constraint fk_researcher_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no),
    constraint fk_researcher_mem_no foreign key (mem_no) references member (mem_no)
);

alter table researcher
    add constraint pk_researcher
        primary key (rsrch_no);

-- rsrch_join_period
create sequence seq_rsrch_join_period START WITH 1 INCREMENT BY 1 NOCYCLE;

create table rsrch_join_period
(
    stage_no        number(10,0)   not null,
    year_no         number(10,0) not null,
    is_participated char(1) not null,
    started_at      timestamp default current_timestamp,
    ended_at        timestamp default current_timestamp,
    mxnth           number(2,0) null,
    rsrch_no        number(10,0) not null,
    constraint fk_rsrch_join_period_rsrch_no foreign key (rsrch_no) references researcher (rsrch_no)
);

alter table rsrch_join_period
    add constraint pk_rsrch_join_period
        primary key (stage_no, year_no);

-- rnd_field
create sequence seq_rnd_field START WITH 1 INCREMENT BY 1 NOCYCLE;

create table rnd_field
(
    rnd_field_no number(10,0)   not null,
    name         varchar2(50) not null,
    rank         number(1,0)  not null,
    weight       number(2,0)  not null,
    rnd_plan_no  number(10,0)   not null,
    constraint fk_rnd_field_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no)
);

alter table rnd_field
    add constraint pk_rnd_field
        primary key (rnd_field_no);

-- rnd_period
create sequence seq_rnd_period START WITH 1 INCREMENT BY 1 NOCYCLE;

create table rnd_period
(
    stage_no    number(10,0)   not null,
    year_no     number(10,0)   not null,
    started_at  timestamp default current_timestamp,
    ended_at    timestamp default current_timestamp,
    mxnth       int not null,
    rnd_plan_no number(10,0)   not null,
    constraint fk_rnd_period_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no)
);

alter table rnd_period
    add constraint pk_rnd_period
        primary key (stage_no, year_no);

-- stage_content
create sequence seq_stage_content START WITH 1 INCREMENT BY 1 NOCYCLE;

create table stage_content
(
    stage_no        number(10,0)   not null,
    stg_tgt_content clob not null,
    rnd_content     clob not null,
    expect_effect   clob not null,
    rnd_plan_no     number(10,0)   not null,
    constraint fk_stage_content_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no)
);

alter table stage_content
    add constraint pk_stage_content
        primary key (stage_no);

-- rnd_fee
create sequence seq_rnd_fee START WITH 1 INCREMENT BY 1 NOCYCLE;

create table rnd_fee
(
    stage_no           number(10,0)   not null,
    year_no            number(10,0)   not null,
    goverment_fund     number(10,0)   not null,
    rnd_charge         number(10,0)   not null,
    labor_cost         number(10,0)   not null,
    equip_cost         number(10,0)   not null,
    rnd_cost           number(10,0)  not null,
    research_cost      number(10,0)   not null,
    research_allowance number(10,0)  not null,
    rnd_plan_no        number(10,0)   not null,
    constraint fk_rnd_fee_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no)
);

alter table rnd_fee
    add constraint pk_rnd_fee
        primary key (stage_no, year_no);

-- progress_history
create sequence seq_progress_history START WITH 1 INCREMENT BY 1 NOCYCLE;

create table progress_history
(
    progress_history_no number(10,0)   not null,
    proc_status         varchar2(20) not null,
    processor           varchar2(20) not null,
    note                varchar2(100) null,
    rnd_plan_no         number(10,0)   not null,
    constraint fk_progress_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no)
);

alter table progress_history
    add constraint pk_progress_history
        primary key (progress_history_no);

-- evaluation_table
create sequence seq_evaluation_table START WITH 1 INCREMENT BY 1 NOCYCLE;

create table evaluation_table
(
    evaluation_table_no number(10,0) not null,
    title               varchar2(255) not null,
    description         varchar2(255) not null,
    form_type           varchar2(100) not null,
    created_at          timestamp default current_timestamp,
    updated_at          timestamp default current_timestamp,
    tech_field_no       number(10,0),
    constraint fk_evaluation_tech_field_no foreign key (tech_field_no) references tech_field (tech_field_no)
);

alter table evaluation_table
    add constraint pk_evaluation_table
        primary key (evaluation_table_no);

-- question
create sequence seq_question START WITH 1 INCREMENT BY 1 NOCYCLE;

create table question
(
    question_no number(10,0) not null,
    type        varchar2(100) not null,
    content     varchar2(255) not null,
    created_at  timestamp default current_timestamp
);

alter table question
    add constraint pk_question
        primary key (question_no);

-- evaluation_question
create sequence seq_evaluation_question START WITH 1 INCREMENT BY 1 NOCYCLE;

create table evaluation_question
(
    evaluation_table_no number(10,0) not null,
    question_no         number(10,0) not null,
    constraint pk_evaluation_question primary key (evaluation_table_no, question_no),
    constraint fk_eval_qu_evaluation_table_no foreign key (evaluation_table_no) references evaluation_table (evaluation_table_no),
    constraint fk_eval_qu_question_no foreign key (question_no) references question (question_no)
);

-- annocement_question
create sequence seq_annocement_evaluation START WITH 1 INCREMENT BY 1 NOCYCLE;

create table annocement_evaluation
(
    evaluation_table_no number(10,0) not null,
    sub_ann_no          number(10,0) not null,
    constraint pk_announcement_evaluation primary key (evaluation_table_no, sub_ann_no),
    constraint fk_ann_que_evaluation_table_no foreign key (evaluation_table_no) references evaluation_table (evaluation_table_no),
    constraint fk_ann_que_sub_ann_no foreign key (sub_ann_no) references sub_announcement (sub_ann_no)
);

-- eval_committee
create sequence seq_eval_committee START WITH 1 INCREMENT BY 1 NOCYCLE;

create table eval_committee
(
    eval_committee_no number(10,0) not null,
    name              varchar2(20) not null,
    people_count      number(2,0) not null,
    eval_started_at   timestamp default current_timestamp,
    eval_closed_at    timestamp default current_timestamp,
    prog_status       varchar2(20) not null,
    created_at        timestamp default current_timestamp,
    updated_at        timestamp default current_timestamp,
    sub_ann_no        number(10,0),
    constraint fk_eval_committee_sub_ann_no foreign key (sub_ann_no) references sub_announcement (sub_ann_no)
);

alter table eval_committee
    add constraint pk_eval_committee
        primary key (eval_committee_no);

-- eval_task
create sequence seq_eval_task START WITH 1 INCREMENT BY 1 NOCYCLE;

create table eval_task
(
    eval_committee_no number(10,0) not null,
    rnd_plan_no       number(10,0) not null,
    mem_no            number(10,0) not null,
    total_score       number(3,0) not null,
    eval_completed_at timestamp default current_timestamp,
    final_selected_at timestamp default current_timestamp,
    eval_status       varchar2(20) null,
    constraint pk_eval_task primary key (eval_committee_no, rnd_plan_no, mem_no),
    constraint fk_eval_task_committee_no foreign key (eval_committee_no) references eval_committee (eval_committee_no),
    constraint fk_eval_task_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no),
    constraint fk_eval_task_mem_no foreign key (mem_no) references member (mem_no)
);

-- evaluation_member
create sequence seq_evaluation_member START WITH 1 INCREMENT BY 1 NOCYCLE;

create table evaluation_member
(
    eval_committee_no number(10,0) not null,
    mem_no            number(10,0) not null,
    recv_start_at     timestamp default current_timestamp,
    recv_close_at     timestamp default current_timestamp,
    recv_status       varchar2(20) null,
    constraint pk_eval_member primary key (eval_committee_no, mem_no),
    constraint fk_eval_member_eval_no foreign key (eval_committee_no) references eval_committee (eval_committee_no),
    constraint fk_eval_member_mem_no foreign key (mem_no) references member (mem_no)
);

-- eval_score
create sequence seq_eval_score START WITH 1 INCREMENT BY 1 NOCYCLE;

create table eval_score
(
    eval_score_no       number(10,0) not null,
    score               number(10,0) not null,
    eval_committee_no   number(10,0) not null,
    rnd_plan_no         number(10,0) not null,
    mem_no              number(10,0) not null,
    evaluation_table_no number(10,0) not null,
    question_no         number(10,0) not null,
    constraint fk_eval_score_eval_no foreign key (eval_committee_no) references eval_committee (eval_committee_no),
    constraint fk_eval_score_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no),
    constraint fk_eval_score_mem_no foreign key (mem_no) references member (mem_no),
    constraint fk_eval_score_evall_no foreign key (evaluation_table_no) references evaluation_table (evaluation_table_no),
    constraint fk_eval_score_quest_no foreign key (question_no) references question (question_no)
);

-- notification
create sequence seq_noti START WITH 1 INCREMENT BY 1 NOCYCLE;

create table noti
(
    notification_no   number(10,0) not null,
    type              varchar2(25) not null,
    content           varchar2(100) not null,
    created_at        timestamp default current_timestamp,
    updated_at        timestamp default current_timestamp,
    eval_committee_no number(10,0) not null,
    mem_no            number(10,0) not null,
    rnd_plan_no       number(10,0) not null,
    constraint fk_noti_eno foreign key (eval_committee_no) references eval_committee (eval_committee_no),
    constraint fk_noti_mno foreign key (mem_no) references member (mem_no),
    constraint fk_noti_rno foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no)
);

alter table noti
    add constraint pk_notification
        primary key (notification_no);

-- opinion
create sequence seq_opinion START WITH 1 INCREMENT BY 1 NOCYCLE;

create table opinion
(
    opinion_no        number(10,0) not null,
    depth             number(1,0) not null,
    created_at        timestamp default current_timestamp,
    deleted_at        timestamp default current_timestamp,
    eval_committee_no number(10,0) null,
    rnd_plan_no       number(10,0) not null,
    mem_no            number(10,0) not null,
    bucket_no         number(10,0) not null,
    parent_opinion_no number(10,0) not null,
    constraint fk_opinion_eval_committee_no foreign key (eval_committee_no) references eval_committee (eval_committee_no),
    constraint fk_opinion_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no),
    constraint fk_opinion_mem_no foreign key (mem_no) references member (mem_no),
    constraint fk_opinion_bucket_no foreign key (bucket_no) references bucket (bucket_no)
);

alter table opinion
    add constraint pk_opinion
        primary key (opinion_no);

ALTER TABLE opinion
    ADD CONSTRAINT fk_opinion_no_parent
        FOREIGN KEY (parent_opinion_no)
            REFERENCES opinion (opinion_no);



-- 더미 예제

--  회원

INSERT INTO institution (institution_no, name, business_register_no, address, company_type, iar_type)
VALUES (NEXT VALUE FOR seq_institution, '서울대학교', '123-45-67890', '서울특별시 관악구 관악로', '대학교', '교육기관');

INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, NULL, 'user01', 'password123', '홍길동', 'hong@example.com',
             current_timestamp, 'M', '010-1234-5678', '서울특별시 강남구 테헤란로',
             '연구기관', '컴퓨터공학과', '연구원', '활성', current_timestamp, current_timestamp, NULL, 1);

INSERT INTO acad_ability (acad_ability_no, ability_type, org_name, acquired_country, major_affiliation,
                          major_field, major_name, acquired_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_acad_ability, '학사', '서울대학교', '대한민국', '공학계열',
             '컴퓨터공학', '소프트웨어공학', current_timestamp, current_timestamp, current_timestamp, 1);

INSERT INTO acad_ability (acad_ability_no, ability_type, org_name, acquired_country, major_affiliation,
                          major_field, major_name, acquired_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_acad_ability, '석사', '카이스트', '대한민국', '공학계열',
             '전자공학', '반도체공학', current_timestamp, current_timestamp, current_timestamp, 1);

INSERT INTO career (career_no, org_name, dept_name, career_type, started_at, ended_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_career, '삼성전자', '개발팀', '정규직', current_timestamp, current_timestamp, current_timestamp,
             current_timestamp, 1);

INSERT INTO career (career_no, org_name, dept_name, career_type, started_at, ended_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_career, 'LG화학', '연구소', '계약직', current_timestamp, current_timestamp, current_timestamp,
             current_timestamp, 1);

INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (1, '생명과학', 'LA', NULL);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (2, '분자세포생물학', 'LA01', 1);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (3, '신호전달', 'LA0101', 2);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (4, '세포구조/운동', 'LA0102', 2);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (5, '세포분화/사멸', 'LA0103', 2);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (6, '막 생물학', 'LA0104', 2);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (7, '유전자 발현조절', 'LA0105', 2);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (8, '달리 분류되지 않는 분자세포 생물학', 'LA0199', 2);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (9, '유전학·유전체학', 'LA02', 1);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (10, '분자유전학', 'LA0201', 9);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (11, '세포유전학', 'LA0202', 9);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (12, '집단유전학', 'LA0203', 9);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (13, '유전체학', 'LA0204', 9);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (14, '형질전환 생물모델', 'LA0205', 9);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (15, '유전자 편집·치료', 'LA0206', 9);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (16, '기능유전체학', 'LA0207', 9);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (17, '후성유전체학', 'LA0208', 9);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (18, '메타유전체학', 'LA0209', 9);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (19, '달리 분류되지 않는 유전학·유전체학', 'LA0299', 9);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (20, '발생/신경생물학', 'LA03', 1);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (21, '배아발생/기관형성', 'LA0301', 20);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (22, '내분비생물학', 'LA0302', 20);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (23, '생식생물학', 'LA0303', 20);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (24, '신경 생화학/생리학', 'LA0304', 20);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (25, '신경질환생물학', 'LA0305', 20);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (26, '줄기세포생물학', 'LA0306', 20);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (27, '달리 분류되지 않는 발생/신경생물학', 'LA0399', 20);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (28, '면역학/생리학', 'LA04', 1);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (29, '면역계 발생/기능', 'LA0401', 28);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (30, '선천성 면역', 'LA0402', 28);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (31, '세포성/체액성 면역', 'LA0403', 28);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (32, '세포생리학', 'LA0404', 28);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (33, '전기생리학', 'LA0405', 28);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (34, '달리 분류되지 않는 면역학/생리학', 'LA0499', 28);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (35, '분류/생태/환경생물학', 'LA05', 1);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (36, '계통분류학', 'LA0501', 35);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (37, '진화학', 'LA0502', 35);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (38, '생태학', 'LA0503', 35);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (39, '환경생물학', 'LA0504', 35);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (40, '행동생물학', 'LA0505', 35);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (41, '생물자원/다양성', 'LA0506', 35);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (42, '달리 분류되지 않는 분류/생태/환경생물학', 'LA0599', 35);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (43, '생화학/구조생물학', 'LA06', 1);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (44, '단백질 구조와 기능', 'LA0601', 43);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (45, '핵산 생화학', 'LA0602', 43);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (46, '단백질체학', 'LA0603', 43);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (47, '당생물학', 'LA0604', 43);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (48, '지질생화학', 'LA0605', 43);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (49, '구조생물학', 'LA0606', 43);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (50, '달리 분류되지 않는 생화학/ 구조 생물학', 'LA0699', 43);

INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (51, '수학', 'nan', NULL);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (52, '기타 수학', 'NA99', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (53, '기하학', 'NA04', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (54, '대수학', 'NA01', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (55, '위상수학', 'NA03', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (56, '응용수학', 'NA05', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (57, '응용통계', 'NA09', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (58, '이산/정보수학', 'NA06', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (59, '통계 방법론·계산', 'NA08', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (60, '통계이론', 'NA07', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (61, '해석학', 'NA02', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (62, '확률/확률과정', 'NA10', 51);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (63, '결합환', 'NA0106', 54);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (64, '경제/경영통계', 'NA0902', 57);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (65, '계산수학', 'NA0510', 56);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (66, '고전/일반기하', 'NA0401', 53);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (67, '고전/조화해석', 'NA0201', 61);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (68, '공업통계', 'NA0906', 57);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (69, '과학/공학의 수학적 방법론', 'NA0504', 56);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (70, '군/표현', 'NA0104', 54);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (71, '금융/보험통계', 'NA0903', 57);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (72, '금융수학', 'NA0505', 56);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (73, '기하위상수학/미분위상수학', 'NA0303', 55);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (74, '다변량통계', 'NA0803', 59);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (75, '달리 분류되지 않는 기하학', 'NA0499', 53);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (76, '달리 분류되지 않는 대수학', 'NA0199', 54);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (77, '달리 분류되지 않는 수학', 'NA9999', 52);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (78, '달리 분류되지 않는 위상수학', 'NA0399', 55);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (79, '달리 분류되지 않는 응용수학', 'NA0599', 56);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (80, '달리 분류되지 않는 응용통계', 'NA0999', 57);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (81, '달리 분류되지 않는 이산/정보수학', 'NA0699', 58);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (82, '달리 분류되지 않는 통계 방법론·계산', 'NA0899', 59);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (83, '달리 분류되지 않는 통계이론', 'NA0799', 60);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (84, '달리 분류되지 않는 해석학', 'NA0299', 61);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (85, '달리 분류되지 않는 확률/확률과정', 'NA1099', 62);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (86, '대수기하/가환환', 'NA0105', 54);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (87, '대수적위상수학', 'NA0302', 55);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (88, '대역해석학/다양체위의 해석학', 'NA0207', 61);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (89, '동력계/상미분방정식', 'NA0205', 61);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (90, '리군/위상군', 'NA0304', 55);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (91, '리대수/비결합환', 'NA0107', 54);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (92, '모수추론', 'NA0701', 60);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (93, '미분기하', 'NA0403', 53);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (94, '바이오수학', 'NA0506', 56);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (95, '베이지안추론', 'NA0703', 60);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (96, '변분론/비선형해석', 'NA0204', 61);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (97, '보험수학', 'NA0509', 56);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (98, '복소기하', 'NA0404', 53);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (99, '복소해석', 'NA0202', 61);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (100, '볼록기하/이산기하', 'NA0402', 53);

INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (101, '물리학', 'NB', NULL);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (102, '광학·양자전자학', 'NB05', 101);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (103, '기타 물리학', 'NB99', 101);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (104, '복합물리', 'NB09', 101);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (105, '원자/분자물리', 'NB07', 101);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (106, '유체·플라즈마물리', 'NB04', 101);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (107, '응집물질물리', 'NB06', 101);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (108, '입자/장물리', 'NB01', 101);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (109, '천체물리', 'NB08', 101);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (110, '통계물리', 'NB02', 101);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (111, '핵물리', 'NB03', 101);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (112, 'X선 광학', 'NB0510', 102);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (113, '가속기/충돌 물리', 'NB0105', 108);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (114, '강입자 물리', 'NB0303', 111);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (115, '고에너지 중이온 반응', 'NB0304', 111);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (116, '고에너지천체', 'NB0806', 109);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (117, '광자학', 'NB0505', 102);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (118, '기하/파동 광학', 'NB0507', 102);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (119, '나노 광학', 'NB0509', 102);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (120, '나노구조/나노소자', 'NB0617', 107);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (121, '달리 분류되지 않는 광학·양자전자학', 'NB0599', 102);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (122, '달리 분류되지 않는 물리학', 'NB9999', 103);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (123, '달리 분류되지 않는 복합물리', 'NB0999', 104);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (124, '달리 분류되지 않는 원자/분자물리', 'NB0799', 105);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (125, '달리 분류되지 않는 유체·플라즈마물리', 'NB0499', 106);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (126, '달리 분류되지 않는 응집물질물리', 'NB0699', 107);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (127, '달리 분류되지 않는 입자/장물리', 'NB0199', 108);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (128, '달리 분류되지 않는 천체물리', 'NB0899', 109);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (129, '달리 분류되지 않는 통계물리', 'NB0299', 110);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (130, '달리 분류되지 않는 핵물리', 'NB0399', 111);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (131, '디스플레이 광학', 'NB0508', 102);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (132, '레이저광학', 'NB0503', 102);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (133, '무른물질/유기물질', 'NB0612', 107);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (134, '무질서계', 'NB0202', 110);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (135, '반도체', 'NB0607', 107);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (136, '복잡계', 'NB0204', 110);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (137, '분광학', 'NB0501', 102);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (138, '분자물리학', 'NB0702', 105);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (139, '비선형 동력학', 'NB0203', 110);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (140, '비선형광학', 'NB0504', 102);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (141, '생물물리', 'NB0901', 104);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (142, '양자광학', 'NB0502', 102);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (143, '양자정보', 'NB0703', 105);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (144, '원자물리학', 'NB0701', 105);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (145, '원자핵 데이터', 'NB0305', 111);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (146, '유전체/강유전체', 'NB0609', 107);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (147, '유체운동/수송론', 'NB0402', 106);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (148, '음향학', 'NB0905', 104);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (149, '응집물성 측정법', 'NB0614', 107);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (150, '응집물질 계산과학', 'NB0602', 107);

INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (151, '화학', 'NC', NULL);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (152, '고분자화학', 'NC05', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (153, '광화학', 'NC07', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (154, '기타 화학', 'NC99', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (155, '무기화학', 'NC03', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (156, '물리화학', 'NC01', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (157, '분석화학', 'NC04', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (158, '생화학', 'NC06', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (159, '유기화학', 'NC02', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (160, '융합화학', 'NC10', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (161, '재료화학', 'NC09', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (162, '전기화학', 'NC08', 151);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (163, '계산화학', 'NC1005', 160);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (164, '고분자 구조/물성', 'NC0502', 152);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (165, '고분자 물리화학', 'NC0503', 152);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (166, '고분자 합성', 'NC0501', 152);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (167, '고분자광화학', 'NC0704', 153);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (168, '고분자재료화학', 'NC0905', 161);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (169, '고체무기화학/결정학', 'NC0305', 155);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (170, '고체물리화학', 'NC0106', 156);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (171, '고효율 생리활성 검색', 'NC1007', 160);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (172, '광소재화학', 'NC0706', 153);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (173, '구조분석화학', 'NC0404', 157);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (174, '구조생화학', 'NC0605', 158);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (175, '기능성 고분자', 'NC0506', 152);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (176, '나노광화학', 'NC0907', 161);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (177, '나노재료화학', 'NC0901', 161);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (178, '단백질/효소분자 생화학', 'NC0602', 158);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (179, '단백질체학', 'NC0608', 158);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (180, '달리 분류되지 않는 고분자화학', 'NC0599', 152);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (181, '달리 분류되지 않는 광화학', 'NC0799', 153);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (182, '달리 분류되지 않는 무기화학', 'NC0399', 155);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (183, '달리 분류되지 않는 물리화학', 'NC0199', 156);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (184, '달리 분류되지 않는 분석화학', 'NC0499', 157);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (185, '달리 분류되지 않는 생화학', 'NC0699', 158);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (186, '달리 분류되지 않는 유기화학', 'NC0299', 159);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (187, '달리 분류되지 않는 융합화학', 'NC1099', 160);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (188, '달리 분류되지 않는 재료화학', 'NC0999', 161);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (189, '달리 분류되지 않는 전기화학', 'NC0899', 162);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (190, '달리 분류되지 않는 화학', 'NC9999', 154);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (191, '대사분자 생화학', 'NC0606', 158);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (192, '마이크로칩 화학분석', 'NC0409', 157);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (193, '무기광화학', 'NC0702', 153);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (194, '무기소재화학', 'NC0306', 155);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (195, '무기의약화학', 'NC0308', 155);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (196, '무기재료화학', 'NC0904', 161);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (197, '무기초분자화학', 'NC0302', 155);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (198, '물리광화학', 'NC0705', 153);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (199, '물리전기화학', 'NC0801', 162);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (200, '바이오재료화학', 'NC0906', 161);

INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (201, '지구과학(지구/대기/해양/천문)', 'ND', NULL);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (202, '극지과학', 'ND11', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (203, '기상과학', 'ND05', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (204, '기타 지구과학', 'ND99', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (205, '기후과학', 'ND06', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (206, '대기과학', 'ND04', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (207, '우주과학', 'ND13', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (208, '자연재해 분석/예측', 'ND07', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (209, '지구물리학', 'ND02', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (210, '지구화학', 'ND03', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (211, '지질과학', 'ND01', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (212, '천문우주관측기술', 'ND14', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (213, '천문학', 'ND12', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (214, '해양과학', 'ND08', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (215, '해양생명', 'ND10', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (216, '해양자원', 'ND09', 201);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (217, '가뭄재해발생 분석/예측', 'ND0710', 208);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (218, '고기후학', 'ND0605', 205);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (219, '고에너지복사 관측기술', 'ND1404', 212);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (220, '고에너지천문학', 'ND1207', 213);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (221, '고천문학/천문역법', 'ND1209', 213);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (222, '고층대기', 'ND0407', 206);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (223, '고해양학', 'ND0805', 214);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (224, '광물학', 'ND0101', 211);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (225, '광상/자원지질학', 'ND0103', 211);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (226, '광학천문기술', 'ND1401', 212);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (227, '구조지질학', 'ND0104', 211);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (228, '극지 광물자원 탐사', 'ND1105', 202);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (229, '극지 생물자원 탐사/수집/활용', 'ND1104', 202);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (230, '극지 생태계 모니터링', 'ND1106', 202);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (231, '극지 인프라구축 및 활용', 'ND1110', 202);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (232, '극지 저온생물학/적응생리', 'ND1109', 202);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (233, '극지 해양', 'ND1107', 202);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (234, '극지환경감시/극지 생지화학 순환', 'ND1103', 202);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (235, '기상관측/분석기술', 'ND0501', 203);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (236, '기상예보기술', 'ND0503', 203);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (237, '기상원격탐사기술', 'ND0502', 203);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (238, '기상재해 분석/예측', 'ND0701', 208);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (239, '기상조절', 'ND0504', 203);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (240, '기후모델링/예측기술', 'ND0603', 205);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (241, '기후변화영향평가/대응기술', 'ND0604', 205);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (242, '기후시스템 관측/분석기술', 'ND0601', 205);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (243, '기후역학', 'ND0602', 205);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (244, '농업기상', 'ND0506', 203);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (245, '달리 분류되지 않는 극지과학', 'ND1199', 202);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (246, '달리 분류되지 않는 기상과학', 'ND0599', 203);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (247, '달리 분류되지 않는 기후과학', 'ND0699', 205);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (248, '달리 분류되지 않는 대기과학', 'ND0499', 206);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (249, '달리 분류되지 않는 우주과학', 'ND1399', 207);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (250, '달리 분류되지 않는 자연재해 분석/예측', 'ND0799', 208);

INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (251, '농림수산식품', 'LB', NULL);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (252, '기타 농림수산식품', 'LB99', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (253, '농림수산식품경영/정보 등', 'LB20', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (254, '농생물학', 'LB03', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (255, '농수축산물 품질·안전 관리', 'LB16', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (256, '농업·식품 기계·설비', 'LB08', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (257, '농업인프라 공학', 'LB09', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (258, '농업환경생태', 'LB05', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (259, '농화학', 'LB04', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (260, '동물자원과학', 'LB06', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (261, '산림자원학', 'LB10', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (262, '수산양식', 'LB13', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (263, '수산자원/어장환경', 'LB14', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (264, '수의과학', 'LB07', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (265, '식량작물과학', 'LB01', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (266, '식품과학', 'LB17', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (267, '식품영양과학', 'LB18', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (268, '식품조리/외식/식생활개선', 'LB19', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (269, '어업생산/이용가공', 'LB15', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (270, '원예특용작물과학', 'LB02', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (271, '임산공학', 'LB12', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (272, '조경학', 'LB11', 251);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (273, '곤충 분류/동정/생태', 'LB0305', 254);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (274, '곤충 생리/병리/활용', 'LB0306', 254);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (275, '곤충 생명공학', 'LB0307', 254);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (276, '공예/사료/녹비작물', 'LB0107', 265);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (277, '급식/외식상품개발', 'LB1904', 268);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (278, '기능성식품', 'LB1801', 267);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (279, '농림수산식품 경영/경제', 'LB2001', 253);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (280, '농림수산식품 유통', 'LB2002', 253);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (281, '농림수산식품 정보', 'LB2003', 253);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (282, '농산물 위생/품질관리', 'LB1601', 255);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (283, '농어업/농어촌 정책', 'LB2006', 253);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (284, '농업 금융/보험', 'LB2004', 253);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (285, '농업 생태', 'LB0503', 258);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (286, '농업 시설', 'LB0901', 257);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (287, '농업 환경정화', 'LB0504', 258);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (288, '농업·식품 동력·에너지', 'LB0802', 256);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (289, '농업·식품 생산 기계', 'LB0801', 256);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (290, '농업·식품 생산 시설·환경', 'LB0805', 256);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (291, '농업·식품 생산 자동화·로봇', 'LB0804', 256);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (292, '농업기상', 'LB0505', 258);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (293, '농업미생물', 'LB0302', 254);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (294, '농업수자원/수문학', 'LB0903', 257);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (295, '농업자원 순환/활용', 'LB0507', 258);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (296, '농지 공학', 'LB0902', 257);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (297, '농촌 계획 공학', 'LB0905', 257);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (298, '농촌 사회/문화', 'LB2005', 253);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (299, '농촌 환경 공학', 'LB0904', 257);
INSERT INTO tech_field (tech_field_no, name, code, parent_tech_field_no)
VALUES (300, '농축산물 가공/품질 계측', 'LB0803', 256);

INSERT INTO mem_tech_field(mem_no, tech_field_no, created_at, updated_at)
VALUES (1, 15, current_timestamp, current_timestamp);
INSERT INTO mem_tech_field(mem_no, tech_field_no, created_at, updated_at)
VALUES (1, 58, current_timestamp, current_timestamp);
INSERT INTO mem_tech_field(mem_no, tech_field_no, created_at, updated_at)
VALUES (1, 158, current_timestamp, current_timestamp);