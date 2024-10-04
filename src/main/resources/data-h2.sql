CREATE SEQUENCE seq_member START WITH 1 INCREMENT BY 1 NOCYCLE;

CREATE TABLE member
(
    member_id NUMBER NOT NULL,
    name      VARCHAR2(255) NOT NULL
);

INSERT INTO member (member_id, name)
VALUES (NEXT VALUE FOR seq_member, '황철원');