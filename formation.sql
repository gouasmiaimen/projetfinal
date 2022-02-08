-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 08 fév. 2022 à 16:54
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `label`, `photo`, `description`) VALUES
(1, 'PHP', '92c772785bea886f4181e4d94390980a.jpg', 'tous les frameworks de php et CMS: symfony, cakePHP, wordpress, prstashop ...'),
(2, 'JavaScript', 'e26bd415066cb6e68830ab43784e41cf.png', 'Tous les frameworks et bibliothèques de javascript: Angular, REACT, nodeJs .....'),
(3, 'JAVA', 'fb53df910c9e115c6cd4b2a0f44b9a42.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220207105220', '2022-02-07 11:53:31', 378);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prix` int(11) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `formateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `categorie_id`, `label`, `photo`, `description`, `prix`, `date_debut`, `date_fin`, `formateur_id`) VALUES
(1, 1, 'Symfony', 'ac3ffbff60b30dd1b603313ed2b60ff8.png', 'framework PHP', 1500, '2022-03-01', '2022-04-23', 1),
(2, 1, 'cakePHP', 'df352b33714636ab29c991fe8f52c3dd.png', 'frameworkphp', 2000, '2022-05-01', '2022-07-01', 1),
(3, 1, 'Wordpress', '62b1b562d9b5805d3782e1f1b5d54e28.png', 'CMS', 1800, '2022-03-01', '2017-04-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `session_user`
--

CREATE TABLE `session_user` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session_user`
--

INSERT INTO `session_user` (`session_id`, `user_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nom`, `prenom`, `photo`, `date_creation`) VALUES
(1, 'dabbekchakib@gmail.com', '[\"ROLE_USER\",\"ROLE_FORM\",\"ROLE_ADMIN\"]', 'admin', 'Dabbek', 'Chakib', 'c26eb651b18bf311343b311f9da7fef7.png', '2017-01-01'),
(19, 'mlawlori@pcworld.com', '[\"ROLE_USER\"]', '1qr9lnaCJ6', 'Lawlor', 'Melita', '7434921aaae789c1793b317a0133927b.png', '2021-04-05'),
(24, 'mwilfordn@bing.com', '[\"ROLE_USER\"]', 'FZjfVgIUq7', 'Wilford', 'Marcus', '7434921aaae789c1793b317a0133927b.png', '2022-01-23'),
(25, 'fsemono@bravesites.com', '[\"ROLE_USER\"]', 'EZbWvfdwGf', 'Semon', 'Felizio', '7434921aaae789c1793b317a0133927b.png', '2021-08-11'),
(26, 'mdivverp@nps.gov', '[\"ROLE_USER\"]', 'HR5MSB', 'Divver', 'Murray', '7434921aaae789c1793b317a0133927b.png', '2022-02-07'),
(27, 'brosasq@mozilla.com', '[\"ROLE_USER\"]', 'Dj6ISiMmJDC', 'Rosas', 'Byran', '7434921aaae789c1793b317a0133927b.png', '2022-01-19'),
(28, 'obigriggr@weibo.com', '[\"ROLE_USER\"]', 'cYHCXMJcxEF', 'Bigrigg', 'Odele', '7434921aaae789c1793b317a0133927b.png', '2021-11-05'),
(29, 'fpuess@foxnews.com', '[\"ROLE_USER\"]', 'V3wivQjNCfgu', 'Pues', 'Finn', '7434921aaae789c1793b317a0133927b.png', '2022-01-01'),
(30, 'dstrappt@disqus.com', '[\"ROLE_USER\"]', 'mwuT89', 'Strapp', 'Deeyn', '7434921aaae789c1793b317a0133927b.png', '2022-01-08'),
(31, 'ahanniganu@pagesperso-orange.fr', '[\"ROLE_USER\"]', 'WX5XTO', 'Hannigan', 'Aindrea', '7434921aaae789c1793b317a0133927b.png', '2021-05-18'),
(32, 'dshuttleworthv@drupal.org', '[\"ROLE_USER\"]', 'rAAR4hsO1yiP', 'Shuttleworth', 'Duane', '7434921aaae789c1793b317a0133927b.png', '2021-04-23'),
(33, 'nmarrw@ning.com', '[\"ROLE_USER\"]', 'BE68r5Sec', 'Marr', 'Neville', '7434921aaae789c1793b317a0133927b.png', '2021-05-03'),
(34, 'sdebruijnx@biblegateway.com', '[\"ROLE_USER\"]', 'ub5UCSMp', 'De Bruijn', 'Sybille', '7434921aaae789c1793b317a0133927b.png', '2021-07-18'),
(35, 'shearmony@1688.com', '[\"ROLE_USER\"]', 'PTgSMbsOFjSM', 'Hearmon', 'Sheilakathryn', '7434921aaae789c1793b317a0133927b.png', '2021-10-18'),
(36, 'jviscoviz@army.mil', '[\"ROLE_USER\"]', '7E1P2oAodc', 'Viscovi', 'Johnathan', '7434921aaae789c1793b317a0133927b.png', '2021-09-13'),
(37, 'mjeandillou10@apple.com', '[\"ROLE_USER\"]', 'pUJoByN3Nvmp', 'Jeandillou', 'Mathe', '7434921aaae789c1793b317a0133927b.png', '2021-04-05'),
(38, 'koyley11@intel.com', '[\"ROLE_USER\"]', '04zzuJXNnF9', 'Oyley', 'Kaia', '7434921aaae789c1793b317a0133927b.png', '2021-04-23'),
(39, 'sslite12@sphinn.com', '[\"ROLE_USER\"]', 'jC305xkaKC1T', 'Slite', 'Shaine', '7434921aaae789c1793b317a0133927b.png', '2021-08-03'),
(40, 'rmcclure13@shinystat.com', '[\"ROLE_USER\"]', 'jHMJRXa', 'McClure', 'Rozalin', '7434921aaae789c1793b317a0133927b.png', '2022-01-31'),
(41, 'pajean14@nyu.edu', '[\"ROLE_USER\"]', 'IhauOzsiQJmg', 'Ajean', 'Perceval', '7434921aaae789c1793b317a0133927b.png', '2021-12-20'),
(42, 'chourigan15@digg.com', '[\"ROLE_USER\"]', 'GVM4wH9wni', 'Hourigan', 'Cal', '7434921aaae789c1793b317a0133927b.png', '2021-12-11'),
(43, 'wcanet16@arstechnica.com', '[\"ROLE_USER\"]', 'xAaShR8GwU', 'Canet', 'Wainwright', '7434921aaae789c1793b317a0133927b.png', '2021-05-13'),
(44, 'kiannini17@wp.com', '[\"ROLE_USER\"]', 'uNQUXj', 'Iannini', 'Kalli', '7434921aaae789c1793b317a0133927b.png', '2021-12-05'),
(45, 'sdaelman18@cisco.com', '[\"ROLE_USER\"]', 'paUSqHhvpQB2', 'Daelman', 'Saloma', '7434921aaae789c1793b317a0133927b.png', '2022-01-02'),
(46, 'hcoyte19@github.io', '[\"ROLE_USER\"]', 'd4Tv269m', 'Coyte', 'Heall', '7434921aaae789c1793b317a0133927b.png', '2021-12-19'),
(47, 'twilds1a@admin.ch', '[\"ROLE_USER\"]', 'omw33GeBZzz', 'Wilds', 'Tiffi', '7434921aaae789c1793b317a0133927b.png', '2021-01-12'),
(48, 'hfedorski1b@flickr.com', '[\"ROLE_USER\"]', 'zB7to4', 'Fedorski', 'Halsy', '7434921aaae789c1793b317a0133927b.png', '2021-03-03');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D044D5D4BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_D044D5D4155D8F51` (`formateur_id`);

--
-- Index pour la table `session_user`
--
ALTER TABLE `session_user`
  ADD PRIMARY KEY (`session_id`,`user_id`),
  ADD KEY `IDX_4BE2D663613FECDF` (`session_id`),
  ADD KEY `IDX_4BE2D663A76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `FK_D044D5D4155D8F51` FOREIGN KEY (`formateur_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_D044D5D4BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `session_user`
--
ALTER TABLE `session_user`
  ADD CONSTRAINT `FK_4BE2D663613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4BE2D663A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
