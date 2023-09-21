-- CONTRATOS_ESTUDANTES_EMPRESA

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_CONTRATOS_ESTUDANTES_EMPRESA_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.CONTRATOS_ESTUDANTES_EMPRESA
    for each row

declare
    pragma autonomous_transaction;

begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ID_ESTUDANTE FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ID_ESTUDANTE);
end;
/

ALTER TRIGGER "{{user}}"."TRIGGER_01_CONTRATOS_ESTUDANTES_EMPRESA_INSERT_UPDATE" ENABLE;


-- QUALIFICACOES_ESTUDANTE

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_QUALIFICACOES_ESTUDANTE_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.QUALIFICACOES_ESTUDANTE
    for each row
declare
    pragma autonomous_transaction;

begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ID_ESTUDANTE FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ID_ESTUDANTE);
end;
/

ALTER TRIGGER "{{user}}"."TRIGGER_01_QUALIFICACOES_ESTUDANTE_INSERT_UPDATE" ENABLE;

-- REP_CONHECIMENTOS_INFORMATICA

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_REP_CONHECIMENTOS_INFORMATICA_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.REP_CONHECIMENTOS_INFORMATICA
    for each row

declare
    pragma autonomous_transaction;

begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ID_ESTUDANTE FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ID_ESTUDANTE);
end;
/

ALTER TRIGGER "{{user}}"."TRIGGER_01_REP_CONHECIMENTOS_INFORMATICA_INSERT_UPDATE" ENABLE;

-- REP_ENDERECOS_ESTUDANTES

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_REP_ENDERECOS_ESTUDANTES_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.REP_ENDERECOS_ESTUDANTES
    for each row

declare
    pragma autonomous_transaction;

begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ID_ESTUDANTE FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ID_ESTUDANTE);
end;
/

ALTER TRIGGER "{{user}}"."TRIGGER_01_REP_ENDERECOS_ESTUDANTES_INSERT_UPDATE" ENABLE;

-- REP_ESCOLARIDADES_ESTUDANTES

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_REP_ESCOLARIDADES_ESTUDANTES_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.REP_ESCOLARIDADES_ESTUDANTES
    for each row

declare
    pragma autonomous_transaction;

begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ID_ESTUDANTE FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ID_ESTUDANTE);
end;
/

ALTER TRIGGER "{{user}}"."TRIGGER_01_REP_ESCOLARIDADES_ESTUDANTES_INSERT_UPDATE" ENABLE;

-- REP_ESTUDANTES

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_REP_ESTUDANTES_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.REP_ESTUDANTES
    for each row

declare
    pragma autonomous_transaction;

begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ID FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ID);
end;

/
ALTER TRIGGER "{{user}}"."TRIGGER_01_REP_ESTUDANTES_INSERT_UPDATE" ENABLE;

-- REP_IDIOMAS_NIVEIS

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_REP_IDIOMAS_NIVEIS_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.REP_IDIOMAS_NIVEIS
    for each row

declare
    pragma autonomous_transaction;

begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ESTUDANTE_ID FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ESTUDANTE_ID);
end;
/

ALTER TRIGGER "{{user}}"."TRIGGER_01_REP_IDIOMAS_NIVEIS_INSERT_UPDATE" ENABLE;

-- REP_INFORMACOES_ADICIONAIS

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_REP_INFORMACOES_ADICIONAIS_UPDATE"
    after UPDATE on {{user}}.REP_INFORMACOES_ADICIONAIS
    for each row
declare
    pragma autonomous_transaction;
    v_id_estudante number;
begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ID FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ID);
end;
/

ALTER TRIGGER "{{user}}"."TRIGGER_01_REP_INFORMACOES_ADICIONAIS_UPDATE" DISABLE;

-- REP_INFORMACOES_SOCIAIS

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_REP_INFORMACOES_SOCIAIS_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.REP_INFORMACOES_SOCIAIS
    for each row

declare
    pragma autonomous_transaction;

begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ID_ESTUDANTE FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ID_ESTUDANTE);
end;
/

ALTER TRIGGER "{{user}}"."TRIGGER_01_REP_INFORMACOES_SOCIAIS_INSERT_UPDATE" ENABLE;

