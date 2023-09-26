CREATE OR REPLACE view VIEW_EMPRESAS_QUALIFICACOES_VENCIDAS as
SELECT

    -- ID QUALIFICAÇÃO
    T.ID,

    -- CONTRATO
    RC.ID AS ID_CONTRATO,

    -- CARTEIRA
    RCART.ID AS ID_CARTEIRA,
    RCART.DESCRICAO AS DESCRICAO_CARTEIRA,

    --DOMINIO
    RD.ID_DOMINIO_PAI,

    -- UNIDADE
    RU.ID AS ID_UNIDADE,
    RU.DESCRICAO AS DESCRICAO_UNIDADE,

    -- CONSULTOR
    RP.ID AS ID_CONSULTOR,
    RP.NOME AS NOME_CONSULTOR,

    -- TIPO CLASSIFICACAO
    CASE WHEN T.ID_LOCAL_CONTRATO IS NOT NULL THEN 'LOCAL' ELSE 'EMPRESA' END TIPO_CLASSIFICACAO,

    -- LOCAL
    CASE WHEN RLC.NOME IS NULL THEN RLC.NOME_FANTASIA ELSE RLC.NOME END AS LOCAL_NOME,
    RE.ID AS ID_ENDERECO,

    CASE WHEN T.ID_LOCAL_CONTRATO IS NOT NULL THEN
             (RE.TIPO_LOGRADOURO || ' ' ||
              RE.ENDERECO || ' ' ||
              RE.NUMERO || ' ' ||
              RE.BAIRRO || ' ' ||
              RE.COMPLEMENTO || ' CEP: ' ||
              RE.CEP || ' ' ||
              RE.CIDADE || ' - ' ||
              RE.UF)
        end as ENDERECO,

    -- QUALIFICACAO
    T.ID_EMPRESA,
    T.ID_LOCAL_CONTRATO,
    T.DATA_VENCIMENTO,
    T.ID_QUALIFICACAO_PARAMETRO_EMPRESA,
    T.INDICADOR,
    T.ID_INDICADOR,
    T.CLASSIFICACAO_OBTIDA,
    T.NOME_RAZAO_SOCIAL,
    T.CPF_CNPJ,
    T.ANALITICO_ID,
    T.ID AS CONSOLIDADO_ID
FROM(
        SELECT
            CONSOLIDADO.ID,
            ANALITICOS.ID AS ANALITICO_ID,
            CONSOLIDADO.ID_EMPRESA,
            CONSOLIDADO.ID_LOCAL_CONTRATO,
            ANALITICOS.DATA_VENCIMENTO,
            PARAMETROS.ID ID_QUALIFICACAO_PARAMETRO_EMPRESA,
            PARAMETROS.INDICADOR,
            PARAMETROS.ID as ID_INDICADOR,
            CONSOLIDADO.CLASSIFICACAO_OBTIDA,
            CASE WHEN RE.NOME IS NULL THEN RE.RAZAO_SOCIAL ELSE RE.NOME END AS NOME_RAZAO_SOCIAL,
            CASE WHEN RE.CNPJ IS NULL THEN RE.CPF ELSE RE.CNPJ END AS CPF_CNPJ

        FROM QUALIFICACOES_EMPRESAS_CONSOLIDADO CONSOLIDADO

                 INNER JOIN REP_EMPRESAS RE ON RE.ID = CONSOLIDADO.ID_EMPRESA

                 INNER JOIN QUALIFICACOES_EMPRESAS_ANALITICOS ANALITICOS ON
                ANALITICOS.ID_QUALIFICACAO_EMPRESA_CONSOLIDADO = CONSOLIDADO.ID

                 INNER JOIN QUALIFICACOES_PARAMETROS_EMPRESAS PARAMETROS ON
                PARAMETROS.ID = ANALITICOS.ID_QUALIFICACAO_PARAMETRO_EMPRESA

        WHERE
                ANALITICOS.DATA_VENCIMENTO <= SYSDATE
    ) T

        LEFT JOIN ( SELECT ID_EMPRESA, CAST(COLLECT(ID_CONTRATO) AS IDS_TYP) AS IDS_CONTRATOS FROM REP_INFO_CONTRATO_EMPRESAS GROUP BY ID_EMPRESA )
    RICE ON  RICE.ID_EMPRESA = T.ID_EMPRESA

        LEFT JOIN (SELECT ID FROM REP_CONTRATOS WHERE SITUACAO_CONTRATO = 'ATIVO')
    RC ON RC.ID IN( (SELECT COLUMN_VALUE ID_ESTUDANTE FROM TABLE(RICE.IDS_CONTRATOS)) )

        LEFT JOIN REP_LOCAIS_CONTRATO RLC ON RLC.ID_CONTRATO = RC.ID AND RLC.ID = T.ID_LOCAL_CONTRATO

        LEFT JOIN REP_LOCAIS_ENDERECOS RLE ON RLE.ID_LOCAL_CONTRATO = RLC.ID

        LEFT JOIN REP_ENDERECOS RE ON RE.ID = RLE.ID_ENDERECO

        LEFT JOIN REP_CONFIGURACAO_CONTRATOS RCC ON RCC.ID = RC.ID

        LEFT JOIN REP_CARTEIRAS RCART ON RCART.ID = RCC.ID_CARTEIRA

        LEFT JOIN REP_UNIDADES_CIEE RU ON RU.ID = RCC.ID_UNIDADE_CIEE

        LEFT JOIN REP_DOMINIOS_UNIT RD ON RD.ID = RU.ID_DOMINIO

        LEFT JOIN REP_ASSISTENTES RA ON RA.ID = RCART.ID_ASSISTENTE

        LEFT JOIN REP_PESSOAS RP ON RP.ID = RA.ID_PESSOA;