-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.13.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `short` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES (1,'Geschicklichkeit','GES'),(2,'Konstitution','KON'),(3,'Reaktion','REA'),(4,'Stärke','STR'),(5,'Charisma','CHA'),(6,'Intuition','INT'),(7,'Logik','LOG'),(8,'Willenskraft','WIL'),(9,'Magie','MAG'),(10,'Edge','EDG'),(11,'Essenz','ESS'),(12,'Magie','M'),(13,'Initiative','INI');
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damage`
--

DROP TABLE IF EXISTS `damage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `damage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ghost` int(11) DEFAULT NULL,
  `damagetype` enum('mundan','astral') DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damage`
--

LOCK TABLES `damage` WRITE;
/*!40000 ALTER TABLE `damage` DISABLE KEYS */;
INSERT INTO `damage` VALUES (1,1,'astral',5),(2,1,'mundan',4),(3,14,'astral',2),(4,15,'astral',1),(5,15,'mundan',2),(6,16,'mundan',2),(7,16,'astral',2),(8,21,'astral',5),(9,21,'mundan',5),(10,19,'astral',2);
/*!40000 ALTER TABLE `damage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `force`
--

DROP TABLE IF EXISTS `force`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `force` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `force`
--

LOCK TABLES `force` WRITE;
/*!40000 ALTER TABLE `force` DISABLE KEYS */;
INSERT INTO `force` VALUES (1,'Einfluss','Art: M Handlung: komplex Reichweite: BF Dauer: Sofort <br>\nDiese Kraft erlaubt es einem Wesen, Suggestionen in den Geist eines Ziels zu projizieren und diese Person zu einer Handlung, Reaktion oder Emotion zu veranlassen. Legen Sie eine vergleichende Probe zwischen der Magie + Charisma des Wesens und der Willenskraft des Ziels ab. Gelingt die Probe, führt das Ziel den Befehl aus. Wird es mit der Falschheit des Befehls konfrontiert, darf das Opfer eine Willenskraftprobe ablegen, um die Kontrolle abzuschütteln, wie unter Geistige Manipulationen, S. 202 beschrieben.'),(2,'Astrale Gestalt','Art: M Handlung: Auto Reichweite: Selbst Dauer: Immer <br>\nDer Critter existiert nur auf der Astralebene. Er kann nicht von physischen Angriffen oder physischen Zaubersprüchen geschädigt werden,nur astrale Angriffe oder Manazauber können ihn verletzen. Ebenso kann ein astraler Critter keine Kreaturen in der materiellen Welt beeinflussen, es sei denn sie sind Dualwesen oder haben ihre astrale Wahrnehmung aktiviert. Critter mit dieser Kraft können sich auf der physischen Ebene auf dieselbe Weise manifestieren (siehe S. 182) wie astral projizierende Zauberer.'),(3,'Bewegung','Art: P Handlung: komplex Reichweite: BF Dauer: A <br>\nDer Critter kann die Bewegungsrate des Ziels innerhalb des von ihm kontrollierten Gebiets erhöhen oder senken. Multiplizieren oder dividieren Sie die Bewegungsrate des Ziels mit der Magiestufe des Critters.'),(4,'Bewusstsein','Art: P Handlung: Auto Reichweite: Selbst Dauer: Immer <br>\nCritter mit Bewusstsein sind sich ihrer selbst bewusst und können entsprechende Entscheidungen treffen. Sie werden als Ungeübt (siehe S. 108) in allen Fertigkeiten eingestuft, die sie nicht besitzen, und können normal Proben ohne Fertigkeitswert durchführen. Critter mit Bewusstsein außerdem in der Lage, neue Fertigkeiten zu erlernen. Während die meisten Critter mit Bewusstsein mundan sind, gibt es unter ihnen auch einige, die Erwacht sind und ein Magieattribut besitzen. Erwachte Critter mit Bewusstsein können alle magischen Aufgaben ausführen und folgen denselben Regeln für Magie wie normale Erwachte Charaktere. Man weiß noch nicht, ob Critter mit Bewusstsein Technomancer werden können.'),(5,'Binden','Art: P Handlung: komplex Reichweite: BF Dauer: Sofort <br> \nDer Critter kann bewirken, dass sein Opfer an jeder Oberfläche „festklebt“, die es berührt (oder an ihm selbst). Das Opfer kann versuchen, sich mit einer komplexen Handlung zu befreien und eine vergleichende Probe auf Stärke + Konstitution gegen Magie + Willenskraft des Critters würfeln. Gewinnt das Opfer, so kann es entkommen.'),(6,'Materialisierung','Art: P Handlung: komplex Reichweite: Selbst Dauer: A <br>\nBestimmte astrale Critter sind in der Lage, sich selbst in die materielle Welt zu projizieren und dadurch mit physischen Wesen zu interagieren. Wenn sie materialisiert sind, können diese Critter mit physischen Zielen interagieren. Zusätzlich erhalten materialisierte Critter die Kraft Immunität gegen normale Waffen (S. 287).'),(7,'Suche','Art: P Handlung: komplex Reichweite: Speziell Dauer: Speziell <br>\nDas Wesen kann nach Personen, Orten oder Objekten suchen. Um das Ziel zu finden, wird eine ausgedehnte Magie + Intuition (5, 10 Minuten)-Probe abgelegt. Es gelten die Modifikatoren aus der Suchmodifikatoren-Tabelle. Der Critter muss das Ziel, nach dem er sucht, vorher schon einmal gesehen haben: Geister können nach allem suchen, von dem ihnen ihr Beschwörer ein geistiges Bild übermittelt. Critter mit der Kraft Astrale Gestalt können die Suche im Astralraum durchführen und müssen sich nicht materialisieren, während sie suchen.'),(8,'Unfall','Art: P Handlung: komplex Reichweite: BF Dauer: Sofort <br>\nDiese Kraft erlaubt es dem Wesen, scheinbar normale Unfälle zu verursachen. Die genaue Art des Unfalls bleibt dem Spielleiter überlassen, basierend auf den Umständen und der Umgebung. Wenn ein Charakter Ziel der Kraft Unfall wird, würfeln Sie eine vergleichende Probe zwischen Magie + Willenskraft des Critters und Reaktion + Intuition des Charakters. Gewinnt der Critter, erleidet der Charakter einen Unfall, der vom Spielleiter bestimmt wird. Möglichkeiten dafür sind: er stolpert, bekommt den Mund voll Blätter, stößt sich schmerzhaft sein Knie, lässt etwas fallen oder hat einen geistigen Aussetzer und wirft den Ladestreifen seiner Waffe aus. Der Unfall selbst ist nicht gefährlich, doch die Umwelt kann ihn gefährlich machen. Auf einem schmalen Gebirgspfad auszurutschen, kann zum Beispiel sehr unvorteilhaft sein. Wenn der Critter 4 oder mehr Nettoerfolge erzielt, behandeln Sie den Unfall als kritischen Patzer – der Unfall ist nicht nur ein Ausrutscher, sondern ein schlimmes Missgeschick. Wenn ein Critter Unfall gegen ein Fahrzeug einsetzt, zwingt er den Fahrer, eine Crashprobe abzulegen. Das Magieattribut des Critters dient dabei als negativer Würfelpool-Modifikator auf die Probe.'),(9,'Fertigkeit',NULL),(10,'Gesteigerte Sinne','Art: P Handlung: Auto Reichweite: Selbst Dauer: Immer <br>\nGesteigerte Sinne umfassen alle vorstellbaren Sinneswahrnehmungen, die über die des Menschen hinausgehen, darunter Restlichtverstärkung und Infrarotsicht, verbessertes Gehör und Geruch, Organe zur Wärmewahrnehmung, natürliches Sonar usw.'),(11,'Psychokinese','Art: P Handlung: komplex Reichweite: BF Dauer: A <br>\nEin Wesen mit Psychokinese kann eine psychokinetische Kraft mit einer Stärke und Geschicklichkeit gleich den Erfolgen aus einer Magie + Willenskraft-Probe erzeugen, ähnlich dem Spruch Zauberfinger (S. 202).'),(12,'Verschleierung','Art: P Handlung: einfach Reichweite: BF Dauer: A <br>\nDiese Kraft bezieht sich auf die Fähigkeit eines Crittes, sich selbst auf geheimnisvolle Weise vor anderen zu verbergen oder alternativ etwas zu verbergen, wonach andere suchen. Verschleierung subtrahiert eine Anzahl Würfel gleich der Magiestufe des Critters von allen Wahrnehmungsproben, um das verschleierte Subjekt zu finden. Verschleierung kann auf eine Anzahl Ziele gleich der Magiestufe des Critters angewandt werden. Die Verschleierten können sich gegenseitig sehen, wenn der Critter dies erlaubt.'),(13,'Grauen','Art: M Handlung: komplex Reichweite: BF Dauer: Speziell  <br>\nDiese Kraft verleiht einem Wesen die Macht, seinen Opfern überwältigende Furcht einzuflößen. Das Opfer wird in Panik bis zum nächstgelegenen sicheren Ort rennen und nicht stehenbleiben, bis es außer Sichtweite ist und eine sichere Entfernung zurückgelegt hat. Der Critter legt eine vergleichende Probe auf Willenskraft + Magie gegen die Willenskraft des Opfers ab. Die Furcht dauert pro Nettoerfolg, den der Critter erzielt hat, 1 Kampfrunde an, und selbst danach muss dem Ziel eine Willenskraft + Charisma (Nettoerfolge des Critters)-Probe gelingen, um zu dem Critter zurückzugehen und sich ihm zu stellen.'),(14,'Magischer Schutz','Art: M Handlung: Frei Reichweite: BF Dauer: Sofort <br>\nEin Critter mit dieser Kraft des Magischen Schutzes kann die Fertigkeit Antimagie erlernen und Spruchabwehr wirken bzw. Zaubersprüche bannen, genau so wie ein Zauberer (SR4.01D, S.175)'),(15,'Schutz','Art: P Handlung: komplex Reichweite: BF Dauer: A <br>\nDiese Kraft verleiht dem Critter die Fähigkeit, gewöhnliche umweltbedingte Unfälle und Gefahren (sowohl natürliche als als auch solche, die von der Kraft Unfall verursacht wurden) abzuwenden, wie zum Beispiel jemanden vor einem Hitzschlag zu bewahren oder vor dem Ertrinken zu retten. Die Schutzkraft kann auch davor schützen, dass ein Patzer auftritt. Schutz kann gleichzeitig auf eine Anzahl Charaktere geich dem Magieattribut des Critters angewendet werden.'),(16,'Stille','Art: P Handlung: Komplex Reichweite: Speziell Dauer: A <br>\nEine Kreatur mit dieser Kraft kann sich in eine Kugelförmige Zone der Stille hüllen, deren Radius in Metern gleich dem Matieattribut der Kreatur ist. Geräusche, die innerhalb der Zone erzeugt werden sind gedämpft und der Schall, der von ausserhalb in die Zone eindringt, ist sowohl von der Kratur als auch von allen anderen innerhalb der Zone schwerer zu hören. Wahrnehmungsproben auf Gehörbasis und Schadenscodes von Schallangriffen sind um der Magieattribut der Kratur erschwert bzw. gesenkt'),(17,'Verschlingen','Verschlingen Art: P Handlung: komplex Reichweite: B Dauer: A <br>\nDiese Kraft verleiht einem Critter die Fähigkeit, Opfer in sich oder in das Gelände hineinzusaugen, das er kontrolliert, und damit zu ersticken. Behandeln Sie Verschlingen wie einen Nahkampfangriff. Wenn der Angriff gelingt, richtet er Schaden an (siehe unten), und der Critter verschlingt das Opfer. Jedesmal, wenn die Kampfphase des Critters an der Reihe ist, richtet der Critter automatisch Schaden mit einem Grundschadenscode gleich seinem Magieattribut an. Nettoerfolge des anfänglichen Nahkampfangriffs erhöhen den Schadenscode Das Opfer widersteht dem Schaden normal mit einer Schadenswiderstandsprobe, wobei es Konsitution + halbe Stoßpanzerung (aufgerundet) verwendet, wenn nicht anders vermerkt. Verschlungene Opfer können sich nicht bewegen. Während der Kampfphase des Opfers kann dieses versuchen, zu entkommen. Legen Sie eine vergleichende Probe zwischen Stärke + Konstitution des Opfers und Magie + Konstitution des Critters ab. Gewinnt das Opfer, dann ist ihm die Flucht gelungen und gilt nicht mehr als verschlungen. Die sekundären Effekte einiger Verschlingen-Angriffe lauten wie folgt: Verschlingen durch Feuer: Das Opfer muss Feuerschaden widerstehen (siehe S. 155). Verschlingen durch Wasser: Das Opfer muss geistigem Schaden widerstehen. Dies ist härter als normales Ertrinken, da der Critter extremen Druck auf das Opfer ausübt. Opfer, die durch den geistigen Schaden bewusstlos werden, nehmen weiterhin Schaden, wobei der geistige Schaden wie üblich in den körperlichen übergeht. Verschlingen durch Luft: Das Opfer muss geistigem Schaden wie von einem inhalierten Toxin widerstehen (siehe S. 244). Panzerung schützt nicht gegen diesen Angriff, andere Schutzausrüstung jedoch schon (siehe die Tabelle Schutz vor Toxinen, S. 245). Wenn das Opfer vom geistigen Schaden bewusstlos wird, wird weiterhin Schaden angerichtet, wobei der geistige Schaden wie üblich in den körperlichen übergeht.Verschlingen durch Erde: Das Opfer muss körperlichem Schaden widerstehen.'),(18,'Übler Atem','Art: P Handlung: komplex Reichweite: Speziell Dauer: Sofort  <br>\nDer Critter kann einen Übelkeit erregenden Gestank verbreiten, um seine Opfer außer Gefecht zu setzen. Behandeln Sie dies als einen Angriff mit einem inhalierten Toxin (Geschwindigkeit: Sofort, Kraft: Magiestufe des Critters, Wirkung: Betäubungsschaden, Erbrechen: siehe S. 245). Der Atemstoß breitet sich kegelförmig bis zu (Konstitution) Meter aus und kann bis zu zwei Ziele treffen, die höchstens einen Meter voneinander entfernt sind.'),(19,'Verwirrung','Art: M Handlung: komplex Reichweite: BF Dauer: A <br>\nDie Kraft Verwirrung erlaubt es einem Critter, ein Ziel zu verwirren, so dass es unfähig ist, Entscheidungen zu treffen, seinen Orientierungssinn verliert, sich nicht mehr erinnert, was es gerade tun wollte usw. Der Critter legt eine vergleichende Probe auf Magie + Willenskraft gegen die Willenskraft des Ziels ab. Die vom Critter erzielten Nettoerfolge dienen als negativer Würfelpool-Modifikator für alle Handlungen, die das Ziel unternimmt.'),(20,'Schatten','Art: P Handlung: Frei Reichweite: Selbst Dauer: A <br>\nDiese Kraft ermöglicht einer Kreatur, sich in völlige Dunkelheit zu hüllen und so als Schatten zu tarnen. Diese Kraft ist im prallen Tageslicht nutzlos und bei völliger Dunkelheit überflüssig, aber unter allen anderen Lichtbedingungen ist eine Kreatur mir dieser Kraft sehr schwer zu entdecken. Die Wahrnehmungsproben, um die Kreatur bei normalem Licht zu entdecken, gilt ein Würfelpoolmodifikator von -2, bei schwarzer Beleuchtung sogar -4. In einer lichtdruchfluteten Umgebung ohne nennenswerten Schatten gibt es einen Würfelpoolmodifikator von +1 um die Kreatur zu entdecken.'),(21,'Weissagung','Art: M Handlung: Speziell Reichweite: Speziell Dauer: Speziell <br>\nDiese Kraft funktioniert wie die metamagische Technik der Weissagung (S.57), wobei der Geist jedoch Magie + Intuition statt Arcana einsetzen.'),(22,'Tierbeherrschung','Art: M Handlung: komplex Reichweite: BF Dauer: A <br>\nManche Wesen können ihre mundanen Artgenossen geistig manipulieren. Diese Kraft erlaubt es dem Wesen, das Verhalten eines Tieres oder einer Gruppe von Tieren zu lenken. Dieses Verhalten muss sich innerhalb dessen abspielen, was für das Tier normal ist. Ein kontrollierter Affe könnte beispielsweise nicht Auto fahren, aber er könnte angewiesen werden, auf einen Baum zu klettern, einen Gegenstand zu holen, anzugreifen, still zu sitzen oder jemandem zu folgen. Tiere, die das Blickfeld verlassen, können nicht mehr kontrolliert werden, aber sie werden weiterhin alle Befehle ausführen, die sie erhalten haben. Das Wesen kann eine Anzahl kleinerer Tiere (Katzen, Ratten usw.) gleich seinem Charisma x 5 oder eine Anzahl größerer Tiere (Wölfe, Löwen, Bären usw.) gleich seinem Charisma kontrollieren. Diese Kraft kann nicht auf Critter angewendet werden, die über die Kraft Bewusstsein oder ein Magieattribut verfügen.'),(23,'Elementarer Angriff','Art: P Handlung: komplex Reichweite: BF Dauer: Sofort <br>\nEin Critter mit elementarem Angriff kann eine zielgerichtete Explosion von Schaden oder negativer Energie freisetzen, sei es Feuer, Eiseskälte, Elektrizität, Wasser usw. Die Kraft wird wie ein Fernkampfangriff behandelt (siehe Fernkampf, S. 140), wobei die Geschicklichkeit + Exotische Fernkampfwaffe des Critters eingesetzt wird. Der Schadensrode ist gleich der Magie des Critters und wird als Kälte-, Elektrizitäts- oder Feuerschaden behandelt (siehe S. 155), passend zur Art des Angriffs. Die Art eines Elementaren Angriffs, die von einem Geist benutzt wird, entspricht seinem Element und wird bei seiner Beschwörung ausgewählt; einmal festgelegt, kann sie nicht mehr geändert werden.'),(24,'Energieaura','Art: P Handlung: Auto Reichweite: B Dauer: Immer <br>\nEin Critter mit Energieaura strahlt ständig eine Aura von schädlicher oder negativer Energie aus, zum Beispiel Feuer, Eiseskälte, Elektrizität oder etwas ähnliches. Nahkampfangriffe, die von dem Critter ausgeführt werden, erhal- ten einen +4-Bonus auf den Schadenscode, und der Schaden wird als Kälte-, Elektrizitäts- oder Feuerschaden (siehe S. 155) betrachtet, passend zu der Aura. Bei einem erfolgreichen Nahkampfangriff gegen einen Critter mit Energieaura muss der Angreifer eine Schadenswiderstandsprobe gegen die Schadensart der Energieaura ablegen – der Schadenscode entspricht dem Magiewert des Critters.'),(25,'Natürlicher Zauberspruch','Art: P Handlung: komplex Reichweite: je nach Zauber Dauer: je nach Zauber <br>\nEine Kreatur mit einem natürlichen Zauberspruch besitzt die instinktive Fähigkeit, einen Spruch zu wirken. Der Critter muss die Fertig- keit Spruchzauberei besitzen, um die Kraft effektiv einzusetzen. Natürliche Zaubersprüche, die von einem Critter gewirkt werden, funktionieren genauso wie normale Zaubersprüche, und Zauberer können wie gewohnt Antimagie dagegen einsetzen.'),(26,'Gift','Art: P Handlung: Auto Reichweite: B Dauer: Sofort <br>\nDer Critter sondert ein natürliches Gift ab, das für Charaktere und andere Critter giftig ist. Behandeln Sie es als Toxin (siehe S. 245) mit den folgenden Attributen: Vektor: Injektion, Geschwindigkeit: 1 Kampfrunde, Kraft 6, Wirkung: körperlicher Schaden Beachten Sie, dass einige Critter Gifte mit abweichenden Attributen besitzen, wie bei ihren individuellen Beschreibungen vermerkt.'),(27,'Natürliche Waffe','Art: P Handlung: komplex Reichweite: B Dauer: Sofort <br>\nDer Critter besitzt eine natürliche Form der Bewaffnung, die körperlichen Schaden anrichten kann, wie zum Beispiel Klauen, scharfe Zähne oder einen Stachel. Die Beschreibung dieser Kraft umfasst die Art des Angriffs sowie ihren Schadenscode und Panzerbrech-Wert. Natürliche Waffen können entweder Nahkampfwaffen oder Fernkampfwaffen sein, und Critter folgen bei ihrem Einsatz den Standardkampfregeln. Critter benutzen die Fertigkeit Waffenloser Kampf, wenn sie mit natürlichen Nahkampfwaffen angreifen, und die Fertigkeit Exotische Fernkampfwaffe, wenn sie mit natürlichen Fernkampfwaffen angreifen. Critter ohne Natürliche Waffe können trotzdem waffenlose Angriffe durchführen. Wie bei regulären Charakteren beträgt der Schaden dann [Stärke ÷ 2]G.'),(28,'Wetterbeherrschung','Art: P Handlung: komplex Reichweite: BF Dauer: A <br>\nDie Kraft Wetterbeherrschung erlaubt es einem Critter, bestimmte Wetterbedingungen zu erzeugen. Das gewünschte Wetter muss in der Umgebung möglich sein, in der die Kraft eingesetzt wird (zum Beispiel keine Schneestürme im Death Valley oder Hitzewellen in Island). Die Wetteränderung baut sich allmählich auf und erreicht ihren Höhepunkt, sobald der Critter eine ausgedehnte Probe auf Magie + Willenskraft (10, 30 Minuten) absolviert hat. Die Kreatur ruft das gewünschte Wetter nur herbei, sie kann es nicht kontrollieren. Eine Kreatur, die ein Gewitter beschwört, kann also beispielsweise nicht bestimmen, wo die Blitze einschlagen.');
/*!40000 ALTER TABLE `force` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghost`
--

DROP TABLE IF EXISTS `ghost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `power` int(11) DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `bound` tinyint(4) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghost`
--

LOCK TABLES `ghost` WRITE;
/*!40000 ALTER TABLE `ghost` DISABLE KEYS */;
INSERT INTO `ghost` VALUES (14,6,8,3,1,1),(15,2,3,4,0,1),(16,1,1,6,0,1),(17,6,4,1,0,0),(18,9,4,3,0,1),(19,6,4,1,0,2),(20,3,1,1,0,2),(21,7,3,4,0,3);
/*!40000 ALTER TABLE `ghost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghost_forces`
--

DROP TABLE IF EXISTS `ghost_forces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ghost_forces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ghost` int(11) DEFAULT NULL,
  `force` int(11) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ghost_forces_1` (`ghost`),
  KEY `fk_ghost_forces_2` (`force`),
  CONSTRAINT `fk_ghost_forces_2` FOREIGN KEY (`force`) REFERENCES `force` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ghost_forces_1` FOREIGN KEY (`ghost`) REFERENCES `ghost` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghost_forces`
--

LOCK TABLES `ghost_forces` WRITE;
/*!40000 ALTER TABLE `ghost_forces` DISABLE KEYS */;
INSERT INTO `ghost_forces` VALUES (9,14,23,NULL),(10,14,15,NULL),(11,15,13,NULL),(12,17,24,NULL),(14,18,3,NULL);
/*!40000 ALTER TABLE `ghost_forces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `attribute` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_skill_1` (`attribute`),
  CONSTRAINT `fk_skill_1` FOREIGN KEY (`attribute`) REFERENCES `attribute` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'Askennen',6),(2,'Astralkampf',8),(3,'Ausweichen',3),(4,'Spruchzauberei',9),(5,'Waffenloser Kampf',1),(6,'Wahrnehmung',6),(7,'Exotische Fernkampfwaffe',1),(8,'Fliegen',1),(9,'Handwerk',6),(10,'Antimagie',9),(11,'Arcana',7),(12,'Klingenkampf',1),(13,'Knüppel',1);
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '\n',
  `name` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `movement_slow` int(11) DEFAULT NULL,
  `movement_fast` int(11) DEFAULT NULL,
  `weaknesses` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Erdgeist',10,25,NULL,'globe'),(2,'Feuergeist',15,40,NULL,'fire'),(3,'Luftgeist',15,75,NULL,'cloud'),(4,'Geist des Menschen',10,25,NULL,'user'),(5,'Geist des Tieres',10,45,'','flash'),(6,'Wassergeist',10,25,NULL,'tint'),(7,'Schutzgeist',15,40,NULL,'tower'),(8,'Helfergeist',10,25,NULL,'wrench'),(9,'Pflanzengeist',5,15,NULL,'leaf'),(10,'Ratgebergeist',10,25,NULL,'eye-open');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_attribute`
--

DROP TABLE IF EXISTS `type_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `mod` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_statmods_1` (`attribute`),
  KEY `fk_type_attribute_1` (`type`),
  KEY `fk_type_attribute_2` (`attribute`),
  CONSTRAINT `fk_type_attribute_1` FOREIGN KEY (`type`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_attribute_2` FOREIGN KEY (`attribute`) REFERENCES `attribute` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_attribute`
--

LOCK TABLES `type_attribute` WRITE;
/*!40000 ALTER TABLE `type_attribute` DISABLE KEYS */;
INSERT INTO `type_attribute` VALUES (1,2,1,4),(2,1,1,-2),(3,3,1,2),(4,4,1,4),(5,2,2,1),(6,1,2,2),(7,3,2,3),(8,4,2,-2),(9,2,3,-2),(10,1,3,3),(11,3,3,4),(12,4,3,-3),(13,2,4,1),(14,3,4,2),(15,4,4,-2),(16,2,5,2),(17,1,5,1),(18,3,5,2),(19,4,5,2),(20,2,6,2),(21,3,6,2),(22,2,7,1),(23,1,7,2),(24,3,7,3),(25,4,7,2),(26,3,8,2),(27,4,8,2),(28,2,9,3),(29,1,9,-1),(30,3,9,2),(31,4,9,4),(32,2,10,3),(33,1,10,-1),(34,3,10,2),(35,4,10,1),(36,13,7,1),(37,13,1,2),(38,13,2,3),(39,13,3,3),(40,13,4,2),(41,13,5,2),(42,13,6,2);
/*!40000 ALTER TABLE `type_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_force`
--

DROP TABLE IF EXISTS `type_force`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_force` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `force` int(11) DEFAULT NULL,
  `optional` tinyint(4) DEFAULT NULL,
  `details` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_force_1` (`type`),
  KEY `fk_type_force_2` (`force`),
  CONSTRAINT `fk_type_force_1` FOREIGN KEY (`type`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_force_2` FOREIGN KEY (`force`) REFERENCES `force` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_force`
--

LOCK TABLES `type_force` WRITE;
/*!40000 ALTER TABLE `type_force` DISABLE KEYS */;
INSERT INTO `type_force` VALUES (1,1,2,0,NULL),(2,1,3,0,NULL),(3,1,4,0,NULL),(4,1,5,0,NULL),(5,1,6,0,NULL),(6,1,7,0,NULL),(7,1,15,0,NULL),(8,1,23,1,NULL),(9,1,13,1,NULL),(10,1,12,1,NULL),(11,1,17,1,NULL),(12,1,19,1,NULL),(13,2,2,0,NULL),(14,2,4,0,NULL),(15,2,23,0,NULL),(16,2,24,0,NULL),(17,2,6,0,NULL),(18,2,8,0,NULL),(19,2,17,0,NULL),(20,2,19,0,NULL),(21,2,13,1,NULL),(22,2,15,1,NULL),(23,2,7,1,NULL),(24,2,18,1,NULL),(25,3,2,0,NULL),(26,3,3,0,NULL),(27,3,4,0,NULL),(28,3,6,0,NULL),(29,3,7,0,NULL),(30,3,8,0,NULL),(31,3,19,0,NULL),(32,3,17,0,NULL),(33,3,12,0,NULL),(34,3,23,1,NULL),(35,3,24,1,NULL),(36,3,13,1,NULL),(37,3,11,1,NULL),(38,3,15,1,NULL),(39,3,18,1,NULL),(40,4,1,0,NULL),(41,4,2,0,NULL),(42,4,4,0,NULL),(43,4,10,0,'Infrarot, Restlichtverstärkung'),(44,4,15,0,NULL),(45,4,7,0,NULL),(46,4,8,0,NULL),(47,4,6,0,NULL),(48,4,12,0,NULL),(49,4,19,0,NULL),(50,4,3,1,NULL),(51,4,13,1,NULL),(52,4,25,1,'ein dem Beschwörer bekannter Zauber, maximale Kraftstufe = Kraft des Geistes'),(53,4,11,1,NULL),(54,5,2,0,NULL),(55,5,3,0,NULL),(56,5,4,0,NULL),(57,5,10,0,'Gehör, Geruch, Restlichverstärkung'),(58,5,13,0,NULL),(59,5,6,0,NULL),(60,5,22,0,NULL),(61,5,26,1,NULL),(62,5,27,1,'Schadenscode = (Kraft)K, PB 0'),(63,5,12,1,NULL),(64,5,19,1,NULL),(65,5,15,1,NULL),(66,5,7,1,NULL),(67,5,18,1,NULL),(68,6,2,0,NULL),(69,6,3,0,NULL),(70,6,4,0,NULL),(71,6,6,0,NULL),(72,6,7,0,NULL),(73,6,15,0,NULL),(74,6,19,0,NULL),(75,6,12,0,NULL),(76,6,5,1,NULL),(77,6,23,1,NULL),(78,6,24,1,NULL),(79,6,8,1,NULL),(80,6,15,1,NULL),(81,6,28,1,NULL),(82,7,2,0,NULL),(83,7,3,0,NULL),(84,7,4,0,NULL),(85,7,13,0,NULL),(86,7,14,0,NULL),(87,7,6,0,NULL),(88,7,7,0,NULL),(89,7,9,1,'ein Schutzgeist kann eine zusätzliche Kampffertigkeit statt einer optionalen Kraft erhalten'),(90,7,23,1,NULL),(91,7,27,1,'Schadenscode = Kraft'),(92,7,11,1,NULL),(93,7,22,1,NULL),(94,7,12,1,NULL),(95,8,2,0,NULL),(96,8,3,0,NULL),(97,8,4,0,NULL),(98,8,5,0,NULL),(99,8,6,0,NULL),(100,8,7,0,NULL),(101,8,8,0,NULL),(102,8,1,1,NULL),(103,8,9,1,'ein Helfergeist kann eine zusätzliche technische oder körperliche Fertigkeit statt einer optionalen '),(104,8,10,1,'Gehör, Restlichtverstärkung, Infrarotsicht oder Geruch'),(105,8,11,1,NULL),(106,8,12,1,NULL),(107,9,2,0,NULL),(108,9,4,0,NULL),(109,9,13,0,NULL),(110,9,14,0,NULL),(111,9,6,0,NULL),(112,9,15,0,NULL),(113,9,16,0,NULL),(114,9,12,0,NULL),(115,9,17,0,NULL),(116,9,3,1,NULL),(117,9,7,1,NULL),(118,9,18,1,NULL),(119,9,8,1,NULL),(120,9,19,1,NULL),(121,10,2,0,NULL),(122,10,4,0,NULL),(123,10,14,0,NULL),(124,10,6,0,NULL),(125,10,20,0,NULL),(126,10,15,0,NULL),(127,10,7,0,NULL),(128,10,19,0,NULL),(129,10,21,0,NULL),(130,10,1,1,NULL),(131,10,10,1,'Gehör, Restlichtverstärkung, Infrarotsicht oder Geruch'),(132,10,13,1,NULL),(133,10,17,1,NULL);
/*!40000 ALTER TABLE `type_force` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_skill`
--

DROP TABLE IF EXISTS `type_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `skill` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_skill_1` (`type`),
  KEY `fk_type_skill_2` (`skill`),
  CONSTRAINT `fk_type_skill_1` FOREIGN KEY (`type`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_skill_2` FOREIGN KEY (`skill`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_skill`
--

LOCK TABLES `type_skill` WRITE;
/*!40000 ALTER TABLE `type_skill` DISABLE KEYS */;
INSERT INTO `type_skill` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,7),(5,1,5),(6,1,6),(7,2,1),(8,2,2),(9,2,3),(10,2,7),(11,2,8),(12,2,5),(13,2,6),(14,3,1),(15,3,2),(16,3,3),(17,3,7),(18,3,8),(19,3,5),(20,3,6),(21,4,1),(22,4,2),(23,4,3),(24,4,4),(25,4,5),(26,4,6),(27,5,1),(28,5,2),(29,5,3),(30,5,5),(31,5,6),(32,6,1),(33,6,2),(34,6,3),(35,6,7),(36,6,6),(37,6,5),(38,7,10),(39,7,1),(40,7,2),(41,7,3),(42,7,7),(43,7,12),(44,7,13),(45,7,5),(46,7,6),(47,8,1),(48,8,2),(49,8,3),(50,8,9),(51,8,6),(52,8,5),(59,9,10),(60,9,1),(61,9,2),(62,9,3),(63,9,6),(64,9,5),(65,10,11),(66,10,1),(67,10,2),(68,10,3),(69,10,6),(70,10,5),(71,10,4);
/*!40000 ALTER TABLE `type_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Spieler1','spieler1@example.com',''),(2,'Spieler2','spieler2@example.com',''),(3,'Spieler3','spieler3@example.com','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-06 10:28:02
