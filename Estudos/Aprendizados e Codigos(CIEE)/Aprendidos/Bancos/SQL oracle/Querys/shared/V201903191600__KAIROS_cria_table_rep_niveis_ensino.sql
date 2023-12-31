CREATE TABLE REP_NIVEIS_ENSINO (
  ABREVIATURA VARCHAR2(5 CHAR),
  DESCRICAO VARCHAR2(35 CHAR),
  ORDEM NUMBER(5)
);

ALTER TABLE REP_NIVEIS_ENSINO ADD CONSTRAINT KRS_INDICE_02126 PRIMARY KEY (ABREVIATURA);
ALTER TABLE REP_NIVEIS_ENSINO ADD CONSTRAINT KRS_INDICE_02127 UNIQUE (ORDEM);

INSERT INTO REP_NIVEIS_ENSINO (ABREVIATURA, DESCRICAO, ORDEM) VALUES ('SU', 'Superior', 1);
INSERT INTO REP_NIVEIS_ENSINO (ABREVIATURA, DESCRICAO, ORDEM) VALUES ('TE', 'Técnico', 2);
INSERT INTO REP_NIVEIS_ENSINO (ABREVIATURA, DESCRICAO, ORDEM) VALUES ('EE', 'Educação Especial', 3);
INSERT INTO REP_NIVEIS_ENSINO (ABREVIATURA, DESCRICAO, ORDEM) VALUES ('HB', 'Habilitação Básica', 5);
INSERT INTO REP_NIVEIS_ENSINO (ABREVIATURA, DESCRICAO, ORDEM) VALUES ('EM', 'Ensino Médio', 4);
INSERT INTO REP_NIVEIS_ENSINO (ABREVIATURA, DESCRICAO, ORDEM) VALUES ('EF', 'Ensino Fundamental', 6);