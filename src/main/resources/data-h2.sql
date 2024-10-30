-- bucket
create sequence seq_bucket START WITH 1 INCREMENT BY 1 NOCYCLE;

create table bucket
(
    bucket_no number(10,0) not null
);

alter table bucket
    add constraint pk_bucket
        primary key (bucket_no);

INSERT INTO bucket (bucket_no) VALUES (NEXT VALUE FOR seq_bucket);
INSERT INTO bucket (bucket_no) VALUES (NEXT VALUE FOR seq_bucket);
INSERT INTO bucket (bucket_no) VALUES (NEXT VALUE FOR seq_bucket);
INSERT INTO bucket (bucket_no) VALUES (NEXT VALUE FOR seq_bucket);
INSERT INTO bucket (bucket_no) VALUES (NEXT VALUE FOR seq_bucket);



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
    constraint fk_bucketfile_bucket_no foreign key (bucket_no) references bucket (bucket_no) ON DELETE CASCADE
);

alter table bucketfile
    add constraint pk_bucketfile
        primary key (uuid);

INSERT INTO bucketfile (uuid, upload_path, file_name, hasing_file_name, file_type, file_class, file_size, mandatory_status, created_at, source, source_number, bucket_no)
VALUES (NEXT VALUE FOR seq_bucketfile, '/path/to/file1', 'file1.txt', 'hash1', 'text', 'classA', 1024, 'mandatory', CURRENT_TIMESTAMP, 'sourceA', 1, 1);

INSERT INTO bucketfile (uuid, upload_path, file_name, hasing_file_name, file_type, file_class, file_size, mandatory_status, created_at, source, source_number, bucket_no)
VALUES (NEXT VALUE FOR seq_bucketfile, '/path/to/file2', 'file2.txt', 'hash2', 'text', 'classA', 2048, 'optional', CURRENT_TIMESTAMP, 'sourceB', 2, 1);

INSERT INTO bucketfile (uuid, upload_path, file_name, hasing_file_name, file_type, file_class, file_size, mandatory_status, created_at, source, source_number, bucket_no)
VALUES (NEXT VALUE FOR seq_bucketfile, '/path/to/file3', 'file3.jpg', 'hash3', 'image', 'classB', 3072, 'mandatory', CURRENT_TIMESTAMP, 'sourceC', 3, 2);

INSERT INTO bucketfile (uuid, upload_path, file_name, hasing_file_name, file_type, file_class, file_size, mandatory_status, created_at, source, source_number, bucket_no)
VALUES (NEXT VALUE FOR seq_bucketfile, '/path/to/file4', 'file4.pdf', 'hash4', 'pdf', 'classC', 4096, 'optional', CURRENT_TIMESTAMP, 'sourceD', 4, 2);

INSERT INTO bucketfile (uuid, upload_path, file_name, hasing_file_name, file_type, file_class, file_size, mandatory_status, created_at, source, source_number, bucket_no)
VALUES (NEXT VALUE FOR seq_bucketfile, '/path/to/file5', 'file5.docx', 'hash5', 'doc', 'classD', 5120, 'mandatory', CURRENT_TIMESTAMP, 'sourceE', 5, 3);


-- announcement
create sequence seq_announcement START WITH 1 INCREMENT BY 1 NOCYCLE;

create table announcement
(
    ann_no             number(10,0) not null,
    total_ann_no       varchar2(100) not null,
    total_title        varchar2(255) not null,
    content            CLOB not null,
    competent_ministry varchar2(255) not null,
    spec_institution   varchar2(100) not null,
    ann_tech_field_name varchar2(20) not null,
    ann_type           varchar2(50) not null,
    sub_ann_count      number(2,0) not null,
    reception_type     varchar2(50) not null,
    status             varchar2(20) not null,
    started_at         timestamp default current_timestamp,
    closed_at          timestamp default current_timestamp,
    created_at         timestamp default current_timestamp,
    updated_at         timestamp default current_timestamp,
    bucket_no          number(10,0)  not null,
    constraint fk_announcement_bucket_no foreign key (bucket_no) references bucket (bucket_no) ON DELETE CASCADE
);

alter table announcement
    add constraint pk_announcement
        primary key (ann_no);

INSERT INTO announcement (ann_no, total_ann_no, total_title, content, competent_ministry, spec_institution, ann_tech_field_name, ann_type, sub_ann_count, reception_type, status, started_at, closed_at, created_at, updated_at, bucket_no)
VALUES (NEXT VALUE FOR seq_announcement, 'ANN001', 'AnnouncementTitle1', 'Content for announcement 1', 'Ministry A', 'Institution A', 'Tech Field 1', 'TypeA', 1, 'Type 1', '접수중', '2024-10-28', '2024-10-30', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1);

INSERT INTO announcement (ann_no, total_ann_no, total_title, content, competent_ministry, spec_institution, ann_tech_field_name, ann_type, sub_ann_count, reception_type, status, started_at, closed_at, created_at, updated_at, bucket_no)
VALUES (NEXT VALUE FOR seq_announcement, 'ANN002', 'AnnouncementTitle2', 'Content for announcement 2', 'Ministry B', 'Institution B', 'Tech Field 2', 'TypeB', 2, 'Type 2', '접수예정', '2024-10-29', '2024-11-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1);

INSERT INTO announcement (ann_no, total_ann_no, total_title, content, competent_ministry, spec_institution, ann_tech_field_name, ann_type, sub_ann_count, reception_type, status, started_at, closed_at, created_at, updated_at, bucket_no)
VALUES (NEXT VALUE FOR seq_announcement, 'ANN003', 'AnnouncementTitle3', 'Content for announcement 3', 'Ministry C', 'Institution C', 'Tech Field 3', 'TypeC', 3, 'Type 3', '접수마감', '2024-10-30', '2024-10-29', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2);

INSERT INTO announcement (ann_no, total_ann_no, total_title, content, competent_ministry, spec_institution, ann_tech_field_name, ann_type, sub_ann_count, reception_type, status, started_at, closed_at, created_at, updated_at, bucket_no)
VALUES (NEXT VALUE FOR seq_announcement, 'ANN004', 'AnnouncementTitle4', 'Content for announcement 4', 'Ministry D', 'Institution D', 'Tech Field 4', 'TypeD', 4, 'Type 4', '접수예정', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2);

INSERT INTO announcement (ann_no, total_ann_no, total_title, content, competent_ministry, spec_institution, ann_tech_field_name, ann_type, sub_ann_count, reception_type, status, started_at, closed_at, created_at, updated_at, bucket_no)
VALUES (NEXT VALUE FOR seq_announcement, 'ANN005', 'AnnouncementTitle5', 'Content for announcement 5', 'Ministry E', 'Institution E', 'Tech Field 5', 'TypeE', 5, 'Type 5', '접수중', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3);



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
    constraint fk_sub_announcement_ann_no foreign key (ann_no) references announcement (ann_no) ON DELETE CASCADE,
    constraint fk_sub_announcement_bucket_no foreign key (bucket_no) references bucket (bucket_no) ON DELETE CASCADE
);

alter table sub_announcement
    add constraint pk_sub_announcement
        primary key (sub_ann_no);

INSERT INTO sub_announcement (sub_ann_no, sub_ann_uni_no, sub_title, plan_type, task_type, spec_institution_no, tech_field_name, mgr_name, mgr_tel, planning_year, total_subsidy, total_dev_month, one_year_subsidy, one_year_dev_month, perf_owner, ann_no, bucket_no)
VALUES (NEXT VALUE FOR seq_sub_announcement, 'SUB001', 'SubAnnouncementTitle1', 'Plan A', 'Task A', 'Inst001', 'Tech Field A', 'Manager A', '1234567890', 2024, 100000, 12, 50000, 6, 'Owner A', 1, 1);

