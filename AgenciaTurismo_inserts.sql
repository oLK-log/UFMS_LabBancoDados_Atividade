– Atencao: dados de insercao de dados foram criados usando IA  
– Prompt: comandosCriacao + quero popular meu banco com dados fictícios, 10 tuplas em cada tabela. Uma observação é que no campo 'categoria' de 'Hotel' pode ser preenchido do 1 ao 5(representando as categorias de um hotel-1 estrela, 2 estrelas...5 estrelas), e quero que tenha no minimo 2 hoteis com categoria 4 e 2 com 5 estrelas.   -- -- =======================================================================
-- SCRIPT DE INSERÇÃO DE DADOS (VERSÃO CORRIGIDA)
-- =======================================================================

-- 1. Inserindo 10 Cidades (IDs 1-10)
INSERT INTO `AgenciaTurismo`.`Cidade` (`nome`, `estado`, `populacao`) VALUES
('Campo Grande', 'MS', 916001), ('Rio de Janeiro', 'RJ', 6775561), ('Salvador', 'BA', 2900319),
('Gramado', 'RS', 36864), ('Manaus', 'AM', 2255903), ('São Paulo', 'SP', 12396372),
('Foz do Iguaçu', 'PR', 257971), ('Ouro Preto', 'MG', 74823), ('Florianópolis', 'SC', 516524),
('Bonito', 'MS', 22401);

-- 2. Inserindo 10 Fundadores (IDs 1-10)
INSERT INTO `AgenciaTurismo`.`Fundador` (`nome`, `dataNascimento`, `atvProfissional`) VALUES
('João Silva', '1950-05-15', 'Historiador'), ('Maria Oliveira', '1962-11-21', 'Artista Plástica'),
('Carlos Pereira', '1945-01-30', 'Antropólogo'), ('Ana Souza', '1970-08-10', 'Filantropa'),
('Pedro Costa', '1981-03-25', 'Arquiteto'), ('Laura Mendes', '1965-07-19', 'Curadora de Arte'),
('Marcos Almeida', '1978-02-11', 'Empresário'), ('Beatriz Lima', '1955-09-03', 'Professora'),
('Ricardo Farias', '1940-12-28', 'Colecionador'), ('Juliana Nogueira', '1985-06-05', 'Designer');

-- 3. Inserindo 30 Endereços (IDs 1-30)
INSERT INTO `AgenciaTurismo`.`Endereco` (`rua`, `bairro`, `numero`, `cep`, `cidade`) VALUES
-- Restaurantes (1-10)
('Rua das Garças', 'Centro', '100', '79002-123', 1), ('Av. Atlântica', 'Copacabana', '2000', '22070-001', 2),
('Largo do Pelourinho', 'Pelourinho', '30', '40026-280', 3), ('Av. Borges de Medeiros', 'Planalto', '2500', '95670-000', 4),
('Estrada da Ponta Negra', 'Ponta Negra', '500', '69037-000', 5), ('Rua Augusta', 'Consolação', '1500', '01305-100', 6),
('Av. das Cataratas', 'Vila Yolanda', '800', '85853-000', 7), ('Praça Tiradentes', 'Centro', '50', '35400-000', 8),
('Av. Beira Mar Norte', 'Centro', '2000', '88015-000', 9), ('Rua Pilad Rebuá', 'Centro', '1800', '79290-000', 10),
-- Pontos Turísticos (11-20)
('Parque dos Poderes', 'Jardim Veraneio', 'S/N', '79031-970', 1), ('Rua Primeiro de Março', 'Centro', 'S/N', '20010-000', 2),
('Av. Sete de Setembro', 'Vitória', '123', '40080-001', 3), ('Av. das Hortênsias', 'Vila Suíça', '450', '95670-000', 4),
('Largo de São Sebastião', 'Centro', 'S/N', '69010-150', 5), ('Parque Ibirapuera', 'Vila Mariana', 'S/N', '04094-000', 6),
('Rodovia BR-469', 'Parque Nacional', 'km 18', '85855-750', 7), ('Rua Direita', 'Centro', '159', '35400-000', 8),
('Rod. Admar Gonzaga', 'Itacorubi', '776', '88034-000', 9), ('Rodovia MS-178', 'Zona Rural', 'km 22', '79290-000', 10),
-- Hotéis (21-30)
('Av. Afonso Pena', 'Centro', '4000', '79020-001', 1), ('Rua Barata Ribeiro', 'Copacabana', '500', '22040-002', 2),
('Rua da Paciência', 'Rio Vermelho', '150', '41950-010', 3), ('Rua Coberta', 'Centro', '10', '95670-000', 4),
('Av. Coronel Teixeira', 'Ponta Negra', '1320', '69037-000', 5), ('Av. Paulista', 'Bela Vista', '2000', '01310-200', 6),
('Av. Mercosul', 'Jardim Santa Rosa', '670', '85853-120', 7), ('Largo Marília de Dirceu', 'Pilar', '44', '35400-000', 8),
('Rod. Jorn. Manoel de Menezes', 'Barra da Lagoa', '3000', '88061-701', 9), ('Estrada para Gruta', 'Centro', 'S/N', '79290-000', 10);

