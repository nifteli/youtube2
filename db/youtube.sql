-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2015 at 11:30 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `youtube`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesstypes`
--

CREATE TABLE IF NOT EXISTS `accesstypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameAz` varchar(500) NOT NULL,
  `nameRu` varchar(500) NOT NULL,
  `nameEn` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `accesstypes`
--

INSERT INTO `accesstypes` (`id`, `nameAz`, `nameRu`, `nameEn`) VALUES
(1, 'change profile info', 'change profile info', 'change profile info'),
(2, 'view user profile', 'view user profile', 'view user profile'),
(3, 'edit user profile', 'edit user profile', 'edit user profile'),
(4, 'delete users', 'delete users', 'delete users'),
(5, 'send email', 'send email', 'send email'),
(6, 'change access', 'change access', 'change access'),
(7, 'add video links', 'add video links', 'add video links'),
(8, 'edit video links', 'edit video links', 'edit video links'),
(9, 'delete video links', 'delete video links', 'delete video links'),
(10, 'edit comments', 'edit comments', 'edit comments'),
(11, 'create folders', 'create folders', 'create folders'),
(12, 'delete folders', 'delete folders', 'delete folders'),
(13, 'add video links from file', 'add video links from file', 'add video links from file'),
(14, 'edit video links by file', 'edit video links by file', 'edit video links by file'),
(15, 'delete video links by file', 'delete video links by file', 'delete video links by file'),
(16, 'confirm comments', 'confirm comments', 'confirm comments'),
(17, 'rename folder', 'rename folder', 'rename folder'),
(18, 'access webpage general settings', 'access webpage general settings', 'access webpage general settings'),
(19, 'export to excel guests', 'export to excel guests', 'export to excel guests'),
(20, 'export to excel categories', 'export to excel categories', 'export to excel categories'),
(21, 'export to excel videos', 'export to excel videos', 'export to excel videos'),
(22, 'export to excel folders', 'export to excel folders', 'export to excel folders'),
(23, 'export to excel tags', 'export to excel tags', 'export to excel tags'),
(24, 'export to excel comments', 'export to excel comments', 'export to excel comments'),
(25, 'view video links', 'view video links', 'view video links'),
(26, 'view Comments', 'view Comments', 'view Comments'),
(27, 'delete comments', 'delete comments', 'delete comments'),
(28, 'view Folders', 'view Folders', 'view Folders'),
(29, 'edit Folders', 'edit Folders', 'edit Folders'),
(30, 'delete tags', 'delete tags', 'delete tags'),
(31, 'edit Tags', 'edit Tags', 'edit Tags'),
(32, 'view Tags', 'view Tags', 'view Tags');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catNameAz` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `catInfoAz` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `catNameEn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `catInfoEn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `catNameRu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `catInfoRu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `lastVideoAdded` datetime NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` datetime NOT NULL,
  `deletedById` int(11) DEFAULT NULL,
  `deletedByIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `questions` smallint(6) NOT NULL,
  `createdById` int(11) DEFAULT NULL,
  `createdByIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `catGroupId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catGroupId` (`catGroupId`),
  KEY `deletedById` (`deletedById`),
  KEY `createdById` (`createdById`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=282 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `catNameAz`, `catInfoAz`, `catNameEn`, `catInfoEn`, `catNameRu`, `catInfoRu`, `created`, `updated`, `lastVideoAdded`, `isDeleted`, `deleted`, `deletedById`, `deletedByIP`, `questions`, `createdById`, `createdByIP`, `catGroupId`) VALUES
(1, 'Antropologiya', 'İnsan, onun əsli, inkişafı, mövcudluğu barədə', 'Anthropology', 'About man, his/her origin, development, existence', 'Антропология', 'О человеке, его происхождении, развитии, существовании', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(2, 'Arxeologiya', 'Qədim keçmişin maddi sübutlarının qazıntısı barədə', 'Archeology', 'About the excavations of the evidences of ancient past', 'Археология', 'О раскопках вещественных доказательств древнейшего прошлого', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(3, 'Təhlükəsizlik', 'Mühafizəçilik və aşağı səviyyədəki risklər barədə', 'Security', 'About safety and low risk', 'Безопасность', 'О защищённости и низком уровне риска', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(4, 'Hərbçilik', 'Müharibə və ona hazırlıq barədə', 'Warfare', 'About war and preparation to it', 'Военное дело', 'О войне и приготовлении к ней', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(5, 'Coğrafiya (iqtisadi, siyasi)', 'Cəmiyyətin iqtisadi həyatının ərazi quruluşu barədə', 'Geography (economical, political)', 'About the territorial organization of economic life', 'География (экономическая, политическая)', 'О территориальной организации экономической жизни общества', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(6, 'Evdarlıq', 'Məişət, ev işləri barədə', 'Housekeeping', 'About household, housework', 'Домоводство', 'О бытовых, домашних делах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(7, 'Jurnalistika', 'Kütləvi məlumatların yayımlanması barədə', 'Journalism', 'About the spreading of mass information', 'Журналистика', 'О распространении массовой информации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(8, 'Oyunlar', 'Motivi prosesdə olan qeyri-məhsuldar fəaliyyət növləri barədə', 'Games', 'About unproductive activities, the motive of which is enclosed in the process', 'Игры', 'О непродуктивных видах деятельности, мотив которых заключён в процессе', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 13, NULL, '', 1),
(9, 'Mühəndislik', 'Strukturun, maşınların, qurğuların, materialların və ya proseslərin kəşf edilməsi, işləməsi, yaradılması, dəstəklənməsi və ya təmir edilməsi barədə', 'Engineering', 'About the invention, design, construction, maintenance, support or correction of structures, machines, devices, materials or processes', 'Инженерное дело', 'Об изобретении, разработке, создании, поддержке или исправлении структуры, машины, устройства, материалов или процессов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(10, 'İnformatika', 'Məlumatın yığılma, saxlanma, emal, ötürülmə, təhlil, dəyərləlndirmə metodları və prosesləri barədə', 'Computer Science (Information technologies)', 'About the methods and processes of collecting, storing, processing, transmission, analysis and evaluation of information', 'Информатика', 'О методах и процессах сбора, хранения, обработки, передачи, анализа и оценки информации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(11, 'Tarix', 'Keçmiş barədə', 'History', 'About the past', 'История', 'О прошлом', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 13, NULL, '', 1),
(12, 'Kommunikasiya (rabitə)', 'Rabitənin texnoloji vasitələri barədə', 'Communication', 'About the technological means of communication', 'Коммуникация', 'О технологических средствах связи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 13, NULL, '', 1),
(13, 'Mədəniyyətşünaslıq', 'Cəmiyyətin tarixi-sosial təcrübəsi barədə', 'Culturology', 'About the historically-social experience of people', 'Культурология', 'Об исторически-социальном опыте людей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(14, 'Linqvistika (dillər)', 'Dillər barədə', 'Linguistics (Languages)', 'About languages', 'Лингвистика (языки)', 'О языках', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(15, 'Təbabət / Səhiyyə', 'Xəstəliklərin tanınması (diaqnostikası), qabağının alınması və müalicəsi barədə', 'Medicine / Health Care', 'About the recognition, prevention and treatment of diseases', 'Медицина / Здравоохранение', 'О распознавании, предупреждении и лечении болезней', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(16, 'Meteorologiya', 'Hava barədə', 'Meteorology', 'About the weather', 'Метеорология', 'О погоде', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(17, 'Pedaqoqika', 'İnsanın tərbiyəsi və tədrisi barədə', 'Pedagogics', 'About the education and training of man', 'Педагогика', 'О воспитании и обучении человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(18, 'Siyasət', 'Müəyyən ictimai mühitdə müəyyən maraqların reallaşdırılmadakı vasitə və üsulları barədə ', 'Policy', 'About the means and methods of realization of certain interests in a particular social environment', 'Политика', 'О средствах и методах реализации определённых интересов в определённой социальной среде', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 13, NULL, '', 1),
(19, 'Politologiya', 'Hökmranlıq münasibətləri ilə əlaqədar insanların həyat fəaliyyəti', 'Politology (Political science)', 'About the sphere of human activity related to the power relations', 'Политология', 'О сфере жизнедеятельности людей, связанной с властными отношениями', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(20, 'Hüquq', 'İctimai münasibətləri tənzimləlyən davranış qaydaları barədə', 'Law', 'About the rules of conduct governing public relations', 'Право', 'О правилах поведения, регулирующих общественные отношения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 13, NULL, '', 1),
(21, 'İstehsal', 'İnsanlar tərəfindən təbii resursların hər hansı məhsula aktiv dəyişdirilmə prosesi barədə', 'Production (Manufacture)', 'The process of active transformation of natural resources by people into any product', 'Производство', 'О процессе активного преобразования людьми природных ресурсов в какой-либо продукт', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(22, 'Psixologiya / Özünün inkişafı', 'Psixiki (ruhi) proseslər / Psixikanın (ruhi aləmin) idarəedilməsi üsulları barədə', 'Psychology / Self-development', 'About the mental processes / About methods of control over the psyche', 'Психология / Саморазвитие', 'О психических процессах / О способах управления психикой', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(23, 'Din', 'Fövqəltəbii aləmə inam ilə şərtləndirilən dünya qavrayış formaları barədə', 'Religion', 'About the forms of consciousness of the world, due to the belief in the supernatural', 'Религия', 'О формах осознания мира, обусловленных верой в сверхъестественное', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(24, 'Təmir', 'Çalışa bilən və saz vəziyyətinin bərpası barədə', 'Repair', 'About the restoration (recovery) of serviceable condition', 'Ремонт', 'О восстановлении работоспособного или исправного состояния', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(25, 'Ritorika (natiqlik)', 'Nitq məharəti barədə', 'Rhetoric', 'About the art of speech', 'Риторика', 'Об искусстве речи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(26, 'Seksologiya', 'Cinsi arzusunun təzahürü və təmin edilməsi ilə bağlı insan davranışları barədə', 'Sexology', 'About the actions of a man, associated with the manifestation and satisfaction of sexual desire', 'Сексология', 'О поступках человека, связанных с проявлением и удовлетворением полового влечения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(27, 'Kənd təsərrüfatı', 'Ərzaqlarla (bitki, heyvan ilə) təmin edilməsi barədə', 'Agriculture', 'About the provision of food (vegetable, animal)', 'Сельское хозяйство', 'Об обеспечении продовольствием (растительным, животным)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 13, NULL, '', 1),
(28, 'Sosiologiya', 'Cəmiyyət barədə', 'Sociology', 'About the society', 'Социология', 'Об обществе', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(29, 'İdman', 'Yarış məqsədilə aparılan fiziki və əqli fəaliyyət barədə', 'Sport', 'About the physical and intellectual activity, done with the aim of competition', 'Спорт', 'О физической и интеллектуальной активности, совершаемой с целью соревнования', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(30, 'Standartlaşdırma / Metrologiya', 'Müxtəlif sahələrdə normaların, qaydaların və xarakteristikaların müəyyən edilməsi / ölçmədə, üsul və vasitələrdə vahidliyin təmin edilməsi barədə', 'Standardization / Metrology', 'About establishing the rules, regulations and characteristics in different areas / About uniformity in the measurements, methods and means', 'Стандартизация / Метрология', 'Об установлении норм, правил и характеристик в различных областях / Об обеспечении единства в измерениях, методах и средствах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(31, 'İnşaat', 'Binaların və  digər tikililərin inşaatı, təmiri, yenidən qurulması, bərpası və renovasiyası barədə', 'Construction (Building)', 'About the construction of buildings and structures, their repairs, reconstructions, restorations and renovations', 'Строительство', 'О возведении зданий и сооружений, их ремонте, реконструкции, реставрации и реновации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(32, 'Mətbəə işi / Litoqrafiya', 'Mətnin çapı barədə', 'Typography / Lithography', 'About printing texts', 'Типографика / Литография', 'О печати текста', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(33, 'Nəqliyyat', 'Maddi yüklərin yerdəyişmə prosesini təmin edən rabitə yolları barədə', 'Transportation (Transport)', 'About the lines of communication, to ensure the process of moving material cargo', 'Транспорт', 'О путях сообщения, обеспечивающих процесс перемещения материального груза', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(34, 'İşə düzəltmə', 'İşə düzəltmə prosesi barədə', 'Employment', 'About a getting and giving a job', 'Трудоустройство', 'Об устройстве на работу', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(35, 'Ufologiya', 'Yer kürəsi ötəsi idrak barədə', 'Ufology', 'About extraterrestrial intelligence', 'Уфология', 'О внеземном разуме', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(36, 'Filologiya', 'Bədii yaradıcılıq barədə', 'Philology', 'About literary works', 'Филология', 'О литературном творчестве', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(37, 'Fəlsəfə', 'Dünya qavrayış formaları barədə', 'Philosophy', 'About the forms of consciousness of the world', 'Философия', 'О формах осознания мира', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(38, 'Ekologiya', 'Canlı və qeyri-canlı təbiətin qarşılıqlı münasibətləri barədə', 'Ecology', 'About the relationship between animate and inanimate nature', 'Экология', 'О взаимоотношениях живой и неживой природы', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(39, 'İqtisadiyyat', 'İstehsalat, bölüşdürmə, mübadilə və istehlak sistemində formalaşan münasibətlər barədə', 'Economy', 'About the set of relations in the system of production, distribution, exchange and consumption', 'Экономика', 'О совокупности отношений, складывающихся в системе производства, распределения, обмена и потребления', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(40, 'Ekstrasensorika / Хiromantiya / Magiya / Metafizika', 'Elm tərəfindən tam sübuta yetirilməyən insan hissiyyatı barədə', 'Extrasensorics / Palmistry / Magic / Metaphysics / Paranormal', 'About the feelings of a person, which are not fully proven by science', 'Экстрасенсорика / Хиромантия / Магия / Метафизика / Паранормальное', 'О чувствах человека, не полностью доказанных наукой', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(41, 'Energetika', 'Enerji resursların dəyişdirilməsi, bölüşdürülməsi və istifadəsi barədə', 'Energetics', 'About the transformation, distribution and use of energy resources', 'Энергетика', 'О  преобразовании, распределении и использовании энергетических ресурсов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(42, 'Etnoqrafiya', 'Xalqlar barədə', 'Ethnography', 'About peoples', 'Этнография', 'О народах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 1),
(43, 'Aktyorluq / Teatrlıq', 'Səhnə obrazlarının yaradılması barədə', 'Show (theatrical, film) art', 'About the creation and performance of scenic images', 'Актёрское (театральное) искусство', 'О создании и воспроизведении сценических образов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(44, 'Applikasiya (qurama) / dekupaj / inkrustasiya (qaxma)', 'Bir materialın onun üzərinə digər materialın (fiqurların, şəkillərin, naxışın, daşların) qoyulması, yapışdırılması və ya tikilməsi yolu ilə bəzədilməsi barədə', 'Application (appliqué) / Decoupage / Inlay', 'About decorating a material by overlapping, sticking, sewing on it another material (figures, paintings, ornaments, stones)', 'Аппликация / Декупаж / Инкрустация', 'Об украшении материала, путём накладывания, наклеивания, нашивания на него другого материала (фигурок, картин, орнамента, камней)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(45, 'Muncuqlaşma', 'Muncuqdan məmulatların qayırması barədə', 'Beading', 'About the manufacture of products made of beads', 'Бисероплетение', 'Об изготовлении изделий из бисера', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(46, 'Kağız incəsənəti', 'Kağızdan məmulatların qayırması barədə', 'Paper art (origami, papier-mâché, etc.)', 'About the manufacture of products made of paper', 'Бумажное искусство (оригами, папье-маше и т.д.)', 'Об изготовлении изделий из бумаги', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(47, 'Güldançəkmə', 'Qabların boyalarla bəzədib bişirilməsi barədə', 'Vase painting', 'About painting vessels, followed by firing', 'Вазопись', 'О росписи сосудов красками с последующим обжигом', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(48, 'Vitraj', 'Memarlıq tikilidəki qapı və ya pəncərə yerinin (yarı)şəffaf rəngli lövhələrlə doldurulması barədə', 'Stained-glass window', 'About the filling colored (semi)transparent plates (glasses, stones) into the aperture of an architectural construction', 'Витраж', 'О заполнении цветными (полу)прозрачными плитами (стёклами, камнями) проёма в архитектурном сооружении', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(49, 'Vokal incəsənəti (müğənnilik)', 'Vokal əsərlərin yaradılması (ifası) barədə', 'Vocal art (songs)', 'About creation or performance of vocal works (songs)', 'Вокальное искусство (песни)', 'О создании (исполнении) вокальных произведений (песен)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(50, 'Yandırma üsulu ilə naxış açma', 'Bərk qızmış iynə vasitəsilə orqanik materialın (fanerin, kağızın, dərinin, parçanın) bəzədilməsi barədə', 'Pokerwork (Burning out, Pyrography)', 'About decorating an organic material (plywood, paper, leather, fabric) with an illustration by using a red-hot needle or a fine flame', 'Выжигание (пирография)', 'Об украшении органического материала (фанеры,  бумаги, кожи, ткани) рисунком, при помощи раскалённой иглы', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(51, 'Naxış tikmə', 'Tikilmiş (calanmış) saplar vasitəsilə materialların (parçanın, dərinin) naxışlarla bəzədilməsi barədə', 'Embroidery (Fancywork)', 'About decorating a material (textile, leather) with patterns, using the sewn threads', 'Вышивание', 'Об украшении узорами материалов (ткани, кожи), при помощи вшиваемых нитей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(52, 'Qravyura', 'Çap ottisklərdə (basmalarda) təsvirlərin yaradılması barədə', 'Engraving', 'About the creation of images in print impressions', 'Гравюра', 'О создании изображений в печатных оттисках', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(53, 'Dizaynerlik', 'Obyektlərin insanın utilitar (tətbiqi) və estetik ehtiyaclarına uyğunlaşdırılması barədə', 'Design', 'About matching objects to utilitarian and aesthetic needs of man', 'Дизайн', 'О приведении соответствия объектов  утилитарным и эстетическим потребностям человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(54, 'Rəssamlıq (naqqaşlıq, naxışlıq, qrafika və s.)', 'Hər hansı səth üzərinə boyaların vurulması yolu ilə təsvirlərin yaradılması', 'Painting (drawing, fresco, graphics)', 'About the creation of images by applying paint on any surface', 'Живопись (рисование, роспись, графика)', 'О создании изображений посредством нанесения красок на какую-либо поверхность', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(55, 'İxtiraçılıq', 'Yeniliklərin kəşf edilməsi barədə', 'Invention', 'About the invention of new', 'Изобретательство', 'Об изобретении нового', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 13, NULL, '', 2),
(56, 'Kinematoqrafiya', 'Hərəkət edən təsvirlərin yaradılması barədə', 'Cinematography', 'About the creation of motion pictures', 'Кинематография', 'О создании движущихся изображений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(57, 'Xalçalıq', 'Xalçaların istehsalı barədə', 'Carpet weaving', 'About the manufacture of carpets', 'Ковроткачество', 'О производстве ковров', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(58, 'Aşbazlıq', 'Qidanın hazırlanması barədə', 'Cookery (Cooking)', 'About cooking', 'Кулинария', 'О приготовлении пищи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(59, 'Tökmə', 'Tökmə qəlibə maye materialın (metalın, ərintinin, plastmassanın və ilaxır kimi şeylrəin) doldurulması və onun bərkilməsi yolu ilə əşyaların hazırlanması barədə', 'Casting (Moulding)', 'About making items by filling a mold with liquid materials (metals, alloys, plastics and so on), followed by their solidification', 'Литьё', 'Об изготовлении предметов, путём заполнения литейной формы жидким материалом (металлом, сплавом, пластмассой и т. п.) с последующим его затвердеванием', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(60, 'Mozaika', 'Bİr səthin üzərində əlvan materialların (daşların, smaltanın, keramik lövhələrin) quraşdırılması, yığılması və bərkidilməsi yolu ilə təsvirlərin formalaşdırılması barədə', 'Mosaic', 'About the formation of images by arranging, composition and fixing colored materials (stones, glazes, ceramic tiles) onto a surface', 'Мозаика', 'О формировании изображения посредством компоновки, набора и закрепления на поверхности разноцветных материалов (камней, смальты, керамических плиток)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(61, 'Musiqiçilik', 'Musiqi (audio) əsərlərin yaradılması (ifası) barədə', 'Musical Art', 'About the creation and playing music (audio works)', 'Музыкальное искусство', 'О создании (воспроизведении) музыкальных (аудио) произведений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(62, 'Multimediya', 'Multimedia (video-audio-təsviri) əsərlərinin yaradılması (ifası) barədə', 'Multimedia art', 'About the creation and playing multimedia (video audio-visual works)', 'Мультимедийное искусство', 'О создании (воспроизведении) мультимедийных (видео-ауди-изобразительных) произведений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(63, 'Bərbərlik', 'Saç düzülüşlərinin yaradılması barədə', 'Hairdressing', 'About the creation of hairstyles', 'Парикмахерское искусство', 'О создании причёсок', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(64, 'Yazıçılıq', 'Yazı əsərlərinin yaradılması barədə', 'Writing art', 'About the creation of writings (written works)', 'Писательское искусство', 'О создании письменного произведения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(65, 'Hörmə (hörülmə) / Toxuma (toxunma) / Krujeva', 'Bərkliyi daha az olan bir və ya bir neçə sapdan (lentdən) daha bərk məmulatların hazırlanması barədə', 'Weaving / Knitting / Lace', 'About manufacturing stronger products from less resistant yarn(s)', 'Плетение / Вязание / Кружево', 'Об изготовлении более прочных изделий из одной или нескольких менее прочных нитей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(66, 'Şairlik', 'Ritm ilə ölçülən kəsiklərə bölünmə ilə təşkil olunmuş bədii nitqin yaradılması (ifası) barədə', 'Poetic Art (Poetry)', 'About composition and performance of speech, divided by rhythmically commensurate segments', 'Поэтическое искусство', 'О сочинении (воспроизведении) художественной речи, организованной делением на ритмически соизмеримые отрезки', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(67, 'Əyirmə (əyrilmə)', 'Ayrı-ayrı liflərin uzununa üst-üstə yığılması və spiralvari eşməsi yolu ilə uzun və bərk sapın hazırlanması barədə', 'Spinning', 'About the manufacture of long and strong thread through the longitudinal folding and twisting spiral of individual fibers', 'Прядение', 'Об изготовлении длинной и прочной нити, путём продольного складывания и спирального скручивания отдельных волокон', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(68, 'Oyma', 'Daha bərk və iti material ilə digər materialın (taxtanın, sümüyün, metalın) bədii emalı barədə', 'Carvings', 'About the artistic working of the material (wood, bone, metal) with an acute, more hard material', 'Резьба', 'О художественной обработки материала (дерева, кости, металла) острым, более твёрдым материалом', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(69, 'Bağçılıq-parkçılıq', 'Bağçaların, parkların və digər yaşıllaşdırılan ərazilərin yaradılması barədə', 'Landscape art', 'About the creation of gardens, parks and other vegetated areas', 'Садово-парковое искусство', 'О создании садов, парков и других озеленяемых территорий', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(70, 'Skrapbuking', 'Foto-albomların yaradılması və bəzədilməsi barədə', 'Scrapbooking', 'About the manufacture and design of photo albums', 'Скрапбукинг', 'Об изготовлении и оформлении фотоальбомов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(71, 'Heykəltəraşlıq', 'Həcmi formada təsvirlərin yaradılması barədə', 'Sculptural art (Mouldings)', 'About the creation of images in bulk form', 'Скульптурное искусство', 'О создании изображений в объёмной форме', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(72, 'Əşyaların yaradılması (təkmilləşdirilməsi)', 'Əşyaların yaradılması və ya təmilləşdirilməsi barədə', 'Creation (improvement) of items', 'About the creation or improvement of the items', 'Создание (усовершенствование) предметов', 'О создании или усовершенствовании предметов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(73, 'Stilistikalıq (Vizajıstlıq)', 'Zahirin (imicin) bəzədilməsi və qüsurların kamuflyaj edilməsi barədə', 'Stylistic (Makeup) art', 'About decorating the exterior (image) and camouflage flaws', 'Стилистическое (визажистское) искусство', 'Об украшении внешности (имиджа) и камуфлировании изъянов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(74, 'Rəqqaslıq (Xoreoqrafiya)', 'Rəqslərin yaradılması (ifası) barədə', 'Dance art (Choreography)', 'About creation and performance of dance', 'Танцевальное (хореография) искусство', 'О создании (исполнении) танцев', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(75, 'Tele-radio-internet yayım', 'Tele-radio-internet verilişlərin yaradılması (verilməsi) barədə', 'TV, radio, Internet broadcasting', 'About the creation of programs for TV, radio, Internet broadcasts', 'Теле-радио-интернет вещание', 'О создании передач для теле-радио-интернет вещаний', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(76, 'Toxuculuq', 'Parçanın istehsalı barədə', 'Weaving', 'About the production of textile', 'Ткачество', 'О производстве ткани', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(77, 'Floristika', 'Çiçəklərdən və digər bitki ünsürlərindən kompozisiyaların (interyerin, gül dəstələrinin) yaradılması barədə', 'Floristics', 'About the creation of compositions (interior, bouquets) made of flowers and other plant components', 'Флористика', 'О создании композиций (интерьера, букетов) из цветов и других растительных элементов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(78, 'Fotoqrafçılıq', 'Foto-şəkillərin yaradılması barədə', 'Photographic Arts (Photos)', 'About the creation of photos', 'Фотографическое искусство', 'О создании фотоснимков', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(79, 'Dərinin bədii emalı', 'Dəridən olan məmulatların bədii emalı barədə', 'Leather crafting', 'About the manufacture of leather goods', 'Художественная обработка кожи', 'Об изготовлении предметов из кожи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(80, 'Sirk / Sehrbazlıq / Əyləncəvi tamaşalar', 'Əyləncə tamaşalarının yaradılması barədə', 'Show Art (Entertainment)', 'About the creation of entertaining shows', 'Цирковое (развлекательное) искусство', 'О создании развлекательных представлений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(81, 'Tikmə', 'Materiallardan (parçadan, dəridən) sırıq və tikişaraları vasitəsilə məmulatların hazırlanması barədə', 'Tailoring (Sewing)', 'About manufacture of goods from the material (textile, leather) by means of seams and stitches', 'Шитьё', 'Об изготовлении изделия из материала (ткани, кожи), при помощи стежков и швов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(82, 'Zərgərlik', 'Zərgərlik materiallarından əşyaların hazırlanması barədə', 'Jewellery', 'About the manufacture of goods made of precious materials', 'Ювелирное дело', 'Об изготовлении предметов из драгоценных материалов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 2),
(83, 'Anatomiya (insan)', 'İnsan vücudu barədə', 'Human Anatomy', 'About the organizm of human body', 'Анатомия человека', 'Об организме человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(84, 'Astronomiya', 'Göy cisimləri barədə', 'Astronomy', 'About celestial bodies', 'Астрономия', 'О небесных телах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(85, 'Botanika', 'Bitki orqanizmi barədə', 'Botany', 'About the organizm of plants', 'Ботаника', 'Об организме растений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(86, 'Coğrafiya (fiziki)', 'Yer kürəsinin coğrafi qişası və onun tərkib hissələri barədə', 'Geography (physical)', 'The geographical cover of the Earth and its structural parts', 'География (физическая)', 'О географической оболочке Земли и её структурных частей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(87, 'Geodeziya', 'Yer kürəsinin fiquru, cazibə sahəsi, fırlanma parametrləri və onların vaxtla dəyişiklikləri barədə', 'Geodesy', 'About the figure, the gravitational field, rotation parameters of the Earth and their changes over time', 'Геодезия', 'О фигуре, гравитационное поле, параметрах вращения Земли и их изменениях во времени', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(88, 'Geologiya', 'Yer kürəsinin tərkibi barədə', 'Geology', 'About the structure of the Earth', 'Геология', 'О строении Земли', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(89, 'Zoologiya', 'Heyvanların orqanizmləri barədə', 'Zoology', 'About the organizm of animals', 'Зоология', 'Об организме животных', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(90, 'Məntiq', 'Mühakimə, sübut və təkzib etmə üsulları barədə', 'Logic', 'About the methods of reasoning, proof and refutation', 'Логика', 'О способах рассуждения, доказательств и опровержений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(91, 'Riyaziyyat', 'Hesablanma əməliyyatları, obyektlərin ölçülməsi və formalarının təsviri barədə', 'Mathematics', 'About the operations of counting, measuring and describing the shape of objects', 'Математика', 'Об операциях подсчёта, измерения и описания формы объектов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(92, 'Statistika', 'Kütləvi kəmiyyət və keyfiyyət məlumatlarının yığılması, ölçülməsi və təhlili barədə', 'Statistics', 'About the collection, measurement and analysis of massive quantitative or qualitative data', 'Статистика', 'О сборе, измерении и анализе массовых количественных или качественных данных', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(93, 'Fizika', 'Təbiətin, materiyanın ümumi qanunları, onların strukturu və hərəkəti barədə', 'Physics', 'About the general laws of nature, matter, its structure and movement', 'Физика', 'Об общих законах природы, материи, её структуре и движении', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(94, 'Kimya', 'Maddələr, onların tərkibləri, quruluşu, xüsusiyyətləri barədə', 'Chemistry', 'About substances, their composition, structure, properties', 'Химия', 'О веществах, их составе, строении, свойствах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(95, 'Digər sahələr', 'Unudulmuş və yeni sahələr', 'Other areas', 'About the neglected and new areas', 'Другие области', 'Забытые и новые области', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 1, NULL, '', 3),
(96, 'Antropoloqlar', 'İnsan, onun əsli, inkişafı, mövcudluğu üzrə mütəxəssislər', 'Anthropologists', 'Experts on man, his/her origin, development, existence', 'Антропологи', 'Специалисты по человеку, его происхождению, развитию, существованию', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(97, 'Arxeoloqlar', 'Qədim keçmişin maddi sübutlarının qazıntısı üzrə mütəxəssislər', 'Archaeologists', 'Experts on excavations of the evidences of ancient past', 'Археологи', 'Специалисты по раскопкам вещественных доказательств древнейшего прошлого', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(98, 'Təhlükəsizlik üzrə mütəxəssislər', 'Mühafizəçilik və aşağı səviyyədəki risklər üzrə mütəxəssislər', 'Safety / security - experts', 'Experts on safety and low risk', 'Безопасность - специалисты', 'Специалисты по защищённости и низком уровне риска', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(99, 'Hərbçilər', 'Müharibə və ona hazırlıq üzrə mütəxəssislər', 'Military man', 'Experts on war and preparation to it', 'Военные', 'Специалисты по войне и приготавлении к ней', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(100, 'Coğrafiya (iqtisadi, siyasi) üzrə mütəxəssislər', 'Cəmiyyətin iqtisadi həyatının ərazi quruluşu üzrə mütəxəssislər', 'Geographers (on economic, political geography)', 'Experts on territorial organization of economic life', 'Географы (по экономической, политической географии)', 'Специалисты по территориальной организации экономической жизни общества', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(101, 'Evdarlıq üzrə mütəxəssislər', 'Məişət, ev işləri üzrə mütəxəssislər', 'Housekeeping - experts', 'Experts on household, housework', 'Домоводство - специалисты', 'Специалисты по бытовым, домашним делам', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(102, 'Jurnalistlər', 'Kütləvi məlumatların yayımlanması üzrə mütəxəssislər', 'Journalists', 'Experts on spreading of mass information', 'Журналисты', 'Специалисты по распространению массовой информации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(103, 'Oyunçular', 'Motivi prosesdə olan qeyri-məhsuldar fəaliyyət növləri üzrə mütəxəssislər', 'Players in games', 'Experts on unproductive activities, the motive of which is enclosed in the process', 'Игроки', 'Специалисты по непродуктивным видам деятельности, мотив которых заключён в процессе', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(104, 'Mühəndislər', 'Strukturun, maşınların, qurğuların, materialların və ya proseslərin kəşf edilməsi, işləməsi, yaradılması, dəstəklənməsi və ya təmir edilməsi üzrə mütəxəssislər', 'Engineers', 'Experts on invention, design, construction, maintenance, support or correction of structures, machines, devices, materials or processes', 'Инженеры', 'Специалисты по изобретению, разработке, созданию, поддержке или исправлению структуры, машины, устройства, материалов или процессов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(105, 'İnformatlər', 'Məlumatın yığılma, saxlanma, emal, ötürülmə, təhlil, dəyərləlndirmə metodları və prosesləri üzrə mütəxəssislər', 'Information technology - experts', 'Experts on methods and processes of collecting, storing, processing, transmission, analysis and evaluation of information', 'Информатика - специалисты', 'Специалисты по методам и процессам сбора, хранения, обработке, передаче, анализу и оценке информации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(106, 'Tarixçilər', 'Keçmiş üzrə mütəxəssislər', 'Historians', 'Experts on past', 'Историки', 'Специалисты по прошлому', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(107, 'Kommunikasiya (rabitə) üzrə mütəxəssislər', 'Rabitənin texnoloji vasitələri üzrə mütəxəssislər', 'Communication - experts', 'Experts on technological means of communication', 'Коммуникация - специалисты', 'Специалисты по технологическим средствам связи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(108, 'Mədəniyyətşünaslar', 'Cəmiyyətin tarixi-sosial təcrübəsi üzrə mütəxəssislər', 'Cultural studies - experts', 'Experts on historically-social experience of people', 'Культурологи', 'Специалисты по исторически-социальному опыту людей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(109, 'Linqvistlər', 'Dillər üzrə mütəxəssislər', 'Linguists (linguists)', 'Experts on languages', 'Лингвисты (языковеды)', 'Специалисты по языкам', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(110, 'Təbabətçilər / Səhiyyə üzrə mütəxəssislər', 'Xəstəliklərin tanınması (diaqnostikası), qabağının alınması və müalicəsi üzrə mütəxəssislər', 'Doctors / Health Care', 'Experts on recognition, prevention and treatment of diseases', 'Медики / Здравоохранение - специалисты', 'Специалисты по распознаванию, предупреждению и лечению болезней', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(111, 'Meteoroloqlar', 'Hava üzrə mütəxəssislər', 'Meteorologists', 'Experts on weather', 'Метеорологи', 'Специалисты по погоде', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4);
INSERT INTO `categories` (`id`, `catNameAz`, `catInfoAz`, `catNameEn`, `catInfoEn`, `catNameRu`, `catInfoRu`, `created`, `updated`, `lastVideoAdded`, `isDeleted`, `deleted`, `deletedById`, `deletedByIP`, `questions`, `createdById`, `createdByIP`, `catGroupId`) VALUES
(112, 'Pedaqoqlar', 'İnsanın tərbiyəsi və tədrisi üzrə mütəxəssislər', 'Teachers / Leacturers', 'Experts on education and training of man', 'Педагоги', 'Специалисты по воспитанию и обучению человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(113, 'Siyasətçilər', 'Müəyyən ictimai mühitdə müəyyən maraqların reallaşdırılmadakı vasitə və üsulları üzrə mütəxəssislər ', 'Politicians', 'Experts on means and methods of realization of certain interests in a particular social environment', 'Политики', 'Специалисты по средствам и методам реализации определённых интересов в определённой социальной среде', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(114, 'Politoloqlar', 'Hökmranlıq münasibətləri ilə əlaqədar insanların həyat fəaliyyəti', 'Political scientists', 'Experts on sphere of human activity related to the power relations', 'Политологи', 'Специалисты по сфере жизнедеятельности людей, связанной с властными отношениями', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(115, 'Hüquqşünaslar', 'İctimai münasibətləri tənzimləlyən davranış qaydaları üzrə mütəxəssislər', 'Lawyers', 'Experts on rules of conduct governing public relations', 'Правоведы', 'Специалисты по правилам поведения, регулирующих общественные отношения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(116, 'İstehsalçılar', 'İnsanlar tərəfindən təbii resursların hər hansı məhsula aktiv dəyişdirilmə prosesi üzrə mütəxəssislər', 'Manufacturers', 'The process of active transformation of natural resources by people into any product', 'Производители', 'Специалисты по процессу активного преобразования людьми природных ресурсов в какой-либо продукт', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(117, 'Psixoloqlar / Özünün inkişafı üzrə mütəxəssislər', 'Psixiki (ruhi) proseslər / Psixikanın (ruhi aləmin) idarəedilməsi üsulları üzrə mütəxəssislər', 'Psychology / Self-development - experts', 'Experts on mental processes / Experts on methods of control over the psyche', 'Психологи / Саморазвитие  - специалисты', 'Специалисты по психическим процессам / Специалисты по способам управления психикой', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(118, 'Din xadimləri', 'Fövqəltəbii aləmə inam ilə şərtləndirilən dünya qavrayış formaları üzrə mütəxəssislər', 'Religious studies - experts', 'Experts on forms of consciousness of the world, due to the belief in the supernatural', 'Религиоведы', 'Специалисты по формам осознания мира, обусловленной верой в сверхъестественное', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(119, 'Təmir üzrə mütəxəssislər', 'Çalışa bilən və saz vəziyyətinin bərpası üzrə mütəxəssislər', 'Repairers', 'Experts on restoration (recovery) of serviceable condition', 'Ремонтники', 'Специалисты по восстановлению работоспособного или исправного состояния', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(120, 'Ritorika (natiqlik) üzrə mütəxəssislər', 'Nitq məharəti üzrə mütəxəssislər', 'Orators / Speakers', 'Experts on art of speech', 'Риторика - специалисты', 'Специалисты по искусству речи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(121, 'Seksoloqlar', 'Cinsi arzusunun təzahürü və təmin edilməsi ilə bağlı insan davranışları üzrə mütəxəssislər', 'Sexologists', 'Experts on actions of a man, associated with the manifestation and satisfaction of sexual desire', 'Сексологи', 'Специалисты по поступкам человека, связанных с проявлением и удовлетворением полового влечения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(122, 'Kənd təsərrüfatı üzrə mütəxəssislər', 'Ərzaqlarla (bitki, heyvan ilə) təmin edilməsi üzrə mütəxəssislər', 'Agriculture - experts', 'Experts on provision of food (vegetable, animal)', 'Сельское хозяйство - специалисты', 'Специалисты по обеспечению продовольствием (растительным, животным)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(123, 'Sosioloqlar', 'Cəmiyyət üzrə mütəxəssislər', 'Sociologists', 'Experts on society', 'Социологи', 'Специалисты по обществу', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(124, 'İdmançılar', 'Yarış məqsədilə aparılan fiziki və əqli fəaliyyət üzrə mütəxəssislər', 'Athletes', 'Experts on physical and intellectual activity, done with the aim of competition', 'Спортсмены', 'Специалисты по физической и интеллектуальной активности, совершаемой с целью соревнования', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(125, 'Standartlaşdırma / Metrologiya üzrə mütəxəssislər', 'Müxtəlif sahələrdə normaların, qaydaların və xarakteristikaların müəyyən edilməsi / ölçmədə, üsul və vasitələrdə vahidliyin təmin edilməsi üzrə mütəxəssislər', 'Standardization / Metrology - experts', 'Experts on establishing the rules, regulations and characteristics in different areas / Experts on uniformity in the measurements, methods and means', 'Стандартизаторы / Метрологи', 'Специалисты по установлению норм, правил и характеристик в различных областях / Специалисты по обеспечению единства в измерениях, методах и средствах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(126, 'İnşaatçılar', 'Binaların və  digər tikililərin inşaatı, təmiri, yenidən qurulması, bərpası və renovasiyası üzrə mütəxəssislər', 'Builders', 'Experts on construction of buildings and structures, their repairs, reconstructions, restorations and renovations', 'Строители', 'Специалисты по возведению зданий и сооружений, их ремонту, реконструкции, реставрации и реновации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(127, 'Mətbəə işi / Litoqrafiya üzrə mütəxəssislər', 'Mətnin çapı üzrə mütəxəssislər', 'Typographers / Lithographers', 'Experts on printing texts', 'Типографы / Литографы', 'Специалисты по печати текста', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(128, 'Nəqliyyat üzrə mütəxəssislər', 'Maddi yüklərin yerdəyişmə prosesini təmin edən rabitə yolları üzrə mütəxəssislər', 'Transport workers', 'Experts on lines of communication, to ensure the process of moving material cargo', 'Транспортники', 'Специалисты по путям сообщения, обеспечивающих процесс перемещения материального груза', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(129, 'İşə düzəltmə üzrə mütəxəssislər', 'İşə düzəltmə prosesi üzrə mütəxəssislər', 'Employment - experts', 'Experts on a getting and giving a job', 'Трудоустройство - специалисты', 'Специалисты по устройству на работу', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(130, 'Ufoloqlar', 'Yer kürəsi ötəsi idrak üzrə mütəxəssislər', 'Ufologists', 'Experts on extraterrestrial intelligence', 'Уфологи', 'Специалисты по внеземному разуму', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(131, 'Filoloqlar', 'Bədii yaradıcılıq üzrə mütəxəssislər', 'Philologists', 'Experts on literary works', 'Филологи', 'Специалисты по литературному творчеству', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(132, 'Filosoflar', 'Dünya qavrayış formaları üzrə mütəxəssislər', 'Philosophers', 'Experts on forms of consciousness of the world', 'Философы', 'Специалисты по формам осознания мира', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(133, 'Ekoloqlar', 'Canlı və qeyri-canlı təbiətin qarşılıqlı münasibətləri üzrə mütəxəssislər', 'Environmentalists', 'Experts on relationship between animate and inanimate nature', 'Экологи', 'Специалисты по взаимоотношениям живой и неживой природы', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(134, 'İqtisadçılar', 'İstehsalat, bölüşdürmə, mübadilə və istehlak sistemində formalaşan münasibətlər üzrə mütəxəssislər', 'Economists', 'Experts on set of relations in the system of production, distribution, exchange and consumption', 'Экономисты', 'Специалисты по совокупности отношений, складывающихся в системе производства, распределении, обмену и потреблению', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(135, 'Ekstrasensorika / Хiromantiya / Magiya / Metafizika üzrə mütəxəssislər', 'Elm tərəfindən tam sübuta yetirilməyən insan hissiyyatı üzrə mütəxəssislər', 'Psychic / Palmists / Mages / Metaphysics / Paranormal - experts', 'Experts on feelings of a person, which are not fully proven by science', 'Экстрасенсорики / Хироманты / Маги / Метафизики / Паранормальное - специалисты', 'Люди, обладающие чувствами, существование которых не полностью доказано наукой', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(136, 'Energetiklər', 'Enerji resursların dəyişdirilməsi, bölüşdürülməsi və istifadəsi üzrə mütəxəssislər', 'Energy - experts', 'Experts on transformation, distribution and use of energy resources', 'Энергетики', 'Специалисты по  преобразованию, распределению и использованию энергетических ресурсов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(137, 'Etnoqraflar', 'Xalqlar üzrə mütəxəssislər', 'Ethnographers', 'Experts on peoples', 'Этнографы', 'Специалисты по народам', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 4),
(138, 'Aktyorlar / Teatr fəaliyyəti üzrə mütəxəssislər', 'Səhnə obrazlarının yaradılması üzrə mütəxəssislər', 'Actors (theater - specialists)', 'Experts on creation and performance of scenic images', 'Актёры (театральное искусство - специалисты)', 'Люди, участвующие в создании (воспроизведении) сценических образов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(139, 'Applikasiya (qurama) / dekupaj / inkrustasiya (qaxma) üzrə mütəxəssislər', 'Bir materialın onun üzərinə digər materialın (fiqurların, şəkillərin, naxışın, daşların) qoyulması, yapışdırılması və ya tikilməsi yolu ilə bəzədilməsi üzrə mütəxəssislər', 'Application / Decoupage / Inlay - experts', 'Experts on decorating a material by overlapping, sticking, sewing on it another material (figures, paintings, ornaments, stones)', 'Аппликация / Декупаж / Инкрустация - специалисты', 'Люди, участвующие в украшении материала, путём накладывания, наклеивания, нашивания на него другого материала (фигурок, картин, орнамента, камней)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(140, 'Muncuqlaşma üzrə mütəxəssislər', 'Muncuqdan məmulatların qayırması üzrə mütəxəssislər', 'Beading - experts', 'Experts on manufacture of products made of beads', 'Бисероплетение - специалисты', 'Люди, участвующие в  изготовлении изделий из бисера', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(141, 'Kağız incəsənəti üzrə mütəxəssislər', 'Kağızdan məmulatların qayırması üzrə mütəxəssislər', 'Paper art (origami, papier-mâché, etc.) - specialists', 'Experts on manufacture of products made of paper', 'Бумажное искусство (оригами, папье-маше и т.д.) - специалисты', 'Люди, участвующие в изготовлении изделий из бумаги', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(142, 'Güldançəkmə üzrə mütəxəssislər', 'Qabların boyalarla bəzədib bişirilməsi üzrə mütəxəssislər', 'Vase painters', 'Experts on painting vessels, followed by firing', 'Вазописцы', 'Люди, участвующие в росписи сосудов красками с последующим обжигом', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(143, 'Vitraj üzrə mütəxəssislər', 'Memarlıq tikilidəki qapı və ya pəncərə yerinin (yarı)şəffaf rəngli lövhələrlə doldurulması üzrə mütəxəssislər', 'Stained glass - experts', 'Experts on filling colored (semi)transparent plates (glasses, stones) into the aperture of an architectural construction', 'Витраж - специалисты', 'Люди, участвующие в заполнении цветными (полу)прозрачными плитами (стёклами, камнями) проёма в архитектурном сооружении', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(144, 'Vokal incəsənəti üzrə mütəxəssislər / Müğənnilər', 'Vokal əsərlərin yaradılması (ifası) üzrə mütəxəssislər', 'Singers', 'Experts on creation or performance of vocal works (songs)', 'Певцы', 'Люди, участвующие в создании (исполнении) вокальных произведений (песен)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(145, 'Yandırma üsulu ilə naxış açma üzrə mütəxəssislər', 'Bərk qızmış iynə vasitəsilə orqanik materialın (fanerin, kağızın, dərinin, parçanın) bəzədilməsi üzrə mütəxəssislər', 'Burning (pyrography) - experts', 'Experts on decorating an organic material (plywood, paper, leather, fabric) with an illustration by using a red-hot needle or a fine flame', 'Выжигание (пирография) - специалисты', 'Люди, участвующие в украшении органического материала (фанеры,  бумаги, кожи, ткани) рисунком, при помощи раскалённой иглы', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(146, 'Naxış tikmə üzrə mütəxəssislər', 'Tikilmiş (calanmış) saplar vasitəsilə materialların (parçanın, dərinin) naxışlarla bəzədilməsi üzrə mütəxəssislər', 'Embroidery - experts', 'Experts on decorating a material (textile, leather) with patterns, using the sewn threads', 'Вышивание - специалисты', 'Люди, участвующие в украшении узорами материалов (ткани, кожи), при помощи вшиваемых нитей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(147, 'Qravyura üzrə mütəxəssislər', 'Çap ottisklərdə (basmalarda) təsvirlərin yaradılması üzrə mütəxəssislər', 'Engravers', 'Experts on creation of images in print impressions', 'Гравюрщики', 'Люди, участвующие в создании изображений в печатных оттисках', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(148, 'Dizaynerlər', 'Obyektlərin insanın utilitar (tətbiqi) və estetik ehtiyaclarına uyğunlaşdırılması üzrə mütəxəssislər', 'Designers', 'Experts on matching objects to utilitarian and aesthetic needs of man', 'Дизайнеры', 'Люди, участвующие в привидении соответствия объектов  утилитарным и эстетическим потребностям человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(149, 'Rəssamlar (naqqaşlıq, naxışlıq, qrafika və s. üzrə mütəxəssislər)', 'Hər hansı səth üzərinə boyaların vurulması yolu ilə təsvirlərin yaradılması', 'Artists', 'Experts on creation of images by applying paint on any surface', 'Художники', 'Люди, участвующие в создании изображений посредством нанесения красок на какую-либо поверхность', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(150, 'İxtiraçılar', 'Yeniliklərin kəşf edilməsi üzrə mütəxəssislər', 'Inventors', 'Experts on invention of new', 'Изобретатели', 'Люди, участвующие в изобретении нового', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(151, 'Kinematoqraflar', 'Hərəkət edən təsvirlərin yaradılması üzrə mütəxəssislər', 'Cinematography - experts', 'Experts on creation of motion pictures', 'Кинематографы', 'Люди, участвующие в создании движущихся изображений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(152, 'Xalçalıq üzrə mütəxəssislər', 'Xalçaların istehsalı üzrə mütəxəssislər', 'Carpet weavers', 'Experts on manufacture of carpets', 'Ковроткачи', 'Люди, участвующие в производстве ковров', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(153, 'Aşbazlar', 'Qidanın hazırlanması üzrə mütəxəssislər', 'Cooks', 'Experts on cooking', 'Кулинары / Повара', 'Люди, участвующие в приготовлении пищи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(154, 'Tökmə üzrə mütəxəssislər', 'Tökmə qəlibə maye materialın (metalın, ərintinin, plastmassanın və ilaxır kimi şeylrəin) doldurulması və onun bərkilməsi yolu ilə əşyaların hazırlanması üzrə mütəxəssislər', 'Casters', 'Experts on making items by filling a mold with liquid materials (metals, alloys, plastics and so on), followed by their solidification', 'Литейщики', 'Люди, участвующие в изготовлении предметов, путём заполнения литейной формы жидким материалом (металлом, сплавом, пластмассой и т. п.) с последующим его затвердеванием', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(155, 'Mozaika üzrə mütəxəssislər', 'Bİr səthin üzərində əlvan materialların (daşların, smaltanın, keramik lövhələrin) quraşdırılması, yığılması və bərkidilməsi yolu ilə təsvirlərin formalaşdırılması üzrə mütəxəssislər', 'Mosaic - experts', 'Experts on formation of images by arranging, composition and fixing colored materials (stones, glazes, ceramic tiles) onto a surface', 'Мозаика - специалисты', 'Люди, участвующие в формировании изображения посредством компоновки, набора и закрепления на поверхности разноцветных материалов (камней, смальты, керамических плиток)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(156, 'Musiqiçilər', 'Musiqi (audio) əsərlərin yaradılması (ifası) üzrə mütəxəssislər', 'Musicians', 'Experts on creation and playing music (audio works)', 'Музыканты', 'Люди, участвующие в создании (воспроизведении) музыкальных (аудио) произведений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(157, 'Multimediya üzrə mütəxəssislər', 'Multimedia (video-audio-təsviri) əsərlərinin yaradılması (ifası) üzrə mütəxəssislər', 'Multimedia art - experts', 'Experts on creation and playing multimedia (video audio-visual works)', 'Мультимедийное искусство  - специалисты', 'Люди, участвующие в создании (воспроизведении) мультимедийных (видео-ауди-изобразительных) произведений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(158, 'Bərbərlər', 'Saç düzülüşlərinin yaradılması üzrə mütəxəssislər', 'Hairdressers', 'Experts on creation of hairstyles', 'Парикмахеры', 'Люди, участвующие в создании причёсок', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(159, 'Yazıçılar', 'Yazı əsərlərinin yaradılması üzrə mütəxəssislər', 'Writers', 'Experts on creation of writings (written works)', 'Писатели', 'Люди, участвующие в создании письменного произведения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(160, 'Hörmə (hörülmə) / Toxuma (toxunma) / Krujeva üzrə mütəxəssislər', 'Bərkliyi daha az olan bir və ya bir neçə sapdan (lentdən) daha bərk məmulatların hazırlanması üzrə mütəxəssislər', 'Weaving / Knitting / Lace - experts', 'Experts on manufacturing stronger products from less resistant yarn(s)', 'Плетение / Вязание / Кружево - специалисты', 'Об изготовлении более прочных изделий из одной или нескольких менее прочных нитей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(161, 'Şairlər', 'Ritm ilə ölçülən kəsiklərə bölünmə ilə təşkil olunmuş bədii nitqin yaradılması (ifası) üzrə mütəxəssislər', 'Poets', 'Experts on composition and performance of speech, divided by rhythmically commensurate segments', 'Поэты', 'Люди, участвующие в сочинении (воспроизведении) художественной речи, организованной делением на ритмически соизмеримые отрезки', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(162, 'Əyirmə (əyrilmə) üzrə mütəxəssislər', 'Ayrı-ayrı liflərin uzununa üst-üstə yığılması və spiralvari eşməsi yolu ilə uzun və bərk sapın hazırlanması üzrə mütəxəssislər', 'Spinners', 'Experts on manufacture of long and strong thread through the longitudinal folding and twisting spiral of individual fibers', 'Прядильщики', 'Люди, участвующие в изготовлении длинной и прочной нити, путём продольного складывания и спирального скручивания отдельных волокон', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(163, 'Oyma üzrə mütəxəssislər', 'Daha bərk və iti material ilə digər materialın (taxtanın, sümüyün, metalın) bədii emalı üzrə mütəxəssislər', 'Thread - experts', 'Experts on artistic working of the material (wood, bone, metal) with an acute, more hard material', 'Резьба - специалисты', 'Люди, участвующие в художественной обработки материала (дерева, кости, металла) острым, более твёрдым материалом', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(164, 'Bağçılıq-parkçılıq üzrə mütəxəssislər', 'Bağçaların, parkların və digər yaşıllaşdırılan ərazilərin yaradılması üzrə mütəxəssislər', 'Landscape art - experts', 'Experts on creation of gardens, parks and other vegetated areas', 'Садово-парковое искусство - специалисты', 'Люди, участвующие в создании садов, парков и других озеленяемых территорий', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(165, 'Skrapbukinq', 'Foto-albomların yaradılması və bəzədilməsi üzrə mütəxəssislər', 'Scrapbooking - experts', 'Experts on manufacture and design of photo albums', 'Скрапбукинг - специалисты', 'Люди, участвующие в изготовлении и оформлении фотоальбомов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(166, 'Heykəltəraşlar', 'Həcmi formada təsvirlərin yaradılması üzrə mütəxəssislər', 'Sculptures', 'Experts on creation of images in bulk form', 'Скульптуры', 'Люди, участвующие в создании изображений в объёмной форме', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(167, 'Əşyaların yaradılması (təkmilləşdirilməsi) üzrə mütəxəssislər', 'Əşyaların yaradılması və ya təmilləşdirilməsi üzrə mütəxəssislər', 'The creators (improvers) of items', 'Experts on creation or improvement of the items', 'Создатели (улучшатели) предметов', 'Люди, участвующие в создании или усовершенствовании предметов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(168, 'Stilistlər / Vizajıstlər', 'Zahirin (imicin) bəzədilməsi və qüsurların kamuflyaj edilməsi üzrə mütəxəssislər', 'Stylists / Makeup Artists', 'Experts on decorating the exterior (image) and camouflage flaws', 'Стилисты / Визажисты', 'Люди, участвующие в украшении внешности (имиджа) и камуфлировании изъянов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(169, 'Rəqqaslar / Xoreoqrafiya üzrə mütəxəssislər', 'Rəqslərin yaradılması (ifası) üzrə mütəxəssislər', 'Dancers', 'Experts on creation and performance of dance', 'Танцоры', 'Люди, участвующие в создании (исполнении) танцев', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(170, 'Tele-radio-internet yayım üzrə mütəxəssislər', 'Tele-radio-internet verilişlərin yaradılması (verilməsi) üzrə mütəxəssislər', 'TV, radio, Internet broadcasting - experts', 'Experts on creation of programs for TV, radio, Internet broadcasts', 'Теле-радио-интернет вещание - специалисты', 'Люди, участвующие в создании передач для теле-радио-интернет вещаний', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(171, 'Toxucular', 'Parçanın istehsalı üzrə mütəxəssislər', 'Weavers', 'Experts on production of textile', 'Ткачи', 'Люди, участвующие в производстве ткани', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(172, 'Floristika üzrə mütəxəssislər', 'Çiçəklərdən və digər bitki ünsürlərindən kompozisiyaların (interyerin, gül dəstələrinin) yaradılması üzrə mütəxəssislər', 'Florists', 'Experts on creation of compositions (interior, bouquets) made of flowers and other plant components', 'Флористы', 'Люди, участвующие в создании композиций (интерьера, букетов) из цветов и других растительных элементов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(173, 'Fotoqrafçılar', 'Foto-şəkillərin yaradılması üzrə mütəxəssislər', 'Photographers', 'Experts on creation of photos', 'Фотографы', 'Люди, участвующие в создании фотоснимков', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(174, 'Dərinin bədii emalı üzrə mütəxəssislər', 'Dəridən olan məmulatların bədii emalı üzrə mütəxəssislər', 'Leather crafting - experts', 'Experts on manufacture of leather goods', 'Художественная обработка кожи - специалисты', 'Люди, участвующие в изготовлении предметов из кожи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(175, 'Əyləncə üzrə mütəxəssislər / Sehrbazlar', 'Əyləncə tamaşalarının yaradılması üzrə mütəxəssislər', 'Show / Circus / Entertainment - experts', 'Experts on creation of entertaining shows', 'Цирковое (развлекательное) искусство - специалисты', 'Люди, участвующие в создании развлекательных представлений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(176, 'Tikmə üzrə mütəxəssislər', 'Materiallardan (parçadan, dəridən) sırıq və tikişaraları vasitəsilə məmulatların hazırlanması üzrə mütəxəssislər', 'Tailoring - experts', 'Experts on manufacture of goods from the material (textile, leather) by means of seams and stitches', 'Шитьё - специалисты', 'Люди, участвующие в изготовлении изделия из материала (ткани, кожи), при помощи стежков и швов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(177, 'Zərgərlər', 'Zərgərlik materiallarından əşyaların hazırlanması üzrə mütəxəssislər', 'Jewellers', 'Experts on manufacture of goods made of precious materials', 'Ювелиры', 'Люди, участвующие в изготовлении предметов из драгоценных материалов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 5),
(178, 'Anatomlar (insan vücudu üzrə)', 'İnsan vücudu üzrə mütəxəssislər', 'Human anatomists', 'Experts on organizm of human body', 'Анатомы человека', 'Человек, владеющий широкими знаниями об организме человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(179, 'Astronomlar', 'Göy cisimləri üzrə mütəxəssislər', 'Astronomers', 'Experts on celestial bodies', 'Астрономы', 'Человек, владеющий широкими знаниями о небесных телах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(180, 'Botaniklər', 'Bitki orqanizmi üzrə mütəxəssislər', 'Botanists', 'Experts on the organizm of plants', 'Ботаники', 'Человек, владеющий широкими знаниями об организме растений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(181, 'Coğrafiya (fiziki) üzrə mütəxəssislər', 'Yer kürəsinin coğrafi qişası və onun tərkib hissələri üzrə mütəxəssislər', 'Geographers (on physical geography)', 'The geographical cover of the Earth and its structural parts', 'Географы (по физической географии)', 'Человек, владеющий широкими знаниями о географической оболочке Земли и её структурных частей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(182, 'Geodeziyaçılar', 'Yer kürəsinin fiquru, cazibə sahəsi, fırlanma parametrləri və onların vaxtla dəyişiklikləri üzrə mütəxəssislər', 'Geodesist / Land-surveyor', 'Experts on figure, the gravitational field, rotation parameters of the Earth and their changes over time', 'Геодезики', 'Человек, владеющий широкими знаниями о фигуре, гравитационное поле, параметрах вращения Земли и их изменениях во времени', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(183, 'Geoloqlar', 'Yer kürəsinin tərkibi üzrə mütəxəssislər', 'Geologists', 'Experts on structure of the Earth', 'Геологи', 'Человек, владеющий широкими знаниями о строении Земли', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(184, 'Zooloqlar', 'Heyvanların orqanizmləri üzrə mütəxəssislər', 'Zoologists', 'Experts on the organizm of animals', 'Зоологи', 'Человек, владеющий широкими знаниями об организме животных', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(185, 'Məntiq üzrə mütəxəssislər', 'Mühakimə, sübut və təkzib etmə üsulları üzrə mütəxəssislər', 'Logic - experts', 'Experts on methods of reasoning, proof and refutation', 'Логика - специалисты', 'Человек, владеющий широкими знаниями о способах рассуждения, доказательств и опровержений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(186, 'Riyaziyyatçılar', 'Hesablanma əməliyyatları, obyektlərin ölçülməsi və formalarının təsviri üzrə mütəxəssislər', 'Mathematicians', 'Experts on operations of counting, measuring and describing the shape of objects', 'Математики', 'Человек, владеющий широкими знаниями об операциях подсчёта, измерения и описания формы объектов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(187, 'Statistika üzrə mütəxəssislər', 'Kütləvi kəmiyyət və keyfiyyət məlumatlarının yığılması, ölçülməsi və təhlili üzrə mütəxəssislər', 'Statistics - experts', 'Experts on collection, measurement and analysis of massive quantitative or qualitative data', 'Статистика - специалисты', 'Человек, владеющий широкими знаниями о сборе, измерении и анализе массовых количественных или качественных данных', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(188, 'Fiziklər', 'Təbiətin, materiyanın ümumi qanunları, onların strukturu və hərəkəti üzrə mütəxəssislər', 'Physicist', 'Experts on general laws of nature, matter, its structure and movement', 'Физики', 'Человек, владеющий широкими знаниями об общих законах природы, материи, её структуре и движении', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(189, 'Kimyaçılar', 'Maddələr, onların tərkibləri, quruluşu, xüsusiyyətləri üzrə mütəxəssislər', 'Chemist', 'Experts on substances, their composition, structure, properties', 'Химики', 'Человек, владеющий широкими знаниями о веществах, их составе, строении, свойствах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(190, 'Digər mütəxəssislər və xadimlər', 'Unudulmuş və yeni sahələrin mütəxəssisləri', 'Experts in other fields', 'Experts on neglected and new areas', 'Специалисты и деятели в других областях', 'Деятели в редких областях', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 2, NULL, '', 6),
(191, 'Biznes', '', 'Business', '', 'Бизнес', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(192, 'Kağız / Karton', '', 'Paper / Cardboard', '', 'Бумага / Картон', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(193, 'Məişət / Həyat', '', 'Mode of life (living) / Life', '', 'Быт / Жизнь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(194, 'Video / Kino', '', 'Videos / Films', '', 'Видео / Кино', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(195, 'Su', '', 'Water', '', 'Вода', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(196, 'Hərbi texnika', '', 'Military equipment', '', 'Военная техника', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(197, 'Ölkələr', '', 'Country / State', '', 'Государство', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(198, 'Dekorasiyalar', '', 'Scenery', '', 'Декорации', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(199, 'Pul', '', 'Money', '', 'Деньги', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(200, 'Taxta məmulatları', '', 'Wood', '', 'Деревянные предметы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(201, 'Uşaqlar', '', 'Children', '', 'Дети', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(202, 'Dizayn', '', 'Designing', '', 'Дизайн', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(203, 'Ev', '', 'House', '', 'Дом', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(204, 'Zinət əşyaları', '', 'Jewelry', '', 'Драгоценности', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(205, 'Qida', '', 'Food', '', 'Еда', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(206, 'Qadınlar', '', 'Women', '', 'Женщины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(207, 'Heyvanlar', '', 'Animals', '', 'Животные', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(208, 'Torpaq', '', 'Land', '', 'Земля', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(211, 'İnternet', '', 'Internet', '', 'Интернет', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(213, 'Kitablar / Jurnallar / Məqalələr', '', 'Books / Magazines', '', 'Книги / Журналы / Статьи', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(214, 'Dəri məmulatları', '', 'Leather goods', '', 'Кожаные изделия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(215, 'Kompüter / Hesablama maşınları', '', 'Computers', '', 'Компьютер / Вычислительные машины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(216, 'Dərmanlar / Sağlamlıq', '', 'Treating', '', 'Лекарства / Здоровье', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(217, 'Sevgi (məhəbbət)', '', 'Love', '', 'Любовь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(218, 'Makiyaj', '', 'Makeup', '', 'Макияж', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(219, 'Massaj / Fizioteropiya', '', 'Massage / Physiotherapy', '', 'Массаж / Физиотерапия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(220, 'Metal', '', 'Metal', '', 'Металл', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(221, 'Moda', '', 'Fashion', '', 'Мода', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(222, 'Kişilər', '', 'Men', '', 'Мужчины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(223, 'Musiqi', '', 'Music', '', 'Музыка', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(224, 'Cizgi filmləri', '', 'Cartoons', '', 'Мультики', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(225, 'Multimedia', '', 'Multimedia', '', 'Мультимедиа', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(226, 'Elm', '', 'Science', '', 'Наука', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(227, 'Müraciət (nitq, yazı, jestlər)', '', 'Address (speech, writing, gestures)', '', 'Обращение (речь, письмо, жесты)', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(228, 'Tədris / Təhsil / Tərbiyə', '', 'Study', '', 'Обучение / Учёба / Воспитание', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(229, 'Od (atəş)', '', 'Fire', '', 'Огонь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(230, 'Paltar / Trikotaj', '', 'Clothes', '', 'Одежда / Трикотаж', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(231, 'Təşkilatlar (qurumlar)', '', 'Organization', '', 'Организация', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(232, 'Ov', '', 'Hunting', '', 'Охота', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(233, 'Mühafizə / Təhlükəsizlik', '', 'Guarding / Protection', '', 'Охрана / Защита', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(234, 'Mağnılar', '', 'Songs', '', 'Песни', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(235, 'Plastmassa', '', 'Plastic', '', 'Пластмасса', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL);
INSERT INTO `categories` (`id`, `catNameAz`, `catInfoAz`, `catNameEn`, `catInfoEn`, `catNameRu`, `catInfoRu`, `created`, `updated`, `lastVideoAdded`, `isDeleted`, `deleted`, `deletedById`, `deletedByIP`, `questions`, `createdById`, `createdByIP`, `catGroupId`) VALUES
(236, 'Hava', '', 'Weather', '', 'Погода', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(238, 'Tikililər (binalar, körpülər ...)', '', 'Buildings', '', 'Постройки (здания, мосты …)', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(239, 'Qab-qacaq', '', 'Dishes', '', 'Посуда', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(241, 'Bayramlar / Tədbirlər', '', 'Holidays / Events', '', 'Праздники / Мероприятия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(242, 'Təbiət', '', 'Nature', '', 'Природа', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(243, 'Saç düzümü', '', 'Haircut', '', 'Причёска', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(244, 'Proqramlar (kompüter proqramları)', '', 'Software', '', 'Программы (компьютерные)', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(245, 'İstehsalat / Yaradıcılıq', '', 'Production / Creation', '', 'Производство / Создание', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(246, 'İş', '', 'Work', '', 'Работа', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(247, 'Bitki', '', 'Plants', '', 'Растения', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(248, 'Rezin', '', 'Rubber', '', 'Резина', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(249, 'Reklam', '', 'Advertisement', '', 'Реклама', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(250, 'Din', '', 'Religions', '', 'Религия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(251, 'Təmir', '', 'Repairing', '', 'Ремонт', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(252, 'Şəkil', '', 'Painting / Drawing', '', 'Рисование / картины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(253, 'Balıq ovu', '', 'Fishing', '', 'Рыбалка', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(254, 'Bağca', '', 'Garden', '', 'Сад / Огород', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(255, 'Özünün inkişafı / Psixologiya', '', 'Self-development / Psychology', '', 'Саморазвитие / Психология', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(256, 'Fövqal-qabiliyyətlər / Ekstrasensorika', '', 'Super-abilities / Extrasensorics', '', 'Сверхспособности / Экстрасенсорика', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(258, 'Seks', '', 'Sex', '', 'Секс', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(260, 'Heykəllər / Monumentlər', '', 'Sculptures / Monuments', '', 'Скульптуры / Монументы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(261, 'Yuxu', '', 'Dream', '', 'Сон', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(262, 'İdman', '', 'Sports', '', 'Спорт', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(263, 'Şüşə', '', 'Glass', '', 'Стекло', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(264, 'Stil', '', 'Style', '', 'Стиль', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(265, 'Şeirlər', '', 'Poems', '', 'Стихи', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(266, 'Ölkələr', '', 'Countries', '', 'Страны', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(267, 'Rəqslər', '', 'Dancing', '', 'Танцы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(268, 'Tele-radio-internet verilişlər', '', 'TV,  radio, internet programs', '', 'Теле-радио-интернет программы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(269, 'Telefon', '', 'Phones', '', 'Телефон', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(270, 'Texnika / Mexanizmlər (qurğular)', '', 'Engineering / Mechanisms', '', 'Техника / Механизмы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(271, 'Ənənələr', '', 'Traditions', '', 'Традиции / Ритуалы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(272, 'Nəqliyyat', '', 'Transport', '', 'Транспорт', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(273, 'Tryuklar (hoqqalar) / Tamaşalar', '', 'Tricks / Show', '', 'Трюки (фокусы) / Представления', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(274, 'Xidmət', '', 'Services', '', 'Услуги', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(275, 'Foto-şəkillər', '', 'Photos', '', 'Фото', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(276, 'İnsan / Camaat', '', 'Man / People', '', 'Человек / Люди', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(277, 'Rəqəmlər / Ölçü', '', 'Numbers / Measures', '', 'Числа / Мера', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(278, 'Təmizlik', '', 'Cleanliness', '', 'Чистота / Уборка', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(279, 'Enerji', '', 'Energy', '', 'Энергия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(280, 'Dillər', '', 'Languages', '', 'Языки', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL),
(281, 'Digər', '', 'Other', '', 'Другое', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, '', 12, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catgroups`
--

