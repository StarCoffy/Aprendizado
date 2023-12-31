---
--- VAGAS NOVAS
---
CREATE OR REPLACE VIEW ACOMP_VAGAS_NOVAS AS (

  (SELECT DISTINCT RC.ID CONTRATO, VE.CODIGO_DA_VAGA, VE.PROCESSO_PERSONALIZADO VAGA_PP, 'E' TIPO_VAGA, VE.DATA_CRIACAO, VE.NUMERO_VAGAS, P.ID ID_PCD, RPUC.NUMERO_MIN_ESTUDANTES_TRIAGEM,
                   (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                   (SELECT COUNT(VIV.ID) FROM VINCULOS_VAGA VIV  WHERE VIV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VIV.DELETADO = 0) TRIADOS,
                   (SELECT COUNT(ACOMP.ID) FROM ACOMPANHAMENTOS_VAGAS ACOMP WHERE ACOMP.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND ACOMP.DELETADO = 0) FOLLOW_UP,
                   (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                   WHERE E.ID_VAGA = VE.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,
                   (SELECT DISTINCT CASE WHEN (
                                                SELECT MIN(EP.DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                                                WHERE (EP.DATA_INICIO = SYSDATE + 1 OR EP.DATA_INICIO < SYSDATE) AND E.ID_VAGA = VE.CODIGO_DA_VAGA
                                                      AND NUMERO_MIN_ESTUDANTES_TRIAGEM > (SELECT COUNT(VIV.ID) FROM VINCULOS_VAGA VIV  WHERE VIV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VIV.DELETADO = 0)) IS NOT NULL THEN 1 ELSE 0  END AS ALERTA
                    FROM ETAPAS_PERIODOS) ALERTA

   FROM VAGAS_ESTAGIO VE
     JOIN REP_LOCAIS_CONTRATO ON VE.ID_LOCAL_CONTRATO = REP_LOCAIS_CONTRATO.ID
     JOIN REP_CONTRATOS RC ON REP_LOCAIS_CONTRATO.ID_CONTRATO = RC.ID
     LEFT JOIN PCD P ON VE.ID = P.ID_VAGA_ESTAGIO
     JOIN REP_LOCAIS_ENDERECOS RLE on REP_LOCAIS_CONTRATO.ID = RLE.ID_LOCAL_CONTRATO
     JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RPUC.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE
   WHERE VE.ID_SITUACAO_VAGA = (SELECT ID FROM SITUACOES WHERE SIGLA = 'A') AND VE.DELETADO = 0)

  UNION

  (SELECT DISTINCT RC.ID CONTRATO, VA.CODIGO_DA_VAGA, NULL VAGA_PP, 'A' TIPO_VAGA, VA.DATA_CRIACAO, VA.NUMERO_VAGAS, P.ID ID_PCD, RPUC.NUMERO_MIN_ESTUDANTES_TRIAGEM,
                   (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                   (SELECT COUNT(VIV.ID) FROM VINCULOS_VAGA VIV  WHERE VIV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VIV.DELETADO = 0) TRIADOS,
                   (SELECT COUNT(ACOMP.ID) FROM ACOMPANHAMENTOS_VAGAS ACOMP WHERE ACOMP.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND ACOMP.DELETADO = 0) FOLLOW_UP,
                   (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                   WHERE E.ID_VAGA = VA.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,
                   (SELECT DISTINCT CASE WHEN (
                                                SELECT MIN(EP.DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                                                WHERE (EP.DATA_INICIO = SYSDATE + 1 OR EP.DATA_INICIO < SYSDATE) AND E.ID_VAGA = VA.CODIGO_DA_VAGA
                                                      AND NUMERO_MIN_ESTUDANTES_TRIAGEM > (SELECT COUNT(VIV.ID) FROM VINCULOS_VAGA VIV  WHERE VIV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VIV.DELETADO = 0)) IS NOT NULL THEN 1 ELSE 0 END AS ALERTA
                    FROM ETAPAS_PERIODOS) ALERTA

   FROM VAGAS_APRENDIZ VA
     JOIN REP_LOCAIS_CONTRATO ON VA.ID_LOCAL_CONTRATO = REP_LOCAIS_CONTRATO.ID
     JOIN REP_CONTRATOS RC ON REP_LOCAIS_CONTRATO.ID_CONTRATO = RC.ID
     LEFT JOIN PCD_APRENDIZ P ON P.ID_VAGA_APENDIZ = VA.ID
     JOIN REP_LOCAIS_ENDERECOS RLE on REP_LOCAIS_CONTRATO.ID = RLE.ID_LOCAL_CONTRATO
     JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RPUC.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE
   WHERE VA.ID_SITUACAO_VAGA = (SELECT ID FROM SITUACOES WHERE SIGLA = 'A') AND VA.DELETADO = 0)
);

---
--- VIEW ACOMPANHAMENTO VAGAS COM CONTATO AGENDADO
---

CREATE OR REPLACE VIEW ACOMP_VAGAS_CONTATO_AGENDADO AS (

  (SELECT DISTINCT RC.ID CONTRATO, VE.CODIGO_DA_VAGA, VE.PROCESSO_PERSONALIZADO VAGA_PP, 'E' TIPO_VAGA, VE.DATA_CRIACAO, P.ID ID_PCD, S.SIGLA SITUACAO, RPUC.LIMITE_MIN_ENCAMINHADOS_VAGA,
                   (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                   (SELECT MAX(AGE.DATA_CRIACAO) FROM AGENDA_EMPRESA_VAGA AGE WHERE AGE.CODIGO_VAGA = VE.CODIGO_DA_VAGA) DATA_ULTIMO_CONTATO,
                   (SELECT AGE.DATA_HORA FROM AGENDA_EMPRESA_VAGA AGE WHERE AGE.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND AGE.DATA_CRIACAO =
                                                                                                                    (SELECT MAX(AGE.DATA_CRIACAO) FROM AGENDA_EMPRESA_VAGA AGE WHERE AGE.CODIGO_VAGA = VE.CODIGO_DA_VAGA)) DATA_AGENDAMENTO,
                   (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                   WHERE E.ID_VAGA = VE.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,
                   (SELECT DISTINCT CASE WHEN (
                                                SELECT MIN(EP.DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                                                WHERE (EP.DATA_INICIO = SYSDATE + 1 OR EP.DATA_INICIO < SYSDATE) AND E.ID_VAGA = VE.CODIGO_DA_VAGA
                                                      AND LIMITE_MIN_ENCAMINHADOS_VAGA > (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0)) IS NOT NULL THEN 1 ELSE 0  END AS ALERTA
                    FROM ETAPAS_PERIODOS) ALERTA

   FROM VAGAS_ESTAGIO VE
     JOIN REP_LOCAIS_CONTRATO ON VE.ID_LOCAL_CONTRATO = REP_LOCAIS_CONTRATO.ID
     JOIN REP_CONTRATOS RC ON REP_LOCAIS_CONTRATO.ID_CONTRATO = RC.ID
     LEFT JOIN PCD P ON VE.ID = P.ID_VAGA_ESTAGIO
     JOIN SITUACOES S ON VE.ID_SITUACAO_VAGA = S.ID
     JOIN REP_LOCAIS_ENDERECOS RLE on REP_LOCAIS_CONTRATO.ID = RLE.ID_LOCAL_CONTRATO
     JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RPUC.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE
     JOIN AGENDA_EMPRESA_VAGA AEG ON AEG.CODIGO_VAGA = VE.CODIGO_DA_VAGA
   WHERE S.SIGLA <> 'P' AND S.SIGLA <> 'C' AND (AEG.DATA_HORA BETWEEN SYSDATE - 5 AND SYSDATE) AND VE.DELETADO = 0)

  UNION

  (SELECT DISTINCT RC.ID CONTRATO, VA.CODIGO_DA_VAGA, NULL VAGA_PP, 'A' TIPO_VAGA, VA.DATA_CRIACAO, P.ID ID_PCD, S.SIGLA SITUACAO, RPUC.LIMITE_MIN_ENCAMINHADOS_VAGA,
                   (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                   (SELECT MAX(AGE.DATA_CRIACAO) FROM AGENDA_EMPRESA_VAGA AGE WHERE AGE.CODIGO_VAGA = VA.CODIGO_DA_VAGA) DATA_ULTIMO_CONTATO,
                   (SELECT AGE.DATA_HORA FROM AGENDA_EMPRESA_VAGA AGE WHERE AGE.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND AGE.DATA_CRIACAO =
                                                                                                                    (SELECT MAX(AGE.DATA_CRIACAO) FROM AGENDA_EMPRESA_VAGA AGE WHERE AGE.CODIGO_VAGA = VA.CODIGO_DA_VAGA)) DATA_AGENDAMENTO ,
                   (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                   WHERE E.ID_VAGA = VA.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,
                   (SELECT DISTINCT CASE WHEN (
                                                SELECT MIN(EP.DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                                                WHERE (EP.DATA_INICIO = SYSDATE + 1 OR EP.DATA_INICIO < SYSDATE) AND E.ID_VAGA = VA.CODIGO_DA_VAGA
                                                      AND LIMITE_MIN_ENCAMINHADOS_VAGA > (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0)) IS NOT NULL THEN 1 ELSE 0  END AS ALERTA
                    FROM ETAPAS_PERIODOS) ALERTA

   FROM VAGAS_APRENDIZ VA
     JOIN REP_LOCAIS_CONTRATO ON VA.ID_LOCAL_CONTRATO = REP_LOCAIS_CONTRATO.ID
     JOIN REP_CONTRATOS RC ON REP_LOCAIS_CONTRATO.ID_CONTRATO = RC.ID
     LEFT JOIN PCD_APRENDIZ P ON VA.ID = P.ID_VAGA_APENDIZ
     JOIN SITUACOES S ON VA.ID_SITUACAO_VAGA = S.ID
     JOIN REP_LOCAIS_ENDERECOS RLE on REP_LOCAIS_CONTRATO.ID = RLE.ID_LOCAL_CONTRATO
     JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RPUC.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE
     JOIN AGENDA_EMPRESA_VAGA AEG ON AEG.CODIGO_VAGA = VA.CODIGO_DA_VAGA
   WHERE S.SIGLA <> 'P' AND S.SIGLA <> 'C' AND (AEG.DATA_HORA BETWEEN SYSDATE - 5 AND SYSDATE) AND  VA.DELETADO = 0)

);

---
--- VIEW VAGAS COM OCORRENCIA
---
CREATE OR REPLACE VIEW ACOMP_VAGAS_OCORRENCIAS AS (

  (SELECT DISTINCT RC.ID CONTRATO, VE.CODIGO_DA_VAGA, VE.PROCESSO_PERSONALIZADO VAGA_PP, 'E' TIPO_VAGA, VE.DATA_CRIACAO, P.ID ID_PCD, VE.NUMERO_VAGAS, S.SIGLA SITUACAO, RPUC.DIAS_PRAZO_TRATAR PRAZO_TRATAR,
                   (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                   (SELECT MAX(OCE.DATA_OCORRENCIA) FROM OCORRENCIAS_ESTAGIO OCE WHERE OCE.ID_VAGA_ESTAGIO = VE.ID) DATA_OCORRENCIA,
                   (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                   WHERE E.ID_VAGA = VE.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,
                   (SELECT DISTINCT CASE WHEN (
                                                SELECT OCE.DATA_OCORRENCIA FROM OCORRENCIAS_ESTAGIO OCE WHERE OCE.ID_VAGA_ESTAGIO = VE.ID AND OCE.DATA_OCORRENCIA < SYSDATE - DIAS_PRAZO_TRATAR)
                                              IS NOT NULL THEN 1 ELSE 0  END AS ALERTA
                    FROM ETAPAS_PERIODOS) ALERTA

   FROM VAGAS_ESTAGIO VE
     JOIN REP_LOCAIS_CONTRATO RLC ON VE.ID_LOCAL_CONTRATO = RLC.ID
     JOIN REP_CONTRATOS RC ON RLC.ID_CONTRATO = RC.ID
     LEFT JOIN REP_LOCAIS_ENDERECOS RLE ON RLE.ID_LOCAL_CONTRATO = RLC.ID
     LEFT JOIN PCD P ON VE.ID = P.ID_VAGA_ESTAGIO
     JOIN SITUACOES S ON VE.ID_SITUACAO_VAGA = S.ID
     JOIN OCORRENCIAS_ESTAGIO OCE ON VE.ID = OCE.ID_VAGA_ESTAGIO
     JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RLE.ID_UNIDADE_CIEE = RPUC.ID_UNIDADE_CIEE
   WHERE VE.DELETADO = 0)

  UNION

  (SELECT DISTINCT RC.ID CONTRATO, VA.CODIGO_DA_VAGA, NULL VAGA_PP, 'A' TIPO_VAGA, VA.DATA_CRIACAO, P.ID ID_PCD, VA.NUMERO_VAGAS, S.SIGLA SITUACAO, RPUC.DIAS_PRAZO_TRATAR PRAZO_TRATAR,
                   (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                   (SELECT MAX(OCA.DATA_OCORRENCIA) FROM OCORRENCIAS_APRENDIZ OCA WHERE OCA.ID_VAGA_APRENDIZ = VA.ID) DATA_OCORRENCIA,
                   (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                   WHERE E.ID_VAGA = VA.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,
                   (SELECT DISTINCT CASE WHEN (
                                                SELECT OCE.DATA_OCORRENCIA FROM OCORRENCIAS_ESTAGIO OCE WHERE OCE.ID_VAGA_ESTAGIO = VA.ID AND OCE.DATA_OCORRENCIA < SYSDATE - DIAS_PRAZO_TRATAR)
                                              IS NOT NULL THEN 1 ELSE 0  END AS ALERTA
                    FROM ETAPAS_PERIODOS) ALERTA

   FROM VAGAS_APRENDIZ VA
     JOIN REP_LOCAIS_CONTRATO RLC ON VA.ID_LOCAL_CONTRATO = RLC.ID
     JOIN REP_CONTRATOS RC ON RLC.ID_CONTRATO = RC.ID
     LEFT JOIN REP_LOCAIS_ENDERECOS RLE ON RLE.ID_LOCAL_CONTRATO = RLC.ID
     LEFT JOIN PCD_APRENDIZ P ON VA.ID = P.ID_VAGA_APENDIZ
     JOIN SITUACOES S ON VA.ID_SITUACAO_VAGA = S.ID
     JOIN OCORRENCIAS_APRENDIZ OCA ON VA.ID = OCA.ID_VAGA_APRENDIZ
     JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RLE.ID_UNIDADE_CIEE = RPUC.ID_UNIDADE_CIEE
   WHERE VA.DELETADO = 0)

);

---
--- VIEW VAGAS EM PROCESSO SELETIVO
---

CREATE OR REPLACE VIEW ACOMP_VAGAS_PROCESSO_SELETIVO AS (

  (SELECT DISTINCT RC.ID CONTRATO, VE.CODIGO_DA_VAGA, VE.PROCESSO_PERSONALIZADO VAGA_PP, 'E' TIPO_VAGA, VE.DATA_CRIACAO, VE.NUMERO_VAGAS, P.ID ID_PCD, RPUC.LIMITE_MIN_ENCAMINHADOS_VAGA, S.SIGLA SITUACAO,
                   (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                   (SELECT COUNT(VIV.ID) FROM VINCULOS_VAGA VIV  WHERE VIV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VIV.DELETADO = 0) TRIADOS,
                   (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                   WHERE E.ID_VAGA = VE.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,
                   (SELECT DISTINCT CASE WHEN (
                                                SELECT MIN(EP.DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                                                WHERE (EP.DATA_INICIO = SYSDATE + 1 OR EP.DATA_INICIO < SYSDATE) AND E.ID_VAGA = VE.CODIGO_DA_VAGA
                                                      AND LIMITE_MIN_ENCAMINHADOS_VAGA > (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0)) IS NOT NULL THEN 1 ELSE 0  END AS ALERTA
                    FROM ETAPAS_PERIODOS) ALERTA

   FROM VAGAS_ESTAGIO VE
     JOIN REP_LOCAIS_CONTRATO ON VE.ID_LOCAL_CONTRATO = REP_LOCAIS_CONTRATO.ID
     JOIN REP_CONTRATOS RC ON REP_LOCAIS_CONTRATO.ID_CONTRATO = RC.ID
     LEFT JOIN PCD P ON VE.ID = P.ID_VAGA_ESTAGIO
     JOIN REP_LOCAIS_ENDERECOS RLE on REP_LOCAIS_CONTRATO.ID = RLE.ID_LOCAL_CONTRATO
     JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RPUC.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE
     JOIN SITUACOES S on VE.ID_SITUACAO_VAGA = S.ID
   WHERE VE.ID_SITUACAO_VAGA IN (SELECT ID FROM SITUACOES WHERE SIGLA = 'E' OR SIGLA = 'S') AND VE.DELETADO = 0)

  UNION

  (SELECT DISTINCT RC.ID CONTRATO, VA.CODIGO_DA_VAGA, NULL VAGA_PP, 'A' TIPO_VAGA, VA.DATA_CRIACAO, VA.NUMERO_VAGAS, P.ID ID_PCD, RPUC.LIMITE_MIN_ENCAMINHADOS_VAGA, S.SIGLA SITUACAO,
                   (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                   (SELECT COUNT(VIV.ID) FROM VINCULOS_VAGA VIV  WHERE VIV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VIV.DELETADO = 0) TRIADOS,
                   (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                   WHERE E.ID_VAGA = VA.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,
                   (SELECT DISTINCT CASE WHEN (
                                                SELECT MIN(EP.DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                                                WHERE (EP.DATA_INICIO = SYSDATE + 1 OR EP.DATA_INICIO < SYSDATE) AND E.ID_VAGA = VA.CODIGO_DA_VAGA
                                                      AND LIMITE_MIN_ENCAMINHADOS_VAGA > (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0)) IS NOT NULL THEN 1 ELSE 0 END AS ALERTA
                    FROM ETAPAS_PERIODOS) ALERTA

   FROM VAGAS_APRENDIZ VA
     JOIN REP_LOCAIS_CONTRATO ON VA.ID_LOCAL_CONTRATO = REP_LOCAIS_CONTRATO.ID
     JOIN REP_CONTRATOS RC ON REP_LOCAIS_CONTRATO.ID_CONTRATO = RC.ID
     LEFT JOIN PCD_APRENDIZ P ON P.ID_VAGA_APENDIZ = VA.ID
     JOIN REP_LOCAIS_ENDERECOS RLE on REP_LOCAIS_CONTRATO.ID = RLE.ID_LOCAL_CONTRATO
     JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RPUC.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE
     JOIN SITUACOES S on VA.ID_SITUACAO_VAGA = S.ID
   WHERE VA.ID_SITUACAO_VAGA IN (SELECT ID FROM SITUACOES WHERE SIGLA = 'E' OR SIGLA = 'S') AND VA.DELETADO = 0)

);


---
--- VIEW ACOMPANHAMENTO VAGAS COM RESSALVA PARA ASSISTENTE
---

CREATE OR REPLACE VIEW ACOMP_VAGAS_RES_ASSISTENTE AS (

  (SELECT DISTINCT RC.ID CONTRATO, VE.CODIGO_DA_VAGA, VE.PROCESSO_PERSONALIZADO VAGA_PP, 'E' TIPO_VAGA, VE.DATA_CRIACAO, P.ID ID_PCD, RPUC.DIAS_RET_ASSISTENTE, AC.DATA_CRIACAO DATA_ENVIO,
    (SELECT P.NOME FROM REP_ASSISTENTES RAC JOIN REP_PESSOAS P on RAC.ID_PESSOA = P.ID
      JOIN REP_CARTEIRAS CAR on RAC.ID = CAR.ID_ASSISTENTE
      JOIN REP_LOCAIS_ENDERECOS RLE ON RLE.ID_UNIDADE_CIEE = CAR.ID_UNIDADE_CIEE
      JOIN REP_ENDERECOS EN ON RLE.ID_ENDERECO = EN.ID
      JOIN REP_MAP_CARTEIRAS_TERRITORIOS MAP ON CAR.ID = MAP.ID_CARTEIRA AND EN.CEP = MAP.CEP
      JOIN REP_LOCAIS_CONTRATO RLC on RLE.ID_LOCAL_CONTRATO = RLC.ID
      WHERE VE.ID_LOCAL_CONTRATO = RLC.ID) ASSISTENTE,

     (SELECT DISTINCT CASE WHEN (
        SELECT V.ID FROM VAGAS_ESTAGIO V WHERE VE.DATA_ALTERACAO + DIAS_RET_ASSISTENTE <= SYSDATE AND V.ID = VE.ID) IS NOT NULL THEN 1 ELSE 0 END AS ALERTA
      FROM VAGAS_ESTAGIO) ALERTA

    FROM VAGAS_ESTAGIO VE
    JOIN REP_LOCAIS_CONTRATO LCT ON VE.ID_LOCAL_CONTRATO = LCT.ID
    JOIN REP_CONTRATOS RC ON LCT.ID_CONTRATO = RC.ID
    LEFT JOIN PCD P ON VE.ID = P.ID_VAGA_ESTAGIO
    JOIN REP_LOCAIS_ENDERECOS RLE on LCT.ID = RLE.ID_LOCAL_CONTRATO
    JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RPUC.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE
    JOIN SITUACOES S on VE.ID_SITUACAO_VAGA = S.ID
    JOIN ACOMPANHAMENTOS_VAGAS AC ON AC.CODIGO_VAGA = VE.CODIGO_DA_VAGA
    WHERE VE.ID_SITUACAO_VAGA = S.ID AND VE.DELETADO = 0
          AND AC.DATA_CRIACAO = (SELECT MAX(A.DATA_CRIACAO) FROM ACOMPANHAMENTOS_VAGAS A WHERE A.CODIGO_VAGA = VE.CODIGO_DA_VAGA))

   UNION

   (SELECT DISTINCT RC.ID CONTRATO, VA.CODIGO_DA_VAGA, NULL VAGA_PP, 'A' TIPO_VAGA, VA.DATA_CRIACAO, P.ID ID_PCD, RPUC.DIAS_RET_ASSISTENTE, AC.DATA_CRIACAO DATA_ENVIO,
      (SELECT P.NOME FROM REP_ASSISTENTES RAC JOIN REP_PESSOAS P on RAC.ID_PESSOA = P.ID
        JOIN REP_CARTEIRAS CAR on RAC.ID = CAR.ID_ASSISTENTE
        JOIN REP_LOCAIS_ENDERECOS RLE ON RLE.ID_UNIDADE_CIEE = CAR.ID_UNIDADE_CIEE
        JOIN REP_ENDERECOS EN ON RLE.ID_ENDERECO = EN.ID
        JOIN REP_MAP_CARTEIRAS_TERRITORIOS MAP ON CAR.ID = MAP.ID_CARTEIRA AND EN.CEP = MAP.CEP
        JOIN REP_LOCAIS_CONTRATO RLC on RLE.ID_LOCAL_CONTRATO = RLC.ID
      WHERE VA.ID_LOCAL_CONTRATO = RLC.ID) ASSISTENTE,

      (SELECT DISTINCT CASE WHEN (
                                   SELECT V.ID FROM VAGAS_ESTAGIO V WHERE VA.DATA_ALTERACAO + DIAS_RET_ASSISTENTE <= SYSDATE AND V.ID = VA.ID) IS NOT NULL THEN 1 ELSE 0 END AS ALERTA
       FROM VAGAS_ESTAGIO) ALERTA

    FROM VAGAS_APRENDIZ VA
      JOIN REP_LOCAIS_CONTRATO LCT ON VA.ID_LOCAL_CONTRATO = LCT.ID
      JOIN REP_CONTRATOS RC ON LCT.ID_CONTRATO = RC.ID
      LEFT JOIN PCD_APRENDIZ P ON P.ID_VAGA_APENDIZ = VA.ID
      JOIN REP_LOCAIS_ENDERECOS RLE on LCT.ID = RLE.ID_LOCAL_CONTRATO
      JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RPUC.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE
      JOIN SITUACOES S on VA.ID_SITUACAO_VAGA = S.ID
      JOIN ACOMPANHAMENTOS_VAGAS AC ON AC.CODIGO_VAGA = VA.CODIGO_DA_VAGA
    WHERE VA.ID_SITUACAO_VAGA = S.ID AND VA.DELETADO = 0
          AND AC.DATA_CRIACAO = (SELECT MAX(A.DATA_CRIACAO) FROM ACOMPANHAMENTOS_VAGAS A WHERE A.CODIGO_VAGA = VA.CODIGO_DA_VAGA))

);