-- ATUALIZAR APOLICE DE SEGUROS DO ESTAGIARIO CIEE

CREATE OR REPLACE VIEW V_APOLICE_SEGURO_ESTAGIARIO_CIEE AS
    (
        SELECT DISTINCT
            TCE.ID_ESTUDANTE AS ID_ESTUDANTE,
        	REM.NOME AS EMPRESA,
        	REM.CNPJ AS CNPJ,
        	RLC.ID_CONTRATO AS CODIGO_CIEE,
        	RLE.ID_UNIDADE_CIEE AS ID_UNIDADE_CIEE,
        	RUC.DESCRICAO AS DESCRICAO_CIEE,
        	RCI.CNPJ AS CNPJ_CIEE,
          	RAC.DATA_TERMINO AS DATA_TERMINO,
        	RAC.DATA_INICIO AS DATA_INICIO,
        	RAC.SUSEP_APOLICE AS SUSEP_APOLICE,
        	RAC.SUSEP_SEGURADORA AS SUSEP_SEGURADORA,
        	RAC.SUCURSAL_SEGURADORA AS SUCURSAL_SEGURADORA,
        	RAC.SUBFATURA_SEGURADORA AS SUBFATURA_SEGURADORA,
        	RAC.NUMERO AS NUMERO_APOLICE,
        	RVAC.MORTE AS VALOR_MORTE,
        	RVAC.INVALIDEZ AS VALOR_INVALIDEZ,
        	RVAC.PREMIO AS VALOR_PREMIO,
        	RVAC.IOF AS VALOR_IOF,
        	RVAC.CUSTO_TOTAL AS VALOR_CUSTO_TOTAL,
        	RVAC.COBERTURA AS VALOR_COBERTURA,
        	TCE.ID AS ID_TCE,
        	TCE.NUMERO_END_ESTUDANTE AS NUMERO_ESTUDANTE,
        	TCE.CPF_ESTUDANTE AS CPF_ESTUDANTE,
        	TCE.TELEFONE_CONTATO AS TELEFONE_CONTATO,
        	TCE.TELEFONE_ESTUDANTE AS TELEFONE_ESTUDANTE,
        	TCE.TELEFONE_MONITOR AS TELEFONE_MONITOR,
        	TCE.CEP_END_ESTUDANTE AS CEP_END_ESTUDANTE,
        	TCE.CIDADE_END_ESTUDANTE AS CIDADE_END_ESTUDANTE,
        	TCE.BAIRRO_END_ESTUDANTE AS BAIRRO_END_ESTUDANTE,
        	TCE.UF_END_ESTUDANTE AS UF_END_ESTUDANTE,
        	TCE.COMPLEMENTO_END_ESTUDANTE AS COMPLEMENTO_END_ESTUDANTE,
        	TCE.ENDERECO_ESTUDANTE AS ENDERECO_ESTUDANTE,
        	RAC.ID_TEL_OUVIDORIA_SEGURADORA AS ID_TEL_OUVIDORIA_SEGURADORA,
        	RAC.ID_SEGURADORA AS ID_SEGURADORA,
        	TCE.DATA_INICIO_ESTAGIO AS DATA_INICIO_ESTAGIO,
        	RCAC.NOME AS CORRETORA_NOME,
        	RCAC.SUSEP AS SUSEP_CORRETORA,
        	RCTC.ID_TELEFONE AS ID_TELFONE_CORRETORA,
        	RUCT.ID_TELEFONE AS ID_TELEFONE_UNIDADE
        FROM CONTRATOS_ESTUDANTES_EMPRESA              TCE
             JOIN REP_LOCAIS_CONTRATO                  RLC   ON  (TCE.ID_LOCAL_CONTRATO = RLC.ID)
             JOIN REP_LOCAIS_ENDERECOS                 RLE   ON  (RLE.ID_LOCAL_CONTRATO = RLC.ID)
             JOIN REP_EMPRESAS                         REM   ON  (REM.CNPJ = RLC.CNPJ)
             JOIN REP_LOCAIS_TELEFONES                 RLT   ON  (RLT.ID_LOCAL_CONTRATO = RLC.ID)
             JOIN REP_CONTRATOS                        RCT   ON  (RCT.ID = RLC.ID_CONTRATO)
             JOIN REP_UNIDADES_CIEE                    RUC   ON  (RUC.ID = RLE.ID_UNIDADE_CIEE)
			 JOIN REP_CIEES                            RCI   ON  (RCI.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE)
             JOIN REP_APOLICES_CIEE                    RAC   ON  (RAC.ID = RCT.ID_APOLICES_CIEE)
             JOIN REP_APOLICES_VALORES                 RAV   ON  (RAV.ID_APOLICE = RAC.ID)
             JOIN REP_VALORES_APOLICES_CIEE            RVAC  ON  (RAV.ID_APOLICE = RAC.ID)
             JOIN REP_CORRETORAS_APOLICES_CIEE_COMPANY RCAC  ON  (RCAC.ID = RAC.ID_CORRETORA)
             JOIN REP_CORRETORAS_TELEFONES_COMPANY     RCTC  ON  (RCTC.ID_CORRETORA = RAC.ID_CORRETORA)
             JOIN REP_UNIDS_CIEE_TELS_CONTATO_UNIT     RUCT  ON  (RUCT.ID_UNIDADE_CIEE = RLE.ID_UNIDADE_CIEE)
             JOIN REP_TELEFONES_ESCOLA                 RTE   ON  (RTE.ID = RUCT.ID_TELEFONE)
    WHERE   RLC.DELETADO = 0 AND RCT.DELETADO = 0 AND REM.DELETADO = 0
 );
