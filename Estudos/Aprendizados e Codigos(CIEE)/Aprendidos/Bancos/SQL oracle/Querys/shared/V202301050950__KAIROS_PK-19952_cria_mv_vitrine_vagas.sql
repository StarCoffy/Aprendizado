CREATE MATERIALIZED VIEW SERVICE_VAGAS_DEV.MV_VITRINE_VAGAS
    BUILD IMMEDIATE
AS
SELECT VT.ID_ESTADO,
       VT.DATA_ALTERACAO,
       VE.ID AS ID_VAGA,
       VT.CODIGO_VAGA,
       CASE WHEN (EXISTS(SELECT 1 FROM PCD_ESTAGIO PCD WHERE PCD.ID_VAGA_ESTAGIO = VE.ID AND PCD.DELETADO = 0)) THEN 'PCD' ELSE 'ESTAGIO' END AS TIPO_VAGA,
       CASE WHEN 
            VE.DIVULGAR_NOME_EMPRESA <> 1 THEN 
                'Confidencial'
            ELSE
                COALESCE(RLC.RAZAO_SOCIAL, RLC.NOME) 
       END AS NOME_EMPRESA,
       AP.DESCRICAO_AREA_PROFISSIONAL AREA_PROFISSIONAL,
       NULL AREA_ATUACAO,
       VE.VALOR_BOLSA_FIXO VALOR_BOLSA,
       CASE
            WHEN
                VE.TIPO_VALOR_BOLSA = 1 THEN 'A_COMBINAR'
            ELSE
                'FIXO'
            END AS TIPO_VALOR_BOLSA,
           CASE
            WHEN
                VE.TIPO_AUXILIO_BOLSA = 1 THEN 'Hora'
            ELSE
                'Mensal'
            END AS TIPO_AUXILIO_BOLSA,
       NULL TIPO_SALARIO_VALOR,
       NULL TIPO_SALARIO,
       VE.VALOR_BOLSA_DE VALOR_BOLSA_DE,
       VE.VALOR_BOLSA_ATE VALOR_BOLSA_ATE,
       NULL VALOR_SALARIO_DE,
       NULL VALOR_SALARIO_ATE,
       VE.DESCRICAO,
       VT.ORDEM,
       RE.TIPO_LOGRADOURO,
       RE.ENDERECO,
       RE.NUMERO,
       RE.BAIRRO,
       RE.COMPLEMENTO,
       RE.CEP,
       RE.CIDADE,
       RE.UF,
       VE.TIPO_HORARIO_ESTAGIO TIPO_HORARIO,
       VE.HORARIO_ENTRADA,
       VE.HORARIO_SAIDA,
       AP.CODIGO_AREA_PROFISSIONAL,
       CASE
            WHEN
                VE.NIVEL_ESTUDANTE_VAGA = 0 THEN 'EM'
            WHEN
                VE.NIVEL_ESTUDANTE_VAGA = 1 THEN 'TE'
            WHEN
                VE.NIVEL_ESTUDANTE_VAGA = 2 THEN 'SU'
            else null
       END AS NIVEL_ENSINO,
       RCC.COD_MUNICIPIO_IBGE CODIGO_MUNICIPIO
       
FROM VITRINE_VAGAS VT
         INNER JOIN VAGAS_ESTAGIO VE ON VE.CODIGO_DA_VAGA = VT.CODIGO_VAGA
         INNER JOIN SITUACOES S ON S.ID = VE.ID_SITUACAO_VAGA
         INNER JOIN REP_LOCAIS_CONTRATO RLC ON RLC.ID = VE.ID_LOCAL_CONTRATO
         INNER JOIN REP_AREAS_PROFISSIONAIS AP ON AP.CODIGO_AREA_PROFISSIONAL = VE.CODIGO_AREA_PROFISSIONAL
		 LEFT JOIN REP_LOCAIS_ENDERECOS RLE ON RLC.ID = RLE.ID_LOCAL_CONTRATO AND RLE.DELETADO=0
         LEFT JOIN REP_ENDERECOS RE ON RLE.ID_ENDERECO = RE.ID
         LEFT JOIN REP_CEPS_CORE RCC ON RE.CEP = RCC.CODIGO_CEP
