-- Criacao do BD AgenciaTurismo 

DROP SCHEMA `AgenciaTurismo`;
-- Criando o banco AgenciaTurismo
CREATE SCHEMA IF NOT EXISTS `AgenciaTurismo` DEFAULT CHARACTER SET utf8;
-- Criando tabela Cidade
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`Cidade`(
    `idCidade` int NOT NULL AUTO_INCREMENT,
    `nome` varchar(122) NOT NULL,
    `estado` char(2) NOT NULL,
    `populacao`int NOT NULL,
    PRIMARY KEY(`idCidade`))
    ENGINE = INNODB;
-- Criando tabela hotel
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`Hotel`(
    `idHotel` int NOT NULL AUTO_INCREMENT,
    `nome` varchar(122) NOT NULL,
    `categoria` tinyint NOT NULL,
    `tipoQuarto` varchar(44) NOT NULL,
    `numeroQuartos` int NOT NULL,
    `valorDiaria` decimal(10, 2) NOT NULL,
    `restaurante` int NOT NULL,
    `endereco` int NOT NULL,
    PRIMARY KEY(`idHotel`))
    ENGINE = INNODB;
-- Criando tabela Restaurante
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`Restaurante`(
    `idRestaurante` int NOT NULL AUTO_INCREMENT,
    `nome` varchar(122) NOT NULL,
    `categoria` varchar(44) NOT NULL,
    `endereco` int NOT NULL,
    PRIMARY KEY(`idRestaurante`))
    ENGINE = INNODB;