-- REP_LAUDOS_MEDICOS_DOCUMENTOS

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_REP_LAUDOS_MEDICOS_DOCUMENTOS_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.REP_LAUDOS_MEDICOS_DOCUMENTOS
    for each row

declare
    pragma autonomous_transaction;
    v_id int;
begin

    select estudante_id into v_id
    from REP_LAUDOS_MEDICOS
    where id = :new.laudo_medico_id;

    INSERT INTO fila_triagem_estudante
    SELECT v_id FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = v_id);

end;
/

ALTER TRIGGER "{{user}}"."TRIGGER_01_REP_LAUDOS_MEDICOS_DOCUMENTOS_INSERT_UPDATE" ENABLE;

-- REP_LAUDOS_MEDICOS

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_REP_LAUDOS_MEDICOS_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.REP_LAUDOS_MEDICOS
    for each row

declare
    pragma autonomous_transaction;

begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ESTUDANTE_ID FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ESTUDANTE_ID);
end;

/
ALTER TRIGGER "{{user}}"."TRIGGER_01_REP_LAUDOS_MEDICOS_INSERT_UPDATE" ENABLE;

-- REP_RECURSOS_ACESSIBILIDADE

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_REP_RECURSOS_ACESSIBILIDADE_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.REP_RECURSOS_ACESSIBILIDADE
    for each row

declare
    pragma autonomous_transaction;

begin
    INSERT INTO fila_triagem_estudante
    SELECT :new.ESTUDANTE_ID FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ESTUDANTE_ID);
end;
/

ALTER TRIGGER "{{user}}"."TRIGGER_01_REP_RECURSOS_ACESSIBILIDADE_INSERT_UPDATE" ENABLE;

-- VINCULOS_VAGA

CREATE OR REPLACE EDITIONABLE TRIGGER "{{user}}"."TRIGGER_01_VINCULOS_VAGA_INSERT_UPDATE"
    after INSERT OR UPDATE on {{user}}.VINCULOS_VAGA
    for each row

declare
    pragma autonomous_transaction;
    v_id_vaga NUMBER;
    v_tipo_vaga VARCHAR2(25) := 'ESTAGIO';
begin
    IF (
                UPPER(:NEW.CRIADO_POR) != 'TRIAGEM_NOTURNA' AND
                (
                            :NEW.CODIGO_VAGA      != :OLD.CODIGO_VAGA OR
                            :NEW.ID_ESTUDANTE     != :OLD.ID_ESTUDANTE OR
                            :NEW.SITUACAO_VINCULO != :OLD.SITUACAO_VINCULO OR
                            :NEW.DELETADO         != :OLD.DELETADO
                    )
        )THEN
        SELECT nvl(ve.id, va.id), case when ve.id is not null then 'ESTAGIO' else 'APRENDIZ' end INTO v_id_vaga, v_tipo_vaga
        FROM VAGAS_ESTAGIO ve full join vagas_aprendiz va on va.codigo_da_vaga = ve.codigo_da_vaga WHERE ve.CODIGO_DA_VAGA = :new.codigo_vaga or va.CODIGO_DA_VAGA = :new.codigo_vaga;

        INSERT INTO fila_triagem_estudante
        SELECT :new.ID_ESTUDANTE FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM fila_triagem_estudante t WHERE t.ID_ESTUDANTE = :new.ID_ESTUDANTE);

        DBMS_SCHEDULER.CREATE_JOB (
                job_name => '{{user}}.VINCULOS_VAGA_' || DBMS_RANDOM.string('a',15) || to_char(sysdate, 'yyyymmddhh24miss'),
                job_type => 'PLSQL_BLOCK',
                job_action => 'BEGIN
                        BEGIN
                            {{user}}.PROC_ATUALIZAR_TRIAGEM_VAGA_'||v_tipo_vaga||'('||v_id_vaga||');
                        EXCEPTION WHEN OTHERS THEN NULL;
                        END;
                    END;',
                number_of_arguments => 0,
                start_date => NULL,
                repeat_interval => NULL,
                end_date => NULL,
                enabled => TRUE,
                auto_drop => TRUE,
                comments => '');
    END IF;
exception when no_data_found then null;
end;
/


ALTER TRIGGER "{{user}}"."TRIGGER_01_VINCULOS_VAGA_INSERT_UPDATE" ENABLE;

