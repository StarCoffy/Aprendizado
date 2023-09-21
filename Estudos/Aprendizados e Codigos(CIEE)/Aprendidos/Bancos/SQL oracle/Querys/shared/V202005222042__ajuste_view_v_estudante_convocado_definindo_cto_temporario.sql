
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "SERVICE_VAGAS_DEV"."V_ESTUDANTE_CONVOCADO" ("CODIGO_VAGA", "NUMERO_CONTRATO", "NUMERO_LOCAL", "NUMERO_VAGAS", "RAZAO_SOCIAL", "CODIGO_UNIDADE", "NOME_UNIDADE", "HORARIO_INICIO", "HORARIO_TERMINO", "PROCESSO_PERSONALIZADO", "DATA_EMAIL", "DATA_SMS", "NUMERO_CARTEIRA", "RESPONSAVEL_CARTEIRA", "DATA_CONVOCACAO", "PRIORIZA_POM", "IDENTIFICA_POM", "ID_ESTUDANTE", "CODIGO_ESTUDANTE", "CODIGO_VINCULO", "NOME_ESTUDANTE", "TELEFONE", "CELULAR", "EMAIL", "DATA_ABERTURA", "DATA_ENVIADO_URA", "ENVIADO_URA", "TIPO_VAGA", "TIPO_DIVULGACAO") AS 
  (
    SELECT
        CODIGO_VAGA,
        NUMERO_CONTRATO,
        NUMERO_LOCAL,
        NUMERO_VAGAS,
        RAZAO_SOCIAL,
        CODIGO_UNIDADE,
        NOME_UNIDADE,
        HORARIO_INICIO,
        HORARIO_TERMINO,
        PROCESSO_PERSONALIZADO,
        DATA_EMAIL,
        DATA_SMS,
        NUMERO_CARTEIRA,
        RESPONSAVEL_CARTEIRA,
        DATA_CONVOCACAO,
        PRIORIZA_POM,
        IDENTIFICA_POM,
        ID_ESTUDANTE,
        CODIGO_ESTUDANTE,
        CODIGO_VINCULO,
        NOME_ESTUDANTE,
        TELEFONE,
        CELULAR,
        EMAIL,
        DATA_ABERTURA,
        DATA_ENVIADO_URA,
        ENVIADO_URA,
        TIPO_VAGA,
        TIPO_DIVULGACAO
    FROM (
         SELECT
             VV.CODIGO_VAGA,
             C.ID AS NUMERO_CONTRATO,
             RLC.ID AS NUMERO_LOCAL,
             VE.NUMERO_VAGAS,
             (select listagg(RAZAO_SOCIAL, '|') within group(order by ID_EMPRESA desc) from REP_INFO_CONTRATO_EMPRESAS where DELETADO = 0 and ID_CONTRATO = C.ID  and PRINCIPAL=1) RAZAO_SOCIAL,
             RLE.ID_UNIDADE_CIEE AS CODIGO_UNIDADE,
             RUC.DESCRICAO AS NOME_UNIDADE,
             VE.HORARIO_ENTRADA AS HORARIO_INICIO,
             VE.HORARIO_SAIDA AS HORARIO_TERMINO,
             VE.PROCESSO_PERSONALIZADO,
             VV.DATA_COMUNICACAO_CONVOCACAO AS DATA_EMAIL,
             VV.DATA_COMUNICACAO_CONVOCACAO AS DATA_SMS,
             RC.ID_UNIDADE_CIEE AS NUMERO_CARTEIRA,
             RP.NOME AS RESPONSAVEL_CARTEIRA,
             VV.DATA_CONVOCACAO,
             VE.PRIORIZA_POM,
             CASE 
                WHEN 
                    RLE.ID_UNIDADE_CIEE >= 101 AND RLE.ID_UNIDADE_CIEE < 201
                THEN
                    'SP'
                WHEN
                    RLE.ID_UNIDADE_CIEE >= 201 AND RLE.ID_UNIDADE_CIEE < 213
                THEN
                    'DF'
                WHEN
                    RLE.ID_UNIDADE_CIEE >= 213 AND RLE.ID_UNIDADE_CIEE < 301
                THEN
                    'SP'
                WHEN
                    RLE.ID_UNIDADE_CIEE >= 301 AND RLE.ID_UNIDADE_CIEE < 401
                THEN
                    'CE'
                WHEN
                    RLE.ID_UNIDADE_CIEE >= 501 AND RLE.ID_UNIDADE_CIEE < 1201
                THEN
                    'DF'
                WHEN
                    RLE.ID_UNIDADE_CIEE >= 1201 AND RLE.ID_UNIDADE_CIEE < 1901
                THEN
                    'CE'
                WHEN
                    RLE.ID_UNIDADE_CIEE >= 1901 AND RLE.ID_UNIDADE_CIEE < 2101
                THEN
                    'DF'
                WHEN
                    RLE.ID_UNIDADE_CIEE >= 2401 AND RLE.ID_UNIDADE_CIEE < 2501
                THEN
                    'RJ'
                ELSE
                    'SP'
            END AS IDENTIFICA_POM,
             REE.ID AS ID_ESTUDANTE,
             REE.CODIGO_ESTUDANTE,
             VV.ID AS CODIGO_VINCULO,
             REE.NOME AS NOME_ESTUDANTE,
             (select listagg(TELEFONE, '|') within group(order by PRINCIPAL desc, VERIFICADO desc, DATA_ALTERACAO desc) from REP_TELEFONES where DELETADO = 0 and ID_ESTUDANTE = REE.ID and TIPO_TELEFONE = 'FIXO') TELEFONE,
             (select listagg(TELEFONE, '|') within group(order by PRINCIPAL desc, VERIFICADO desc, DATA_ALTERACAO desc) from REP_TELEFONES where DELETADO = 0 and ID_ESTUDANTE = REE.ID and TIPO_TELEFONE = 'CELULAR') CELULAR,
             (select REEM.EMAIL from REP_EMAILS REEM inner join REP_ESTUDANTES REPE on REEM.ID_ESTUDANTE = REPE.ID where reem.PRINCIPAL = 1 and REEM.ID_ESTUDANTE = REE.ID) EMAIL,
             VE.DATA_CRIACAO AS DATA_ABERTURA,
             ECP.DATA_ENVIO AS DATA_ENVIADO_URA,
             VV.ENVIADO_URA AS ENVIADO_URA,
             'ESTAGIO' AS TIPO_VAGA,
             VE.TIPO_DIVULGACAO AS TIPO_DIVULGACAO
             
         FROM VINCULOS_VAGA VV
                  INNER JOIN REP_ESTUDANTES REE on VV.ID_ESTUDANTE = REE.ID
                  LEFT JOIN ENVIOS_CAMPANHAS_POM ECP ON VV.ID = ECP.ID_ENTIDADE
                  INNER JOIN VAGAS_ESTAGIO VE on VV.CODIGO_VAGA = VE.CODIGO_DA_VAGA
                  INNER JOIN SITUACOES S on VE.ID_SITUACAO_VAGA = S.ID
                  INNER JOIN REP_LOCAIS_CONTRATO RLC on VE.ID_LOCAL_CONTRATO = RLC.ID
                  INNER JOIN REP_CONTRATOS C on RLC.ID_CONTRATO = C.ID             
                  INNER JOIN REP_LOCAIS_ENDERECOS RLE on RLC.ID = RLE.ID_LOCAL_CONTRATO
                  INNER JOIN REP_UNIDADES_CIEE RUC on RLE.ID_UNIDADE_CIEE = RUC.ID
                  INNER JOIN REP_CARTEIRAS RC on RUC.ID = RC.ID_UNIDADE_CIEE
                  INNER JOIN REP_ENDERECOS REE ON RLE.ID_ENDERECO = REE.ID
                  INNER JOIN REP_MAP_CARTEIRAS_TERRITORIOS RMCT ON RC.ID = RMCT.ID_CARTEIRA
             AND RMCT.CEP = REE.CEP
                  INNER JOIN REP_ASSISTENTES RA on RC.ID_ASSISTENTE = RA.ID
                  INNER JOIN REP_PESSOAS RP on RA.ID_PESSOA = RP.ID
         WHERE VV.SITUACAO_VINCULO = 0
            AND S.SIGLA = 'A' OR (S.SIGLA = 'B' AND NOT EXISTS (SELECT ID_OCORRENCIA FROM OCORRENCIAS_ESTAGIO OCORRE WHERE DELETADO != 1 AND VE.ID = OCORRE.ID_VAGA_ESTAGIO))
            AND NOT EXISTS (SELECT ID_RECUSA FROM VINCULOS_CONVOCACAO WHERE VV.ID = ID_VINCULO AND DATA_LIBERACAO_CONVOCACAO IS NOT NULL)
         UNION
         SELECT
             VVG.CODIGO_VAGA ,
             CA.ID AS NUMERO_CONTRATO,
             LCA.ID AS NUMERO_LOCAL,
             VA.NUMERO_VAGAS,
             (select listagg(RAZAO_SOCIAL, '|') within group(order by ID_EMPRESA desc) from REP_INFO_CONTRATO_EMPRESAS where DELETADO = 0 and ID_CONTRATO = CA.ID and PRINCIPAL=1) RAZAO_SOCIAL,
             RLEA.ID_UNIDADE_CIEE AS CODIGO_UNIDADE,
             RUCA.DESCRICAO AS NOME_UNIDADE,
             VA.HORARIO_INICIO ,
             VA.HORARIO_TERMINO,
             NULL as PROCESSO_PERSONALIZADO,
             VVG.DATA_COMUNICACAO_CONVOCACAO AS DATA_EMAIL,
             VVG.DATA_COMUNICACAO_CONVOCACAO AS DATA_SMS,
             RCA.ID_UNIDADE_CIEE AS NUMERO_CARTEIRA,
             RPA.NOME AS RESPONSAVEL_CARTEIRA,
             VVG.DATA_CONVOCACAO,
             VA.PRIORIZA_POM,
             CASE 
                WHEN 
                    RLEA.ID_UNIDADE_CIEE >= 101 AND RLEA.ID_UNIDADE_CIEE < 201
                THEN
                    'SP'
                WHEN
                    RLEA.ID_UNIDADE_CIEE >= 201 AND RLEA.ID_UNIDADE_CIEE < 213
                THEN
                    'DF'
                WHEN
                    RLEA.ID_UNIDADE_CIEE >= 213 AND RLEA.ID_UNIDADE_CIEE < 301
                THEN
                    'SP'
                WHEN
                    RLEA.ID_UNIDADE_CIEE >= 301 AND RLEA.ID_UNIDADE_CIEE < 401
                THEN
                    'CE'
                WHEN
                    RLEA.ID_UNIDADE_CIEE >= 501 AND RLEA.ID_UNIDADE_CIEE < 1201
                THEN
                    'DF'
                WHEN
                    RLEA.ID_UNIDADE_CIEE >= 1201 AND RLEA.ID_UNIDADE_CIEE < 1901
                THEN
                    'CE'
                WHEN
                    RLEA.ID_UNIDADE_CIEE >= 1901 AND RLEA.ID_UNIDADE_CIEE < 2101
                THEN
                    'DF'
                WHEN
                    RLEA.ID_UNIDADE_CIEE >= 2401 AND RLEA.ID_UNIDADE_CIEE < 2501
                THEN
                    'RJ'
                ELSE
                    'SP'
            END AS IDENTIFICA_POM,
             REEA.ID AS ID_ESTUDANTE,
             REEA.CODIGO_ESTUDANTE,
             VVG.ID AS CODIGO_VINCULO,
             REEA.NOME AS NOME_ESTUDANTE,
             (select listagg(TELEFONE, '|') within group(order by PRINCIPAL desc, VERIFICADO desc, DATA_ALTERACAO desc) from REP_TELEFONES where DELETADO = 0 and ID_ESTUDANTE = REEA.ID and TIPO_TELEFONE = 'FIXO') TELEFONE,
             (select listagg(TELEFONE, '|') within group(order by PRINCIPAL desc, VERIFICADO desc, DATA_ALTERACAO desc) from REP_TELEFONES where DELETADO = 0 and ID_ESTUDANTE = REEA.ID and TIPO_TELEFONE = 'CELULAR') CELULAR,
             (select REEMA.EMAIL from REP_EMAILS REEMA inner join REP_ESTUDANTES REPEA on REEMA.ID_ESTUDANTE = REPEA.ID where REEMA.PRINCIPAL = 1 and REEMA.ID_ESTUDANTE = REEA.ID) EMAIL,
             VA.DATA_CRIACAO AS DATA_ABERTURA,
             ECPA.DATA_ENVIO AS DATA_ENVIADO_URA,
             VVG.ENVIADO_URA AS ENVIADO_URA,
             'APRENDIZ' AS TIPO_VAGA,
             VA.TIPO_DIVULGACAO AS TIPO_DIVULGACAO
         FROM VINCULOS_VAGA VVG
                  INNER JOIN REP_ESTUDANTES REEA on VVG.ID_ESTUDANTE = REEA.ID
                  INNER JOIN VAGAS_APRENDIZ VA on VVG.CODIGO_VAGA = VA.CODIGO_DA_VAGA
                  LEFT JOIN ENVIOS_CAMPANHAS_POM ECPA ON VVG.ID = ECPA.ID_ENTIDADE
                  INNER JOIN SITUACOES SS on VA.ID_SITUACAO_VAGA = SS.ID
                  INNER JOIN REP_LOCAIS_CONTRATO LCA on VA.ID_LOCAL_CONTRATO = LCA.ID
                  INNER JOIN REP_CONTRATOS CA on LCA.ID_CONTRATO = CA.ID
                  INNER JOIN REP_LOCAIS_ENDERECOS RLEA on LCA.ID = RLEA.ID_LOCAL_CONTRATO
                  INNER JOIN REP_UNIDADES_CIEE RUCA on RLEA.ID_UNIDADE_CIEE = RUCA.ID
                  INNER JOIN REP_CARTEIRAS RCA on RUCA.ID = RCA.ID_UNIDADE_CIEE
                  INNER JOIN REP_ENDERECOS REE ON RLEA.ID_ENDERECO = REE.ID
                  INNER JOIN REP_MAP_CARTEIRAS_TERRITORIOS RMCT ON RCA.ID = RMCT.ID_CARTEIRA
             AND RMCT.CEP = REE.CEP
                  INNER JOIN REP_ASSISTENTES RAA on RCA.ID_ASSISTENTE = RAA.ID
                  INNER JOIN REP_PESSOAS RPA on RAA.ID_PESSOA = RPA.ID

         WHERE VVG.SITUACAO_VINCULO = 0
            AND SS.SIGLA = 'A' OR (SS.SIGLA = 'B' AND NOT EXISTS (SELECT ID_OCORRENCIA FROM OCORRENCIAS_APRENDIZ OCORRA WHERE DELETADO != 1 AND VA.ID = OCORRA.ID_VAGA_APRENDIZ))
            AND NOT EXISTS (SELECT ID_RECUSA FROM VINCULOS_CONVOCACAO WHERE VVG.ID = ID_VINCULO AND DATA_LIBERACAO_CONVOCACAO IS NOT NULL)
        
    )
    
);
