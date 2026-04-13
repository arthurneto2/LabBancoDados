SELECT descricaoproduto, unidade, precounitario
FROM produto;

SELECT
	codigovendedor AS codigo,
	nomevendedor AS vendedor,
	salariofixo AS salario
FROM vendedor;

SELECT 
	pedido.numpedido,
	produto.codigoproduto,
	itemdopedido.quantidade
FROM pedido
INNER JOIN itemdopedido ON itemdopedido.numpedido = pedido.numpedido
INNER JOIN produto ON produto.codigoproduto = itemdopedido.codigoproduto
WHERE itemdopedido.quantidade >= 35;

SELECT nomecliente, cidade, cep
FROM cliente
WHERE cidade = 'São Paulo' OR cep > '30077000' AND cep < '30079000';

SELECT descricaoproduto
FROM produto
WHERE descricaoproduto LIKE 'Q%';

SELECT nomevendedor
FROM vendedor
WHERE nomevendedor NOT LIKE 'Jo%';

SELECT nomevendedor, faixacomissao
FROM vendedor
WHERE faixacomissao IN ('A', 'B');

SELECT nomevendedor, salariofixo
FROM vendedor
ORDER BY nomevendedor;

SELECT cliente.nomecliente, pedido.numpedido
FROM cliente
INNER JOIN pedido ON pedido.codigocliente = cliente.codigocliente;

SELECT cliente.nomecliente, pedido.numpedido
FROM cliente
LEFT JOIN pedido ON pedido.codigocliente = cliente.codigocliente;

SELECT 
	MAX(salariofixo),
	MIN(salariofixo)
FROM vendedor;

SELECT COUNT(*)
FROM vendedor
WHERE salariofixo > 2500;

SELECT DISTINCT (vendedor.nomevendedor), pedido.prazoentrega
FROM vendedor
INNER JOIN pedido ON pedido.codigovendedor = vendedor.codigovendedor
WHERE pedido.prazoentrega > 15 AND vendedor.salariofixo >= 1000
ORDER BY vendedor.nomevendedor;

SELECT cliente.nomecliente, pedido.prazoentrega
FROM cliente
INNER JOIN pedido ON pedido.codigocliente = cliente.codigocliente
INNER JOIN itempedido ON itempedido.numdopedido = pedido.numpedido
INNER JOIN produto ON itempedido.codigoproduto = produto.codigoproduto
WHERE pedido.prazoentrega > 15
AND produto.descricaoproduto = 'queijo'
AND cliente.cidade = 'Rio de Janeiro'

SELECT vendedor.codigovendedor, COUNT(*)
FROM vendedor
INNER JOIN pedido ON pedido.codigovendedor = vendedor.codigovendedor
INNER JOIN cliente ON pedido.codigocliente = cliente.codigocliente
GROUP BY vendedor.codigovendedor
ORDER BY COUNT(cliente.codigocliente) DESC

SELECT cliente.nomecliente, COUNT(pedido.numpedido)
FROM cliente
INNER JOIN pedido ON pedido.codigocliente = cliente.codigocliente
GROUP BY cliente.nomecliente
HAVING COUNT(pedido.numpedido) > 3

