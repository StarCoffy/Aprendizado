--
-- Add colunas Formularios preenchimento manual
--
ALTER TABLE FORMULARIOS_ESTUDANTES
    ADD (
        TIPO_PREENCHIMENTO  NUMBER(1),
        PERIODO_INICIO  TIMESTAMP(6),
        PERIODO_FIM  TIMESTAMP(6),
        ESCOLARIDADE_ID NUMBER(20)
        );

ALTER TABLE FORMULARIOS_ESTUDANTES
ADD CONSTRAINT KRS_INDICE_04400 FOREIGN KEY (ESCOLARIDADE_ID)
REFERENCES REP_ESCOLARIDADES_ESTUDANTES(ID);

COMMENT ON COLUMN FORMULARIOS_ESTUDANTES.TIPO_PREENCHIMENTO IS
    'Enum:

0 - Manual
1 - Automático';

