/**
  * catuana.pgsql
  * version 2.0
  * date 10/2022
  * script inicial cricacao banco de dados para o site Catuana - Primeiros Socorros 
 */

/* CREATE SCHEMA */

CREATE SCHEMA CATUANA;

/* CREATE TABLES */

CREATE TABLE USUARIO(
    nome VARCHAR (80) NOT NULL,
    cpf CHAR (11) NOT NULL,
    email VARCHAR (80) NOT NULL,
    celular CHAR(11),
    senha VARCHAR(50) NOT NULL,
    adm BOOLEAN,
    medico BOOLEAN
);

CREATE TABLE POSTAGEM(
    id SERIAL NOT NULL,
    medico CHAR(11) NOT NULL,
    acidente SMALLINT NOT NULL,
    site VARCHAR (200) NOT NULL,
    videoaula VARCHAR (200) NOT NULL,
    descricao VARCHAR (1000) NOT NULL
);

CREATE TABLE ACIDENTE(
    codigo SMALLINT NOT NULL,
    nome VARCHAR (20) NOT NULL,
    descricao VARCHAR (1000) NOT NULL
);

CREATE TABLE NOTICIA(
    id SERIAL NOT NULL,
    titulo VARCHAR (200) NOT NULL,
    data CHAR (10),
    jornal VARCHAR (200) NOT NULL,
    corpo VARCHAR (3000) NOT NULL,
    link VARCHAR (200) NOT NULL,
    usuario CHAR (11) NOT NULL,
    aprovacao BOOLEAN
);

/* ADD CONSTRAINTS */

ALTER TABLE USUARIO
   ADD CONSTRAINT PK_USUARIO PRIMARY KEY (cpf);

ALTER TABLE POSTAGEM 
   ADD CONSTRAINT PK_POSTAGEM PRIMARY KEY (id);

ALTER TABLE ACIDENTE 
   ADD CONSTRAINT PK_ACIDENTE PRIMARY KEY (codigo);

ALTER TABLE NOTICIA 
   ADD CONSTRAINT PK_NOTICIA PRIMARY KEY (id);

ALTER TABLE POSTAGEM
   ADD CONSTRAINT FK_POSTAGEM_USUARIO 
   FOREIGN KEY (medico)
   REFERENCES USUARIO (cpf)
   ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE POSTAGEM
   ADD CONSTRAINT FK_POSTAGEM_ACIDENTE
   FOREIGN KEY (acidente)
   REFERENCES ACIDENTE (codigo)
   ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE NOTICIA
   ADD CONSTRAINT FK_NOTICIA_USUARIO
   FOREIGN KEY (usuario)
   REFERENCES USUARIO (cpf)
   ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE USUARIO
   ADD CONSTRAINT RESTRICOES_USUARIO
   UNIQUE (email, celular);

ALTER TABLE ACIDENTE
   ADD CONSTRAINT RESTRICOES_ACIDENTE
   UNIQUE (nome);

ALTER TABLE NOTICIA
   ADD CONSTRAINT RESTRICOES_NOTICIA
   UNIQUE (titulo);


/* INSERT DATA BASE ACIDENTE */

INSERT INTO ACIDENTE
   VALUES (1, 'AVC', 'O acidente vascular cerebral (AVC) ?? a doen??a que mais mata no Brasil; entretanto, a maioria da popula????o desconhece o assunto e tem d??vidas sobre as principais causas, os sintomas e como prevenir.');

INSERT INTO ACIDENTE
   VALUES (2, 'Choque', 'A passagem de uma alta corrente el??trica pelo corpo de uma pessoa pode provocar consequ??ncias irrevers??veis para a v??tima, podendo causar problemas neurol??gicos, card??acos, queimaduras e, at?? mesmo, a morte.');

INSERT INTO ACIDENTE
   VALUES (3, 'Convulsao', 'A convuls??o pode ser gerada por AVC, problemas no metabolismo, algum trauma forte na cabe??a. Dentre essas princiapis causas, o que se destaca ?? a possibilidade de preven????o e de tratamento imediato, minimizando os poss??veis impactos.');

INSERT INTO ACIDENTE
   VALUES (4, 'Desmaio', 'Idosos s??o mais suscet??veis a desmaios, uma vez que, ao envelhecer, o fluxo sangu??nio diminui, mas esses acontecimentos podem ser sinais para doen??as mais graves. Aprenda a como lidar caso um idoso desmaie perto de voc??.');

INSERT INTO ACIDENTE
   VALUES (5, 'Engasgo', 'Com o processo de envelhecimento, a pessoa fica mais propensa a perder for??a na musculatura respons??vel pela degluti????o, o que pode levar ?? obstru????o das vias a??reas com maior frequ??ncia.');

INSERT INTO ACIDENTE
   VALUES (6, 'Fratura', 'As fraturas em idosos, muitas vezes relacionadas ?? queda, s??o resultados de uma cadeia de acontecimentos no corpo humano dessa pessoa. Por exemplo, a osteoporose que causa o enfraquecimento dos ossos, reduzindo a sua resist??ncia.');