-- adicionando chave estrangeira restaurante a tabela Hotel
ALTER TABLE `AgenciaTurismo`.`Hotel`
ADD CONSTRAINT `FK_hotel_restaurante`
	FOREIGN KEY (`restaurante`)
    REFERENCES `AgenciaTurismo`.`Restaurante`(`idRestaurante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

-- criando tabela PontoTuristico
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`PontoTuristico`(
    `idTuristico` int NOT NULL AUTO_INCREMENT,
    `descricao` varchar(244) NOT NULL,
    `endereco` int NOT NULL,
    PRIMARY KEY (`idTuristico`))
    ENGINE = INNODB;

-- Criando tabelas de enderecos
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`Endereco`(
    `idEndereco` int NOT NULL AUTO_INCREMENT,
    `rua` varchar(44) NOT NULL,
    `bairro` varchar(100) NOT NULL,
    `numero` varchar(10),
    `cep` varchar(15),
    `cidade` int NOT NULL,
    PRIMARY KEY(`idEndereco`),
    CONSTRAINT `fk_endereco_cidade` 
    	FOREIGN KEY (`cidade`)
    	REFERENCES `AgenciaTurismo`.`Cidade`(`idCidade`)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION)
        ENGINE = INNODB;
-- Adicionando referencia à tabela endereco
ALTER TABLE `AgenciaTurismo`.`Hotel`
	ADD CONSTRAINT `fk_endereco_hotel`
    	FOREIGN KEY(`endereco`)
        REFERENCES `AgenciaTurismo`.`Endereco`(`idEndereco`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;
ALTER TABLE `AgenciaTurismo`.`Restaurante`
	ADD CONSTRAINT `fk_endereco_restaurante`
    	FOREIGN KEY(`endereco`)
        REFERENCES `AgenciaTurismo`.`Endereco`(`idEndereco`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;
ALTER TABLE `AgenciaTurismo`.`PontoTuristico`
	ADD CONSTRAINT `fk_endereco_pontoTuristico`
    	FOREIGN KEY(`endereco`)
        REFERENCES `AgenciaTurismo`.`Endereco`(`idEndereco`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;
        
-- Criando especializacoes de PontoTuristico
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`Igreja`(
    `idTuristico` int NOT NULL,
    `dataConstrucao` date NOT NULL,
    `estiloConstrucao` varchar(44) NOT NULL,
    PRIMARY KEY(`idTuristico`),
    CONSTRAINT `fk_especializacao_igreja_pontoTuristico`
    	FOREIGN KEY (`idTuristico`)
    	REFERENCES `AgenciaTurismo`.`PontoTuristico`(`idTuristico`))
        ENGINE = INNODB;
        
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`CasaShow`(
    `idTuristico` int NOT NULL,
    `horarioInicio` time NOT NULL,
    `diaFechamento` varchar(12) NOT NULL,
    PRIMARY KEY (`idTuristico`),
    CONSTRAINT `fk_especializacao_casaShow_pontoTuristico`
    	FOREIGN KEY (`idTuristico`)
    	REFERENCES `AgenciaTurismo`.`PontoTuristico`(`idTuristico`))
    	ENGINE = INNODB;
        
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`Museu`(
    `idTuristico` int NOT NULL,
    `dataFundacao` date NOT NULL,
    `numeroSalas` int NOT NULL,
    PRIMARY KEY(`idTuristico`),
    CONSTRAINT `fk_especializacao_museu_pontoTuristico`
    	FOREIGN KEY (`idTuristico`)
    	REFERENCES `AgenciaTurismo`.`PontoTuristico`(`idTuristico`))
        ENGINE = INNODB;

-- criando tabela CasaShow_possui_restaurante
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`CasaShow_possui_restaurante`(
    `idTuristico` int NOT NULL,
    `idRestaurante` int NOT NULL,
    `precoMedio` decimal(10, 2) NOT NULL,
    `especialidade` varchar(44) NOT NULL,
    PRIMARY KEY(`idTuristico`,`idRestaurante`),
    CONSTRAINT `fk_casaShow_possui`
    	FOREIGN KEY(`idTuristico`)
    	REFERENCES `AgenciaTurismo`.`CasaShow`(`idTuristico`),
    CONSTRAINT `fk_possui_restaurante`
    	FOREIGN KEY(`idRestaurante`)
    	REFERENCES `AgenciaTurismo`.`Restaurante`(`idRestaurante`))
        ENGINE = INNODB;

-- criando tabela Fundadores
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`Fundador`(
    `idFundador` int NOT NULL AUTO_INCREMENT,
    `nome` varchar(122) NOT NULL,
    `dataNascimento` date,
    `atvProfissional` varchar(44) NOT NULL,
    PRIMARY KEY(`idFundador`))
    ENGINE = INNODB;

-- criando a tabela relacao museu_fundador
CREATE TABLE IF NOT EXISTS `AgenciaTurismo`.`Museu_fundador`(
    `idMuseu` int NOT NULL,
    `idFundador` int NOT NULL,
    PRIMARY KEY(`idMuseu`, `idFundador`),
	CONSTRAINT `fk_id_museu`
    	FOREIGN KEY(`idMuseu`)
    	REFERENCES `AgenciaTurismo`.`Museu`(`idTuristico`),
    CONSTRAINT `fk_id_Fundador`
    	FOREIGN KEY(`idFundador`)
    	REFERENCES `AgenciaTurismo`.`Fundador`(`idFundador`))
    ENGINE = INNODB;


-- Atencao: dados de insercao de dados foram criados usando IA  
-- Prompt: comandosCriacao + quero popular meu banco com dados fictícios, 5 tuplas em cada tabela. Uma observação é que no campo 'categoria' de 'Hotel' pode ser preenchido do 1 ao 5(representando as categorias de um hotel-1 estrela, 2 estrelas...5 estrelas).    =======================================================================
-- SCRIPT DE INSERÇÃO DE DADOS FICTÍCIOS PARA AGENCIA DE TURISMO
-- Autor: PROGRAMACAO (Assistente IA)
-- Data: 23/09/2025
-- =======================================================================

-- 1. Inserindo 5 Cidades
-- (Tabela base, sem dependências)
INSERT INTO `AgenciaTurismo`.`Cidade` (`nome`, `estado`, `populacao`) VALUES
('Campo Grande', 'MS', 916001),
('Rio de Janeiro', 'RJ', 6775561),
('Salvador', 'BA', 2900319),
('Gramado', 'RS', 36864),
('Manaus', 'AM', 2255903);

-- 2. Inserindo 5 Fundadores de Museus
-- (Tabela independente)
INSERT INTO `AgenciaTurismo`.`Fundador` (`nome`, `dataNascimento`, `atvProfissional`) VALUES
('João Silva', '1950-05-15', 'Historiador'),
('Maria Oliveira', '1962-11-21', 'Artista Plástica'),
('Carlos Pereira', '1945-01-30', 'Antropólogo'),
('Ana Souza', '1970-08-10', 'Filantropa'),
('Pedro Costa', '1981-03-25', 'Arquiteto');

-- 3. Inserindo Endereços
-- (Depende de Cidade)
-- Vamos criar 15 endereços para distribuir entre hotéis, restaurantes e pontos turísticos.
INSERT INTO `AgenciaTurismo`.`Endereco` (`rua`, `bairro`, `numero`, `cep`, `cidade`) VALUES
-- Endereços para Restaurantes (IDs 1-5)
('Rua das Garças', 'Centro', 100, '79002-123', 1), -- Campo Grande
('Av. Atlântica', 'Copacabana', 2000, '22070-001', 2), -- Rio de Janeiro
('Largo do Pelourinho', 'Pelourinho', 30, '40026-280', 3), -- Salvador
('Av. Borges de Medeiros', 'Planalto', 2500, '95670-000', 4), -- Gramado
('Estrada da Ponta Negra', 'Ponta Negra', 500, '69037-000', 5), -- Manaus
-- Endereços para Hotéis (IDs 6-10)
('Av. Afonso Pena', 'Centro', 4000, '79020-001', 1), -- Campo Grande
('Rua Barata Ribeiro', 'Copacabana', 500, '22040-002', 2), -- Rio de Janeiro
('Rua da Paciência', 'Rio Vermelho', 150, '41950-010', 3), -- Salvador
('Rua Coberta', 'Centro', 10, '95670-000', 4), -- Gramado
('Av. Coronel Teixeira', 'Ponta Negra', 1320, '69037-000', 5), -- Manaus
-- Endereços para Pontos Turísticos (IDs 11-15)
('Parque das Nações Indígenas', 'Chácara Cachoeira', NULL, '79031-970', 1), -- Campo Grande (Igreja Fictícia)
('Rua México', 'Centro', 123, '20031-144', 2), -- Rio de Janeiro (Museu)
('Praça da Sé', 'Centro Histórico', 1, '40020-210', 3), -- Salvador (Casa de Show Fictícia)
('Av. das Hortênsias', 'Vila Suíça', 450, '95670-000', 4), -- Gramado (Outro Museu)
('Largo de São Sebastião', 'Centro', NULL, '69010-150', 5); -- Manaus (Outra Igreja)

-- 4. Inserindo 5 Restaurantes
-- (Depende de Endereco)
INSERT INTO `AgenciaTurismo`.`Restaurante` (`nome`, `categoria`, `endereco`) VALUES
('Churrascaria do Pantanal', 'Churrasco', 1),
('Acarajé da Dinha', 'Baiana', 3),
('Botequim Carioca', 'Brasileira', 2),
('Le Petit Fondue', 'Europeia', 4),
('Tambaqui de Banda', 'Regional', 5);

-- 5. Inserindo 5 Hotéis
-- (Depende de Endereco e Restaurante)
-- Note que o campo 'categoria' vai de 1 a 5, como solicitado.
INSERT INTO `AgenciaTurismo`.`Hotel` (`nome`, `categoria`, `tipoQuarto`, `numeroQuartos`, `valorDiaria`, `restaurante`, `endereco`) VALUES
('Hotel Palace CG', 5, 'Suíte Presidencial', 150, 850.00, 1, 6),
('Copacabana Star Hotel', 4, 'Luxo Vista Mar', 200, 700.50, 3, 7),
('Pousada do Carmo', 3, 'Standard Casal', 50, 320.00, 2, 8),
('Chalés da Montanha', 4, 'Chalé Família', 40, 550.75, 4, 9),
('Amazon Jungle Resort', 5, 'Bangalô na Selva', 80, 1200.00, 5, 10);

-- 6. Inserindo 5 Pontos Turísticos (genéricos)
-- (Depende de Endereco)
INSERT INTO `AgenciaTurismo`.`PontoTuristico` (`descricao`, `endereco`) VALUES
('Igreja de São Francisco do Pantanal', 11),
('Museu Nacional de Belas Artes', 12),
('Show Folclórico Raízes da Bahia', 13),
('Museu de Cera de Gramado', 14),
('Catedral Metropolitana de Manaus', 15);

-- 7. Inserindo as Especializações dos Pontos Turísticos
-- (Depende de PontoTuristico)
-- Usaremos os IDs 1 a 5 criados acima.
INSERT INTO `AgenciaTurismo`.`Igreja` (`idTuristico`, `dataConstrucao`, `estiloConstrucao`) VALUES
(1, '1980-10-22', 'Modernista'),
(5, '1877-08-15', 'Neoclássico');

INSERT INTO `AgenciaTurismo`.`Museu` (`idTuristico`, `dataFundacao`, `numeroSalas`) VALUES
(2, '1937-01-16', 40),
(4, '2009-12-05', 25);

INSERT INTO `AgenciaTurismo`.`CasaShow` (`idTuristico`, `horarioInicio`, `diaFechamento`) VALUES
(3, '20:00:00', 'Domingo');

-- 8. Inserindo 5 relações na tabela Museu_fundador
-- (Depende de Museu e Fundador)
INSERT INTO `AgenciaTurismo`.`Museu_fundador` (`idMuseu`, `idFundador`) VALUES
(2, 1), -- Museu (ID 2) foi fundado por Fundador (ID 1)
(2, 2), -- Museu (ID 2) também por Fundador (ID 2)
(4, 3), -- Museu (ID 4) por Fundador (ID 3)
(4, 4),
(4, 5);

-- 9. Inserindo 5 relações na tabela CasaShow_possui_restaurante
-- (Depende de CasaShow e Restaurante)
INSERT INTO `AgenciaTurismo`.`CasaShow_possui_restaurante` (`idTuristico`, `idRestaurante`, `precoMedio`, `especialidade`) VALUES
(3, 1, 150.00, 'Rodízio de Carnes'),
(3, 2, 80.00, 'Moqueca e Acarajé'),
(3, 3, 95.50, 'Feijoada e Petiscos'),
(3, 4, 250.00, 'Sequência de Fondue'),
(3, 5, 120.00, 'Peixes da Amazônia');

– Insercao manual
INSERT INTO `AgenciaTurismo`.`Restaurante` (`nome`, `categoria`, `endereco`) VALUES
('BomBoi', 'Churrasco', 1);
INSERT INTO `AgenciaTurismo`.`Hotel` (`nome`, `categoria`, `tipoQuarto`, `numeroQuartos`, `valorDiaria`, `restaurante`, `endereco`) VALUES
('Vagalume Silencioso', '4', 'Luxo premium', '32', '500','6', '1');

-- =======================================================================
-- FIM DO SCRIPT DE INSERÇÃO
-- =======================================================================


-- Listar todas as cidades com populacao maior que 500.000
SELECT `nome`FROM `AgenciaTurismo`.`Cidade` WHERE `populacao` > 500.000;
-- Listar hoteis de luxo (categoria = 5) em ordem alfabetica
SELECT `nome` FROM `AgenciaTurismo`.`Hotel` WHERE `categoria` = 5 ORDER BY `nome` ASC;
-- Listar todos os hoteis junto com o nome da cidade onde estão localizados
SELECT h.nome AS nomeHotel, c.nome AS nomeCidade
FROM`AgenciaTurismo`.`Hotel` AS h
JOIN `AgenciaTurismo`.`Endereco` AS e ON h.endereco = e.idEndereco
JOIN `AgenciaTurismo`.`Cidade` AS c ON e.cidade = c.idCidade;
-- contar quantos hoteis existem em cada cidade
SELECT COUNT(h.`idHotel`) AS qtsHoteis, c.`nome` AS nomeCidade
FROM `AgenciaTurismo`.`Hotel`AS h
JOIN `AgenciaTurismo`.`Endereco` AS e ON h.`endereco` = e.`idEndereco`
JOIN `AgenciaTurismo`.`Cidade` AS c ON c.`idCidade`= e.`cidade`
GROUP BY c.`nome`;
