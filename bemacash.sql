-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Set-2019 às 20:41
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bemacash`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `componentes`
--

CREATE TABLE `componentes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `componentes`
--

INSERT INTO `componentes` (`id`, `nome`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Licenciamento Bemacash Vestuário', 'licenca.jpg', NULL, NULL),
(2, 'TABLET SAMSUNG GALAXY TAB E 9.6 SM-T560 199 100070', 'tablet.jpg', NULL, NULL),
(3, 'SUPORTE METALICO TABLE BEMACASH 9.6 pol 499 100720', 'suporte_metalico.jpg', NULL, NULL),
(4, 'GAVETA DE DINHEIRO GD-55 PRETA 128000 100', 'gaveta_dinheiro.jpg', NULL, NULL),
(5, 'Licença de Software Fiscal Manager', 'licenca_software_fiscal.jgp', NULL, NULL),
(6, 'MP-4200 TH ETHERNET BR 10 100830', 'mp-4200.jpg', NULL, NULL),
(7, 'LEITOR CCD BT SCANNER BR-200BT T03 1000 10', 'leitor-ccd.jpg', NULL, NULL),
(8, 'Licença de Software Bemacash', 'licenca-software-bemacash.jgp', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `componentes_kits`
--

CREATE TABLE `componentes_kits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kits` bigint(20) UNSIGNED NOT NULL,
  `id_componentes` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `componentes_kits`
--

INSERT INTO `componentes_kits` (`id`, `id_kits`, `id_componentes`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 2, 2),
(8, 2, 3),
(9, 2, 6),
(10, 2, 4),
(11, 2, 7),
(12, 2, 8),
(13, 3, 8),
(14, 3, 2),
(15, 3, 3),
(16, 3, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato_licenca`
--

CREATE TABLE `contrato_licenca` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pedido` bigint(20) UNSIGNED NOT NULL,
  `data_contrato` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `contrato` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `contrato_licenca`
--

INSERT INTO `contrato_licenca` (`id`, `id_pedido`, `data_contrato`, `contrato`) VALUES
(1, 1, '2019-09-02 04:51:47', 'http://localhost/site/public/pdf/contrato-1.pdf'),
(2, 2, '2019-09-02 04:51:08', 'http://localhost/site/public/pdf/contrato-2.pdf'),
(3, 3, '2019-09-02 04:51:33', 'http://localhost/site/public/pdf/contrato-3.pdf');

-- --------------------------------------------------------

--
-- Estrutura da tabela `detalhe_pedido`
--

CREATE TABLE `detalhe_pedido` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pedido` bigint(20) UNSIGNED NOT NULL,
  `id_kits` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `detalhe_pedido`
--

INSERT INTO `detalhe_pedido` (`id`, `id_pedido`, `id_kits`) VALUES
(3, 1, 1),
(4, 2, 1),
(6, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_envio`
--

CREATE TABLE `endereco_envio` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `endereco_envio`
--

INSERT INTO `endereco_envio` (`id`, `id_user`, `estado`, `pais`, `endereco`, `zip_code`) VALUES
(1, 1, 'Rio Grande do Sul', 'Brasil', 'Cristóvão Colombo', '90560000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico_pedido`
--

CREATE TABLE `historico_pedido` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pedido` bigint(20) UNSIGNED NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `historico_pedido`
--

INSERT INTO `historico_pedido` (`id`, `id_pedido`, `data_modificacao`, `descricao`) VALUES
(1, 1, '2019-09-02 01:58:37', 'Novo Pedido'),
(2, 2, '2019-09-02 01:58:37', 'Novo Pedido'),
(4, 3, '2019-09-01 10:12:34', 'Novo Pedido');

-- --------------------------------------------------------

--
-- Estrutura da tabela `kits`
--

CREATE TABLE `kits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `tipo_licenca` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `kits`
--

INSERT INTO `kits` (`id`, `nome`, `preco`, `tipo_licenca`, `created_at`, `updated_at`) VALUES
(1, 'BEMACASH VESTUARIO NFC-e + IMPRESSORA + GAVETA', '299.00', 'BEMACASH VESTUÁRIO NFCe', NULL, NULL),
(2, 'BEMACASH COMERCIO NFC-e + IMPRESSORA + GAVETA + LEITOR', '338.00', 'BEMACASH COMÉRCIO NFC-e', NULL, NULL),
(3, 'BEMACASH BAR E RESTAURANTE NFC-e + IMPRESSORA', '251.00', 'BEMACASH BAR E RESTAURANTE NFC-e', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_31_065915_create_kits_table', 1),
(3, '2019_08_31_073238_create_componentes_table', 1),
(4, '2019_08_31_073509_create_componentes_kits_table', 1),
(5, '2019_08_31_073824_create_endereco_envio_table', 1),
(6, '2019_08_31_073901_create_pedidos_table', 1),
(7, '2019_08_31_075050_create_nfe_table', 1),
(8, '2019_08_31_075415_create_historico_pedido_table', 1),
(9, '2019_08_31_080518_create_contrato_licenca_table', 1),
(10, '2019_08_31_081937_create_detalhe_pedido_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nfe`
--

CREATE TABLE `nfe` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pedido` bigint(20) UNSIGNED NOT NULL,
  `data_emissao_nfe` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `numero_nfe` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_endereco_envio` bigint(20) UNSIGNED NOT NULL,
  `status_pedido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco_total` decimal(8,2) NOT NULL,
  `data_pedido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `comentario_pedido` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_user`, `id_endereco_envio`, `status_pedido`, `preco_total`, `data_pedido`, `comentario_pedido`) VALUES
(1, 1, 1, 'Em revisão da bematech', '299.00', '2019-09-01 01:53:45', ''),
(2, 1, 1, 'Entregue', '637.00', '2019-09-01 02:13:23', ''),
(3, 1, 1, 'Entregue', '637.00', '2019-09-01 02:13:36', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` bigint(20) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `nome`, `email`, `documento`, `password`, `telefone`, `created_at`, `updated_at`) VALUES
(1, 'carlos junior', 'carlos.junior@hotmail.com', 66168857412, 'k9j8h7g6', 51995147498, NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `componentes_kits`
--
ALTER TABLE `componentes_kits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `componentes_kits_id_kits_foreign` (`id_kits`),
  ADD KEY `componentes_kits_id_componentes_foreign` (`id_componentes`);

--
-- Índices para tabela `contrato_licenca`
--
ALTER TABLE `contrato_licenca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contrato_licenca_id_pedido_foreign` (`id_pedido`);

--
-- Índices para tabela `detalhe_pedido`
--
ALTER TABLE `detalhe_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalhe_pedido_id_pedido_foreign` (`id_pedido`),
  ADD KEY `detalhe_pedido_id_kits_foreign` (`id_kits`);

--
-- Índices para tabela `endereco_envio`
--
ALTER TABLE `endereco_envio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `endereco_envio_id_user_foreign` (`id_user`);

--
-- Índices para tabela `historico_pedido`
--
ALTER TABLE `historico_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historico_pedido_id_pedido_foreign` (`id_pedido`);

--
-- Índices para tabela `kits`
--
ALTER TABLE `kits`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `nfe`
--
ALTER TABLE `nfe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nfe_id_pedido_foreign` (`id_pedido`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidos_id_user_foreign` (`id_user`),
  ADD KEY `pedidos_id_endereco_envio_foreign` (`id_endereco_envio`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_documento_unique` (`documento`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `componentes`
--
ALTER TABLE `componentes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `componentes_kits`
--
ALTER TABLE `componentes_kits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `contrato_licenca`
--
ALTER TABLE `contrato_licenca`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `detalhe_pedido`
--
ALTER TABLE `detalhe_pedido`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `endereco_envio`
--
ALTER TABLE `endereco_envio`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `historico_pedido`
--
ALTER TABLE `historico_pedido`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `kits`
--
ALTER TABLE `kits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `nfe`
--
ALTER TABLE `nfe`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `componentes_kits`
--
ALTER TABLE `componentes_kits`
  ADD CONSTRAINT `componentes_kits_id_componentes_foreign` FOREIGN KEY (`id_componentes`) REFERENCES `componentes` (`id`),
  ADD CONSTRAINT `componentes_kits_id_kits_foreign` FOREIGN KEY (`id_kits`) REFERENCES `kits` (`id`);

--
-- Limitadores para a tabela `contrato_licenca`
--
ALTER TABLE `contrato_licenca`
  ADD CONSTRAINT `contrato_licenca_id_pedido_foreign` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Limitadores para a tabela `detalhe_pedido`
--
ALTER TABLE `detalhe_pedido`
  ADD CONSTRAINT `detalhe_pedido_id_kits_foreign` FOREIGN KEY (`id_kits`) REFERENCES `kits` (`id`),
  ADD CONSTRAINT `detalhe_pedido_id_pedido_foreign` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Limitadores para a tabela `endereco_envio`
--
ALTER TABLE `endereco_envio`
  ADD CONSTRAINT `endereco_envio_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `historico_pedido`
--
ALTER TABLE `historico_pedido`
  ADD CONSTRAINT `historico_pedido_id_pedido_foreign` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Limitadores para a tabela `nfe`
--
ALTER TABLE `nfe`
  ADD CONSTRAINT `nfe_id_pedido_foreign` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_id_endereco_envio_foreign` FOREIGN KEY (`id_endereco_envio`) REFERENCES `endereco_envio` (`id`),
  ADD CONSTRAINT `pedidos_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
