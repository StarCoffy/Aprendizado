
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SERVICE_VAGAS_DEV"."V_DIAS_DISPONIVEIS_RECESSO" ("CONTRATO", "QTD_DIAS_FERIAS_PROPORCIONAL", "QTD_DIAS_FERIAS_CLT", "QTD_DIAS_FERIAS_PROPORCIONAL_ATE_FINAL", "QTD_DIAS_FERIAS_CLT_ATE_FINAL") AS 
  SELECT ID                       AS CONTRATO,
       --to_char(DATA_INICIO_ESTAGIO,'DD/MM/YYYY')AS DATA_INICIO_ESTAGIO,
       --TRUNC(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO))AS qtd_meses_contrato,
       --(round(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO)-TRUNC(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO)),2)*30) AS qtd_diAS_resto,
       --CASE WHEN (round(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO)-TRUNC(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO)))*30) >= 15 THEN 1 ELSE 0 END  fracao_14_diAS,
       round(
               (
                       (TRUNC(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO)) * 2.5)
                       +
                       (round(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO) -
                              TRUNC(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO)), 3) * 2.5)
                   ), 1)        AS QTD_DIAS_FERIAS_PROPORCIONAL,
       ((TRUNC(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO)) * 2.5)
           +
        (CASE
             WHEN (round(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO) -
                         TRUNC(MONTHS_BETWEEN(sysdate, DATA_INICIO_ESTAGIO))) * 30) >= 15
                 THEN 1
             ELSE 0 END) * 2.5) AS QTD_DIAS_FERIAS_CLT,
       round(((TRUNC(MONTHS_BETWEEN(DATA_FINAL_ESTAGIO, DATA_INICIO_ESTAGIO)) * 2.5) +
              (round(MONTHS_BETWEEN(DATA_FINAL_ESTAGIO, DATA_INICIO_ESTAGIO) -
                     TRUNC(MONTHS_BETWEEN(DATA_FINAL_ESTAGIO, DATA_INICIO_ESTAGIO)), 3) * 2.5)), 1
           )                    AS QTD_DIAS_FERIAS_PROPORCIONAL_ATE_FINAL,
       ((TRUNC(MONTHS_BETWEEN(DATA_FINAL_ESTAGIO, DATA_INICIO_ESTAGIO)) * 2.5)
           +
        (CASE
             WHEN (round(MONTHS_BETWEEN(DATA_FINAL_ESTAGIO, DATA_INICIO_ESTAGIO) -
                         TRUNC(MONTHS_BETWEEN(DATA_FINAL_ESTAGIO, DATA_INICIO_ESTAGIO))) * 30) >= 15
                 THEN 1
             ELSE 0 END) * 2.5) AS QTD_DIAS_FERIAS_CLT_ATE_FINAL
FROM (
         SELECT ID,
                TIPO_CONTRATO,
                DATA_INICIO_ESTAGIO,
                DATA_FINAL_ESTAGIO,
                (CASE
                     WHEN MONTHS_BETWEEN(SYSDATE, DATA_INICIO_ESTAGIO) < 0 THEN DATA_INICIO_ESTAGIO
                     ELSE COALESCE(DATA_RESCISAO,DATA_FINAL_ESTAGIO) END) AS DATA_REFERENCIA
         FROM CONTRATOS_ESTUDANTES_EMPRESA
     )
WHERE TIPO_CONTRATO = 'E'
ORDER BY ID;