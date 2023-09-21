create or replace PROCEDURE PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA
(
  PARAM_ID_ESTUDANTE IN NUMBER
, PARAM_INDICADOR IN VARCHAR2 := null
) AS

QTD_ESTUDANTE NUMBER;
BEGIN
    -- verifica se existe o estudante está ativo e custando su || te
    SELECT COUNT(E.ID) INTO QTD_ESTUDANTE FROM REP_ESCOLARIDADES_ESTUDANTES EE
    INNER JOIN REP_ESTUDANTES E ON E.ID = EE.ID_ESTUDANTE
    WHERE
    E.DELETADO = 0
    AND EE.DELETADO = 0
    AND E.SITUACAO = 'ATIVO'
    AND SIGLA_NIVEL_EDUCACAO IN('SU', 'TE')
    AND STATUS_ESCOLARIDADE IN('CURSANDO')
    AND E.ID = PARAM_ID_ESTUDANTE;

    -- inclue o estudante na fila
    IF(QTD_ESTUDANTE > 0) THEN
        FOR item IN
          (Select id from classificacoes_parametros_itens
            where indicador = PARAM_INDICADOR)
       LOOP
          INSERT INTO ESTUDANTES_PASSIVEIS_CLASSIFICACOES
            (ID, ID_ESTUDANTE, ID_CLASSIFICACOES_PARAMETROS_ITENS, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, DELETADO)
          VALUES(
            SEQ_ESTUDANTES_PASSIVEIS_CLASSIFICACOES.NEXTVAL,
            PARAM_ID_ESTUDANTE,
            item.id,
            CURRENT_DATE,
            CURRENT_DATE,
            'PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA',
            'PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA',
            0
         );
       END LOOP;

    END IF;
END;
/

create or replace PROCEDURE PROC_CLASSIFICACOES_GERAL_ESTUDANTES_INC_FILA
(
 PARAM_INDICADOR IN VARCHAR2 := null
) AS
BEGIN

      FOR item IN
          (Select id from classificacoes_parametros_itens
            where indicador = PARAM_INDICADOR)
       LOOP
          INSERT INTO ESTUDANTES_PASSIVEIS_CLASSIFICACOES
            (ID, ID_ESTUDANTE, ID_CLASSIFICACOES_PARAMETROS_ITENS, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, DELETADO)
          VALUES(
            SEQ_ESTUDANTES_PASSIVEIS_CLASSIFICACOES.NEXTVAL,
            NULL,
            item.id,
            CURRENT_DATE,
            CURRENT_DATE,
            'PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA',
            'PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA',
            0
         );
       END LOOP;

END;
/


-- analise comportamental
CREATE OR REPLACE TRIGGER TRIGGER_ANALISE_COMPORTAMENTAL_INSERT_UPDATE
AFTER INSERT or UPDATE ON AVALIACOES_COMPORTAMENTAIS_STATUS
FOR EACH ROW
BEGIN
   
   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'ANALISE_COMPORTAMENTAL');
   
END;
/ 

-- redacao estudante
CREATE OR REPLACE TRIGGER TRIGGER_REDACAO_ESTUDANTE_INSERT_UPDATE
AFTER INSERT or UPDATE ON REP_REDACOES_STUDENT
FOR EACH ROW
BEGIN
   
   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'REDACAO');
   
END;
/


-- video de apresentacao
CREATE OR REPLACE TRIGGER TRIGGER_VIDEO_APRESENTACAO_INSERT_UPDATE
AFTER INSERT or UPDATE OF VIDEO_URL ON REP_ESTUDANTES
FOR EACH ROW

declare
    pragma autonomous_transaction;
BEGIN
 PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id, 'VIDEO_APRESENTACAO');
 COMMIT;
end;
/


create or replace TRIGGER TRIGGER_REP_IDIOMAS_NIVEIS_INSERT_UPDATE
AFTER INSERT or update ON REP_IDIOMAS_NIVEIS
FOR EACH ROW
BEGIN

   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.estudante_id, 'CURSOS_CERTIFICACAO');

END;
/


create or replace TRIGGER TRIGGER_REP_CONHECIMENTOS_INFORMATICA_INSERT_UPDATE
AFTER INSERT or update ON REP_CONHECIMENTOS_INFORMATICA
FOR EACH ROW
BEGIN

   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'CURSOS_CERTIFICACAO');

END;
/

create or replace TRIGGER TRIGGER_REP_CONHECIMENTOS_DIVERSOS_STUDENT_INSERT_UPDATE
AFTER INSERT or update ON REP_CONHECIMENTOS_DIVERSOS_STUDENT
FOR EACH ROW
BEGIN

   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'CURSOS_CERTIFICACAO');

END;
/

create or replace TRIGGER TRIGGER_FAVORITOS_INSERT_UPDATE
AFTER INSERT or update ON FAVORITOS
FOR EACH ROW
BEGIN

   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_candidato, 'FAVORITO');

END;
/

create or replace TRIGGER TRIGGER_REP_PROVAS_ONLINE_CURRICULOS_EST_INSERT_UPDATE
AFTER INSERT or update ON rep_provas_online_curriculos_estudantes_student
FOR EACH ROW
BEGIN

   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'TESTES_CIEE');

END;
/

create or replace TRIGGER TRIGGER_REP_VIDEOS_CURRICULOS_ESTUDANTES_INSERT_UPDATE
AFTER INSERT or update ON REP_VIDEOS_CURRICULOS_ESTUDANTES_STUDENT
FOR EACH ROW
BEGIN

   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'VIDEO_CURRICULO');

