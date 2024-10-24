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
    source           varchar2(255) not null,
    source_number    number(10,0) not null,
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
    ann_no              number(10,0) not null,
    total_ann_no        varchar2(100) not null,
    total_title         varchar2(255) not null,
    content             CLOB not null,
    competent_ministry  varchar2(255) not null,
    spec_institution    varchar2(100) not null,
    ann_tech_field_name varchar2(20) not null,
    ann_type            varchar2(50) not null,
    sub_ann_count       number(2,0) not null,
    reception_type      varchar2(50) not null,
    status              varchar2(20) not null,
    started_at          timestamp default current_timestamp,
    closed_at           timestamp default current_timestamp,
    created_at          timestamp default current_timestamp,
    updated_at          timestamp default current_timestamp,
    bucket_no           number(10,0)  not null,
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
    task_type           varchar2(50) not null,
    spec_institution_no varchar2(50) not null,
    tech_field_name     varchar2(100) not null,
    mgr_name            varchar2(20) not null,
    mgr_tel             varchar2(20) not null,
    planning_year       number(4,0) not null,
    total_subsidy       number(10,0)  not null,
    total_dev_month     number(2,0)  not null,
    one_year_subsidy    number(10,0) not null,
    one_year_dev_month  number(2,0) not null,
    perf_owner          varchar2(50) not null,
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
    institution_no number(10,0) null,
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
    type                 varchar2(10) not null,
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
    rnd_institution   varchar2(50)  null,
    curr_step         number(1,0)  not null,
    plan_status       varchar2(20)  not null,
    final_tgt_content clob null,
    rnd_content       clob null,
    perf_content      clob null,
    submitted_at      timestamp null,
    created_at        timestamp default current_timestamp,
    updated_at        timestamp null,
    sub_ann_no        number(10,0)   not null,
    constraint fk_rnd_plan_sub_ann_no foreign key (sub_ann_no) references sub_announcement (sub_ann_no),
    mem_no            number(10,0)   not null,
    constraint fk_rnd_plan_mem_no foreign key (mem_no) references member (mem_no),
    bucket_no         number(10,0)   null,
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
    weight       number(3,0)  not null,
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
    recv_status       varchar2(20) not null,
    recv_status_eng   varchar2(20) not null,
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
    notification_no number(10,0) not null,
    content         varchar2(100) not null,
    created_at      timestamp default current_timestamp,
    deleted_at      timestamp default null,
    noti_content_no number(10,0) null,
    noti_type       varchar2(25) null,
    read_state      varchar2(25) not null,
    data_category   varchar2(25) not null,
    mem_no          number(10,0) not null,
    constraint fk_noti_mno foreign key (mem_no) references member (mem_no)
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
-- 교육기관 (20개)
INSERT INTO institution (institution_no, name, business_register_no, address, company_type, iar_type)
VALUES (NEXT VALUE FOR seq_institution, '서울대학교', '123-45-67890', '서울특별시 관악구 관악로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '연세대학교', '234-56-78901', '서울특별시 서대문구 연세로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '고려대학교', '345-67-89012', '서울특별시 성북구 안암로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '부산대학교', '456-78-90123', '부산광역시 금정구 부산대학로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '성균관대학교', '567-89-01234', '서울특별시 종로구 성균관로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '경희대학교', '678-90-12345', '서울특별시 동대문구 경희대로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '중앙대학교', '789-01-23456', '서울특별시 동작구 흑석로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '서강대학교', '890-12-34567', '서울특별시 마포구 서강로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '이화여자대학교', '901-23-45678', '서울특별시 서대문구 이화여대길', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '한국외국어대학교', '012-34-56789', '서울특별시 동대문구 이문로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '서울과학기술대학교', '123-45-67891', '서울특별시 노원구 공릉로', '대학(4년미만)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '충남대학교', '234-56-78912', '대전광역시 유성구 대학로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '전남대학교', '345-67-89023', '광주광역시 북구 용봉로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '제주대학교', '456-78-90134', '제주특별자치도 제주시 제주대학로', '대학(4년이상)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '서울예술대학교', '567-89-01245', '경기도 안산시 단원구 예술대학로', '대학(4년미만)', '교육기관'),
       (NEXT VALUE FOR seq_institution, '대전고등학교', '678-90-12356', '대전광역시 중구 문화로', '초중고교', '교육기관'),
       (NEXT VALUE FOR seq_institution, '부산여자중학교', '789-01-23467', '부산광역시 수영구 무학로', '초중고교', '교육기관'),
       (NEXT VALUE FOR seq_institution, '서울고등학교', '890-12-34578', '서울특별시 강남구 도산대로', '초중고교', '교육기관'),
       (NEXT VALUE FOR seq_institution, '부산외국어대학교', '901-23-45689', '부산광역시 금정구 부산외대길', '외국대학', '교육기관'),
       (NEXT VALUE FOR seq_institution, '외국대학교', '012-34-56790', '서울특별시 중구 퇴계로', '외국대학', '교육기관');

-- 산업체 (20개)
INSERT INTO institution (institution_no, name, business_register_no, address, company_type, iar_type)
VALUES (NEXT VALUE FOR seq_institution, '삼성전자', '111-11-11111', '서울특별시 강남구 테헤란로', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '현대자동차', '222-22-22222', '서울특별시 서초구 헌릉로', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, 'LG전자', '333-33-33333', '서울특별시 강서구 마곡동', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, 'SK하이닉스', '444-44-44444', '경기도 이천시 부발읍', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '포스코', '555-55-55555', '경상북도 포항시 남구', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '현대중공업', '666-66-66666', '울산광역시 동구 방어진순환도로', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, 'KT', '777-77-77777', '서울특별시 종로구 종로', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '한화그룹', '888-88-88888', '서울특별시 중구 청계천로', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '네이버', '999-99-99999', '경기도 성남시 분당구 불정로', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '카카오', '000-00-00000', '경기도 성남시 분당구 판교로', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '코오롱', '111-22-33333', '서울특별시 강서구 마곡동', '중견기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '한전KPS', '222-33-44444', '전라남도 나주시 빛가람동', '공기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '두산중공업', '333-44-55555', '경상남도 창원시 성산구', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '오뚜기', '444-55-66666', '서울특별시 용산구 한강대로', '중견기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '대상', '555-66-77777', '서울특별시 동작구 상도동', '중견기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '남양유업', '666-77-88888', '서울특별시 강남구 테헤란로', '중견기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '삼양사', '777-88-99999', '서울특별시 중구 충무로', '중견기업', '산업체'),
       (NEXT VALUE FOR seq_institution, 'LG화학', '888-99-00000', '서울특별시 영등포구 여의도동', '대기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '한미약품', '999-00-11111', '경기도 화성시 향남읍', '중견기업', '산업체'),
       (NEXT VALUE FOR seq_institution, '대한항공', '000-11-22222', '서울특별시 강서구 방화동', '대기업', '산업체');
-- 연구기관 (20개)
INSERT INTO institution (institution_no, name, business_register_no, address, company_type, iar_type)
VALUES (NEXT VALUE FOR seq_institution, '한국전자통신연구원', '222-33-44455', '대전광역시 유성구 가정북로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국생명공학연구원', '333-44-55566', '대전광역시 유성구 과학로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국항공우주연구원', '444-55-66677', '대전광역시 유성구 과학로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국원자력연구원', '555-66-77788', '대전광역시 유성구 대덕대로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국기계연구원', '666-77-88899', '대전광역시 유성구 가정로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국화학연구원', '777-88-99900', '대전광역시 유성구 대학로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국에너지기술연구원', '888-99-00011', '대전광역시 유성구 가정로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국표준과학연구원', '999-00-11122', '대전광역시 유성구 연구원로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국지질자원연구원', '000-11-22233', '대전광역시 유성구 과학로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국건설기술연구원', '111-22-33344', '경기도 고양시 일산서구 고봉로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국교통연구원', '222-33-44455', '세종특별자치시 시청대로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국해양과학기술원', '333-44-55566', '부산광역시 영도구 태종로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국천문연구원', '444-55-66677', '대전광역시 유성구 대덕대로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '한국전력연구원', '555-66-77788', '대전광역시 유성구 유성대로', '공기업', '연구기관'),
       (NEXT VALUE FOR seq_institution, '국방과학연구소', '666-77-88899', '대전광역시 유성구 자운로', '정부출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '서울시립과학기술연구원', '777-88-99900', '서울특별시 마포구 성산로', '지자체출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '경기도경제과학진흥원', '888-99-00011', '경기도 수원시 영통구 광교로', '지자체출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '부산테크노파크', '999-00-11122', '부산광역시 해운대구 센텀동로', '지자체출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '대구테크노파크', '000-11-22233', '대구광역시 동구 동대구로', '지자체출연연', '연구기관'),
       (NEXT VALUE FOR seq_institution, '광주과학기술원', '111-22-33344', '광주광역시 북구 첨단과기로', '정부출연연', '연구기관');

INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '7584777809', 'user1', 'password123', '구동현', 'nojeongsu@live.com',
             '1990-06-20', 'F', '063-759-1080', '서울특별시 시 테헤란로',
             '등록기관', '개발2팀', '부장', '활성', current_timestamp, NULL, NULL, 1);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '9881902842', 'user2', 'password123', '김건우', 'bha@gimbag.com',
             '1971-12-13', 'M', '018-497-2538', '서울특별시 시 테헤란로',
             '등록기관', '개발3팀', '부장', '활성', current_timestamp, NULL, NULL, 2);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '9204174681', 'user3', 'password123', '박상철', 'coesangho@yuhanhoesa.com',
             '1982-05-01', 'F', '02-9942-8928', '서울특별시 시 테헤란로',
             '등록기관', '개발4팀', '부장', '활성', current_timestamp, NULL, NULL, 3);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '4570331970', 'user4', 'password123', '양경자', 'seongmini@gimii.kr',
             '1964-02-08', 'M', '063-249-9587', '서울특별시 시 테헤란로',
             '등록기관', '개발1팀', '부장', '활성', current_timestamp, NULL, NULL, 4);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '3035889783', 'user5', 'password123', '이지후', 'junho82@jusighoesa.kr',
             '1984-09-27', 'F', '052-714-4961', '서울특별시 시 테헤란로',
             '등록기관', '개발2팀', '부장', '활성', current_timestamp, NULL, NULL, 5);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '9122548285', 'user6', 'password123', '김춘자', 'hbag@nate.com',
             '1983-11-12', 'M', '054-689-0399', '서울특별시 시 테헤란로',
             '등록기관', '개발3팀', '부장', '활성', current_timestamp, NULL, NULL, 6);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '1008881602', 'user7', 'password123', '이채원', 'ujingim@yu.com',
             '1993-02-10', 'F', '054-430-9690', '서울특별시 시 테헤란로',
             '등록기관', '개발4팀', '부장', '활성', current_timestamp, NULL, NULL, 7);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '2255511508', 'user8', 'password123', '김종수', 'gwangsu93@yuhanhoesa.com',
             '1984-04-17', 'M', '011-185-5728', '서울특별시 시 테헤란로',
             '등록기관', '개발1팀', '부장', '활성', current_timestamp, NULL, NULL, 8);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '4650288307', 'user9', 'password123', '김은서', 'sanghunbag@ian.kr',
             '1969-01-14', 'M', '010-6865-9427', '서울특별시 시 테헤란로',
             '등록기관', '개발2팀', '부장', '활성', current_timestamp, NULL, NULL, 9);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '3091342272', 'user10', 'password123', '김서준', 'gyeongsu92@dreamwiz.com',
             '1985-05-19', 'M', '070-3880-2836', '서울특별시 시 테헤란로',
             '등록기관', '개발3팀', '부장', '활성', current_timestamp, NULL, NULL, 1);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '2919929465', 'user11', 'password123', '최예준', 'yeongil41@gimyang.org',
             '1977-07-14', 'F', '070-5587-6560', '서울특별시 시 테헤란로',
             '등록기관', '개발4팀', '부장', '활성', current_timestamp, NULL, NULL, 2);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '3998998578', 'user12', 'password123', '백민재', 'fyun@yuhanhoesa.net',
             '1971-02-24', 'M', '055-586-7983', '서울특별시 시 테헤란로',
             '등록기관', '개발1팀', '부장', '활성', current_timestamp, NULL, NULL, 3);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '8480336572', 'user13', 'password123', '이은주', 'iboram@gmail.com',
             '1993-03-14', 'M', '017-527-7373', '서울특별시 시 테헤란로',
             '등록기관', '개발2팀', '부장', '활성', current_timestamp, NULL, NULL, 4);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '6915415136', 'user14', 'password123', '박윤서', 'fsin@yuhanhoesa.net',
             '1987-07-03', 'M', '051-324-6080', '서울특별시 시 테헤란로',
             '등록기관', '개발3팀', '부장', '활성', current_timestamp, NULL, NULL, 5);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '1241199632', 'user15', 'password123', '박영진', 'fbag@gweongimi.com',
             '1982-01-17', 'F', '054-714-8981', '서울특별시 시 테헤란로',
             '등록기관', '개발4팀', '부장', '활성', current_timestamp, NULL, NULL, 6);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '4643753621', 'user16', 'password123', '김수진', 'gimjeongsun@hanmail.net',
             '1973-08-31', 'M', '044-797-0145', '서울특별시 시 테헤란로',
             '등록기관', '개발1팀', '부장', '활성', current_timestamp, NULL, NULL, 7);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '3717542569', 'user17', 'password123', '이춘자', 'hyeonjeong76@live.com',
             '1963-12-30', 'F', '031-996-9203', '서울특별시 시 테헤란로',
             '등록기관', '개발2팀', '부장', '활성', current_timestamp, NULL, NULL, 8);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '1013638003', 'user18', 'password123', '민준영', 'jeongsugca@ison.com',
             '1985-05-28', 'F', '062-807-8030', '서울특별시 시 테헤란로',
             '등록기관', '개발3팀', '부장', '활성', current_timestamp, NULL, NULL, 9);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '9808063692', 'user19', 'password123', '최정자', 'sunja44@gogim.org',
             '1990-04-04', 'M', '02-9052-0626', '서울특별시 시 테헤란로',
             '등록기관', '개발4팀', '부장', '활성', current_timestamp, NULL, NULL, 1);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '3417580121', 'user20', 'password123', '이현주', 'hongbyeongceol@nate.com',
             '1989-11-01', 'F', '010-6093-4195', '서울특별시 시 테헤란로',
             '등록기관', '개발1팀', '부장', '활성', current_timestamp, NULL, NULL, 4);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '8067335160', 'user21', 'password123', '김중수', 'ubaeg@naver.com',
             '1986-07-31', 'M', '062-424-0670', '서울특별시 시 테헤란로',
             '등록기관', '개발2팀', '부장', '활성', current_timestamp, NULL, NULL, 7);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '6337627951', 'user22', 'password123', '이성민', 'hyeonsuggim@hanmail.net',
             '1991-03-08', 'F', '054-011-7096', '서울특별시 시 테헤란로',
             '등록기관', '개발3팀', '부장', '활성', current_timestamp, NULL, NULL, 2);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '5936567531', 'user23', 'password123', '이도현', 'sugjacoe@naver.com',
             '1978-08-04', 'F', '055-188-7089', '서울특별시 시 테헤란로',
             '등록기관', '개발4팀', '부장', '활성', current_timestamp, NULL, NULL, 5);
