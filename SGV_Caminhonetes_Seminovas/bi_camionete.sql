-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 16/04/2024 às 16:35
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bi_camionete`
--
CREATE DATABASE IF NOT EXISTS `bi_camionete` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bi_camionete`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dim_marca`
--

DROP TABLE IF EXISTS `dim_marca`;
CREATE TABLE `dim_marca` (
  `ID_Marca` int(11) NOT NULL,
  `Nome_Marca` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_marca`
--

INSERT INTO `dim_marca` (`ID_Marca`, `Nome_Marca`) VALUES
(1, 'Chevrolet'),
(7, 'Fiat'),
(2, 'Ford'),
(3, 'Volkswagen');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dim_modelo`
--

DROP TABLE IF EXISTS `dim_modelo`;
CREATE TABLE `dim_modelo` (
  `ID_MODELO` int(2) NOT NULL,
  `Nome_Modelo` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dim_modelo`
--

INSERT INTO `dim_modelo` (`ID_MODELO`, `Nome_Modelo`) VALUES
(1, 'Amarok'),
(6, 'Maverik'),
(3, 'Ranger'),
(5, 'S10'),
(2, 'Saveiro'),
(4, 'Toro');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tab_origem`
--

DROP TABLE IF EXISTS `tab_origem`;
CREATE TABLE `tab_origem` (
  `ID_Origem` int(11) NOT NULL,
  `FK_Marca` int(2) NOT NULL,
  `FK_Modelo` int(2) NOT NULL,
  `Ano_de_fabricacao` int(4) NOT NULL,
  `Preco_de_venda` decimal(9,2) NOT NULL,
  `Preco_de_compra` decimal(9,2) NOT NULL,
  `Preco_de_lucro` decimal(9,2) NOT NULL,
  `Ano_de_venda` int(4) NOT NULL,
  `Mes_venda` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `dim_marca`
--
ALTER TABLE `dim_marca`
  ADD PRIMARY KEY (`ID_Marca`),
  ADD UNIQUE KEY `Inx_Marca` (`Nome_Marca`);

--
-- Índices de tabela `dim_modelo`
--
ALTER TABLE `dim_modelo`
  ADD PRIMARY KEY (`ID_MODELO`),
  ADD UNIQUE KEY `inx_modelo` (`Nome_Modelo`);

--
-- Índices de tabela `tab_origem`
--
ALTER TABLE `tab_origem`
  ADD PRIMARY KEY (`ID_Origem`),
  ADD KEY `INX_FK_Marca` (`FK_Marca`),
  ADD KEY `INX_FK_Modelo` (`FK_Modelo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `dim_marca`
--
ALTER TABLE `dim_marca`
  MODIFY `ID_Marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `dim_modelo`
--
ALTER TABLE `dim_modelo`
  MODIFY `ID_MODELO` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tab_origem`
--
ALTER TABLE `tab_origem`
  MODIFY `ID_Origem` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
