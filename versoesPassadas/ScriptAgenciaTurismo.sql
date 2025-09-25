-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Sep 23, 2025 at 11:50 PM
-- Server version: 9.4.0
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `AgenciaTurismo`
--

-- --------------------------------------------------------

--
-- Table structure for table `CasaShow`
--

CREATE TABLE `CasaShow` (
  `idTuristico` int NOT NULL,
  `horarioInicio` time NOT NULL,
  `diaFechamento` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `CasaShow`
--

INSERT INTO `CasaShow` (`idTuristico`, `horarioInicio`, `diaFechamento`) VALUES
(3, '20:00:00', 'Domingo');

-- --------------------------------------------------------

--
-- Table structure for table `CasaShow_possui_restaurante`
--

CREATE TABLE `CasaShow_possui_restaurante` (
  `idTuristico` int NOT NULL,
  `idRestaurante` int NOT NULL,
  `precoMedio` decimal(10,2) NOT NULL,
  `especialidade` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `CasaShow_possui_restaurante`
--

INSERT INTO `CasaShow_possui_restaurante` (`idTuristico`, `idRestaurante`, `precoMedio`, `especialidade`) VALUES
(3, 1, 150.00, 'Rodízio de Carnes'),
(3, 2, 80.00, 'Moqueca e Acarajé'),
(3, 3, 95.50, 'Feijoada e Petiscos'),
(3, 4, 250.00, 'Sequência de Fondue'),
(3, 5, 120.00, 'Peixes da Amazônia');

-- --------------------------------------------------------

--
-- Table structure for table `Cidade`
--

CREATE TABLE `Cidade` (
  `idCidade` int NOT NULL,
  `nome` varchar(122) NOT NULL,
  `estado` char(2) NOT NULL,
  `populacao` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Cidade`
--

INSERT INTO `Cidade` (`idCidade`, `nome`, `estado`, `populacao`) VALUES
(1, 'Campo Grande', 'MS', 916001),
(2, 'Rio de Janeiro', 'RJ', 6775561),
(3, 'Salvador', 'BA', 2900319),
(4, 'Gramado', 'RS', 36864),
(5, 'Manaus', 'AM', 2255903);

-- --------------------------------------------------------

--
-- Table structure for table `Endereco`
--

CREATE TABLE `Endereco` (
  `idEndereco` int NOT NULL,
  `rua` varchar(44) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `cidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Endereco`
--

INSERT INTO `Endereco` (`idEndereco`, `rua`, `bairro`, `numero`, `cep`, `cidade`) VALUES
(1, 'Rua das Garças', 'Centro', '100', '79002-123', 1),
(2, 'Av. Atlântica', 'Copacabana', '2000', '22070-001', 2),
(3, 'Largo do Pelourinho', 'Pelourinho', '30', '40026-280', 3),
(4, 'Av. Borges de Medeiros', 'Planalto', '2500', '95670-000', 4),
(5, 'Estrada da Ponta Negra', 'Ponta Negra', '500', '69037-000', 5),
(6, 'Av. Afonso Pena', 'Centro', '4000', '79020-001', 1),
(7, 'Rua Barata Ribeiro', 'Copacabana', '500', '22040-002', 2),
(8, 'Rua da Paciência', 'Rio Vermelho', '150', '41950-010', 3),
(9, 'Rua Coberta', 'Centro', '10', '95670-000', 4),
(10, 'Av. Coronel Teixeira', 'Ponta Negra', '1320', '69037-000', 5),
(11, 'Parque das Nações Indígenas', 'Chácara Cachoeira', NULL, '79031-970', 1),
(12, 'Rua México', 'Centro', '123', '20031-144', 2),
(13, 'Praça da Sé', 'Centro Histórico', '1', '40020-210', 3),
(14, 'Av. das Hortênsias', 'Vila Suíça', '450', '95670-000', 4),
(15, 'Largo de São Sebastião', 'Centro', NULL, '69010-150', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Fundador`
--

CREATE TABLE `Fundador` (
  `idFundador` int NOT NULL,
  `nome` varchar(122) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `atvProfissional` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Fundador`
--

INSERT INTO `Fundador` (`idFundador`, `nome`, `dataNascimento`, `atvProfissional`) VALUES
(1, 'João Silva', '1950-05-15', 'Historiador'),
(2, 'Maria Oliveira', '1962-11-21', 'Artista Plástica'),
(3, 'Carlos Pereira', '1945-01-30', 'Antropólogo'),
(4, 'Ana Souza', '1970-08-10', 'Filantropa'),
(5, 'Pedro Costa', '1981-03-25', 'Arquiteto');

-- --------------------------------------------------------

--
-- Table structure for table `Hotel`
--

CREATE TABLE `Hotel` (
  `idHotel` int NOT NULL,
  `nome` varchar(122) NOT NULL,
  `categoria` tinyint NOT NULL,
  `tipoQuarto` varchar(44) NOT NULL,
  `numeroQuartos` int NOT NULL,
  `valorDiaria` decimal(10,2) NOT NULL,
  `restaurante` int NOT NULL,
  `endereco` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Hotel`
--

INSERT INTO `Hotel` (`idHotel`, `nome`, `categoria`, `tipoQuarto`, `numeroQuartos`, `valorDiaria`, `restaurante`, `endereco`) VALUES
(1, 'Hotel Palace CG', 5, 'Suíte Presidencial', 150, 850.00, 1, 6),
(2, 'Copacabana Star Hotel', 4, 'Luxo Vista Mar', 200, 700.50, 3, 7),
(3, 'Pousada do Carmo', 3, 'Standard Casal', 50, 320.00, 2, 8),
(4, 'Chalés da Montanha', 4, 'Chalé Família', 40, 550.75, 4, 9),
(5, 'Amazon Jungle Resort', 5, 'Bangalô na Selva', 80, 1200.00, 5, 10),
(6, 'Vagalume Silencioso', 4, 'Luxo premium', 32, 500.00, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Igreja`
--

CREATE TABLE `Igreja` (
  `idTuristico` int NOT NULL,
  `dataConstrucao` date NOT NULL,
  `estiloConstrucao` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Igreja`
--

INSERT INTO `Igreja` (`idTuristico`, `dataConstrucao`, `estiloConstrucao`) VALUES
(1, '1980-10-22', 'Modernista'),
(5, '1877-08-15', 'Neoclássico');

-- --------------------------------------------------------

--
-- Table structure for table `Museu`
--

CREATE TABLE `Museu` (
  `idTuristico` int NOT NULL,
  `dataFundacao` date NOT NULL,
  `numeroSalas` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Museu`
--

INSERT INTO `Museu` (`idTuristico`, `dataFundacao`, `numeroSalas`) VALUES
(2, '1937-01-16', 40),
(4, '2009-12-05', 25);

-- --------------------------------------------------------

--
-- Table structure for table `Museu_fundador`
--

CREATE TABLE `Museu_fundador` (
  `idMuseu` int NOT NULL,
  `idFundador` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Museu_fundador`
--

INSERT INTO `Museu_fundador` (`idMuseu`, `idFundador`) VALUES
(2, 1),
(2, 2),
(4, 3),
(4, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `PontoTuristico`
--

CREATE TABLE `PontoTuristico` (
  `idTuristico` int NOT NULL,
  `descricao` varchar(244) NOT NULL,
  `endereco` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `PontoTuristico`
--

INSERT INTO `PontoTuristico` (`idTuristico`, `descricao`, `endereco`) VALUES
(1, 'Igreja de São Francisco do Pantanal', 11),
(2, 'Museu Nacional de Belas Artes', 12),
(3, 'Show Folclórico Raízes da Bahia', 13),
(4, 'Museu de Cera de Gramado', 14),
(5, 'Catedral Metropolitana de Manaus', 15);

-- --------------------------------------------------------

--
-- Table structure for table `Restaurante`
--

CREATE TABLE `Restaurante` (
  `idRestaurante` int NOT NULL,
  `nome` varchar(122) NOT NULL,
  `categoria` varchar(44) NOT NULL,
  `endereco` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `Restaurante`
--

INSERT INTO `Restaurante` (`idRestaurante`, `nome`, `categoria`, `endereco`) VALUES
(1, 'Churrascaria do Pantanal', 'Churrasco', 1),
(2, 'Acarajé da Dinha', 'Baiana', 3),
(3, 'Botequim Carioca', 'Brasileira', 2),
(4, 'Le Petit Fondue', 'Europeia', 4),
(5, 'Tambaqui de Banda', 'Regional', 5),
(6, 'BomBoi', 'Churrasco', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CasaShow`
--
ALTER TABLE `CasaShow`
  ADD PRIMARY KEY (`idTuristico`);

--
-- Indexes for table `CasaShow_possui_restaurante`
--
ALTER TABLE `CasaShow_possui_restaurante`
  ADD PRIMARY KEY (`idTuristico`,`idRestaurante`),
  ADD KEY `fk_possui_restaurante` (`idRestaurante`);

--
-- Indexes for table `Cidade`
--
ALTER TABLE `Cidade`
  ADD PRIMARY KEY (`idCidade`);

--
-- Indexes for table `Endereco`
--
ALTER TABLE `Endereco`
  ADD PRIMARY KEY (`idEndereco`),
  ADD KEY `fk_endereco_cidade` (`cidade`);

--
-- Indexes for table `Fundador`
--
ALTER TABLE `Fundador`
  ADD PRIMARY KEY (`idFundador`);

--
-- Indexes for table `Hotel`
--
ALTER TABLE `Hotel`
  ADD PRIMARY KEY (`idHotel`),
  ADD KEY `FK_hotel_restaurante` (`restaurante`),
  ADD KEY `fk_endereco_hotel` (`endereco`);

--
-- Indexes for table `Igreja`
--
ALTER TABLE `Igreja`
  ADD PRIMARY KEY (`idTuristico`);

--
-- Indexes for table `Museu`
--
ALTER TABLE `Museu`
  ADD PRIMARY KEY (`idTuristico`);

--
-- Indexes for table `Museu_fundador`
--
ALTER TABLE `Museu_fundador`
  ADD PRIMARY KEY (`idMuseu`,`idFundador`),
  ADD KEY `fk_id_Fundador` (`idFundador`);

--
-- Indexes for table `PontoTuristico`
--
ALTER TABLE `PontoTuristico`
  ADD PRIMARY KEY (`idTuristico`),
  ADD KEY `fk_endereco_pontoTuristico` (`endereco`);

--
-- Indexes for table `Restaurante`
--
ALTER TABLE `Restaurante`
  ADD PRIMARY KEY (`idRestaurante`),
  ADD KEY `fk_endereco_restaurante` (`endereco`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cidade`
--
ALTER TABLE `Cidade`
  MODIFY `idCidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Endereco`
--
ALTER TABLE `Endereco`
  MODIFY `idEndereco` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Fundador`
--
ALTER TABLE `Fundador`
  MODIFY `idFundador` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Hotel`
--
ALTER TABLE `Hotel`
  MODIFY `idHotel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `PontoTuristico`
--
ALTER TABLE `PontoTuristico`
  MODIFY `idTuristico` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Restaurante`
--
ALTER TABLE `Restaurante`
  MODIFY `idRestaurante` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CasaShow`
--
ALTER TABLE `CasaShow`
  ADD CONSTRAINT `fk_especializacao_casaShow_pontoTuristico` FOREIGN KEY (`idTuristico`) REFERENCES `PontoTuristico` (`idTuristico`);

--
-- Constraints for table `CasaShow_possui_restaurante`
--
ALTER TABLE `CasaShow_possui_restaurante`
  ADD CONSTRAINT `fk_casaShow_possui` FOREIGN KEY (`idTuristico`) REFERENCES `CasaShow` (`idTuristico`),
  ADD CONSTRAINT `fk_possui_restaurante` FOREIGN KEY (`idRestaurante`) REFERENCES `Restaurante` (`idRestaurante`);

--
-- Constraints for table `Endereco`
--
ALTER TABLE `Endereco`
  ADD CONSTRAINT `fk_endereco_cidade` FOREIGN KEY (`cidade`) REFERENCES `Cidade` (`idCidade`);

--
-- Constraints for table `Hotel`
--
ALTER TABLE `Hotel`
  ADD CONSTRAINT `fk_endereco_hotel` FOREIGN KEY (`endereco`) REFERENCES `Endereco` (`idEndereco`),
  ADD CONSTRAINT `FK_hotel_restaurante` FOREIGN KEY (`restaurante`) REFERENCES `Restaurante` (`idRestaurante`);

--
-- Constraints for table `Igreja`
--
ALTER TABLE `Igreja`
  ADD CONSTRAINT `fk_especializacao_igreja_pontoTuristico` FOREIGN KEY (`idTuristico`) REFERENCES `PontoTuristico` (`idTuristico`);

--
-- Constraints for table `Museu`
--
ALTER TABLE `Museu`
  ADD CONSTRAINT `fk_especializacao_museu_pontoTuristico` FOREIGN KEY (`idTuristico`) REFERENCES `PontoTuristico` (`idTuristico`);

--
-- Constraints for table `Museu_fundador`
--
ALTER TABLE `Museu_fundador`
  ADD CONSTRAINT `fk_id_Fundador` FOREIGN KEY (`idFundador`) REFERENCES `Fundador` (`idFundador`),
  ADD CONSTRAINT `fk_id_museu` FOREIGN KEY (`idMuseu`) REFERENCES `Museu` (`idTuristico`);

--
-- Constraints for table `PontoTuristico`
--
ALTER TABLE `PontoTuristico`
  ADD CONSTRAINT `fk_endereco_pontoTuristico` FOREIGN KEY (`endereco`) REFERENCES `Endereco` (`idEndereco`);

--
-- Constraints for table `Restaurante`
--
ALTER TABLE `Restaurante`
  ADD CONSTRAINT `fk_endereco_restaurante` FOREIGN KEY (`endereco`) REFERENCES `Endereco` (`idEndereco`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
