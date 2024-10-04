CREATE SEQUENCE seq_rnd_plan START WITH 1 INCREMENT BY 1 NOCYCLE;

CREATE TABLE rnd_plan
(
    rnd_plan_no NUMBER NOT NULL,
    task_name   VARCHAR2(255) NOT NULL
);

INSERT INTO rnd_plan (rnd_plan_no, task_name)
VALUES (NEXT VALUE FOR seq_rnd_plan, '과제명1');