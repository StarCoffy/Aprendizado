-- Create OR drop creste JOB
DECLARE
  JOB_EXISTENTE number := 0;
BEGIN
  Select count(*) into JOB_EXISTENTE
    from ALL_SCHEDULER_JOBS where upper(JOB_NAME) = 'JOB_ATUALIZAR_MV_DADOS_SUPERVISORES_TCES';
    if (JOB_EXISTENTE = 0) then
      execute immediate 'BEGIN
        DBMS_SCHEDULER.CREATE_JOB
        (
        job_name            => ''SERVICE_VAGAS_DEV.JOB_ATUALIZAR_MV_DADOS_SUPERVISORES_TCES'',
        job_type            => ''PLSQL_BLOCK'',
        job_action          => Q''[BEGIN DBMS_MVIEW.REFRESH(''SERVICE_VAGAS_DEV.MV_DADOS_SUPERVISORES_TCES''); END;]'',
        number_of_arguments => 0,
        start_date          => SYSTIMESTAMP,
        repeat_interval     => ''FREQ=HOURLY; BYMINUTE=0'',
        end_date            => NULL,
        enabled             => TRUE,
        auto_drop           => FALSE,
        comments            => ''Refresh MV SERVICE_VAGAS_DEV.MV_DADOS_SUPERVISORES_TCES''
        );
		END;';
    else
    execute immediate 'BEGIN

		dbms_scheduler.drop_job(job_name => ''JOB_ATUALIZAR_MV_DADOS_SUPERVISORES_TCES'');

        DBMS_SCHEDULER.CREATE_JOB
        (
        job_name            => ''SERVICE_VAGAS_DEV.JOB_ATUALIZAR_MV_DADOS_SUPERVISORES_TCES'',
        job_type            => ''PLSQL_BLOCK'',
        job_action          => Q''[BEGIN DBMS_MVIEW.REFRESH(''SERVICE_VAGAS_DEV.MV_DADOS_SUPERVISORES_TCES''); END;]'',
        number_of_arguments => 0,
        start_date          => SYSTIMESTAMP,
        repeat_interval     => ''FREQ=HOURLY; BYMINUTE=0'',
        end_date            => NULL,
        enabled             => TRUE,
        auto_drop           => FALSE,
        comments            => ''Refresh MV SERVICE_VAGAS_DEV.MV_DADOS_SUPERVISORES_TCES''
        );
		END;';
  end if;
end;

