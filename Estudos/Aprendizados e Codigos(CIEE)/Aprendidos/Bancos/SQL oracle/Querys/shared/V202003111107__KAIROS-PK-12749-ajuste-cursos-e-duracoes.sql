--Service_Vagas
----Alteração contratos_cursos_capacitacao para salvar a turma complementar e regular
ALTER TABLE TURMAS MODIFY ID_VAGA_APRENDIZ NULL;
ALTER TABLE TURMAS ADD ID_PRE_CONTRATOS_CURSOS_CAPACITACAO NUMBER(20) NULL;
ALTER TABLE TURMAS ADD ID_CONTRATOS_CURSOS_CAPACITACAO NUMBER(20) NULL;

ALTER TABLE PRE_CONTRATOS_CURSOS_CAPACITACAO RENAME COLUMN ID_TURMA TO ID_TURMA_REGULAR;
ALTER TABLE PRE_CONTRATOS_CURSOS_CAPACITACAO RENAME COLUMN TIPO_TURMA TO TIPO_TURMA_REGULAR;
ALTER TABLE PRE_CONTRATOS_CURSOS_CAPACITACAO RENAME COLUMN SALA TO SALA_REGULAR;
ALTER TABLE PRE_CONTRATOS_CURSOS_CAPACITACAO ADD ID_TURMA_COMPLEMENTAR NUMBER(20) NULL;
ALTER TABLE PRE_CONTRATOS_CURSOS_CAPACITACAO ADD TIPO_TURMA_COMPLEMENTAR VARCHAR2(10) NULL;
ALTER TABLE PRE_CONTRATOS_CURSOS_CAPACITACAO ADD SALA_COMPLEMENTAR VARCHAR2(10) NULL;
UPDATE PRE_CONTRATOS_CURSOS_CAPACITACAO SET ID_TURMA_COMPLEMENTAR = 0, TIPO_TURMA_COMPLEMENTAR = 'Aberta', SALA_COMPLEMENTAR = '1' WHERE 1 = 1;
ALTER TABLE PRE_CONTRATOS_CURSOS_CAPACITACAO MODIFY ID_TURMA_COMPLEMENTAR NOT NULL;
ALTER TABLE PRE_CONTRATOS_CURSOS_CAPACITACAO MODIFY TIPO_TURMA_COMPLEMENTAR NOT NULL;
ALTER TABLE PRE_CONTRATOS_CURSOS_CAPACITACAO MODIFY SALA_COMPLEMENTAR NOT NULL;

ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO RENAME COLUMN ID_TURMA TO ID_TURMA_REGULAR;
ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO RENAME COLUMN TIPO_TURMA TO TIPO_TURMA_REGULAR;
ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO RENAME COLUMN SALA TO SALA_REGULAR;
ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO ADD ID_TURMA_COMPLEMENTAR NUMBER(20);
ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO ADD TIPO_TURMA_COMPLEMENTAR VARCHAR2(10);
ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO ADD SALA_COMPLEMENTAR VARCHAR2(10);
UPDATE CONTRATOS_CURSOS_CAPACITACAO SET ID_TURMA_COMPLEMENTAR = 0, TIPO_TURMA_COMPLEMENTAR = 'Aberta', SALA_COMPLEMENTAR = '1' WHERE 1 = 1;
ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO MODIFY ID_TURMA_COMPLEMENTAR NOT NULL;
ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO MODIFY TIPO_TURMA_COMPLEMENTAR NOT NULL;
ALTER TABLE CONTRATOS_CURSOS_CAPACITACAO MODIFY SALA_COMPLEMENTAR NOT NULL;

