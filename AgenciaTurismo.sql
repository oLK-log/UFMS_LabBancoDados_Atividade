-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Sep 25, 2025 at 01:24 AM
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
(5, '19:00:00', 'Segunda');

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
(5, 5, 250.00, 'Culinária regional sofisticada');

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
(5, 'Manaus', 'AM', 2255903),
(6, 'São Paulo', 'SP', 12396372),
(7, 'Foz do Iguaçu', 'PR', 257971),
(8, 'Ouro Preto', 'MG', 74823),
(9, 'Florianópolis', 'SC', 516524),
(10, 'Bonito', 'MS', 22401);

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
(6, 'Rua Augusta', 'Consolação', '1500', '01305-100', 6),
(7, 'Av. das Cataratas', 'Vila Yolanda', '800', '85853-000', 7),
(8, 'Praça Tiradentes', 'Centro', '50', '35400-000', 8),
(9, 'Av. Beira Mar Norte', 'Centro', '2000', '88015-000', 9),
(10, 'Rua Pilad Rebuá', 'Centro', '1800', '79290-000', 10),
(11, 'Parque dos Poderes', 'Jardim Veraneio', 'S/N', '79031-970', 1),
(12, 'Rua Primeiro de Março', 'Centro', 'S/N', '20010-000', 2),
(13, 'Av. Sete de Setembro', 'Vitória', '123', '40080-001', 3),
(14, 'Av. das Hortênsias', 'Vila Suíça', '450', '95670-000', 4),
(15, 'Largo de São Sebastião', 'Centro', 'S/N', '69010-150', 5),
(16, 'Parque Ibirapuera', 'Vila Mariana', 'S/N', '04094-000', 6),
(17, 'Rodovia BR-469', 'Parque Nacional', 'km 18', '85855-750', 7),
(18, 'Rua Direita', 'Centro', '159', '35400-000', 8),
(19, 'Rod. Admar Gonzaga', 'Itacorubi', '776', '88034-000', 9),
(20, 'Rodovia MS-178', 'Zona Rural', 'km 22', '79290-000', 10),
(21, 'Av. Afonso Pena', 'Centro', '4000', '79020-001', 1),
(22, 'Rua Barata Ribeiro', 'Copacabana', '500', '22040-002', 2),
(23, 'Rua da Paciência', 'Rio Vermelho', '150', '41950-010', 3),
(24, 'Rua Coberta', 'Centro', '10', '95670-000', 4),
(25, 'Av. Coronel Teixeira', 'Ponta Negra', '1320', '69037-000', 5),
(26, 'Av. Paulista', 'Bela Vista', '2000', '01310-200', 6),
(27, 'Av. Mercosul', 'Jardim Santa Rosa', '670', '85853-120', 7),
(28, 'Largo Marília de Dirceu', 'Pilar', '44', '35400-000', 8),
(29, 'Rod. Jorn. Manoel de Menezes', 'Barra da Lagoa', '3000', '88061-701', 9),
(30, 'Estrada para Gruta', 'Centro', 'S/N', '79290-000', 10);

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
(5, 'Pedro Costa', '1981-03-25', 'Arquiteto'),
(6, 'Laura Mendes', '1965-07-19', 'Curadora de Arte'),
(7, 'Marcos Almeida', '1978-02-11', 'Empresário'),
(8, 'Beatriz Lima', '1955-09-03', 'Professora'),
(9, 'Ricardo Farias', '1940-12-28', 'Colecionador'),
(10, 'Juliana Nogueira', '1985-06-05', 'Designer');

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
(1, 'Hotel Palace CG', 5, 'Suíte Presidencial', 150, 850.00, 1, 21),
(2, 'Copacabana Star Hotel', 5, 'Luxo Vista Mar', 200, 1200.50, 3, 22),
(3, 'Pousada do Carmo', 3, 'Standard Casal', 50, 320.00, 2, 23),
(4, 'Chalés da Montanha', 4, 'Chalé Família', 40, 550.75, 4, 24),
(5, 'Amazon Jungle Resort', 4, 'Bangalô na Selva', 80, 950.00, 5, 25),
(6, 'Renaissance São Paulo', 3, 'Deluxe', 300, 680.00, 6, 26),
(7, 'Belmond Hotel das Cataratas', 2, 'Superior', 120, 1500.00, 7, 27),
(8, 'Pousada do Arcanjo', 2, 'Colonial', 25, 450.00, 8, 28),
(9, 'Il Campanario Villaggio Resort', 1, 'Suíte Jr', 250, 750.00, 9, 29),
(10, 'Hotel Pira Miúna', 1, 'Apartamento', 60, 380.00, 10, 30);

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
(8, '1794-01-01', 'Barroco Rococó');

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
(2, '2015-12-17', 15),
(6, '1947-10-02', 30);

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
(2, 3),
(2, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `PontoTuristico`
--

CREATE TABLE `PontoTuristico` (
  `idTuristico` int NOT NULL,
  `nome` varchar(122) NOT NULL,
  `descricao` varchar(244) NOT NULL,
  `endereco` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `PontoTuristico`
--

INSERT INTO `PontoTuristico` (`idTuristico`, `nome`, `descricao`, `endereco`) VALUES
(1, 'Aquário do Pantanal', 'O maior aquário de água doce do mundo.', 11),
(2, 'Museu do Amanhã', 'Museu de ciências aplicadas no Rio de Janeiro.', 12),
(3, 'Elevador Lacerda', 'Principal ponto turístico e meio de transporte em Salvador.', 13),
(4, 'Lago Negro', 'Um lago artificial cercado por árvores importadas da Floresta Negra alemã.', 14),
(5, 'Teatro Amazonas', 'Principal teatro e casa de ópera de Manaus.', 15),
(6, 'MASP', 'Museu de Arte de São Paulo Assis Chateaubriand.', 16),
(7, 'Cataratas do Iguaçu', 'Conjunto de quedas dágua na fronteira entre Brasil e Argentina.', 17),
(8, 'Igreja de São Francisco de Assis', 'Obra-prima do barroco mineiro, de Aleijadinho.', 18),
(9, 'Praia da Joaquina', 'Famosa pelas suas dunas e pela prática do surf.', 19),
(10, 'Gruta do Lago Azul', 'Uma das mais importantes cavernas do patrimônio espeleológico nacional.', 20);

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
(6, 'Famiglia Mancini', 'Italiana', 6),
(7, 'Porto Canoas', 'Brasileira', 7),
(8, 'Contos de Réis', 'Mineira', 8),
(9, 'Ostradamus', 'Frutos do Mar', 9),
(10, 'Casa do João', 'Regional', 10);

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
  ADD UNIQUE KEY `unique_casaShow_restaurante` (`idTuristico`),
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
  MODIFY `idCidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Endereco`
--
ALTER TABLE `Endereco`
  MODIFY `idEndereco` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `Fundador`
--
ALTER TABLE `Fundador`
  MODIFY `idFundador` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Hotel`
--
ALTER TABLE `Hotel`
  MODIFY `idHotel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `PontoTuristico`
--
ALTER TABLE `PontoTuristico`
  MODIFY `idTuristico` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Restaurante`
--
ALTER TABLE `Restaurante`
  MODIFY `idRestaurante` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
