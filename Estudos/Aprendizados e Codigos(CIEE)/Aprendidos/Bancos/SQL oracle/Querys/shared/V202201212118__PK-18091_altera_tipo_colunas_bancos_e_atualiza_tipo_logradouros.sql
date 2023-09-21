ALTER TABLE BANCOS MODIFY BAIRRO VARCHAR2(100 CHAR);
ALTER TABLE BANCOS MODIFY CEP VARCHAR2 (8 CHAR);
ALTER TABLE BANCOS MODIFY CIDADE VARCHAR2 (100 CHAR);
ALTER TABLE BANCOS MODIFY COMPLEMENTO VARCHAR2 (50 CHAR);
ALTER TABLE BANCOS MODIFY ENDERECO VARCHAR2 (150 CHAR);
ALTER TABLE BANCOS MODIFY NOME_BANCO vARCHAR2 (100 CHAR);
ALTER TABLE BANCOS MODIFY NUMERO VARCHAR2 (10 CHAR);
ALTER TABLE BANCOS MODIFY TIPO_LOGRADOURO VARCHAR2 (50 CHAR);
ALTER TABLE BANCOS MODIFY UF VARCHAR2 (2 CHAR);

update bancos set tipo_logradouro = 'Rua' where tipo_logradouro = 'R';

update bancos set tipo_logradouro = 'Avenida' where tipo_logradouro = 'Av';

update bancos set tipo_logradouro = 'Setor' where tipo_logradouro = 'Se';