-- 4. Inserindo 10 Restaurantes (IDs 1-10)
INSERT INTO `AgenciaTurismo`.`Restaurante` (`nome`, `categoria`, `endereco`) VALUES
('Churrascaria do Pantanal', 'Churrasco', 1),('Acarajé da Dinha', 'Baiana', 3),('Botequim Carioca', 'Brasileira', 2),
('Le Petit Fondue', 'Europeia', 4),('Tambaqui de Banda', 'Regional', 5),('Famiglia Mancini', 'Italiana', 6),
('Porto Canoas', 'Brasileira', 7),('Contos de Réis', 'Mineira', 8),('Ostradamus', 'Frutos do Mar', 9),
('Casa do João', 'Regional', 10);

-- 5. Inserindo 10 Pontos Turísticos (IDs 1-10)
INSERT INTO `AgenciaTurismo`.`PontoTuristico` (`nome`, `descricao`, `endereco`) VALUES
('Aquário do Pantanal', 'O maior aquário de água doce do mundo.', 11),
('Museu do Amanhã', 'Museu de ciências aplicadas no Rio de Janeiro.', 12),
('Elevador Lacerda', 'Principal ponto turístico e meio de transporte em Salvador.', 13),
('Lago Negro', 'Um lago artificial cercado por árvores importadas da Floresta Negra alemã.', 14),
('Teatro Amazonas', 'Principal teatro e casa de ópera de Manaus.', 15),
('MASP', 'Museu de Arte de São Paulo Assis Chateaubriand.', 16),
('Cataratas do Iguaçu', 'Conjunto de quedas dágua na fronteira entre Brasil e Argentina.', 17),
('Igreja de São Francisco de Assis', 'Obra-prima do barroco mineiro, de Aleijadinho.', 18),
('Praia da Joaquina', 'Famosa pelas suas dunas e pela prática do surf.', 19),
('Gruta do Lago Azul', 'Uma das mais importantes cavernas do patrimônio espeleológico nacional.', 20);

-- 6. Inserindo 10 Hotéis
INSERT INTO `AgenciaTurismo`.`Hotel` (`nome`, `categoria`, `tipoQuarto`, `numeroQuartos`, `valorDiaria`, `restaurante`, `endereco`) VALUES
('Hotel Palace CG', 5, 'Suíte Presidencial', 150, 850.00, 1, 21),('Copacabana Star Hotel', 5, 'Luxo Vista Mar', 200, 1200.50, 3, 22),
('Pousada do Carmo', 3, 'Standard Casal', 50, 320.00, 2, 23),('Chalés da Montanha', 4, 'Chalé Família', 40, 550.75, 4, 24),
('Amazon Jungle Resort', 4, 'Bangalô na Selva', 80, 950.00, 5, 25),('Renaissance São Paulo', 3, 'Deluxe', 300, 680.00, 6, 26),
('Belmond Hotel das Cataratas', 2, 'Superior', 120, 1500.00, 7, 27),('Pousada do Arcanjo', 2, 'Colonial', 25, 450.00, 8, 28),
('Il Campanario Villaggio Resort', 1, 'Suíte Jr', 250, 750.00, 9, 29),('Hotel Pira Miúna', 1, 'Apartamento', 60, 380.00, 10, 30);

-- 7. Inserindo as Especializações dos Pontos Turísticos (CORRIGIDO)
-- CORREÇÃO: IDs ajustados para corresponder aos valores de AUTO_INCREMENT da tabela PontoTuristico
INSERT INTO `AgenciaTurismo`.`Museu` (`idTuristico`, `dataFundacao`, `numeroSalas`) VALUES
(2, '2015-12-17', 15),  -- Museu do Amanhã é o PontoTuristico com ID=2
(6, '1947-10-02', 30);  -- MASP é o PontoTuristico com ID=6

INSERT INTO `AgenciaTurismo`.`Igreja` (`idTuristico`, `dataConstrucao`, `estiloConstrucao`) VALUES
(8, '1794-01-01', 'Barroco Rococó'); -- Igreja São Francisco é o PontoTuristico com ID=8

INSERT INTO `AgenciaTurismo`.`CasaShow` (`idTuristico`, `horarioInicio`, `diaFechamento`) VALUES
(5, '19:00:00', 'Segunda'); -- Teatro Amazonas é o PontoTuristico com ID=5

-- 8. Inserindo relações na tabela Museu_fundador (CORRIGIDO)
-- CORREÇÃO: IDs de Museu ajustados
INSERT INTO `AgenciaTurismo`.`Museu_fundador` (`idMuseu`, `idFundador`) VALUES
(2, 1), (2, 2), (2, 3), (2, 4),
(6, 5), (6, 6), (6, 7), (6, 8), (6, 9), (6, 10);

-- 9. Inserindo relações na tabela CasaShow_possui_restaurante (CORRIGIDO)
-- CORREÇÃO: ID de CasaShow ajustado
INSERT INTO `AgenciaTurismo`.`CasaShow_possui_restaurante` (`idTuristico`, `idRestaurante`, `precoMedio`, `especialidade`) VALUES
(5, 5, 250.00, 'Culinária regional sofisticada');

=======================================================================
-- FIM SCRIPT DE INSERÇÃO DE DADOS
-- =======================================================================
