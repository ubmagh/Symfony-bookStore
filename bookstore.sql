/*
 Navicat Premium Data Transfer

 Source Server         : MyLocalMySQLDB
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 05/07/2022 22:53:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auteur
-- ----------------------------
DROP TABLE IF EXISTS `auteur`;
CREATE TABLE `auteur`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_prenom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_de_naissance` date NOT NULL,
  `nationalite` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQ_55AB14026EA0B0C`(`nom_prenom` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auteur
-- ----------------------------
INSERT INTO `auteur` VALUES (1, 'Zelda Little MD', 'F', '1980-01-17', 'AO', 'https://via.placeholder.com/300x600.png/0055ff?text=people+animi', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (2, 'Yazmin Pollich', 'F', '1979-10-17', 'NZ', 'https://via.placeholder.com/300x600.png/00ff33?text=people+sunt', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (3, 'Adolph Terry', 'M', '1979-01-12', 'ME', 'https://via.placeholder.com/300x600.png/00dddd?text=people+ipsum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (4, 'Dariana Johnson', 'F', '1971-03-23', 'GW', 'https://via.placeholder.com/300x600.png/00ccff?text=people+at', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (5, 'Andre Lemke', 'M', '1965-07-25', 'RO', 'https://via.placeholder.com/300x600.png/00aa66?text=people+qui', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (6, 'Melvina Stehr', 'M', '1950-03-27', 'UY', 'https://via.placeholder.com/300x600.png/00aaee?text=people+dolor', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (7, 'Mylene Senger', 'F', '2012-01-26', 'IE', 'https://via.placeholder.com/300x600.png/00aacc?text=people+eveniet', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (8, 'Dr. Lelia Hessel MD', 'F', '1978-04-03', 'BD', 'https://via.placeholder.com/300x600.png/0055dd?text=people+provident', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (9, 'Ebba Quigley', 'F', '1911-10-06', 'VN', 'https://via.placeholder.com/300x600.png/0033bb?text=people+quibusdam', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (10, 'Ms. Herminia Schroeder', 'F', '1889-11-25', 'MF', 'https://via.placeholder.com/300x600.png/0000cc?text=people+at', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (11, 'Dr. Lora Spinka V', 'F', '1923-03-22', 'OM', 'https://via.placeholder.com/300x600.png/006666?text=people+voluptatum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (12, 'Hannah Wilkinson', 'F', '1894-09-25', 'EH', 'https://via.placeholder.com/300x600.png/004499?text=people+minus', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (13, 'Bailey Lebsack Jr.', 'M', '1903-03-15', 'TL', 'https://via.placeholder.com/300x600.png/00bb44?text=people+eum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (14, 'Trever Predovic', 'M', '2003-12-04', 'DZ', 'https://via.placeholder.com/300x600.png/0000aa?text=people+inventore', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (15, 'Bianka Eichmann', 'F', '1969-06-16', 'LI', 'https://via.placeholder.com/300x600.png/00cc33?text=people+dolore', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (16, 'Junior Glover', 'M', '1895-06-07', 'JM', 'https://via.placeholder.com/300x600.png/0000cc?text=people+minus', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (17, 'Velma Grimes', 'F', '1880-03-28', 'VA', 'https://via.placeholder.com/300x600.png/0055aa?text=people+sit', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (18, 'Prof. Karley Bechtelar', 'M', '1936-05-23', 'AO', 'https://via.placeholder.com/300x600.png/00ee99?text=people+iste', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (19, 'Fredy Bernier', 'M', '1879-07-01', 'VG', 'https://via.placeholder.com/300x600.png/0055ff?text=people+in', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (20, 'Braulio Becker', 'M', '1881-04-12', 'AM', 'https://via.placeholder.com/300x600.png/003366?text=people+aliquid', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (21, 'Olaf Glover', 'M', '2009-05-20', 'BT', 'https://via.placeholder.com/300x600.png/00eeff?text=people+sed', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (22, 'Dr. Matteo Turcotte Sr.', 'M', '1990-12-02', 'CZ', 'https://via.placeholder.com/300x600.png/000011?text=people+culpa', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (23, 'Prof. Kallie Frami', 'F', '1935-09-27', 'TO', 'https://via.placeholder.com/300x600.png/00aa11?text=people+praesentium', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (24, 'Claude Gottlieb MD', 'M', '1910-02-19', 'CY', 'https://via.placeholder.com/300x600.png/00aa22?text=people+voluptatibus', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `auteur` VALUES (25, 'Mariane Treutel', 'F', '1961-05-01', 'TR', 'https://via.placeholder.com/300x600.png/0033ee?text=people+exercitationem', '2022-07-05 23:27:08', '2022-07-05 23:27:08');

-- ----------------------------
-- Table structure for auteur_livre
-- ----------------------------
DROP TABLE IF EXISTS `auteur_livre`;
CREATE TABLE `auteur_livre`  (
  `auteur_id` int NOT NULL,
  `livre_id` int NOT NULL,
  PRIMARY KEY (`auteur_id`, `livre_id`) USING BTREE,
  INDEX `IDX_A6DFA5E060BB6FE6`(`auteur_id` ASC) USING BTREE,
  INDEX `IDX_A6DFA5E037D925CB`(`livre_id` ASC) USING BTREE,
  CONSTRAINT `FK_A6DFA5E037D925CB` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_A6DFA5E060BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auteur_livre
-- ----------------------------
INSERT INTO `auteur_livre` VALUES (1, 20);
INSERT INTO `auteur_livre` VALUES (1, 29);
INSERT INTO `auteur_livre` VALUES (1, 41);
INSERT INTO `auteur_livre` VALUES (2, 4);
INSERT INTO `auteur_livre` VALUES (2, 8);
INSERT INTO `auteur_livre` VALUES (2, 13);
INSERT INTO `auteur_livre` VALUES (2, 29);
INSERT INTO `auteur_livre` VALUES (2, 36);
INSERT INTO `auteur_livre` VALUES (2, 48);
INSERT INTO `auteur_livre` VALUES (3, 33);
INSERT INTO `auteur_livre` VALUES (4, 1);
INSERT INTO `auteur_livre` VALUES (4, 3);
INSERT INTO `auteur_livre` VALUES (4, 21);
INSERT INTO `auteur_livre` VALUES (4, 22);
INSERT INTO `auteur_livre` VALUES (5, 22);
INSERT INTO `auteur_livre` VALUES (5, 29);
INSERT INTO `auteur_livre` VALUES (5, 32);
INSERT INTO `auteur_livre` VALUES (5, 59);
INSERT INTO `auteur_livre` VALUES (6, 9);
INSERT INTO `auteur_livre` VALUES (6, 11);
INSERT INTO `auteur_livre` VALUES (6, 12);
INSERT INTO `auteur_livre` VALUES (6, 19);
INSERT INTO `auteur_livre` VALUES (6, 38);
INSERT INTO `auteur_livre` VALUES (6, 51);
INSERT INTO `auteur_livre` VALUES (7, 1);
INSERT INTO `auteur_livre` VALUES (7, 12);
INSERT INTO `auteur_livre` VALUES (7, 39);
INSERT INTO `auteur_livre` VALUES (7, 40);
INSERT INTO `auteur_livre` VALUES (7, 47);
INSERT INTO `auteur_livre` VALUES (8, 44);
INSERT INTO `auteur_livre` VALUES (8, 58);
INSERT INTO `auteur_livre` VALUES (9, 10);
INSERT INTO `auteur_livre` VALUES (9, 17);
INSERT INTO `auteur_livre` VALUES (9, 24);
INSERT INTO `auteur_livre` VALUES (9, 27);
INSERT INTO `auteur_livre` VALUES (9, 58);
INSERT INTO `auteur_livre` VALUES (10, 13);
INSERT INTO `auteur_livre` VALUES (10, 14);
INSERT INTO `auteur_livre` VALUES (10, 17);
INSERT INTO `auteur_livre` VALUES (10, 36);
INSERT INTO `auteur_livre` VALUES (10, 44);
INSERT INTO `auteur_livre` VALUES (10, 46);
INSERT INTO `auteur_livre` VALUES (10, 52);
INSERT INTO `auteur_livre` VALUES (10, 60);
INSERT INTO `auteur_livre` VALUES (11, 7);
INSERT INTO `auteur_livre` VALUES (11, 8);
INSERT INTO `auteur_livre` VALUES (11, 21);
INSERT INTO `auteur_livre` VALUES (11, 28);
INSERT INTO `auteur_livre` VALUES (11, 33);
INSERT INTO `auteur_livre` VALUES (11, 39);
INSERT INTO `auteur_livre` VALUES (11, 49);
INSERT INTO `auteur_livre` VALUES (11, 52);
INSERT INTO `auteur_livre` VALUES (12, 2);
INSERT INTO `auteur_livre` VALUES (12, 4);
INSERT INTO `auteur_livre` VALUES (12, 10);
INSERT INTO `auteur_livre` VALUES (12, 28);
INSERT INTO `auteur_livre` VALUES (12, 41);
INSERT INTO `auteur_livre` VALUES (13, 16);
INSERT INTO `auteur_livre` VALUES (13, 23);
INSERT INTO `auteur_livre` VALUES (13, 30);
INSERT INTO `auteur_livre` VALUES (13, 37);
INSERT INTO `auteur_livre` VALUES (13, 45);
INSERT INTO `auteur_livre` VALUES (13, 51);
INSERT INTO `auteur_livre` VALUES (14, 19);
INSERT INTO `auteur_livre` VALUES (14, 58);
INSERT INTO `auteur_livre` VALUES (14, 60);
INSERT INTO `auteur_livre` VALUES (15, 15);
INSERT INTO `auteur_livre` VALUES (15, 24);
INSERT INTO `auteur_livre` VALUES (15, 35);
INSERT INTO `auteur_livre` VALUES (15, 46);
INSERT INTO `auteur_livre` VALUES (15, 50);
INSERT INTO `auteur_livre` VALUES (16, 33);
INSERT INTO `auteur_livre` VALUES (16, 43);
INSERT INTO `auteur_livre` VALUES (16, 51);
INSERT INTO `auteur_livre` VALUES (16, 54);
INSERT INTO `auteur_livre` VALUES (16, 56);
INSERT INTO `auteur_livre` VALUES (17, 2);
INSERT INTO `auteur_livre` VALUES (17, 18);
INSERT INTO `auteur_livre` VALUES (17, 47);
INSERT INTO `auteur_livre` VALUES (17, 60);
INSERT INTO `auteur_livre` VALUES (18, 30);
INSERT INTO `auteur_livre` VALUES (18, 31);
INSERT INTO `auteur_livre` VALUES (18, 39);
INSERT INTO `auteur_livre` VALUES (18, 42);
INSERT INTO `auteur_livre` VALUES (19, 2);
INSERT INTO `auteur_livre` VALUES (19, 8);
INSERT INTO `auteur_livre` VALUES (19, 16);
INSERT INTO `auteur_livre` VALUES (19, 19);
INSERT INTO `auteur_livre` VALUES (19, 38);
INSERT INTO `auteur_livre` VALUES (19, 46);
INSERT INTO `auteur_livre` VALUES (19, 57);
INSERT INTO `auteur_livre` VALUES (20, 11);
INSERT INTO `auteur_livre` VALUES (20, 15);
INSERT INTO `auteur_livre` VALUES (20, 25);
INSERT INTO `auteur_livre` VALUES (21, 9);
INSERT INTO `auteur_livre` VALUES (21, 20);
INSERT INTO `auteur_livre` VALUES (21, 32);
INSERT INTO `auteur_livre` VALUES (21, 35);
INSERT INTO `auteur_livre` VALUES (21, 48);
INSERT INTO `auteur_livre` VALUES (22, 5);
INSERT INTO `auteur_livre` VALUES (22, 11);
INSERT INTO `auteur_livre` VALUES (22, 21);
INSERT INTO `auteur_livre` VALUES (22, 23);
INSERT INTO `auteur_livre` VALUES (22, 25);
INSERT INTO `auteur_livre` VALUES (22, 27);
INSERT INTO `auteur_livre` VALUES (22, 34);
INSERT INTO `auteur_livre` VALUES (22, 41);
INSERT INTO `auteur_livre` VALUES (23, 3);
INSERT INTO `auteur_livre` VALUES (23, 6);
INSERT INTO `auteur_livre` VALUES (23, 13);
INSERT INTO `auteur_livre` VALUES (23, 28);
INSERT INTO `auteur_livre` VALUES (23, 43);
INSERT INTO `auteur_livre` VALUES (23, 55);
INSERT INTO `auteur_livre` VALUES (24, 15);
INSERT INTO `auteur_livre` VALUES (24, 16);
INSERT INTO `auteur_livre` VALUES (24, 17);
INSERT INTO `auteur_livre` VALUES (24, 22);
INSERT INTO `auteur_livre` VALUES (24, 30);
INSERT INTO `auteur_livre` VALUES (24, 53);
INSERT INTO `auteur_livre` VALUES (25, 26);
INSERT INTO `auteur_livre` VALUES (25, 50);
INSERT INTO `auteur_livre` VALUES (25, 57);

-- ----------------------------
-- Table structure for doctrine_migration_versions
-- ----------------------------
DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions`  (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime NULL DEFAULT NULL,
  `execution_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctrine_migration_versions
-- ----------------------------
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20220119134553', '2022-07-05 23:25:50', 363);

-- ----------------------------
-- Table structure for genre
-- ----------------------------
DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQ_835033F86C6E55B5`(`nom` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of genre
-- ----------------------------
INSERT INTO `genre` VALUES (1, 'Genre 1', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (2, 'Genre 2', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (3, 'Genre 3', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (4, 'Genre 4', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (5, 'Genre 5', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (6, 'Genre 6', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (7, 'Genre 7', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (8, 'Genre 8', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (9, 'Genre 9', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (10, 'Genre 10', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (11, 'Genre 11', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (12, 'Genre 12', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (13, 'Genre 13', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (14, 'Genre 14', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `genre` VALUES (15, 'Genre 15', '2022-07-05 23:27:08', '2022-07-05 23:27:08');

-- ----------------------------
-- Table structure for livre
-- ----------------------------
DROP TABLE IF EXISTS `livre`;
CREATE TABLE `livre`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `isbn` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `titre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_pages` int NOT NULL,
  `date_de_parution` date NOT NULL,
  `note` smallint NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQ_AC634F99CC1CF4E6`(`isbn` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of livre
-- ----------------------------
INSERT INTO `livre` VALUES (1, '9788875968762', 'Molestias et aut optio et.', 276, '1904-01-05', 3, 'https://via.placeholder.com/500x900.png/00cc66?text=abstract+ut', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (2, '9781451952056', 'Animi aperiam dolorem quidem et soluta impedit.', 1361, '1900-02-05', 9, 'https://via.placeholder.com/500x900.png/00cccc?text=abstract+vero', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (3, '9799238435821', 'Debitis inventore sit eum quae eveniet quis.', 1857, '1975-07-05', 6, 'https://via.placeholder.com/500x900.png/00aa99?text=abstract+quidem', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (4, '9780881385571', 'Corrupti nemo fugiat ut et veniam commodi.', 1768, '1960-04-24', 18, 'https://via.placeholder.com/500x900.png/000011?text=abstract+laborum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (5, '9781574181883', 'Sint hic sed culpa iusto rerum excepturi saepe non.', 2722, '1977-11-24', 17, 'https://via.placeholder.com/500x900.png/002211?text=abstract+voluptatum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (6, '9783920963877', 'Voluptatibus blanditiis aut et.', 2443, '1900-11-02', 13, 'https://via.placeholder.com/500x900.png/002288?text=abstract+incidunt', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (7, '9791065078493', 'Aliquam dolores temporibus officiis esse est voluptas.', 2479, '1900-03-09', 17, 'https://via.placeholder.com/500x900.png/009988?text=abstract+cumque', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (8, '9787752735145', 'Quas qui recusandae voluptas.', 1088, '1929-07-28', 12, 'https://via.placeholder.com/500x900.png/003399?text=abstract+vel', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (9, '9785386088422', 'Fugit totam sunt similique et dolores.', 1759, '1903-11-15', 9, 'https://via.placeholder.com/500x900.png/00aaaa?text=abstract+amet', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (10, '9780993824074', 'Quisquam vitae reprehenderit natus.', 639, '1942-09-10', 8, 'https://via.placeholder.com/500x900.png/00ee11?text=abstract+aliquam', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (11, '9786086589585', 'Maiores alias iusto vel quo aut omnis aut.', 244, '1900-12-26', 2, 'https://via.placeholder.com/500x900.png/002277?text=abstract+laboriosam', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (12, '9790883937692', 'Rerum consequatur molestiae sit necessitatibus suscipit.', 705, '1972-09-28', 1, 'https://via.placeholder.com/500x900.png/007733?text=abstract+vitae', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (13, '9780007595358', 'Ullam ut tempora ipsam ut eveniet doloribus est.', 96, '1983-04-12', 0, 'https://via.placeholder.com/500x900.png/00dd33?text=abstract+eos', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (14, '9790995221948', 'Quidem minima illo sit consequatur eius autem quas.', 255, '1992-03-16', 7, 'https://via.placeholder.com/500x900.png/0011ee?text=abstract+repellat', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (15, '9788075635594', 'Earum qui ducimus expedita aut officiis.', 1295, '1923-08-01', 8, 'https://via.placeholder.com/500x900.png/008811?text=abstract+ipsa', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (16, '9791952821379', 'Ex aliquid nihil dolor nihil aspernatur delectus autem.', 2183, '1973-05-14', 11, 'https://via.placeholder.com/500x900.png/009988?text=abstract+possimus', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (17, '9796588912323', 'Soluta ut sit amet amet.', 1244, '2017-10-21', 7, 'https://via.placeholder.com/500x900.png/0022bb?text=abstract+harum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (18, '9795254519088', 'Deleniti ut minus quis eaque nostrum.', 1763, '1938-12-03', 4, 'https://via.placeholder.com/500x900.png/00eeee?text=abstract+voluptas', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (19, '9797654848911', 'Rerum est dolorem veniam voluptas beatae libero tempore.', 625, '1923-04-21', 19, 'https://via.placeholder.com/500x900.png/0000ff?text=abstract+dolor', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (20, '9791610224504', 'Et dolorum dicta ad sit earum.', 2555, '2014-05-30', 6, 'https://via.placeholder.com/500x900.png/0055bb?text=abstract+laborum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (21, '9787216836777', 'Ut repellendus deserunt qui numquam in.', 1133, '1998-08-29', 20, 'https://via.placeholder.com/500x900.png/00aadd?text=abstract+cum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (22, '9795444545378', 'Quisquam aut voluptatem culpa unde officiis consectetur.', 2256, '1935-08-16', 18, 'https://via.placeholder.com/500x900.png/004433?text=abstract+adipisci', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (23, '9798567822753', 'Soluta perferendis laborum sit repellendus saepe.', 1212, '1920-05-14', 16, 'https://via.placeholder.com/500x900.png/005533?text=abstract+dolorem', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (24, '9795302920606', 'Vel quas fugiat voluptatem ullam animi vitae.', 977, '1999-12-12', 16, 'https://via.placeholder.com/500x900.png/0066bb?text=abstract+voluptatem', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (25, '9795835987619', 'Consequatur et dolorem aut unde tempora est non.', 1368, '2009-05-14', 10, 'https://via.placeholder.com/500x900.png/00ccff?text=abstract+nihil', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (26, '9795516081773', 'Ut quas consequatur sed et totam hic ab.', 898, '1951-09-04', 17, 'https://via.placeholder.com/500x900.png/001199?text=abstract+laboriosam', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (27, '9792021280240', 'Asperiores nostrum dolorum laborum ratione quasi sint reprehenderit.', 2691, '1978-01-17', 20, 'https://via.placeholder.com/500x900.png/00eedd?text=abstract+omnis', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (28, '9792413236336', 'Expedita saepe velit iusto.', 2102, '1982-01-16', 6, 'https://via.placeholder.com/500x900.png/00aa11?text=abstract+quia', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (29, '9788864709369', 'Aut accusantium molestiae repellat et assumenda inventore ut.', 85, '1937-05-10', 0, 'https://via.placeholder.com/500x900.png/005522?text=abstract+facere', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (30, '9796791669892', 'Velit enim magnam id.', 2655, '1924-04-22', 13, 'https://via.placeholder.com/500x900.png/00eeaa?text=abstract+aut', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (31, '9781997137023', 'Nihil veritatis ut blanditiis molestiae.', 1710, '1910-03-23', 18, 'https://via.placeholder.com/500x900.png/0088ff?text=abstract+recusandae', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (32, '9798236813600', 'Dolorem porro aliquam ea nulla quidem.', 1687, '1978-01-24', 8, 'https://via.placeholder.com/500x900.png/003366?text=abstract+repudiandae', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (33, '9797086621663', 'Tempore quia consequuntur aut dolor delectus voluptatem reiciendis.', 2051, '2002-11-26', 12, 'https://via.placeholder.com/500x900.png/002255?text=abstract+qui', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (34, '9798425302489', 'Expedita sint rem est ab dolorem quo.', 2578, '1976-06-08', 13, 'https://via.placeholder.com/500x900.png/0088aa?text=abstract+ad', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (35, '9783650655141', 'Eos est minima autem reprehenderit reprehenderit hic.', 2483, '1935-12-08', 0, 'https://via.placeholder.com/500x900.png/00ee11?text=abstract+et', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (36, '9789426608960', 'Corrupti cumque aliquid et expedita.', 263, '1971-10-05', 2, 'https://via.placeholder.com/500x900.png/006677?text=abstract+beatae', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (37, '9793038761449', 'Dicta eum architecto fugiat sit dolor ratione perspiciatis.', 2259, '1910-09-22', 15, 'https://via.placeholder.com/500x900.png/005577?text=abstract+ipsa', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (38, '9781416897095', 'Cum sapiente laudantium doloremque exercitationem aliquid ipsa.', 1514, '1963-04-09', 7, 'https://via.placeholder.com/500x900.png/005533?text=abstract+maiores', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (39, '9790286938012', 'Inventore qui eaque quisquam perferendis quasi eum assumenda.', 2821, '2018-09-13', 8, 'https://via.placeholder.com/500x900.png/00dddd?text=abstract+ut', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (40, '9789336650806', 'Iusto aut nobis facere mollitia quo modi.', 2275, '1932-03-22', 2, 'https://via.placeholder.com/500x900.png/00ee22?text=abstract+cum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (41, '9796815407721', 'Autem vitae omnis sit praesentium praesentium quod.', 466, '1925-09-21', 19, 'https://via.placeholder.com/500x900.png/00bb33?text=abstract+at', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (42, '9785766483656', 'Libero fuga dolor eius sit.', 1001, '1974-12-08', 6, 'https://via.placeholder.com/500x900.png/007788?text=abstract+et', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (43, '9786962195060', 'Reprehenderit voluptas qui harum quos quos nulla expedita ea.', 1090, '1981-11-17', 4, 'https://via.placeholder.com/500x900.png/002288?text=abstract+qui', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (44, '9784555937073', 'Dolor voluptatem voluptatem non quia molestias omnis.', 698, '1915-12-21', 10, 'https://via.placeholder.com/500x900.png/0077bb?text=abstract+qui', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (45, '9787561063972', 'Qui expedita vel consectetur et.', 629, '1972-06-02', 9, 'https://via.placeholder.com/500x900.png/00ccaa?text=abstract+expedita', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (46, '9786580841356', 'Non ipsum maiores ea totam labore laudantium enim.', 1682, '1999-08-27', 13, 'https://via.placeholder.com/500x900.png/00bbbb?text=abstract+id', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (47, '9794915786722', 'Non eum nobis consequatur.', 2530, '1938-09-10', 12, 'https://via.placeholder.com/500x900.png/00eeee?text=abstract+consequatur', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (48, '9793439813181', 'Aut nemo omnis velit modi magnam praesentium.', 84, '1959-03-18', 11, 'https://via.placeholder.com/500x900.png/0000bb?text=abstract+sint', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (49, '9799058533516', 'Omnis dolore quibusdam rerum nihil ut eligendi qui vel.', 1021, '1999-10-07', 17, 'https://via.placeholder.com/500x900.png/0066bb?text=abstract+rerum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (50, '9787408778526', 'Dolores aut voluptatem eaque saepe.', 2023, '2004-10-27', 2, 'https://via.placeholder.com/500x900.png/00ccaa?text=abstract+iusto', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (51, '9784961211828', 'Corporis ut maiores totam deserunt modi.', 1618, '2005-07-06', 16, 'https://via.placeholder.com/500x900.png/00aa55?text=abstract+quaerat', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (52, '9791914999511', 'Est fugit corporis hic ea quae.', 170, '1950-05-27', 0, 'https://via.placeholder.com/500x900.png/00aa22?text=abstract+et', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (53, '9781834464176', 'Quod rerum deserunt distinctio aut ipsa voluptate ea.', 2348, '1992-07-02', 11, 'https://via.placeholder.com/500x900.png/0000cc?text=abstract+minus', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (54, '9793676178036', 'Delectus pariatur vitae quod inventore.', 2285, '2016-03-16', 17, 'https://via.placeholder.com/500x900.png/00dddd?text=abstract+dicta', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (55, '9786968809534', 'Autem omnis nesciunt numquam rerum quis pariatur.', 1292, '1931-03-09', 6, 'https://via.placeholder.com/500x900.png/00ff99?text=abstract+aut', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (56, '9789533271248', 'Quos quam officiis aut quia nisi.', 2589, '1957-04-04', 0, 'https://via.placeholder.com/500x900.png/007788?text=abstract+qui', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (57, '9791169235600', 'Sunt dignissimos nemo deserunt qui illo aut voluptates aut.', 1183, '1945-08-26', 8, 'https://via.placeholder.com/500x900.png/001111?text=abstract+labore', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (58, '9782050142978', 'Aut omnis saepe error qui ea quasi.', 942, '1909-10-13', 13, 'https://via.placeholder.com/500x900.png/00aa66?text=abstract+quisquam', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (59, '9782413942801', 'Et autem sed autem.', 1865, '1906-12-26', 12, 'https://via.placeholder.com/500x900.png/002277?text=abstract+earum', '2022-07-05 23:27:08', '2022-07-05 23:27:08');
INSERT INTO `livre` VALUES (60, '9784217176918', 'Non illo ratione quasi voluptate adipisci.', 586, '2007-12-13', 1, 'https://via.placeholder.com/500x900.png/00ff99?text=abstract+et', '2022-07-05 23:27:08', '2022-07-05 23:27:08');

-- ----------------------------
-- Table structure for livre_auteur
-- ----------------------------
DROP TABLE IF EXISTS `livre_auteur`;
CREATE TABLE `livre_auteur`  (
  `livre_id` int NOT NULL,
  `auteur_id` int NOT NULL,
  PRIMARY KEY (`livre_id`, `auteur_id`) USING BTREE,
  INDEX `IDX_A11876B537D925CB`(`livre_id` ASC) USING BTREE,
  INDEX `IDX_A11876B560BB6FE6`(`auteur_id` ASC) USING BTREE,
  CONSTRAINT `FK_A11876B537D925CB` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_A11876B560BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of livre_auteur
-- ----------------------------
INSERT INTO `livre_auteur` VALUES (1, 4);
INSERT INTO `livre_auteur` VALUES (1, 7);
INSERT INTO `livre_auteur` VALUES (2, 12);
INSERT INTO `livre_auteur` VALUES (2, 17);
INSERT INTO `livre_auteur` VALUES (2, 19);
INSERT INTO `livre_auteur` VALUES (3, 4);
INSERT INTO `livre_auteur` VALUES (3, 23);
INSERT INTO `livre_auteur` VALUES (4, 2);
INSERT INTO `livre_auteur` VALUES (4, 12);
INSERT INTO `livre_auteur` VALUES (5, 22);
INSERT INTO `livre_auteur` VALUES (6, 23);
INSERT INTO `livre_auteur` VALUES (7, 11);
INSERT INTO `livre_auteur` VALUES (8, 2);
INSERT INTO `livre_auteur` VALUES (8, 11);
INSERT INTO `livre_auteur` VALUES (8, 19);
INSERT INTO `livre_auteur` VALUES (9, 6);
INSERT INTO `livre_auteur` VALUES (9, 21);
INSERT INTO `livre_auteur` VALUES (10, 9);
INSERT INTO `livre_auteur` VALUES (10, 12);
INSERT INTO `livre_auteur` VALUES (11, 6);
INSERT INTO `livre_auteur` VALUES (11, 20);
INSERT INTO `livre_auteur` VALUES (11, 22);
INSERT INTO `livre_auteur` VALUES (12, 6);
INSERT INTO `livre_auteur` VALUES (12, 7);
INSERT INTO `livre_auteur` VALUES (13, 2);
INSERT INTO `livre_auteur` VALUES (13, 10);
INSERT INTO `livre_auteur` VALUES (13, 23);
INSERT INTO `livre_auteur` VALUES (14, 10);
INSERT INTO `livre_auteur` VALUES (15, 15);
INSERT INTO `livre_auteur` VALUES (15, 20);
INSERT INTO `livre_auteur` VALUES (15, 24);
INSERT INTO `livre_auteur` VALUES (16, 13);
INSERT INTO `livre_auteur` VALUES (16, 19);
INSERT INTO `livre_auteur` VALUES (16, 24);
INSERT INTO `livre_auteur` VALUES (17, 9);
INSERT INTO `livre_auteur` VALUES (17, 10);
INSERT INTO `livre_auteur` VALUES (17, 24);
INSERT INTO `livre_auteur` VALUES (18, 17);
INSERT INTO `livre_auteur` VALUES (19, 6);
INSERT INTO `livre_auteur` VALUES (19, 14);
INSERT INTO `livre_auteur` VALUES (19, 19);
INSERT INTO `livre_auteur` VALUES (20, 1);
INSERT INTO `livre_auteur` VALUES (20, 21);
INSERT INTO `livre_auteur` VALUES (21, 4);
INSERT INTO `livre_auteur` VALUES (21, 11);
INSERT INTO `livre_auteur` VALUES (21, 22);
INSERT INTO `livre_auteur` VALUES (22, 4);
INSERT INTO `livre_auteur` VALUES (22, 5);
INSERT INTO `livre_auteur` VALUES (22, 24);
INSERT INTO `livre_auteur` VALUES (23, 13);
INSERT INTO `livre_auteur` VALUES (23, 22);
INSERT INTO `livre_auteur` VALUES (24, 9);
INSERT INTO `livre_auteur` VALUES (24, 15);
INSERT INTO `livre_auteur` VALUES (25, 20);
INSERT INTO `livre_auteur` VALUES (25, 22);
INSERT INTO `livre_auteur` VALUES (26, 25);
INSERT INTO `livre_auteur` VALUES (27, 9);
INSERT INTO `livre_auteur` VALUES (27, 22);
INSERT INTO `livre_auteur` VALUES (28, 11);
INSERT INTO `livre_auteur` VALUES (28, 12);
INSERT INTO `livre_auteur` VALUES (28, 23);
INSERT INTO `livre_auteur` VALUES (29, 1);
INSERT INTO `livre_auteur` VALUES (29, 2);
INSERT INTO `livre_auteur` VALUES (29, 5);
INSERT INTO `livre_auteur` VALUES (30, 13);
INSERT INTO `livre_auteur` VALUES (30, 18);
INSERT INTO `livre_auteur` VALUES (30, 24);
INSERT INTO `livre_auteur` VALUES (31, 18);
INSERT INTO `livre_auteur` VALUES (32, 5);
INSERT INTO `livre_auteur` VALUES (32, 21);
INSERT INTO `livre_auteur` VALUES (33, 3);
INSERT INTO `livre_auteur` VALUES (33, 11);
INSERT INTO `livre_auteur` VALUES (33, 16);
INSERT INTO `livre_auteur` VALUES (34, 22);
INSERT INTO `livre_auteur` VALUES (35, 15);
INSERT INTO `livre_auteur` VALUES (35, 21);
INSERT INTO `livre_auteur` VALUES (36, 2);
INSERT INTO `livre_auteur` VALUES (36, 10);
INSERT INTO `livre_auteur` VALUES (37, 13);
INSERT INTO `livre_auteur` VALUES (38, 6);
INSERT INTO `livre_auteur` VALUES (38, 19);
INSERT INTO `livre_auteur` VALUES (39, 7);
INSERT INTO `livre_auteur` VALUES (39, 11);
INSERT INTO `livre_auteur` VALUES (39, 18);
INSERT INTO `livre_auteur` VALUES (40, 7);
INSERT INTO `livre_auteur` VALUES (41, 1);
INSERT INTO `livre_auteur` VALUES (41, 12);
INSERT INTO `livre_auteur` VALUES (41, 22);
INSERT INTO `livre_auteur` VALUES (42, 18);
INSERT INTO `livre_auteur` VALUES (43, 16);
INSERT INTO `livre_auteur` VALUES (43, 23);
INSERT INTO `livre_auteur` VALUES (44, 8);
INSERT INTO `livre_auteur` VALUES (44, 10);
INSERT INTO `livre_auteur` VALUES (45, 13);
INSERT INTO `livre_auteur` VALUES (46, 10);
INSERT INTO `livre_auteur` VALUES (46, 15);
INSERT INTO `livre_auteur` VALUES (46, 19);
INSERT INTO `livre_auteur` VALUES (47, 7);
INSERT INTO `livre_auteur` VALUES (47, 17);
INSERT INTO `livre_auteur` VALUES (48, 2);
INSERT INTO `livre_auteur` VALUES (48, 21);
INSERT INTO `livre_auteur` VALUES (49, 11);
INSERT INTO `livre_auteur` VALUES (50, 15);
INSERT INTO `livre_auteur` VALUES (50, 25);
INSERT INTO `livre_auteur` VALUES (51, 6);
INSERT INTO `livre_auteur` VALUES (51, 13);
INSERT INTO `livre_auteur` VALUES (51, 16);
INSERT INTO `livre_auteur` VALUES (52, 10);
INSERT INTO `livre_auteur` VALUES (52, 11);
INSERT INTO `livre_auteur` VALUES (53, 24);
INSERT INTO `livre_auteur` VALUES (54, 16);
INSERT INTO `livre_auteur` VALUES (55, 23);
INSERT INTO `livre_auteur` VALUES (56, 16);
INSERT INTO `livre_auteur` VALUES (57, 19);
INSERT INTO `livre_auteur` VALUES (57, 25);
INSERT INTO `livre_auteur` VALUES (58, 8);
INSERT INTO `livre_auteur` VALUES (58, 9);
INSERT INTO `livre_auteur` VALUES (58, 14);
INSERT INTO `livre_auteur` VALUES (59, 5);
INSERT INTO `livre_auteur` VALUES (60, 10);
INSERT INTO `livre_auteur` VALUES (60, 14);
INSERT INTO `livre_auteur` VALUES (60, 17);

-- ----------------------------
-- Table structure for livre_genre
-- ----------------------------
DROP TABLE IF EXISTS `livre_genre`;
CREATE TABLE `livre_genre`  (
  `livre_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`livre_id`, `genre_id`) USING BTREE,
  INDEX `IDX_1053AB9E37D925CB`(`livre_id` ASC) USING BTREE,
  INDEX `IDX_1053AB9E4296D31F`(`genre_id` ASC) USING BTREE,
  CONSTRAINT `FK_1053AB9E37D925CB` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_1053AB9E4296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of livre_genre
-- ----------------------------
INSERT INTO `livre_genre` VALUES (1, 11);
INSERT INTO `livre_genre` VALUES (2, 10);
INSERT INTO `livre_genre` VALUES (2, 13);
INSERT INTO `livre_genre` VALUES (3, 5);
INSERT INTO `livre_genre` VALUES (3, 6);
INSERT INTO `livre_genre` VALUES (4, 8);
INSERT INTO `livre_genre` VALUES (5, 5);
INSERT INTO `livre_genre` VALUES (5, 14);
INSERT INTO `livre_genre` VALUES (6, 7);
INSERT INTO `livre_genre` VALUES (7, 1);
INSERT INTO `livre_genre` VALUES (7, 9);
INSERT INTO `livre_genre` VALUES (7, 12);
INSERT INTO `livre_genre` VALUES (8, 7);
INSERT INTO `livre_genre` VALUES (8, 8);
INSERT INTO `livre_genre` VALUES (9, 6);
INSERT INTO `livre_genre` VALUES (9, 10);
INSERT INTO `livre_genre` VALUES (10, 5);
INSERT INTO `livre_genre` VALUES (11, 9);
INSERT INTO `livre_genre` VALUES (11, 11);
INSERT INTO `livre_genre` VALUES (12, 2);
INSERT INTO `livre_genre` VALUES (12, 7);
INSERT INTO `livre_genre` VALUES (13, 3);
INSERT INTO `livre_genre` VALUES (13, 7);
INSERT INTO `livre_genre` VALUES (13, 14);
INSERT INTO `livre_genre` VALUES (14, 2);
INSERT INTO `livre_genre` VALUES (15, 1);
INSERT INTO `livre_genre` VALUES (16, 12);
INSERT INTO `livre_genre` VALUES (17, 8);
INSERT INTO `livre_genre` VALUES (17, 12);
INSERT INTO `livre_genre` VALUES (18, 8);
INSERT INTO `livre_genre` VALUES (18, 10);
INSERT INTO `livre_genre` VALUES (18, 11);
INSERT INTO `livre_genre` VALUES (19, 7);
INSERT INTO `livre_genre` VALUES (19, 11);
INSERT INTO `livre_genre` VALUES (20, 3);
INSERT INTO `livre_genre` VALUES (20, 6);
INSERT INTO `livre_genre` VALUES (20, 8);
INSERT INTO `livre_genre` VALUES (21, 7);
INSERT INTO `livre_genre` VALUES (22, 10);
INSERT INTO `livre_genre` VALUES (22, 11);
INSERT INTO `livre_genre` VALUES (22, 12);
INSERT INTO `livre_genre` VALUES (23, 1);
INSERT INTO `livre_genre` VALUES (23, 6);
INSERT INTO `livre_genre` VALUES (23, 8);
INSERT INTO `livre_genre` VALUES (24, 1);
INSERT INTO `livre_genre` VALUES (24, 2);
INSERT INTO `livre_genre` VALUES (24, 13);
INSERT INTO `livre_genre` VALUES (25, 1);
INSERT INTO `livre_genre` VALUES (25, 5);
INSERT INTO `livre_genre` VALUES (25, 8);
INSERT INTO `livre_genre` VALUES (26, 5);
INSERT INTO `livre_genre` VALUES (26, 10);
INSERT INTO `livre_genre` VALUES (27, 5);
INSERT INTO `livre_genre` VALUES (27, 10);
INSERT INTO `livre_genre` VALUES (27, 13);
INSERT INTO `livre_genre` VALUES (28, 6);
INSERT INTO `livre_genre` VALUES (28, 12);
INSERT INTO `livre_genre` VALUES (29, 7);
INSERT INTO `livre_genre` VALUES (29, 14);
INSERT INTO `livre_genre` VALUES (30, 5);
INSERT INTO `livre_genre` VALUES (30, 13);
INSERT INTO `livre_genre` VALUES (31, 5);
INSERT INTO `livre_genre` VALUES (32, 5);
INSERT INTO `livre_genre` VALUES (32, 6);
INSERT INTO `livre_genre` VALUES (32, 14);
INSERT INTO `livre_genre` VALUES (33, 3);
INSERT INTO `livre_genre` VALUES (33, 4);
INSERT INTO `livre_genre` VALUES (33, 7);
INSERT INTO `livre_genre` VALUES (34, 11);
INSERT INTO `livre_genre` VALUES (35, 6);
INSERT INTO `livre_genre` VALUES (35, 8);
INSERT INTO `livre_genre` VALUES (35, 12);
INSERT INTO `livre_genre` VALUES (36, 14);
INSERT INTO `livre_genre` VALUES (37, 4);
INSERT INTO `livre_genre` VALUES (37, 8);
INSERT INTO `livre_genre` VALUES (37, 9);
INSERT INTO `livre_genre` VALUES (38, 7);
INSERT INTO `livre_genre` VALUES (39, 9);
INSERT INTO `livre_genre` VALUES (39, 12);
INSERT INTO `livre_genre` VALUES (40, 1);
INSERT INTO `livre_genre` VALUES (40, 2);
INSERT INTO `livre_genre` VALUES (40, 5);
INSERT INTO `livre_genre` VALUES (41, 10);
INSERT INTO `livre_genre` VALUES (42, 7);
INSERT INTO `livre_genre` VALUES (42, 10);
INSERT INTO `livre_genre` VALUES (42, 14);
INSERT INTO `livre_genre` VALUES (43, 1);
INSERT INTO `livre_genre` VALUES (43, 5);
INSERT INTO `livre_genre` VALUES (44, 14);
INSERT INTO `livre_genre` VALUES (45, 2);
INSERT INTO `livre_genre` VALUES (45, 12);
INSERT INTO `livre_genre` VALUES (45, 13);
INSERT INTO `livre_genre` VALUES (46, 1);
INSERT INTO `livre_genre` VALUES (46, 12);
INSERT INTO `livre_genre` VALUES (46, 15);
INSERT INTO `livre_genre` VALUES (47, 2);
INSERT INTO `livre_genre` VALUES (47, 4);
INSERT INTO `livre_genre` VALUES (48, 2);
INSERT INTO `livre_genre` VALUES (48, 3);
INSERT INTO `livre_genre` VALUES (48, 9);
INSERT INTO `livre_genre` VALUES (49, 14);
INSERT INTO `livre_genre` VALUES (50, 6);
INSERT INTO `livre_genre` VALUES (50, 13);
INSERT INTO `livre_genre` VALUES (51, 2);
INSERT INTO `livre_genre` VALUES (51, 7);
INSERT INTO `livre_genre` VALUES (51, 12);
INSERT INTO `livre_genre` VALUES (52, 11);
INSERT INTO `livre_genre` VALUES (52, 13);
INSERT INTO `livre_genre` VALUES (53, 5);
INSERT INTO `livre_genre` VALUES (53, 6);
INSERT INTO `livre_genre` VALUES (53, 12);
INSERT INTO `livre_genre` VALUES (54, 1);
INSERT INTO `livre_genre` VALUES (54, 2);
INSERT INTO `livre_genre` VALUES (54, 9);
INSERT INTO `livre_genre` VALUES (55, 3);
INSERT INTO `livre_genre` VALUES (55, 12);
INSERT INTO `livre_genre` VALUES (55, 13);
INSERT INTO `livre_genre` VALUES (56, 3);
INSERT INTO `livre_genre` VALUES (56, 8);
INSERT INTO `livre_genre` VALUES (56, 15);
INSERT INTO `livre_genre` VALUES (57, 8);
INSERT INTO `livre_genre` VALUES (58, 3);
INSERT INTO `livre_genre` VALUES (58, 5);
INSERT INTO `livre_genre` VALUES (58, 10);
INSERT INTO `livre_genre` VALUES (59, 10);
INSERT INTO `livre_genre` VALUES (60, 4);
INSERT INTO `livre_genre` VALUES (60, 7);
INSERT INTO `livre_genre` VALUES (60, 14);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UNIQ_8D93D649E7927C74`(`email` ASC) USING BTREE,
  UNIQUE INDEX `UNIQ_8D93D649F85E0677`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin@localhost.io', '[\"ROLE_ADMIN\"]', '$2y$13$7TNVIHghbl9nPEJ7bBt17uF3nLDGrxsSOe1NKiWyWMeAe/JACHGY6', 'admin', '2022-07-05 23:27:08', '2022-07-05 23:27:08');

SET FOREIGN_KEY_CHECKS = 1;