INSERT INTO ACIDENTE
   VALUES (7, 'Infarto', 'O infarto ?? grandemente comum em pessoas de idade mais avan??ada e ocorre devido ?? redu????o do fluxo sangu??neo no cora????o. Alguns fatores de risco, como hipertens??o, diabetes, sedentarismo e obesidade devem ser levados em conta na preven????o.');

INSERT INTO ACIDENTE
   VALUES (8, 'Queda', 'Queda ?? um evento bastante comum com idosos e pode gerar grandes les??es. Entretanto, h?? maneiras de prevenir, bem como estrat??gias para o que realizar caso aconte??a problemas como este, visando a minimizar a quantidade de danos.');

INSERT INTO ACIDENTE
   VALUES (9, 'Queimadura', 'A pele menos el??stica e naturalmente desitratada faz com que as queimaduras sejam mais s??rias para idosos do que para o restante da popula????o, fazendo com que a cicatriza????o seja mais dolorosa, demorada e d??ficil.');

/* INSERT USUARIO ADMs */

INSERT INTO USUARIO
   VALUES ('Bernardo Carlos', '01234567890', 'bernardocarlos@email.com', '31994029124', 'Bernardo123#', true, false);

INSERT INTO USUARIO
   VALUES ('Douglas Galv??o', '12345678900', 'douglasgalvao@email.com', '31992599109', 'Douglas123#', true, false);

INSERT INTO USUARIO
   VALUES ('Gabriel Vargas', '32145678900', 'gabrielvargas@email.com', '31971433879', 'Gabriel123#', true, false);

INSERT INTO USUARIO
   VALUES ('Nilson Deon', '12365478900', 'nilsondeon@email.com', '33998513519', 'Nilsonl123#', true, false);

INSERT INTO USUARIO
   VALUES ('Saulo de Moura', '12345698700', 'saulodemoura@email.com', '31997055660', 'Saulo123#', true, false);

/* INSERT USUARIO MEDICOs */

INSERT INTO USUARIO
   VALUES ('Ana da Silva', '90433404051', 'anadasilva@email.com', '31987654321', 'Ana123#', false, true);

INSERT INTO USUARIO
   VALUES ('Joana Fontes', '84872372077', 'joanafontes@email.com', '31999634985', 'Joana123#', false, true);

INSERT INTO USUARIO
   VALUES ('Carla Almeida', '20871132036', 'carlaalmeida@email.com', '21987532545', 'Carla123#', false, true);

INSERT INTO USUARIO
   VALUES ('Joaquim Pereira', '33975352043', 'joaquimpereira@email.com', '31985822999', 'Joaquim123#', false, true);

INSERT INTO USUARIO
   VALUES ('Tulio Alves', '11590442016', 'tulioalves@email.com', '11961892922', 'Tulio123#', false, true);

INSERT INTO USUARIO
   VALUES ('Giovanne Castro', '50315422092', 'giovannecastro@email.com', '31961892922', 'Giovanne123#', false, true);

INSERT INTO USUARIO
   VALUES ('Pedro Marques', '90811018032', 'pedromarques@email.com', '119852687772', 'Pedro123#', false, true);

INSERT INTO USUARIO
   VALUES ('Sandra Rodrigues', '61690976047', 'sandrarodrigues@email.com', '33933665478', 'Sandra123#', false, true);

/* INSERT USUARIO */

INSERT INTO USUARIO
   VALUES ('Gustavo Maia', '97621289541', 'gustavomaia@email.com', '31986322348', 'Gustavo123#', false, false);

INSERT INTO USUARIO
   VALUES ('Ivan Pereira', '70209876912', 'ivanpereira@email.com', '21933665466', 'Ivan123#', false, false);

INSERT INTO USUARIO
   VALUES ('Rodrigo Santana', '69937751071', 'rodrigosantana@email.com', '11932549622', 'Rodrigo123#', false, false);

INSERT INTO USUARIO
   VALUES ('Amanda Lima', '98398660071', 'amandalima@email.com', '32993978216', 'Amanda123#', false, false);

/* INSERT POSTAGEMs */

INSERT INTO POSTAGEM (medico, acidente, site, videoaula, descricao)
   VALUES ('20871132036', 5, 'https://bit.ly/engasgo_site', 'https://www.youtube.com/embed/tC-OiNlHpcI', 'O v??deo trata sobre como proceder ap??s o engasgo.');

INSERT INTO POSTAGEM (medico, acidente, site, videoaula, descricao)
   VALUES ('11590442016', 7, 'https://bit.ly/infarto_site', 'https://www.youtube.com/embed/xqxHybHpoDY', 'Acesse os links dispon??veis para prevenir e identificar o quadro de infarto.');

