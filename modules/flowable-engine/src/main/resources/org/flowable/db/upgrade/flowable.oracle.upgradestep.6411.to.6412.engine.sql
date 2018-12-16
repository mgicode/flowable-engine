create table ACT_RU_ACTINST (
    ID_ NVARCHAR2(64) not null,
    REV_ INTEGER default 1,
    PROC_DEF_ID_ NVARCHAR2(64) not null,
    PROC_INST_ID_ NVARCHAR2(64) not null,
    EXECUTION_ID_ NVARCHAR2(64) not null,
    ACT_ID_ NVARCHAR2(255) not null,
    TASK_ID_ NVARCHAR2(64),
    CALL_PROC_INST_ID_ NVARCHAR2(64),
    ACT_NAME_ NVARCHAR2(255),
    ACT_TYPE_ NVARCHAR2(255) not null,
    ASSIGNEE_ NVARCHAR2(255),
    START_TIME_ TIMESTAMP(6) not null,
    END_TIME_ TIMESTAMP(6),
    DURATION_ NUMBER(19,0),
    DELETE_REASON_ NVARCHAR2(2000),
    TENANT_ID_ NVARCHAR2(255) default '',
    primary key (ID_)
);

create index ACT_IDX_RU_ACT_INST_START on ACT_RU_ACTINST(START_TIME_);
create index ACT_IDX_RU_ACT_INST_END on ACT_RU_ACTINST(END_TIME_);
create index ACT_IDX_RU_ACT_INST_PROCINST on ACT_RU_ACTINST(PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_RU_ACT_INST_EXEC on ACT_RU_ACTINST(EXECUTION_ID_, ACT_ID_);

create index ACT_IDX_ACTINST_EXECUTION on ACT_RU_ACTINST(PROC_INST_ID_);
alter table ACT_RU_ACTINST
    add constraint ACT_FK_RU_ACTINST_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_);

update ACT_GE_PROPERTY set VALUE_ = '6.4.1.2' where NAME_ = 'schema.version';