END;
/

create or replace TRIGGER TRIGGER_REP_ESCOLARIDADES_ESTUDANTES_INSERT_UPDATE
AFTER INSERT or update ON REP_ESCOLARIDADES_ESTUDANTES
FOR EACH ROW
BEGIN

   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'ESCOLA_CLASSIFICACAO');

END;
/

create or replace TRIGGER TRIGGER_CLASSIFICACOES_IES_ENAD_INSERT_UPDATE
AFTER INSERT or update of CLASSIFICACAO ON CLASSIFICACOES_IES_ENAD
FOR EACH ROW
BEGIN

  if (:old.CLASSIFICACAO <> :new.CLASSIFICACAO) then
   PROC_CLASSIFICACOES_GERAL_ESTUDANTES_INC_FILA('ESCOLA_CLASSIFICACAO');
  end if;
   
END;
/

create or replace TRIGGER TRIGGER_RESULTADOS_PROCESSO_SELETIVO_INSERT_UPDATE
AFTER INSERT or update ON RESULTADOS_PROCESSO_SELETIVO
FOR EACH ROW
DECLARE
    estudante_id number := 0;
BEGIN

  select v.id_estudante  INTO estudante_id from ESTUDANTES_AGENDA ea
  inner join VINCULOS_VAGA v on (v.id = ea.id_vinculo_vaga)
  where ea.id = :NEW.id_estudante_agenda
  group by v.id_estudante;
  
  IF (estudante_id > 0) THEN
        PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(estudante_id, 'FALTA_INJUSTIFICADA_ETAPA');
  END IF;

END;
/


create or replace TRIGGER TRIGGER_VINCULOS_VAGA_INSERT_UPDATE
AFTER INSERT or update ON VINCULOS_VAGA
FOR EACH ROW
BEGIN

    PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'SEM_RETORNO_PENDENTE');
   
END;
/

create or replace TRIGGER TRIGGER_ESCOLA_NAO_IDENTIFICADA_INSERT_UPDATE
AFTER INSERT or update of id_escola, id_periodo_curso ON REP_ESCOLARIDADES_ESTUDANTES
FOR EACH ROW
BEGIN

  if (:new.id_escola = null or :new.id_periodo_curso = null) then
		PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'MODULO_ESCOLA_NAO_IDENTIFICADA');
  end if;
   
END;
/

create or replace TRIGGER TRIGGER_REP_CAMPUS_INATIVO_INSERT_UPDATE
AFTER INSERT or update of ativo ON REP_CAMPUS
FOR EACH ROW
BEGIN

  if (:new.ativo = 0) then
		PROC_CLASSIFICACOES_GERAL_ESTUDANTES_INC_FILA('MODULO_CAMPUS_INATIVO');
  end if;
   
END;
/

create or replace TRIGGER TRIGGER_REP_CAMPUS_CURSO_BLOQUEADO_INSERT_UPDATE
AFTER INSERT or update of bloqueado ON REP_CAMPUS_CURSOS
FOR EACH ROW
BEGIN

  if (:new.bloqueado = 1) then
		PROC_CLASSIFICACOES_GERAL_ESTUDANTES_INC_FILA('MODULO_CAMPUS_INATIVO');
  end if;
   
END;
/


create or replace TRIGGER TRIGGER_REP_CAMPUS_CURSO_PERIODO_BLOQUEADO_INSERT_UPDATE
AFTER INSERT or update of bloqueado ON REP_CAMPUS_CURSOS_PERIODOS
FOR EACH ROW
BEGIN

  if (:new.bloqueado = 1) then
		PROC_CLASSIFICACOES_GERAL_ESTUDANTES_INC_FILA('MODULO_CAMPUS_INATIVO');
  end if;
   
END;
/

create or replace TRIGGER TRIGGER_REP_EMAILS_INSERT_UPDATE
AFTER INSERT or update ON REP_EMAILS
FOR EACH ROW
BEGIN

   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'MODULO_CONTATO_SEM_EMAIL');
   
END;
/

create or replace TRIGGER TRIGGER_REP_TELEFONES_INSERT_UPDATE
AFTER INSERT or update ON REP_TELEFONES
FOR EACH ROW
BEGIN

   PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id_estudante, 'MODULO_CONTATO_SEM_EMAIL');
   
END;
/

create or replace TRIGGER TRIGGER_REP_ESTUDANTES_PCD_INSERT_UPDATE
AFTER INSERT or update of pcd ON REP_ESTUDANTES
FOR EACH ROW
BEGIN

     PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(:NEW.id, 'MODULO_PCD_PENDENTE');

END;
/

create or replace TRIGGER TRIGGER_REP_LAUDOS_MEDICOS_DOCUMENTOS_INSERT_UPDATE
AFTER INSERT or update ON REP_LAUDOS_MEDICOS_DOCUMENTOS
FOR EACH ROW
DECLARE
    v_estudante_id number := 0;
BEGIN

    select estudante_id into v_estudante_id from REP_LAUDOS_MEDICOS l 
    where
    l.id = :new.laudo_medico_id
    group by estudante_id;
    
    if (v_estudante_id > 0) then
         PROC_CLASSIFICACOES_ESTUDANTES_INC_FILA(v_estudante_id, 'MODULO_PCD_PENDENTE');
    end if;

END;
/