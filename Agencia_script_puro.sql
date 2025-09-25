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
    `nome` varchar(122) NOT NULL,
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
    CONSTRAINT `unique_casaShow_restaurante` UNIQUE (`idTuristico`),
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