INSERT INTO member (mem_no, rsrch_no, username, password, name, email, birth, gender, tel, addr,
                    affil_type, affil_dept, position, status, created_at, updated_at, deleted_at, institution_no)
VALUES (NEXT VALUE FOR seq_member, '8067845336', 'user24', 'password123', '허서영', 'jinhojang@baeigang.net',
             '1971-09-15', 'F', '011-928-4287', '서울특별시 시 테헤란로',
             '등록기관', '개발1팀', '부장', '활성', current_timestamp, NULL, NULL, 8);

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

INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (1, '생명과학', 'LA', 'root', NULL);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (2, '분자세포생물학', 'LA01', 'parent', 1);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (3, '신호전달', 'LA0101', 'child', 2);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (4, '세포구조/운동', 'LA0102', 'child', 2);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (5, '세포분화/사멸', 'LA0103', 'child', 2);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (6, '막 생물학', 'LA0104', 'child', 2);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (7, '유전자 발현조절', 'LA0105', 'child', 2);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (8, '달리 분류되지 않는 분자세포 생물학', 'LA0199', 'child', 2);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (9, '유전학·유전체학', 'LA02', 'parent', 1);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (10, '분자유전학', 'LA0201', 'child', 9);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (11, '세포유전학', 'LA0202', 'child', 9);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (12, '집단유전학', 'LA0203', 'child', 9);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (13, '유전체학', 'LA0204', 'child', 9);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (14, '형질전환 생물모델', 'LA0205', 'child', 9);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (15, '유전자 편집·치료', 'LA0206', 'child', 9);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (16, '기능유전체학', 'LA0207', 'child', 9);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (17, '후성유전체학', 'LA0208', 'child', 9);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (18, '메타유전체학', 'LA0209', 'child', 9);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (19, '달리 분류되지 않는 유전학·유전체학', 'LA0299', 'child', 9);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (20, '발생/신경생물학', 'LA03', 'parent', 1);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (21, '배아발생/기관형성', 'LA0301', 'child', 20);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (22, '내분비생물학', 'LA0302', 'child', 20);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (23, '생식생물학', 'LA0303', 'child', 20);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (24, '신경 생화학/생리학', 'LA0304', 'child', 20);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (25, '신경질환생물학', 'LA0305', 'child', 20);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (26, '줄기세포생물학', 'LA0306', 'child', 20);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (27, '달리 분류되지 않는 발생/신경생물학', 'LA0399', 'child', 20);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (28, '면역학/생리학', 'LA04', 'parent', 1);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (29, '면역계 발생/기능', 'LA0401', 'child', 28);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (30, '선천성 면역', 'LA0402', 'child', 28);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (31, '세포성/체액성 면역', 'LA0403', 'child', 28);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (32, '세포생리학', 'LA0404', 'child', 28);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (33, '전기생리학', 'LA0405', 'child', 28);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (34, '달리 분류되지 않는 면역학/생리학', 'LA0499', 'child', 28);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (35, '분류/생태/환경생물학', 'LA05', 'parent', 1);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (36, '계통분류학', 'LA0501', 'child', 35);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (37, '진화학', 'LA0502', 'child', 35);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (38, '생태학', 'LA0503', 'child', 35);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (39, '환경생물학', 'LA0504', 'child', 35);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (40, '행동생물학', 'LA0505', 'child', 35);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (41, '생물자원/다양성', 'LA0506', 'child', 35);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (42, '달리 분류되지 않는 분류/생태/환경생물학', 'LA0599', 'child', 35);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (43, '생화학/구조생물학', 'LA06', 'parent', 1);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (44, '단백질 구조와 기능', 'LA0601', 'child', 43);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (45, '핵산 생화학', 'LA0602', 'child', 43);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (46, '단백질체학', 'LA0603', 'child', 43);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (47, '당생물학', 'LA0604', 'child', 43);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (48, '지질생화학', 'LA0605', 'child', 43);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (49, '구조생물학', 'LA0606', 'child', 43);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (50, '달리 분류되지 않는 생화학/ 구조 생물학', 'LA0699', 'child', 43);