INSERT INTO sub_announcement (sub_ann_no, sub_ann_uni_no, sub_title, plan_type, task_type, spec_institution_no, tech_field_name, mgr_name, mgr_tel, planning_year, total_subsidy, total_dev_month, one_year_subsidy, one_year_dev_month, perf_owner, ann_no, bucket_no)
VALUES (NEXT VALUE FOR seq_sub_announcement, 'SUB002', 'SubAnnouncementTitle2', 'Plan B', 'Task B', 'Inst002', 'Tech Field B', 'Manager B', '0987654321', 2024, 200000, 12, 100000, 6, 'Owner B', 2, 1);

INSERT INTO sub_announcement (sub_ann_no, sub_ann_uni_no, sub_title, plan_type, task_type, spec_institution_no, tech_field_name, mgr_name, mgr_tel, planning_year, total_subsidy, total_dev_month, one_year_subsidy, one_year_dev_month, perf_owner, ann_no, bucket_no)
VALUES (NEXT VALUE FOR seq_sub_announcement, 'SUB003', 'SubAnnouncementTitle3', 'Plan C', 'Task C', 'Inst003', 'Tech Field C', 'Manager C', '1122334455', 2024, 300000, 12, 150000, 6, 'Owner C', 3, 2);

INSERT INTO sub_announcement (sub_ann_no, sub_ann_uni_no, sub_title, plan_type, task_type, spec_institution_no, tech_field_name, mgr_name, mgr_tel, planning_year, total_subsidy, total_dev_month, one_year_subsidy, one_year_dev_month, perf_owner, ann_no, bucket_no)
VALUES (NEXT VALUE FOR seq_sub_announcement, 'SUB004', 'SubAnnouncementTitle4', 'Plan D', 'Task D', 'Inst004', 'Tech Field D', 'Manager D', '5566778899', 2024, 400000, 12, 200000, 6, 'Owner D', 1, 2);

INSERT INTO sub_announcement (sub_ann_no, sub_ann_uni_no, sub_title, plan_type, task_type, spec_institution_no, tech_field_name, mgr_name, mgr_tel, planning_year, total_subsidy, total_dev_month, one_year_subsidy, one_year_dev_month, perf_owner, ann_no, bucket_no)
VALUES (NEXT VALUE FOR seq_sub_announcement, 'SUB005', 'SubAnnouncementTitle5', 'Plan E', 'Task E', 'Inst005', 'Tech Field E', 'Manager E', '9988776655', 2024, 500000, 12, 250000, 6, 'Owner E', 2, 3);


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

INSERT INTO institution (institution_no, name, business_register_no, address, company_type, iar_type)
VALUES (NEXT VALUE FOR seq_institution, 'Institution A', 'BR001', '123 Main St', 'Private', 'TypeA');

INSERT INTO institution (institution_no, name, business_register_no, address, company_type, iar_type)
VALUES (NEXT VALUE FOR seq_institution, 'Institution B', 'BR002', '456 Elm St', 'Public', 'TypeB');

INSERT INTO institution (institution_no, name, business_register_no, address, company_type, iar_type)
VALUES (NEXT VALUE FOR seq_institution, 'Institution C', 'BR003', '789 Oak St', 'Private', 'TypeC');

INSERT INTO institution (institution_no, name, business_register_no, address, company_type, iar_type)
VALUES (NEXT VALUE FOR seq_institution, 'Institution D', 'BR004', '321 Pine St', 'Public', 'Type ');

INSERT INTO institution (institution_no, name, business_register_no, address, company_type, iar_type)
VALUES (NEXT VALUE FOR seq_institution, 'Institution E', 'BR005', '654 Cedar St', 'Private', 'TypeE');

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
    constraint fk_quarter_institution_no foreign key (institution_no) references institution (institution_no) ON DELETE CASCADE
);

alter table quarter_earning
    add constraint pk_quarter_earning
        primary key (year_no, quarter, institution_no);

INSERT INTO quarter_earning (year_no, quarter, business_profit, sales, total_asset, total_capital, total_liabilitie, institution_no)
VALUES (2023, 1, 500000, 1000000, 2000000, 1500000, 500000, 1);

INSERT INTO quarter_earning (year_no, quarter, business_profit, sales, total_asset, total_capital, total_liabilitie, institution_no)
VALUES (2023, 2, 600000, 1200000, 2200000, 1600000, 600000, 2);

INSERT INTO quarter_earning (year_no, quarter, business_profit, sales, total_asset, total_capital, total_liabilitie, institution_no)
VALUES (2023, 3, 700000, 1400000, 2400000, 1700000, 700000, 1);

INSERT INTO quarter_earning (year_no, quarter, business_profit, sales, total_asset, total_capital, total_liabilitie, institution_no)
VALUES (2023, 4, 800000, 1600000, 2600000, 1800000, 800000, 3);

INSERT INTO quarter_earning (year_no, quarter, business_profit, sales, total_asset, total_capital, total_liabilitie, institution_no)
VALUES (2024, 1, 900000, 1800000, 2800000, 1900000, 900000, 2);


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
    constraint fk_member_institution_no foreign key (institution_no) references institution (institution_no) ON DELETE CASCADE
);

alter table member
    add constraint pk_member
        primary key (mem_no);

INSERT INTO member (mem_no, username, password, name, email, gender, tel, addr, affil_type, affil_dept, position, status, institution_no)
VALUES (NEXT VALUE FOR seq_member, 'user1', 'pass1', 'John Doe', 'john@example.com', 'M', '1234567890', '123 Main St', 'TypeA', 'DeptA', 'Manager', 'Active', 1);

INSERT INTO member (mem_no, username, password, name, email, gender, tel, addr, affil_type, affil_dept, position, status, institution_no)
VALUES (NEXT VALUE FOR seq_member, 'user2', 'pass2', 'Jane Smith', 'jane@example.com', 'F', '0987654321', '456 Elm St', 'TypeB', 'DeptB', 'Staff', 'Active', 2);

INSERT INTO member (mem_no, username, password, name, email, gender, tel, addr, affil_type, affil_dept, position, status, institution_no)
VALUES (NEXT VALUE FOR seq_member, 'user3', 'pass3', 'Alice Johnson', 'alice@example.com', 'F', '2345678901', '789 Oak St', 'TypeA', 'DeptA', 'Intern', 'Inactive', 1);

INSERT INTO member (mem_no, username, password, name, email, gender, tel, addr, affil_type, affil_dept, position, status, institution_no)
VALUES (NEXT VALUE FOR seq_member, 'user4', 'pass4', 'Bob Brown', 'bob@example.com', 'M', '3456789012', '321 Pine St', 'TypeC', 'DeptC', 'Director', 'Active', 3);

INSERT INTO member (mem_no, username, password, name, email, gender, tel, addr, affil_type, affil_dept, position, status, institution_no)
VALUES (NEXT VALUE FOR seq_member, 'user5', 'pass5', 'Charlie Black', 'charlie@example.com', 'M', '4567890123', '654 Cedar St', 'TypeB', 'DeptB', 'Supervisor', 'Active', 2);


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

INSERT INTO role (role_no, role_name) VALUES (NEXT VALUE FOR seq_role, 'Admin');
INSERT INTO role (role_no, role_name) VALUES (NEXT VALUE FOR seq_role, 'User');
INSERT INTO role (role_no, role_name) VALUES (NEXT VALUE FOR seq_role, 'Manager');
INSERT INTO role (role_no, role_name) VALUES (NEXT VALUE FOR seq_role, 'Supervisor');
INSERT INTO role (role_no, role_name) VALUES (NEXT VALUE FOR seq_role, 'Intern');


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

