------ Alterações necessárias para o módulo de URA

-- ========== REP_ESTUDANTES

ALTER TABLE {{user}}.REP_ESTUDANTES
ADD CODIGO_ESTUDANTE VARCHAR2(20) NOT NULL;

ALTER TABLE {{user}}.REP_ESTUDANTES
ADD CONSTRAINT UK_EST_CODIGO UNIQUE (CODIGO_ESTUDANTE);

-- ========== REP_INFO_CONTRATO_EMPRESAS

CREATE TABLE {{user}}.REP_INFO_CONTRATO_EMPRESAS
(
  ID NUMBER,
  ID_EMPRESA NUMBER(20),
  ID_CONTRATO NUMBER(20),
  RAZAO_SOCIAL VARCHAR2(150 char),
  NOME VARCHAR2(150 char),
  CPF VARCHAR2(11 char),
  CNPJ VARCHAR2(14 char),
  SEGMENTO_EMPRESA VARCHAR2(50 char),
  DATA_CRIACAO TIMESTAMP(6) not null,
  DATA_ALTERACAO TIMESTAMP(6) not null,
  CRIADO_POR VARCHAR2(255 char),
  MODIFICADO_POR VARCHAR2(255 char),
  DELETADO NUMBER(1),
  TIPO_EMPRESA VARCHAR2(50 char),
  ATIVO NUMBER(1) default 1
);

ALTER TABLE {{user}}.REP_INFO_CONTRATO_EMPRESAS
  ADD CONSTRAINT KRS_INDICE_01779 PRIMARY KEY (ID);

ALTER TABLE {{user}}.REP_INFO_CONTRATO_EMPRESAS
  ADD CONSTRAINT KRS_INDICE_01770 FOREIGN KEY (ID_CONTRATO) REFERENCES REP_CONTRATOS (ID);

ALTER TABLE {{user}}.REP_INFO_CONTRATO_EMPRESAS
  ADD CONSTRAINT KRS_INDICE_01771 FOREIGN KEY (ID_EMPRESA) REFERENCES REP_EMPRESAS (ID);


--========== REP_IE_ACORDOS_COOPERACAO

ALTER TABLE {{user}}.REP_IE_ACORDOS_COOPERACAO
ADD CONSTRAINT KRS_INDICE_01783 FOREIGN KEY (ID_INSTITUICAO_ENSINO) REFERENCES REP_INSTITUICOES_ENSINOS (ID);