ALTER TABLE HIST_CONTRATOS_CURSOS_CAPACITACAO RENAME COLUMN ID_TURMA TO ID_TURMA_REGULAR;
ALTER TABLE HIST_CONTRATOS_CURSOS_CAPACITACAO RENAME COLUMN TIPO_TURMA TO TIPO_TURMA_REGULAR;
ALTER TABLE HIST_CONTRATOS_CURSOS_CAPACITACAO RENAME COLUMN SALA TO SALA_REGULAR;
ALTER TABLE HIST_CONTRATOS_CURSOS_CAPACITACAO ADD ID_TURMA_COMPLEMENTAR NUMBER(20);
ALTER TABLE HIST_CONTRATOS_CURSOS_CAPACITACAO ADD TIPO_TURMA_COMPLEMENTAR VARCHAR2(10);
ALTER TABLE HIST_CONTRATOS_CURSOS_CAPACITACAO ADD SALA_COMPLEMENTAR VARCHAR2(10);
UPDATE HIST_CONTRATOS_CURSOS_CAPACITACAO SET ID_TURMA_COMPLEMENTAR = 0, TIPO_TURMA_COMPLEMENTAR = 'Aberta', SALA_COMPLEMENTAR = '1' WHERE 1 = 1;
ALTER TABLE HIST_CONTRATOS_CURSOS_CAPACITACAO MODIFY ID_TURMA_COMPLEMENTAR NOT NULL;
ALTER TABLE HIST_CONTRATOS_CURSOS_CAPACITACAO MODIFY TIPO_TURMA_COMPLEMENTAR NOT NULL;
ALTER TABLE HIST_CONTRATOS_CURSOS_CAPACITACAO MODIFY SALA_COMPLEMENTAR NOT NULL;

----PK-12749 - Erro ao Gerenciar Duração de Cursos de Capacitação
ALTER TABLE vagas_aprendiz DROP COLUMN id_area_atuacao_aprendiz CASCADE CONSTRAINTS;
ALTER TABLE vagas_aprendiz ADD id_curso_capacitacao number(20) NULL;
UPDATE vagas_aprendiz SET id_curso_capacitacao = 1 WHERE 1 = 1;
ALTER TABLE vagas_aprendiz MODIFY id_curso_capacitacao NOT NULL;
ALTER TABLE vagas_aprendiz ADD CONSTRAINT KRS_INDICE_07280 FOREIGN KEY ( id_curso_capacitacao ) REFERENCES cursos_capacitacao ( id );
ALTER TABLE duracoes_capacitacao DROP COLUMN id_area_atuacao CASCADE CONSTRAINTS;

----Carga Áreas de atuação aprendiz
DROP SEQUENCE SEQ_AREAS_ATUACAO_APRENDIZ;
CREATE SEQUENCE SEQ_AREAS_ATUACAO_APRENDIZ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER NOCYCLE NOKEEP NOSCALE GLOBAL;

DELETE FROM AREAS_ATUACAO_APRENDIZ WHERE 1 = 1;

INSERT INTO AREAS_ATUACAO_APRENDIZ(ID, ID_GRUPO_EMPRESA, DESCRICAO_AREA_ATUACAO, NIVEL_AREA_ATUACAO, TIPO_PROGRAMA, IDENTIFICADOR, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, CODIGO_ICONE)
SELECT SEQ_AREAS_ATUACAO_APRENDIZ.NEXTVAL, NULL, cursos.DESCRICAO, 1, 'Aprendiz', 0, cursos.SITUACAO, cursos.DELETADO, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'FLYWAY', 'FLYWAY', null
FROM CURSOS_CAPACITACAO cursos;

----PK-12749 - Erro ao Gerenciar Duração de Cursos de Capacitação
ALTER TABLE cursos_capacitacao ADD id_area_atuacao NUMBER(20) NULL;
UPDATE CURSOS_CAPACITACAO cursos SET ID_AREA_ATUACAO = (
    SELECT ID FROM AREAS_ATUACAO_APRENDIZ areas where cursos.ID = areas.id
) WHERE 1 = 1;
ALTER TABLE CURSOS_CAPACITACAO modify id_area_atuacao NOT NULL;
ALTER TABLE cursos_capacitacao ADD CONSTRAINT krs_indice_07200 FOREIGN KEY ( id_area_atuacao ) REFERENCES areas_atuacao_aprendiz ( id );