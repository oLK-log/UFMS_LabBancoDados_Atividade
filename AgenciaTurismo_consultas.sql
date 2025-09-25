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

-- Listar restaurantes que pertencem a hoteis de 4 ou 5 estrelas. Mostre o nome do restaurante, nome do hotel e a categoria
SELECT r.`nome`AS nomeRestaurante, h.`nome` AS nomeHotel, r.`categoria` 
FROM `Restaurante`AS r JOIN `Hotel` AS h ON r.`idRestaurante` = h.`restaurante`
WHERE h.`categoria` = 4 OR h.`categoria`=5;

-- Listar nome e endereco das casas de show que possuem restaurante
SELECT pt.`nome` AS nomeCasaDeShow, e.*
FROM `CasaShow_possui_restaurante` AS cp
JOIN `CasaShow` AS c ON c.idTuristico=cp.idTuristico
JOIN `PontoTuristico` AS pt ON pt.idTuristico = c.idTuristico
JOIN `Endereco` AS e ON e.idEndereco = pt.endereco;

-- Listar museus com nomes dos seus fundadores
SELECT pt.`nome` AS nomeMuseu, f.`nome` AS nomeFundador
FROM `Museu` AS m
JOIN `Museu_fundador` AS mf ON mf.idMuseu = m.idTuristico
JOIN `Fundador` AS f ON mf.idFundador = f.idFundador 
JOIN `PontoTuristico`AS pt ON m.idTuristico = pt.idTuristico;
