ALTER TABLE QUALIFICACOES_MOTIVOS DROP COLUMN CRIADO_POR;
ALTER TABLE QUALIFICACOES_MOTIVOS DROP COLUMN DATA_CRIACAO;
ALTER TABLE QUALIFICACOES_MOTIVOS DROP COLUMN DATA_ALTERACAO;
ALTER TABLE QUALIFICACOES_MOTIVOS DROP COLUMN MODIFICADO_POR;
ALTER TABLE QUALIFICACOES_MOTIVOS DROP COLUMN DELETADO;

ALTER TABLE QUALIFICACOES_MOTIVOS DROP CONSTRAINT KRS_INDICE_02641;
ALTER TABLE QUALIFICACOES_MOTIVOS DROP COLUMN ID;