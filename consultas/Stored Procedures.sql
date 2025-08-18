CREATE DEFINER=`root`@`localhost` PROCEDURE `Novo_Aluguel_Procedures`(
    IN vClienteNome VARCHAR(150),
    IN vHospedagem VARCHAR(10),
    IN vDataInicio DATE,
    IN vDias INT,
    IN vPrecoUnitario DECIMAL(10,2)
)
BEGIN
    DECLARE vAluguel VARCHAR(10);
    DECLARE vCliente INT;
    DECLARE vDataFinal DATE;
    DECLARE vNumCliente INT;
    DECLARE vPrecoTotal DECIMAL(10,2);
    DECLARE vMensagem VARCHAR(100);

    -- Tratamento de erro de chave estrangeira
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
        SET vMensagem = 'Problema de chave estrangeira';
        SELECT vMensagem;
    END;

    -- Verifica se cliente existe
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);

    CASE  
        WHEN vNumCliente = 0 THEN 
            SET vMensagem = 'Este cliente não existe';
            SELECT vMensagem;

        WHEN vNumCliente = 1 THEN 
            -- Calcula data desconto
            CALL calculaDataDesconto(vDataInicio, vDataFinal, vDias);

            -- Calcula valor total
            SET vPrecoTotal = vDias * vPrecoUnitario;

            -- Busca ID do cliente
            SELECT cliente_id INTO vCliente 
            FROM clientes 
            WHERE nome = vClienteNome;

            -- Gera ID incremental do aluguel
            SELECT CAST(MAX(CAST(aluguel_id AS UNSIGNED)) + 1 AS CHAR) 
            INTO vAluguel 
            FROM alugueis;

            -- Insere registro de aluguel
            INSERT INTO alugueis (aluguel_id, cliente_id, hospedagem_id, data_inicio, data_final, preco_total)
            VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);

            SET vMensagem = 'Aluguel incluído na base com sucesso.';
            SELECT vMensagem;

        ELSE 
            SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel pelo nome';
            SELECT vMensagem;
    END CASE;
END

CREATE DEFINER=`root`@`localhost` PROCEDURE `calculaDataDesconto`(
    IN vDataInicio DATE,
    INOUT vDataFinal DATE,
    IN vDias INT
)
BEGIN
    DECLARE vContador INT DEFAULT 1;
    DECLARE vDiaSemana INT;

    SET vDataFinal = vDataInicio;

    WHILE vContador < vDias DO
        SET vDiaSemana = DAYOFWEEK(vDataFinal);

        -- Conta apenas dias úteis (2=segunda até 6=sexta)
        IF vDiaSemana BETWEEN 2 AND 6 THEN
            SET vContador = vContador + 1;
        END IF;

        SET vDataFinal = vDataFinal + INTERVAL 1 DAY;
    END WHILE;
END;

