ALTER TABLE REP_UNIDADES_CIEE ADD ID_ENDERECO NUMBER(20) NOT NULL;

ALTER TABLE REP_UNIDADES_CIEE ADD CONSTRAINT KRS_INDICE_03718 FOREIGN KEY
    (ID_ENDERECO) REFERENCES REP_ENDERECOS_ESCOLAS (ID);