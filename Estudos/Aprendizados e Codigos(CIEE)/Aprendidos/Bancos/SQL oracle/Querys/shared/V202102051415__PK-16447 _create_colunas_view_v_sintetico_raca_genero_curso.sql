CREATE OR REPLACE VIEW V_SINTETICO_RACA_GENERO_CURSO 
AS SELECT cee.ID 
      		, cee.ID_ESTUDANTE
      		, cee.CODIGO_CURSO_ESTUDANTE
      		, RE.sexo
      		, ria.ID_ETNIA
      		, cee.ID_LOCAL_CONTRATO
      		, rlc.ID_CONTRATO
      		, rlc.NOME AS nome_local_contrato
      		, rlc.RAZAO_SOCIAL AS razao_social_local_contrato
      		, cee.TIPO_CONTRATO
            , rd.CIDADE
            , rd.UF
      		, cee.DATA_FINAL_APRENDIZ
      		, cee.DATA_FINAL_ESTAGIO
      		, cee.DATA_RESCISAO
      		, cee.SITUACAO
      		, cee.DELETADO
      		, rlc.SITUACAO AS situacao_local_contrato
      		, rlc.DELETADO AS deletado_local_contrato
      	FROM CONTRATOS_ESTUDANTES_EMPRESA cee
      	INNER JOIN REP_LOCAIS_CONTRATO rlc ON rlc.id = cee.ID_LOCAL_CONTRATO
      	INNER JOIN REP_ESTUDANTES re ON re.id = cee.ID_ESTUDANTE
      	INNER JOIN REP_INFORMACOES_ADICIONAIS ria ON ria.id = re.ID_INFORMACOES_ADICIONAIS
        INNER JOIN REP_LOCAIS_ENDERECOS rle ON  (rle.id_local_contrato = rlc.id and rle.endereco_principal = 1)
        INNER JOIN REP_ENDERECOS rd on rd.id = rle.id_endereco
      	GROUP BY cee.ID
      		, cee.ID_ESTUDANTE
      		, cee.CODIGO_CURSO_ESTUDANTE
      		, RE.sexo
      		, ria.ID_ETNIA
      		, cee.ID_LOCAL_CONTRATO
      		, rlc.ID_CONTRATO
      		, rlc.NOME
      		, rlc.RAZAO_SOCIAL
      		, cee.TIPO_CONTRATO
            , rd.CIDADE
            , rd.UF
      		, cee.DATA_FINAL_APRENDIZ
      		, cee.DATA_FINAL_ESTAGIO
      		, cee.DATA_RESCISAO
      		, cee.SITUACAO
      		, cee.DELETADO
      		, rlc.SITUACAO
      		, rlc.DELETADO;