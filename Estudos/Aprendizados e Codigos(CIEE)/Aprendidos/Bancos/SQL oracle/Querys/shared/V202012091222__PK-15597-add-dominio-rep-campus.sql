ALTER TABLE REP_CAMPUS ADD ID_DOMINIO NUMBER (19);
ALTER TABLE REP_CAMPUS
    ADD CONSTRAINT KRS_INDICE_1009981 FOREIGN KEY ( ID_DOMINIO )
        REFERENCES REP_DOMINIOS_UNIT ( ID );