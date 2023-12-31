declare
    column_exists exception;
    pragma exception_init (column_exists , -01451);
begin
    execute immediate 'ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO_ALTERADO MODIFY ID_TURMA_COMPLEMENTAR NUMBER(20,0) NULL';
    execute immediate 'ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO_ALTERADO MODIFY TIPO_TURMA_COMPLEMENTAR VARCHAR2(10 BYTE) NULL';
    execute immediate 'ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO_ALTERADO MODIFY SALA_COMPLEMENTAR VARCHAR2(300 BYTE) NULL';
    exception when column_exists then null;
end;
