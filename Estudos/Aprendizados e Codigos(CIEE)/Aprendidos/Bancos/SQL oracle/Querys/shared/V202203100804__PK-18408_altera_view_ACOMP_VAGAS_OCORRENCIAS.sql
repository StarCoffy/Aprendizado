
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SERVICE_VAGAS_DEV"."ACOMP_VAGAS_OCORRENCIAS" ("CONTRATO", "CODIGO_DA_VAGA", "VAGA_PP", "TIPO_VAGA", "DATA_CRIACAO", "ID_PCD", "NUMERO_VAGAS", "SITUACAO", "PRAZO_TRATAR", "ENCAMINHADOS", "DATA_OCORRENCIA", "DATA_PROCESSO_SELETIVO", "ALERTA", "ID_UNIDADE_CIEE_LOCAL", "ID_CARTEIRA_LOCAL", "NUMERO_AUTORIZACAO") AS 
  (
(SELECT DISTINCT RC.ID CONTRATO, VE.CODIGO_DA_VAGA, VE.PROCESSO_PERSONALIZADO VAGA_PP, 'E' TIPO_VAGA, VE.DATA_CRIACAO, P.ID ID_PCD, VE.NUMERO_VAGAS, S.SIGLA SITUACAO, RPUC.DIAS_PRAZO_TRATAR PRAZO_TRATAR,
                 (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VE.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                 (SELECT MAX(OCE.DATA_OCORRENCIA) FROM OCORRENCIAS_ESTAGIO OCE WHERE OCE.ID_VAGA_ESTAGIO = VE.ID) DATA_OCORRENCIA,
                 (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                  WHERE E.ID_VAGA = VE.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,

                 CASE
                     WHEN (SELECT MAX(OCE.DATA_OCORRENCIA) FROM OCORRENCIAS_ESTAGIO OCE WHERE OCE.ID_VAGA_ESTAGIO = VE.ID AND OCE.DATA_OCORRENCIA < SYSDATE - DIAS_PRAZO_TRATAR) IS NOT NULL THEN 1
                     ELSE 0
                     END AS ALERTA,

                 RLE.ID_UNIDADE_CIEE_LOCAL,
                 RLE.ID_CARTEIRA_LOCAL,
				 VE.NUMERO_AUTORIZACAO

 FROM VAGAS_ESTAGIO VE
          JOIN REP_LOCAIS_CONTRATO RLC ON VE.ID_LOCAL_CONTRATO = RLC.ID
          JOIN REP_CONTRATOS RC ON RLC.ID_CONTRATO = RC.ID
          JOIN REP_LOCAIS_ENDERECOS RLE ON RLE.ID_LOCAL_CONTRATO = RLC.ID
          LEFT JOIN PCD_ESTAGIO P ON VE.ID = P.ID_VAGA_ESTAGIO
          JOIN SITUACOES S ON VE.ID_SITUACAO_VAGA = S.ID
          JOIN OCORRENCIAS_ESTAGIO OCE ON VE.ID = OCE.ID_VAGA_ESTAGIO
          JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RLE.ID_UNIDADE_CIEE = RPUC.ID_UNIDADE_CIEE
 WHERE VE.DELETADO = 0 AND OCE.DELETADO=0)

UNION

(SELECT DISTINCT RC.ID CONTRATO, VA.CODIGO_DA_VAGA, NULL VAGA_PP, 'A' TIPO_VAGA, VA.DATA_CRIACAO, P.ID ID_PCD, VA.NUMERO_VAGAS, S.SIGLA SITUACAO, RPUC.DIAS_PRAZO_TRATAR PRAZO_TRATAR,
                 (SELECT COUNT(VV.ID) FROM VINCULOS_VAGA VV WHERE VV.CODIGO_VAGA = VA.CODIGO_DA_VAGA AND VV.SITUACAO_VINCULO = 1 AND VV.DELETADO = 0) ENCAMINHADOS,
                 (SELECT MAX(OCA.DATA_OCORRENCIA) FROM OCORRENCIAS_APRENDIZ OCA WHERE OCA.ID_VAGA_APRENDIZ = VA.ID) DATA_OCORRENCIA,
                 (SELECT MIN(DATA_INICIO) FROM ETAPAS_PERIODOS EP INNER JOIN ETAPAS_PROCESSO_SELETIVO E on EP.ID_ETAPA_PROCESSO_SELETIVO = E.ID
                  WHERE E.ID_VAGA = VA.CODIGO_DA_VAGA) DATA_PROCESSO_SELETIVO,

                 CASE
                     WHEN (SELECT MAX(OCE.DATA_OCORRENCIA) FROM OCORRENCIAS_ESTAGIO OCE WHERE OCE.ID_VAGA_ESTAGIO = VA.ID AND OCE.DATA_OCORRENCIA < SYSDATE - DIAS_PRAZO_TRATAR) IS NOT NULL THEN 1
                     ELSE 0
                     END AS ALERTA,

                 RLE.ID_UNIDADE_CIEE_LOCAL,
                 RLE.ID_CARTEIRA_LOCAL,
				 NULL AS NUMERO_AUTORIZACAO

 FROM VAGAS_APRENDIZ VA
          JOIN REP_LOCAIS_CONTRATO RLC ON VA.ID_LOCAL_CONTRATO = RLC.ID
          JOIN REP_CONTRATOS RC ON RLC.ID_CONTRATO = RC.ID
          JOIN REP_LOCAIS_ENDERECOS RLE ON RLE.ID_LOCAL_CONTRATO = RLC.ID
          LEFT JOIN PCD_APRENDIZ P ON VA.ID = P.ID_VAGA_APRENDIZ
          JOIN SITUACOES S ON VA.ID_SITUACAO_VAGA = S.ID
          JOIN OCORRENCIAS_APRENDIZ OCA ON VA.ID = OCA.ID_VAGA_APRENDIZ
          JOIN REP_PARAMETROS_UNIDADES_CIEE RPUC ON RLE.ID_UNIDADE_CIEE = RPUC.ID_UNIDADE_CIEE
 WHERE VA.DELETADO = 0 AND OCA.DELETADO=0)

);

