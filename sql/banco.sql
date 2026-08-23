CREATE TABLE
  `pessoas` (
    `id` INT (11) NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
    `telefone` VARCHAR(15) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `cpf` VARCHAR(11) NOT NULL COLLATE 'utf8mb4_general_ci',
    `endereco` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    `createdAt` TIMESTAMP NULL DEFAULT current_timestamp(),
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `cpf` (`cpf`) USING BTREE
  ) ENGINE = InnoDB;

CREATE TABLE
  IF NOT EXISTS `movimentacao` (
    `id` int (11) NOT NULL AUTO_INCREMENT,
    `idPessoa` int (11) DEFAULT NULL,
    `Credito` decimal(15, 2) DEFAULT NULL,
    `Debito` decimal(15, 2) DEFAULT NULL,
    `DataOperacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    `Observacao` varchar(255) DEFAULT NULL,
    `createdAt` timestamp NULL DEFAULT current_timestamp(),
    `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE,
    KEY `id` (`id`) USING BTREE,
    KEY `FK_ID_PESSOA` (`idPessoa`),
    CONSTRAINT `FK_ID_PESSOA` FOREIGN KEY (`idPessoa`) REFERENCES `pessoas` (`id`)
  ) ENGINE = InnoDB;