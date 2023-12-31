CREATE OR REPLACE VIEW V_ICN_CONTRATO_VALOR_CI AS 
  SELECT DC.ID_CONTRATO
      ,DC.ID_TIPO_CONTRIBUICAO AS TIPO_CONTRIBUICAO
      ,CASE 
            WHEN DC.ID_TIPO_CONTRIBUICAO = 1 AND CIF.ID_CONTRATO IS NULL 
                THEN DC.VALOR_CONTRIBUICAO
            WHEN DC.ID_TIPO_CONTRIBUICAO = 1 AND CIF.ID_CONTRATO IS NOT NULL
                THEN CIF.VALOR_CI
            WHEN DC.ID_TIPO_CONTRIBUICAO = 2 
                THEN DC.VALOR_CONTRIBUICAO
            ELSE NULL 
            END AS VALOR_CI
  FROM REP_DADOS_CONTRIBUICAO_COMPANY DC 
  LEFT JOIN (SELECT ID_CONTRATO
                   ,MAX(VALOR_COBRADO) AS VALOR_CI
               FROM REP_CI_FIXOS_FAIXAS_COMPANY
              WHERE DELETADO = 0
              GROUP BY ID_CONTRATO) CIF ON DC.ID_CONTRATO = CIF.ID_CONTRATO
  WHERE DC.DELETADO = 0
  ORDER BY DC.ID DESC;