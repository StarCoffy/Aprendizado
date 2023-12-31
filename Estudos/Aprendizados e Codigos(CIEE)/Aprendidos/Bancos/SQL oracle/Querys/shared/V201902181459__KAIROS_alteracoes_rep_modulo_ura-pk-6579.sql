------ Alterações necessárias para o módulo de URA

-- ========== REP_MOTIVOS_BLOQUEIO

create table {{user}}.REP_MOTIVOS_BLOQUEIO
(
	ID NUMBER(20),
	DESCRICAO_EXTERNA VARCHAR2(80) not null,
	ATIVO NUMBER(1) not null,
	DATA_CRIACAO TIMESTAMP(6) not null,
	DATA_ALTERACAO TIMESTAMP(6) not null,
	CRIADO_POR VARCHAR2(255),
	MODIFICADO_POR VARCHAR2(255),
	DELETADO NUMBER(1)
);

ALTER TABLE {{user}}.REP_MOTIVOS_BLOQUEIO
  ADD CONSTRAINT KRS_INDICE_01803 PRIMARY KEY (ID);

-- ========== REP_ESTUDANTES_MOTIVOS_BLOQUEIOS

create table {{user}}.REP_ESTUDANTES_MTV_BLOQUEIOS
(
	ID NUMBER(20),
	ID_ESTUDANTE NUMBER,
	ID_MOTIVO_BLOQUEIO NUMBER,
	DATA_CRIACAO TIMESTAMP(6) not null,
	DATA_ALTERACAO TIMESTAMP(6) not null,
	CRIADO_POR VARCHAR2(255),
	MODIFICADO_POR VARCHAR2(255),
	DELETADO NUMBER(1)
);

ALTER TABLE {{user}}.REP_ESTUDANTES_MTV_BLOQUEIOS
  ADD CONSTRAINT KRS_INDICE_01804 PRIMARY KEY (ID);

ALTER TABLE {{user}}.REP_ESTUDANTES_MTV_BLOQUEIOS
  ADD CONSTRAINT KRS_INDICE_01805 FOREIGN KEY (ID_ESTUDANTE) REFERENCES REP_ESTUDANTES (ID);

ALTER TABLE {{user}}.REP_ESTUDANTES_MTV_BLOQUEIOS
  ADD CONSTRAINT KRS_INDICE_01806 FOREIGN KEY (ID_MOTIVO_BLOQUEIO) REFERENCES REP_MOTIVOS_BLOQUEIO (ID);
