ALTER TABLE CONTROLE_COMUNICAO_CSE RENAME TO CONTROLE_COMUNICACAO_CSE;

ALTER TABLE CONTROLE_COMUNICACAO_CSE ADD DATA_CRIACAO             TIMESTAMP(6) not null;
ALTER TABLE CONTROLE_COMUNICACAO_CSE ADD DATA_ALTERACAO           TIMESTAMP(6) not null;
ALTER TABLE CONTROLE_COMUNICACAO_CSE ADD CRIADO_POR               VARCHAR2(255 char);
ALTER TABLE CONTROLE_COMUNICACAO_CSE ADD MODIFICADO_POR           VARCHAR2(255 char);
ALTER TABLE CONTROLE_COMUNICACAO_CSE ADD DELETADO                 NUMBER(1);
