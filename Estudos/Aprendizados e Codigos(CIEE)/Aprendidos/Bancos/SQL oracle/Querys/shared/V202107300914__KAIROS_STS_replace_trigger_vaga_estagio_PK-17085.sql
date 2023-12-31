CREATE OR REPLACE TRIGGER TRIGGER_02_VAGAS_ESTAGIO_INSERT_UPDATE
    AFTER INSERT OR UPDATE ON VAGAS_ESTAGIO
    FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    BEGIN
        INSERT INTO FILA_TRIAGEM_VAGA_ESTAGIO (ID, ID_VAGA, DATA_CRIACAO) VALUES (SEQ_FILA_TRIAGEM_VAGA_ESTAGIO_01.NEXTVAL, :NEW.ID, SYSDATE);
        COMMIT;
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
END;