CREATE TABLE IF NOT EXISTS `catgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catGroupNameAz` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `infoAz` text COLLATE utf8_unicode_ci NOT NULL,
  `catGroupNameEn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `infoEn` text COLLATE utf8_unicode_ci NOT NULL,
  `catGroupNameRu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `infoRu` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `catgroups`
--

INSERT INTO `catgroups` (`id`, `catGroupNameAz`, `infoAz`, `catGroupNameEn`, `infoEn`, `catGroupNameRu`, `infoRu`) VALUES
(1, 'Humanitar, sosial və tətbiqi sahələr', 'İnkişafı, insanlığın inkişafından asılı olan sahələr', 'Humanitarian, social and practical fields', 'About the fields, level of  development of which depends on the development of mankind', 'Гуманитарные, социальные и практические области', 'Области, развитие которых зависит от развития человечества'),
(2, 'Yaradıcılıq (İncəsənət)', 'Unikal əsərlər yaradılan sahələr', 'Creativity (Art)', 'About the fields, where unique work of art is created', 'Творчество (Искусство)', 'Области, в которых создаются уникальные призведения'),
(3, 'Təbii və dəqiq sahələr', 'Həqiqəti insanın qavrayışından asılı olmayan sahələr', 'Natural and exact fields', 'About the fields, the truth of which do not depend on their perception by a human being', 'Естественные и точные области', 'Области, истина которых не зависит от восприятия их человеком'),
(4, 'Humanitar, sosial və tətbiqi sahələr üzrə mütəxəssislər', 'İnkişafı, insanlığın inkişafından asılı olan sahələrin mütəxəssisləri', 'Experts in the humanitarian, social and practical areas', 'Experts on fields, level of  development of which depends on the development of mankind', 'Специалисты в гуманитарных, социальных и практических областях', 'Специалисты областей, развитие которых зависит от развития человечества'),
(5, 'Yaradıcılıq (İncəsənət) xadimləri', 'Unikal əsərlər yaradılan sahələrin mütəxəssisləri', 'Artists', 'Experts on fields, where unique work of art is created', 'Деятели различных творчеств (искусств)', 'Деятели областей, в которых создаются уникальные призведения'),
(6, 'Təbii və dəqiq sahələr üzrə mütəxəssislər', 'Həqiqəti insanın qavrayışından asılı olmayan sahələrin mütəxəssisləri', 'Experts in the natural and exact  fields', 'Experts on the fields, the truth of which do not depend on their perception by a human being', 'Специалисты в естественных и точных областях', 'Деятели областей, истина которых не зависит от восприятия их человеком');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `videoId` int(11) NOT NULL,
  `isConfirmed` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `confirmedById` int(11) DEFAULT NULL,
  `confirmedByIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `createdById` int(11) DEFAULT NULL COMMENT 'commenter Id',
  `userIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updatedById` int(11) DEFAULT NULL,
  `updatedByIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `confirmedById` (`confirmedById`),
  KEY `createdById` (`createdById`),
  KEY `updatedById` (`updatedById`),
  FULLTEXT KEY `confirmedByIP` (`confirmedByIP`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=44 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `videoId`, `isConfirmed`, `email`, `confirmedById`, `confirmedByIP`, `createdById`, `userIP`, `updated`, `created`, `updatedById`, `updatedByIP`) VALUES
