-- TRIGGERS CLASSIFICACOES
-- disable triggers
ALTER TRIGGER TRIGGER_REP_CAMPUS_INATIVO_INSERT_UPDATE DISABLE;
ALTER TRIGGER TRIGGER_REP_CAMPUS_CURSO_PERIODO_BLOQUEADO_INSERT_UPDATE DISABLE;
ALTER TRIGGER TRIGGER_REP_CAMPUS_CURSO_BLOQUEADO_INSERT_UPDATE DISABLE;


-- REP_CAMPUS
CREATE OR REPLACE TRIGGER TRIGGER_REP_CAMPUS_INATIVO_INSERT_UPDATE_CLASS
    AFTER INSERT or update of ATIVO ON REP_CLASS_CAMPUS
    FOR EACH ROW
declare
    pragma autonomous_transaction;
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
                job_name => 'SERVICE_VAGAS_DEV.REP_ESTUDANTES_INC_FILA_MOD_ESC'|| DBMS_RANDOM.string('a',15) || to_char(sysdate, 'yyyymmddhh24miss'),
                job_type => 'PLSQL_BLOCK',
                job_action => 'BEGIN
                        SERVICE_VAGAS_DEV.PROC_CLASSIFICACOES_GERAL_ESTUDANTES_INC_FILA(''MODULO_CAMPUS_INATIVO'');
                    END;',
                number_of_arguments => 0,
                start_date => NULL,
                repeat_interval => NULL,
                end_date => NULL,
                enabled => TRUE,
                auto_drop => TRUE,
                comments => '');
    COMMIT;
end;
/

-- REP_CAMPUS_CURSOS_PERIODOS
CREATE OR REPLACE TRIGGER TRIGGER_REP_CAMPUS_CURSO_PERIODO_BLOQUEADO_INSERT_UPDATE_CLASS
    AFTER INSERT or update of bloqueado ON REP_CLASS_CAMPUS_CURSOS_PERIODOS
    FOR EACH ROW
declare
    pragma autonomous_transaction;
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => 'SERVICE_VAGAS_DEV.REP_ESTUDANTES_INC_FILA_MOD_ESC'|| DBMS_RANDOM.string('a',15) || to_char(sysdate, 'yyyymmddhh24miss'),
            job_type => 'PLSQL_BLOCK',
            job_action => 'BEGIN
                    SERVICE_VAGAS_DEV.PROC_CLASSIFICACOES_GERAL_ESTUDANTES_INC_FILA(''MODULO_CAMPUS_INATIVO'');
                END;',
            number_of_arguments => 0,
            start_date => NULL,
            repeat_interval => NULL,
            end_date => NULL,
            enabled => TRUE,
            auto_drop => TRUE,
            comments => '');
END;
/

-- REP_CAMPUS_CURSOS
CREATE OR REPLACE TRIGGER TRIGGER_REP_CAMPUS_CURSO_BLOQUEADO_INSERT_UPDATE_CLASS
    AFTER INSERT or update of bloqueado ON REP_CLASS_CAMPUS_CURSOS
    FOR EACH ROW
declare
    pragma autonomous_transaction;
BEGIN
        DBMS_SCHEDULER.CREATE_JOB (
                job_name => 'SERVICE_VAGAS_DEV.REP_ESTUDANTES_INC_FILA_MOD_ESC'|| DBMS_RANDOM.string('a',15) || to_char(sysdate, 'yyyymmddhh24miss'),
                job_type => 'PLSQL_BLOCK',
                job_action => 'BEGIN
                        SERVICE_VAGAS_DEV.PROC_CLASSIFICACOES_GERAL_ESTUDANTES_INC_FILA(''MODULO_CAMPUS_INATIVO'');
                    END;',
                number_of_arguments => 0,
                start_date => NULL,
                repeat_interval => NULL,
                end_date => NULL,
                enabled => TRUE,
                auto_drop => TRUE,
                comments => '');
END;
/


-- 
-- Cria Procs que grava fila estudante via OGG
--
create or replace PROCEDURE GRAVAR_FILA_TRIAGEM_ESTUDANTE(id_estudante IN NUMBER)
IS
BEGIN
    EXECUTE IMMEDIATE 'INSERT  /*+ APPEND */ INTO SERVICE_VAGAS_DEV.FILA_TRIAGEM_ESTUDANTE(ID_ESTUDANTE) VALUES(:1)' USING id_estudante;
    COMMIT WORK WRITE WAIT IMMEDIATE;
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/

create or replace PROCEDURE GRAVAR_FILA_TRIAGEM_ESTUDANTE_LAUDOS_MEDICOS_DOCS(laudo_medico_id IN NUMBER)
IS
    v_id_estudante NUMBER;
BEGIN
    select estudante_id into v_id_estudante from REP_FILA_LAUDOS_MEDICOS where id = laudo_medico_id;
    
    EXECUTE IMMEDIATE 'INSERT  /*+ APPEND */ INTO SERVICE_VAGAS_DEV.FILA_TRIAGEM_ESTUDANTE(ID_ESTUDANTE) VALUES(:1)' USING v_id_estudante;
    COMMIT WORK WRITE WAIT IMMEDIATE;
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/


-- Desliga Triggers fila Estudantes
ALTER TRIGGER SERVICE_VAGAS_DEV.TRIGGER_01_REP_CONHECIMENTOS_INFORMATICA_INSERT_UPDATE DISABLE;
ALTER TRIGGER SERVICE_VAGAS_DEV.TRIGGER_01_REP_ENDERECOS_ESTUDANTES_INSERT_UPDATE DISABLE;
ALTER TRIGGER SERVICE_VAGAS_DEV.TRIGGER_01_REP_IDIOMAS_NIVEIS_INSERT_UPDATE DISABLE;
ALTER TRIGGER SERVICE_VAGAS_DEV.TRIGGER_01_REP_INFORMACOES_ADICIONAIS_UPDATE DISABLE;
ALTER TRIGGER SERVICE_VAGAS_DEV.TRIGGER_01_REP_LAUDOS_MEDICOS_INSERT_UPDATE DISABLE;
ALTER TRIGGER SERVICE_VAGAS_DEV.TRIGGER_01_REP_LAUDOS_MEDICOS_DOCUMENTOS_INSERT_UPDATE DISABLE;
ALTER TRIGGER SERVICE_VAGAS_DEV.TRIGGER_01_REP_RECURSOS_ACESSIBILIDADE_INSERT_UPDATE DISABLE;
ALTER TRIGGER SERVICE_VAGAS_DEV.TRIGGER_01_REP_INFORMACOES_SOCIAIS_INSERT_UPDATE DISABLE;
ALTER TRIGGER SERVICE_VAGAS_DEV.TRIGGER_01_REP_ESTUDANTES_INSERT_UPDATE DISABLE;
ALTER TRIGGER SERVICE_VAGAS_DEV.TRIGGER_01_REP_ESCOLARIDADES_ESTUDANTES_INSERT_UPDATE DISABLE;

