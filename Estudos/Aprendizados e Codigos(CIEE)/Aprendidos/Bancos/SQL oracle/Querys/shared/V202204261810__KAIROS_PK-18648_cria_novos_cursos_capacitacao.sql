insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Arco Administrativo - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Arco Administrativo - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Ocupações Administrativas - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Ocupações Administrativas - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Vendedor - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Vendedor - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Repositor - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Repositor - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Auxiliar de Logística - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Auxiliar de Logística - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Operador de Suporte: Hardware/Software e Redes - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Operador de Suporte: Hardware/Software e Redes - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Assistente Administrativo Rural - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Assistente Administrativo Rural - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Arco Ocupações Agrícolas - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Arco Ocupações Agrícolas - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Abatedor - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Abatedor - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Açougueiro - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Açougueiro - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Atendente de Lanchonete - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Atendente de Lanchonete - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Cozinheiro em Geral - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Cozinheiro em Geral - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Cumim - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Cumim - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Desossador - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Desossador - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Magarefe - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Magarefe - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Mecanização Agrícola (CBO) - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Mecanização Agrícola (CBO) - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Operador de Caixa - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Operador de Caixa - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Auxiliar de Produção - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Auxiliar de Produção - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Retalhador de Carne - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Retalhador de Carne - Economia 4.0');

insert into AREAS_ATUACAO_APRENDIZ (ID,ID_GRUPO_EMPRESA,DESCRICAO_AREA_ATUACAO,NIVEL_AREA_ATUACAO,TIPO_PROGRAMA,IDENTIFICADOR,SITUACAO,DELETADO,DATA_CRIACAO,DATA_ALTERACAO,CRIADO_POR,MODIFICADO_POR,CODIGO_ICONE,ID_LEGADO)
select SEQ_AREAS_ATUACAO_APRENDIZ.nextval, NULL, 'EAD - Operador de Telemarketing - Economia 4.0', 3, 'Aprendiz', 0, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', NULL, NULL
FROM dual
where not exists(SELECT 1 from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Operador de Telemarketing - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 86, 'EAD - Arco Administrativo - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Arco Administrativo - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Arco Administrativo - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 87, 'EAD - Ocupações Administrativas - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Ocupações Administrativas - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Ocupações Administrativas - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 88, 'EAD - Vendedor - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Vendedor - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Vendedor - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 89, 'EAD - Repositor - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Repositor - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Repositor - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 90, 'EAD - Auxiliar de Logística - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Auxiliar de Logística - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Auxiliar de Logística - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 91, 'EAD - Operador de Suporte: Hardware/Software e Redes - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Operador de Suporte: Hardware/Software e Redes - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Operador de Suporte: Hardware/Software e Redes - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 92, 'EAD - Assistente Administrativo Rural - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Assistente Administrativo Rural - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Assistente Administrativo Rural - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 93, 'EAD - Arco Ocupações Agrícolas - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Arco Ocupações Agrícolas - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Arco Ocupações Agrícolas - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 94, 'EAD - Abatedor - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Abatedor - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Abatedor - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 95, 'EAD - Açougueiro - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Açougueiro - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Açougueiro - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 96, 'EAD - Atendente de Lanchonete - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Atendente de Lanchonete - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Atendente de Lanchonete - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 97, 'EAD - Cozinheiro em Geral - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Cozinheiro em Geral - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Cozinheiro em Geral - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 98, 'EAD - Cumim - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Cumim - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Cumim - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 99, 'EAD - Desossador - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Desossador - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Desossador - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 100, 'EAD - Magarefe - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Magarefe - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Magarefe - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 101, 'EAD - Mecanização Agrícola (CBO) - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Mecanização Agrícola (CBO) - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Mecanização Agrícola (CBO) - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 102, 'EAD - Operador de Caixa - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Operador de Caixa - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Operador de Caixa - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 103, 'EAD - Auxiliar de Produção - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Auxiliar de Produção - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Auxiliar de Produção - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 104, 'EAD - Retalhador de Carne - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Retalhador de Carne - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Retalhador de Carne - Economia 4.0');

insert into CURSOS_CAPACITACAO (ID, ID_SECRETARIA, DESCRICAO, MODALIDADE, SITUACAO, DELETADO, DATA_CRIACAO, DATA_ALTERACAO, CRIADO_POR, MODIFICADO_POR, ID_AREA_ATUACAO, ID_LEGADO)
select SEQ_CURSOS_CAPACITACAO.nextval, 105, 'EAD - Operador de Telemarketing - Economia 4.0', 1, 1, 0, SYSDATE, SYSDATE, 'PK-18648', 'PK-18648', (SELECT ID from AREAS_ATUACAO_APRENDIZ where DESCRICAO_AREA_ATUACAO = 'EAD - Operador de Telemarketing - Economia 4.0'), NULL
FROM dual
where not exists(SELECT 1 from CURSOS_CAPACITACAO where descricao = 'EAD - Operador de Telemarketing - Economia 4.0');

