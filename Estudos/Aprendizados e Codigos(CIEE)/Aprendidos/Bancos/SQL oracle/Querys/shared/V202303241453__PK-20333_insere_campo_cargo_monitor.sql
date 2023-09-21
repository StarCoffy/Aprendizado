INSERT INTO CAMPOS
(ID, CAMPO, TIPO_CONTRATO, CRIADO_POR, DATA_CRIACAO, DATA_ALTERACAO, MODIFICADO_POR, DELETADO)
select (SELECT max(id)+1 from campos),'Cargo do monitor',1,'PK-20333',current_timestamp,current_timestamp,'PK-20333',0 FROM DUAL
WHERE NOT EXISTS(SELECT 1 FROM CAMPOS WHERE CAMPO = 'Cargo do monitor' AND TIPO_CONTRATO = 1);
