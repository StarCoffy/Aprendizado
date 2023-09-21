--*************************************************************************
--PK-14932 - Alteração da view de consulta de vagas aprendiz para trazer Logradouro e número do endereço
--*************************************************************************

CREATE OR REPLACE FORCE VIEW V_VAGAS_APRENDIZ AS
SELECT v.ID,
       CASE WHEN (NVL(V.EMPRESA_COM_ACESSIBILIDADE, 0) = 0) THEN 'NORMAL' ELSE 'PCD' END    AS TIPO,
       v.codigo_da_vaga,
       v.data_criacao,
       s.id                                                                                 as ID_SITUACAO,
       s.sigla,
       s.DESCRICAO,
       T.CARGA_HORARIA_DIARIA,
       TO_CHAR(T.CARGA_HORARIA_DIARIA, 'HH24:MI')                                           as CARGA_HORARIA,
       cc.ID 																				as ID_CURSO,
       cc.DESCRICAO																			as NOME_CURSO,
       RLC.ID                                                                               as ID_LOCAL_CONTRATO,
       RLE.ID                                                                               as ID_LOCAL_ENDERECO,
       RE.iD                                                                                as ID_ENDERECO,
       RE.TIPO_LOGRADOURO || ' ' || RE.ENDERECO || ', ' || RE.NUMERO || ' - ' || RE.BAIRRO || ' - ' || RE.CIDADE || ', ' || RE.UF || ' - ' || (regexp_replace(RE.CEP, '([[:digit:]]{5})([[:digit:]]{3})', '\1-\2')) as ENDERECO,
       v.IDADE_MINIMA,
       v.IDADE_MAXIMA
FROM vagas_aprendiz v
         JOIN situacoes s ON v.id_situacao_vaga = s.id
         JOIN REP_LOCAIS_CONTRATO RLC ON V.ID_LOCAL_CONTRATO = RLC.ID
         JOIN REP_LOCAIS_ENDERECOS RLE ON RLC.ID = RLE.ID_LOCAL_CONTRATO
         JOIN REP_ENDERECOS RE ON RLE.ID_ENDERECO = RE.ID
         JOIN TURMAS T ON T.ID_VAGA_APRENDIZ = V.iD
         JOIN CURSOS_CAPACITACAO CC ON v.id_curso_capacitacao = CC.ID
WHERE
    CC.SITUACAO = 1 AND
    T.TURMA = 0;