ALTER TABLE TEMPLATE_UNIDADES_CIEE ADD TIPO_TEMPLATE NUMBER(1,0) NOT NULL;
COMMENT ON COLUMN TEMPLATE_UNIDADES_CIEE.TIPO_TEMPLATE IS 'ENUM: 0 - Estagio 1 - Aprendiz';