(1, 'add', 206, 1, '', NULL, '', 1, '127.0.0.1', '2015-09-21 19:37:43', '2015-04-28 14:28:23', 1, '::1'),
(2, 'test comment122', 206, 1, '', 1, '::1', 1, '127.0.0.1', '2015-09-21 15:09:02', '2015-04-28 14:28:59', 1, '127.0.0.1'),
(3, 'test comment1', 206, 1, '', 1, '::1', 1, '127.0.0.1', '0000-00-00 00:00:00', '2015-04-28 14:51:29', NULL, ''),
(4, 'test comment1eeee', 206, 1, '', NULL, '', 1, '127.0.0.1', '2015-09-21 15:09:18', '2015-04-28 14:51:53', 1, '127.0.0.1'),
(28, 'sdfsdf', 206, 1, '', NULL, '', 1, '127.0.0.1', '0000-00-00 00:00:00', '2015-09-21 15:09:25', NULL, ''),
(7, 'this is test comment this is test comment this is test comment this is test comment this is test comment', 203, 1, '', NULL, '', 1, '127.0.0.1', '0000-00-00 00:00:00', '2015-04-28 14:57:03', NULL, ''),
(8, 'this is test comment this is test comment this is test comment this is test comment this is test comment', 203, 1, '', NULL, '', 1, '127.0.0.1', '0000-00-00 00:00:00', '2015-04-28 14:58:12', NULL, ''),
(9, 'commentsssss', 203, 1, '', NULL, '', 1, '127.0.0.1', '0000-00-00 00:00:00', '2015-04-28 15:04:58', NULL, ''),
(10, 'commentsssss', 203, 1, '', NULL, '', 1, '127.0.0.1', '0000-00-00 00:00:00', '2015-04-28 15:18:10', NULL, ''),
(12, 'ddksdf sd;fpskd fs'';flkw f;wlkecjcedewwc wewef w', 208, 1, '', NULL, '', 3, '127.0.0.1', '2015-05-02 16:15:24', '2015-04-28 15:50:23', 3, '127.0.0.1'),
(13, 'cc', 208, 1, '', NULL, '', 1, '127.0.0.1', '0000-00-00 00:00:00', '2015-04-30 10:06:36', NULL, ''),
(14, 'cc', 208, 1, '', NULL, '', 1, '127.0.0.1', '0000-00-00 00:00:00', '2015-04-30 10:10:15', NULL, ''),
(19, 'kkk', 208, 1, '', NULL, '', 3, '127.0.0.1', '0000-00-00 00:00:00', '2015-05-02 16:09:32', NULL, ''),
(22, 'sdfsdf', 230, 1, '', NULL, '', 1, '127.0.0.1', '0000-00-00 00:00:00', '2015-05-27 11:09:40', NULL, ''),
(24, 'asdd111', 219, 1, '', NULL, '', 1, '127.0.0.1', '2015-07-13 11:49:00', '2015-07-13 11:37:01', 1, '127.0.0.1'),
(27, 'sdsfasdfasdf', 1, 1, '', NULL, '', 1, '127.0.0.1', '2015-09-21 14:11:39', '2015-09-21 14:11:34', 1, '127.0.0.1'),
(29, 'kkkk', 228, 1, '', NULL, '', 1, '::1', '0000-00-00 00:00:00', '2015-09-21 20:08:26', NULL, ''),
(32, 'kkkk', 228, 1, '', NULL, '', 1, '::1', '0000-00-00 00:00:00', '2015-09-22 07:14:11', NULL, ''),
(33, 'kkkk', 228, 1, '', NULL, '', 1, '::1', '0000-00-00 00:00:00', '2015-09-22 07:14:33', NULL, ''),
(43, 'new test', 206, 1, 'nifteli@yahoo.com', 1, '::1', NULL, '::1', '0000-00-00 00:00:00', '2015-10-28 06:33:00', NULL, ''),
(36, 'sdfdfff11111', 233, 1, '', NULL, '', 1, '127.0.0.1', '2015-09-22 08:01:14', '2015-09-22 08:00:59', 1, '127.0.0.1'),
(41, 'this is comment without login. sent to confirmation', 206, 1, 'nifteli@yahoo.com', 1, '', NULL, '::1', '0000-00-00 00:00:00', '2015-10-06 13:09:50', 1, ''),
(39, 'wihout_auth', 206, 1, 'nifteli@yahoo.com', 1, '', NULL, '::1', '0000-00-00 00:00:00', '2015-10-06 07:33:55', NULL, ''),
(42, 'this is comment without login. sent to confirmation', 206, 1, 'nifteli@yahoo.com', 1, '::1', NULL, '::1', '0000-00-00 00:00:00', '2015-10-06 13:10:50', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `createdById` int(11) DEFAULT NULL,
  `createdByIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `updatedById` int(11) DEFAULT NULL,
  `updatedByIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `updated` datetime NOT NULL,
  `lastVideoAddedById` int(11) DEFAULT NULL,
  `lastVideoAdded` datetime NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deletedById` int(11) DEFAULT NULL,
  `deletedByIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `deleted` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createdById` (`createdById`),
  KEY `updatedById` (`updatedById`),
  KEY `lastVideoAddedById` (`lastVideoAddedById`),
  KEY `deletedById` (`deletedById`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `name`, `created`, `createdById`, `createdByIP`, `updatedById`, `updatedByIP`, `updated`, `lastVideoAddedById`, `lastVideoAdded`, `isDeleted`, `deletedById`, `deletedByIP`, `deleted`) VALUES
(1, 'TestFolder', '2015-05-18 00:00:00', 1, '', NULL, '', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 0, 1, '::1', '2015-10-28 13:26:20'),
(2, 'TestFolder2', '2015-09-23 00:00:00', 1, '', NULL, '', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 0, NULL, '0', '0000-00-00 00:00:00'),
(3, 'folder_user', '2015-09-23 00:00:00', 2, '', NULL, '', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', 0, NULL, '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `foldertags`
--

CREATE TABLE IF NOT EXISTS `foldertags` (
  `tagId` int(11) NOT NULL,
  `folderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `foldertags`
--

INSERT INTO `foldertags` (`tagId`, `folderId`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `foldervideos`
--

CREATE TABLE IF NOT EXISTS `foldervideos` (
  `folderId` int(11) NOT NULL,
  `videoId` int(11) NOT NULL,
  `added` datetime NOT NULL,
  `addedByIP` varchar(20) NOT NULL,
  UNIQUE KEY `idxUnq` (`folderId`,`videoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `foldervideos`
--

INSERT INTO `foldervideos` (`folderId`, `videoId`, `added`, `addedByIP`) VALUES
(1, 1, '2015-10-01 07:52:55', '::1'),
(1, 24, '2015-09-29 07:28:27', '::1'),
(2, 206, '2015-10-01 07:52:43', '::1'),
(3, 206, '2015-10-01 07:52:43', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameEn` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nameAz` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nameRu` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbr` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=91 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `nameEn`, `nameAz`, `nameRu`, `abbr`) VALUES
(1, 'Afrikaans', 'Afrikan', 'Африкаанс', 'AF'),
(2, 'Albanian', 'Alban', 'Албанский', 'SQ'),
(3, 'Arabic', 'Ərəb', 'Арабский', 'AR'),
(4, 'Armenian', 'Erməni', 'Армянский', 'HY'),
(5, 'Azerbaijani', 'Azərbaycan', 'Азербайджанский', 'AZ'),
(6, 'Basque', 'Bask', 'Баскский', 'EU'),
(7, 'Belarusian', 'Belarus', 'Белорусский', 'BE'),
(8, 'Bengali', 'Benqal', 'Бенгальский', 'BN'),
(9, 'Bosnian', 'Bosniya', 'Боснийский', 'BS'),
(10, 'Bulgarian', 'Bolqar', 'Болгарский', 'BG'),
(11, 'Catalan', 'Katalan', 'Каталанский', 'CA'),
(12, 'Cebuano', 'Sebuano', 'Себуанский', 'CE'),
(13, 'Chichewa', 'Çiçeva', 'Чева', 'NY'),
(14, 'Chinese', 'Çin', 'Китайский', 'ZH'),
(15, 'Croatian', 'Xorvat', 'Хорватский', 'HR'),
(16, 'Czech', 'Çex', 'Чешский', 'CS'),
(17, 'Danish', 'Danimarka', 'Датский', 'DA'),
(18, 'Dutch', 'Holland', 'Нидерландский', 'NL'),
(19, 'English', 'İngilis', 'Английский', 'EN'),
(20, 'Esperanto', 'Esperanto', 'Эсперанто', 'EO'),
(21, 'Estonian', 'Eston', 'Эстонский', 'ET'),
(22, 'Filipino (Tagalog)', 'Taqaloq (Filipin)', 'Тагальский', 'TL'),
(23, 'Finnish', 'Fin', 'Финский', 'FI'),
(24, 'French', 'Fransız', 'Французский', 'FR'),
(25, 'Galician', 'Qalisian', 'Галисийский', 'GL'),
(26, 'Georgian', 'Gürcü', 'Грузинский', 'KA'),
(27, 'German', 'Alman', 'Немецкий', 'DE'),
(28, 'Greek', 'Yunan', 'Греческий', 'GR'),
(29, 'Gujarati', 'Gucarati', 'Гуджарати', 'GU'),
(30, 'Haitian Creole', 'Haiti Kreol', 'Креольский (Гаити)', 'HT'),
(31, 'Hausa', 'Hausa', 'Хауса', 'HA'),
(32, 'Hebrew', 'İvrit (İsrail)', 'Иврит', 'HE'),
(33, 'Hindi', 'Hindi', 'Хинди', 'HI'),
(34, 'Hmong', 'Hmong', 'Хмонг', 'HM'),
(35, 'Hungarian', 'Macar', 'Венгерский', 'HU'),
(36, 'Icelandic', 'İsland', 'Исландский', 'IS'),
(37, 'Igbo', 'İgbo', 'Игбо', 'IG'),
(38, 'Indonesian', 'İndoneziya', 'Индонезийский', 'IN'),
(39, 'Irish (Gaelic)', 'İrland', 'Ирландский', 'GA'),
(40, 'Italian', 'İtalyan', 'Итальянский', 'IT'),
(41, 'Japanese', 'Yapon', 'Японский', 'JA'),
(42, 'Javanese', 'Yava', 'Яванский', 'JV'),
(43, 'Kannada', 'Kannada', 'Каннада', 'KN'),
(44, 'Kazakh', 'Qazaxca', 'Казахский', 'KK'),
(45, 'Khmer', 'Xmer', 'Кхмерский', 'KM'),
(46, 'Korean', 'Koreya', 'Корейский', 'KO'),
(47, 'Lao', 'Laos', 'Лаосский', 'LO'),
(48, 'Latin', 'Latın', 'Латынь', 'LA'),
(49, 'Latvian', 'Latış', 'Латышский', 'LV'),
(50, 'Lithuanian', 'Litva', 'Литовский', 'LT'),
(51, 'Macedonian', 'Mekedoniya', 'Македонский', 'MK'),
(52, 'Malagasy', 'Malaqasi', 'Малагасийский', 'MG'),
(53, 'Malay', 'Malay', 'Малайский', 'ML'),
(54, 'Malayalam', 'Malayalam', 'Малайялам', 'ML'),
(55, 'Maltese', 'Malta', 'Мальтийский', 'MT'),
(56, 'Maori', 'Maori', 'Маори', 'MI'),
(57, 'Marathi', 'Maratxi', 'Маратхи', 'MS'),
(58, 'Mongolian', 'Monqol', 'Монгольский', 'MN'),
(59, 'Myanmar (Burmese)', 'Myanmar (Burma)', 'Бирманский', 'MY'),
(60, 'Nepali', 'Nepal', 'Непали', 'NE'),
(61, 'Norwegian', 'Norveç', 'Норвежский', 'NO'),
(62, 'Persian', 'Fars', 'Персидский', 'FA'),
(63, 'Polish', 'Polyak', 'Польский', 'PL'),
(64, 'Portuguese', 'Portuqal', 'Португальский', 'PT'),
(65, 'Punjabi', 'Punjabi', 'Панджаби', 'PA'),
(66, 'Romanian', 'Rumın', 'Румынский', 'RO'),
(67, 'Russian', 'Rus', 'Русский', 'RU'),
(68, 'Serbian', 'Serb', 'Сербский', 'SR'),
(69, 'Sesotho', 'Sesoto', 'Сесото', 'ST'),
(70, 'Sinhala (Singhalese)', 'Sinhala', 'Сингальский', 'SI'),
(71, 'Slovak', 'Slovak', 'Словацкий', 'SK'),
(72, 'Slovenian', 'Sloven', 'Словенский', 'SL'),
(73, 'Somali', 'Somali', 'Сомали', 'SO'),
(74, 'Spanish', 'İspan', 'Испанский', 'ES'),
(75, 'Sundanese', 'Sudan', 'Суданский', 'SU'),
(76, 'Swahili', 'Suahili', 'Суахили', 'SW'),
(77, 'Swedish', 'İsveç', 'Шведский', 'SV'),
(78, 'Tajik', 'Tacik', 'Таджикский', 'TG'),
(79, 'Tamil', 'Tamil', 'Тамильский', 'TA'),
(80, 'Telugu', 'Teluqu', 'Телугу', 'TE'),
(81, 'Thai', 'Tay', 'Тайский', 'TH'),
(82, 'Turkish', 'Türk', 'Турецкий', 'TR'),
(83, 'Ukrainian', 'Ukrayna', 'Украинский', 'UK'),
(84, 'Urdu', 'Urdu', 'Урду', 'UR'),
(85, 'Uzbek', 'Özbək', 'Узбекский', 'UZ'),
(86, 'Vietnamese', 'Vyetnam', 'Вьетнамский', 'VI'),
(87, 'Welsh', 'Uels', 'Валлийский', 'CY'),
(88, 'Yiddish', 'İvrit', 'Идиш', 'JI'),
(89, 'Yoruba', 'Yoruba', 'Йоруба', 'YO'),
(90, 'Zulu', 'Zulu', 'Зулу', 'ZU');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdById` int(11) DEFAULT NULL,
  `createdByIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `fileName` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'attached file',
  PRIMARY KEY (`id`),
  KEY `createdById` (`createdById`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profileviews`
--

CREATE TABLE IF NOT EXISTS `profileviews` (
  `viewerId` int(11) NOT NULL,
  `viewedId` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `lastViewed` datetime NOT NULL,
  PRIMARY KEY (`viewerId`,`viewedId`),
  KEY `viewedId` (`viewedId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` tinyint(4) NOT NULL,
  `bitValue` smallint(6) NOT NULL,
  `question` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `bitValue`, `question`) VALUES
(1, 1, 'Nə'),
(2, 2, 'Kim'),
(3, 4, 'Necə'),
(4, 8, 'Niyə'),
(5, 12, 'Necə/Niyə');

-- --------------------------------------------------------

--
-- Table structure for table `reportreasons`
--

CREATE TABLE IF NOT EXISTS `reportreasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reasonAz` varchar(100) NOT NULL,
  `reasonEn` varchar(100) NOT NULL,
  `reasonRu` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `reportreasons`
--

INSERT INTO `reportreasons` (`id`, `reasonAz`, `reasonEn`, `reasonRu`) VALUES
(1, 'Spam', 'Spam', 'Spam'),
(2, 'Uyğunsuz video', 'Not appropriate video', 'Not appropriate video'),
(3, 'Siyasi video', 'Political', 'Political'),
(4, 'Digər', 'Other', 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `roleaccess`
--

CREATE TABLE IF NOT EXISTS `roleaccess` (
  `roleId` int(11) NOT NULL,
  `accessTypeId` int(11) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  PRIMARY KEY (`roleId`,`accessTypeId`),
  KEY `accessTypeId` (`accessTypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roleaccess`
--

INSERT INTO `roleaccess` (`roleId`, `accessTypeId`, `startDate`, `endDate`) VALUES
(1, 29, '2015-10-01 00:00:00', '0000-00-00 00:00:00'),
(3, 3, '2015-07-31 00:00:00', '0000-00-00 00:00:00'),
(3, 2, '2015-07-22 00:00:00', '2015-07-03 00:00:00'),
(1, 28, '2015-10-01 00:00:00', '0000-00-00 00:00:00'),
(3, 1, '2015-07-05 00:00:00', '2015-07-31 00:00:00'),
(5, 4, '2015-09-02 00:00:00', '0000-00-00 00:00:00'),
(5, 1, '2015-09-01 00:00:00', '2015-09-02 00:00:00'),
(5, 2, '2015-09-01 00:00:00', '2015-09-03 00:00:00'),
(5, 6, '2015-09-01 00:00:00', '2015-09-30 00:00:00'),
(1, 27, '2015-10-01 00:00:00', '0000-00-00 00:00:00'),
(1, 26, '2015-10-01 00:00:00', '0000-00-00 00:00:00'),
(1, 25, '2015-10-14 00:00:00', '0000-00-00 00:00:00'),
(1, 24, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 23, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 22, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 21, '2015-10-01 00:00:00', '0000-00-00 00:00:00'),
(1, 20, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 19, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 18, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 17, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 16, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 15, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 14, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 13, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 12, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 11, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 10, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 9, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 8, '2015-10-01 00:00:00', '0000-00-00 00:00:00'),
(1, 7, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 6, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 5, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 4, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 3, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 2, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 1, '2015-07-01 00:00:00', '0000-00-00 00:00:00'),
(1, 30, '2015-10-01 00:00:00', '0000-00-00 00:00:00'),
(1, 31, '2015-10-01 00:00:00', '0000-00-00 00:00:00'),
(1, 32, '2015-10-01 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `createdBy` int(11) NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdBy`, `created`) VALUES
(1, 'Admin', 1, '2016-03-07'),
(3, 'IstifadeciAdministrator', 1, '2015-08-07'),
(5, 'eee2', 1, '2017-02-08');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE IF NOT EXISTS `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdById` int(11) DEFAULT NULL,
  `createdByIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createdById` (`createdById`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE IF NOT EXISTS `subscriptions` (
  `userId` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  `subsDate` datetime NOT NULL,
  UNIQUE KEY `idxUnq` (`userId`,`catId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`userId`, `catId`, `subsDate`) VALUES
(1, 96, '2015-10-06 07:07:08'),
(1, 241, '2015-10-05 13:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `langId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tags` (`name`,`langId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=104 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `langId`) VALUES
(64, 'addit', 5),
(78, 'alabala bala', 5),
(69, 'alalalal', 5),
(75, 'aztag', 5),
(96, 'best', 19),
(91, 'bestofbest', 5),
(68, 'blabla', 5),
(79, 'boom', 5),
(71, 'cancel', 5),
(102, 'change', 19),
(80, 'closer', 5),
(92, 'diger', 5),
(54, 'duff', 5),
(85, 'ebru', 5),
(76, 'entag', 5),
(39, 'entertainment', 5),
(63, 'especially', 5),
(41, 'evething', 5),
(60, 'extraordinary', 5),
(4, 'eylence', 5),
(84, 'fairtail', 5),
(62, 'from youtube', 5),
(82, 'going bother', 5),
(66, 'google', 5),
(26, 'Gozel', 19),
(36, 'grigoriy', 5),
(46, 'hashtag', 5),
(53, 'hillary', 5),
(10, 'honeymoon', 5),
(30, 'Ilhan', 5),
(3, 'Istirahet', 5),
(93, 'JOE COCKER', 5),
(83, 'just enough', 5),
(35, 'leps', 5),
(44, 'lorem.ipsum', 5),
(89, 'madonna', 5),
(94, 'madonna', 19),
(9, 'maldiv', 5),
(88, 'manson', 5),
(24, 'Moda', 5),
(38, 'music', 5),
(95, 'music', 19),
(55, 'musician', 5),
(87, 'musiqi', 5),
(37, 'muzika', 5),
(86, 'nese', 5),
(48, 'nese1', 5),
(49, 'nese2', 5),
(50, 'nese3', 5),
(57, 'new', 5),
(72, 'new singer', 5),
(31, 'newtag', 5),
(11, 'Özlem Tekin', 5),
(25, 'Pul', 5),
(77, 'rutag', 5),
(59, 'sexy', 5),
(73, 'sexy singer', 5),
(12, 'sezen', 5),
(65, 'share it', 5),
(81, 'skin to skin', 5),
(28, 'slepak', 67),
(27, 'Slepakov', 5),
(56, 'some', 5),
(61, 'some new music', 5),
(40, 'something', 5),
(74, 'sparks', 5),
(23, 'sss', 5),
(33, 'tag1', 5),
(34, 'tag2', 5),
(51, 'tag33', 5),
(45, 'tagtag', 5),
(43, 'tagtest', 5),
(58, 'talent', 5),
(90, 'taq', 5),
(1, 'taq1', 5),
(2, 'taq2', 5),
(32, 'tarkan', 5),
(42, 'testtag', 5),
(70, 'this is test tag', 5),
(101, 'update', 19),
(52, 'youtube', 5),
(67, 'youtube trend', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `roleId` int(11) NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fatherName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birthDate` date NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `picturePath` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `registered` datetime NOT NULL,
  `registeredByIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastLoggedIn` datetime NOT NULL,
  `languageId` int(11) DEFAULT NULL,
  `profession` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `interests` text COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` datetime NOT NULL,
  `deletedById` int(11) DEFAULT NULL,
  `contentChangeCount` int(11) NOT NULL COMMENT 'Sayt kontentini dəyişdirmə sayı',
  `getEmailOnVideoComment` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `deletedById` (`deletedById`),
  KEY `languageId` (`languageId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `password`, `status`, `roleId`, `hash`, `firstName`, `lastName`, `fatherName`, `birthDate`, `gender`, `email`, `picturePath`, `registered`, `registeredByIP`, `lastLoggedIn`, `languageId`, `profession`, `interests`, `phoneNumber`, `notes`, `isDeleted`, `deleted`, `deletedById`, `contentChangeCount`, `getEmailOnVideoComment`, `created`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'confirmed', 1, '55646323a049e', 'Zöhrab', 'Niftəliyev', 'AAA', '1985-02-14', 'Male', 'nifteli@yahoo.com', './uploads/userPictures/1.jpeg', '2015-03-12 11:31:00', '', '2015-10-19 16:30:43', 5, 'Vəzifə', 'Maraqlar', '0000000', '', 0, '0000-00-00 00:00:00', NULL, 0, 1, '2015-09-30 10:53:47'),
(2, 'user1', 'f6fdffe48c908deb0f4c3bd36c032e72', 'confirmed', 0, '55295c5f4187e', 'User1', 'Ov', '', '0000-00-00', 'Male', 'user1@mail.com', '', '2015-04-11 19:39:43', '127.0.0.1', '2015-04-11 13:45:05', NULL, '', '', '', '', 0, '0000-00-00 00:00:00', NULL, 0, 0, '2015-09-30 10:53:47'),
(3, 'admin2', '21232f297a57a5a743894a0e4a801fc3', 'confirmed', 0, '', 'Admin2', 'Adminovic2', '', '0000-00-00', 'Male', '', '', '2015-03-12 11:31:00', '', '2015-05-01 00:21:26', 19, '', '', '', '', 0, '0000-00-00 00:00:00', NULL, 0, 0, '2015-09-30 10:53:47'),
(4, 'test', '5ed504758170fae49849bd1ebaef1a76', 'confirmed', 0, '55a4da52353d4', 'test', 'test', '', '0000-00-00', 'Male', 'nifteli@gmail.com', '', '2015-07-14 11:45:54', '127.0.0.1', '0000-00-00 00:00:00', 5, '', '', '1111111', '', 0, '0000-00-00 00:00:00', NULL, 0, 0, '2015-09-30 10:53:47');

-- --------------------------------------------------------

--
-- Table structure for table `videocats`
--

CREATE TABLE IF NOT EXISTS `videocats` (
  `videoId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `videocats`
--

INSERT INTO `videocats` (`videoId`, `categoryId`) VALUES
(1, 8),
(1, 254),
(2, 113),
(4, 113),
(5, 113),
(6, 113),
(7, 113),
(8, 113),
(9, 113),
(10, 113),
(11, 113),
(12, 113),
(13, 113),
(14, 113),
(15, 113),
(16, 113),
(17, 113),
(18, 113),
(208, 156),
(20, 113),
(21, 113),
(22, 113),
(23, 113),
(241, 11),
(25, 113),
(26, 113),
(27, 113),
(28, 113),
(29, 113),
(30, 113),
(31, 113),
(32, 113),
(33, 113),
(34, 113),
(35, 113),
(36, 113),
(37, 113),
(38, 113),
(39, 113),
(40, 113),
(41, 113),
(42, 113),
(43, 113),
(44, 113),
(45, 113),
(46, 113),
(47, 113),
(48, 113),
(49, 113),
(50, 113),
(51, 113),
(52, 113),
(53, 113),
(54, 113),
(55, 113),
(56, 113),
(57, 113),
(58, 113),
(59, 113),
(60, 113),
(61, 113),
(62, 113),
(63, 113),
(64, 113),
(65, 113),
(66, 113),
(67, 113),
(68, 113),
(69, 113),
(70, 113),
(71, 113),
(72, 113),
(73, 113),
(74, 113),
(75, 113),
(76, 113),
(77, 113),
(78, 113),
(79, 113),
(80, 113),
(81, 113),
(82, 113),
(83, 113),
(84, 113),
(85, 113),
(86, 113),
(87, 113),
(88, 113),
(89, 113),
(90, 113),
(91, 113),
(92, 113),
(93, 113),
(94, 113),
(95, 113),
(96, 113),
(97, 113),
(98, 113),
(99, 113),
(100, 113),
(101, 113),
(102, 113),
(103, 113),
(104, 113),
(105, 113),
(106, 113),
(107, 113),
(108, 113),
(109, 113),
(110, 113),
(111, 113),
(112, 113),
(113, 113),
(114, 113),
(115, 113),
(116, 113),
(117, 113),
(118, 113),
(119, 113),
(120, 113),
(121, 113),
(122, 113),
(123, 113),
(124, 113),
(125, 113),
(126, 113),
(127, 113),
(128, 113),
(129, 113),
(130, 113),
(131, 113),
(132, 113),
(133, 113),
(134, 113),
(135, 113),
(136, 113),
(137, 113),
(138, 113),
(139, 113),
(140, 113),
(141, 113),
(142, 113),
(143, 113),
(144, 113),
(145, 113),
(146, 113),
(147, 113),
(148, 113),
(149, 113),
(150, 113),
(151, 113),
(152, 113),
(153, 113),
(154, 113),
(155, 113),
(156, 113),
(157, 113),
(158, 113),
(159, 113),
(160, 113),
(161, 113),
(162, 113),
(163, 113),
(164, 113),
(165, 113),
(166, 113),
(167, 113),
(168, 113),
(169, 113),
(170, 113),
(171, 113),
(172, 113),
(173, 113),
(174, 113),
(175, 113),
(176, 113),
(177, 113),
(178, 113),
(179, 113),
(180, 113),
(181, 113),
(182, 113),
(183, 113),
(184, 113),
(185, 113),
(186, 113),
(187, 113),
(188, 113),
(189, 113),
(190, 113),
(191, 113),
(192, 113),
(193, 113),
(194, 113),
(195, 113),
(196, 113),
(197, 113),
(198, 113),
(199, 113),
(200, 113),
(201, 113),
(202, 254),
(203, 254),
(204, 103),
(205, 96),
(206, 1),
(207, 96),
(240, 106),
(209, 244),
(210, 244),
(211, 244),
(212, 244),
(213, 244),
(214, 244),
(215, 244),
(216, 244),
(217, 241),
(218, 8),
(218, 221),
(219, 97),
(220, 221),
(221, 199),
(222, 199),
(223, 108),
(224, 97),
(225, 16),
(226, 108),
(227, 103),
(228, 103),
(229, 113),
(230, 108),
(231, 113),
(232, 102),
(233, 103),
(234, 103),
(235, 114),
(236, 102),
(237, 1),
(238, 99),
(239, 18),
(242, 97),
(156, 243),
(156, 244),
(156, 245),
(156, 246),
(156, 247),
(156, 248),
(156, 249),
(156, 250),
(156, 251),
(156, 252),
(156, 253),
(156, 254),
(156, 255),
(156, 256),
(156, 257),
(156, 258),
(156, 259),
(156, 260),
(156, 261),
(156, 262),
(156, 263),
(156, 264),
(156, 265),
(156, 265),
(266, 156),
(267, 156),
(268, 156),
(269, 156),
(270, 156),
(271, 156),
(272, 156),
(282, 156),
(283, 156),
(289, 156),
(291, 156),
(292, 95),
(293, 156),
(294, 95),
(295, 156),
(296, 95),
(297, 156),
(298, 95),
(299, 156),
(287, 156),
(288, 156),
(290, 156),
(300, 95),
(301, 156);

-- --------------------------------------------------------

--
-- Table structure for table `videoreports`
--

CREATE TABLE IF NOT EXISTS `videoreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `videoId` int(11) NOT NULL,
  `reporterId` int(11) NOT NULL,
  `reportDate` datetime NOT NULL,
  `reasonId` int(11) NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `videoreports`
--

INSERT INTO `videoreports` (`id`, `videoId`, `reporterId`, `reportDate`, `reasonId`, `desc`) VALUES
(1, 208, 1, '2015-09-28 07:58:40', 1, 'ssss'),
(2, 208, 1, '2015-09-28 07:58:58', 2, ''),
(3, 24, 1, '2015-09-29 07:28:23', 1, 'bm'),
(4, 206, 1, '2015-10-16 08:09:48', 1, 'spa'),
(5, 206, 1, '2015-10-16 14:21:14', 1, 'll');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `languageId` int(11) DEFAULT NULL,
  `questions` smallint(6) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  `added` datetime NOT NULL,
  `addedById` int(11) DEFAULT NULL,
  `addedByIP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated` datetime NOT NULL,
  `updatedById` int(11) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  `deleted` datetime NOT NULL,
  `deletedById` int(11) DEFAULT NULL,
  `duration` int(11) NOT NULL COMMENT 'by seconds',
  PRIMARY KEY (`id`),
  KEY `addedById` (`addedById`),
  KEY `updatedById` (`updatedById`),
  KEY `deletedById` (`deletedById`),
  KEY `languageId` (`languageId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=302 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `link`, `languageId`, `questions`, `name`, `info`, `added`, `addedById`, `addedByIP`, `updated`, `updatedById`, `isDeleted`, `deleted`, `deletedById`, `duration`) VALUES
(1, 'https://www.youtube.com/watch?v=PQF9lPE-Ii4', 67, 12, 'test2', 'twst', '1970-01-01 00:00:00', 2, '127.0.0.1', '0000-00-00 00:00:00', NULL, 1, '2015-10-16 12:25:00', 1, 0),
(2, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 19, 2, '123', 'info', '1970-01-01 00:00:00', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(5, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad2', 'info', '1970-01-01 00:00:00', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 1, '2015-10-16 12:45:07', 1, 0),
(7, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(8, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(9, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(10, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(11, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(12, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(13, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(14, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(15, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(16, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(17, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(18, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(20, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(21, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(23, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(25, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(26, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(27, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(28, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(29, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(30, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(31, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(32, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(33, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(34, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(35, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(36, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(37, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(38, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(39, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(40, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(41, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(42, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(43, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(44, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(45, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(46, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(47, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(48, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(49, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(50, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(51, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(52, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(53, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(54, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(55, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(56, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(57, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(58, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(59, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(60, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(61, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(62, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(63, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(64, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(65, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(66, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(67, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(68, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(69, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(70, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(71, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(72, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(73, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(74, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(75, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(76, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(77, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(78, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(79, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(80, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(81, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(82, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(83, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(84, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(85, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(86, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(87, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(88, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(89, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(90, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(91, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(92, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(93, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(94, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(95, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(96, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(97, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(98, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(99, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(100, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(102, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(103, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(104, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(105, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(106, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(107, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(108, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(109, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(110, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(111, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(112, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(113, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(114, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(115, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(116, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(117, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(118, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(119, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(120, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(121, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(122, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(123, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(124, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(125, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(126, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(127, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(128, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(129, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(130, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(131, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(132, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(133, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(134, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(135, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(136, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(137, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(138, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(139, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(140, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(141, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(142, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(143, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(144, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(145, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(146, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(147, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(148, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(149, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(150, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(151, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(152, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(153, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(154, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(155, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(156, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(157, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(158, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(159, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(160, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(161, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(162, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(163, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(164, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(165, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(166, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(167, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(168, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(169, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(170, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(171, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(172, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(173, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(174, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(175, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(176, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(177, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(178, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(179, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(180, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(181, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(182, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(183, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(184, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(185, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(186, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(187, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(188, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(189, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(190, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(191, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(192, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(193, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(194, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(195, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(196, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(197, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(198, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(199, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(200, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(201, 'https://www.youtube.com/watch?v=kiQvaUAus-0', 5, 2, 'ad1', 'info', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(202, 'https://www.youtube.com/watch?v=BNTaJu2CVBg', 5, 4, 'videoad', 'melumat', '2015-04-24 11:42:57', 2, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(203, 'https://www.youtube.com/watch?v=BNTaJu2CVBg', 5, 4, 'Video Adı: ', 'Video Adı: \r\nVideo Adı: \r\n', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(204, 'https://www.youtube.com/watch?v=xpwZJPzcs7o', 5, 2, 'Honeymoon Pina-Ronnie. Zitahli Resort Maldives. Atlantis The Palm Dubai.', 'Traumhafte Flitterwochen auf den Malediven, Zitahli Kuda-Funafaru und in Dubai, Atlantis The Palm. Special thank to the Zitahli Staff. It was beautyful.', '2015-04-24 11:42:57', 3, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 600),
(205, 'https://www.youtube.com/watch?v=xpwZJPzcs7o', 5, 2, 'Honeymoon Pina-Ronnie. Zitahli Resort Maldives. Atlantis The Palm Dubai.', 'Traumhafte Flitterwochen auf den Malediven, Zitahli Kuda-Funafaru und in Dubai, Atlantis The Palm. Special thank to the Zitahli Staff. It was beautyful.', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 600),
(206, 'https://www.youtube.com/watch?v=p-j6hGSaqb0', 5, 1, 'Maldives - A trip to Paradise', 'A trip to Conrad Maldives Rangali Island resort with Ithaa Restaurant, the first undersea restaurant in the world, and Nemo N100 Tourist submarine.\r\n\r\nSee more:\r\nMy website: www.travip.me\r\nOn Facebook: www.facebook.com/travel.w.travip\r\nYume: www.yume.vn/travip', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 406),
(207, 'https://www.youtube.com/watch?v=ZMaHn82YOlw', 5, 2, 'Özlem Tekin - Sen Anla', 'Music video by Özlem Tekin performing Sen Anla. (C) 2010 SONY MUSIC ENTERTAINMENT TURKEY', '2015-04-24 11:42:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 235),
(208, 'https://www.youtube.com/watch?v=6ie6-s6EdH8', 5, 2, 'Sezen Aksu 3 En Duygusal 22 Şarkı', 'Sezen Aksu''nun en popüler, en çok dinlenen, en duygusal yirmi iki şarkısı.\r\n\r\n1) Adı Bende Saklı\r\n2) Ben Sende Tutuklu Kaldım\r\n3) El Gibi\r\n4) Farkındayım\r\n5) Geri Dön\r\n6) Gidiyorum\r\n7) Gülümse\r\n8) Her şeyi Yak\r\n9) İstanbul İstanbul Olalı\r\n10) Kaybolan Yıllar\r\n11) Keskin Bıçak\r\n12) Kolay Olmayacak\r\n13) Pişman Olduğun Zaman\r\n14) Sarı Odalarda\r\n15) Sen Ağlama\r\n16) Seni Kimler Aldı\r\n17) Sorma\r\n18) Tanrı İstemezse\r\n19) Tutsak\r\n20) Tükeneceğiz\r\n21) Unuttun mu Beni\r\n22) Vay\r\n JOIN QUIZGROUP PARTNER PROGRAM: http://join.quizgroup.com/?ref=207247', '2015-04-24 11:42:57', 1, '127.0.0.1', '2015-09-28 19:05:39', 1, 0, '0000-00-00 00:00:00', NULL, 6292),
(209, 'https://www.youtube.com/watch?v=uD3n-PH4CKM', 5, 12, '1 урок. Программирование в 1С 8.2. Простой и подробный курс!', 'www.1c-uroki.ru \r\nУрок 1 бесплатного курса по 1С 8.2 "Комплексная автоматизация предприятия". Знакомство со всеми механизмами платформы 1С Предприятие 8.2.\r\n\r\nОглавление 1 урока:\r\n01:12 что такое система 1С Предприятие 8.2?\r\n01:31 где скачать платформу 1С Предприятие 8.2\r\n01:49 архитектура 1С:Предприятие 8.2 на логическом уровне\r\n02:00 что такое информационная база?\r\n02:18 что такое конфигурация?\r\n02:40 что такое технологическая платформа 1С Предприятие 8.2?\r\n05:15 архитектура 1С Предприятие 8.2 на физическом уровне;\r\n05:33 файл-серверный вариант работы 1С 8.2;\r\n07:50 файл-серверный вариант работы 1С 8.2 с использованием веб-сервера;\r\n09:00 клиент-серверный вариант работы системы 1С Предприятие 8.2;\r\n10:00 что такое сервер 1С Предприятие 8.2?\r\n11:16 тонкий и толстый клиент платформы 1С Предприятие 8.2;\r\n13:38 знакомство с основными классами объектов в 1C 8.2;\r\n16:00 зачем нужны регистры в системе 1С 8.2?\r\n23:19 запуск конфигурации 1С Предприятия 8.2;\r\n24:48 создание новой информационной базы\r\n29:25 режимы запуска 1С: «1С Предприятие» и «Конфигуратор»;\r\n32:00 знакомство с классом объектов Константы;\r\n32:45 знакомство с классом объектов Справочники;\r\n33:59 создание справочника Сотрудники;\r\n42:44 создание иерархического справочника Контрагенты.\r\n\r\n\r\nСкачать платформу 1С Предприятие 8.2 можно тут:\r\nwww.1c-uroki.ru/articles/download_1C_8.2\r\n\r\nСсылка на 1 урок \r\nwww.1c-uroki.ru/lessons/kurs1C_1/1_urok_kurs_1C_8.2\r\n', '2015-04-27 10:46:27', 3, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2742),
(210, 'https://www.youtube.com/watch?v=uD3n-PH4CKM', 5, 12, '1 урок. Программирование в 1С 8.2. Простой и подробный курс!', 'www.1c-uroki.ru \r\nУрок 1 бесплатного курса по 1С 8.2 "Комплексная автоматизация предприятия". Знакомство со всеми механизмами платформы 1С Предприятие 8.2.\r\n\r\nОглавление 1 урока:\r\n01:12 что такое система 1С Предприятие 8.2?\r\n01:31 где скачать платформу 1С Предприятие 8.2\r\n01:49 архитектура 1С:Предприятие 8.2 на логическом уровне\r\n02:00 что такое информационная база?\r\n02:18 что такое конфигурация?\r\n02:40 что такое технологическая платформа 1С Предприятие 8.2?\r\n05:15 архитектура 1С Предприятие 8.2 на физическом уровне;\r\n05:33 файл-серверный вариант работы 1С 8.2;\r\n07:50 файл-серверный вариант работы 1С 8.2 с использованием веб-сервера;\r\n09:00 клиент-серверный вариант работы системы 1С Предприятие 8.2;\r\n10:00 что такое сервер 1С Предприятие 8.2?\r\n11:16 тонкий и толстый клиент платформы 1С Предприятие 8.2;\r\n13:38 знакомство с основными классами объектов в 1C 8.2;\r\n16:00 зачем нужны регистры в системе 1С 8.2?\r\n23:19 запуск конфигурации 1С Предприятия 8.2;\r\n24:48 создание новой информационной базы\r\n29:25 режимы запуска 1С: «1С Предприятие» и «Конфигуратор»;\r\n32:00 знакомство с классом объектов Константы;\r\n32:45 знакомство с классом объектов Справочники;\r\n33:59 создание справочника Сотрудники;\r\n42:44 создание иерархического справочника Контрагенты.\r\n\r\n\r\nСкачать платформу 1С Предприятие 8.2 можно тут:\r\nwww.1c-uroki.ru/articles/download_1C_8.2\r\n\r\nСсылка на 1 урок \r\nwww.1c-uroki.ru/lessons/kurs1C_1/1_urok_kurs_1C_8.2\r\n', '2015-04-27 10:46:46', 3, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2742),
(211, 'https://www.youtube.com/watch?v=uD3n-PH4CKM', 5, 12, '1 урок. Программирование в 1С 8.2. Простой и подробный курс!', 'www.1c-uroki.ru \r\nУрок 1 бесплатного курса по 1С 8.2 "Комплексная автоматизация предприятия". Знакомство со всеми механизмами платформы 1С Предприятие 8.2.\r\n\r\nОглавление 1 урока:\r\n01:12 что такое система 1С Предприятие 8.2?\r\n01:31 где скачать платформу 1С Предприятие 8.2\r\n01:49 архитектура 1С:Предприятие 8.2 на логическом уровне\r\n02:00 что такое информационная база?\r\n02:18 что такое конфигурация?\r\n02:40 что такое технологическая платформа 1С Предприятие 8.2?\r\n05:15 архитектура 1С Предприятие 8.2 на физическом уровне;\r\n05:33 файл-серверный вариант работы 1С 8.2;\r\n07:50 файл-серверный вариант работы 1С 8.2 с использованием веб-сервера;\r\n09:00 клиент-серверный вариант работы системы 1С Предприятие 8.2;\r\n10:00 что такое сервер 1С Предприятие 8.2?\r\n11:16 тонкий и толстый клиент платформы 1С Предприятие 8.2;\r\n13:38 знакомство с основными классами объектов в 1C 8.2;\r\n16:00 зачем нужны регистры в системе 1С 8.2?\r\n23:19 запуск конфигурации 1С Предприятия 8.2;\r\n24:48 создание новой информационной базы\r\n29:25 режимы запуска 1С: «1С Предприятие» и «Конфигуратор»;\r\n32:00 знакомство с классом объектов Константы;\r\n32:45 знакомство с классом объектов Справочники;\r\n33:59 создание справочника Сотрудники;\r\n42:44 создание иерархического справочника Контрагенты.\r\n\r\n\r\nСкачать платформу 1С Предприятие 8.2 можно тут:\r\nwww.1c-uroki.ru/articles/download_1C_8.2\r\n\r\nСсылка на 1 урок \r\nwww.1c-uroki.ru/lessons/kurs1C_1/1_urok_kurs_1C_8.2\r\n', '2015-04-27 10:47:28', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2742),
(212, 'https://www.youtube.com/watch?v=uD3n-PH4CKM', 5, 12, '1 урок. Программирование в 1С 8.2. Простой и подробный курс!', 'www.1c-uroki.ru \r\nУрок 1 бесплатного курса по 1С 8.2 "Комплексная автоматизация предприятия". Знакомство со всеми механизмами платформы 1С Предприятие 8.2.\r\n\r\nОглавление 1 урока:\r\n01:12 что такое система 1С Предприятие 8.2?\r\n01:31 где скачать платформу 1С Предприятие 8.2\r\n01:49 архитектура 1С:Предприятие 8.2 на логическом уровне\r\n02:00 что такое информационная база?\r\n02:18 что такое конфигурация?\r\n02:40 что такое технологическая платформа 1С Предприятие 8.2?\r\n05:15 архитектура 1С Предприятие 8.2 на физическом уровне;\r\n05:33 файл-серверный вариант работы 1С 8.2;\r\n07:50 файл-серверный вариант работы 1С 8.2 с использованием веб-сервера;\r\n09:00 клиент-серверный вариант работы системы 1С Предприятие 8.2;\r\n10:00 что такое сервер 1С Предприятие 8.2?\r\n11:16 тонкий и толстый клиент платформы 1С Предприятие 8.2;\r\n13:38 знакомство с основными классами объектов в 1C 8.2;\r\n16:00 зачем нужны регистры в системе 1С 8.2?\r\n23:19 запуск конфигурации 1С Предприятия 8.2;\r\n24:48 создание новой информационной базы\r\n29:25 режимы запуска 1С: «1С Предприятие» и «Конфигуратор»;\r\n32:00 знакомство с классом объектов Константы;\r\n32:45 знакомство с классом объектов Справочники;\r\n33:59 создание справочника Сотрудники;\r\n42:44 создание иерархического справочника Контрагенты.\r\n\r\n\r\nСкачать платформу 1С Предприятие 8.2 можно тут:\r\nwww.1c-uroki.ru/articles/download_1C_8.2\r\n\r\nСсылка на 1 урок \r\nwww.1c-uroki.ru/lessons/kurs1C_1/1_urok_kurs_1C_8.2\r\n', '2015-04-27 10:47:34', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2742);
INSERT INTO `videos` (`id`, `link`, `languageId`, `questions`, `name`, `info`, `added`, `addedById`, `addedByIP`, `updated`, `updatedById`, `isDeleted`, `deleted`, `deletedById`, `duration`) VALUES
(213, 'https://www.youtube.com/watch?v=uD3n-PH4CKM', 5, 12, '1 урок. Программирование в 1С 8.2. Простой и подробный курс!', 'www.1c-uroki.ru \r\nУрок 1 бесплатного курса по 1С 8.2 "Комплексная автоматизация предприятия". Знакомство со всеми механизмами платформы 1С Предприятие 8.2.\r\n\r\nОглавление 1 урока:\r\n01:12 что такое система 1С Предприятие 8.2?\r\n01:31 где скачать платформу 1С Предприятие 8.2\r\n01:49 архитектура 1С:Предприятие 8.2 на логическом уровне\r\n02:00 что такое информационная база?\r\n02:18 что такое конфигурация?\r\n02:40 что такое технологическая платформа 1С Предприятие 8.2?\r\n05:15 архитектура 1С Предприятие 8.2 на физическом уровне;\r\n05:33 файл-серверный вариант работы 1С 8.2;\r\n07:50 файл-серверный вариант работы 1С 8.2 с использованием веб-сервера;\r\n09:00 клиент-серверный вариант работы системы 1С Предприятие 8.2;\r\n10:00 что такое сервер 1С Предприятие 8.2?\r\n11:16 тонкий и толстый клиент платформы 1С Предприятие 8.2;\r\n13:38 знакомство с основными классами объектов в 1C 8.2;\r\n16:00 зачем нужны регистры в системе 1С 8.2?\r\n23:19 запуск конфигурации 1С Предприятия 8.2;\r\n24:48 создание новой информационной базы\r\n29:25 режимы запуска 1С: «1С Предприятие» и «Конфигуратор»;\r\n32:00 знакомство с классом объектов Константы;\r\n32:45 знакомство с классом объектов Справочники;\r\n33:59 создание справочника Сотрудники;\r\n42:44 создание иерархического справочника Контрагенты.\r\n\r\n\r\nСкачать платформу 1С Предприятие 8.2 можно тут:\r\nwww.1c-uroki.ru/articles/download_1C_8.2\r\n\r\nСсылка на 1 урок \r\nwww.1c-uroki.ru/lessons/kurs1C_1/1_urok_kurs_1C_8.2\r\n', '2015-04-27 10:54:18', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2742),
(214, 'https://www.youtube.com/watch?v=uD3n-PH4CKM', 5, 12, '1 урок. Программирование в 1С 8.2. Простой и подробный курс!', 'www.1c-uroki.ru \r\nУрок 1 бесплатного курса по 1С 8.2 "Комплексная автоматизация предприятия". Знакомство со всеми механизмами платформы 1С Предприятие 8.2.\r\n\r\nОглавление 1 урока:\r\n01:12 что такое система 1С Предприятие 8.2?\r\n01:31 где скачать платформу 1С Предприятие 8.2\r\n01:49 архитектура 1С:Предприятие 8.2 на логическом уровне\r\n02:00 что такое информационная база?\r\n02:18 что такое конфигурация?\r\n02:40 что такое технологическая платформа 1С Предприятие 8.2?\r\n05:15 архитектура 1С Предприятие 8.2 на физическом уровне;\r\n05:33 файл-серверный вариант работы 1С 8.2;\r\n07:50 файл-серверный вариант работы 1С 8.2 с использованием веб-сервера;\r\n09:00 клиент-серверный вариант работы системы 1С Предприятие 8.2;\r\n10:00 что такое сервер 1С Предприятие 8.2?\r\n11:16 тонкий и толстый клиент платформы 1С Предприятие 8.2;\r\n13:38 знакомство с основными классами объектов в 1C 8.2;\r\n16:00 зачем нужны регистры в системе 1С 8.2?\r\n23:19 запуск конфигурации 1С Предприятия 8.2;\r\n24:48 создание новой информационной базы\r\n29:25 режимы запуска 1С: «1С Предприятие» и «Конфигуратор»;\r\n32:00 знакомство с классом объектов Константы;\r\n32:45 знакомство с классом объектов Справочники;\r\n33:59 создание справочника Сотрудники;\r\n42:44 создание иерархического справочника Контрагенты.\r\n\r\n\r\nСкачать платформу 1С Предприятие 8.2 можно тут:\r\nwww.1c-uroki.ru/articles/download_1C_8.2\r\n\r\nСсылка на 1 урок \r\nwww.1c-uroki.ru/lessons/kurs1C_1/1_urok_kurs_1C_8.2\r\n', '2015-04-27 10:54:32', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2742),
(215, 'https://www.youtube.com/watch?v=uD3n-PH4CKM', 5, 12, '1 урок. Программирование в 1С 8.2. Простой и подробный курс!', 'www.1c-uroki.ru \r\nУрок 1 бесплатного курса по 1С 8.2 "Комплексная автоматизация предприятия". Знакомство со всеми механизмами платформы 1С Предприятие 8.2.\r\n\r\nОглавление 1 урока:\r\n01:12 что такое система 1С Предприятие 8.2?\r\n01:31 где скачать платформу 1С Предприятие 8.2\r\n01:49 архитектура 1С:Предприятие 8.2 на логическом уровне\r\n02:00 что такое информационная база?\r\n02:18 что такое конфигурация?\r\n02:40 что такое технологическая платформа 1С Предприятие 8.2?\r\n05:15 архитектура 1С Предприятие 8.2 на физическом уровне;\r\n05:33 файл-серверный вариант работы 1С 8.2;\r\n07:50 файл-серверный вариант работы 1С 8.2 с использованием веб-сервера;\r\n09:00 клиент-серверный вариант работы системы 1С Предприятие 8.2;\r\n10:00 что такое сервер 1С Предприятие 8.2?\r\n11:16 тонкий и толстый клиент платформы 1С Предприятие 8.2;\r\n13:38 знакомство с основными классами объектов в 1C 8.2;\r\n16:00 зачем нужны регистры в системе 1С 8.2?\r\n23:19 запуск конфигурации 1С Предприятия 8.2;\r\n24:48 создание новой информационной базы\r\n29:25 режимы запуска 1С: «1С Предприятие» и «Конфигуратор»;\r\n32:00 знакомство с классом объектов Константы;\r\n32:45 знакомство с классом объектов Справочники;\r\n33:59 создание справочника Сотрудники;\r\n42:44 создание иерархического справочника Контрагенты.\r\n\r\n\r\nСкачать платформу 1С Предприятие 8.2 можно тут:\r\nwww.1c-uroki.ru/articles/download_1C_8.2\r\n\r\nСсылка на 1 урок \r\nwww.1c-uroki.ru/lessons/kurs1C_1/1_urok_kurs_1C_8.2\r\n', '2015-04-27 10:57:43', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2742),
(216, 'https://www.youtube.com/watch?v=uD3n-PH4CKM', 5, 12, '1 урок. Программирование в 1С 8.2. Простой и подробный курс!', 'www.1c-uroki.ru \r\nУрок 1 бесплатного курса по 1С 8.2 "Комплексная автоматизация предприятия". Знакомство со всеми механизмами платформы 1С Предприятие 8.2.\r\n\r\nОглавление 1 урока:\r\n01:12 что такое система 1С Предприятие 8.2?\r\n01:31 где скачать платформу 1С Предприятие 8.2\r\n01:49 архитектура 1С:Предприятие 8.2 на логическом уровне\r\n02:00 что такое информационная база?\r\n02:18 что такое конфигурация?\r\n02:40 что такое технологическая платформа 1С Предприятие 8.2?\r\n05:15 архитектура 1С Предприятие 8.2 на физическом уровне;\r\n05:33 файл-серверный вариант работы 1С 8.2;\r\n07:50 файл-серверный вариант работы 1С 8.2 с использованием веб-сервера;\r\n09:00 клиент-серверный вариант работы системы 1С Предприятие 8.2;\r\n10:00 что такое сервер 1С Предприятие 8.2?\r\n11:16 тонкий и толстый клиент платформы 1С Предприятие 8.2;\r\n13:38 знакомство с основными классами объектов в 1C 8.2;\r\n16:00 зачем нужны регистры в системе 1С 8.2?\r\n23:19 запуск конфигурации 1С Предприятия 8.2;\r\n24:48 создание новой информационной базы\r\n29:25 режимы запуска 1С: «1С Предприятие» и «Конфигуратор»;\r\n32:00 знакомство с классом объектов Константы;\r\n32:45 знакомство с классом объектов Справочники;\r\n33:59 создание справочника Сотрудники;\r\n42:44 создание иерархического справочника Контрагенты.\r\n\r\n\r\nСкачать платформу 1С Предприятие 8.2 можно тут:\r\nwww.1c-uroki.ru/articles/download_1C_8.2\r\n\r\nСсылка на 1 урок \r\nwww.1c-uroki.ru/lessons/kurs1C_1/1_urok_kurs_1C_8.2\r\n', '2015-04-27 11:23:30', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2742),
(217, 'https://www.youtube.com/watch?v=uD3n-PH4CKM', 5, 12, '1 урок. Программирование в 1С 8.2. Простой и подробный курс!', 'www.1c-uroki.ru \r\nУрок 1 бесплатного курса по 1С 8.2 "Комплексная автоматизация предприятия". Знакомство со всеми механизмами платформы 1С Предприятие 8.2.\r\n\r\nОглавление 1 урока:\r\n01:12 что такое система 1С Предприятие 8.2?\r\n01:31 где скачать платформу 1С Предприятие 8.2\r\n01:49 архитектура 1С:Предприятие 8.2 на логическом уровне\r\n02:00 что такое информационная база?\r\n02:18 что такое конфигурация?\r\n02:40 что такое технологическая платформа 1С Предприятие 8.2?\r\n05:15 архитектура 1С Предприятие 8.2 на физическом уровне;\r\n05:33 файл-серверный вариант работы 1С 8.2;\r\n07:50 файл-серверный вариант работы 1С 8.2 с использованием веб-сервера;\r\n09:00 клиент-серверный вариант работы системы 1С Предприятие 8.2;\r\n10:00 что такое сервер 1С Предприятие 8.2?\r\n11:16 тонкий и толстый клиент платформы 1С Предприятие 8.2;\r\n13:38 знакомство с основными классами объектов в 1C 8.2;\r\n16:00 зачем нужны регистры в системе 1С 8.2?\r\n23:19 запуск конфигурации 1С Предприятия 8.2;\r\n24:48 создание новой информационной базы\r\n29:25 режимы запуска 1С: «1С Предприятие» и «Конфигуратор»;\r\n32:00 знакомство с классом объектов Константы;\r\n32:45 знакомство с классом объектов Справочники;\r\n33:59 создание справочника Сотрудники;\r\n42:44 создание иерархического справочника Контрагенты.\r\n\r\n\r\nСкачать платформу 1С Предприятие 8.2 можно тут:\r\nwww.1c-uroki.ru/articles/download_1C_8.2\r\n\r\nСсылка на 1 урок \r\nwww.1c-uroki.ru/lessons/kurs1C_1/1_urok_kurs_1C_8.2\r\n', '2015-04-27 11:24:29', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2742),
(218, 'https://www.youtube.com/watch?v=uD3n-PH4CKM', 5, 12, '1 урок. Программирование в 1С 8.2. Простой и подробный курс!', 'www.1c-uroki.ru \r\nУрок 1 бесплатного курса по 1С 8.2 "Комплексная автоматизация предприятия". Знакомство со всеми механизмами платформы 1С Предприятие 8.2.\r\n\r\nОглавление 1 урока:\r\n01:12 что такое система 1С Предприятие 8.2?\r\n01:31 где скачать платформу 1С Предприятие 8.2\r\n01:49 архитектура 1С:Предприятие 8.2 на логическом уровне\r\n02:00 что такое информационная база?\r\n02:18 что такое конфигурация?\r\n02:40 что такое технологическая платформа 1С Предприятие 8.2?\r\n05:15 архитектура 1С Предприятие 8.2 на физическом уровне;\r\n05:33 файл-серверный вариант работы 1С 8.2;\r\n07:50 файл-серверный вариант работы 1С 8.2 с использованием веб-сервера;\r\n09:00 клиент-серверный вариант работы системы 1С Предприятие 8.2;\r\n10:00 что такое сервер 1С Предприятие 8.2?\r\n11:16 тонкий и толстый клиент платформы 1С Предприятие 8.2;\r\n13:38 знакомство с основными классами объектов в 1C 8.2;\r\n16:00 зачем нужны регистры в системе 1С 8.2?\r\n23:19 запуск конфигурации 1С Предприятия 8.2;\r\n24:48 создание новой информационной базы\r\n29:25 режимы запуска 1С: «1С Предприятие» и «Конфигуратор»;\r\n32:00 знакомство с классом объектов Константы;\r\n32:45 знакомство с классом объектов Справочники;\r\n33:59 создание справочника Сотрудники;\r\n42:44 создание иерархического справочника Контрагенты.\r\n\r\n\r\nСкачать платформу 1С Предприятие 8.2 можно тут:\r\nwww.1c-uroki.ru/articles/download_1C_8.2\r\n\r\nСсылка на 1 урок \r\nwww.1c-uroki.ru/lessons/kurs1C_1/1_urok_kurs_1C_8.2\r\n', '2015-04-27 11:24:50', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2742),
(219, 'https://www.youtube.com/watch?v=EAlqswPMb5M', 5, 2, 'AHMET KAYA EN SEVİLEN ŞARKILARI', 'https://www.facebook.com/aktuelvideolar\r\n\r\nAhmet   Kaya - Ağladıkça \r\nAhmet   Kaya - Birazdan Kudurur Deniz\r\nAhmet   Kaya - Giderim\r\nAhmet   Kaya - Herkes Kendi işine\r\nAhmet   Kaya - Kum Gibi\r\nAhmet   Kaya - Nereden Bileceksiniz\r\nAhmet   Kaya - Penceresiz Kaldım Anne\r\nAhmet   Kaya - Söyle\r\nAhmet   Kaya- Hani Benim Gençligim\r\nAhmet   Kaya -Şafak Türküsü\r\n JOIN QUIZGROUP PARTNER PROGRAM: http://join.quizgroup.com/?ref=91605', '2015-04-30 11:55:53', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2797),
(220, 'https://www.youtube.com/watch?v=QQPJYnr48yU', 5, 4, 'Marilyn Manson - Coma White', 'Music video by Marilyn Manson performing Coma White. (C) 1999 Nothing/Interscope Records', '2015-05-18 22:23:37', 1, '127.0.0.1', '2015-10-02 08:02:53', 1, 0, '0000-00-00 00:00:00', NULL, 263),
(221, 'https://www.youtube.com/watch?v=r74c7C0FEhQ', 5, 4, 'Семён Слепаков: Рэд Хот Чили Пепперс', 'Песня из Comedy Club №334 (http://THT.ru/baea52e6f0)\r\n\r\nТекст песни:\r\nА у нас в деревне все слушают шансон,\r\nСлушают Михайлова, Лепса и Трофима,\r\nНу а я считаю, что всё это отстой,\r\nЯ поклонник музыки другой.\r\n\r\nЛюблю я Рэд Хот Чили Пепперс\r\nРэд-Хот-Чили-Пепперс!\r\nРэд Хот Чили Пепперс\r\nОчень я люблю.\r\n\r\nЯ работаю с людьми, я их хороню,\r\nА потом с коллегами мы идём бухать,\r\nА потом на кладбище песни мы поём,\r\nНаши вкусы сходятся во всём\r\n\r\nПомимо Рэд Хот Чилли Пепперс,\r\nРэд-Хот-Чилли-Пепперс!\r\nРэд Хот Чилли Пепперс\r\nЯ пою один.\r\n\r\nКак-то раз друзья меня ударили лопатой,\r\nЯ очнулся и пошёл в ресторан «Весна»\r\nТам играл какой-то чёрт песню про тюрьму\r\n- Слышишь, чёрт! - базарю я ему\r\n\r\nТы сбацай Помимо Рэд Хот Чилли Пепперс,\r\nВот тебе задачка!\r\nРэд Хот Чилли Пепперс,\r\nВот тебе полтос.\r\n\r\nЧёрт сказал: Не обессудь, не слыхал таких,\r\nЗнаю я Михайлова, Лепса и Трофима,\r\nА про этих, как их там, слышу в первый раз,\r\nВидно не высок пока их класс\r\n\r\nЧо там за Хот Бед Чилли Випонс,\r\nЧо за коллективчик?\r\nЧо за Мэд Хэд Шпилли Биверс,\r\nЧо за молодняк?\r\n\r\nВозмущаться начали мужики вокруг,\r\nПочему остановилась песня про тюрьму,\r\nИ чо за хрен с лопатою, торчащей из спины,\r\nСбил нас с ностальгической волны\r\n\r\nИ чо за незнакомое английское названье?\r\nЧо за неприятные, обидные слова?\r\n\r\nВыхватил лопату я и на них пошёл\r\nВовремя напомнили они мне про неё\r\nГоворю им я таких слов не потерплю\r\nЯ сейчас лопатой отрублю\r\n\r\nВам ваши Рэд Хот Чилли Пепперс\r\nВсем поочередно\r\nВаши Чилли Пепперс нахер отрублю!\r\n\r\nЗакричали мужики: Шутим мы, братан!\r\nПофиг нам на творчество Лепса и Трофима\r\nСтас Михалов лишь среди баб авторитет,\r\nА у нас другой приоритет\r\n\r\nМы любим Рэд Хот Чилли Пепперс,\r\nМамою клянёмся,\r\nЛюбим Рэд Хот Чилли Пепперс,\r\nЗуб тебе даём!\r\n\r\nМы любим сингл их великий\r\nКалифорникейшн,\r\nЛюбим Тони Кидиса\r\nИ их бассиста Фли!\r\n\r\nУважаемая группа Рэд Хот Чилли Пепперс,\r\nВсе у нас теперь в деревне любят только вас,\r\nВаши песни с мужиками часто мы поём,\r\nПросят мужики лишь об одном:\r\n\r\nМы просим вас, родные Рэд Хот Чилли Пепперс,\r\nНапишите хоть одну вы песню про тюрьму!..', '2015-05-18 22:25:22', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 190),
(222, 'https://www.youtube.com/watch?v=5TZyrJf1b8k', 5, 4, 'Zuhair Murad Haute Couture Fall/Winter 2014-2015, COMPLETE SHOW', 'The complete (untruncated and untagged) video of the beautiful Zuhair Murad''s Haute Couture Fall/Winter 2014-2015 fashion show, part of the Paris Haute Couture Fashion Week.\r\nThis is the part 1/2. For the "bride" and the finale walk, see part 2/2\r\nhttps://www.youtube.com/watch?v=6OJvxsmGCko', '2015-05-18 22:28:51', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 840),
(223, 'https://www.youtube.com/watch?v=Hyy8i45oh-c', 5, 2, 'Семён Слепаков: Мне бы бабу', 'Песня из Comedy Club №272 (http://THT.ru/d577c2272a)\r\n\r\nТекст песни:\r\nГде бы взять мне бабу, бабу молодую,\r\nС бескорыстным сердцем, чуткою душой,\r\nТонким интеллектом, скромною натурой,\r\nДобрыми глазами, да жопушкой большой?\r\n\r\nЧтобы секс любила, но не очень долгий -\r\nНу, минут так восемь, да и пять, порой.\r\nДа чтоб ей три минуты вечностью казались,\r\nДа и двух хватало бабе бы с лихвой!\r\n\r\nЧтобы и минута ей была бы в радость,\r\nЧтоб срывал бы крышу и секундный акт...\r\nИ, чтоб не знала баба про восьмое марта,\r\nЧтоб от бабы скрыли в детстве этот факт.\r\n\r\nЧтоб была у бабы мама космонавтом,\r\nЧто бы раз в полгода приходил сигнал.\r\nЧтоб у бабы папа был бы олигархом,\r\nВ Лондоне скрывался, но деньги присылал.\r\n\r\nЧтоб были у ней груди пятого размера,\r\nЧтоб всегда ей было девятнадцать лет.\r\nИ телефон у бабы чтобы был особый,\r\nЧтоб я мог звонить ей, а она мне нет.\r\n\r\nА еще чтоб к бабе пульт бы прилагался,\r\nЧтобы громкость бабы мог я убавлять,\r\nИ когда приходит баба от подруги,\r\nЧтоб рассказ я бабий мог перемотать.\r\n\r\nЧто бы парковалась баба как не баба,\r\nА как очень старый, опытный таксист.\r\nЧтоб была та баба родом из-за МКАДа,\r\nЧтобы благодарна мне была всю жизнь.\r\n\r\nЧто бы поощряла частые измены\r\nИ презервативы мне клала в пиджак,\r\nИ чтобы не любила крупные размеры,\r\nИли мне хотя бы говорила так.\r\n\r\nОх, где бы взять Семёну бабу молодую,\r\nЧтоб его любила и всегда ждала,\r\nЧтоб иметь бы бабу, именно, такую,\r\nИ чтоб об этой бабе не узнала бы жена!\r\n\r\nЧтоб иметь бы бабу, именно, такую,\r\nИ чтоб об этой бабе не узнала бы жена!', '2015-05-18 22:37:41', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 183),
(224, 'https://www.youtube.com/watch?v=Hyy8i45oh-c', 5, 2, 'Семён Слепаков: Мне бы бабу', 'Песня из Comedy Club №272 (http://THT.ru/d577c2272a)\r\n\r\nТекст песни:\r\nГде бы взять мне бабу, бабу молодую,\r\nС бескорыстным сердцем, чуткою душой,\r\nТонким интеллектом, скромною натурой,\r\nДобрыми глазами, да жопушкой большой?\r\n\r\nЧтобы секс любила, но не очень долгий -\r\nНу, минут так восемь, да и пять, порой.\r\nДа чтоб ей три минуты вечностью казались,\r\nДа и двух хватало бабе бы с лихвой!\r\n\r\nЧтобы и минута ей была бы в радость,\r\nЧтоб срывал бы крышу и секундный акт...\r\nИ, чтоб не знала баба про восьмое марта,\r\nЧтоб от бабы скрыли в детстве этот факт.\r\n\r\nЧтоб была у бабы мама космонавтом,\r\nЧто бы раз в полгода приходил сигнал.\r\nЧтоб у бабы папа был бы олигархом,\r\nВ Лондоне скрывался, но деньги присылал.\r\n\r\nЧтоб были у ней груди пятого размера,\r\nЧтоб всегда ей было девятнадцать лет.\r\nИ телефон у бабы чтобы был особый,\r\nЧтоб я мог звонить ей, а она мне нет.\r\n\r\nА еще чтоб к бабе пульт бы прилагался,\r\nЧтобы громкость бабы мог я убавлять,\r\nИ когда приходит баба от подруги,\r\nЧтоб рассказ я бабий мог перемотать.\r\n\r\nЧто бы парковалась баба как не баба,\r\nА как очень старый, опытный таксист.\r\nЧтоб была та баба родом из-за МКАДа,\r\nЧтобы благодарна мне была всю жизнь.\r\n\r\nЧто бы поощряла частые измены\r\nИ презервативы мне клала в пиджак,\r\nИ чтобы не любила крупные размеры,\r\nИли мне хотя бы говорила так.\r\n\r\nОх, где бы взять Семёну бабу молодую,\r\nЧтоб его любила и всегда ждала,\r\nЧтоб иметь бы бабу, именно, такую,\r\nИ чтоб об этой бабе не узнала бы жена!\r\n\r\nЧтоб иметь бы бабу, именно, такую,\r\nИ чтоб об этой бабе не узнала бы жена!', '2015-05-18 22:38:58', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 183),
(225, 'https://www.youtube.com/watch?v=uEDgf_ezWFw', 5, 1, 'Dior Haute Couture Spring/Summer 2015 : Making Of A Dress', 'Christian Dior Haute Couture Spring/Summer 2015', '2015-05-18 23:05:02', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 268),
(226, 'https://www.youtube.com/watch?v=_70DqRgm8O0', 5, 2, 'İlhan Şeşen-Sarılınca sana', 'wwwwdd', '2015-05-19 10:52:38', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 238),
(227, 'https://www.youtube.com/watch?v=_70DqRgm8O0', 5, 2, 'İlhan Şeşen-Sarılınca sana', 'wwwwdd', '2015-05-19 10:53:49', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 238),
(228, 'https://www.youtube.com/watch?v=4RnjWLVyMps', 5, 2, 'Joe Cocker "The Letter" in live 1970 (MAD DOGS & ENGLISHMEN)', 'send me your e-mail, and I send this video\r\n JOIN QUIZGROUP PARTNER PROGRAM: http://join.quizgroup.com/?ref=65996', '2015-05-20 11:13:25', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 196),
(229, 'https://www.youtube.com/watch?v=DA3NBgktpbw', 5, 2, 'KİBARİYE & TARKAN - Gülümse Kaderine', 'iTunes''dan İndir / Download on iTunes\r\nhttp://tinyurl.com/tarkan-on-itunes\r\n\r\n2007 - KİBARİYE & TARKAN - Gülümse Kaderine - Gülümse Kaderine', '2015-05-20 11:31:01', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 279),
(230, 'https://www.youtube.com/watch?v=GCygLVz4Rjg', 5, 2, 'Григорий Лепс - Танго разбитых сердец (Парус. Live)', 'В видео версию концерта Григория Лепса «Парус. Live» вошли не только песни Владимира Высоцкого, но хорошо знакомые, полюбившиеся песни из репертуара артиста. Предлагаем Вам одну из них.\r\nПространство большого концертного зала, сдержанно подпевающие зрители, торжественная чёрно-белая гамма  формируют атмосферу этого концерта, настраивающего на вдумчивое и философское настроение, духовную работу.\r\nТак же на DVD представлены 8 клипов и более ста фотографий Григория Лепса.\r\n\r\nКупить "Парус. Live" на Ozon http://bit.ly/fVBHz8\r\nBuy Leps on iTunes http://bit.ly/aDKegL', '2015-05-27 11:09:03', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 228),
(231, 'https://www.youtube.com/watch?v=oOmfMtHY7_U', 5, 2, 'Evanescence - Fallen', '(00:00 - 1. Going Under) \r\n(03:33 - 2. Bring Me To Life) \r\n(07:31 - 3. Everybody''s fool) \r\n(10:46 - 4. My Immortal) \r\n(15:11 - 5. Haunted) \r\n(18:16 - 6. Tourniquet) \r\n(22:49 - 7. Imaginary) \r\n(27:06 - 8. Taking Over Me) \r\n(30:57 - 9. Hello) \r\n(34:31 - 10. My Last Breath) \r\n(38:37 - 11. Whisper) \r\nThanks Marshalamax\r\n\r\nFallen is the first full-length album by Evanescence, and their first album to achieve widespread release around the world.\r\n\r\nFallen was the eighth best-selling album in the U.S. in 2004, with about 2.61 million copies sold that year. The album was recorded at Ocean Studios (Burbank) and Conway Recording Studios (Hollywood) both in California. The album reached 7x Platinium status on 24th June 2008 in the U.S.\r\n\r\nAmy Lee stated:\r\n"We''ve all fallen, but at the same time we''re not broken. There is the hint that we are going to get up again."\r\n\r\n\r\nThis is one of the reasons that Fallen is called what it is. Ben Moody in an interview said that Fallen was made to let people know that they aren''t alone when they feel alone or feel pain.\r\n\r\nFallen has sold well over 15 million copies worldwide and about 5 and a half million in the US alone. The album debuted at #7 and has not fallen below #39 to date on the Billboard Album Chart. The album stayed in the top 10 for 43 non-consecutive weeks. Released March 4th, 2003.\r\n\r\nThe CD was re-released in January 2004 with the band version of My Immortal. Fallen was Grammy nominated for Album of the Year in 2004. John LeCompt and Rocky Gray both had writing credits on Fallen before they officially joined the band. John has credits on Taking Over Me and Rocky has credits for writing the original version of Tourniquet (originally called My Tourniquet) for his band, Soul Embraced. The latest album features the 12th song My Immortal (Band Version) but does not state this song on the tracklisting.', '2015-05-27 11:11:33', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 2641),
(232, 'https://www.youtube.com/watch?v=pW4qU4aWrDg', 5, 2, 'Hilary Duff - Sparks', 'Hilary Duff “Sparks” Available Now!\r\n\r\niTunes: http://smarturl.it/iSparks?iqid=yt\r\nAmazon: http://smarturl.it/aSparks?iqid=yt\r\nGoogle Play: http://smarturl.it/gSparks?iqid=yt\r\nSpotify: http://smarturl.it/sSparks?iqid=yt\r\n\r\nPre-order Hilary’s new album: http://myplay.me/1e35', '2015-05-27 11:13:20', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 235),
(233, 'https://www.youtube.com/watch?v=8mkwmNPmPmk', 5, 2, 'Younger: A Sneak Peek and Preview of Hilary''s New Single SPARKS', 'Hilary''s New Single "SPARKS" Out April 7th. Shazam the sneak peek now for an exclusive reveal of the cover art for "SPARKS"!\r\n\r\nBe the first to hear a preview of Hilary Duff’s new single, “Sparks,” and sneak a peek at her new series, Younger, from the creator of Sex and the City. Younger premieres Tuesday March 31 at 10/9c on TV Land!\r\n\r\nFollow Hilary Duff!\r\nhttp://www.hilaryduff.com\r\nFacebook: https://www.facebook.com/HilaryDuff\r\nTwitter: https://twitter.com/HilaryDuff \r\nInstagram: http://instagram.com/HilaryDuff\r\n\r\nFollow Younger!\r\nTwitter: https://twitter.com/youngertv\r\nFacebook: https://www.facebook.com/youngertv\r\nInstagram: https://instagram.com/youngertv/\r\nPinterest: https://www.pinterest.com/youngertv/\r\nTumblr: http://youngertv.tumblr.com/', '2015-05-27 11:15:56', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 61),
(234, 'https://www.youtube.com/watch?v=6ie6-s6EdH8', 5, 2, 'Sezen Aksu - En Duygusal 22 Şarkı', 'Sezen Aksu''nun en popüler, en çok dinlenen, en duygusal yirmi iki şarkısı.\r\n\r\n1) Adı Bende Saklı\r\n2) Ben Sende Tutuklu Kaldım\r\n3) El Gibi\r\n4) Farkındayım\r\n5) Geri Dön\r\n6) Gidiyorum\r\n7) Gülümse\r\n8) Her şeyi Yak\r\n9) İstanbul İstanbul Olalı\r\n10) Kaybolan Yıllar\r\n11) Keskin Bıçak\r\n12) Kolay Olmayacak\r\n13) Pişman Olduğun Zaman\r\n14) Sarı Odalarda\r\n15) Sen Ağlama\r\n16) Seni Kimler Aldı\r\n17) Sorma\r\n18) Tanrı İstemezse\r\n19) Tutsak\r\n20) Tükeneceğiz\r\n21) Unuttun mu Beni\r\n22) Vay\r\n JOIN QUIZGROUP PARTNER PROGRAM: http://join.quizgroup.com/?ref=207247', '2015-05-27 15:56:50', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 6292),
(235, 'https://www.youtube.com/watch?v=6ie6-s6EdH8', 5, 2, 'Sezen Aksu - En Duygusal 22 Şarkı', 'Sezen Aksu''nun en popüler, en çok dinlenen, en duygusal yirmi iki şarkısı.\r\n\r\n1) Adı Bende Saklı\r\n2) Ben Sende Tutuklu Kaldım\r\n3) El Gibi\r\n4) Farkındayım\r\n5) Geri Dön\r\n6) Gidiyorum\r\n7) Gülümse\r\n8) Her şeyi Yak\r\n9) İstanbul İstanbul Olalı\r\n10) Kaybolan Yıllar\r\n11) Keskin Bıçak\r\n12) Kolay Olmayacak\r\n13) Pişman Olduğun Zaman\r\n14) Sarı Odalarda\r\n15) Sen Ağlama\r\n16) Seni Kimler Aldı\r\n17) Sorma\r\n18) Tanrı İstemezse\r\n19) Tutsak\r\n20) Tükeneceğiz\r\n21) Unuttun mu Beni\r\n22) Vay\r\n JOIN QUIZGROUP PARTNER PROGRAM: http://join.quizgroup.com/?ref=207247', '2015-05-27 15:57:47', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 6292),
(236, 'https://www.youtube.com/watch?v=0JObRDWJ_Z8', 5, 2, 'Ebru Gündeş Demir attım yalnızlıga', 'ee', '2015-06-17 08:45:57', 1, '127.0.0.1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 302),
(238, 'https://www.youtube.com/watch?v=9j5p9qtQZsM&index=3&list=PLv8w5AogPd5UhcBhIuK5Bg7zTxUkxWmU7', 5, 2, 'HALİL SEZAİ-GİT', '', '2015-09-22 07:45:04', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 337),
(239, 'https://www.youtube.com/watch?v=Q52x94w_viA', 5, 12, 'Aşkın Nur Yengi - Susma (1990)', 'Söz : Sezen Aksu\r\nMüzik : Christos Nikolopoulos\r\nDüzenleme : Onno Tunç\r\n\r\nAnladım gidiyorsun daha öncekiler gibi\r\nHiç olmazsa son bir defa öp\r\nBu kadar zor mu "Seni sevdim bir zamanlar." demek\r\nÖyle zor ki yeniden sevmek\r\n\r\nYalnızlık eski bir ezber\r\nAyrılık alışkanlık\r\nSensizlik bana dost, bana eş\r\nBu kadar mağrur olma\r\nİnan sen olmasan bile\r\nHayat devam eder, doğar güneş\r\n\r\nSusma veda ederken\r\nBiraz gül, bir şey söyle giderken\r\nGitme, hemen gitme kal\r\nBiraz dur, daha erken...', '2015-09-22 13:06:40', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 325),
(240, 'https://www.youtube.com/watch?v=6ie6-s6EdH8', 5, 2, 'Sezen Aksu - En Duygusal 22 Şarkı', 'Sezen Aksu''nun en popüler, en çok dinlenen, en duygusal yirmi iki şarkısı.\r\n\r\n00:00  - Vay Yine mi Keder\r\n04:00 - Adı Bende Saklı\r\n07:45 - Ben Sende Tutuklu Kaldım\r\n12:13 - El Gibi\r\n16:33 - Farkındayım\r\n21:36 - Geri dön\r\n26:00  - Gidiyorum Bütün Aşklar Yüreğimde\r\n30:50 - Gülümse \r\n35:42 - Her Şeyi Yak\r\n40:53 - İstanbul İstanbul Olalı\r\n46:42 - Kaybolan Yıllar\r\n50:02 - Keskin Bıçak \r\n55:27 - Kolay Olmayacak \r\n1:00:20 - Pişman Olduğun Zaman \r\n1:04:35 - Sarı Odalar\r\n1:10:24 - Sen Ağlama \r\n1:16:14-  Seni Kimler Aldı \r\n1:19:43 - Sorma \r\n1:24:35 - Tanrı İstemezse \r\n1:29:56 - Tutsak \r\n1:36:15 - Tükeneceğiz \r\n1:40:40 - Unuttun mu Beni', '2015-09-28 19:07:21', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 6292),
(241, 'https://www.youtube.com/watch?v=GqRMIupK4Mc', 5, 8, 'Madonna - Get Together2', 'Lyrics:\r\n\r\nIt''s all an illusion\r\nThere''s too much confusion\r\nIt''s all an illusion\r\nThere''s too much confusion, confusion, confusion,...\r\n\r\nDown, down, down in your heart\r\nFind, find, find the secret\r\nTurn, turn, turn your head around\r\nBaby we can do it, we can do it all right\r\n\r\nDo you believe in love at first sight\r\nIt''s an illusion, I don''t care\r\nDo you believe I can make you feel better\r\nToo much confusion, come on over here\r\n\r\nCan we get together\r\nI really, I really wanna be with you\r\nCome on, check it out with me\r\nI hope you, I hope you feel the same way too\r\n\r\nI searched, I searched, I searched my whole life\r\nTo find, to find, to find the secret\r\nAnd all I did was open up my eyes\r\nBaby we can do it, we can do it all right\r\n\r\nDo you believe that we can change the future\r\nDo you believe I can make you feel better\r\n\r\nCan we get together\r\nI really, I really wanna be with you\r\nCome on, check it out with me\r\nI hope you, I hope you feel the same way too\r\nCan we get together\r\nI really, I really wanna be with you\r\nCome on, check it out with me\r\nI hope you, I hope you feel the same way too\r\n\r\nIt''s all an illusion\r\nThere''s too much confusion\r\nI''ll make you feel better\r\nIf it''s bitter at the start, then it''s sweeter in the end\r\n\r\nDo you believe in love at first sight\r\nIt''s an illusion, I don''t care\r\nDo you believe I can make you feel better\r\nToo much confusion, come on over here\r\n\r\nCan we get together\r\nI really, I really wanna be with you\r\nCome on, check it out with me\r\nI hope you, I hope you feel the same way too\r\nCan we get together\r\nI really wanna be with you\r\nCome on, check it out with me\r\nI hope you feel the same way too\r\n\r\nIt''s all an illusion\r\nThere''s too much confusion\r\nI''ll make you feel better\r\nIf it''s bitter at the start, then it''s sweeter in the end', '2015-10-16 17:48:44', 1, '::1', '2015-10-16 17:52:33', 1, 1, '2015-10-21 12:38:18', 1, 330),
(242, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Madonna - Like It Or Not', 'Lyrics:\r\n\r\nYou can call me a sinner\r\nAnd you can call me a saint\r\nCelebrate me for who I am\r\nDislike me for what I ain''t\r\n\r\nPut me up on a pedestal\r\nOr drag me down in the dirt\r\nSticks and stones will break my bones\r\nBut your names will never hurt\r\n\r\nI''ll be the garden, you''ll be the snake\r\nAll of my fruit is yours to take\r\nBetter the devil that you know\r\nYour love for me will grow\r\nBecause\r\n\r\nThis is who I am\r\nYou can like it or not\r\nYou can love me or leave me\r\nCause I''m never gonna stop, no no\r\n\r\nCleopatra had her way\r\nMata Hari too\r\nWhether they were good or bad\r\nIs strictly up to you\r\n\r\nLife is a paradox\r\nAnd it doesn''t make much sense\r\nCan''t have femme without the fatale\r\nPlease don''t take offense\r\n\r\nDon''t let the fruit rot under the vine\r\nFill up your cup and let''s drink the wine\r\nBetter the devil that you know\r\nYour love for me will grow\r\nBecause\r\n\r\nThis is who I am\r\nYou can like it or not\r\nYou can love me or leave me\r\nCause I''m never gonna stop, no no, you know\r\nThis is who I am\r\nYou can like it or not\r\nYou can love me or leave me\r\nCause I''m never gonna stop, no no, you know\r\n\r\nNo no, you know\r\nNo no, you know\r\nNo no, you know\r\nNo no, you know\r\n\r\nI''ll be the garden, you''ll be the snake\r\nAll of my fruit is yours to take\r\nBetter the devil that you know\r\nYour love for me will grow\r\nBecause\r\n\r\nThis is who I am\r\nYou can like it or not\r\nYou can love me or leave me\r\nCause I''m never gonna stop, no no, you know\r\nThis is who I am\r\nYou can like it or not\r\nYou can love me or leave me\r\nCause I''m never gonna stop, no no, you know\r\n\r\nNo no, you know\r\nNo no, you know\r\nNo no, you know\r\nNo no, you know', '2015-10-20 14:31:48', 1, '::1', '0000-00-00 00:00:00', NULL, 1, '2015-10-21 12:38:14', 1, 289),
(243, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 12:37:53', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(244, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 12:38:29', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(245, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 12:42:59', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(246, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 12:43:59', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(247, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 12:44:35', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(248, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:05:23', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(249, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:08:57', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 0),
(250, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:09:29', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(251, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:10:47', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(252, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:11:46', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(253, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:15:15', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(254, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:29:34', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(255, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:29:53', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(256, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:30:23', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(259, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:40:57', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(260, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:42:44', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(261, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:43:44', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(262, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:44:11', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(263, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 13:45:13', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(282, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 14:47:41', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(283, 'https://www.youtube.com/watch?v=hLcLckQ51Fo', 5, 2, 'Music', 'Madonna is best', '2015-10-21 14:49:32', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 289),
(287, 'https://www.youtube.com/watch?v=I3TQ6qJCIXA', 19, 2, 'Music', 'melumat2', '2015-10-22 08:42:00', 1, '::1', '2015-10-23 19:59:14', 1, 0, '0000-00-00 00:00:00', NULL, 7192),
(288, 'https://www.youtube.com/watch?v=qrjQIQ7dRmk', 19, 2, 'Music', 'melumat1', '2015-10-22 08:44:50', 1, '::1', '2015-10-23 14:47:14', 1, 0, '0000-00-00 00:00:00', NULL, 199),
(289, 'https://www.youtube.com/watch?v=I3TQ6qJCIXA', 5, 2, 'Joe Cocker Greatest Hits (Full Album) - The Best Of Joe Cocker', 'melumat2', '2015-10-22 08:44:51', 1, '::1', '2015-10-23 14:47:14', 1, 0, '0000-00-00 00:00:00', NULL, 7192),
(290, 'https://www.youtube.com/watch?v=qrjQIQ7dRmk', 19, 2, 'Music', 'melumat1', '2015-10-22 08:50:05', 1, '::1', '2015-10-23 14:56:43', 1, 0, '0000-00-00 00:00:00', NULL, 199),
(291, 'https://www.youtube.com/watch?v=I3TQ6qJCIXA', 5, 2, 'Joe Cocker Greatest Hits (Full Album) - The Best Of Joe Cocker', 'melumat2', '2015-10-22 08:50:06', 1, '::1', '2015-10-23 15:13:12', 1, 0, '0000-00-00 00:00:00', NULL, 7192),
(292, 'https://www.youtube.com/watch?v=qrjQIQ7dRmk', 5, 1, 'Derbi Nedir?', 'Futbol zaten heyecan, adrenalin. Peki ya derbi bunun kaç misli? \nhttps://www.misli.com/ ile bilmeyen kalmasın.', '2015-10-22 08:51:38', 1, '::1', '2015-10-23 14:56:43', 1, 0, '0000-00-00 00:00:00', NULL, 199),
(293, 'https://www.youtube.com/watch?v=I3TQ6qJCIXA', 5, 2, 'Joe Cocker Greatest Hits (Full Album) - The Best Of Joe Cocker', 'Joe Cocker Greatest Hits \nFacebook : https://www.facebook.com/thetoptensmusic\nBest Songs Of Joe Cocker', '2015-10-22 08:51:39', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 7192),
(294, 'https://www.youtube.com/watch?v=qrjQIQ7dRmk', 5, 1, 'Derbi Nedir?', 'Futbol zaten heyecan, adrenalin. Peki ya derbi bunun kaç misli? \nhttps://www.misli.com/ ile bilmeyen kalmasın.', '2015-10-22 08:54:25', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 199),
(295, 'https://www.youtube.com/watch?v=I3TQ6qJCIXA', 5, 2, 'Joe Cocker Greatest Hits (Full Album) - The Best Of Joe Cocker', 'Joe Cocker Greatest Hits \nFacebook : https://www.facebook.com/thetoptensmusic\nBest Songs Of Joe Cocker', '2015-10-22 08:54:27', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 7192),
(296, 'https://www.youtube.com/watch?v=qrjQIQ7dRmk', 5, 1, 'Derbi Nedir?', 'Futbol zaten heyecan, adrenalin. Peki ya derbi bunun kaç misli? \nhttps://www.misli.com/ ile bilmeyen kalmasın.', '2015-10-22 14:53:33', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 199),
(297, 'https://www.youtube.com/watch?v=I3TQ6qJCIXA', 5, 2, 'Joe Cocker Greatest Hits (Full Album) - The Best Of Joe Cocker', 'Joe Cocker Greatest Hits \nFacebook : https://www.facebook.com/thetoptensmusic\nBest Songs Of Joe Cocker', '2015-10-22 14:53:34', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 7192),
(298, 'https://www.youtube.com/watch?v=qrjQIQ7dRmk', 5, 1, 'Derbi Nedir?', 'Futbol zaten heyecan, adrenalin. Peki ya derbi bunun kaç misli? \nhttps://www.misli.com/ ile bilmeyen kalmasın.', '2015-10-22 14:55:35', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 199),
(299, 'https://www.youtube.com/watch?v=I3TQ6qJCIXA', 5, 2, 'Joe Cocker Greatest Hits (Full Album) - The Best Of Joe Cocker', 'Joe Cocker Greatest Hits \nFacebook : https://www.facebook.com/thetoptensmusic\nBest Songs Of Joe Cocker', '2015-10-22 14:55:37', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 7192),
(300, 'https://www.youtube.com/watch?v=qrjQIQ7dRmk', 5, 1, 'Derbi Nedir?', 'Futbol zaten heyecan, adrenalin. Peki ya derbi bunun kaç misli? \nhttps://www.misli.com/ ile bilmeyen kalmasın.', '2015-10-23 19:59:21', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 199),
(301, 'https://www.youtube.com/watch?v=I3TQ6qJCIXA', 5, 2, 'Joe Cocker Greatest Hits (Full Album) - The Best Of Joe Cocker', 'Joe Cocker Greatest Hits \nFacebook : https://www.facebook.com/thetoptensmusic\nBest Songs Of Joe Cocker', '2015-10-23 19:59:23', 1, '::1', '0000-00-00 00:00:00', NULL, 0, '0000-00-00 00:00:00', NULL, 7192);

-- --------------------------------------------------------

--
-- Table structure for table `videotags`
--

CREATE TABLE IF NOT EXISTS `videotags` (
  `tagId` int(11) NOT NULL,
  `videoId` int(11) NOT NULL,
  PRIMARY KEY (`tagId`,`videoId`),
  KEY `videoId` (`videoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `videotags`
--

INSERT INTO `videotags` (`tagId`, `videoId`) VALUES
(1, 0),
(1, 1),
(2, 1),
(3, 204),
(4, 204),
(3, 205),
(4, 205),
(3, 206),
(4, 206),
(9, 206),
(10, 206),
(11, 207),
(12, 208),
(87, 208),
(13, 209),
(14, 210),
(15, 211),
(16, 212),
(17, 213),
(18, 214),
(19, 215),
(20, 216),
(21, 217),
(22, 218),
(23, 219),
(88, 220),
(26, 222),
(27, 223),
(28, 224),
(2, 225),
(30, 226),
(30, 227),
(31, 228),
(32, 229),
(33, 230),
(34, 230),
(35, 230),
(36, 230),
(37, 230),
(38, 230),
(39, 230),
(40, 230),
(41, 230),
(42, 230),
(43, 230),
(44, 230),
(45, 230),
(46, 230),
(68, 230),
(33, 231),
(34, 231),
(35, 231),
(36, 231),
(37, 231),
(38, 231),
(39, 231),
(40, 231),
(41, 231),
(44, 231),
(45, 231),
(46, 231),
(48, 231),
(49, 231),
(50, 231),
(51, 231),
(52, 231),
(68, 231),
(53, 232),
(54, 232),
(55, 232),
(56, 232),
(57, 232),
(58, 232),
(59, 232),
(60, 232),
(61, 232),
(62, 232),
(63, 232),
(64, 232),
(65, 232),
(66, 232),
(67, 232),
(68, 232),
(69, 232),
(70, 233),
(71, 233),
(72, 233),
(73, 233),
(74, 233),
(75, 233),
(76, 233),
(77, 233),
(78, 233),
(79, 233),
(80, 233),
(81, 233),
(82, 233),
(83, 233),
(84, 233),
(3, 234),
(3, 235),
(85, 236),
(9, 237),
(9, 238),
(86, 239),
(12, 240),
(89, 241),
(90, 242),
(38, 282),
(89, 282),
(91, 282),
(38, 283),
(89, 283),
(91, 283),
(101, 287),
(102, 287),
(94, 288),
(95, 288),
(96, 288),
(97, 289),
(98, 289),
(94, 290),
(95, 290),
(96, 290),
(92, 292),
(93, 293),
(92, 294),
(93, 295),
(92, 296),
(93, 297),
(92, 298),
(93, 299),
(92, 300),
(93, 301);

-- --------------------------------------------------------

--
-- Table structure for table `videoviews`
--

CREATE TABLE IF NOT EXISTS `videoviews` (
  `userId` int(11) NOT NULL,
  `videoId` int(11) NOT NULL,
  `action` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'watched = 0, liked = 1, disliked = -1',
  `actionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`,`videoId`),
  KEY `videoId` (`videoId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `videoviews`
--

INSERT INTO `videoviews` (`userId`, `videoId`, `action`, `actionDate`) VALUES
(2, 1, 1, '2015-04-22 00:00:00'),
(1, 2, 0, '2015-04-22 00:00:00'),
(1, 1, 0, '2015-10-16 12:34:14'),
(3, 2, -1, '2015-04-22 00:00:00'),
(1, 4, 0, '2015-09-23 08:10:06'),
(1, 5, 0, '2015-04-28 10:36:21'),
(1, 206, 1, '2015-10-28 06:32:32'),
(1, 202, -1, '2015-10-16 14:42:38'),
(1, 203, 0, '2015-10-16 14:43:28'),
(1, 208, 1, '2015-09-28 19:06:11'),
(3, 208, -1, '2015-04-28 15:50:06'),
(3, 206, 1, '2015-04-28 21:58:09'),
(1, 219, -1, '2015-10-16 14:09:45'),
(3, 219, 1, '2015-05-01 00:19:10'),
(3, 205, 0, '2015-05-02 16:27:00'),
(1, 230, 0, '2015-10-14 08:11:49'),
(1, 225, 0, '2015-09-23 16:59:54'),
(1, 216, 0, '2015-07-06 12:57:55'),
(1, 232, 0, '2015-09-22 13:17:05'),
(1, 207, 0, '2015-10-06 07:07:05'),
(1, 224, -1, '2015-09-21 20:03:49'),
(1, 234, 0, '2015-09-21 20:05:17'),
(1, 228, 0, '2015-09-22 07:17:44'),
(1, 227, -1, '2015-09-22 14:09:11'),
(1, 212, 0, '2015-09-22 06:58:25'),
(1, 16, 0, '2015-09-21 20:07:39'),
(1, 233, -1, '2015-09-22 13:17:19'),
(1, 204, 0, '2015-09-22 08:00:40'),
(1, 238, 1, '2015-09-23 13:07:39'),
(1, 237, 0, '2015-09-23 08:03:00'),
(1, 236, 0, '2015-09-22 13:05:47'),
(1, 231, 0, '2015-09-22 13:07:08'),
(1, 239, 0, '2015-09-23 13:49:44'),
(1, 205, 0, '2015-09-22 14:09:27'),
(1, 22, 0, '2015-09-23 08:03:56'),
(1, 6, 0, '2015-09-23 08:19:38'),
(1, 229, 0, '2015-09-23 12:18:46'),
(1, 217, 0, '2015-09-23 13:03:56'),
(1, 240, 0, '2015-10-15 12:48:39'),
(1, 220, 0, '2015-10-02 08:03:12'),
(1, 235, 0, '2015-10-06 07:07:22'),
(1, 210, 0, '2015-10-16 14:49:23'),
(1, 241, 0, '2015-10-20 14:30:47'),
(1, 242, 0, '2015-10-20 15:07:20');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwprofileviews`
--
CREATE TABLE IF NOT EXISTS `vwprofileviews` (
`viewerid` int(11)
,`views` decimal(32,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vwuserstats`
--
CREATE TABLE IF NOT EXISTS `vwuserstats` (
`id` int(50)
,`videos` bigint(21)
,`profileviews` decimal(32,0)
,`videoviews` bigint(21)
,`likes` bigint(21)
,`dislikes` bigint(21)
,`comments` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vwvideostats`
--
CREATE TABLE IF NOT EXISTS `vwvideostats` (
`id` int(11)
,`views` bigint(21)
,`likes` bigint(21)
,`dislikes` bigint(21)
,`comments` bigint(21)
,`reportCount` bigint(21)
);
-- --------------------------------------------------------

--
-- Structure for view `vwprofileviews`
--
DROP TABLE IF EXISTS `vwprofileviews`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwprofileviews` AS select `profileviews`.`viewerId` AS `viewerid`,sum(`profileviews`.`count`) AS `views` from `profileviews` group by `profileviews`.`viewerId`;

-- --------------------------------------------------------

--
-- Structure for view `vwuserstats`
--
DROP TABLE IF EXISTS `vwuserstats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwuserstats` AS select `u`.`id` AS `id`,count(distinct `v`.`id`) AS `videos`,coalesce(`pv`.`views`,0) AS `profileviews`,count(distinct `vw`.`videoId`,`vw`.`userId`) AS `videoviews`,count(distinct `vw`.`videoId`,`vw`.`userId`,(case when (`vw`.`action` = 1) then 1 end)) AS `likes`,count(distinct `vw`.`videoId`,`vw`.`userId`,(case when (`vw`.`action` = -(1)) then 1 end)) AS `dislikes`,count(distinct `c`.`id`) AS `comments` from ((((`users` `u` left join `videoviews` `vw` on((`vw`.`userId` = `u`.`id`))) left join `comments` `c` on((`c`.`createdById` = `u`.`id`))) left join `videos` `v` on((`v`.`addedById` = `u`.`id`))) left join `vwprofileviews` `pv` on((`pv`.`viewerid` = `u`.`id`))) group by `u`.`id`;

-- --------------------------------------------------------

--
-- Structure for view `vwvideostats`
--
DROP TABLE IF EXISTS `vwvideostats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwvideostats` AS select `v`.`id` AS `id`,count(distinct `vw`.`videoId`,`vw`.`userId`) AS `views`,count(distinct `vw`.`videoId`,`vw`.`userId`,(case when (`vw`.`action` = 1) then 1 end)) AS `likes`,count(distinct `vw`.`videoId`,`vw`.`userId`,(case when (`vw`.`action` = -(1)) then 1 end)) AS `dislikes`,count(distinct `c`.`id`) AS `comments`,count(distinct `vr`.`id`) AS `reportCount` from (((`videos` `v` left join `videoviews` `vw` on((`vw`.`videoId` = `v`.`id`))) left join `comments` `c` on((`c`.`videoId` = `v`.`id`))) left join `videoreports` `vr` on((`vr`.`videoId` = `v`.`id`))) group by `v`.`id`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
