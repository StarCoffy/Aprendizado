ALTER TABLE REP_LOCAIS_ENDERECOS
ADD ID_UNIDADE_CIEE_LOCAL NUMBER;

ALTER TABLE REP_LOCAIS_ENDERECOS
ADD ID_CARTEIRA_LOCAL NUMBER;

ALTER TABLE REP_LOCAIS_ENDERECOS
ADD FOREIGN KEY (ID_UNIDADE_CIEE_LOCAL) REFERENCES REP_UNIDADES_CIEE(ID);