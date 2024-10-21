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
    constraint fk_announcement_bucket_no foreign key (bucket_no) references bucket (bucket_no)
);

INSERT INTO bucket (BUCKET_NO)
VALUES (NEXTVAL('seq_bucket'));

INSERT INTO announcement(
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY,
    SPEC_INSTITUTION, ann_tech_field_name, ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE,
    STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
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
             1
         );

INSERT INTO bucket (BUCKET_NO)
VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement(
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY,
    SPEC_INSTITUTION, ann_tech_field_name, ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE,
    STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '환경부 공고 제2024 -567호',
             '2024년 제3차 환경 보호 프로젝트 지원계획 공고',
             '<p class="announcement-number">환경부 공고 제2024-567호</p>
              <h4>2024년도 환경 보호 혁신 프로젝트 신규과제 공고</h4>
              <p>환경부가 추진하는 『환경 보호 혁신 프로젝트』의 신규과제를 아래와 같이 공고하오니 많은 참여 바랍니다.</p>
              <p class="announcement-date">2024년 10월 20일</p>
              <div class="announcement-wrap">
                  <p class="Order department">&lt;주무부처&gt; 환경부 장관<span>김수진</span></p>
                  <p>
                  <p class="professional-organization">
                      &lt;전문기관&gt; 한국환경산업기술원 원장<span>이민호</span></p>
              </div>
              <h5>가. 사업목적</h5>
              <p>환경 보호 및 지속 가능한 발전을 위한 혁신적인 접근 방식 개발 지원</p>
              <h5>나. 사업내용</h5>
              <p>(설계)<br>- 다양한 환경 보호 분야에서의 혁신적 프로젝트 지원</p>',
             '환경부',
             '한국환경산업기술원',
            '환경',
             '지정공모',
             4,
             '신청용 연구개발계획서',
             '접수중',
             '2024-10-21',
             '2024-12-15',
             '2024-10-01',
             NULL,
             2
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '과학기술정보통신부 공고 제2024-001호',
             '2024년도 신기술 융합 프로젝트 공고',
             '<p class="announcement-number">과학기술정보통신부 공고 제2024-001호</p>
             <h4>2024년도 신기술 융합 연구 과제 선정 공고</h4>
             <p>본 연구과제는 신기술 융합을 통해 산업 경쟁력을 높이기 위한 연구를 지원합니다. 관심 있는 연구자들의 많은 참여 바랍니다.</p>
             <h5>가. 사업목적</h5>
             <p>첨단 기술을 융합하여 국가 경쟁력 강화를 목표로 함.</p>
             <h5>나. 지원대상</h5>
             <p>국내 연구기관 및 기업 대상.</p>
             <p class="announcement-date">2024년 1월 10일</p>',
             '과학기술정보통신부',
             '한국과학기술기획평가원',
             '물리학',
             '지정공모',
             4,
             '신청서 제출',
             '접수중',
             '2024-10-01',
             '2024-11-10',
             '2024-08-01',
             NULL,
             3
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '산업통상자원부 공고 제2024-002호',
             '2024년 산업기술개발 연구 공모',
             '<p class="announcement-number">산업통상자원부 공고 제2024-002호</p>
             <h4>2024년도 산업기술개발사업 신규 과제 공모</h4>
             <p>산업기술 분야의 혁신을 위한 연구개발을 지원합니다. 선정된 연구기관은 산업 발전을 위해 주요 과제를 수행하게 됩니다.</p>
             <h5>가. 사업목적</h5>
             <p>산업기술 혁신을 통한 국가 경쟁력 강화 및 고도화.</p>
             <h5>나. 사업내용</h5>
             <p>(1) 혁신 기술 개발<br>(2) 기존 기술 개선 및 고도화.</p>
             <p class="announcement-date">2024년 2월 20일</p>',
             '산업통상자원부',
             '한국산업기술진흥원',
             '기계',
             '자유공모',
             4,
             '연구개발계획서 제출',
             '접수예정',
             '2024-11-01',
             '2024-12-15',
             '2024-08-02',
             NULL,
             4
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '국토교통부 공고 제2024-003호',
             '국토교통 연구개발 지원사업 공고',
             '<p class="announcement-number">국토교통부 공고 제2024-003호</p>
             <h4>2024년도 국토교통 R&D 지원 사업 신규과제 공모</h4>
             <p>본 공모는 국토교통 기술개발을 위한 중점 연구 과제를 선정하여 지원하는 프로그램입니다. 국토 교통 산업의 발전에 기여하고자 합니다.</p>
             <h5>가. 사업목적</h5>
             <p>국토교통 분야의 혁신 기술 개발 및 스마트 시티 관련 연구 지원.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 연구기관 및 대학, 기업.</p>
             <p class="announcement-date">2024년 3월 5일</p>',
             '국토교통부',
             '국토교통과학기술진흥원',
             '건설/교통',
             '분야공모',
             4,
             '연구계획서',
             '접수중',
             '2024-11-15',
             '2024-12-30',
             '2024-08-03',
             NULL,
             5
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '과학기술정보통신부 공고 제2024-101호',
             '2024년도 ICT 연구개발 지원사업 공고',
             '<p class="announcement-number">과학기술정보통신부 공고 제2024-101호</p>
             <h4>2024년도 ICT 신기술 연구개발 지원사업 신규과제 공모</h4>
             <p>본 사업은 ICT 신기술 개발을 위해 연구과제를 지원하는 프로그램입니다. 혁신적인 ICT 기술을 통해 국가 산업 경쟁력을 강화하고자 합니다.</p>
             <h5>가. 사업목적</h5>
             <p>ICT 신기술 개발을 통한 국가 경제 발전 및 경쟁력 제고.</p>
             <h5>나. 지원대상</h5>
             <p>국내 대학 및 연구기관, ICT 관련 기업.</p>
             <p class="announcement-date">2024년 3월 10일</p>',
             '과학기술정보통신부',
             '정보통신기획평가원',
             '전기/전자',
             '지정공모',
             4,
             '연구계획서',
             '접수중',
             '2024-10-20',
             '2024-12-31',
             '2024-08-10',
             NULL,
             6
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '중소벤처기업부 공고 제2024-102호',
             '2024년 중소기업 기술개발 지원사업 공고',
             '<p class="announcement-number">중소벤처기업부 공고 제2024-102호</p>
             <h4>2024년도 중소기업 기술개발 신규과제 지원 공모</h4>
             <p>본 사업은 중소기업의 기술 개발을 위해 연구과제를 지원합니다. 참여 중소기업은 기술 개발 및 사업화까지 전 주기를 지원받게 됩니다.</p>
             <h5>가. 사업목적</h5>
             <p>중소기업의 기술 경쟁력 강화를 통한 경제 활성화.</p>
             <h5>나. 지원대상</h5>
             <p>국내 중소기업 및 연구기관.</p>
             <p class="announcement-date">2024년 3월 15일</p>',
             '중소벤처기업부',
             '중소기업기술정보진흥원',
             '전기전자',
             '자유공모',
             4,
             '기술개발계획서',
             '접수중',
             '2024-10-25',
             '2024-12-20',
             '2024-08-12',
             NULL,
             7
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '국토교통부 공고 제2024-103호',
             '2024년 국토교통 기술개발사업 공고',
             '<p class="announcement-number">국토교통부 공고 제2024-103호</p>
             <h4>2024년도 국토교통 기술개발 신규과제 공모</h4>
             <p>국토교통 산업의 기술 발전을 위해 연구과제를 선정하여 지원하는 사업입니다. 다양한 국토교통 관련 연구개발을 수행할 연구자들의 참여를 바랍니다.</p>
             <h5>가. 사업목적</h5>
             <p>국토교통 기술 혁신을 통한 산업 발전 및 기술 경쟁력 강화.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 연구기관 및 관련 기업.</p>
             <p class="announcement-date">2024년 4월 5일</p>',
             '국토교통부',
             '국토교통과학기술진흥원',
             '건설/교통',
             '분야공모',
             4,
             '계획서 제출',
             '접수예정',
             '2024-11-01',
             '2025-01-15',
             '2024-08-13',
             NULL,
             8
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '해양수산부 공고 제2024-104호',
             '2024년 해양수산 연구개발 지원 공고',
             '<p class="announcement-number">해양수산부 공고 제2024-104호</p>
             <h4>2024년도 해양수산 연구개발 지원사업 신규과제 공모</h4>
             <p>해양수산 분야의 기술 연구 및 개발을 위해 신규과제를 모집합니다. 지속 가능한 해양 자원의 활용을 목표로 합니다.</p>
             <h5>가. 사업목적</h5>
             <p>해양수산 기술 연구를 통한 자원 관리 및 산업 발전.</p>
             <h5>나. 지원대상</h5>
             <p>해양수산 관련 국내 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 4월 15일</p>',
             '해양수산부',
             '해양수산과학기술진흥원',
             '생명과학',
             '지정공모',
             4,
             '연구개발계획서 제출',
             '접수중',
             '2024-11-05',
             '2025-01-10',
             '2024-08-14',
             NULL,
             9
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '보건복지부 공고 제2024-105호',
             '2024년 보건의료기술 연구개발 지원사업 공고',
             '<p class="announcement-number">보건복지부 공고 제2024-105호</p>
             <h4>2024년도 보건의료기술 연구개발 지원사업 신규과제 공모</h4>
             <p>보건의료 분야의 신기술 연구개발을 위해 신규과제를 모집합니다. 건강한 사회를 위한 기술 개발에 기여할 연구자들의 많은 참여를 바랍니다.</p>
             <h5>가. 사업목적</h5>
             <p>보건의료 신기술 개발을 통한 국민 건강 증진 및 의료 서비스 개선.</p>
             <h5>나. 지원대상</h5>
             <p>보건의료 관련 국내 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 4월 25일</p>',
             '보건복지부',
             '한국보건산업진흥원',
             '보건의료',
             '지정공모',
             4,
             '계획서 제출',
             '접수중',
             '2024-11-10',
             '2025-01-05',
             '2024-08-15',
             NULL,
             10
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '환경부 공고 제2024-106호',
             '2024년 환경기술 연구개발 지원사업 공고',
             '<p class="announcement-number">환경부 공고 제2024-106호</p>
             <h4>2024년도 환경기술 연구개발 신규과제 공모</h4>
             <p>본 공모는 환경기술 개발을 통해 지속 가능한 환경 보호 및 자원 관리를 목표로 하고 있습니다. 연구자들의 많은 참여 바랍니다.</p>
             <h5>가. 사업목적</h5>
             <p>환경보호 기술 개발을 통한 자원 절약 및 친환경 산업 육성.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 환경기술 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 5월 10일</p>',
             '환경부',
             '한국환경산업기술원',
             '환경',
             '자유공모',
             4,
             '연구계획서',
             '접수예정',
             '2024-12-01',
             '2025-02-01',
             '2024-09-01',
             NULL,
             11
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '기상청 공고 제2024-107호',
             '2024년 기상기술 연구개발 지원사업 공고',
             '<p class="announcement-number">기상청 공고 제2024-107호</p>
             <h4>2024년도 기상기술 연구개발 신규과제 공모</h4>
             <p>기상기술 발전을 위한 연구개발 과제를 모집합니다. 기상 예측 및 재해 예방을 위한 첨단 기술 개발을 목표로 하고 있습니다.</p>
             <h5>가. 사업목적</h5>
             <p>첨단 기상기술 개발을 통한 재난 예방 및 기후 변화 대응.</p>
             <h5>나. 지원대상</h5>
             <p>국내 기상 연구기관 및 관련 기업.</p>
             <p class="announcement-date">2024년 5월 15일</p>',
             '기상청',
             '한국기상산업기술원',
             '지구과학',
             '분야공모',
             4,
             '기술개발계획서',
             '접수중',
             '2024-11-20',
             '2025-01-20',
             '2024-09-05',
             NULL,
             12
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '보건복지부 공고 제2024-108호',
             '2024년 감염병 예방 및 대응기술 개발 지원 공고',
             '<p class="announcement-number">보건복지부 공고 제2024-108호</p>
             <h4>2024년도 감염병 예방 및 대응기술 연구개발 공모</h4>
             <p>본 공모는 감염병 예방 및 대응기술을 연구개발하여 국가 보건 안전을 강화하는 것을 목표로 하고 있습니다.</p>
             <h5>가. 사업목적</h5>
             <p>감염병 대응기술 개발을 통한 국민 건강 증진 및 보건 안전 강화.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 보건 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 5월 20일</p>',
             '보건복지부',
             '질병관리청',
             '보건의료',
             '지정공모',
             4,
             '연구계획서 제출',
             '접수중',
             '2024-12-10',
             '2025-02-10',
             '2024-09-10',
             NULL,
             13
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '해양수산부 공고 제2024-109호',
             '2024년 해양기술 연구개발 지원사업 공고',
             '<p class="announcement-number">해양수산부 공고 제2024-109호</p>
             <h4>2024년도 해양기술 연구개발 신규과제 공모</h4>
             <p>해양기술 분야의 혁신 연구개발을 위해 신규 과제를 모집합니다. 해양 자원 개발 및 환경 보호를 위한 기술적 솔루션을 개발하는 것이 목표입니다.</p>
             <h5>가. 사업목적</h5>
             <p>해양 자원 개발 및 지속 가능한 해양 환경 보호 기술 개발.</p>
             <h5>나. 지원대상</h5>
             <p>국내 해양기술 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 6월 1일</p>',
             '해양수산부',
             '해양수산과학기술진흥원',
             '생명과학',
             '자유공모',
             4,
             '기술개발계획서 제출',
             '접수중',
             '2024-12-15',
             '2025-02-28',
             '2024-09-15',
             NULL,
             14
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '국방부 공고 제2024-110호',
             '2024년 방위산업 기술개발 지원사업 공고',
             '<p class="announcement-number">국방부 공고 제2024-110호</p>
             <h4>2024년도 방위산업 기술개발 신규과제 공모</h4>
             <p>방위산업 발전을 위한 기술개발 과제를 모집합니다. 국방 산업의 기술 혁신과 자주 국방 역량 강화를 목표로 하고 있습니다.</p>
             <h5>가. 사업목적</h5>
             <p>방위산업 기술 개발을 통한 국가 안보 강화 및 자주 국방 역량 제고.</p>
             <h5>나. 지원대상</h5>
             <p>국내 방위산업 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 6월 15일</p>',
             '국방부',
             '국방기술품질원',
             '기계',
             '지정공모',
             4,
             '연구개발계획서',
             '접수예정',
             '2024-12-20',
             '2025-03-01',
             '2024-09-20',
             NULL,
             15
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '과학기술정보통신부 공고 제2024-111호',
             '2024년 정보통신기술 연구개발 지원사업 공고',
             '<p class="announcement-number">과학기술정보통신부 공고 제2024-111호</p>
             <h4>2024년도 정보통신기술 연구개발 신규과제 공모</h4>
             <p>정보통신기술 발전을 위한 신규 과제를 모집합니다. IT 산업 발전과 4차 산업혁명 기술 개발에 기여하는 프로젝트입니다.</p>
             <h5>가. 사업목적</h5>
             <p>IT 기술 개발을 통한 국가 경쟁력 강화 및 4차 산업혁명 대비.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 IT 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 7월 1일</p>',
             '과학기술정보통신부',
             '정보통신기획평가원',
             '전기/전자',
             '품목지정공모',
             4,
             '기술계획서 제출',
             '접수중',
             '2024-12-25',
             '2025-03-15',
             '2024-09-25',
             NULL,
             16
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '산림청 공고 제2024-112호',
             '2024년 산림자원 개발사업 지원 공고',
             '<p class="announcement-number">산림청 공고 제2024-112호</p>
             <h4>2024년도 산림자원 개발사업 신규과제 공모</h4>
             <p>산림 자원 보호 및 산림 자원 활용을 위한 연구개발 사업을 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>산림 자원의 지속 가능한 관리 및 활용을 위한 기술 개발.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 산림 자원 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 7월 10일</p>',
             '산림청',
             '한국임업진흥원',
             '재료',
             '지정공모',
             4,
             '연구개발계획서',
             '접수예정',
             '2025-01-10',
             '2025-03-10',
             '2024-09-30',
             NULL,
             17
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '보건복지부 공고 제2024-113호',
             '2024년 의료기술 연구개발 지원사업 공고',
             '<p class="announcement-number">보건복지부 공고 제2024-113호</p>
             <h4>2024년도 의료기술 연구개발 신규과제 공모</h4>
             <p>의료기술 발전을 위한 연구개발 사업을 공모합니다.</p>
             <h5>가. 사업목적</h5>
             <p>의료기술 개발을 통한 국민 보건 증진 및 의료 기술 혁신.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 의료기술 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 8월 1일</p>',
             '보건복지부',
             '국가신약개발사업단',
             '보건의료',
             '지정공모',
             4,
             '연구개발계획서',
             '접수마감',
             '2024-09-01',
             '2024-10-15',
             '2024-07-01',
             NULL,
             18
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '국방부 공고 제2024-114호',
             '2024년 자주국방 기술개발 지원사업 공고',
             '<p class="announcement-number">국방부 공고 제2024-114호</p>
             <h4>2024년도 자주국방 기술개발 신규과제 공모</h4>
             <p>국방 기술 혁신을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>국방 기술 개발을 통한 국가 안보 강화 및 자주국방 실현.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 국방 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 8월 15일</p>',
             '국방부',
             '국방기술품질원',
             '기계',
             '품목지정공모',
             4,
             '연구개발계획서',
             '접수예정',
             '2024-12-15',
             '2025-03-01',
             '2024-09-25',
             NULL,
             19
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '행정안전부 공고 제2024-115호',
             '2024년 재난안전기술 연구개발 지원사업 공고',
             '<p class="announcement-number">행정안전부 공고 제2024-115호</p>
             <h4>2024년도 재난안전기술 연구개발 신규과제 공모</h4>
             <p>재난 대응 및 안전 기술 개발을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>재난 대응 기술 개발을 통한 국민 안전 보장.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 안전기술 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 9월 1일</p>',
             '행정안전부',
             '국립재난안전연구원',
             '원자력',
             '지정공모',
             4,
             '기술개발계획서 제출',
             '접수마감',
             '2024-09-20',
             '2024-11-15',
             '2024-08-01',
             NULL,
             20
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '중소벤처기업부 공고 제2024-116호',
             '2024년 중소기업 기술개발 지원사업 공고',
             '<p class="announcement-number">중소벤처기업부 공고 제2024-116호</p>
             <h4>2024년도 중소기업 기술개발 지원 신규과제 공모</h4>
             <p>중소기업 기술 역량 강화를 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>중소기업 기술개발을 통한 기술 경쟁력 강화 및 시장 확대.</p>
             <h5>나. 지원대상</h5>
             <p>국내 중소기업 및 연구기관.</p>
             <p class="announcement-date">2024년 9월 15일</p>',
             '중소벤처기업부',
             '중소기업기술정보진흥원',
             '전기/전자',
             '자유공모',
             4,
             '연구계획서 제출',
             '접수마감',
             '2024-09-30',
             '2024-11-20',
             '2024-08-10',
             NULL,
             21
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '식품의약품안전처 공고 제2024-117호',
             '2024년 의약품 안전기술 연구개발 지원사업 공고',
             '<p class="announcement-number">식품의약품안전처 공고 제2024-117호</p>
             <h4>2024년도 의약품 안전기술 연구개발 신규과제 공모</h4>
             <p>의약품 안전성을 확보하기 위한 기술개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>의약품 안전성을 위한 기술 개발 및 보건 향상.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 의약품 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 10월 1일</p>',
             '식품의약품안전처',
             '식품의약품안전평가원',
             '보건의료',
             '지정공모',
             4,
             '기술계획서',
             '접수예정',
             '2025-01-01',
             '2025-03-31',
             '2024-09-01',
             NULL,
             22
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '농림축산식품부 공고 제2024-118호',
             '2024년 농식품 기술 연구개발 지원사업 공고',
             '<p class="announcement-number">농림축산식품부 공고 제2024-118호</p>
             <h4>2024년도 농식품 기술 연구개발 신규과제 공모</h4>
             <p>농식품 산업 발전을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>농식품 산업 기술 혁신 및 경쟁력 강화를 위한 연구.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 농식품 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 10월 15일</p>',
             '농림축산식품부',
             '농림식품기술기획평가원',
             '농림수산식품',
             '자유공모',
             4,
             '연구계획서 제출',
             '접수예정',
             '2025-02-01',
             '2025-04-30',
             '2024-09-10',
             NULL,
             23
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '우주항공청 공고 제2024-119호',
             '2024년 우주항공 기술개발 지원사업 공고',
             '<p class="announcement-number">우주항공청 공고 제2024-119호</p>
             <h4>2024년도 우주항공 기술개발 신규과제 공모</h4>
             <p>우주항공 기술 혁신을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>우주항공 기술 개발을 통한 국가 경쟁력 확보 및 기술력 강화.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 우주항공 기술 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 11월 1일</p>',
             '우주항공청',
             '우주항공청',
             '지구과학',
             '지정공모',
             4,
             '연구계획서 제출',
             '접수예정',
             '2025-03-01',
             '2025-05-31',
             '2024-09-20',
             NULL,
             24
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '경찰청 공고 제2024-120호',
             '2024년 치안기술 연구개발 지원사업 공고',
             '<p class="announcement-number">경찰청 공고 제2024-120호</p>
             <h4>2024년도 치안기술 연구개발 신규과제 공모</h4>
             <p>치안 및 사회 안전을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>국가 치안 기술력 향상을 위한 연구개발 지원.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 치안 기술 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 11월 15일</p>',
             '경찰청',
             '과학치안진흥센터',
             '건설/교통',
             '분야공모',
             4,
             '연구개발계획서',
             '접수마감',
             '2024-12-01',
             '2025-02-28',
             '2024-10-01',
             NULL,
             25
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '해양수산부 공고 제2024-121호',
             '2024년 해양기술 연구개발 지원사업 공고',
             '<p class="announcement-number">해양수산부 공고 제2024-121호</p>
             <h4>2024년도 해양기술 연구개발 신규과제 공모</h4>
             <p>해양 자원 및 해양 환경 보호를 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>해양 자원의 지속 가능성 확보 및 기술 개발.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 해양 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 7월 20일</p>',
             '해양수산부',
             '한국해양수산개발원',
             '생명과학',
             '자유공모',
             4,
             '연구계획서',
             '접수마감',
             '2024-08-01',
             '2024-09-30',
             '2024-06-15',
             NULL,
             26
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '환경부 공고 제2024-122호',
             '2024년 환경기술 연구개발 지원사업 공고',
             '<p class="announcement-number">환경부 공고 제2024-122호</p>
             <h4>2024년도 환경기술 연구개발 신규과제 공모</h4>
             <p>환경 보호와 지속 가능한 발전을 위한 기술 개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>환경 보존 기술 및 재생에너지 기술 개발 지원.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 환경 기술 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 8월 15일</p>',
             '환경부',
             '한국환경산업기술원',
             '환경',
             '지정공모',
             4,
             '기술계획서',
             '접수마감',
             '2024-09-01',
             '2024-10-30',
             '2024-07-20',
             NULL,
             27
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '과학기술정보통신부 공고 제2024-123호',
             '2024년 정보통신 기술개발 지원사업 공고',
             '<p class="announcement-number">과학기술정보통신부 공고 제2024-123호</p>
             <h4>2024년도 정보통신 기술개발 신규과제 공모</h4>
             <p>정보통신 기술 혁신을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>정보통신 기술력 강화를 통한 국가 디지털 경쟁력 제고.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 정보통신 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 9월 1일</p>',
             '과학기술정보통신부',
             '정보통신기술진흥센터',
             '정보/통신',
             '분야공모',
             4,
             '연구개발계획서',
             '접수마감',
             '2024-09-20',
             '2024-11-15',
             '2024-07-10',
             NULL,
             28
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '고용노동부 공고 제2024-124호',
             '2024년 노동환경 개선 연구 지원사업 공고',
             '<p class="announcement-number">고용노동부 공고 제2024-124호</p>
             <h4>2024년도 노동환경 개선 연구개발 신규과제 공모</h4>
             <p>노동환경 개선을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>노동자의 건강과 안전을 보장하기 위한 기술 개발 지원.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 9월 10일</p>',
             '고용노동부',
             '안전보건공단',
             '인문학',
             '지정공모',
             4,
             '기술계획서 제출',
             '접수마감',
             '2024-10-01',
             '2024-11-30',
             '2024-08-15',
             NULL,
             29
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '문화체육관광부 공고 제2024-125호',
             '2024년 문화콘텐츠 산업 육성 지원사업 공고',
             '<p class="announcement-number">문화체육관광부 공고 제2024-125호</p>
             <h4>2024년도 문화콘텐츠 산업 육성 연구개발 신규과제 공모</h4>
             <p>문화콘텐츠 산업 발전을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>문화콘텐츠 기술 개발을 통한 산업 경쟁력 강화.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 문화콘텐츠 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 9월 20일</p>',
             '문화체육관광부',
             '한국콘텐츠진흥원',
             '인문학',
             '분야공모',
             4,
             '기술개발계획서',
             '접수마감',
             '2024-09-25',
             '2024-11-15',
             '2024-07-30',
             NULL,
             30
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '산업통상자원부 공고 제2024-126호',
             '2024년 산업기술 연구개발 지원사업 공고',
             '<p class="announcement-number">산업통상자원부 공고 제2024-126호</p>
             <h4>2024년도 산업기술 연구개발 신규과제 공모</h4>
             <p>산업 기술 혁신을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>국내 산업기술 발전을 통한 글로벌 경쟁력 강화.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 산업기술 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 9월 25일</p>',
             '산업통상자원부',
             '한국산업기술진흥원',
             '사회과학',
             '지정공모',
             4,
             '기술계획서',
             '접수마감',
             '2024-10-15',
             '2024-12-30',
             '2024-08-01',
             NULL,
             31
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '중소벤처기업부 공고 제2024-127호',
             '2024년 중소기업 기술개발 지원사업 공고',
             '<p class="announcement-number">중소벤처기업부 공고 제2024-127호</p>
             <h4>2024년도 중소기업 기술개발 신규과제 공모</h4>
             <p>중소기업 기술 혁신을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>중소기업의 기술 경쟁력 강화를 위한 지원.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 중소기업 및 관련 연구기관.</p>
             <p class="announcement-date">2024년 10월 1일</p>',
             '중소벤처기업부',
             '중소기업기술정보진흥원',
             '화공',
             '자유공모',
             4,
             '연구개발계획서',
             '접수마감',
             '2024-11-01',
             '2024-12-31',
             '2024-09-01',
             NULL,
             32
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '농촌진흥청 공고 제2024-128호',
             '2024년 농업기술 연구개발 지원사업 공고',
             '<p class="announcement-number">농촌진흥청 공고 제2024-128호</p>
             <h4>2024년도 농업기술 연구개발 신규과제 공모</h4>
             <p>농업 기술 발전을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>농업 기술의 혁신 및 식량안보 확보.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 농업 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 10월 5일</p>',
             '농촌진흥청',
             '농촌진흥청',
             '농림수산식품',
             '지정공모',
             4,
             '기술계획서',
             '접수마감',
             '2024-10-20',
             '2025-01-15',
             '2024-08-10',
             NULL,
             33
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '여성가족부 공고 제2024-129호',
             '2024년 양성평등 연구 지원사업 공고',
             '<p class="announcement-number">여성가족부 공고 제2024-129호</p>
             <h4>2024년도 양성평등 연구개발 신규과제 공모</h4>
             <p>양성평등 및 인권 향상을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>양성평등 문화 조성 및 사회적 가치 증진을 위한 연구개발.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 연구기관 및 관련 기업.</p>
             <p class="announcement-date">2024년 10월 10일</p>',
             '여성가족부',
             '한국양성평등교육진흥원',
             '인문학',
             '분야공모',
             4,
             '기술개발계획서',
             '접수마감',
             '2024-11-01',
             '2025-01-15',
             '2024-09-05',
             NULL,
             34
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '보건복지부 공고 제2024-130호',
             '2024년 보건의료 연구개발 지원사업 공고',
             '<p class="announcement-number">보건복지부 공고 제2024-130호</p>
             <h4>2024년도 보건의료 연구개발 신규과제 공모</h4>
             <p>보건의료 분야의 혁신 기술 개발을 위한 연구개발 과제를 모집합니다.</p>
             <h5>가. 사업목적</h5>
             <p>보건의료 기술 발전 및 국민 건강 증진을 위한 연구개발 지원.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 보건의료 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 10월 15일</p>',
             '보건복지부',
             '한국보건산업진흥원',
             '보건의료',
             '자유공모',
             4,
             '연구계획서 제출',
             '접수마감',
             '2024-12-01',
             '2025-02-28',
             '2024-09-10',
             NULL,
             35
         );

