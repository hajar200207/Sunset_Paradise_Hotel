-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 21 avr. 2024 à 03:33
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `user_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `room_id`, `start_date`, `end_date`, `user_id`) VALUES
(25, 1, '2024-04-22', '2024-04-27', 'hajar123');

--
-- Déclencheurs `reservations`
--
DELIMITER $$
CREATE TRIGGER `update_room_availability` AFTER INSERT ON `reservations` FOR EACH ROW BEGIN
    UPDATE rooms
    SET available = FALSE
    WHERE room_id = NEW.room_id;

    IF NEW.end_date < NOW() THEN
        UPDATE rooms
        SET available = TRUE
        WHERE room_id = NEW.room_id;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_room_availability_delete` AFTER DELETE ON `reservations` FOR EACH ROW BEGIN
    UPDATE rooms
    SET available = TRUE
    WHERE room_id = OLD.room_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `amenities` varchar(255) DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_type`, `price`, `amenities`, `available`, `image`) VALUES
(1, 'Single', 100.00, 'Wi-Fi, TV', 1, 'https://images.trvl-media.com/lodging/1000000/20000/18100/18006/1773862b.jpg?impolicy=resizecrop&rw=1200&ra=fit'),
(4, 'double', 100.00, 'Wi-Fi, TV', 1, 'https://images.trvl-media.com/lodging/1000000/20000/18100/18006/cdeaf315.jpg?impolicy=resizecrop&rw=1200&ra=fit'),
(5, 'Chambre avec vue', 100.00, 'Wi-Fi, TV', 1, 'https://images.trvl-media.com/lodging/1000000/20000/18100/18006/ec9e3f9d.jpg?impolicy=resizecrop&rw=1200&ra=fit'),
(6, 'double', 100.00, 'Wi-Fi, TV', 1,'https://images.trvl-media.com/lodging/18000000/17800000/17793500/17793410/5b407c8b.jpg?impolicy=resizecrop&rw=1200&ra=fit'),
(7, 'suite', 100.00, 'Wi-Fi, TV', 1, 'https://images.trvl-media.com/lodging/18000000/17800000/17793500/17793410/5b407c8b.jpg?impolicy=resizecrop&rw=1200&ra=fit'),
(8, 'Chambre avec vue', 100.00, 'Wi-Fi, TV', 1, 'https://images.trvl-media.com/lodging/18000000/17800000/17793500/17793410/4fd32264.jpg?impolicy=resizecrop&rw=1200&ra=fit'),
(9, 'Chambre avec vue', 100.00, 'Wi-Fi, TV', 1, 'https://images.trvl-media.com/lodging/18000000/17800000/17793500/17793410/8a7b8b41.jpg?impolicy=resizecrop&rw=1200&ra=fit'),
(10, 'Chambre avec vue', 100.00, 'Wi-Fi, TV', 1, 'https://images.trvl-media.com/lodging/1000000/20000/18100/18006/eb9fe8f2.jpg?impolicy=resizecrop&rw=1200&ra=fit'),
(11, 'suite', 120.00, 'Wi-Fi, TV', 1, 'https://images.trvl-media.com/lodging/18000000/17800000/17793500/17793410/310ac6aa.jpg?impolicy=resizecrop&rw=1200&ra=fit');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Index pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
