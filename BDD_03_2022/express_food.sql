-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 20 mai 2022 à 22:06
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `express_food`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ville` varchar(100) DEFAULT NULL,
  `rue` varchar(100) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `code_postal` int DEFAULT NULL,
  `etage` smallint DEFAULT NULL,
  `batiment` varchar(50) DEFAULT NULL,
  `digicode` varchar(10) DEFAULT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_adresse_client_idx` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `ville`, `rue`, `numero`, `code_postal`, `etage`, `batiment`, `digicode`, `client_id`) VALUES
(1, 'Choisy-le-roi', '02 rue Ernest Renan', 464028127, 94600, 1, NULL, '1482', 3),
(2, 'Chambéry', '22 boulevard Albin Durand', 534510580, 73000, 2, 'B1', '0584', 1),
(3, 'Villemomble', '12 Place Charles de Gaulle', 260957282, 93250, NULL, NULL, NULL, 4),
(4, 'Pays de la Loire', '60 rue Gouin de Beauchesne', 415971816, 16200, 1, '8', '9924', 2);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `telephone`, `email`, `mot_de_passe`) VALUES
(1, 'Jule', 'Sebas', 749512155, 'jule.sabas.16@gmail.com', '123456789'),
(2, 'Salmi', 'Azz eddine', 749410155, 'samli.azzeddine100@gmail.com', '9517532846'),
(3, 'Johnny', 'Depp', 593216844, 'johnnydepp54@yahoo.fr', 'qsdz84132sdz'),
(4, 'Leila', 'Roody', 841362151, 'leila.roody@yahoo.fr', '19541dsf4efxcFEsv1b');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `status_commande` varchar(45) DEFAULT NULL,
  `paiement` tinyint DEFAULT NULL,
  `client_id` int NOT NULL,
  `dessert_jour_id` int NOT NULL,
  `plat_jour_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commande_client1_idx` (`client_id`),
  KEY `fk_commande_dessert_jour1_idx` (`dessert_jour_id`),
  KEY `fk_commande_plat_jour1_idx` (`plat_jour_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `date`, `status_commande`, `paiement`, `client_id`, `dessert_jour_id`, `plat_jour_id`) VALUES
(1, '2022-05-18', 'Livrée', 26, 1, 2, 1),
(2, '2022-05-19', 'En livraison', 18, 2, 1, 2),
(3, '2022-05-19', 'En attente', 22, 3, 1, 2),
(4, '2022-05-18', 'Anulée', 24, 4, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `dessert_jour`
--

DROP TABLE IF EXISTS `dessert_jour`;
CREATE TABLE IF NOT EXISTS `dessert_jour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_ajout` date DEFAULT NULL,
  `nom_dessert_1` varchar(45) DEFAULT NULL,
  `descreption_plat_1` text,
  `prix_plat_1` decimal(10,0) DEFAULT NULL,
  `nom_plat_2` varchar(45) DEFAULT NULL,
  `description_plat_2` text,
  `nom_dessert_2` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `dessert_jour`
--

INSERT INTO `dessert_jour` (`id`, `date_ajout`, `nom_dessert_1`, `descreption_plat_1`, `prix_plat_1`, `nom_plat_2`, `description_plat_2`, `nom_dessert_2`) VALUES
(1, '2022-05-19', 'Cake sucré', 'Facile et rapide à réaliser, le cake sucré fait toujours l\'unanimité au moment du goûter, à commencer par le traditionnel quatre-quarts. Ce cake doit son nom à ses proportions : un quart de farine, un autre quart de sucre, un troisième de beurre et un dernier quart d’œuf. Bête comme chou ! Si les cakes de Sophie ont fait leur preuve, ceux des internautes également. Du traditionnel cake aux fruits confits en passant par le cake à la pomme ou encore le cake au chocolat, toutes les recettes de cakes sucrés sont largement été testées et approuvées. Vous pourrez les décliner en version mini, à déguster avec le café ou glisser dans le tiroir du bureau, pour combler les petits creux de la journée.', '12', 'Cheesecake', 'Élevé au rang de dessert national au Etats-unis, le cheesecake fait de plus en plus d\'émule en France. Et une fois que vous aurez goûté à son côté crémeux et croquant, vous comprendrez pourquoi !', '14'),
(2, '2022-05-18', 'Crème dessert', 'Une crème dessert à la vanille simple et facile à préparer, pour ravir toute une famille.', '8', 'Crumble sucré', 'Qu\'il soit salé ou sucré, le crumble se la joue à la fois moelleux et croustillant. Facile à préparer, ce plat d\'origine britannique se compose d\'une pâte à crumble dont vous trouverez ici la recette. En dessert, le crumble se prépare avec des pommes, des fruits rouges, de la rhubarbe, des framboises de la banane ou encore à la poire et au chocolat. Quasiment tous les fruits ont le droit de \"crumbler\" ! En version salée, on privilégie les légumes, tels la courgette ou le poireau. Le terme crumble signifie littéralement \"tomber en miettes\" en anglais, en référence à son apparence sablée. Une information à partager avec ceux qui goûteront votre savoureux crumble !', '10');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `longtitude` decimal(10,0) DEFAULT NULL,
  `commande_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_livreur_commande1_idx` (`commande_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id`, `nom`, `prenom`, `telephone`, `latitude`, `longtitude`, `commande_id`) VALUES
(1, 'Paige', 'Mario', '0145688646', '46', '4', 2),
(2, 'Hartwig', 'Judith', '0359534298', '45', '4', 1),
(3, 'Perriu', 'Yvonne', '0332606929', '45', '4', 3),
(4, 'Renee', 'Thompson', '0454443722', '45', '4', 4);

-- --------------------------------------------------------

--
-- Structure de la table `plat_jour`
--

DROP TABLE IF EXISTS `plat_jour`;
CREATE TABLE IF NOT EXISTS `plat_jour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_ajout` date DEFAULT NULL,
  `nom_plat_1` varchar(45) DEFAULT NULL,
  `descreption_plat_1` text,
  `prix_plat_1` decimal(10,0) DEFAULT NULL,
  `nom_plat_2` varchar(45) DEFAULT NULL,
  `description_plat_2` text,
  `prix_plat_2` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `plat_jour`
--

INSERT INTO `plat_jour` (`id`, `date_ajout`, `nom_plat_1`, `descreption_plat_1`, `prix_plat_1`, `nom_plat_2`, `description_plat_2`, `prix_plat_2`) VALUES
(1, '2022-05-18', 'Couscous', 'Couscous au grain fines et au légumes délicieux', '14', 'Tajin viande', 'Tajin viande un délice orientale maghrébin au légumes délicieux', '12'),
(2, '2022-05-19', 'La bruschetta', 'La bruschetta est un plat ou antipasto issu de la cuisine italienne dite pauvre. Originaire de Naples et désormais diffuse dans toute l\'Italie et en dehors de ses frontières, elle consiste à agrémenter une tranche de pain, grillée et frottée à l\'ail, de légumes, fromages, charcuteries ou tout autre ingrédient, le tout assaisonné avec les condiments de votre choix et arrosé d\'un filet d\'huile d\'olive .', '10', 'Bouillabaisse traditionnelle', 'Cette recette de poisson était autrefois un plat traditionnel des pêcheurs fait à partir des poissons invendus. Aujourd\'hui, la bouillabaisse marseillaise est un grand classique des plats cuisinés du sud de la France. Cette spécialité régionale mélange les saveurs du grand large et les épices. Il y a comme un air de vacances, vous ne trouvez pas ? ', '14');

-- --------------------------------------------------------

--
-- Structure de la table `status commande`
--

DROP TABLE IF EXISTS `status commande`;
CREATE TABLE IF NOT EXISTS `status commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_commande` varchar(45) DEFAULT NULL,
  `commande_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_status commande_commande1_idx` (`commande_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `status commande`
--

INSERT INTO `status commande` (`id`, `status_commande`, `commande_id`) VALUES
(1, 'Livrée', 1),
(2, 'En livraison', 2),
(3, 'En attente', 3),
(4, 'Anulée', 4);

-- --------------------------------------------------------

--
-- Structure de la table `status livreur`
--

DROP TABLE IF EXISTS `status livreur`;
CREATE TABLE IF NOT EXISTS `status livreur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_livreur` varchar(45) DEFAULT NULL,
  `livreur_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_status livreur_livreur1_idx` (`livreur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `status livreur`
--

INSERT INTO `status livreur` (`id`, `status_livreur`, `livreur_id`) VALUES
(5, 'En livraison', 1),
(6, 'Livrée', 2),
(8, 'En attente', 3),
(9, 'Anulée', 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_adresse_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `fk_commande_dessert_jour1` FOREIGN KEY (`dessert_jour_id`) REFERENCES `dessert_jour` (`id`),
  ADD CONSTRAINT `fk_commande_plat_jour1` FOREIGN KEY (`plat_jour_id`) REFERENCES `plat_jour` (`id`);

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_livreur_commande1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`);

--
-- Contraintes pour la table `status commande`
--
ALTER TABLE `status commande`
  ADD CONSTRAINT `fk_status commande_commande1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`);

--
-- Contraintes pour la table `status livreur`
--
ALTER TABLE `status livreur`
  ADD CONSTRAINT `fk_status livreur_livreur1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
