ALTER TABLE pre_contratos_cursos_capacitacao DROP CONSTRAINT PRE_CONTRATOS_CURSOS_CAPACITACAO_pre_contratos_estudantes_empresa_FK;

ALTER TABLE pre_contratos_cursos_capacitacao ADD CONSTRAINT krs_indice_02640 FOREIGN KEY ( id_contr_emp_est ) REFERENCES pre_contratos_estudantes_empresa ( id );