INSERT INTO mem_role (mem_no, role_no, created_at) VALUES (1, 1, CURRENT_TIMESTAMP);
INSERT INTO mem_role (mem_no, role_no, created_at) VALUES (2, 2, CURRENT_TIMESTAMP);
INSERT INTO mem_role (mem_no, role_no, created_at) VALUES (3, 5, CURRENT_TIMESTAMP);
INSERT INTO mem_role (mem_no, role_no, created_at) VALUES (4, 3, CURRENT_TIMESTAMP);
INSERT INTO mem_role (mem_no, role_no, created_at) VALUES (5, 4, CURRENT_TIMESTAMP);


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
    constraint fk_career_mem_no foreign key (mem_no) references member (mem_no) ON DELETE CASCADE
);

alter table career
    add constraint pk_career
        primary key (career_no);

INSERT INTO career (career_no, org_name, dept_name, career_type, started_at, ended_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_career, 'Company A', 'Dept A', 'Full-time', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1);

INSERT INTO career (career_no, org_name, dept_name, career_type, started_at, ended_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_career, 'Company B', 'Dept B', 'Part-time', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2);

INSERT INTO career (career_no, org_name, dept_name, career_type, started_at, ended_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_career, 'Company C', 'Dept C', 'Internship', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3);

INSERT INTO career (career_no, org_name, dept_name, career_type, started_at, ended_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_career, 'Company D', 'Dept D', 'Contract', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4);

INSERT INTO career (career_no, org_name, dept_name, career_type, started_at, ended_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_career, 'Company E', 'Dept E', 'Full-time', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 5);


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
    constraint fk_acad_ability_mem_no foreign key (mem_no) references member (mem_no) ON DELETE CASCADE
);

alter table acad_ability
    add constraint pk_acad_ability
        primary key (acad_ability_no);

INSERT INTO acad_ability (acad_ability_no, ability_type, org_name, acquired_country, major_affiliation, major_field, major_name, acquired_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_acad_ability, 'Degree', 'University A', 'Country A', 'Affiliation A', 'Field A', 'Major A', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1);

INSERT INTO acad_ability (acad_ability_no, ability_type, org_name, acquired_country, major_affiliation, major_field, major_name, acquired_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_acad_ability, 'Certification', 'Institution B', 'Country B', 'Affiliation B', 'Field B', 'Major B', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2);

INSERT INTO acad_ability (acad_ability_no, ability_type, org_name, acquired_country, major_affiliation, major_field, major_name, acquired_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_acad_ability, 'Degree', 'University C', 'Country C', 'Affiliation C', 'Field C', 'Major C', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3);

INSERT INTO acad_ability (acad_ability_no, ability_type, org_name, acquired_country, major_affiliation, major_field, major_name, acquired_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_acad_ability, 'Certification', 'Institution D', 'Country D', 'Affiliation D', 'Field D', 'Major D', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4);

INSERT INTO acad_ability (acad_ability_no, ability_type, org_name, acquired_country, major_affiliation, major_field, major_name, acquired_at, created_at, updated_at, mem_no)
VALUES (NEXT VALUE FOR seq_acad_ability, 'Degree', 'University E', 'Country E', 'Affiliation E', 'Field E', 'Major E', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 5);


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

INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (51, '수학', 'NA', 'root', NULL);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (52, '기타 수학', 'NA99', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (53, '기하학', 'NA04', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (54, '대수학', 'NA01', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (55, '위상수학', 'NA03', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (56, '응용수학', 'NA05', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (57, '응용통계', 'NA09', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (58, '이산/정보수학', 'NA06', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (59, '통계 방법론·계산', 'NA08', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (60, '통계이론', 'NA07', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (61, '해석학', 'NA02', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (62, '확률/확률과정', 'NA10', 'parent', 51);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (63, '결합환', 'NA0106', 'child', 54);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (64, '경제/경영통계', 'NA0902', 'child', 57);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (65, '계산수학', 'NA0510', 'child', 56);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (66, '고전/일반기하', 'NA0401', 'child', 53);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (67, '고전/조화해석', 'NA0201', 'child', 61);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (68, '공업통계', 'NA0906', 'child', 57);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (69, '과학/공학의 수학적 방법론', 'NA0504', 'child', 56);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (70, '군/표현', 'NA0104', 'child', 54);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (71, '금융/보험통계', 'NA0903', 'child', 57);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (72, '금융수학', 'NA0505', 'child', 56);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (73, '기하위상수학/미분위상수학', 'NA0303', 'child', 55);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (74, '다변량통계', 'NA0803', 'child', 59);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (75, '달리 분류되지 않는 기하학', 'NA0499', 'child', 53);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (76, '달리 분류되지 않는 대수학', 'NA0199', 'child', 54);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (77, '달리 분류되지 않는 수학', 'NA9999', 'child', 52);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (78, '달리 분류되지 않는 위상수학', 'NA0399', 'child', 55);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (79, '달리 분류되지 않는 응용수학', 'NA0599', 'child', 56);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (80, '달리 분류되지 않는 응용통계', 'NA0999', 'child', 57);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (81, '달리 분류되지 않는 이산/정보수학', 'NA0699', 'child', 58);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (82, '달리 분류되지 않는 통계 방법론·계산', 'NA0899', 'child', 59);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (83, '달리 분류되지 않는 통계이론', 'NA0799', 'child', 60);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (84, '달리 분류되지 않는 해석학', 'NA0299', 'child', 61);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (85, '달리 분류되지 않는 확률/확률과정', 'NA1099', 'child', 62);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (86, '대수기하/가환환', 'NA0105', 'child', 54);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (87, '대수적위상수학', 'NA0302', 'child', 55);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (88, '대역해석학/다양체위의 해석학', 'NA0207', 'child', 61);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (89, '동력계/상미분방정식', 'NA0205', 'child', 61);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (90, '리군/위상군', 'NA0304', 'child', 55);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (91, '리대수/비결합환', 'NA0107', 'child', 54);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (92, '모수추론', 'NA0701', 'child', 60);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (93, '미분기하', 'NA0403', 'child', 53);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (94, '바이오수학', 'NA0506', 'child', 56);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (95, '베이지안추론', 'NA0703', 'child', 60);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (96, '변분론/비선형해석', 'NA0204', 'child', 61);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (97, '보험수학', 'NA0509', 'child', 56);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (98, '복소기하', 'NA0404', 'child', 53);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (99, '복소해석', 'NA0202', 'child', 61);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (100, '볼록기하/이산기하', 'NA0402', 'child', 53);

INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (101, '물리학', 'NB', 'root', NULL);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (102, '광학·양자전자학', 'NB05', 'parent', 101);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (103, '기타 물리학', 'NB99', 'parent', 101);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (104, '복합물리', 'NB09', 'parent', 101);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (105, '원자/분자물리', 'NB07', 'parent', 101);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (106, '유체·플라즈마물리', 'NB04', 'parent', 101);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (107, '응집물질물리', 'NB06', 'parent', 101);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (108, '입자/장물리', 'NB01', 'parent', 101);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (109, '천체물리', 'NB08', 'parent', 101);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (110, '통계물리', 'NB02', 'parent', 101);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (111, '핵물리', 'NB03', 'parent', 101);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (112, 'X선 광학', 'NB0510', 'child', 102);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (113, '가속기/충돌 물리', 'NB0105', 'child', 108);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (114, '강입자 물리', 'NB0303', 'child', 111);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (115, '고에너지 중이온 반응', 'NB0304', 'child', 111);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (116, '고에너지천체', 'NB0806', 'child', 109);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (117, '광자학', 'NB0505', 'child', 102);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (118, '기하/파동 광학', 'NB0507', 'child', 102);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (119, '나노 광학', 'NB0509', 'child', 102);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (120, '나노구조/나노소자', 'NB0617', 'child', 107);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (121, '달리 분류되지 않는 광학·양자전자학', 'NB0599', 'child', 102);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (122, '달리 분류되지 않는 물리학', 'NB9999', 'child', 103);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (123, '달리 분류되지 않는 복합물리', 'NB0999', 'child', 104);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (124, '달리 분류되지 않는 원자/분자물리', 'NB0799', 'child', 105);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (125, '달리 분류되지 않는 유체·플라즈마물리', 'NB0499', 'child', 106);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (126, '달리 분류되지 않는 응집물질물리', 'NB0699', 'child', 107);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (127, '달리 분류되지 않는 입자/장물리', 'NB0199', 'child', 108);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (128, '달리 분류되지 않는 천체물리', 'NB0899', 'child', 109);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (129, '달리 분류되지 않는 통계물리', 'NB0299', 'child', 110);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (130, '달리 분류되지 않는 핵물리', 'NB0399', 'child', 111);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (131, '디스플레이 광학', 'NB0508', 'child', 102);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (132, '레이저광학', 'NB0503', 'child', 102);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (133, '무른물질/유기물질', 'NB0612', 'child', 107);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (134, '무질서계', 'NB0202', 'child', 110);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (135, '반도체', 'NB0607', 'child', 107);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (136, '복잡계', 'NB0204', 'child', 110);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (137, '분광학', 'NB0501', 'child', 102);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (138, '분자물리학', 'NB0702', 'child', 105);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (139, '비선형 동력학', 'NB0203', 'child', 110);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (140, '비선형광학', 'NB0504', 'child', 102);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (141, '생물물리', 'NB0901', 'child', 104);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (142, '양자광학', 'NB0502', 'child', 102);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (143, '양자정보', 'NB0703', 'child', 105);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (144, '원자물리학', 'NB0701', 'child', 105);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (145, '원자핵 데이터', 'NB0305', 'child', 111);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (146, '유전체/강유전체', 'NB0609', 'child', 107);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (147, '유체운동/수송론', 'NB0402', 'child', 106);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (148, '음향학', 'NB0905', 'child', 104);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (149, '응집물성 측정법', 'NB0614', 'child', 107);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (150, '응집물질 계산과학', 'NB0602', 'child', 107);

INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (151, '화학', 'NC', 'root', NULL);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (152, '고분자화학', 'NC05', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (153, '광화학', 'NC07', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (154, '기타 화학', 'NC99', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (155, '무기화학', 'NC03', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (156, '물리화학', 'NC01', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (157, '분석화학', 'NC04', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (158, '생화학', 'NC06', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (159, '유기화학', 'NC02', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (160, '융합화학', 'NC10', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (161, '재료화학', 'NC09', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (162, '전기화학', 'NC08', 'parent', 151);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (163, '계산화학', 'NC1005', 'child', 160);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (164, '고분자 구조/물성', 'NC0502', 'child', 152);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (165, '고분자 물리화학', 'NC0503', 'child', 152);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (166, '고분자 합성', 'NC0501', 'child', 152);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (167, '고분자광화학', 'NC0704', 'child', 153);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (168, '고분자재료화학', 'NC0905', 'child', 161);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (169, '고체무기화학/결정학', 'NC0305', 'child', 155);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (170, '고체물리화학', 'NC0106', 'child', 156);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (171, '고효율 생리활성 검색', 'NC1007', 'child', 160);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (172, '광소재화학', 'NC0706', 'child', 153);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (173, '구조분석화학', 'NC0404', 'child', 157);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (174, '구조생화학', 'NC0605', 'child', 158);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (175, '기능성 고분자', 'NC0506', 'child', 152);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (176, '나노광화학', 'NC0907', 'child', 161);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (177, '나노재료화학', 'NC0901', 'child', 161);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (178, '단백질/효소분자 생화학', 'NC0602', 'child', 158);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (179, '단백질체학', 'NC0608', 'child', 158);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (180, '달리 분류되지 않는 고분자화학', 'NC0599', 'child', 152);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (181, '달리 분류되지 않는 광화학', 'NC0799', 'child', 153);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (182, '달리 분류되지 않는 무기화학', 'NC0399', 'child', 155);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (183, '달리 분류되지 않는 물리화학', 'NC0199', 'child', 156);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (184, '달리 분류되지 않는 분석화학', 'NC0499', 'child', 157);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (185, '달리 분류되지 않는 생화학', 'NC0699', 'child', 158);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (186, '달리 분류되지 않는 유기화학', 'NC0299', 'child', 159);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (187, '달리 분류되지 않는 융합화학', 'NC1099', 'child', 160);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (188, '달리 분류되지 않는 재료화학', 'NC0999', 'child', 161);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (189, '달리 분류되지 않는 전기화학', 'NC0899', 'child', 162);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (190, '달리 분류되지 않는 화학', 'NC9999', 'child', 154);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (191, '대사분자 생화학', 'NC0606', 'child', 158);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (192, '마이크로칩 화학분석', 'NC0409', 'child', 157);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (193, '무기광화학', 'NC0702', 'child', 153);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (194, '무기소재화학', 'NC0306', 'child', 155);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (195, '무기의약화학', 'NC0308', 'child', 155);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (196, '무기재료화학', 'NC0904', 'child', 161);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (197, '무기초분자화학', 'NC0302', 'child', 155);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (198, '물리광화학', 'NC0705', 'child', 153);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (199, '물리전기화학', 'NC0801', 'child', 162);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (200, '바이오재료화학', 'NC0906', 'child', 161);

INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (201, '지구과학(지구/대기/해양/천문)', 'ND', 'root', NULL);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (202, '극지과학', 'ND11', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (203, '기상과학', 'ND05', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (204, '기타 지구과학', 'ND99', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (205, '기후과학', 'ND06', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (206, '대기과학', 'ND04', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (207, '우주과학', 'ND13', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (208, '자연재해 분석/예측', 'ND07', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (209, '지구물리학', 'ND02', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (210, '지구화학', 'ND03', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (211, '지질과학', 'ND01', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (212, '천문우주관측기술', 'ND14', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (213, '천문학', 'ND12', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (214, '해양과학', 'ND08', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (215, '해양생명', 'ND10', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (216, '해양자원', 'ND09', 'parent', 201);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (217, '가뭄재해발생 분석/예측', 'ND0710', 'child', 208);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (218, '고기후학', 'ND0605', 'child', 205);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (219, '고에너지복사 관측기술', 'ND1404', 'child', 212);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (220, '고에너지천문학', 'ND1207', 'child', 213);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (221, '고천문학/천문역법', 'ND1209', 'child', 213);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (222, '고층대기', 'ND0407', 'child', 206);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (223, '고해양학', 'ND0805', 'child', 214);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (224, '광물학', 'ND0101', 'child', 211);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (225, '광상/자원지질학', 'ND0103', 'child', 211);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (226, '광학천문기술', 'ND1401', 'child', 212);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (227, '구조지질학', 'ND0104', 'child', 211);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (228, '극지 광물자원 탐사', 'ND1105', 'child', 202);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (229, '극지 생물자원 탐사/수집/활용', 'ND1104', 'child', 202);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (230, '극지 생태계 모니터링', 'ND1106', 'child', 202);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (231, '극지 인프라구축 및 활용', 'ND1110', 'child', 202);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (232, '극지 저온생물학/적응생리', 'ND1109', 'child', 202);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (233, '극지 해양', 'ND1107', 'child', 202);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (234, '극지환경감시/극지 생지화학 순환', 'ND1103', 'child', 202);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (235, '기상관측/분석기술', 'ND0501', 'child', 203);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (236, '기상예보기술', 'ND0503', 'child', 203);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (237, '기상원격탐사기술', 'ND0502', 'child', 203);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (238, '기상재해 분석/예측', 'ND0701', 'child', 208);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (239, '기상조절', 'ND0504', 'child', 203);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (240, '기후모델링/예측기술', 'ND0603', 'child', 205);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (241, '기후변화영향평가/대응기술', 'ND0604', 'child', 205);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (242, '기후시스템 관측/분석기술', 'ND0601', 'child', 205);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (243, '기후역학', 'ND0602', 'child', 205);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (244, '농업기상', 'ND0506', 'child', 203);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (245, '달리 분류되지 않는 극지과학', 'ND1199', 'child', 202);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (246, '달리 분류되지 않는 기상과학', 'ND0599', 'child', 203);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (247, '달리 분류되지 않는 기후과학', 'ND0699', 'child', 205);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (248, '달리 분류되지 않는 대기과학', 'ND0499', 'child', 206);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (249, '달리 분류되지 않는 우주과학', 'ND1399', 'child', 207);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (250, '달리 분류되지 않는 자연재해 분석/예측', 'ND0799', 'child', 208);

INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (251, '농림수산식품', 'LB', 'root', NULL);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (252, '기타 농림수산식품', 'LB99', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (253, '농림수산식품경영/정보 등', 'LB20', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (254, '농생물학', 'LB03', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (255, '농수축산물 품질·안전 관리', 'LB16', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (256, '농업·식품 기계·설비', 'LB08', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (257, '농업인프라 공학', 'LB09', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (258, '농업환경생태', 'LB05', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (259, '농화학', 'LB04', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (260, '동물자원과학', 'LB06', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (261, '산림자원학', 'LB10', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (262, '수산양식', 'LB13', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (263, '수산자원/어장환경', 'LB14', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (264, '수의과학', 'LB07', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (265, '식량작물과학', 'LB01', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (266, '식품과학', 'LB17', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (267, '식품영양과학', 'LB18', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (268, '식품조리/외식/식생활개선', 'LB19', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (269, '어업생산/이용가공', 'LB15', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (270, '원예특용작물과학', 'LB02', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (271, '임산공학', 'LB12', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (272, '조경학', 'LB11', 'parent', 251);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (273, '곤충 분류/동정/생태', 'LB0305', 'child', 254);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (274, '곤충 생리/병리/활용', 'LB0306', 'child', 254);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (275, '곤충 생명공학', 'LB0307', 'child', 254);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (276, '공예/사료/녹비작물', 'LB0107', 'child', 265);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (277, '급식/외식상품개발', 'LB1904', 'child', 268);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (278, '기능성식품', 'LB1801', 'child', 267);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (279, '농림수산식품 경영/경제', 'LB2001', 'child', 253);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (280, '농림수산식품 유통', 'LB2002', 'child', 253);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (281, '농림수산식품 정보', 'LB2003', 'child', 253);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (282, '농산물 위생/품질관리', 'LB1601', 'child', 255);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (283, '농어업/농어촌 정책', 'LB2006', 'child', 253);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (284, '농업 금융/보험', 'LB2004', 'child', 253);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (285, '농업 생태', 'LB0503', 'child', 258);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (286, '농업 시설', 'LB0901', 'child', 257);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (287, '농업 환경정화', 'LB0504', 'child', 258);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (288, '농업·식품 동력·에너지', 'LB0802', 'child', 256);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (289, '농업·식품 생산 기계', 'LB0801', 'child', 256);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (290, '농업·식품 생산 시설·환경', 'LB0805', 'child', 256);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (291, '농업·식품 생산 자동화·로봇', 'LB0804', 'child', 256);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (292, '농업기상', 'LB0505', 'child', 258);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (293, '농업미생물', 'LB0302', 'child', 254);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (294, '농업수자원/수문학', 'LB0903', 'child', 257);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (295, '농업자원 순환/활용', 'LB0507', 'child', 258);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (296, '농지 공학', 'LB0902', 'child', 257);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (297, '농촌 계획 공학', 'LB0905', 'child', 257);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (298, '농촌 사회/문화', 'LB2005', 'child', 253);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (299, '농촌 환경 공학', 'LB0904', 'child', 257);
INSERT INTO tech_field (tech_field_no, name, code, type, parent_tech_field_no)
VALUES (300, '농축산물 가공/품질 계측', 'LB0803', 'child', 256);


-- mem_tech_field

create table mem_tech_field
(
    mem_no        number(10,0) not null,
    tech_field_no number(10,0) not null,
    created_at    timestamp default current_timestamp,
    updated_at    timestamp default current_timestamp,
    constraint pk_mem_tech_field primary key (mem_no, tech_field_no),
    constraint fk_mem_tech_field_mem_no foreign key (mem_no) references member (mem_no) ON DELETE CASCADE,
    constraint fk_mem_tech_field_no foreign key (tech_field_no) references tech_field (tech_field_no) ON DELETE CASCADE
);

INSERT INTO mem_tech_field(mem_no, tech_field_no, created_at, updated_at)
VALUES (1, 15, current_timestamp, current_timestamp);
INSERT INTO mem_tech_field(mem_no, tech_field_no, created_at, updated_at)
VALUES (1, 58, current_timestamp, current_timestamp);
INSERT INTO mem_tech_field(mem_no, tech_field_no, created_at, updated_at)
VALUES (1, 158, current_timestamp, current_timestamp);


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
    constraint fk_rnd_plan_sub_ann_no foreign key (sub_ann_no) references sub_announcement (sub_ann_no) ON DELETE CASCADE,
    mem_no            number(10,0)   not null,
    constraint fk_rnd_plan_mem_no foreign key (mem_no) references member (mem_no) ON DELETE CASCADE,
    bucket_no         number(10,0)   null,
    constraint fk_rnd_plan_bucket_no foreign key (bucket_no) references bucket (bucket_no) ON DELETE CASCADE
);

alter table rnd_plan
    add constraint pk_rnd_plan
        primary key (rnd_plan_no);

INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content, rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'T001', 'ResearchTask1', 'Institution A', 1, '선정', NULL, NULL, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1, 1);

INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content, rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'T002', 'ResearchTask2', 'Institution B', 2, '작성중', NULL, NULL, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 2, 2);

INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content, rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'T003', 'ResearchTask3', 'Institution C', 1, '제출완료', NULL, NULL, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 3, 1);

INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content, rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'T004', 'Research Task 4', 'Institution D', 3, 'In Progress', NULL, NULL, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 4, 2);

INSERT INTO rnd_plan (rnd_plan_no, rnd_task_no, task_name, rnd_institution, curr_step, plan_status, final_tgt_content, rnd_content, perf_content, submitted_at, created_at, updated_at, sub_ann_no, mem_no, bucket_no)
VALUES (NEXT VALUE FOR seq_rnd_plan, 'T005', 'Research Task 5', 'Institution E', 2, 'Pending', NULL, NULL, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 5, 1);

-- researcher
create sequence seq_researcher START WITH 1 INCREMENT BY 1 NOCYCLE;

create table researcher
(
    rsrch_no      number(10,0)   not null,
    manpower_role varchar2(20) null,
    part_type     varchar2(20) null,
    rnd_plan_no   number(10,0)   not null,
    mem_no        number(10,0)   not null,
    constraint fk_researcher_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no) ON DELETE CASCADE,
    constraint fk_researcher_mem_no foreign key (mem_no) references member (mem_no) ON DELETE CASCADE
);

alter table researcher
    add constraint pk_researcher
        primary key (rsrch_no);

INSERT INTO researcher (rsrch_no, manpower_role, part_type, rnd_plan_no, mem_no)
VALUES (NEXT VALUE FOR seq_researcher, 'Lead', 'Full-time', 1, 1);

INSERT INTO researcher (rsrch_no, manpower_role, part_type, rnd_plan_no, mem_no)
VALUES (NEXT VALUE FOR seq_researcher, 'Assistant', 'Part-time', 2, 2);

INSERT INTO researcher (rsrch_no, manpower_role, part_type, rnd_plan_no, mem_no)
VALUES (NEXT VALUE FOR seq_researcher, 'Researcher', 'Full-time', 3, 3);

INSERT INTO researcher (rsrch_no, manpower_role, part_type, rnd_plan_no, mem_no)
VALUES (NEXT VALUE FOR seq_researcher, 'Intern', 'Internship', 4, 4);

INSERT INTO researcher (rsrch_no, manpower_role, part_type, rnd_plan_no, mem_no)
VALUES (NEXT VALUE FOR seq_researcher, 'Technician', 'Contract', 5, 5);


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
    constraint fk_rsrch_join_period_rsrch_no foreign key (rsrch_no) references researcher (rsrch_no) ON DELETE CASCADE
);

alter table rsrch_join_period
    add constraint pk_rsrch_join_period
        primary key (stage_no, year_no);

INSERT INTO rsrch_join_period (stage_no, year_no, is_participated, started_at, ended_at, mxnth, rsrch_no)
VALUES (NEXT VALUE FOR seq_rsrch_join_period, 2023, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1);

INSERT INTO rsrch_join_period (stage_no, year_no, is_participated, started_at, ended_at, mxnth, rsrch_no)
VALUES (NEXT VALUE FOR seq_rsrch_join_period, 2023, 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2);

INSERT INTO rsrch_join_period (stage_no, year_no, is_participated, started_at, ended_at, mxnth, rsrch_no)
VALUES (NEXT VALUE FOR seq_rsrch_join_period, 2023, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 3);

INSERT INTO rsrch_join_period (stage_no, year_no, is_participated, started_at, ended_at, mxnth, rsrch_no)
VALUES (NEXT VALUE FOR seq_rsrch_join_period, 2024, 'Y', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 4);

INSERT INTO rsrch_join_period (stage_no, year_no, is_participated, started_at, ended_at, mxnth, rsrch_no)
VALUES (NEXT VALUE FOR seq_rsrch_join_period, 2024, 'N', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 5);


-- rnd_field
create sequence seq_rnd_field START WITH 1 INCREMENT BY 1 NOCYCLE;

create table rnd_field
(
    rnd_field_no number(10,0)   not null,
    name         varchar2(50) not null,
    rank         number(1,0)  not null,
    weight       number(3,0)  not null,
    rnd_plan_no  number(10,0)   not null,
    constraint fk_rnd_field_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no) ON DELETE CASCADE
);

alter table rnd_field
    add constraint pk_rnd_field
        primary key (rnd_field_no);

INSERT INTO rnd_field (rnd_field_no, name, rank, weight, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_rnd_field, 'Field A', 1, 10, 1);

INSERT INTO rnd_field (rnd_field_no, name, rank, weight, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_rnd_field, 'Field B', 2, 20, 2);

INSERT INTO rnd_field (rnd_field_no, name, rank, weight, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_rnd_field, 'Field C', 1, 15, 3);

INSERT INTO rnd_field (rnd_field_no, name, rank, weight, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_rnd_field, 'Field D', 3, 25, 4);

INSERT INTO rnd_field (rnd_field_no, name, rank, weight, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_rnd_field, 'Field E', 2, 30, 5);


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
    constraint fk_rnd_period_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no) ON DELETE CASCADE
);

alter table rnd_period
    add constraint pk_rnd_period
        primary key (stage_no, year_no);

INSERT INTO rnd_period (stage_no, year_no, started_at, ended_at, mxnth, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_rnd_period, 2023, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 1);

INSERT INTO rnd_period (stage_no, year_no, started_at, ended_at, mxnth, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_rnd_period, 2023, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 2);

INSERT INTO rnd_period (stage_no, year_no, started_at, ended_at, mxnth, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_rnd_period, 2024, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 3);

INSERT INTO rnd_period (stage_no, year_no, started_at, ended_at, mxnth, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_rnd_period, 2024, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 4);

INSERT INTO rnd_period (stage_no, year_no, started_at, ended_at, mxnth, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_rnd_period, 2024, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 5);



-- stage_content
create sequence seq_stage_content START WITH 1 INCREMENT BY 1 NOCYCLE;

create table stage_content
(
    stage_no        number(10,0)   not null,
    stg_tgt_content clob not null,
    rnd_content     clob not null,
    rnd_plan_no     number(10,0)   not null,
    constraint fk_stage_content_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no) ON DELETE CASCADE
);

alter table stage_content
    add constraint pk_stage_content
        primary key (stage_no);

INSERT INTO stage_content (stage_no, stg_tgt_content, rnd_content, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_stage_content, 'Target content 1', 'R&D content 1', 1);

INSERT INTO stage_content (stage_no, stg_tgt_content, rnd_content, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_stage_content, 'Target content 2', 'R&D content 2', 2);

INSERT INTO stage_content (stage_no, stg_tgt_content, rnd_content, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_stage_content, 'Target content 3', 'R&D content 3', 3);

INSERT INTO stage_content (stage_no, stg_tgt_content, rnd_content, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_stage_content, 'Target content 4', 'R&D content 4', 4);

INSERT INTO stage_content (stage_no, stg_tgt_content, rnd_content, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_stage_content, 'Target content 5', 'R&D content 5', 5);


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
    constraint fk_rnd_fee_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no) ON DELETE CASCADE
);

alter table rnd_fee
    add constraint pk_rnd_fee
        primary key (stage_no, year_no);

INSERT INTO rnd_fee (stage_no, year_no, goverment_fund, rnd_charge, labor_cost, equip_cost, rnd_cost, research_cost, research_allowance, rnd_plan_no)
VALUES (1, 2023, 100000, 50000, 30000, 20000, 180000, 70000, 5000, 1);

INSERT INTO rnd_fee (stage_no, year_no, goverment_fund, rnd_charge, labor_cost, equip_cost, rnd_cost, research_cost, research_allowance, rnd_plan_no)
VALUES (1, 2024, 150000, 60000, 40000, 25000, 220000, 80000, 7000, 2);

INSERT INTO rnd_fee (stage_no, year_no, goverment_fund, rnd_charge, labor_cost, equip_cost, rnd_cost, research_cost, research_allowance, rnd_plan_no)
VALUES (2, 2023, 120000, 55000, 35000, 30000, 190000, 75000, 6000, 3);

INSERT INTO rnd_fee (stage_no, year_no, goverment_fund, rnd_charge, labor_cost, equip_cost, rnd_cost, research_cost, research_allowance, rnd_plan_no)
VALUES (2, 2024, 130000, 65000, 38000, 28000, 200000, 76000, 8000, 4);

INSERT INTO rnd_fee (stage_no, year_no, goverment_fund, rnd_charge, labor_cost, equip_cost, rnd_cost, research_cost, research_allowance, rnd_plan_no)
VALUES (3, 2024, 140000, 70000, 42000, 32000, 210000, 78000, 9000, 5);


-- progress_history
create sequence seq_progress_history START WITH 1 INCREMENT BY 1 NOCYCLE;

create table progress_history
(
    progress_history_no number(10,0)   not null,
    proc_status         varchar2(20) not null,
    processor           varchar2(20) not null,
    note                varchar2(100) null,
    rnd_plan_no         number(10,0)   not null,
    constraint fk_progress_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no) ON DELETE CASCADE
);

alter table progress_history
    add constraint pk_progress_history
        primary key (progress_history_no);

INSERT INTO progress_history (progress_history_no, proc_status, processor, note, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_progress_history, 'In Progress', 'Processor A', 'Initial progress', 1);

INSERT INTO progress_history (progress_history_no, proc_status, processor, note, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_progress_history, 'Completed', 'Processor B', 'Progress completed', 2);

INSERT INTO progress_history (progress_history_no, proc_status, processor, note, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_progress_history, 'Pending', 'Processor C', 'Awaiting feedback', 3);

INSERT INTO progress_history (progress_history_no, proc_status, processor, note, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_progress_history, 'In Review', 'Processor D', 'Under review', 4);

INSERT INTO progress_history (progress_history_no, proc_status, processor, note, rnd_plan_no)
VALUES (NEXT VALUE FOR seq_progress_history, 'Approved', 'Processor E', 'Approved progress', 5);


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
    constraint fk_evaluation_tech_field_no foreign key (tech_field_no) references tech_field (tech_field_no) ON DELETE CASCADE
);

alter table evaluation_table
    add constraint pk_evaluation_table
        primary key (evaluation_table_no);

INSERT INTO evaluation_table (evaluation_table_no, title, description, form_type, created_at, updated_at, tech_field_no)
VALUES (NEXT VALUE FOR seq_evaluation_table, 'Evaluation 1', 'Description for evaluation 1', 'FormTypeA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1);

INSERT INTO evaluation_table (evaluation_table_no, title, description, form_type, created_at, updated_at, tech_field_no)
VALUES (NEXT VALUE FOR seq_evaluation_table, 'Evaluation 2', 'Description for evaluation 2', 'FormTypeB', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2);

INSERT INTO evaluation_table (evaluation_table_no, title, description, form_type, created_at, updated_at, tech_field_no)
VALUES (NEXT VALUE FOR seq_evaluation_table, 'Evaluation 3', 'Description for evaluation 3', 'FormTypeC', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3);

INSERT INTO evaluation_table (evaluation_table_no, title, description, form_type, created_at, updated_at, tech_field_no)
VALUES (NEXT VALUE FOR seq_evaluation_table, 'Evaluation 4', 'Description for evaluation 4', 'FormTypeD', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 4);

INSERT INTO evaluation_table (evaluation_table_no, title, description, form_type, created_at, updated_at, tech_field_no)
VALUES (NEXT VALUE FOR seq_evaluation_table, 'Evaluation 5', 'Description for evaluation 5', 'FormTypeE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 5);


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

INSERT INTO question (question_no, type, content, created_at)
VALUES (NEXT VALUE FOR seq_question, 'TypeA', 'Question content 1', CURRENT_TIMESTAMP);

INSERT INTO question (question_no, type, content, created_at)
VALUES (NEXT VALUE FOR seq_question, 'common', 'Question content 2', CURRENT_TIMESTAMP);

INSERT INTO question (question_no, type, content, created_at)
VALUES (NEXT VALUE FOR seq_question, 'TypeC', 'Question content 3', CURRENT_TIMESTAMP);

INSERT INTO question (question_no, type, content, created_at)
VALUES (NEXT VALUE FOR seq_question, 'TypeD', 'Question content 4', CURRENT_TIMESTAMP);

INSERT INTO question (question_no, type, content, created_at)
VALUES (NEXT VALUE FOR seq_question, 'TypeE', 'Question content 5', CURRENT_TIMESTAMP);


-- evaluation_question
create sequence seq_evaluation_question START WITH 1 INCREMENT BY 1 NOCYCLE;

create table evaluation_question
(
    evaluation_table_no number(10,0) not null,
    question_no         number(10,0) not null,
    constraint pk_evaluation_question primary key (evaluation_table_no, question_no),
    constraint fk_eval_qu_evaluation_table_no foreign key (evaluation_table_no) references evaluation_table (evaluation_table_no) ON DELETE CASCADE,
    constraint fk_eval_qu_question_no foreign key (question_no) references question (question_no) ON DELETE CASCADE
);

INSERT INTO evaluation_question (evaluation_table_no, question_no)
VALUES (1, 1);

INSERT INTO evaluation_question (evaluation_table_no, question_no)
VALUES (1, 2);

INSERT INTO evaluation_question (evaluation_table_no, question_no)
VALUES (2, 3);

INSERT INTO evaluation_question (evaluation_table_no, question_no)
VALUES (2, 4);

INSERT INTO evaluation_question (evaluation_table_no, question_no)
VALUES (3, 5);


-- annocement_question
create sequence seq_annocement_evaluation START WITH 1 INCREMENT BY 1 NOCYCLE;

create table annocement_evaluation
(
    evaluation_table_no number(10,0) not null,
    sub_ann_no          number(10,0) not null,
    constraint pk_announcement_evaluation primary key (evaluation_table_no, sub_ann_no),
    constraint fk_ann_que_evaluation_table_no foreign key (evaluation_table_no) references evaluation_table (evaluation_table_no) ON DELETE CASCADE,
    constraint fk_ann_que_sub_ann_no foreign key (sub_ann_no) references sub_announcement (sub_ann_no) ON DELETE CASCADE
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
    constraint fk_eval_committee_sub_ann_no foreign key (sub_ann_no) references sub_announcement (sub_ann_no) ON DELETE CASCADE
);

alter table eval_committee
    add constraint pk_eval_committee
        primary key (eval_committee_no);

INSERT INTO eval_committee (eval_committee_no, name, people_count, prog_status, sub_ann_no)
VALUES (NEXT VALUE FOR seq_eval_committee, 'CommitteeA', 5, 'Active', 1);

INSERT INTO eval_committee (eval_committee_no, name, people_count, prog_status, sub_ann_no)
VALUES (NEXT VALUE FOR seq_eval_committee, 'CommitteeB', 3, 'Inactive', 2);

INSERT INTO eval_committee (eval_committee_no, name, people_count, prog_status, sub_ann_no)
VALUES (NEXT VALUE FOR seq_eval_committee, 'CommitteeC', 4, 'Active', 3);

INSERT INTO eval_committee (eval_committee_no, name, people_count, prog_status, sub_ann_no)
VALUES (NEXT VALUE FOR seq_eval_committee, 'CommitteeD', 6, 'Inactive', 4);

INSERT INTO eval_committee (eval_committee_no, name, people_count, prog_status, sub_ann_no)
VALUES (NEXT VALUE FOR seq_eval_committee, 'CommitteeE', 5, 'Active', 5);


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
    sel_completed_at  timestamp default current_timestamp,
    constraint pk_eval_task primary key (eval_committee_no, rnd_plan_no, mem_no),
    constraint fk_eval_task_committee_no foreign key (eval_committee_no) references eval_committee (eval_committee_no) ON DELETE CASCADE,
    constraint fk_eval_task_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no) ON DELETE CASCADE,
    constraint fk_eval_task_mem_no foreign key (mem_no) references member (mem_no) ON DELETE CASCADE
);

INSERT INTO eval_task (eval_committee_no, rnd_plan_no, mem_no, total_score, eval_status)
VALUES (1, 1, 1, 85, 'Completed');

INSERT INTO eval_task (eval_committee_no, rnd_plan_no, mem_no, total_score, eval_status)
VALUES (1, 2, 2, 90, 'In Progress');

INSERT INTO eval_task (eval_committee_no, rnd_plan_no, mem_no, total_score, eval_status)
VALUES (2, 3, 3, 75, 'Pending');

INSERT INTO eval_task (eval_committee_no, rnd_plan_no, mem_no, total_score, eval_status)
VALUES (3, 4, 4, 88, 'Completed');

INSERT INTO eval_task (eval_committee_no, rnd_plan_no, mem_no, total_score, eval_status)
VALUES (4, 5, 5, 92, 'Not Started');


-- evaluation_member
create sequence seq_evaluation_member START WITH 1 INCREMENT BY 1 NOCYCLE;

create table evaluation_member
(
    eval_committee_no number(10,0) not null,
    mem_no            number(10,0) not null,
    recv_start_at     timestamp default current_timestamp,
    recv_close_at     timestamp default current_timestamp,
    recv_status       varchar2(20) not null,
    recv_status_eng       varchar2(20) not null,
    constraint pk_eval_member primary key (eval_committee_no, mem_no) ,
    constraint fk_eval_member_eval_no foreign key (eval_committee_no) references eval_committee (eval_committee_no) ON DELETE CASCADE,
    constraint fk_eval_member_mem_no foreign key (mem_no) references member (mem_no) ON DELETE CASCADE
);

INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_status, recv_status_eng)
VALUES (1, 1, 'Received', 'Received');

INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_status, recv_status_eng)
VALUES (1, 2, 'Pending', 'Pending');

INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_status, recv_status_eng)
VALUES (2, 3, 'Received', 'Received');

INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_status, recv_status_eng)
VALUES (3, 4, 'Closed', 'Closed');

INSERT INTO evaluation_member (eval_committee_no, mem_no, recv_status, recv_status_eng)
VALUES (4, 5, 'Pending', 'Pending');


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
    constraint fk_eval_score_eval_no foreign key (eval_committee_no) references eval_committee (eval_committee_no) ON DELETE CASCADE,
    constraint fk_eval_score_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no) ON DELETE CASCADE,
    constraint fk_eval_score_mem_no foreign key (mem_no) references member (mem_no) ON DELETE CASCADE,
    constraint fk_eval_score_evall_no foreign key (evaluation_table_no) references evaluation_table (evaluation_table_no) ON DELETE CASCADE,
    constraint fk_eval_score_quest_no foreign key (question_no) references question (question_no) ON DELETE CASCADE
);

INSERT INTO eval_score (eval_score_no, score, eval_committee_no, rnd_plan_no, mem_no, evaluation_table_no, question_no) VALUES (1, 85, 1, 1, 1, 1, 1);
INSERT INTO eval_score (eval_score_no, score, eval_committee_no, rnd_plan_no, mem_no, evaluation_table_no, question_no) VALUES (2, 90, 1, 1, 2, 1, 1);
INSERT INTO eval_score (eval_score_no, score, eval_committee_no, rnd_plan_no, mem_no, evaluation_table_no, question_no) VALUES (3, 78, 1, 2, 3, 1, 2);
INSERT INTO eval_score (eval_score_no, score, eval_committee_no, rnd_plan_no, mem_no, evaluation_table_no, question_no) VALUES (4, 92, 2, 2, 1, 1, 2);
INSERT INTO eval_score (eval_score_no, score, eval_committee_no, rnd_plan_no, mem_no, evaluation_table_no, question_no) VALUES (5, 88, 2, 1, 2, 1, 3);


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
    read_state   varchar2(25) not null,
    data_category   varchar2(25) not null,
    mem_no          number(10,0) not null,
    constraint fk_noti_mno foreign key (mem_no) references member (mem_no)
);

alter table noti
    add constraint pk_notification
        primary key (notification_no);

INSERT INTO noti (notification_no, content, created_at, deleted_at, noti_content_no, noti_type, read_state, data_category, mem_no) VALUES (1, 'Evaluation results are available.', current_timestamp, null, null, 'INFO', 'UNREAD', 'EVALUATION', 1);
INSERT INTO noti (notification_no, content, created_at, deleted_at, noti_content_no, noti_type, read_state, data_category, mem_no) VALUES (2, 'New comments on your opinion.', current_timestamp, null, null, 'UPDATE', 'UNREAD', 'OPINION', 2);
INSERT INTO noti (notification_no, content, created_at, deleted_at, noti_content_no, noti_type, read_state, data_category, mem_no) VALUES (3, 'You have a new message.', current_timestamp, null, null, 'MESSAGE', 'READ', 'MESSAGE', 3);
INSERT INTO noti (notification_no, content, created_at, deleted_at, noti_content_no, noti_type, read_state, data_category, mem_no) VALUES (4, 'Upcoming deadlines for evaluations.', current_timestamp, null, null, 'REMINDER', 'UNREAD', 'EVALUATION', 1);
INSERT INTO noti (notification_no, content, created_at, deleted_at, noti_content_no, noti_type, read_state, data_category, mem_no) VALUES (5, 'Your opinion has been approved.', current_timestamp, null, null, 'APPROVAL', 'READ', 'OPINION', 2);


-- opinion
-- opinion
create sequence seq_opinion START WITH 1 INCREMENT BY 1 NOCYCLE;

create table opinion
(
    opinion_no        number(10,0) not null,
    mem_no            number(10,0) not null,
    content           CLOB not null,
    created_at        timestamp default current_timestamp,
    readhit           number(10,0) not null,
    ref               number(10,0) not null,
    step              number(10,0) not null,
    depth             number(1,0) not null,
    del_info          number(10,0) not null,
    deleted_at        timestamp default current_timestamp,
    eval_committee_no number(10,0) null,
    rnd_plan_no       number(10,0) not null,
    bucket_no         number(10,0) not null,
    constraint fk_opinion_eval_committee_no foreign key (eval_committee_no) references eval_committee (eval_committee_no) ON DELETE CASCADE,
    constraint fk_opinion_rnd_plan_no foreign key (rnd_plan_no) references rnd_plan (rnd_plan_no) ON DELETE CASCADE,
    constraint fk_opinion_mem_no foreign key (mem_no) references member (mem_no) ON DELETE CASCADE,
    constraint fk_opinion_bucket_no foreign key (bucket_no) references bucket (bucket_no) ON DELETE CASCADE
);

alter table opinion
    add constraint pk_opinion
        primary key (opinion_no);

INSERT INTO opinion (opinion_no, mem_no, content, created_at, readhit, ref, step, depth, del_info, deleted_at,
                     eval_committee_no, rnd_plan_no, bucket_no)
VALUES (NEXTVAL('seq_opinion'), 1, '첫 번째 의견', DEFAULT, 0, 1, 0, 0, 0, DEFAULT, 1, 1, 1);

INSERT INTO opinion (opinion_no, mem_no, content, created_at, readhit, ref, step, depth, del_info, deleted_at,
                     eval_committee_no, rnd_plan_no, bucket_no)
VALUES (NEXTVAL('seq_opinion'), 1, '첫 번째에대한 의견', DEFAULT, 0, 1, 1, 1, 0, DEFAULT, 1, 1, 1);



-- INSERT INTO opinion (opinion_no, mem_no, content, created_at, readhit, ref, step, depth, del_info, deleted_at, eval_committee_no, rnd_plan_no, bucket_no) VALUES (1, 1, 'I believe the evaluation process can be improved.', current_timestamp, 10, 0, 0, 0, 0, null, 1, 1, 1);
-- INSERT INTO opinion (opinion_no, mem_no, content, created_at, readhit, ref, step, depth, del_info, deleted_at, eval_committee_no, rnd_plan_no, bucket_no) VALUES (2, 2, 'The new criteria are beneficial.', current_timestamp, 5, 0, 0, 0, 0, null, 1, 1, 1);
-- INSERT INTO opinion (opinion_no, mem_no, content, created_at, readhit, ref, step, depth, del_info, deleted_at, eval_committee_no, rnd_plan_no, bucket_no) VALUES (3, 3, 'I have concerns about the transparency.', current_timestamp, 3, 0, 0, 0, 0, null, 1, 2, 1);
-- INSERT INTO opinion (opinion_no, mem_no, content, created_at, readhit, ref, step, depth, del_info, deleted_at, eval_committee_no, rnd_plan_no, bucket_no) VALUES (4, 1, 'More stakeholder input is needed.', current_timestamp, 4, 0, 0, 0, 0, null, 2, 2, 2);
-- INSERT INTO opinion (opinion_no, mem_no, content, created_at, readhit, ref, step, depth, del_info, deleted_at, eval_committee_no, rnd_plan_no, bucket_no) VALUES (5, 2, 'I support the current approach.', current_timestamp, 8, 0, 0, 0, 0, null, 2, 1, 2);