INSERT INTO bucket (BUCKET_NO) VALUES (NEXTVAL('seq_bucket'));
INSERT INTO announcement (
    ANN_NO, TOTAL_ANN_NO, TOTAL_TITLE, CONTENT, COMPETENT_MINISTRY, SPEC_INSTITUTION, ann_tech_field_name,
    ANN_TYPE, SUB_ANN_COUNT, RECEPTION_TYPE, STATUS, STARTED_AT, CLOSED_AT, CREATED_AT, UPDATED_AT, BUCKET_NO
) VALUES (
             NEXTVAL('seq_announcement'),
             '보건복지부 공고 제2024-113호',
             '2024년 의료기술 연구개발 지원사업 공고',
             '<p class="announcement-number">보건복지부 공고 제2024-113호</p>
             <h4>2024년도 의료기술 연구개발 신규과제 공모</h4>
             <p>의료기술 발전을 위한 연구개발 사업을 공모합니다.</p>
             <h5>가. 사업목적</h5>
             <p>의료기술 개발을 통한 국민 보건 증진 및 의료 기술 혁신.</p>
             <h5>나. 지원대상</h5>
             <p>국내외 의료기술 관련 연구기관 및 기업.</p>
             <p class="announcement-date">2024년 8월 1일</p>',
             '보건복지부',
             '국가신약개발사업단',
             '보건의료',
             '지정공모',
             4,
             '연구개발계획서',
             '접수마감',
             '2024-09-01',
             '2024-10-15',
             '2023-07-01',
             NULL,
             36
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
    TASK_TYPE           VARCHAR2(50) not null,
    spec_institution_no varchar2(50) not null,
    tech_field_name     varchar2(100) not null,
    mgr_name            varchar2(20) not null,
    mgr_tel         varchar2(20) not null,
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

INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME,
                              MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH, ONE_YEAR_SUBSIDY,
                              ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-01', '저탄소 연료생산을 위한 이산화탄소 전환기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-01',
        '에너지/자원 > 온실가스 처리 > CO2 전환기술', '이민수', '02-231-1202', '2024', 3600000, 36, 285000, 3, '연구기관귀속', '1', '1');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME,
                              MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH, ONE_YEAR_SUBSIDY,
                              ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-02', 'Ge-on-Si 단파장 적외선 이미지센서 및 카메라 시스템 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-02',
        '전기/전자 > 반도체 소자·회로 > 반도체 재료', '이민선', '02-231-1207', '2024', 3600000, 36, 285000, 3, '연구기관귀속', '1', '1');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME,
                              MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH, ONE_YEAR_SUBSIDY,
                              ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-03', '저궤도 상 On-board AI 영상 처리 시스템 장착 초소형 위성 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-03',
        '기계 > 우주시스템 > 우주시스템 추적/관제/수신/활용 기술', '이훈희', '02-231-3697', '2024', 3600000, 36, 285000, 3, '연구기관귀속', '1', '1');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME,
                              MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH, ONE_YEAR_SUBSIDY,
                              ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-04', '자가 적응 AI 기반 이차전지 모듈팩 통합 시스템 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-04',
        '정보/통신 > 정보이론 > 인공지능', '이민성', '02-231-5617', '2024', 3600000, 36, 285000, 3, '연구기관귀속', '1', '1');

INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-11', '전력망 스마트화 기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-11', '에너지/자원 > 전력 > 스마트 그리드 기술', '장민호', '02-231-1212', '2024', 4000000, 36, 300000, 3, '연구기관귀속', '2', '2');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-12', '차세대 에너지 저장 기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-12', '에너지/자원 > 에너지 저장 > 배터리 기술', '이수진', '02-231-1213', '2024', 3900000, 36, 290000, 3, '연구기관귀속', '2', '2');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-13', '스마트 물류 관리 시스템 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-13', '물류/운송 > 스마트 물류 > 물류 자동화 기술', '안성준', '02-231-1214', '2024', 4500000, 36, 340000, 3, '연구기관귀속', '2', '2');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-14', '농업 빅데이터 활용 기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-14', '농업/식품 > 데이터 활용 > 빅데이터 분석 기술', '이한솔', '02-231-1215', '2024', 3600000, 36, 280000, 3, '연구기관귀속', '2', '2');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-15', '스마트 농업 솔루션 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-15', '농업/식품 > 스마트 농업 > 농업 자동화 기술', '김태희', '02-231-1216', '2024', 4200000, 36, 320000, 3, '연구기관귀속', '3', '3');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-16', '차세대 식물 공장 기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-16', '농업/식품 > 식물공장 > 자동화 기술', '하정우', '02-231-1217', '2024', 4800000, 36, 360000, 3, '연구기관귀속', '3', '3');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-17', '스마트 온실 기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-17', '농업/식품 > 스마트 온실 > 온실 관리 기술', '이재현', '02-231-1218', '2024', 4300000, 36, 330000, 3, '연구기관귀속', '3', '3');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-18', '농업 자원 효율화를 위한 연구', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-18', '농업/식품 > 자원 관리 > 농업 효율화 기술', '정유진', '02-231-1219', '2024', 3900000, 36, 290000, 3, '연구기관귀속', '3', '3');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-19', '스마트 축산 기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-19', '농업/식품 > 축산업 > 스마트 축산 기술', '이상훈', '02-231-1220', '2024', 4200000, 36, 310000, 3, '연구기관귀속', '4', '4');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-20', '수산물 유통 기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-20', '농업/식품 > 수산업 > 유통 기술', '문수영', '02-231-1221', '2024', 4400000, 36, 340000, 3, '연구기관귀속', '4', '4');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-21', '고급 수산물 가공 기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-21', '농업/식품 > 수산물 가공 > 가공 기술', '장다솜', '02-231-1222', '2024', 4600000, 36, 350000, 3, '연구기관귀속', '4', '4');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-22', '스마트 식품 안전 관리 기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-22', '농업/식품 > 식품 안전 > 안전 관리 기술', '이민주', '02-231-1223', '2024', 4700000, 36, 360000, 3, '연구기관귀속', '4', '4');
INSERT INTO sub_announcement (SUB_ANN_NO, SUB_ANN_UNI_NO, SUB_TITLE, PLAN_TYPE, TASK_TYPE, SPEC_INSTITUTION_NO,
                              TECH_FIELD_NAME, MGR_NAME, MGR_TEL, PLANNING_YEAR, TOTAL_SUBSIDY, TOTAL_DEV_MONTH,
                              ONE_YEAR_SUBSIDY, ONE_YEAR_DEV_MONTH, perf_owner, ANN_NO, BUCKET_NO)
VALUES (NEXTVAL('seq_sub_announcement'), 'RM-2024-23', '스마트 시티 구축을 위한 기술 개발', '신청용 연구개발계획서', '(일반)연구개발과제',
        '2024-DCP-23', '도시/환경 > 스마트 시티 > 도시 관리 기술', '김민지', '02-231-1224', '2024', 5000000, 36, 400000, 3, '연구기관귀속', '18', '18');

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
create sequence seq_mem_tech_field START WITH 1 INCREMENT BY 1 NOCYCLE;

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