CREATE DATABASE  IF NOT EXISTS `chatgpt_clone` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chatgpt_clone`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: chatgpt_clone
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` char(36) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES ('230448bc-4211-400b-89b7-31befb062c12','2026-10-29 12:54:08'),('30c5682a-6f2d-4ac0-bca3-188917e4ffb3','2026-11-01 13:32:11'),('7aa995e4-33b4-42d8-989d-5b858179e47d','2026-10-25 19:48:00'),('85c8b14d-c3f2-4ac4-a2aa-0b4b3774cd20','2026-10-25 21:48:29'),('872f61d2-e085-461a-a018-d8669df14aba','2026-11-08 11:22:42'),('ab21c5ac-216c-453c-9819-6e1e8af89b9b','2026-10-26 09:05:29'),('fb2cf735-028e-43a4-841b-aef510eb9141','2026-10-27 16:38:38'),('fcf7fe8e-7d33-4122-9656-e028c438fb01','2026-11-01 14:29:55');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversation_id` char(36) NOT NULL,
  `role` enum('user','assistant') NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `conversation_id` (`conversation_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'7aa995e4-33b4-42d8-989d-5b858179e47d','user','hello','2026-10-25 19:48:00'),(2,'7aa995e4-33b4-42d8-989d-5b858179e47d','assistant','Hello! How can I assist you today?','2026-10-25 19:48:02'),(3,'7aa995e4-33b4-42d8-989d-5b858179e47d','user','Can you tell me what is the weather in Jerusalem right now ?','2026-10-25 19:48:27'),(4,'7aa995e4-33b4-42d8-989d-5b858179e47d','assistant','I can\'t provide real-time weather updates. However, you can easily check the current weather in Jerusalem by using a weather app, a website, or a virtual assistant. If you need information about typical weather patterns or seasonal advice, feel free to ask!','2026-10-25 19:48:28'),(5,'85c8b14d-c3f2-4ac4-a2aa-0b4b3774cd20','user','Hello ! What can I ask you about ?','2026-10-25 21:48:29'),(6,'85c8b14d-c3f2-4ac4-a2aa-0b4b3774cd20','assistant','Hello! You can ask me about a wide range of topics, including:\n\n1. **General Knowledge**: History, science, geography, and more.\n2. **Technology**: Software, hardware, programming, and trends.\n3. **Health and Fitness**: Nutrition, exercise, mental health, etc.\n4. **Education**: Study tips, learning resources, subjects.\n5. **Travel**: Destinations, tips, and cultural insights.\n6. **Entertainment**: Movies, music, books, and video games.\n7. **Philosophy and Psychology**: Concepts, theories, and thought experiments.\n8. **Advice**: Personal development, relationships, and decision-making.\n9. **Current Events**: News and developments up until October 2023.\n10. **Creative Writing**: Help with stories, poems, and prompts.\n\nFeel free to ask about anything specific or general that interests you!','2026-10-25 21:48:33'),(7,'85c8b14d-c3f2-4ac4-a2aa-0b4b3774cd20','user','Can you give me some places to visit in Jerusalem ?','2026-10-25 21:49:05'),(8,'85c8b14d-c3f2-4ac4-a2aa-0b4b3774cd20','assistant','Certainly! Jerusalem is a city rich in history, culture, and spirituality. Here are some must-visit places in Jerusalem:\n\n1. **Western Wall (Kotel)**: A sacred site for Jews, the Western Wall is the last remaining part of the Second Temple. Visitors often place notes in the cracks of the wall and engage in prayer.\n\n2. **Old City**: A UNESCO World Heritage site, the Old City is home to significant religious sites, markets, and narrow streets. It\'s divided into four quarters: Jewish, Christian, Muslim, and Armenian.\n\n3. **Dome of the Rock**: An iconic Islamic shrine located on the Temple Mount, the Dome of the Rock is known for its stunning gold dome and beautiful mosaics. It is considered one of the holiest sites in Islam.\n\n4. **Church of the Holy Sepulchre**: A major pilgrimage destination for Christians, this church is believed to be the site of Jesus\' crucifixion and burial. It is a place of reverence and history, with many chapels and relics.\n\n5. **Yad Vashem**: Israel\'s official memorial to the victims of the Holocaust, Yad Vashem offers a comprehensive historical narrative and solemn exhibitions dedicated to this tragic period.\n\n6. **Mount of Olives**: Offering panoramic views of the Old City and Jerusalem, the Mount of Olives is significant in Christian tradition. It is home to several important churches and sites, including the Garden of Gethsemane.\n\n7. **Israel Museum**: This museum houses a vast collection of art and archaeology, including the Dead Sea Scrolls and historical artifacts that provide insight into Jewish culture and history.\n\n8. **Ein Kerem**: A picturesque neighborhood located on the outskirts of Jerusalem, known for its charming streets, beautiful churches, and lovely hiking trails. It is believed to be the birthplace of John the Baptist.\n\n9. **Mahane Yehuda Market**: A vibrant market where you\'ll find fresh produce, spices, baked goods, and local delicacies. It’s a great place to experience Jerusalem’s culinary scene and local culture.\n\n10. **City of David**: This archaeological site offers a glimpse into Jerusalem\'s ancient history, with excavations revealing structures from the time of King David, including tunnels and water systems.\n\nThese places reflect the diverse heritage and significance of Jerusalem, making it a fascinating destination for any traveler. Enjoy your visit!','2026-10-25 21:49:10'),(9,'ab21c5ac-216c-453c-9819-6e1e8af89b9b','user','Can you speak in Hebrew ?','2026-10-26 09:05:29'),(10,'ab21c5ac-216c-453c-9819-6e1e8af89b9b','assistant','כן, אני יכול לדבר בעברית. איך אפשר לעזור לך היום?','2026-10-26 09:05:31'),(11,'ab21c5ac-216c-453c-9819-6e1e8af89b9b','user','תתן לי רשימה של דברים שאפשר לתת לתינוקת בת חצי שנה לאכול','2026-10-26 09:05:51'),(12,'ab21c5ac-216c-453c-9819-6e1e8af89b9b','assistant','בהחלט! הנה רשימה של מזונות שאפשר להציע לתינוקת בת חצי שנה:\n\n1. **פירות מרוסקים**:\n   - בננה\n   - תפוח מבושל או מרוסק\n   - אגס\n   - אבטיח (ללא גרעינים)\n\n2. **ירקות מבושלים ומרוסקים**:\n   - גזר\n   - דלעת\n   - בטטה\n   - תפוח אדמה\n\n3. **דייסות**:\n   - דייסת אורז\n   - דייסת תפו”א\n   - דייסת שיבולת שועל\n\n4. **תבשילים קלים**:\n   - פירה מתפוחי אדמה וגזר\n   - תבשיל עדשים קל\n\n5. **חלב אם או פורמולה**:\n   - ניתן להמשיך להניק או לתת פורמולה אם יש צורך.\n\n6. **יוגורט (לא מסוכר)**:\n   - יוגורט של תינוקות ללא סוכר, אפשר גם עם פירות מרוסקים.\n\n7. **קינוחים קלים**:\n   - פודינג אורז\n   - פודינג תפו”א\n\n8. **לחם רך**:\n   - לחם רך (לדוגמה, לחם רותח) חתוך לקוביות קטנות מאוד או לחם טפח.\n\nחשוב לזכור להintroduce מזונות חדשים אחד אחד, ולא לשלב מספר מזונות חדשים באותו הזמן, כדי לעקוב אחרי תגובות אלרגיות אפשריות. כדאי גם להימנע ממזונות שלמים כמו אגוזים ודבש עד גיל שנה. מומלץ תמיד להתייעץ עם רופא הילדים לפני השינוי בתזונה של התינוק.','2026-10-26 09:05:56'),(13,'ab21c5ac-216c-453c-9819-6e1e8af89b9b','user','תוכל למצוא לי מתכון למרק שאפשר לתת לה ?','2026-10-26 09:06:12'),(14,'ab21c5ac-216c-453c-9819-6e1e8af89b9b','assistant','בוודאי! הנה מתכון פשוט למרק ירקות טעים ובריאותי שאפשר לתת לתינוקת בת חצי שנה:\n\n### מרק ירקות לתינוקות\n\n#### מרכיבים:\n- 1 גזר קטן\n- 1 תפוח אדמה קטן\n- 1/2 דלעת קטנה (אפשר לשים דלעת קובה או דלעת ערמונים)\n- 1/4 קישוא\n- 1/2 בצל קטן (אופציונלי)\n- 2 כוסות מים או ציר ירקות (אם זה ביתי וללא תיבול)\n- 1/2 כפית שמן זית (אופציונלי)\n\n#### הוראות הכנה:\n1. **הכנה:** קלפו וחיתכו את כל הירקות לקוביות קטנות.\n  \n2. **בישול:** בסיר בינוני שימו את הירקות ולטוס את הבצל (אם כח הבחירה) עם מעט שמן זית עד שהבצל ממש מתרכך (ע\"י חום נמוך, לא להשחים). \n\n3. **הוספת מים:** הוסיפו את המים או הציר ותנו למרק לרתוח. \n\n4. **בישול ירקות:** כאשר המרק רותח, הנמיכו את הלהבה ובשלו את הירקות עד שהם רכים (כ-20-30 דקות).\n\n5. **ריסוק:** לאחר שהירקות רכים, תוכלו לרסק אותם עם בלנדר ידני או במעבד מזון עד שהמרק חלק, או להשאיר אותו עם מעט גושי ירקות אם התינוקת מוכנה לכך.\n\n6. **קירור:** תנו למרק להתקרר לפני שמגישים לתינוקת.\n\n7. **הגשה:** הוציאו כמות קטנה והגישו בתבנית מוגנת-חום.\n\n### הערות:\n- אפשר לשמור את המרק במקפיא או במקרר לזמן קצר.\n- תמיד מומלץ לטעום מנות לפני שמתן לתינוק לתוודא שאין בעיה עם הטעם ואף לבדוק אלרגיות אפשריות.\n\nבתיאבון!','2026-10-26 09:06:18'),(15,'fb2cf735-028e-43a4-841b-aef510eb9141','user','Tell me a one-liner programming joke','2026-10-27 16:38:38'),(16,'fb2cf735-028e-43a4-841b-aef510eb9141','assistant','Why do programmers prefer dark mode? Because light attracts bugs!','2026-10-27 16:38:40'),(17,'fb2cf735-028e-43a4-841b-aef510eb9141','user','still one-liner, but change the subject','2026-10-27 16:40:47'),(18,'fb2cf735-028e-43a4-841b-aef510eb9141','assistant','Why do mathematicians always fight the system? Because they can’t handle the decimals!','2026-10-27 16:40:49'),(19,'230448bc-4211-400b-89b7-31befb062c12','user','Hey ! How are you ?','2026-10-29 12:54:08'),(20,'230448bc-4211-400b-89b7-31befb062c12','assistant','Hello! I\'m just a computer program, but I\'m here and ready to help you. How can I assist you today?','2026-10-29 12:54:11'),(21,'230448bc-4211-400b-89b7-31befb062c12','user','תוך כמה שעות אפשר ליטול אדוויל פעם שניה ?','2026-10-29 12:54:24'),(22,'230448bc-4211-400b-89b7-31befb062c12','assistant','אדוויל (Ibuprofen) בדרך כלל ניתן ליטול כל 6–8 שעות, אך חשוב לקרוא את ההוראות על האריזות או להתייעץ עם רופא או רוקח לפני השימוש. אם יש לך שאלות ספציפיות לגבי המינון או השימוש, כדאי לפנות לאיש מקצוע רפואי.','2026-10-29 12:54:26'),(23,'30c5682a-6f2d-4ac0-bca3-188917e4ffb3','user','היי','2026-11-01 13:32:11'),(24,'30c5682a-6f2d-4ac0-bca3-188917e4ffb3','assistant','היי! איך אני יכול לעזור לך היום?','2026-11-01 13:32:14'),(25,'30c5682a-6f2d-4ac0-bca3-188917e4ffb3','user','מי אתה חושב שהולך לנצח בהשרדות ישראל ?','2026-11-01 13:32:43'),(26,'30c5682a-6f2d-4ac0-bca3-188917e4ffb3','assistant','אין לי ניבויים לגבי מי ינצח בהשרדות ישראל, משום שזה תלוי בהרבה גורמים כמו אסטרטגיות, קואליציות ויכולות של המתמודדים. מי אתה חושב שזוכה פוטנציאלית?','2026-11-01 13:32:45'),(27,'fcf7fe8e-7d33-4122-9656-e028c438fb01','user','תוכל למצוא לי אתר שיש בו בגדי תינוקות בזול ?','2026-11-01 14:29:55'),(28,'fcf7fe8e-7d33-4122-9656-e028c438fb01','assistant','כמובן! יש כמה אתרים שיכולים להציע בגדי תינוקות במחירים נוחים. הנה כמה מהם:\n\n1. **AliExpress** - אתר סיני המציע מגוון רחב של בגדי תינוקות במחירים נמוכים. כדאי לבדוק ביקורות על המוכרים לפני הרכישה.\n\n2. **Amazon** - ישנם הרבה מוכרים עם מבצעים טובים על בגדים לתינוקות.\n\n3. **eBay** - אפשר למצוא בגדים חדשים ושימושים במחירים טובים.\n\n4. **שופינג IL** - אתר ישראלי שמרכז חנויות עם מבצעים שונים, כולל בגדי תינוקות.\n\n5. **הום דיפו/הום סנטר** - יש לפעמים מחלקות שמציעות בגדים במחירים משתלמים.\n\nתמיד כדאי לבדוק גם את מבצעי סוף עונה או חנויות מקומיות שיכולות להציע הנחות.','2026-11-01 14:29:58'),(29,'872f61d2-e085-461a-a018-d8669df14aba','user','Hello','2026-11-08 11:22:42'),(30,'872f61d2-e085-461a-a018-d8669df14aba','assistant','Hello! How can I assist you today?','2026-11-08 11:22:44'),(31,'872f61d2-e085-461a-a018-d8669df14aba','user','What are the results of the elections in Israel ?','2026-11-08 11:23:11'),(32,'872f61d2-e085-461a-a018-d8669df14aba','assistant','As of my last update in October 2023, I don\'t have access to real-time data, including the latest election results. However, the most recent Israeli general election took place on November 1, 2022, which led to Benjamin Netanyahu and his Likud party forming a government with a coalition of right-wing and religious parties.\n\nFor the most accurate and current results of any recent elections in Israel, I recommend checking official news sources or the Israeli Central Election Committee\'s website for the latest updates.','2026-11-08 11:23:14'),(33,'872f61d2-e085-461a-a018-d8669df14aba','user','The elections of 27 October , 2026','2026-11-08 11:23:41'),(34,'872f61d2-e085-461a-a018-d8669df14aba','assistant','As of my last update, I don\'t have information regarding events or elections that have occurred after October 2023, including the Israeli elections scheduled for October 27, 2026. To find the latest information on the results or details of that election, I suggest checking reliable news sources or official election reporting organizations closer to the date. If you have any other questions or need information on related topics, feel free to ask!','2026-11-08 11:23:43'),(35,'872f61d2-e085-461a-a018-d8669df14aba','user','עד איזה תאריך אתה מעודכן ?','2026-11-08 11:24:01'),(36,'872f61d2-e085-461a-a018-d8669df14aba','assistant','אני מעודכן עד אוקטובר 2023. אם יש לך שאלות או אם יש משהו ספציפי שאתה רוצה לדעת, אל תהסס לשאול!','2026-11-08 11:24:03'),(37,'872f61d2-e085-461a-a018-d8669df14aba','user','בכל סוגי המידע ?','2026-11-08 11:24:13'),(38,'872f61d2-e085-461a-a018-d8669df14aba','assistant','אני מעודכן בעיקר במידע עד אוקטובר 2023 בתחומים רבים, כולל חדשות, מדע, טכנולוגיה, תרבות, היסטוריה ועוד. עם זאת, אני לא יכול לספק מידע בזמן אמת או עדכונים שקרו אחרי התאריך הזה. אם יש לך שאלה ספציפית או נושא מסוים שמעניין אותך, אני כאן כדי לעזור!','2026-11-08 11:24:15');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-08 14:59:05
