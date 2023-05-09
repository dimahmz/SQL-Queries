DROP DATABASE IF EXISTS `entreprise_x`;
CREATE DATABASE `entreprise_x`;
USE `entreprise_x`;


CREATE TABLE `Fournisseurs` (
  `fournisseur_id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `fournisseur_nom` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL
);

-----
CREATE TABLE `Pieces` (
  `piece_id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `piece_nom` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `couleur` varchar(50) NOT NULL,
  `poids` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `prix_achat` Decimal(10,2) NOT NULL,
  `prix_vente` Decimal(10,2) NOT NULL
);

-- ---------
CREATE TABLE `Projets` (
  `projet_id` int(11) AUTO_INCREMENT PRIMARY KEY,
  `projet_nom` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `date_fin_projet` date
);
-- ----------
CREATE TABLE `FournPiecesProjets` (
  `fournisseur_id` int(11) NOT NULL,
  `piece_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  `quantite` int,
   PRIMARY KEY (fournisseur_id, piece_id, projet_id),
   CONSTRAINT fk1 FOREIGN KEY (fournisseur_id) REFERENCES Fournisseurs(fournisseur_id),
    CONSTRAINT fk2 FOREIGN KEY (piece_id) REFERENCES Pieces(piece_id),
     CONSTRAINT fk3 FOREIGN KEY (projet_id) REFERENCES Projets(projet_id)
) ENGINE=InnoDB  CHARSET=utf8mb4;

-- inserting values 

INSERT INTO Fournisseurs (fournisseur_nom, status , ville)
VALUES
('Smith Inc', 'Actif', 'New York'),
('Johnson Corp', 'Inactif', 'Los Angeles'),
('Lee Enterprises', 'Actif', 'Chicago'),
('Garcia Industries', 'Inactif', 'Houston'),
('Davis Manufacturing', 'Actif', 'Miami'),
('Jones Industries', 'Actif', 'New York'),
('Brown & Sons', 'Inactif', 'New York'),
('Garcia & Co', 'Actif', 'New York'),
('Johnson Corp', 'Inactif', 'Chicago'),
('Lee Manufacturing', 'Actif', 'Los Angeles'),
('Davis Suppliers', 'Inactif', 'Miami'),
('Wilson Enterprises', 'Actif', 'Houston');

-- ----
INSERT INTO  Pieces(piece_nom,type,couleur,poids,ville,prix_achat,prix_vente)
VALUES
('Vis', 'Métallique', 'Argent', 2.5, 'Paris', 0.05, 0.10),
('Clou', 'Métallique', 'Noir', 1.8, 'Lyon', 0.03, 0.06),
('Boulon', 'Métallique', 'Bronze', 5.0, 'Marseille', 0.15, 0.30),
('Rondelle', 'Plastique', 'Blanc', 0.5, 'Nantes', 0.01, 0.03),
('Crochet', 'Métallique', 'Rouge', 3.0, 'Toulouse', 0.10, 0.20),
('P2', 'Métallique', 'Rouge', 3.0, 'Toulouse', 0.10, 0.20),
('P2', 'Métallique', 'Rouge', 3.0, 'Toulouse', 0.10, 0.20),
('P2', 'Métallique', 'Rouge', 3.0, 'Toulouse', 0.10, 0.20);

-- ---
INSERT INTO Projets (projet_nom, ville, date_fin_projet)
VALUES
('Projet A', 'New York', '2023-12-31'),
('Projet B', 'Los Angeles', '2024-06-30'),
('Projet C', 'Chicago', '2022-09-30'),
('Projet D', 'Houston', '2023-03-31'),
('Projet E', 'Miami', '2024-01-31');

-- ---

INSERT INTO FournPiecesProjets (fournisseur_id, piece_id, projet_id, quantite) VALUES
(2, 4, 1, 100),
(1, 5, 3, 200),
(3, 2, 4, 50),
(4, 3, 2, 150),
(5, 1, 5, 300),
(4, 6, 2, 150),
(5, 7, 5, 300),
(5, 6, 5, 300),
(1, 8, 3, 200);


