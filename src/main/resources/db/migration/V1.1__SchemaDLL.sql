-- 1) Create Docker Container
-- docker run -dit --name oracle-db-container -p 51234:1521 -e DB_SID=IMSDB store/oracle/database-enterprise:12.2.0.1-slim

-- 2) Connect to the database instance (SYS AS SYSDBA; Oradoc_db1), create DBA
-- and then connect to the database as the DBA
--CREATE USER C##AL IDENTIFIED BY AL;
--GRANT DBA TO C##AL;

-- 3) Launch the app and then create the app user account
--CREATE USER C##APP_USER IDENTIFIED BY APP;
--GRANT CREATE SESSION TO C##APP_USER;
--GRANT SELECT, INSERT, UPDATE, DELETE ON PRODUCTS TO C##APP_USER;
--GRANT SELECT, INSERT ON AUDIT_PRODUCTS TO C##APP_USER;
--GRANT SELECT, INSERT, UPDATE, DELETE ON ORDERS TO C##APP_USER;

-- 4) After successful launch, terminate the app and in the application.properties file,
-- disable flyway and change the user details to match the app user above; then re-launch the app

-- TABLES DDL
CREATE TABLE C##AL.PRODUCTS (
     ID NUMBER,
     NAME VARCHAR2(50),
     INVENTORY_COUNT NUMBER(10),
     UNIT_PRICE NUMBER(*,2),
     PRIMARY KEY(ID)
);

CREATE TABLE C##AL.AUDIT_PRODUCTS (
     ID NUMBER,
     NAME VARCHAR2(50),
     UNIT_PRICE NUMBER(*,2),
     INVENTORY_COUNT NUMBER(10),
     INVENTORY_CHANGE NUMBER(10),
     REVISION_TYPE VARCHAR2(6),
     REVISION_TSTMP TIMESTAMP,
     PRODUCT_ID NUMBER,
     PRIMARY KEY(ID)
);

CREATE TABLE C##AL.ORDERS (
     ID NUMBER,
     CUSTOMER_NAME VARCHAR2(50),
     QUANTITY NUMBER(10),
     ORDER_PRICE NUMBER(*,2),
     TSTMP TIMESTAMP,
     PRODUCT_ID NUMBER,
     PRIMARY KEY(ID)
);

-- SEQUENCES DDL
CREATE SEQUENCE SEQ_PRODUCTS_ID START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SEQ_ORDERS_ID START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SEQ_AUDIT_PRODUCTS_ID START WITH 1 INCREMENT BY 1;

