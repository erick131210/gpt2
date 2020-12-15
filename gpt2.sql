-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: gpt2
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `escenario`
--

DROP TABLE IF EXISTS `escenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escenario` (
  `idEscenario` int NOT NULL AUTO_INCREMENT,
  `nombreEscenario` varchar(30) DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  PRIMARY KEY (`idEscenario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escenario`
--

LOCK TABLES `escenario` WRITE;
/*!40000 ALTER TABLE `escenario` DISABLE KEYS */;
INSERT INTO `escenario` VALUES (1,'Mistery',1),(2,'war',1),(3,'city',1),(4,'Ficcion',1),(5,'Horror',1);
/*!40000 ALTER TABLE `escenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaje`
--

DROP TABLE IF EXISTS `personaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personaje` (
  `idPersonaje` int NOT NULL AUTO_INCREMENT,
  `nombrePersonaje` varchar(30) DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  PRIMARY KEY (`idPersonaje`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaje`
--

LOCK TABLES `personaje` WRITE;
/*!40000 ALTER TABLE `personaje` DISABLE KEYS */;
INSERT INTO `personaje` VALUES (1,'King',1),(2,'Reina',1),(3,'soldier',1),(4,'Naufrago',1),(5,'Astronauta',1);
/*!40000 ALTER TABLE `personaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('zKc7Al237I0Hnedb6ybwWqcyYky5r2oW',1608155703,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"usuario\":{\"idUsuario\":1,\"nombreUsuario\":\"Douglas\",\"apellidoUsuario\":\"Zúñiga\",\"tipoUsuario\":\"alumno\",\"usuario\":\"dzuniga\",\"password\":\"123456\",\"estado\":1,\"createdAt\":null,\"updatedAt\":\"2020-12-08T22:15:32.000Z\"}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `textoIA`
--

DROP TABLE IF EXISTS `textoIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `textoIA` (
  `idTextoIA` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  `nombreEscenario` varchar(30) DEFAULT NULL,
  `nombrePersonaje` varchar(30) DEFAULT NULL,
  `nombreUsuario` varchar(30) DEFAULT NULL,
  `ultimaAccion` varchar(45) DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  `parrafo1` text,
  `parrafo2` text,
  `parrafo3` text,
  `parrafo4` text,
  `parrafo5` text,
  `parrafo6` text,
  `parrafo7` text,
  `parrafo8` text,
  `parrafo9` text,
  `parrafo10` text,
  `parrafo11` text,
  `parrafo12` text,
  `parrafo13` text,
  `parrafo14` text,
  `parrafo15` text,
  `parrafo16` text,
  `parrafo17` text,
  `parrafo18` text,
  `parrafo19` text,
  `parrafo20` text,
  `parrafo21` text,
  `parrafo22` text,
  `parrafo23` text,
  `parrafo24` text,
  `parrafo25` text,
  `parrafo26` text,
  `parrafo27` text,
  `parrafo28` text,
  `parrafo29` text,
  `parrafo30` text,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idTextoIA`),
  KEY `fk_textoIA_1_idx` (`idUsuario`),
  CONSTRAINT `fk_textoIA_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `textoIA`
--

LOCK TABLES `textoIA` WRITE;
/*!40000 ALTER TABLE `textoIA` DISABLE KEYS */;
INSERT INTO `textoIA` VALUES (59,7,'war','soldier','Erick',NULL,1,'You are Erick, you are always fighting to keep the world safe.\"\n\n\"Then why do you have to fight?\"\n\n\"Because it will prove to be a blessing for you.\"\n\n\"And that is why you are in the first place. You have a purpose. You have an obligation.\"\n\n\"And you must live it. You must live it with your family.\"\n\nI was a soldier, I was a warrior. I was the only one to die, I was the one who had to die.\n\n\"And you are a war hero!\"\n\n\"You deserve this, you deserve this.\"\n\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 04:17:23','2020-12-14 04:17:56'),(60,7,'war','soldier','Erick',NULL,1,'You are Erick, and your job is to protect the people of the nation.\"\n\nHis comments followed a statement by President Obama, who called him \"an unrepentant coward\" who said he would \"take the fight to the enemy\" if elected.\n\n\"I am an unrepentant coward. I will not stand idly by and watch as the American people are led to believe that a president who insults the Constitution and the rule of law is not qualified, who has to stand in front of an army of thugs and a commander in chief who has to stand with our nation, and then we are going to be told that\n',' You are not allowed to drop weapons or take any other actions. You are not allowed to kill anyone in your group or your party. You are not allowed to kill your parents or brothers unless you provide a reason to do so. You are not allowed to steal anything from your enemies. You are not allowed to steal food from your enemies. You are not allowed to steal the gold in your party. You are not allowed to steal the gold in your home. You are not allowed to steal anything from your friends. You are not allowed to steal items from your allies. You are not allowed to steal items from your enemies. You are not\n',' You have a spellcasting ability. You know the following spells. You are proficient with those in your class. You also know the following spells of your choice from the book of the Dead: Dispel Magic, Blink, and Summon Butterflies You have a fast metabolism. You can spit out hot coals of flame at your foes. Message History The ghost of Beogh, Escort, takes you a step back. The ghost of Beogh, Escort, takes you a step back. You are taken to a burning heap. Your flesh is cold. Your body is cold. You feel your flesh being cold. You are drained of\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 04:20:34','2020-12-14 04:22:25'),(61,1,'war','soldier','Douglas',NULL,1,'You are Douglas. You are a soldier. You are a war officer. You are a war doctor. You are a war doctor. You have a job...a job for you. You have an idea for a job. You have a job for yourself. You are a war veteran. You are a war veteran. You have a job for yourself. You are a war veteran. You have a job for yourself. You are a war veteran. You have a job for yourself. You are a war veteran. You have a job for yourself. You are a war veteran. You have a job for yourself. You are a war veteran. You have\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 04:26:09','2020-12-14 04:26:10'),(62,1,'war','soldier','Douglas',NULL,1,'You are Douglas, so you must understand how to fight. The key to achieving this goal is to practice one thing at a time, and learn something from the experience. It is your job to be able to control your actions and be a good soldier to your people. That is the essential lesson of combat training.\"\n\nThe first time the two of them talked about the first training session, I could feel the tension and pain in his chest.\n\n\"The training session is only the beginning in the coming months. It will be a new phase that will test your skills, your mind, your discipline and your strength. I want to show you\n','You are Douglas. You are a war hero . You are a war hero\'s trainer . You are the leader of an evil cult . You worship the Shining One . You are frail (-10% HP). You have a pair of small horns on your head. You are very clumsy (Dex -2). You are clumsy (Dex -1). Message History There is a staircase leading out of the dungeon here. The door opens up. The door opens up. The door slams shut behind you. There is a staircase leading out of the dungeon here. The floor is frozen. The floor is frozen. The floor is frozen. The floor is frozen. The\n',' You gain a bonus to AC every time you do this. You must remain in combat for 60 minutes before you can use this power again. You regain all expended uses of this power at the end of each of your turns.\n\nTorture: Your Intelligence score increases by 1.\n\nGravity: You have advantage on Dexterity saving throws against falling objects.\n\nCunning: You have advantage on Wisdom (Perception) and Strength (Intelligence) checks.\n\nVigorous Action: You make a melee attack against a creature you can see within 60 feet. The target must succeed on a Wisdom saving throw or\n','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 04:27:37','2020-12-14 04:36:20'),(63,1,'war','soldier','Erick',NULL,1,'You are Erick and it is your duty to defend your country. Your country is your responsibility. Your country is your duty. I am sure that you will stand up to these men and they will stand up for you. I would like to thank you for your service, but I know that you are not the best of men. I want to thank you for your courage and your courage has allowed me to see you through all of this. I see you standing up for your country. I love you and I am asking you to go home and protect your country. We must have a great rally for tonight and I have to say I am so grateful.\n','You are Erick, you must protect your fellow soldiers. Every soldier must defend their own lives.\n\nIf you are not willing to give up your life and the life of your comrades, then you will go to the enemy.\n\nThe enemy will try to kill you.\n\nYour life is your life.\n\nAnd you will die.\n\nThe enemy will try to kill you.\n\nIf your life is yours, then you must not only fight for your friends and your comrades, but for the world.\n\nYou will never be able to go back to the front line.\n\nIn order to survive, your entire\n','','','','',' You have 2 spell slots. You know the following spells: Your Spells Type Power Failure Level Hunger a - Corona Hex/Air ###### 1% 1 None b - Blink Tloc N/A 1% 2 None c - Swiftness Chrm/Air ###### 1% 3 None d - Stoneskin Trmt/Erth ###### 1% 2 None e - Conjure Flame Conj/Fire ###### 1% 3 None f - Fireball Conj/Ice ###### 1% 2 None g - Fireball Conj/Fire ###### 1% 3 None h - Fireball Conj/Fire ###### 1% 3 None i - Rep\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 04:36:45','2020-12-14 04:38:31'),(64,1,'war','soldier','Douglas',NULL,1,'You are Douglas and you have no idea how to kill an enemy, and that\'s why I\'m writing this article. You can read about how it\'s done here.\n\nWhat you need to know about \'The Killing Machine\'\n\nA combatant is a person who has been in combat for almost seven months, or if you prefer, a decade or more. The term \'combatant\' refers to a person who has been in combat for more than eight months, or if you prefer, a decade or more. The term \'combatant\' refers to a person who has been in combat for more than eight months, or if you prefer\n','You are Douglas, you have to be prepared for the worst. This is what you need to do.\n\nYou have to do everything in your power to be ready.\n\nYou have to be brave.\n\nYou have to be smart.\n\nYou have to be able to deal with the enemy.\n\nYou have to be strong.\n\nYou have to be smart.\n\nYou have to be able to defend your country.\n\nYou have to be smart.\n\nYou have to be strong.\n\nYou have to be smart.\n\nYou have to be smart.\n\nYou have to be smart\n',' You have 4 skill ranks. You are not proficient in any of the following areas. Athletics: You have a +2 bonus on Acrobatics checks made to run. Endurance: Your Strength modifier increases by 1. Medicine: Your Strength modifier increases by 1. Languages: Your Dexterity modifier increases by 1. Charisma: You have a +2 bonus on Stealth checks made to hide in plain sight. Luck: You have a +2 bonus on saves against spells and abilities that are not your normal. Athletics: You have a +2 bonus on Acrobatics checks made to run. You have 4 skill ranks. You are not proficient in any\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 04:39:10','2020-12-14 04:40:03'),(65,1,'war','soldier','Douglas',NULL,1,'You are Douglas, you\'re not. I am a man. And I\'m not going to let you go.\n\n\"You are a woman. You, too, are a woman.\"\n\n\"I am a woman. I am a woman. And I am not going to let you go,\" he yelled.\n\n\"You are a man and a woman,\" he continued.\n\n\"You are a woman. You, too, are a woman,\" he said.\n\n\"I am a man. I am a man. And I am not going to let you go,\" he said.\n\n\"You are a man\n',' You are the one and only one in the world. You are the only one who has survived the war. You are the only one who is still in the war. You are the only one who has survived the war. You are the only one who has survived the war. Your eyes do not turn to you. Your lips do not turn to you. Your eyes do not turn to you. Your blood does not flow to your mouth. Your eyes do not turn to your lips. Your lips do not turn to your lips. Your feet do not turn to your feet. Your eyes do not turn to your lips. Your breath does\n',' You are a soldier. You choose to defend your home. You are a soldier. You choose to defend your family. You are a war soldier. You choose to protect your home. You are a war soldier. You choose to defend your family. You are a war soldier. You choose to protect your home. You are a war soldier. You choose to protect your family. You are a war soldier. You choose to protect your home. You are a war soldier. You choose to protect your home. You are a war soldier. You choose to protect your home. You are a war soldier. You choose to protect your home.\n',' You are willing to die. You are willing to put your life on the line. You are willing to sacrifice your life to the greatest of warriors. Your name is the same as the one you are fighting. You are a warrior. You are not a warlord. You are not a warlord. You are not a warlord. You are not a warlord. You are not a warlord. You are not a warlord. You are not a warlord. You are not a warlord. You are not a warlord. You are not a warlord. You are not a warlord. You want to live\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 04:43:32','2020-12-14 04:46:56'),(66,1,'war','soldier','Douglas',NULL,1,'You are Douglas.\n\nI am a hero.\n\nI am a warrior.\n\nI am a warrior.\n\nI am an apostle.\n\nI am an apostle.\n\nI am an apostle.\n\nI am a warrior.\n\nI am a warrior.\n\nI am a warrior.\n\nI am a warrior.\n\nI am a warrior.\n\nI am a warrior.\n\n\nI have a lot of questions for you!\n\nI ask the questions of your people,\n\nI ask the questions of your people,\n\nI ask the questions of your people,\n\n\n',' You choose to undefined. You select undefined. You will never be an officer of the United States Navy.You choose to undefined. You select undefined. You choose undefined. You select undefined. You will never be an officer of the U.S. Air Force.You choose to undefined. You choose undefined. You select undefined. You select undefined. You select undefined. You select undefined. You will never be an officer of the U.S. Navy.You choose to undefined. You select undefined. You choose undefined. You select undefined. You select undefined. You will never be an officer of the U.S. Air Force.\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 04:49:56','2020-12-14 04:55:01'),(67,1,'war','soldier','Douglas',NULL,1,'You are Douglas, you are not a mercenary. You take the risk of saving your comrades and your own lives. But when you do, you are not a soldier. You do not have the courage to choose to risk your own life.\"\n\nAs if to prove his point, the leader of the party of his own party, who was also the leader of the party of the party of the party of the party of the party of the party of the party of the party of the party of the party of the party of the party of the party of the party of the party of the party of the party of the party of the party of the\n',' You choose to undefined. The world will turn upside down. You choose to undefined. The world will turn upside down. The world will turn upside down. The world will turn upside down. The world will turn upside down. You have no choice. You have no choice. You have no choice. The world will turn upside down. The world will turn upside down. The world will turn upside down. The world will turn upside down. The world will turn upside down. You have no choice. You have no choice. You have no choice. The world will turn upside down. The world will turn upside down. The world will turn\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 04:55:33','2020-12-14 04:57:31'),(68,1,'war','soldier','Douglas',NULL,1,'You are Douglas who has been assigned to the US military, a soldier fighting for the enemy, a soldier who will fight for our cause and our country.\"\n\nThe attack was the latest in a string of incidents in which an American has been killed in a drone attack. On October 23, the US military killed a drone pilot in the Philippines. On October 24, the US launched a surprise strike on suspected al-Qaeda affiliates in Pakistan.<|endoftext|>A recent study found that people who have a high degree of intelligence have lower cortisol levels than those who don\'t, according to a study published by the University of Illinois at Urbana-Champaign.\n',NULL,'\n\nOn the other hand, you are a war hero. You would rather fight and die than be a hero. You know what\'s best for your country. You believe in the rule of law, and you care about the people. You have the ability to live life with dignity. You know you\'ll be a hero if you stand up to them, and you\'re going to be a hero if you fight for them. If you stand up to them, they won\'t let you down.\n\nOn the other hand, if you\'re a war hero, and you fight for freedom, you have the chance to be a hero\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 04:58:49','2020-12-14 04:59:35'),(69,1,'war','soldier','Douglas',NULL,1,'You are Douglas, a war hero. You will not be let down by the enemy.\n\nWith that, you will be able to stand on your feet and fight.\n\nTo survive, you will need to fight.\n\nThat is why I am here!\n\nI am a war hero. I am a war hero. I stand on my feet and fight.\n\nThis is a war hero. I am a war hero. I stand on my feet and fight.\n\nA war hero is any person who has fought and died for an army.\n\nYou are a war hero. You will not be let down by\n',' Choose from your military training, or you choose to become a Warlord. You gain proficiency with all weapons and armor you can afford. When you reach 5th level, you can choose to learn martial arts. Choose one of the following: Arcana, Insight, Investigation, Nature, Medicine, Religion, or Wisdom. You learn the following class features of your choice from the Blood Magic table. The following are not considered normal class features of the Blood Magic school: Arcana, Insight, Investigation, Nature, Medicine, Religion, or Wisdom. You gain proficiency in the following class features from the Blood Magic school. Additionally, you can use\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 05:00:28','2020-12-14 05:01:43'),(70,1,'war','soldier','Douglas',NULL,1,'You are Douglas, Commander J.T., who has to do his job, and I don\'t know how you feel about that. You know, as a soldier, you can\'t be that man because you\'re not a war soldier. And you don\'t know how you feel about that. But you know how you feel about that, and you know how you feel about the other thing, the fact that you\'ve got a problem, and you\'re having problems, and you feel like that\'s all you\'ve gotta take. I think you\'re too young for that. So you\'re not going to be a war soldier. [Laughter.]\n\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 05:20:00','2020-12-14 05:20:00'),(71,1,'war','soldier','Douglas','',1,'You are Douglas, are you not?\"\n\n\"I am,\" said I. \"I am a soldier of the world. I am the commander of the Great War. I am the God of peace. I am the Lord Ruler of the world, the God of peace and the Lord Ruler of the people. I am the commander of the people. I am the Great God of peace. I am the Lord Ruler of the world. I am the Lord Ruler of the people. I am the Great God of peace. I am the Lord Ruler of the people. I am the Great God of peace. I am the Lord Ruler of the people.\n',' You have spent your life in the service of your nation. You have never been a war hero. You are the best of the best. You have no idea how much you love and respect what you have achieved. If you want to be a soldier, you must be willing to sacrifice your life for your country. You must be willing to sacrifice your career for this country. You must be willing to serve America. You must be willing to stand for the values that your country stands for. You must be willing to fight and die for the ideals America stands for. You must be willing to stand up for the values that your country stands for\n','\n\nYou will not be allowed to use armor or armor plates unless you have been assigned a specific purpose\n\nIf you are not assigned a specific purpose you will lose this ability, and you will be able to use it again, but your current status will not change\n\nYou can use this ability multiple times per day, or you can only use it once.\n\nYou can only use this ability once per day, or you can only use it once.\n\nYou must have been assigned a specific purpose to use this ability. If you already have that purpose, you will no longer be able to use it.\n\n\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 05:20:21','2020-12-14 05:21:12'),(72,1,'war','soldier','Douglas','run',1,'You are Douglas.\n\nThe United States of America, and my military service, are one of the first nations to have the ability to fight the fight itself.\n\nIt is a great honor to serve as a member of the U.S. Army and the Army of the Potomac, and the United States Army.\n\nI am proud to be a part of the Second World War Veterans of America.\n\nI am proud to be a member of the U.S. Army and the Army of the Potomac, and the United States Army.\n\nIn the years to come, I will dedicate myself to serving as\n',' You may also choose to help the army. You may not be part of the army. You may not volunteer. You may not have a reputation as a soldier. You may not be a soldier-perks. You may be a soldier-perks.\n\nCasting: The command will ask you to cast a spell of some kind. You must cast it once. Casting a spell of the summoned creature is a standard action. The spell is cast using a spell slot of 3rd level or higher.\n\nCreating a spell of the summoned creature is a standard action. Casting a spell of the summoned creature is a standard action\n',' You are a warlord. You are not a coward. You are not a warlord. You do not deserve to be here. You are not a warlord. You will never get rid of me. There are many people in this world who will never get rid of me. You can choose to kill me. If you\'re killed, I\'ll be your last. Your next step is to try to kill me. If you do succeed, I\'ll kill you. If you fail, I\'ll kill you. If you\'re killed, I will kill you. What do you do when you die? What do you do when you\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 05:28:34','2020-12-14 05:30:17'),(73,1,'war','soldier','Douglas','kill myself',1,'You are Douglas who needs to know the basics.\n\nI\'m not saying you should never buy a gun from someone who has been killed in combat. There\'s nothing wrong with that. But if that\'s what you want from your family, then you should try to find someone who will give you that.\n\nThe first thing that I have to say about this is that there are all sorts of things you can do with your life that you will never get again, and you have options.\n\nAs a kid, the only thing that helped me through the day was getting out of the military…and I\'ve been out and about in the\n',' You have escaped! You have no weapons. You are hungry. You have visited 1 branch of the dungeon, and seen 5 of its levels. You have collected 4109 gold pieces. You have spent 716 gold pieces at shops. Inventory: Hand weapons l - a +4,+5 great sword of holy wrath (weapon) j - a +5,+3 mace of stealth (weapon) L - the +0,+6,+0 great sword of the Dead {venom, rN+} (You found it on level 1 of the Elven Halls) It inflicts extra damage upon your enemies. It\n',' You gain experience and may spend it to strengthen your wits. You know enemy spells. You know how to speak and how to speak one set of spell-like abilities. You know how to control yourself. You have a wand of flame. You can use it to cast this spell. You must know the spells described below to cast this spell. You know how to use the flame. The flame engulfs you and attacks you. You can see a friendly creature in dim light within 60 feet of you. On a hit, you may expend a spell slot of 1st level or higher to do so. On a failed save, the\n',' If you are not, you will not be able to stand against it. If you are not, you will be able to stand against your enemy. You are a warrior. You have a purpose. You will do whatever is necessary to survive. If you aren\'t, you will be killed.\n\n\"No, I\'m not afraid of you. I\'m afraid of you. I\'m afraid of you. I\'m afraid of you. You know what I\'m afraid of? I\'m afraid of you. I\'m afraid of you.\n\n\"I am a soldier, a soldier. My mission is not to defeat you,\n','\n\nIt\'s a bit more confusing. I believe you have to ask yourself: \"How do I get a soldier?\"\n\nThe answer is simple: by going to war.\n\nThe U.S. military is not in the business of killing people. The U.S. military is not in the business of killing people.\n\nHow do you get a soldier?\n\nYou\'re looking at a combat-style rifle, a sniper rifle, a grenade launcher, a grenade launcher as a weapon you can use to kill people.\n\nThe U.S. military, on the other hand, is not in\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 05:32:34','2020-12-14 05:36:58'),(74,1,'war','soldier','Erick','hurt enemies',1,'You are Erick, the right thing to do is not to be a war soldier. You must not be a war soldier because some other country would make you. You must not be a war soldier because some other country would make you. So you are not a soldier, I am not. I am a soldier because I like to fight.\"\n\n\"What will I do? I am not a war soldier.\"\n\n\"I am a soldier because I like to fight. I am a soldier because I like to fight.\"\n\n\"No, I want you to be a soldier because I want you to be the best. I want you to\n',' You do not need to be a soldier to run. You are not a god. You have no idea what you are doing. You must be a soldier because you are a warlord. You have no idea what you are doing. You must be a warlord because you are a god. You are not a god. You cannot be a warlord of your own choosing. You cannot be a god of any race. You cannot be a warlord of your own choosing. You cannot be a god of any race. You have no idea what you are doing. You must be a warlord because you are a warlord. You\n',' You do not need to kill other players or other players. You can take on other players. You can take on other players who are not your friends. (You can only take on a few characters at a time.) You are a pacifist. You are not a bad person. You are not a bad person. You are not a bad person. You are not a bad person. All of these are true. All of these are true. (All of these are true.) All of these are true. All of these are true. All of these are true. (All of these are true.) All of these are true.\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 23:12:09','2020-12-14 23:15:48'),(75,1,'war','soldier','Erick','',1,'You are Erick, you will be attacked by your enemy.\n\nIf you are not using your new weapon, you will be attacked by your old one.\n\nYou may be forced to fight on your own in combat, or you may be able to use your new weapon and use it against your enemies, in order to have the ability to fight as a warlord.\n\nYou are not invincible and you cannot be killed by your enemy, or by your enemy\'s traps and traps. If you are using your new weapon, you may be able to use it against your enemies and will be able to fight as a warlord, and you\n',' You are almost certain to be killed. This is a very dangerous place. You are very close to the gates of hell. You are the only survivor who can save the other survivors. And you are going to need to find your way out. Don\'t ask, just get out.\n\nA lot of things would have taken a very long time, even if you had survived. But you must have been able to survive. The only way to avoid this is to fight.\n\nThere are four ways to die. The first one is to be killed. The second one is to be killed. The third one is to be killed\n',' You have escaped. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating. You have finished eating\n',NULL,NULL,NULL,NULL,' You have 2 extra moves of your choice. You have a very fast metabolism. You are quite resistant to further mutation. You are immune to poison. Your body sometimes deteriorates upon taking damage. You have a slow metabolism. Message History You see here a large granite statue of a man in a stone armour. It has been replaced by a statue of Tiberius. You feel your strength returning. You feel your spell resistance return. You feel your magic is slightly increased. You feel slightly better. The stone statue of Tiberius comes into view. You feel your spell resistance return. You feel your spells are slightly increased. You feel\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-14 23:31:13','2020-12-15 21:49:29'),(76,1,'war','soldier','Erick',NULL,1,'You are Erick, and you are not. You have never been a war soldier. You have never been a war soldier. You are a war soldier. You are a war soldier. The game is over.\n\nRAW Paste Data\n\nThis mod is being reviewed by the modders and is for informational purposes only. The mods are not intended to be used for any other purpose. Feel free to comment on the mods you use. It is in no way a substitute for a good gaming experience and the mods are not meant as a substitute for any other gaming experience. The mods will not be used to play the game. Please do not use\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-15 21:55:01','2020-12-15 21:55:01');
/*!40000 ALTER TABLE `textoIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(40) DEFAULT NULL,
  `apellidoUsuario` varchar(40) DEFAULT NULL,
  `tipoUsuario` varchar(10) DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Douglas','Zúñiga','alumno','dzuniga','123456',1,NULL,'2020-12-08 22:15:32'),(2,'Erick','Espejo','docente','eespejo','123456',1,NULL,NULL),(3,'Christian','Villena','alumno','cvillena','mjgjj',1,'2020-12-05 02:02:59','2020-12-08 22:15:39'),(4,'Adrián','Alva','alumno','aalva','4c9cW:dE4_',0,'2020-12-05 02:04:37','2020-12-07 23:31:11'),(5,'Pedro','Alva','alumno','root','xJ2uFxRp3E',0,'2020-12-05 03:31:21','2020-12-05 03:34:58'),(6,'Mark','Aguirre','alumno','maguirre','markaguirre',1,'2020-12-05 03:35:13','2020-12-08 22:15:46'),(7,'Anthony','Haro','alumno','aharo','123456',1,'2020-12-07 23:31:01','2020-12-13 00:16:54'),(8,'dsadas','dsadas','alumno',NULL,'zzeqd',0,'2020-12-08 06:41:31','2020-12-08 06:41:38'),(9,'Luis','Alvarado','alumno',NULL,'fjyke',0,'2020-12-10 04:39:21','2020-12-10 04:39:37'),(10,'nombre','apellido','alumno','napellido','vrwko',0,'2020-12-10 23:11:17','2020-12-10 23:19:17'),(11,'Alumno1','Apellido1','alumno','aapellido1','ergov',0,'2020-12-10 23:19:52','2020-12-11 00:56:09'),(12,'adsda','asdada','alumno',NULL,'xuxsg',0,'2020-12-11 00:39:41','2020-12-11 00:39:44'),(13,'Erick','dsadas','alumno','edsadas','xyskk',0,'2020-12-11 00:39:54','2020-12-11 00:40:56'),(14,'dsda','dasa','alumno','ddasa','rsamr',0,'2020-12-11 00:40:51','2020-12-11 00:40:54'),(15,'Jose','Ramirez','alumno','jramirez','vvyns',0,'2020-12-12 04:17:36','2020-12-12 04:20:56'),(16,'Erick','Alva','alumno','ealva','nppor',1,'2020-12-12 06:11:34','2020-12-12 06:11:34');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-15 17:10:15
