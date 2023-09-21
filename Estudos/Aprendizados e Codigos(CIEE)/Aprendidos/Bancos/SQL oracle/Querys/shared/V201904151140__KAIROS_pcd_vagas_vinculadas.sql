
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "V_VAGAS_VINCULADAS_ESTUDANTE" ("ID_ESTUDANTE", "CODIGO_VAGA", "ID_LOCAL_CONTRATO", "CNPJ", "TIPO_VAGA", "TIPO_DIVULGACAO", "AREA_PROFISSIONAL", "AREA_ATUACAO", "CURSO_CAPACITACAO", "VALOR_BOLSA", "VALOR_BOLSA_DE", "VALOR_BOLSA_ATE", "TIPO_VALOR_BOLSA", "LATITUDE_EMPRESA", "LONGITUDE_EMPRESA", "BENEFICIOS", "ID_PCD") AS 
  (

     SELECT VINC_E.ID_ESTUDANTE as ID_ESTUDANTE,
            VINC_E.CODIGO_VAGA AS CODIGO_VAGA,
            VAGA_E.ID_LOCAL_CONTRATO AS ID_LOCAL_CONTRATO,
            LOC_C.CNPJ AS CNPJ,
            'ESTAGIO' AS TIPO_VAGA,
            VAGA_E.TIPO_DIVULGACAO AS TIPO_DIVULGACAO,
            AP.DESCRICAO_AREA_PROFISSIONAL AS AREA_PROFISSIONAL,
            NULL AS AREA_ATUACAO,
            NULL AS CURSO_CAPACITACAO,
            VAGA_E.VALOR_BOLSA_FIXO AS VALOR_BOLSA,
            VAGA_E.VALOR_BOLSA_DE AS VALOR_BOLSA_DE,
            VAGA_E.VALOR_BOLSA_ATE AS VALOR_BOLSA_ATE,
            VAGA_E.TIPO_VALOR_BOLSA AS TIPO_VALOR_BOLSA,
            END.LATITUDE AS LATITUDE_EMPRESA,
            END.LONGITUDE AS LONGITUDE_EMPRESA,
            COUNT(B.ID) AS BENEFICIOS,
            pcd.ID AS ID_PCD
     FROM VINCULOS_VAGA VINC_E
            INNER JOIN VAGAS_ESTAGIO VAGA_E ON VAGA_E.CODIGO_DA_VAGA = VINC_E.CODIGO_VAGA
            INNER JOIN REP_AREAS_PROFISSIONAIS AP ON AP.CODIGO_AREA_PROFISSIONAL = VAGA_E.CODIGO_AREA_PROFISSIONAL
            INNER JOIN REP_LOCAIS_CONTRATO LOC_C ON LOC_C.ID = VAGA_E.ID_LOCAL_CONTRATO
            INNER JOIN REP_LOCAIS_ENDERECOS LOC_E ON LOC_C.ID = LOC_E.ID_LOCAL_CONTRATO AND LOC_E.DELETADO = 0
            INNER JOIN REP_ENDERECOS END ON LOC_E.ID_ENDERECO = END.ID
            LEFT JOIN BENEFICIOS_ADICIONAIS B ON B.ID_VAGA_ESTAGIO = VAGA_E.ID
            LEFT JOIN pcd  ON pcd.ID_VAGA_ESTAGIO = VAGA_E.ID
     GROUP BY ID_ESTUDANTE, CODIGO_VAGA, VAGA_E.ID_LOCAL_CONTRATO, CNPJ, 'ESTAGIO', TIPO_DIVULGACAO, DESCRICAO_AREA_PROFISSIONAL,
              VALOR_BOLSA_FIXO, VALOR_BOLSA_DE, VALOR_BOLSA_ATE, TIPO_VALOR_BOLSA, LATITUDE, LONGITUDE, pcd.ID 

     UNION

     SELECT VINC_A.ID_ESTUDANTE as ID_ESTUDANTE,
            VINC_A.CODIGO_VAGA AS CODIGO_VAGA,
            VAGA_A.ID_LOCAL_CONTRATO AS ID_LOCAL_CONTRATO,
            LOC_C.CNPJ AS CNPJ,
            'APRENDIZ' AS TIPO_VAGA,
            VAGA_A.TIPO_DIVULGACAO AS TIPO_DIVULGACAO,
            NULL AS AREA_PROFISSIONAL,
            VAGA_A.ID_AREA_ATUACAO_APRENDIZ AS AREA_ATUACAO,
            T.NOME_CURSO AS CURSO_CAPACITACAO,
            VAGA_A.VALOR_SALARIO AS VALOR_BOLSA,
            VAGA_A.VALOR_SALARIO_DE AS VALOR_BOLSA_DE,
            VAGA_A.VALOR_SALARIO_ATE AS VALOR_BOLSA_ATE,
            VAGA_A.TIPO_SALARIO_VALOR AS TIPO_VALOR_BOLSA,
            END.LATITUDE AS LATITUDE_EMPRESA,
            END.LONGITUDE AS LONGITUDE_EMPRESA,
            COUNT(B.ID) AS BENEFICIOS,
            pcd_aprendiz.ID AS ID_PCD            
     FROM VINCULOS_VAGA VINC_A
            INNER JOIN VAGAS_APRENDIZ VAGA_A ON VAGA_A.CODIGO_DA_VAGA = VINC_A.CODIGO_VAGA
            INNER JOIN TURMAS T ON T.ID_VAGA_APRENDIZ = VAGA_A.ID
            INNER JOIN REP_LOCAIS_CONTRATO LOC_C ON LOC_C.ID = VAGA_A.ID_LOCAL_CONTRATO
            INNER JOIN REP_LOCAIS_ENDERECOS LOC_E ON LOC_C.ID = LOC_E.ID_LOCAL_CONTRATO AND LOC_E.DELETADO = 0
            INNER JOIN REP_ENDERECOS END ON LOC_E.ID_ENDERECO = END.ID
            LEFT JOIN BENEFICIOS_ADIC_APRENDIZ B ON B.ID_VAGA_APRENDIZ = VAGA_A.ID
            LEFT JOIN pcd_aprendiz  ON pcd_aprendiz.ID_VAGA_APENDIZ = VAGA_A.ID
     GROUP BY ID_ESTUDANTE, CODIGO_VAGA, VAGA_A.ID_LOCAL_CONTRATO, CNPJ, 'APRENDIZ', TIPO_DIVULGACAO, ID_AREA_ATUACAO_APRENDIZ, NOME_CURSO,
              VALOR_SALARIO, VALOR_SALARIO_DE, VALOR_SALARIO_ATE, TIPO_SALARIO_VALOR, END.LATITUDE, END.LONGITUDE, pcd_aprendiz.ID

);