INSERT INTO POSTAGEM (medico, acidente, site, videoaula, descricao)
   VALUES ('33975352043', 8, 'https://bit.ly/queda_site', 'https://www.youtube.com/embed/iUE0SaR8Dwo', 'Aprenda como proceder em caso de queda em casa.');

INSERT INTO POSTAGEM (medico, acidente, site, videoaula, descricao)
   VALUES ('84872372077', 2, 'https://bit.ly/choque_site', 'https://www.youtube.com/embed/lXsCD9dTr-E', 'O v??deo trata sobre como proceder ap??s choque el??trico.');

INSERT INTO POSTAGEM (medico, acidente, site, videoaula, descricao)
   VALUES ('90433404051', 3, 'https://bit.ly/convulsao_site', 'https://www.youtube.com/embed/bL9PROpCv9s', 'Os v??deos mostram manobras a serem realizadas em caso de crises convulsivas.');

INSERT INTO POSTAGEM (medico, acidente, site, videoaula, descricao)
   VALUES ('50315422092', 4, 'https://bit.ly/avc_site', 'https://www.youtube.com/embed/nZGdJwuxRiE', 'Aprenda procedimentos para realizar em caso de desmaio.');

INSERT INTO POSTAGEM (medico, acidente, site, videoaula, descricao)
   VALUES ('90433404051', 1, 'https://bit.ly/avc_site', 'https://www.youtube.com/embed/uHkpYIhSWb4', 'Acessando o site, voc?? ter?? informa????es sobre o Acidente Vascular Cerebral (AVC).');

INSERT INTO POSTAGEM (medico, acidente, site, videoaula, descricao)
   VALUES ('11590442016', 6, 'https://bit.ly/fratura_site', 'https://www.youtube.com/embed/66L2rJ9S5nk', 'N??o se desespere! Saiba o que fazer em caso de fratura.');

INSERT INTO POSTAGEM (medico, acidente, site, videoaula, descricao)
   VALUES ('90811018032', 9, 'https://bit.ly/queimadura_site', 'https://www.youtube.com/embed/Eqh54bTu_P0', 'Sabia que n??o se pode passar qualquer produto em queimaduras? Compreenda o porqu??.');

/* INSERT NOTICIA */

INSERT INTO NOTICIA (titulo, data, jornal, corpo, link, usuario, aprovacao)
   VALUES ('Samu orienta 115 moradores de morros em Santos sobre primeiros socorros', '12/05/2022','Prefeitura de Santos','O intuito foi capacitar e aproximar os moradores, principalmente de ??reas de dif??cil acesso para as ambul??ncias. Eles foram orientados sobre como agir nos principais casos de emerg??ncia de sa??de e receberam orienta????es a respeito do funcionamento dos servi??os do Samu.','https://www.santos.sp.gov.br/?q=noticia/samu-orienta-115-moradores-de-morros-em-santos-sobre-primeiros-socorros', '98398660071', true);

INSERT INTO NOTICIA (titulo, data, jornal, corpo, link, usuario, aprovacao)
   VALUES ('Confira 12 itens de primeiros socorros que voc?? deve ter em casa', '16/05/2022', 'Jornal Metr??poles', 'Alguns produtos n??o costumam estar nos kits que as pessoas t??m em casa, mas valem o investimento. Um abaixador de l??ngua, por exemplo, pode ajudar a ver algum objeto na garganta e at?? a imobilizar um dedo da m??o. Outra boa aquisi????o ?? uma bolsa t??rmica, que pode ser usada tanto fria quanto quente e serve para c??licas ou mesmo hematomas ou incha??os por pancadas.', 'https://www.metropoles.com/saude/confira-12-itens-de-primeiros-socorros-que-voce-deve-ter-em-casa','97621289541', true);

INSERT INTO NOTICIA (titulo, data, jornal, corpo, link, usuario, aprovacao)
   VALUES ('iFood e Prefeitura realizam capacita????o em primeiros socorros para entregadores de Salvador', '27/05/2022', 'Jornal Correio', 'A capacita????o ocorreu no Salvador Shopping, no Instituto JCPM de Compromisso Social (Espa??o IJCPM), como parte das a????es de conscientiza????o que marcam o Maio Amarelo.', 'https://www.correio24horas.com.br/noticia/nid/ifood-e-prefeitura-realizam-capacitacao-em-primeiros-socorros-para-entregadores-de-salvador/','69937751071', true);

INSERT INTO NOTICIA (titulo, data, jornal, corpo, link, usuario, aprovacao)
   VALUES ('Crian??a de um ano e meio se engasga com ma???? e ?? salva por policial em Maracana??', '05/06/2022', 'Jornal O Povo', 'Crian??a voltou a respirar ap??s PM aplicar a manobra de Heimlich, t??cnica de primeiros socorros recomendada em casos de obstru????o das vias respirat??rias.', 'https://www.opovo.com.br/noticias/ceara/maracanau/2022/06/05/crianca-de-um-ano-e-meio-se-engasga-com-maca-e-e-salva-por-policial-em-maracanau.html','11590442016', true);