INSERT INTO mem_tech_field(mem_no, tech_field_no, created_at, updated_at)
VALUES (1, 1, default, null);
INSERT INTO mem_tech_field(mem_no, tech_field_no, created_at, updated_at)
VALUES (1, 2, default, null);
INSERT INTO mem_tech_field(mem_no, tech_field_no, created_at, updated_at)
VALUES (1, 3, default, null);

INSERT INTO bucket (BUCKET_NO)
VALUES (NEXTVAL('seq_bucket'));

INSERT INTO announcement(ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY,
                         SPEC_INSTITUTION, ann_tech_field_name, ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE,
                         STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO)
VALUES (NEXTVAL('seq_announcement'),
        '중소벤처기업부 공고 제2024 -465호',
        '2024년 제2차 전략기술 테마별 프로젝트(DCP) 기업 지원계획 공고',
        '<p class="announcement-number">과학기술정보통신부 공고 제2024-0925호</p>
         <h4>2024년도 혁신형 소형모듈원자로 기술개발사업 신규과제 재공고</h4>
         <p>과학기술정보통신부가 추진하는 『혁신형 소형모듈원자로 기술개발사업』의 신규과제를 아래와 같이 재공고하오니 관심있는 연구자분들의 많은 참여 바랍니다.</p>
         <p class="announcement-date">2024년 9월 23일</p>
         <div class="announcement-wrap">
             <p class="Order department">&lt;주무부처&gt; 과학기술정보통신부 장관<span>우상임</span></p>
             <p>
             <p class="professional-organization">
                 &lt;전문기관&gt; 과학기술정보통신부 기술개발사업단 단장<span>김한근</span></p>
         </div>
         <h5>가. 사업목적</h5>
         <p>28년까지 경제성·안정성·유연성 측면에서 경쟁력을 갖춘 혁신형 소형모듈원자로(혁신형 SMR 또는 i-SMR)을 개발하고, 표준설계인가 취득 추진</p>
         <h5>나. 사업내용</h5>
         <p>(설계)<br>- 노심, 계통, 종합설계의 3개 설계분야로 구성되며 각 설계분야는 혁신기술 및 혁신제조 분야와 유기적으로 연계되어 혁신형 SMR의 표준설계 수행</p>',
        '중소벤처기업부',
        '중소기업기술정보진흥원',
        '에너지/자원',
        '지정공모',
        4,
        '신청용 연구개발계획서',
        '접수중',
        '2024-10-01',
        '2024-11-02',
        '2024-08-01',
        NULL,
        1);

INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME,
                              MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH, ONE_YEAR_SUBSIDY,
                              ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-01', '저탄소 연료생산을 위한 이산화탄소 전환기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-01',
        '에너지/자원 > 온실가스 처리 > CO2 전환기술', '이민수', '02-231-1202', '2024', 3600000, 36, 285000, 3, '연구기관귀속', '1', '1');

INSERT INTO eval_committee (eval_committee_no, name, people_count, eval_started_at, eval_closed_at, prog_status,
                            sub_ann_no)
VALUES (NEXT VALUE FOR seq_eval_committee, '평가위원회-01', 6, TIMESTAMP '2024-10-21 12:01:09',
             TIMESTAMP '2024-11-04 12:01:09', '평가대기중', 1);
INSERT INTO eval_committee (eval_committee_no, name, people_count, eval_started_at, eval_closed_at, prog_status,
                            sub_ann_no)
VALUES (NEXT VALUE FOR seq_eval_committee, '평가위원회-02', 6, TIMESTAMP '2024-10-21 12:01:09',
             TIMESTAMP '2024-11-04 12:01:09', '평가대기중', 1);
INSERT INTO eval_committee (eval_committee_no, name, people_count, eval_started_at, eval_closed_at, prog_status,
                            sub_ann_no)
VALUES (NEXT VALUE FOR seq_eval_committee, '평가위원회-03', 6, TIMESTAMP '2024-10-21 12:01:09',
             TIMESTAMP '2024-11-04 12:01:09', '평가대기중', 1);
