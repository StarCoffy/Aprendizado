

COMMENT ON TABLE "SERVICE_VAGAS_DEV"."REP_DADOS_COMPLEMENTARES_COMPANY"  IS 'COMPANY_DEV:SERVICE_COMPANY_DEV:DADOS_COMPLEMENTARES:id';
COMMENT ON TABLE "SERVICE_VAGAS_DEV"."REP_TIPO_MULTIEMPRESA_COMPANY"  IS 'COMPANY_DEV:SERVICE_COMPANY_DEV:TIPO_MULTIEMPRESA:id';
ALTER TABLE SERVICE_VAGAS_DEV.REP_DADOS_COMPLEMENTARES_COMPANY MODIFY (MULTI_EMPRESA NULL);