ALTER TABLE PROVA DROP COLUMN DATA_FINAL;
ALTER TABLE PROVA DROP COLUMN DATA_INICIAL;

ALTER TABLE QUESTOES RENAME COLUMN IMAGEM_QUESTOES TO ID_IMAGEM_QUESTAO;
ALTER TABLE QUESTOES MODIFY ID_IMAGEM_QUESTAO NUMBER(20);

ALTER TABLE RESPOSTAS RENAME COLUMN IMAGEM_QUESTOES TO ID_IMAGEM_RESPOSTA;
ALTER TABLE RESPOSTAS MODIFY ID_IMAGEM_RESPOSTA NUMBER(20);