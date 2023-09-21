CREATE OR REPLACE VIEW ACOMP_VAGAS_PROCESSO_SELETIVO AS
(

(SELECT DISTINCT RC.ID CONTRATO, VE.CODIGO_DA_VAGA, VE.PROCESSO_PERSONALIZADO VAGA_PP, 'E' TIPO_VAGA, VE.DATA_CRIACAO, VE.NUMERO_VAGAS, P.ID ID_PCD, RPUC.LIMITE_MIN_ENCAMINHADOS_VAGA, S.SIGLA SITUACAO,
                 (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                 (SELECT COUNT(VIV.ID) FROM VINCULOS_VAGA VIV  WHERE VIV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VIV.DELETADO = 0) TRIADOS,
                 (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                  WHERE E.ID_VAGA = VE.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,
                 CASE
                     WHEN (select count(*) from V_SITUACAO_VAGAS_AGENDADO_E_PROC_SELETIVO VCA where VCA.id_vaga = VE.CODIGO_DA_VAGA and VCA.numero_encaminhados < RPUC.LIMITE_MIN_ENCAMINHADOS_VAGA ) > 0 THEN 1
                     ELSE 0
                     END AS ALERTA,
                 RLE.ID_UNIDADE_CIEE_LOCAL,
                 RLE.ID_CARTEIRA_LOCAL

 FROM VAGAS_ESTAGIO VE
          JOIN REP_LOCAIS_CONTRATO ON VE.ID_LOCAL_CONTRATO = REP_LOCAIS_CONTRATO.ID
          JOIN REP_CONTRATOS RC ON REP_LOCAIS_CONTRATO.ID_CONTRATO = RC.ID
          LEFT JOIN PCD_ESTAGIO P ON VE.ID = P.ID_VAGA_ESTAGIO
          JOIN REP_LOCAIS_ENDERECOS RLE on REP_LOCAIS_CONTRATO.ID = RLE.ID_LOCAL_CONTRATO
          JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RPUC.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE
          JOIN SITUACOES S on VE.ID_SITUACAO_VAGA = S.ID
 WHERE VE.ID_SITUACAO_VAGA IN (SELECT ID FROM SITUACOES WHERE SIGLA = 'E' OR SIGLA = 'S') AND VE.DELETADO = 0)

UNION ALL

(SELECT DISTINCT RC.ID CONTRATO, VA.CODIGO_DA_VAGA, NULL VAGA_PP, 'A' TIPO_VAGA, VA.DATA_CRIACAO, VA.NUMERO_VAGAS, P.ID ID_PCD, RPUC.LIMITE_MIN_ENCAMINHADOS_VAGA, S.SIGLA SITUACAO,
                 (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                 (SELECT COUNT(VIV.ID) FROM VINCULOS_VAGA VIV  WHERE VIV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VIV.DELETADO = 0) TRIADOS,
                 (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                  WHERE E.ID_VAGA = VA.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,
                 CASE
                     WHEN (select count(*) from V_SITUACAO_VAGAS_AGENDADO_E_PROC_SELETIVO VCA where VCA.id_vaga = VA.CODIGO_DA_VAGA and VCA.numero_encaminhados < RPUC.LIMITE_MIN_ENCAMINHADOS_VAGA ) > 0 THEN 1
                     ELSE 0
                     END AS ALERTA,
                 RLE.ID_UNIDADE_CIEE_LOCAL,
                 RLE.ID_CARTEIRA_LOCAL

 FROM VAGAS_APRENDIZ VA
          JOIN REP_LOCAIS_CONTRATO ON VA.ID_LOCAL_CONTRATO = REP_LOCAIS_CONTRATO.ID
          JOIN REP_CONTRATOS RC ON REP_LOCAIS_CONTRATO.ID_CONTRATO = RC.ID
          LEFT JOIN PCD_APRENDIZ P ON P.ID_VAGA_APRENDIZ = VA.ID
          JOIN REP_LOCAIS_ENDERECOS RLE on REP_LOCAIS_CONTRATO.ID = RLE.ID_LOCAL_CONTRATO
          JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RPUC.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE
          JOIN SITUACOES S on VA.ID_SITUACAO_VAGA = S.ID
 WHERE VA.ID_SITUACAO_VAGA IN (SELECT ID FROM SITUACOES WHERE SIGLA = 'E' OR SIGLA = 'S') AND VA.DELETADO = 0)

);