INSERT INTO eval_committee (eval_committee_no, name, people_count, eval_started_at, eval_closed_at, prog_status,
                            sub_ann_no)
VALUES (NEXT VALUE FOR seq_eval_committee, '평가위원회-04', 6, TIMESTAMP '2024-10-21 12:01:09',
             TIMESTAMP '2024-11-04 12:01:09', '평가대기중', 1);

INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (1, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (1, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (1, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (1, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (1, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (2, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (2, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (2, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (2, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (2, 11, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (2, 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (3, 13, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (3, 14, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (3, 15, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (3, 16, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (3, 17, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (3, 18, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (4, 19, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (4, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (4, 21, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (4, 22, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (4, 23, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');
INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_start_at, recv_close_at, recv_status, recv_status_eng)
VALUES (4, 24, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '승인대기', 'stayed');

INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content,
                      rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'RTN-0001', 'Task-1', 'Institution-1', 4, 'Active',
             'Final target content for plan 0', 'Research and Development content for plan 0',
             'Performance content for plan 0', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, NULL);
INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content,
                      rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'RTN-0002', 'Task-2', 'Institution-2', 1, 'Active',
             'Final target content for plan 1', 'Research and Development content for plan 1',
             'Performance content for plan 1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, NULL);
INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content,
                      rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'RTN-0003', 'Task-3', NULL, 5, 'On Hold', 'Final target content for plan 2',
             'Research and Development content for plan 2', 'Performance content for plan 2', CURRENT_TIMESTAMP,
             CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, NULL);
INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content,
                      rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'RTN-0004', 'Task-4', 'Institution-1', 4, 'Active',
             'Final target content for plan 3', 'Research and Development content for plan 3',
             'Performance content for plan 3', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, NULL);
INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content,
                      rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'RTN-0005', 'Task-5', 'Institution-2', 4, 'Cancelled',
             'Final target content for plan 4', 'Research and Development content for plan 4',
             'Performance content for plan 4', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, NULL);
INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content,
                      rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'RTN-0006', 'Task-6', NULL, 1, 'Pending', 'Final target content for plan 5',
             'Research and Development content for plan 5', 'Performance content for plan 5', CURRENT_TIMESTAMP,
             CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, NULL);
INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content,
                      rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'RTN-0007', 'Task-7', 'Institution-1', 2, 'Active',
             'Final target content for plan 6', 'Research and Development content for plan 6',
             'Performance content for plan 6', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, NULL);
INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content,
                      rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'RTN-0008', 'Task-8', 'Institution-2', 5, 'Pending',
             'Final target content for plan 7', 'Research and Development content for plan 7',
             'Performance content for plan 7', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, NULL);
INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content,
                      rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'RTN-0009', 'Task-9', NULL, 5, 'Active', 'Final target content for plan 8',
             'Research and Development content for plan 8', 'Performance content for plan 8', CURRENT_TIMESTAMP,
             CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, NULL);
INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content,
                      rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'RTN-0010', 'Task-10', 'Institution-1', 4, 'Active',
             'Final target content for plan 9', 'Research and Development content for plan 9',
             'Performance content for plan 9', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, NULL);


