ALTER TABLE ACOMPANHAMENTOS_FORMULARIOS ADD ID_USUARIO NUMBER(20) NOT NULL;

ALTER TABLE ACOMPANHAMENTOS_FORMULARIOS ADD CONSTRAINT KRS_INDICE_04180 FOREIGN KEY (ID_USUARIO) REFERENCES REP_USUARIOS (ID);