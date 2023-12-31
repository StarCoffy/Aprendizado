 CREATE OR REPLACE FORCE EDITIONABLE VIEW "SERVICE_VAGAS_DEV"."V_ESTUDANTE_CONVOCADO_FILTRO" ("CODIGO_VAGA", "NUMERO_CONTRATO", "NUMERO_LOCAL", "NUMERO_VAGAS", "RAZAO_SOCIAL", "CODIGO_UNIDADE", "NOME_UNIDADE", "HORARIO_INICIO", "HORARIO_TERMINO", "PROCESSO_PERSONALIZADO", "DATA_EMAIL", "DATA_SMS", "NUMERO_CARTEIRA", "RESPONSAVEL_CARTEIRA", "DATA_CONVOCACAO", "PRIORIZA_POM", "IDENTIFICA_POM", "ID_ESTUDANTE", "CODIGO_ESTUDANTE", "CODIGO_VINCULO", "NOME_ESTUDANTE", "TELEFONE", "CELULAR", "EMAIL", "DATA_ABERTURA", "DATA_ENVIADO_URA", "ENVIADO_URA", "TIPO_VAGA", "TIPO_DIVULGACAO") AS 
  SELECT distinct UEC."CODIGO_VAGA",UEC."NUMERO_CONTRATO",UEC."NUMERO_LOCAL",UEC."NUMERO_VAGAS",UEC."RAZAO_SOCIAL",UEC."CODIGO_UNIDADE",UEC."NOME_UNIDADE",UEC."HORARIO_INICIO",UEC."HORARIO_TERMINO",UEC."PROCESSO_PERSONALIZADO",UEC."DATA_EMAIL",UEC."DATA_SMS",UEC."NUMERO_CARTEIRA",UEC."RESPONSAVEL_CARTEIRA",UEC."DATA_CONVOCACAO",UEC."PRIORIZA_POM",UEC."IDENTIFICA_POM",UEC."ID_ESTUDANTE",UEC."CODIGO_ESTUDANTE",UEC."CODIGO_VINCULO",UEC."NOME_ESTUDANTE",UEC."TELEFONE",UEC."CELULAR",UEC."EMAIL",UEC."DATA_ABERTURA",UEC."DATA_ENVIADO_URA",UEC."ENVIADO_URA",UEC."TIPO_VAGA",UEC."TIPO_DIVULGACAO"
FROM SERVICE_VAGAS_DEV.V_ESTUDANTE_CONVOCADO UEC
    inner join SERVICE_VAGAS_DEV.ETAPAS_PROCESSO_SELETIVO EPS ON (EPS.ID_VAGA = uec.codigo_vaga)
    inner join SERVICE_VAGAS_DEV.FERRAMENTAS_SELECAO FS ON (EPS.ID_FERRAMENTA_SELECAO = FS.ID AND FS.TIPO_FERRAMENTA_SELECAO IN (0,1,2,4))
    INNER JOIN SERVICE_VAGAS_DEV.AGENDA_PROCESSO_SELETIVO APS ON (APS.ID_ETAPA_PROCESSO_SELETIVO = EPS.ID  AND (APS.DATA + NUMTODSINTERVAL(APS.DURACAO,'MINUTE')) > CURRENT_TIMESTAMP )
    INNER JOIN SERVICE_VAGAS_DEV.REP_ESTUDANTES RE ON (RE.CODIGO_ESTUDANTE = UEC.CODIGO_ESTUDANTE)
    INNER JOIN SERVICE_VAGAS_DEV.REP_ESCOLARIDADES_ESTUDANTES REE ON (REE.ID_ESTUDANTE = RE.ID)
WHERE 
    REE.LONGITUDE_CAMPUS <> 0 AND REE.LATITUDE_CAMPUS <> 0 
    AND UEC.TIPO_DIVULGACAO = 0;
