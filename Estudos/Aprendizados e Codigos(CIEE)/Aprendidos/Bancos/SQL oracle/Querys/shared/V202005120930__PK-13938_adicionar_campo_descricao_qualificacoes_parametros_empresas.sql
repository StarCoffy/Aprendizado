ALTER TABLE QUALIFICACOES_PARAMETROS_EMPRESAS ADD PARAMETRO_DESCRICAO VARCHAR2(200);

UPDATE QUALIFICACOES_PARAMETROS_EMPRESAS
SET PARAMETRO_DESCRICAO = 'Participa das 100 maiores empresas'
WHERE INDICADOR = 'PARTICIPA_100_MAIORES';

UPDATE QUALIFICACOES_PARAMETROS_EMPRESAS
SET PARAMETRO_DESCRICAO = 'Participa das 1000 maiores empresas'
WHERE INDICADOR = 'PARTICIPA_1000_MAIORES';

UPDATE QUALIFICACOES_PARAMETROS_EMPRESAS
SET PARAMETRO_DESCRICAO = 'Empresa internacional'
WHERE INDICADOR = 'MULTINACIONAL';

UPDATE QUALIFICACOES_PARAMETROS_EMPRESAS
SET PARAMETRO_DESCRICAO = 'Possui bolsas acima da média'
WHERE INDICADOR = 'BOLSA_ACIMA_MEDIA';

UPDATE QUALIFICACOES_PARAMETROS_EMPRESAS
SET PARAMETRO_DESCRICAO = 'Empresa de destaque no mercado'
WHERE INDICADOR = 'EMPRESA_DESTAQUE_MERCADO';