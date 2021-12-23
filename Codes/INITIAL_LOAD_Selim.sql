CREATE TABLE `federation_mouvement_jeunesse` (
  `id` int PRIMARY KEY NOT NULL,
  `denomination_federation` ENUM ('Les Scouts', 'Les Guides', 'Les Patros', 'Les Scouts et Guides pluralistes', 'Les Faucons Rouges'),
  `adresse` int
);

CREATE TABLE `unite` (
  `numero_agrement` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `federation_mouvement_jeunesse` int,
  `denomination_unite` varchar(255),
  `adresse` int
);

CREATE TABLE `responsable_unite` (
  `unite` int,
  `niss` int PRIMARY KEY NOT NULL,
  `nom` varchar(255),
  `prenom` varchar(255),
  `adresse` int,
  `email` varchar(255),
  `telephone` varchar(255)
);

CREATE TABLE `camp` (
  `numero_dossier` int PRIMARY KEY NOT NULL,
  `numero_unite` int,
  `denomination_camp` varchar(255),
  `section` varchar(255),
  `date_declaration` timestamp,
  `frais_de_participation` int,
  `adresse` int,
  `date_debut` datetime,
  `date_fin` datetime,
  `accueil_enfant_moins_6_ans` boolean,
  `accueil_enfant_plus_6_ans` boolean
);

CREATE TABLE `adresse` (
  `id_adresse` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `rue` varchar(255) NOT NULL,
  `numero_rue` int NOT NULL,
  `code_postal` int NOT NULL,
  `commune` varchar(255) NOT NULL
);

CREATE TABLE `enfant` (
  `niss` int PRIMARY KEY NOT NULL,
  `nom` varchar(255),
  `prenom` varchar(255),
  `date_naissance` datetime
);

CREATE TABLE `encadrant` (
  `niss` int PRIMARY KEY NOT NULL,
  `nom` varchar(255),
  `prenom` varchar(255),
  `brevete` boolean,
  `experience` boolean
);

CREATE TABLE `enfant_camp` (
  `numero_dossier` int,
  `niss_enfant` int
);

CREATE TABLE `encadrant_camp` (
  `numero_dossier` int,
  `niss_encadrant` int
);

CREATE TABLE `demande_subside` (
  `numero_dossier` int,
  `date_demande` timestamp,
  `statut` varchar(255)
);

CREATE TABLE `decision` (
  `numero_dossier` int,
  `statut` ENUM ('Accorde', 'Refuse'),
  `agent_traitant` int,
  `montant_subside` decimal,
  `motivation_decision` varchar(255)
);

CREATE TABLE `agentONE` (
  `niss` int PRIMARY KEY NOT NULL,
  `prenom` varchar(255),
  `nom` varchar(255),
  `email` varchar(255),
  `telephone` varchar(255),
  `attribution` int
);

ALTER TABLE `federation_mouvement_jeunesse` ADD FOREIGN KEY (`adresse`) REFERENCES `adresse` (`id_adresse`);

ALTER TABLE `unite` ADD FOREIGN KEY (`federation_mouvement_jeunesse`) REFERENCES `federation_mouvement_jeunesse` (`id`);

ALTER TABLE `unite` ADD FOREIGN KEY (`adresse`) REFERENCES `adresse` (`id_adresse`);

ALTER TABLE `responsable_unite` ADD FOREIGN KEY (`adresse`) REFERENCES `adresse` (`id_adresse`);

ALTER TABLE `camp` ADD FOREIGN KEY (`numero_unite`) REFERENCES `unite` (`numero_agrement`);

ALTER TABLE `camp` ADD FOREIGN KEY (`adresse`) REFERENCES `adresse` (`id_adresse`);

ALTER TABLE `agentONE` ADD FOREIGN KEY (`attribution`) REFERENCES `federation_mouvement_jeunesse` (`id`);

ALTER TABLE `responsable_unite` ADD FOREIGN KEY (`unite`) REFERENCES `unite` (`numero_agrement`);

ALTER TABLE `demande_subside` ADD FOREIGN KEY (`numero_dossier`) REFERENCES `camp` (`numero_dossier`);

ALTER TABLE `enfant_camp` ADD FOREIGN KEY (`niss_enfant`) REFERENCES `enfant` (`niss`);

ALTER TABLE `encadrant_camp` ADD FOREIGN KEY (`niss_encadrant`) REFERENCES `encadrant` (`niss`);

ALTER TABLE `enfant_camp` ADD FOREIGN KEY (`numero_dossier`) REFERENCES `camp` (`numero_dossier`);

ALTER TABLE `encadrant_camp` ADD FOREIGN KEY (`numero_dossier`) REFERENCES `camp` (`numero_dossier`);

ALTER TABLE `decision` ADD FOREIGN KEY (`numero_dossier`) REFERENCES `demande_subside` (`numero_dossier`);

ALTER TABLE `decision` ADD FOREIGN KEY (`agent_traitant`) REFERENCES `agentONE` (`niss`);


INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('1','1','11eme unite - BC - Unité Ste-SUZANNE Schaerbeek','11');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('2','1','12eme unite - BC - ND de la Cambre Ixelles','12');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('3','1','28eme unite - BC - Unité Jacques Plissart Etterbeek','13');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('4','1','35eme unite - BC - Ardents de St-Michel Etterbeek','14');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('5','1','41eme unite - BC - 41è Unité Albert IER Schaerbeek','15');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('6','1','86eme unite - BC - SAINT-JOSEPH  EVERE','16');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('7','1','97eme unite - BC - SAINTE-ALICE Schaerbeek','17');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('8','1','105eme unite - BC - NOTRE-DAME EVERE','18');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('9','1','9eme unite - BH - UNITE DE JETTE','19');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('10','1','21eme unite - BH - Unité Scoute des Marolles','20');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('11','1','45eme unite - BH - UNITE SAINT-GUY Anderlecht','21');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('12','1','55eme unite - BH - BASILIQUE KOEKELBERG Ganshoren','22');

INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('101','4','025 Ganshoren','121');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('102','4','001 La Première Ixelles','122');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('103','4','011 Uccle-Forest-Watermael','123');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('104','4','019 Gentinnes','124');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('105','4','020 Profondsart','125');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('106','4','021 Lasne','126');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('107','4','024 Jette','127');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('108','4','025 SSB-Port de Bruxelles','128');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('109','4','026 SSB-Hannut','129');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('110','4','066 Schaerbeek','130');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('111','4','094 Roux','131');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('112','4','097 Uccle-Forest-Watermael','132');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('113','4','111 Uccle-Forest-Watermael','133');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('114','4','115 Leuze-en-Hainaut','134');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('115','4','134 Mons','135');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('116','4','135 Malmedy','136');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('117','4','145 Etterbeek','137');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('118','4','155 Spa','138');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('119','4','172 Wolluwé-St-Lambert','139');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('120','4','195 Berchem-Ste-Agathe','140');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('121','4','203 Auderghem','141');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('122','4','220 Ath','142');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('123','4','256 Rixensart','143');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('124','4','267 Herstal','144');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('125','4','285 Blegny','145');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('126','4','291 Louvain-La-Neuve','146');


INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('221','3','Patro Saint-Joseph','221');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('222','3','Patro Jeanne d\'Arc et Jean XXIII','222');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('223','3','Patro Sainte-Elisabeth','223');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('224','3','Patro Notre-Dame de Montzen','224');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('225','3','Patro Saint-Remacle d\'Ocquier','225');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('226','3','Patro Saint-François (F) Xavier de Bourgeois','226');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('227','3','Patro Saint-François (G) Xavier de Bourgeois','227');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('228','3','Patro Notre-Dame d\'Ittre','228');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('229','3','Patro Saint-Martin de Perwez','229');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('230','3','Patro Saint-Benoît d\'Ollignies','230');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('231','3','Patro Saint-Antoine de Pontaury','231');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('232','3','Patro Saint-Pancrace','232');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('233','3','Patro Jeunesse Disonaise','233');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('234','3','Patro la Margoule','234');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('235','3','Patro Saint-Eleuthere','235');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('236','3','Patro de Mehagne','236');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('237','3','Patro Saint-Valentin','237');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('238','3','Patro Saint-Dominique Savio (garçons Welkenraedt)','238');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('239','3','Patro Saint-Dominique de Bois-du-Luc','239');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('240','3','Patro Saint-Jean de Bois-du-Luc','240');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('241','3','Patro Sainte-Agnès d\'Olne','241');


INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('301','2','01 ème Unité - HC - Notre-Dame aux Neiges','301');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('302','2','04 ème Unité - HC - Saint Rémy','302');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('303','2','05 ème Unité - HC - Saint Joseph','303');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('304','2','06 ème Unité - HC - Saint Vincent','304');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('305','2','10 ème Unité - HC - Saint Nicolas','305');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('306','2','12 ème Unité - HC - Notre-Dame du Frêne','306');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('307','2','13 ème Unité - HC - Saint Symphorien','307');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('308','2','16 ème Unité - HC - Jean XXIII','308');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('309','2','02 ème Unité - HE - Saint Martin','309');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('310','2','03 ème Unité - HE - Ville Basse','310');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('311','2','16 ème Unité - HE - Martin Luther King','311');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('312','2','20 ème Unité - HE - Saint Martin','312');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('313','2','21 ème Unité - HE - Saint Jean Baptiste','313');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('314','2','12 ème Unité - HL - Marie Médiatrice','314');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('315','2','15 ème Unité - HL - St Bernard','315');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('316','2','18 ème Unité - HL - Sainte-Anne','316');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('317','2','21 ème Unité - HL - Immaculée Conception','317');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('318','2','01 ème Unité - HO - Sacré-Coeur','318');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('319','2','04 ème Unité - HO - 4 Vents','319');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('320','2','05 ème Unité - HO - Saint Quentin','320');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('321','2','07 ème Unité - HO - Sainte Anne','321');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('322','2','09 ème Unité - HO - Vincent Lebbe','322');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('323','2','13 ème Unité - HO - Saint Michel','323');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('324','2','02 ème Unité - LCI - St Christophe','324');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('325','2','25 ème Unité - LCI - Sainte Walburge','325');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('326','2','36 ème Unité - LCO - Clairs Regards','326');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('401','5','Les Faucons Rouges de Péronnes','401');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('402','5','Les Faucons Rouges de Wanze','402');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('403','5','Les Faucons Rouges de Morlanwelz','403');
INSERT INTO unite (numero_agrement,federation_mouvement_jeunesse,denomination_unite,adresse) VALUES ('404','5','Les Faucons Rouges de Leval','404');











INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('11','AVENUE GUSTAVE LATINIS','48','1030','Schaerbeek');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('12','ABBAYE DE LA CAMBRE','9','1050','Ixelles');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('13','RUE NOTHOMB','50','1040','Etterbeek');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('14','BOULEVARD SAINT-MICHEL','24-26','1040','Etterbeek');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('15','AVENUE EMILE MAX','153','1030','Schaerbeek');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('16','AV. DES ANC. COMBATTANTS','300','1140','Evere');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('17','RUE ARTAN','144','1030','Schaerbeek');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('18','AV. H. CONSCIENCE','158','1140','Evere');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('19','RUE JOSEPH SCHUERMANS','9','1090','Jette');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('20','RUE DES CAPUCINS','30','1000','Bruxelles');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('21','RUE JEAN MORJAU','30','1070','Anderlecht');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('22','PARVIS DE LA BASILIQUE','10','1083','Ganshoren');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('121','Rue Mayelle','21','1090','Jette');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('122','Rue Saint-Lambert','86','1200','Woluwe-Saint-Lambert');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('123','Rue du Loutrier','74','1170','Watermael-Boitsfort');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('124','Rue Taille Madame','20','1450','Chastre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('125','Rue de la Gare','3','1348','Louvain-La-Neuve');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('126','Rue Collart','9','1380','Lasne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('127','Van Dijcklaan','4','1910','Kampenhout');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('128','Rue du bois de Linthout','16','1200','Woluwe-Saint-Lambert');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('129','Place Athur Maquet','2','4263','Tourinne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('130','Grande Rue au Bois','124','1030','Schaerbeek');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('131','Rue de Binche','359','6180','Courcelles');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('132','Chaussée de Wavre','501','1040','Etterbeek');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('133','Avenue de la Ramée','17','1180','Uccle');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('134','Rue de la Tête dOr','10','7500','Tournai');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('135','Rue de la Place','8 bis','7022','Harmignies');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('136','Route de lancienne Frontière','32','4960','Malmedy');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('137','Rue Antoine Boulard','1','7000','Mons');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('138','Chemin des Prés','10','4900','Spa');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('139','Everslaan','11','3078','Everberg');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('140','Rue Antoine Dansaert','190','1000','Bruxelles');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('141','Boulevard Brand Whitlock','119','1200','Woluwe-Saint-Lambert');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('142','Rue de Sglatignies','12','7332','Neufmaison');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('143','Rue de lEtang','11','1340','Ottignies-Louvain-La-Neuve');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('144','Rue de la Chapelle','61','6990','Hotton');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('145','Rue de la Croisette','78','6860','Léglise');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('146','Rue des Combattants 101','101','1310','La Hulpe');


INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('221','Rue du Marais','16','7830','Silly');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('222','Rue de Coulée','14','4860','Pepinster');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('223','Rue des Dames Blanches','1','5080','Rhisnes');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('224','Rue Hubert Denis','26','4850','Plombières');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('225','Rue de la Croix','7','6941','Borlon');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('226','Rue du Tilleul','67','1390','Grez-Doiceau');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('227','Place Cardinal Mercier','29','1330','Rixensart');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('228','Sentier Bauthier','2','1460','Ittre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('229','Rue des Marronniers ','17','1360','Perwez');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('230','Rue des Combattants','57','7860','Lessines');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('231','Rue de la Barrière','4','5640','Mettet');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('232','Rue Général Thys','8','4607','Dalhem');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('233','Rue de l\'Industrie','44','4820','Dison');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('234','Place de Pipaix','3','7904','Pipaix');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('235','Rue de l\'Eglise Saint-Eleuthère','6','7522','Blandain');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('236','Rue des Coquelicots','10','4053','Embourg');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('237','Avenue du Centenaire','62','6061','Montignies-Sur-Sambre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('238','Rue de l\'Eglise','26A','4840','Welkenraedt');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('239','Rue de la Glacière','14','7100','La Louvière');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('240','Rue du Quincorne','14','7100','La Louvière');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('241','Rue Les Tris','3','4877','Olne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('301',' Rue de la halle aux filets (BIN) - L\'Oasis ','.','7130','Binche');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('302','RUE DE COURRIERE-LEZ-VILLE','42','7190','Ecaussinnes');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('303','RUE A DETTES','102','6150','Anderlues');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('304','Rue Henri Leroy','8','7060','Soignies');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('305','Pavé de Soignies','43','7850','Enghien');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('306','Place de la Chapelle','2','7022','Hyon');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('307','RUE DE SAINT-SYMPHORIEN','167','7021','Havre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('308','RUE DE SAINT-GHISLAIN','7','7300','Boussu');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('309','RUE DE GOZEE','619','6110','Montigny-Le-Tilleul');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('310','Rue du Moustier','24','6530','Thuin');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('311','Chaussée de Charleroi','153','6220','Fleurus');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('312','Rue des Bois','1','6183','Trazegnies');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('313','PLACE COMMUNALE','1','6230','Pont-À-Celles');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('314','Rue Simon Lobet','68','4800','Verviers');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('315','Sur les Joncs','24','4800','Lambermont');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('316','Rue de l\'Eglise','8','4801','Stembert');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('317','Route du bois de Jalhay','1','4800','Verviers');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('318','Rue Achille Debacker','1','7700','Mouscron');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('319','Rue Salvador Allende','1','7810','Maffle');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('320','Rue Leclercqz','3','7760','Celles');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('321','Rue des Ames','39','7864','Deux-Acren');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('322','Rue de l\'Eglise ND de la Tombe','.','7540','Kain');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('323','Place de Grandmetz','.','7900','Grandmetz');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('324','RUE SAINT-GILLES','400','4000','Liège');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('325','RUE DU LIMBOURG','63','4000','Liège');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('326','Pré Lorint','49','4052','Beaufays');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('401','Rue des Droits de l\'Enfant','8/32','7134','Péronnes-Lez-Binche');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('402','Rue de Leumont','23','4520','Wanze');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('403','Rue de l\'Olive','2','7140','Morlanwelz');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('404','Rue Salvatore Allende','63','7134','Leval-Trahegnies');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1651','101','Castors - Kinga','Castors','25-03-21','90','1651','01-07-21','11-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1652','102','Louveteaux - Kaniwhara','Louveteaux','26-03-21','32','1652','01-07-21','12-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1653','103','Louveteaux - Rawal-Pindi','Louveteaux','27-03-21','65','1653','01-07-21','13-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1654','104','Unité -','Unité','28-03-21','76','1654','01-07-21','14-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1655','105','Ultragame Vattceko','Castors','29-03-21','41','1655','01-07-21','15-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1656','106','Les Minières','Louvetaux et Scouts','30-03-21','14','1656','01-07-21','16-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1657','107','Castors (Colonie) -','Castors (Colonie)','31-03-21','97','1657','01-07-21','17-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1658','108','La Garnelle/ le Pylone','Louveteaux','01-04-21','97','1658','01-07-21','18-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1659','109','Abbaye ND de Clairefontaine','Louveteaux','02-04-21','24','1659','01-07-21','19-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1660','110','Scouts-Guides - Troupe Elan','Scouts-Guides','03-04-21','18','1660','01-07-21','20-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1661','111','Camp Aventure A','Aventure-A','04-04-21','91','1661','01-07-21','21-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1662','112','Camp Aventure B','Aventure-B','05-04-21','7','1662','01-07-21','22-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1663','113','Camp Lutin A','Lutin-A','06-04-21','34','1663','01-07-21','23-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1664','114','Camp Lutin B','Lutin-B','07-04-21','36','1664','01-07-21','24-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1665','115','Camp Nuton A','Nuton-A','08-04-21','99','1665','01-07-21','25-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1666','116','Camp Aventure A','Aventure-A','09-04-21','58','1666','02-07-21','15-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1667','117','Camp Lutin A','Lutin-A','25-03-21','3','1667','02-07-21','15-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1668','118','Camp Nuton A','Nuton-A','26-03-21','25','1668','02-07-21','15-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1669','119','Camp Aventure A','Aventure-A','27-03-21','17','1669','02-07-21','15-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1670','120','Camp Lutin A','Lutin-A','28-03-21','42','1670','02-07-21','15-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1671','121','Camp Nuton A','Nuton-A','29-03-21','56','1671','02-07-21','15-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1672','122','Camp Aventure A','Aventure-A','30-03-21','77','1672','02-07-21','15-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1673','123','Camp Lutin A','Lutin-A','31-03-21','49','1673','02-07-21','15-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1674','124','Camp Nuton A','Nuton-A','01-04-21','25','1674','02-07-21','15-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1675','125','Camp Aventure A','Aventure-A','02-04-21','3','1675','02-07-21','15-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1676','126','Camp Lutin A','Lutin-A','03-04-21','58','1676','02-07-21','15-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1677','221','Camp Lutin B','Lutin-B','04-04-21','11','1677','02-07-21','15-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1678','222','Camp Nuton A','Nuton-A','05-04-21','35','1678','02-07-21','15-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1679','223','US Pesche','Castors','06-04-21','16','1679','02-07-21','15-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1680','224','Louveteaux - Meute de Profondsart','Louveteaux','07-04-21','47','1680','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1681','225','Scouts-Guides - Troupe de Profondsart','Scouts-Guides','08-04-21','23','1681','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1682','226','Gîte Paroissial de Retinne','Castors','09-04-21','99','1682','15-07-21','30-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1683','227','ZeeDuStra Koksijde','Castors','25-03-21','33','1683','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1684','228','Scouts Winterslag','Louveteaux','26-03-21','43','1684','15-07-21','30-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1685','229','Prairie de Guy Dromelet','Scouts-Guides','27-03-21','96','1685','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1686','230','Louveteaux -','Louveteaux','28-03-21','31','1686','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1687','231','Plaine Le Brou','Scouts-Guides','29-03-21','32','1687','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1688','232','Bivak Mazée (lieu dit avoisinant)','Louveteaux','30-03-21','71','1688','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1689','233','Maison des scouts','Castors','31-03-21','46','1689','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1690','234','Maloux','Louveteaux','01-04-21','22','1690','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1691','235','Camp','Scouts-Guides','02-04-21','61','1691','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1692','236','Hellebrandt Herman','Louveteaux','03-04-21','28','1692','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1693','237','Van Nieuwenhuyse Chantal (propriétaire)','Scouts-Guides','04-04-21','71','1693','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1694','238','club Football Erpion','Castors','05-04-21','29','1694','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1695','239','Louveteaux - Meute de la Fleur Rouge','Louveteaux','06-04-21','26','1695','15-07-21','30-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1696','240','Four Mattot','Scouts-Guides','07-04-21','63','1696','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1697','241','Camp Aventure A','Aventure-A','08-04-21','47','1697','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1698','301','Camp Lutin A','Lutin-A','09-04-21','39','1698','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1699','302','Camp Nuton A','Nuton-A','25-03-21','36','1699','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1700','303','Camp Aventure A','Aventure-A','26-03-21','25','1700','15-07-21','30-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1701','304','Camp Lutin A','Lutin-A','27-03-21','46','1701','15-07-21','30-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1702','305','Camp Nuton A','Nuton-A','28-03-21','61','1702','15-07-21','30-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1703','306','Camp Aventure A','Aventure-A','29-03-21','75','1703','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1704','307','Camp Lutin A','Lutin-A','30-03-21','50','1704','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1705','308','Camp SRA A','SRA-A','31-03-21','94','1705','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1706','309','Camp Nuton A','Nuton A','01-04-21','89','1706','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1707','310','Camp Aventure A','Aventure-A','02-04-21','41','1707','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1708','311','Camp Lutin A','Lutin-A','03-04-21','2','1708','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1709','312','Camp Aventure A','Aventure-A','04-04-21','66','1709','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1710','313','Camp Lutin A','Lutin-A','05-04-21','11','1710','15-07-21','30-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1711','314','Camp Nuton A','Nuton-A','06-04-21','75','1711','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1712','315','Camp Aventure A','Aventure-A','07-04-21','45','1712','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1713','316','Camp Lutin A','Lutin-A','08-04-21','88','1713','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1714','317','Camp Nuton A','Nuton-A','09-04-21','52','1714','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1715','318','Camp Aventure A','Aventure-A','25-03-21','59','1715','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1716','319','Camp Lutin A','Lutin-A','26-03-21','10','1716','15-07-21','30-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1717','320','Camp Nuton A','Nuton-A','27-03-21','92','1717','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1718','321','Camp Nuton A','Nuton-A','28-03-21','32','1718','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1719','322','Camp Aventure A','Aventure-A','29-03-21','27','1719','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1720','323','Camp Nuton A','Nuton-A','30-03-21','5','1720','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1721','324','Camp Aventure A','Aventure-A','31-03-21','82','1721','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1722','325','Camp Aventure B','Aventure-B','01-04-21','30','1722','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1723','326','Camp Lutin A','Lutin-A','02-04-21','67','1723','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1724','401','Camp Lutin B','Lutin-B','03-04-21','75','1724','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1725','402','Camp Aventure A','Aventure-A','04-04-21','77','1725','15-07-21','30-07-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1726','403','Camp Lutin A','Lutin-A','05-04-21','6','1726','15-07-21','30-07-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1727','404','Camp Nuton A','Nuton-A','06-04-21','10','1727','15-07-21','30-07-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1728','101','Camp Aventure A','Aventure-A','07-04-21','21','1728','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1729','102','Camp Lutin A','Lutin-A','08-04-21','36','1729','15-07-21','30-07-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1730','103','Camp Nuton A','Nuton-A','09-04-21','90','1730','08-08-21','18-08-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1731','104','Camp des Lutins','Lutin A','25-03-21','53','1731','08-08-21','18-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1732','105','Camp Aventure A','Aventure-A','26-03-21','2','1732','08-08-21','18-08-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1733','106','Camp Lutin A','Lutin-A','27-03-21','90','1733','08-08-21','18-08-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1734','107','Camp Nuton A','Nuton-A','28-03-21','80','1734','08-08-21','18-08-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1735','108','Camp Aventure A','Aventure-A','29-03-21','100','1735','08-08-21','18-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1736','109','Camp Lutin A','Lutin-A','30-03-21','29','1736','08-08-21','18-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1737','110','Camp Nuton A','Nuton-A','31-03-21','33','1737','12-08-21','19-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1738','111','Camp Aventure A','Aventure-A','01-04-21','21','1738','12-08-21','19-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1739','112','Camp Lutin A','Lutin-A','02-04-21','24','1739','12-08-21','19-08-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1740','113','Camp Aventure A','Aventure-A','03-04-21','80','1740','12-08-21','19-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1741','114','Camp Lutin A','Lutin-A','04-04-21','74','1741','12-08-21','19-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1742','115','Camp Lutin B','Lutin-B','05-04-21','80','1742','12-08-21','19-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1743','116','Camp Nuton A','Nuton-A','06-04-21','45','1743','12-08-21','19-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1744','117','Camp Aventure A','Aventure-A','07-04-21','14','1744','12-08-21','19-08-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1745','118','Camp Lutin A','Lutin-A','08-04-21','73','1745','12-08-21','19-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1746','119','Camp Nuton A','Nuton-A','09-04-21','98','1746','12-08-21','19-08-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1747','120','Camp Aventure B','Aventure-B','25-03-21','33','1747','12-08-21','19-08-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1748','121','Camp Lutin A','Lutin-A','26-03-21','4','1748','12-08-21','19-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1749','122','Camp Nuton A','Nuton-A','27-03-21','25','1749','12-08-21','19-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1750','123','Camp Aventure A','Aventure-A','28-03-21','78','1750','12-08-21','19-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1751','124','Camp Lutin A','Lutin-A','29-03-21','94','1751','15-08-21','23-08-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1752','125','Camp Nuton A','Nuton-A','30-03-21','12','1752','15-08-21','23-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1753','126','Camp Aventure A','Aventure-A','31-03-21','100','1753','15-08-21','23-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1754','5','Camp Lutin A','Lutin-A','01-04-21','67','1754','15-08-21','23-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1755','6','Camp Aventure A','Aventure-A','02-04-21','39','1755','15-08-21','23-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1756','7','Camp Aventure B','Aventure-B','03-04-21','86','1756','15-08-21','23-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1757','8','Camp Aventure C','Aventure-C','04-04-21','51','1757','15-08-21','23-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1758','307','Camp Lutin A','Lutin-A','05-04-21','90','1758','15-08-21','23-08-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1759','308','Camp Lutin B','Lutin-B','06-04-21','91','1759','15-08-21','23-08-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1760','309','Camp Lutin C','Lutin-C','07-04-21','63','1760','15-08-21','23-08-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1761','310','Camp Nuton A','Nuton-A','08-04-21','63','1761','15-08-21','23-08-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1762','311','Camp Nuton B','Nuton-B','09-04-21','86','1762','15-08-21','23-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1763','312','Domaine de Palogne','Castors','25-03-21','46','1763','15-08-21','23-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1764','313','Louveteaux - Meute de Tha','Louveteaux','26-03-21','23','1764','15-08-21','23-08-21','0','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1765','323','Scouts-Guides - Skits 66 Corbeau Noir','Scouts-Guides','27-03-21','21','1765','15-08-21','23-08-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1766','324','Camp Aventure A','Aventure-A','28-03-21','68','1766','15-08-21','23-08-21','1','0');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1767','325','Camp Lutin A','Lutin-A','29-03-21','89','1767','15-08-21','23-08-21','1','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1768','323','Camp Nuton A','Nuton-A','30-03-21','1','1768','15-08-21','23-08-21','0','1');
INSERT INTO camp (numero_dossier,numero_unite,denomination_camp,section,date_declaration,frais_de_participation,adresse,date_debut,date_fin,accueil_enfant_moins_6_ans,accueil_enfant_plus_6_ans) VALUES ('1769','324','Camp Aventure A','Aventure-A','31-03-21','51','1769','15-08-21','23-08-21','0','0');


INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1651','RUE DE WALCOURT','110','5070','Fosses-La-Ville');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1652','Cetturu','27A','6662','Tavigny');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1653','Cetturu','27A','6662','Tavigny');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1654','Rue du Repos','31','5580','Rochefort');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1655','Rue de la Carrière','-','5070','Fosses-La-Ville');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1656','Rue La Gleize','19','4987','Stoumont');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1657','RUE DU CERISIER','74','1490','Court-Saint-Etienne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1658','Ferme des Mouches','2','6830','Bouillon');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1659','CORDEMOIS','1','6830','Bouillon');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1660','Rue des Crêtes','49','6830','Bouillon');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1661','RUE DE GEDINNE','-','5555','Bièvre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1662','RUE DE GEDINNE','-','5555','Bièvre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1663','AVENUE ASTRID','13','6280','Gerpinnes');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1664','RUE DU FOUR A VERRE','1','6441','Erpion');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1665','Rue Pré Lorint','48','4052','Beaufays');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1666','VIEUX CHEMIN','-','6800','Libramont-Chevigny');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1667','PLACE PAULIN-MOXHET','16','6690','Vielsalm');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1668','GRAND-RUE','24','6440','Froidchapelle');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1669','WERIMONT','-','4987','Stoumont');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1670','RUE DE GORHEZ','13','4880','Aubel');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1671','ALLEE ST FRANCOIS','1','4837','Baelen');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1672','RUE DE LA FECHE','9','6880','Bertrix');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1673','LES FAWES','385','4654','Charneux');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1674','RUE GOUTRIELLE','37b','7387','Honnelles');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1675','Quart (N693)','-','4790','Burg-Reuland');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1676','DEIDENBERG','3','4770','Amblève');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1677','ROUTE DES MARNIERES','51','1380','Lasne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1678','HARZY','24','6600','Bastogne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1679','Rue Carrière du Parrain','13','5660','Couvin');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1680','Rue de Fagnolle','44','5670','Viroinval');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1681','Rue de Fagnolle','44','5670','Viroinval');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1682','Voie des Choinoines','29','4621','Retinne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1683','Kerkstraat','34','8670','Koksijde');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1684','Kerkstraat','1','3600','Genk');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1685','Rue De Cerfontaine','95','5660','Couvin');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1686','RUE DE CHAPAUVEAU','1','1357','Hélécine');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1687','Rue de la Scierie','6','6852','Maissin');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1688','Rue du Bucq','21','5670','Viroinval');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1689','Place Tourcée','4','6900','Marche-En-Famenne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1690','Rue Haya','4','4560','Clavier');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1691','Rue Haya','4','4560','Clavier');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1692','Bornstrasse','21','4750','Butgenbach');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1693','Rue de Sin','42','7622','Laplaigne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1694','Ruelle Catton','-','6441','Erpion');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1695','LE FOUR MATOT','11','6593','Macquenoise');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1696','LE FOUR MATOT','11','6593','Macquenoise');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1697','Champs Touaux','-','6836','Dohan');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1698','RUE LA GAGE','64','7063','Chaussée-Notre-Dame-Louvignies');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1699','RUE DU FORT','-','4671','Barchon');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1700','RUE AUXILIAIRE','5','5670','Viroinval');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1701','PLACE DU CARCAN','13','4260','Braives');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1702','RUE GRANDE','10','6820','Florenville');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1703','PONT-LE-PRETRE','1','6856','Fays-Les-Veneurs');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1704','RUE DU PARVIS','17','6950','Nassogne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1705','RUE DE GEDINNE','5','6920','Wellin');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1706','Schotensteenweg','80','2960','Brecht');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1707','CHEMIN DE COUBRY','-','6890','Libin');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1708','CHEMIN DE CASTEAU','1B','7063','Chaussée-Notre-Dame-Louvignies');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1709','CHAMPAY','-','6941','Bende');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1710','LES FAWES','385','4654','Charneux');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1711','RUE JEAN DOINET','28','4140','Sprimont');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1712','Möderscheider Mühle','5','4770','Amblève');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1713','MODERSCHEIDER WEG','5','4770','Amblève');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1714','MODERSCHEIDER WEG','5','4770','Amblève');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1715','RUE DE LA COURBEURE','16','6880','Bertrix');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1716','R NOTRE-DAME-DE-HAURT','-','6953','Ambly');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1717','RUE DE BETH','8','6852','Maissin');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1718','OURTHE','21','6672','Beho');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1719','HALLEUX','65','4170','Comblain-Au-Pont');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1720','HALLEUX','65','4170','Comblain-Au-Pont');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1721','LA-MALCAMPEE','51','5575','Gedinne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1722','RUE DU PONT','19','5555','Bièvre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1723','RUE DE MALVOISIN','24','5575','Gedinne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1724','RUE SAINTE-AGATHE','91','5550','Vresse-Sur-Semois');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1725','RUE DE NAJAUGE','62','5670','Viroinval');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1726','RUE GRANDE','87','5100','Dave');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1727','VOIE MICHEL','20','6940','Durbuy');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1728','DESSUS-DE-LA-VILLE','-','5660','Couvin');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1729','RUE DE NAVAUGLE','111','5580','Rochefort');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1730','RUE DE NAVAUGLE','111','5580','Rochefort');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1731','RUE DES ECHAVÉES','2A','6980','La Roche-En-Ardenne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1732','STOCKAY','2','4845','Jalhay');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1733','RUE HERMANMONT','-','6690','Vielsalm');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1734','RUE RODOLPHE BERNARD','-','4140','Sprimont');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1735','RUE RODOLPHE BERNARD','20','4140','Sprimont');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1736','XHOFFRAIX-RUE DES CHARMILLES','10','4960','Malmedy');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1737','BASSE COMMENE','24','6940','Durbuy');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1738','RUE DU BUSSON','13','5580','Rochefort');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1739','RUE DE BEMPT','8 et 10','4850','Plombières');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1740','RUE DE PORCHERESSE','-','5555','Bièvre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1741','RUE DE PORCHERESSE','1','5555','Bièvre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1742','RUE DE PORCHERESSE','-','5555','Bièvre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1743','RUE GRANDE','23B','5555','Bièvre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1744','NEFFE','164','6600','Bastogne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1745','ROUTE DU MOULIN','3','4970','Stavelot');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1746','RUE DU BREUX','3','6824','Chassepierre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1747','HAMEAU DE LASSUS','1','4180','Hamoir');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1748','RUE VICAIRE GEORGES MINNE','-','7711','Dottignies');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1749','RUE DU VILLAGE','524','4870','Trooz');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1750','HORWARD','165','4651','Battice');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1751','RUE DES WEZ','9A','5555','Bièvre');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1752','REGNE','39','6690','Vielsalm');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1753','RUE DE MIANOYE','1','5530','Durnal');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1754','RUE AURELIEN THIBAUT','10','6001','Marcinelle');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1755','RUE DU DONEU','-','5580','Rochefort');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1756','Rue de Wavreille','16','6953','Lesterny');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1757','RUE DE GRAIDE','95','6929','Daverdisse');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1758','RUE DU MILLENAIRE','1','6941','Bende');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1759','BASSEILLES','2','6970','Tenneville');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1760','RUE DU CENTRE','23','6990','Hotton');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1761','HARZY','24','6600','Bastogne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1762','HARZY','24','6600','Bastogne');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1763','Rue de la Bouverie','1','4190','Vieuxville');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1764','RUE ISIDORE FUMAL','19','4280','Hannut');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1765','Rue de la Butte','15','5660','Couvin');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1766','RUE DES PAIREES','-','5580','Rochefort');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1767','RUE ALBERT BILLY','5','5370','Havelange');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1768','RUE NESTOR-BOUILLON','16B','5377','Somme-Leuze');
INSERT INTO adresse (id_adresse,rue,numero_rue,code_postal,commune) VALUES ('1769','Rue d\'opont','-','6852','Maissin');


INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5611','1','Collet','Frédéric','4646','Collet.Frédéric@mail.com','021112233');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5612','2','Desqueuve','ARNOLD','4647','Desqueuve.ARNOLD@mail.com','021112234');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5613','3','De Meyer','VERONIQUE','4648','De Meyer.VERONIQUE@mail.com','021112235');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5614','4','Foucart','François','4649','Foucart.François@mail.com','021112236');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5615','5','Colin','François','4650','Colin.François@mail.com','021112237');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5616','6','Pierart','Claire','4651','Pierart.Claire@mail.com','021112238');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5617','7','Delvenne','Emmanuel','4652','Delvenne.Emmanuel@mail.com','021112239');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5618','8','Camus','Isabelle','4653','Camus.Isabelle@mail.com','021112240');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5619','9','Fivet','Etienne','4654','Fivet.Etienne@mail.com','021112241');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5620','10','Fivet','Emmanuelle','4655','Fivet.Emmanuelle@mail.com','021112242');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5621','11','Vallée','KILLIAN','4656','Vallée.KILLIAN@mail.com','021112243');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5622','12','Lenaerts','Olivier','4657','Lenaerts.Olivier@mail.com','021112244');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5623','101','Yernaux','GAEL','4658','Yernaux.GAEL@mail.com','021112245');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5624','102','Negro','Marc-Antoine','4659','Negro.Marc-Antoine@mail.com','021112246');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5625','103','Cheyrel','GREGORY','4660','Cheyrel.GREGORY@mail.com','021112247');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5626','104','Lejeune','Jean-François','4661','Lejeune.Jean-François@mail.com','021112248');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5627','105','Dauby','Mathieu','4662','Dauby.Mathieu@mail.com','021112249');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5628','106','Masson','MATTHIEU','4663','Masson.MATTHIEU@mail.com','021112250');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5629','107','Tinant','Pascale','4664','Tinant.Pascale@mail.com','021112251');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5630','108','Lognoul','François','4665','Lognoul.François@mail.com','021112252');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5631','109','D\'hautcourt','Valentine','4666','D\'hautcourt.Valentine@mail.com','021112253');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5632','110','Monville','Lucien','4667','Monville.Lucien@mail.com','021112254');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5633','111','MOTTET','Emmanuel','4668','MOTTET.Emmanuel@mail.com','021112255');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5634','112','Roman','Isabelle','4669','Roman.Isabelle@mail.com','021112256');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5635','113','Jean-Francois','Claire','4670','Jean-Francois.Claire@mail.com','021112257');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5636','114','Bomboir','Clotilde','4671','Bomboir.Clotilde@mail.com','021112258');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5637','115','Ista','Diogo','4672','Ista.Diogo@mail.com','021112259');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5638','116','Guyot','Christine','4673','Guyot.Christine@mail.com','021112260');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5639','117','Van Den Dooren','Ingrid','4674','Van Den Dooren.Ingrid@mail.com','021112261');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5640','118','Rosman','Anne','4675','Rosman.Anne@mail.com','021112262');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5641','119','Cosse','Jean-Luc','4676','Cosse.Jean-Luc@mail.com','021112263');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5642','120','Quattrone','Françoise','4677','Quattrone.Françoise@mail.com','021112264');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5643','121','Boisdenghien','Elisabeth','4678','Boisdenghien.Elisabeth@mail.com','021112265');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5644','122','Requin','Frédéric','4679','Requin.Frédéric@mail.com','021112266');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5645','123','Navez','Eric','4680','Navez.Eric@mail.com','021112267');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5646','124','Viseur','Cédric','4681','Viseur.Cédric@mail.com','021112268');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5647','125','Plancq','François','4682','Plancq.François@mail.com','021112269');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5648','126','Debroux','Aurélie','4683','Debroux.Aurélie@mail.com','021112270');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5649','221','Dusong','Lydie','4684','Dusong.Lydie@mail.com','021112271');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5650','222','Devergnies','Christelle','4685','Devergnies.Christelle@mail.com','021112272');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5651','223','Henrard','Simon','4686','Henrard.Simon@mail.com','021112273');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5652','224','Lamotte','Auriane','4687','Lamotte.Auriane@mail.com','021112274');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5653','225','Debosschere','Denis','4688','Debosschere.Denis@mail.com','021112275');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5654','226','Marco','Muriel','4689','Marco.Muriel@mail.com','021112276');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5655','227','Meens','DE LA VINELLE Arthur','4690','Meens.DE LA VINELLE Arthur@mail.com','021112277');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5656','228','Dijon','Damien','4691','Dijon.Damien@mail.com','021112278');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5657','229','Folon','Frédéric','4692','Folon.Frédéric@mail.com','021112279');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5658','230','Folon','Christian','4693','Folon.Christian@mail.com','021112280');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5659','231','Perniaux','Fanny','4694','Perniaux.Fanny@mail.com','021112281');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5660','232','Viville','Matthieu','4695','Viville.Matthieu@mail.com','021112282');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5661','233','Marchal','Evelyne','4696','Marchal.Evelyne@mail.com','021112283');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5662','234','Gallis','Ella','4697','Gallis.Ella@mail.com','021112284');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5663','235','Breuskin','Guillaume','4698','Breuskin.Guillaume@mail.com','021112285');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5664','236','Maqua','Pierre','4699','Maqua.Pierre@mail.com','021112286');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5665','237','Derbaudrenghien','SoPhie','4700','Derbaudrenghien.SoPhie@mail.com','021112287');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5666','238','Dugauquier','Sébastien','4701','Dugauquier.Sébastien@mail.com','021112288');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5667','239','Dugauquier','XAVIER','4702','Dugauquier.XAVIER@mail.com','021112289');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5668','240','La Rosa','Patricia','4703','La Rosa.Patricia@mail.com','021112290');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5669','241','Rossenfosse','Didier','4704','Rossenfosse.Didier@mail.com','021112291');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5670','301','Van Lithaut','Muriel','4705','Van Lithaut.Muriel@mail.com','021112292');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5671','302','Debock','Delphine','4706','Debock.Delphine@mail.com','021112293');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5672','303','Priarolo','Rémy','4707','Priarolo.Rémy@mail.com','021112294');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5673','304','Luis Ampudia','Didier','4708','Luis Ampudia.Didier@mail.com','021112295');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5674','305','Gabriels','Sophie','4709','Gabriels.Sophie@mail.com','021112296');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5675','306','Sainlez','Barbara','4710','Sainlez.Barbara@mail.com','021112297');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5676','307','Solheid','Françoise','4711','Solheid.Françoise@mail.com','021112298');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5677','308','Renkin','Marie-Astrid','4712','Renkin.Marie-Astrid@mail.com','021112299');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5678','309','Lekeu','Isabelle','4713','Lekeu.Isabelle@mail.com','021112300');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5679','310','Geurde','Michèle','4714','Geurde.Michèle@mail.com','021112301');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5680','311','Lecocq','Isabelle','4715','Lecocq.Isabelle@mail.com','021112302');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5681','312','Desonay','Christie','4716','Desonay.Christie@mail.com','021112303');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5682','313','Jonlet','Fanny','4717','Jonlet.Fanny@mail.com','021112304');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5683','314','Jonlet','Isabelle','4718','Jonlet.Isabelle@mail.com','021112305');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5684','315','Reynaert','Ginette','4719','Reynaert.Ginette@mail.com','021112306');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5685','316','Ameye','Michael','4720','Ameye.Michael@mail.com','021112307');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5686','317','Prignon','Jawad','4721','Prignon.Jawad@mail.com','021112308');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5687','318','Plancq','Pascal','4722','Plancq.Pascal@mail.com','021112309');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5688','319','Variselli','Christel','4723','Variselli.Christel@mail.com','021112310');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5689','320','Dufour','Angélique','4724','Dufour.Angélique@mail.com','021112311');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5690','321','Germain','Jean-Philippe','4725','Germain.Jean-Philippe@mail.com','021112312');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5691','322','Marchal','Anne-Christine','4726','Marchal.Anne-Christine@mail.com','021112313');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5692','323','Klinkenberg','Sarah','4727','Klinkenberg.Sarah@mail.com','021112314');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5693','324','Lacroix','Laurence','4728','Lacroix.Laurence@mail.com','021112315');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5694','325','Callens','Stéphanie','4729','Callens.Stéphanie@mail.com','021112316');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5695','326','Antson','Martine','4730','Antson.Martine@mail.com','021112317');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5696','401','Roox','Christine','4731','Roox.Christine@mail.com','021112318');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5697','402','Colin','Belinda','4732','Colin.Belinda@mail.com','021112319');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5698','403','Detrixhe','Cindy','4733','Detrixhe.Cindy@mail.com','021112320');
INSERT INTO responsable_unite (niss,unite,nom,prenom,adresse,email,telephone) VALUES ('5699','404','Baijot','Olivier','4734','Baijot.Olivier@mail.com','021112321');