WHERE VT.SITUACAO = 1
  AND S.SIGLA IN ('A', 'B')
  AND (CURRENT_DATE BETWEEN VT.DATA_PUBLICACAO_INICIO AND VT.DATA_PUBLICACAO_FIM)
  AND VE.TIPO_DIVULGACAO <> 2

UNION ALL

SELECT VT.ID_ESTADO,
       VT.DATA_ALTERACAO,
       VA.ID AS ID_VAGA,
       VT.CODIGO_VAGA,
       CASE WHEN (EXISTS(SELECT 1 FROM PCD_APRENDIZ PCD WHERE PCD.ID_VAGA_APRENDIZ = VA.ID AND PCD.DELETADO = 0)) THEN 'PCD' ELSE 'APRENDIZ' END AS TIPO_VAGA,
       CASE WHEN 
            VA.DIVULGAR_NOME_EMPRESA <> 1 THEN 
                'Confidencial'
            ELSE
                COALESCE(RLC.RAZAO_SOCIAL, RLC.NOME) 
       END AS NOME_EMPRESA,
       NULL AREA_PROFISSIONAL,
       AA.DESCRICAO_AREA_ATUACAO AREA_ATUACAO,
       VA.VALOR_SALARIO VALOR_BOLSA,
       NULL TIPO_VALOR_BOLSA,
       NULL TIPO_AUXILIO_BOLSA,
       CASE
        WHEN
            VA.TIPO_SALARIO_VALOR = 1 THEN 'A_COMBINAR'
        ELSE
            'FIXO'
        END AS TIPO_SALARIO_VALOR,
       CASE
        WHEN
            VA.TIPO_SALARIO = 1 THEN 'Hora'
        ELSE
            'Mensal'
        END AS TIPO_SALARIO,
       NULL VALOR_BOLSA_DE,
       NULL VALOR_BOLSA_ATE,
       VA.VALOR_SALARIO_DE VALOR_SALARIO_DE,
       VA.VALOR_SALARIO_ATE VALOR_SALARIO_ATE,
       VA.DESCRICAO,
       VT.ORDEM,
	   RE.TIPO_LOGRADOURO,
       RE.ENDERECO,
       RE.NUMERO,
       RE.BAIRRO,
       RE.COMPLEMENTO,
       RE.CEP,
       RE.CIDADE,
       RE.UF,
       1 TIPO_HORARIO ,
       VA.HORARIO_INICIO,
       VA.HORARIO_TERMINO,
       NULL CODIGO_AREA_PROFISSIONAL,
       CASE
            WHEN
                VA.ESCOLARIDADE = 0 THEN 'T'
            when
                VA.ESCOLARIDADE = 1 THEN 'EF'
            when
                VA.ESCOLARIDADE = 2 THEN 'EM'
            else null
       END AS NIVEL_ENSINO,
       RCC.COD_MUNICIPIO_IBGE CODIGO_MUNICIPIO
	   
FROM VITRINE_VAGAS VT
         INNER JOIN VAGAS_APRENDIZ VA ON VA.CODIGO_DA_VAGA = VT.CODIGO_VAGA
         INNER JOIN SITUACOES S ON S.ID = VA.ID_SITUACAO_VAGA
         INNER JOIN REP_LOCAIS_CONTRATO RLC ON RLC.ID = VA.ID_LOCAL_CONTRATO
         INNER JOIN CURSOS_CAPACITACAO CC ON CC.ID = VA.ID_CURSO_CAPACITACAO
         INNER JOIN AREAS_ATUACAO_APRENDIZ AA ON AA.ID = CC.ID_AREA_ATUACAO
		 LEFT JOIN REP_LOCAIS_ENDERECOS RLE ON RLC.ID = RLE.ID_LOCAL_CONTRATO AND RLE.DELETADO=0
         LEFT JOIN REP_ENDERECOS RE ON RLE.ID_ENDERECO = RE.ID
         LEFT JOIN REP_CEPS_CORE RCC ON RE.CEP = RCC.CODIGO_CEP
WHERE VT.SITUACAO = 1
  AND S.SIGLA IN ('A', 'B')
  AND (CURRENT_DATE BETWEEN VT.DATA_PUBLICACAO_INICIO AND VT.DATA_PUBLICACAO_FIM)
  AND VA.TIPO_DIVULGACAO <> 2;