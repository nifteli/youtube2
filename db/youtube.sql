-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 30, 2015 at 05:33 PM
-- Server version: 5.5.16-log
-- PHP Version: 5.2.9-2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `youtube`
--
CREATE DATABASE IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `youtube`;

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
  `createDate` datetime NOT NULL,
  `lastUpdate` datetime NOT NULL,
  `lastVideoAddDate` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleteDate` datetime NOT NULL,
  `deleteUserId` int(11) NOT NULL,
  `questionId` tinyint(4) NOT NULL COMMENT 'questionId from questions table',
  `createUserId` int(11) NOT NULL,
  `createUserIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `catGroupId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=373 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `catNameAz`, `catInfoAz`, `catNameEn`, `catInfoEn`, `catNameRu`, `catInfoRu`, `createDate`, `lastUpdate`, `lastVideoAddDate`, `deleted`, `deleteDate`, `deleteUserId`, `questionId`, `createUserId`, `createUserIP`, `catGroupId`) VALUES
(1, 'Antropologiya', 'İnsan, onun əsli, inkişafı, mövcudluğu barədə', 'Anthropology', 'About man, his/her origin, development, existence', 'Антропология', 'О человеке, его происхождении, развитии, существовании', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(2, 'Arxeologiya', 'Qədim keçmişin maddi sübutlarının qazıntısı barədə', 'Archeology', 'About the excavations of the evidences of ancient past', 'Археология', 'О раскопках вещественных доказательств древнейшего прошлого', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(3, 'Təhlükəsizlik', 'Mühafizəçilik və aşağı səviyyədəki risklər barədə', 'Security', 'About safety and low risk', 'Безопасность', 'О защищённости и низком уровне риска', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(4, 'Hərbçilik', 'Müharibə və ona hazırlıq barədə', 'Warfare', 'About war and preparation to it', 'Военное дело', 'О войне и приготовлении к ней', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(5, 'Coğrafiya (iqtisadi, siyasi)', 'Cəmiyyətin iqtisadi həyatının ərazi quruluşu barədə', 'Geography (economical, political)', 'About the territorial organization of economic life', 'География (экономическая, политическая)', 'О территориальной организации экономической жизни общества', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(6, 'Evdarlıq', 'Məişət, ev işləri barədə', 'Housekeeping', 'About household, housework', 'Домоводство', 'О бытовых, домашних делах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(7, 'Jurnalistika', 'Kütləvi məlumatların yayımlanması barədə', 'Journalism', 'About the spreading of mass information', 'Журналистика', 'О распространении массовой информации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(8, 'Oyunlar', 'Motivi prosesdə olan qeyri-məhsuldar fəaliyyət növləri barədə', 'Games', 'About unproductive activities, the motive of which is enclosed in the process', 'Игры', 'О непродуктивных видах деятельности, мотив которых заключён в процессе', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(9, 'Mühəndislik', 'Strukturun, maşınların, qurğuların, materialların və ya proseslərin kəşf edilməsi, işləməsi, yaradılması, dəstəklənməsi və ya təmir edilməsi barədə', 'Engineering', 'About the invention, design, construction, maintenance, support or correction of structures, machines, devices, materials or processes', 'Инженерное дело', 'Об изобретении, разработке, создании, поддержке или исправлении структуры, машины, устройства, материалов или процессов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(10, 'İnformatika', 'Məlumatın yığılma, saxlanma, emal, ötürülmə, təhlil, dəyərləlndirmə metodları və prosesləri barədə', 'Computer Science (Information technologies)', 'About the methods and processes of collecting, storing, processing, transmission, analysis and evaluation of information', 'Информатика', 'О методах и процессах сбора, хранения, обработки, передачи, анализа и оценки информации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(11, 'Tarix', 'Keçmiş barədə', 'History', 'About the past', 'История', 'О прошлом', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(12, 'Kommunikasiya (rabitə)', 'Rabitənin texnoloji vasitələri barədə', 'Communication', 'About the technological means of communication', 'Коммуникация', 'О технологических средствах связи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(13, 'Mədəniyyətşünaslıq', 'Cəmiyyətin tarixi-sosial təcrübəsi barədə', 'Culturology', 'About the historically-social experience of people', 'Культурология', 'Об исторически-социальном опыте людей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(14, 'Linqvistika (dillər)', 'Dillər barədə', 'Linguistics (Languages)', 'About languages', 'Лингвистика (языки)', 'О языках', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(15, 'Təbabət / Səhiyyə', 'Xəstəliklərin tanınması (diaqnostikası), qabağının alınması və müalicəsi barədə', 'Medicine / Health Care', 'About the recognition, prevention and treatment of diseases', 'Медицина / Здравоохранение', 'О распознавании, предупреждении и лечении болезней', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(16, 'Meteorologiya', 'Hava barədə', 'Meteorology', 'About the weather', 'Метеорология', 'О погоде', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(17, 'Pedaqoqika', 'İnsanın tərbiyəsi və tədrisi barədə', 'Pedagogics', 'About the education and training of man', 'Педагогика', 'О воспитании и обучении человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(18, 'Siyasət', 'Müəyyən ictimai mühitdə müəyyən maraqların reallaşdırılmadakı vasitə və üsulları barədə ', 'Policy', 'About the means and methods of realization of certain interests in a particular social environment', 'Политика', 'О средствах и методах реализации определённых интересов в определённой социальной среде', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(19, 'Politologiya', 'Hökmranlıq münasibətləri ilə əlaqədar insanların həyat fəaliyyəti', 'Politology (Political science)', 'About the sphere of human activity related to the power relations', 'Политология', 'О сфере жизнедеятельности людей, связанной с властными отношениями', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(20, 'Hüquq', 'İctimai münasibətləri tənzimləlyən davranış qaydaları barədə', 'Law', 'About the rules of conduct governing public relations', 'Право', 'О правилах поведения, регулирующих общественные отношения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(21, 'İstehsal', 'İnsanlar tərəfindən təbii resursların hər hansı məhsula aktiv dəyişdirilmə prosesi barədə', 'Production (Manufacture)', 'The process of active transformation of natural resources by people into any product', 'Производство', 'О процессе активного преобразования людьми природных ресурсов в какой-либо продукт', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(22, 'Psixologiya / Özünün inkişafı', 'Psixiki (ruhi) proseslər / Psixikanın (ruhi aləmin) idarəedilməsi üsulları barədə', 'Psychology / Self-development', 'About the mental processes / About methods of control over the psyche', 'Психология / Саморазвитие', 'О психических процессах / О способах управления психикой', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(23, 'Din', 'Fövqəltəbii aləmə inam ilə şərtləndirilən dünya qavrayış formaları barədə', 'Religion', 'About the forms of consciousness of the world, due to the belief in the supernatural', 'Религия', 'О формах осознания мира, обусловленных верой в сверхъестественное', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(24, 'Təmir', 'Çalışa bilən və saz vəziyyətinin bərpası barədə', 'Repair', 'About the restoration (recovery) of serviceable condition', 'Ремонт', 'О восстановлении работоспособного или исправного состояния', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(25, 'Ritorika (natiqlik)', 'Nitq məharəti barədə', 'Rhetoric', 'About the art of speech', 'Риторика', 'Об искусстве речи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(26, 'Seksologiya', 'Cinsi arzusunun təzahürü və təmin edilməsi ilə bağlı insan davranışları barədə', 'Sexology', 'About the actions of a man, associated with the manifestation and satisfaction of sexual desire', 'Сексология', 'О поступках человека, связанных с проявлением и удовлетворением полового влечения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(27, 'Kənd təsərrüfatı', 'Ərzaqlarla (bitki, heyvan ilə) təmin edilməsi barədə', 'Agriculture', 'About the provision of food (vegetable, animal)', 'Сельское хозяйство', 'Об обеспечении продовольствием (растительным, животным)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(28, 'Sosiologiya', 'Cəmiyyət barədə', 'Sociology', 'About the society', 'Социология', 'Об обществе', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(29, 'İdman', 'Yarış məqsədilə aparılan fiziki və əqli fəaliyyət barədə', 'Sport', 'About the physical and intellectual activity, done with the aim of competition', 'Спорт', 'О физической и интеллектуальной активности, совершаемой с целью соревнования', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(30, 'Standartlaşdırma / Metrologiya', 'Müxtəlif sahələrdə normaların, qaydaların və xarakteristikaların müəyyən edilməsi / ölçmədə, üsul və vasitələrdə vahidliyin təmin edilməsi barədə', 'Standardization / Metrology', 'About establishing the rules, regulations and characteristics in different areas / About uniformity in the measurements, methods and means', 'Стандартизация / Метрология', 'Об установлении норм, правил и характеристик в различных областях / Об обеспечении единства в измерениях, методах и средствах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(31, 'İnşaat', 'Binaların və  digər tikililərin inşaatı, təmiri, yenidən qurulması, bərpası və renovasiyası barədə', 'Construction (Building)', 'About the construction of buildings and structures, their repairs, reconstructions, restorations and renovations', 'Строительство', 'О возведении зданий и сооружений, их ремонте, реконструкции, реставрации и реновации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(32, 'Mətbəə işi / Litoqrafiya', 'Mətnin çapı barədə', 'Typography / Lithography', 'About printing texts', 'Типографика / Литография', 'О печати текста', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(33, 'Nəqliyyat', 'Maddi yüklərin yerdəyişmə prosesini təmin edən rabitə yolları barədə', 'Transportation (Transport)', 'About the lines of communication, to ensure the process of moving material cargo', 'Транспорт', 'О путях сообщения, обеспечивающих процесс перемещения материального груза', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(34, 'İşə düzəltmə', 'İşə düzəltmə prosesi barədə', 'Employment', 'About a getting and giving a job', 'Трудоустройство', 'Об устройстве на работу', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(35, 'Ufologiya', 'Yer kürəsi ötəsi idrak barədə', 'Ufology', 'About extraterrestrial intelligence', 'Уфология', 'О внеземном разуме', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(36, 'Filologiya', 'Bədii yaradıcılıq barədə', 'Philology', 'About literary works', 'Филология', 'О литературном творчестве', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(37, 'Fəlsəfə', 'Dünya qavrayış formaları barədə', 'Philosophy', 'About the forms of consciousness of the world', 'Философия', 'О формах осознания мира', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(38, 'Ekologiya', 'Canlı və qeyri-canlı təbiətin qarşılıqlı münasibətləri barədə', 'Ecology', 'About the relationship between animate and inanimate nature', 'Экология', 'О взаимоотношениях живой и неживой природы', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(39, 'İqtisadiyyat', 'İstehsalat, bölüşdürmə, mübadilə və istehlak sistemində formalaşan münasibətlər barədə', 'Economy', 'About the set of relations in the system of production, distribution, exchange and consumption', 'Экономика', 'О совокупности отношений, складывающихся в системе производства, распределения, обмена и потребления', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(40, 'Ekstrasensorika / Хiromantiya / Magiya / Metafizika', 'Elm tərəfindən tam sübuta yetirilməyən insan hissiyyatı barədə', 'Extrasensorics / Palmistry / Magic / Metaphysics / Paranormal', 'About the feelings of a person, which are not fully proven by science', 'Экстрасенсорика / Хиромантия / Магия / Метафизика / Паранормальное', 'О чувствах человека, не полностью доказанных наукой', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(41, 'Energetika', 'Enerji resursların dəyişdirilməsi, bölüşdürülməsi və istifadəsi barədə', 'Energetics', 'About the transformation, distribution and use of energy resources', 'Энергетика', 'О  преобразовании, распределении и использовании энергетических ресурсов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(42, 'Etnoqrafiya', 'Xalqlar barədə', 'Ethnography', 'About peoples', 'Этнография', 'О народах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 1),
(43, 'Aktyorluq / Teatrlıq', 'Səhnə obrazlarının yaradılması barədə', 'Show (theatrical, film) art', 'About the creation and performance of scenic images', 'Актёрское (театральное) искусство', 'О создании и воспроизведении сценических образов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(44, 'Applikasiya (qurama) / dekupaj / inkrustasiya (qaxma)', 'Bir materialın onun üzərinə digər materialın (fiqurların, şəkillərin, naxışın, daşların) qoyulması, yapışdırılması və ya tikilməsi yolu ilə bəzədilməsi barədə', 'Application (appliqué) / Decoupage / Inlay', 'About decorating a material by overlapping, sticking, sewing on it another material (figures, paintings, ornaments, stones)', 'Аппликация / Декупаж / Инкрустация', 'Об украшении материала, путём накладывания, наклеивания, нашивания на него другого материала (фигурок, картин, орнамента, камней)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(45, 'Muncuqlaşma', 'Muncuqdan məmulatların qayırması barədə', 'Beading', 'About the manufacture of products made of beads', 'Бисероплетение', 'Об изготовлении изделий из бисера', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(46, 'Kağız incəsənəti', 'Kağızdan məmulatların qayırması barədə', 'Paper art (origami, papier-mâché, etc.)', 'About the manufacture of products made of paper', 'Бумажное искусство (оригами, папье-маше и т.д.)', 'Об изготовлении изделий из бумаги', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(47, 'Güldançəkmə', 'Qabların boyalarla bəzədib bişirilməsi barədə', 'Vase painting', 'About painting vessels, followed by firing', 'Вазопись', 'О росписи сосудов красками с последующим обжигом', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(48, 'Vitraj', 'Memarlıq tikilidəki qapı və ya pəncərə yerinin (yarı)şəffaf rəngli lövhələrlə doldurulması barədə', 'Stained-glass window', 'About the filling colored (semi)transparent plates (glasses, stones) into the aperture of an architectural construction', 'Витраж', 'О заполнении цветными (полу)прозрачными плитами (стёклами, камнями) проёма в архитектурном сооружении', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(49, 'Vokal incəsənəti (müğənnilik)', 'Vokal əsərlərin yaradılması (ifası) barədə', 'Vocal art (songs)', 'About creation or performance of vocal works (songs)', 'Вокальное искусство (песни)', 'О создании (исполнении) вокальных произведений (песен)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(50, 'Yandırma üsulu ilə naxış açma', 'Bərk qızmış iynə vasitəsilə orqanik materialın (fanerin, kağızın, dərinin, parçanın) bəzədilməsi barədə', 'Pokerwork (Burning out, Pyrography)', 'About decorating an organic material (plywood, paper, leather, fabric) with an illustration by using a red-hot needle or a fine flame', 'Выжигание (пирография)', 'Об украшении органического материала (фанеры,  бумаги, кожи, ткани) рисунком, при помощи раскалённой иглы', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(51, 'Naxış tikmə', 'Tikilmiş (calanmış) saplar vasitəsilə materialların (parçanın, dərinin) naxışlarla bəzədilməsi barədə', 'Embroidery (Fancywork)', 'About decorating a material (textile, leather) with patterns, using the sewn threads', 'Вышивание', 'Об украшении узорами материалов (ткани, кожи), при помощи вшиваемых нитей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(52, 'Qravyura', 'Çap ottisklərdə (basmalarda) təsvirlərin yaradılması barədə', 'Engraving', 'About the creation of images in print impressions', 'Гравюра', 'О создании изображений в печатных оттисках', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(53, 'Dizaynerlik', 'Obyektlərin insanın utilitar (tətbiqi) və estetik ehtiyaclarına uyğunlaşdırılması barədə', 'Design', 'About matching objects to utilitarian and aesthetic needs of man', 'Дизайн', 'О приведении соответствия объектов  утилитарным и эстетическим потребностям человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(54, 'Rəssamlıq (naqqaşlıq, naxışlıq, qrafika və s.)', 'Hər hansı səth üzərinə boyaların vurulması yolu ilə təsvirlərin yaradılması', 'Painting (drawing, fresco, graphics)', 'About the creation of images by applying paint on any surface', 'Живопись (рисование, роспись, графика)', 'О создании изображений посредством нанесения красок на какую-либо поверхность', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(55, 'İxtiraçılıq', 'Yeniliklərin kəşf edilməsi barədə', 'Invention', 'About the invention of new', 'Изобретательство', 'Об изобретении нового', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(56, 'Kinematoqrafiya', 'Hərəkət edən təsvirlərin yaradılması barədə', 'Cinematography', 'About the creation of motion pictures', 'Кинематография', 'О создании движущихся изображений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(57, 'Xalçalıq', 'Xalçaların istehsalı barədə', 'Carpet weaving', 'About the manufacture of carpets', 'Ковроткачество', 'О производстве ковров', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(58, 'Aşbazlıq', 'Qidanın hazırlanması barədə', 'Cookery (Cooking)', 'About cooking', 'Кулинария', 'О приготовлении пищи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(59, 'Tökmə', 'Tökmə qəlibə maye materialın (metalın, ərintinin, plastmassanın və ilaxır kimi şeylrəin) doldurulması və onun bərkilməsi yolu ilə əşyaların hazırlanması barədə', 'Casting (Moulding)', 'About making items by filling a mold with liquid materials (metals, alloys, plastics and so on), followed by their solidification', 'Литьё', 'Об изготовлении предметов, путём заполнения литейной формы жидким материалом (металлом, сплавом, пластмассой и т. п.) с последующим его затвердеванием', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(60, 'Mozaika', 'Bİr səthin üzərində əlvan materialların (daşların, smaltanın, keramik lövhələrin) quraşdırılması, yığılması və bərkidilməsi yolu ilə təsvirlərin formalaşdırılması barədə', 'Mosaic', 'About the formation of images by arranging, composition and fixing colored materials (stones, glazes, ceramic tiles) onto a surface', 'Мозаика', 'О формировании изображения посредством компоновки, набора и закрепления на поверхности разноцветных материалов (камней, смальты, керамических плиток)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(61, 'Musiqiçilik', 'Musiqi (audio) əsərlərin yaradılması (ifası) barədə', 'Musical Art', 'About the creation and playing music (audio works)', 'Музыкальное искусство', 'О создании (воспроизведении) музыкальных (аудио) произведений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(62, 'Multimediya', 'Multimedia (video-audio-təsviri) əsərlərinin yaradılması (ifası) barədə', 'Multimedia art', 'About the creation and playing multimedia (video audio-visual works)', 'Мультимедийное искусство', 'О создании (воспроизведении) мультимедийных (видео-ауди-изобразительных) произведений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(63, 'Bərbərlik', 'Saç düzülüşlərinin yaradılması barədə', 'Hairdressing', 'About the creation of hairstyles', 'Парикмахерское искусство', 'О создании причёсок', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(64, 'Yazıçılıq', 'Yazı əsərlərinin yaradılması barədə', 'Writing art', 'About the creation of writings (written works)', 'Писательское искусство', 'О создании письменного произведения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(65, 'Hörmə (hörülmə) / Toxuma (toxunma) / Krujeva', 'Bərkliyi daha az olan bir və ya bir neçə sapdan (lentdən) daha bərk məmulatların hazırlanması barədə', 'Weaving / Knitting / Lace', 'About manufacturing stronger products from less resistant yarn(s)', 'Плетение / Вязание / Кружево', 'Об изготовлении более прочных изделий из одной или нескольких менее прочных нитей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(66, 'Şairlik', 'Ritm ilə ölçülən kəsiklərə bölünmə ilə təşkil olunmuş bədii nitqin yaradılması (ifası) barədə', 'Poetic Art (Poetry)', 'About composition and performance of speech, divided by rhythmically commensurate segments', 'Поэтическое искусство', 'О сочинении (воспроизведении) художественной речи, организованной делением на ритмически соизмеримые отрезки', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(67, 'Əyirmə (əyrilmə)', 'Ayrı-ayrı liflərin uzununa üst-üstə yığılması və spiralvari eşməsi yolu ilə uzun və bərk sapın hazırlanması barədə', 'Spinning', 'About the manufacture of long and strong thread through the longitudinal folding and twisting spiral of individual fibers', 'Прядение', 'Об изготовлении длинной и прочной нити, путём продольного складывания и спирального скручивания отдельных волокон', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(68, 'Oyma', 'Daha bərk və iti material ilə digər materialın (taxtanın, sümüyün, metalın) bədii emalı barədə', 'Carvings', 'About the artistic working of the material (wood, bone, metal) with an acute, more hard material', 'Резьба', 'О художественной обработки материала (дерева, кости, металла) острым, более твёрдым материалом', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(69, 'Bağçılıq-parkçılıq', 'Bağçaların, parkların və digər yaşıllaşdırılan ərazilərin yaradılması barədə', 'Landscape art', 'About the creation of gardens, parks and other vegetated areas', 'Садово-парковое искусство', 'О создании садов, парков и других озеленяемых территорий', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(70, 'Skrapbuking', 'Foto-albomların yaradılması və bəzədilməsi barədə', 'Scrapbooking', 'About the manufacture and design of photo albums', 'Скрапбукинг', 'Об изготовлении и оформлении фотоальбомов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(71, 'Heykəltəraşlıq', 'Həcmi formada təsvirlərin yaradılması barədə', 'Sculptural art (Mouldings)', 'About the creation of images in bulk form', 'Скульптурное искусство', 'О создании изображений в объёмной форме', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(72, 'Əşyaların yaradılması (təkmilləşdirilməsi)', 'Əşyaların yaradılması və ya təmilləşdirilməsi barədə', 'Creation (improvement) of items', 'About the creation or improvement of the items', 'Создание (усовершенствование) предметов', 'О создании или усовершенствовании предметов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(73, 'Stilistikalıq (Vizajıstlıq)', 'Zahirin (imicin) bəzədilməsi və qüsurların kamuflyaj edilməsi barədə', 'Stylistic (Makeup) art', 'About decorating the exterior (image) and camouflage flaws', 'Стилистическое (визажистское) искусство', 'Об украшении внешности (имиджа) и камуфлировании изъянов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(74, 'Rəqqaslıq (Xoreoqrafiya)', 'Rəqslərin yaradılması (ifası) barədə', 'Dance art (Choreography)', 'About creation and performance of dance', 'Танцевальное (хореография) искусство', 'О создании (исполнении) танцев', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(75, 'Tele-radio-internet yayım', 'Tele-radio-internet verilişlərin yaradılması (verilməsi) barədə', 'TV, radio, Internet broadcasting', 'About the creation of programs for TV, radio, Internet broadcasts', 'Теле-радио-интернет вещание', 'О создании передач для теле-радио-интернет вещаний', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(76, 'Toxuculuq', 'Parçanın istehsalı barədə', 'Weaving', 'About the production of textile', 'Ткачество', 'О производстве ткани', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(77, 'Floristika', 'Çiçəklərdən və digər bitki ünsürlərindən kompozisiyaların (interyerin, gül dəstələrinin) yaradılması barədə', 'Floristics', 'About the creation of compositions (interior, bouquets) made of flowers and other plant components', 'Флористика', 'О создании композиций (интерьера, букетов) из цветов и других растительных элементов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(78, 'Fotoqrafçılıq', 'Foto-şəkillərin yaradılması barədə', 'Photographic Arts (Photos)', 'About the creation of photos', 'Фотографическое искусство', 'О создании фотоснимков', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(79, 'Dərinin bədii emalı', 'Dəridən olan məmulatların bədii emalı barədə', 'Leather crafting', 'About the manufacture of leather goods', 'Художественная обработка кожи', 'Об изготовлении предметов из кожи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(80, 'Sirk / Sehrbazlıq / Əyləncəvi tamaşalar', 'Əyləncə tamaşalarının yaradılması barədə', 'Show Art (Entertainment)', 'About the creation of entertaining shows', 'Цирковое (развлекательное) искусство', 'О создании развлекательных представлений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(81, 'Tikmə', 'Materiallardan (parçadan, dəridən) sırıq və tikişaraları vasitəsilə məmulatların hazırlanması barədə', 'Tailoring (Sewing)', 'About manufacture of goods from the material (textile, leather) by means of seams and stitches', 'Шитьё', 'Об изготовлении изделия из материала (ткани, кожи), при помощи стежков и швов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(82, 'Zərgərlik', 'Zərgərlik materiallarından əşyaların hazırlanması barədə', 'Jewellery', 'About the manufacture of goods made of precious materials', 'Ювелирное дело', 'Об изготовлении предметов из драгоценных материалов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 2),
(83, 'Anatomiya (insan)', 'İnsan vücudu barədə', 'Human Anatomy', 'About the organizm of human body', 'Анатомия человека', 'Об организме человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(84, 'Astronomiya', 'Göy cisimləri barədə', 'Astronomy', 'About celestial bodies', 'Астрономия', 'О небесных телах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(85, 'Botanika', 'Bitki orqanizmi barədə', 'Botany', 'About the organizm of plants', 'Ботаника', 'Об организме растений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(86, 'Coğrafiya (fiziki)', 'Yer kürəsinin coğrafi qişası və onun tərkib hissələri barədə', 'Geography (physical)', 'The geographical cover of the Earth and its structural parts', 'География (физическая)', 'О географической оболочке Земли и её структурных частей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(87, 'Geodeziya', 'Yer kürəsinin fiquru, cazibə sahəsi, fırlanma parametrləri və onların vaxtla dəyişiklikləri barədə', 'Geodesy', 'About the figure, the gravitational field, rotation parameters of the Earth and their changes over time', 'Геодезия', 'О фигуре, гравитационное поле, параметрах вращения Земли и их изменениях во времени', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(88, 'Geologiya', 'Yer kürəsinin tərkibi barədə', 'Geology', 'About the structure of the Earth', 'Геология', 'О строении Земли', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(89, 'Zoologiya', 'Heyvanların orqanizmləri barədə', 'Zoology', 'About the organizm of animals', 'Зоология', 'Об организме животных', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(90, 'Məntiq', 'Mühakimə, sübut və təkzib etmə üsulları barədə', 'Logic', 'About the methods of reasoning, proof and refutation', 'Логика', 'О способах рассуждения, доказательств и опровержений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(91, 'Riyaziyyat', 'Hesablanma əməliyyatları, obyektlərin ölçülməsi və formalarının təsviri barədə', 'Mathematics', 'About the operations of counting, measuring and describing the shape of objects', 'Математика', 'Об операциях подсчёта, измерения и описания формы объектов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(92, 'Statistika', 'Kütləvi kəmiyyət və keyfiyyət məlumatlarının yığılması, ölçülməsi və təhlili barədə', 'Statistics', 'About the collection, measurement and analysis of massive quantitative or qualitative data', 'Статистика', 'О сборе, измерении и анализе массовых количественных или качественных данных', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(93, 'Fizika', 'Təbiətin, materiyanın ümumi qanunları, onların strukturu və hərəkəti barədə', 'Physics', 'About the general laws of nature, matter, its structure and movement', 'Физика', 'Об общих законах природы, материи, её структуре и движении', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(94, 'Kimya', 'Maddələr, onların tərkibləri, quruluşu, xüsusiyyətləri barədə', 'Chemistry', 'About substances, their composition, structure, properties', 'Химия', 'О веществах, их составе, строении, свойствах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(95, 'Digər sahələr', 'Unudulmuş və yeni sahələr', 'Other areas', 'About the neglected and new areas', 'Другие области', 'Забытые и новые области', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, '', 3),
(96, 'Antropoloqlar', 'İnsan, onun əsli, inkişafı, mövcudluğu üzrə mütəxəssislər', 'Anthropologists', 'Experts on man, his/her origin, development, existence', 'Антропологи', 'Специалисты по человеку, его происхождению, развитию, существованию', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(97, 'Arxeoloqlar', 'Qədim keçmişin maddi sübutlarının qazıntısı üzrə mütəxəssislər', 'Archaeologists', 'Experts on excavations of the evidences of ancient past', 'Археологи', 'Специалисты по раскопкам вещественных доказательств древнейшего прошлого', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(98, 'Təhlükəsizlik üzrə mütəxəssislər', 'Mühafizəçilik və aşağı səviyyədəki risklər üzrə mütəxəssislər', 'Safety / security - experts', 'Experts on safety and low risk', 'Безопасность - специалисты', 'Специалисты по защищённости и низком уровне риска', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(99, 'Hərbçilər', 'Müharibə və ona hazırlıq üzrə mütəxəssislər', 'Military man', 'Experts on war and preparation to it', 'Военные', 'Специалисты по войне и приготавлении к ней', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(100, 'Coğrafiya (iqtisadi, siyasi) üzrə mütəxəssislər', 'Cəmiyyətin iqtisadi həyatının ərazi quruluşu üzrə mütəxəssislər', 'Geographers (on economic, political geography)', 'Experts on territorial organization of economic life', 'Географы (по экономической, политической географии)', 'Специалисты по территориальной организации экономической жизни общества', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(101, 'Evdarlıq üzrə mütəxəssislər', 'Məişət, ev işləri üzrə mütəxəssislər', 'Housekeeping - experts', 'Experts on household, housework', 'Домоводство - специалисты', 'Специалисты по бытовым, домашним делам', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(102, 'Jurnalistlər', 'Kütləvi məlumatların yayımlanması üzrə mütəxəssislər', 'Journalists', 'Experts on spreading of mass information', 'Журналисты', 'Специалисты по распространению массовой информации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(103, 'Oyunçular', 'Motivi prosesdə olan qeyri-məhsuldar fəaliyyət növləri üzrə mütəxəssislər', 'Players in games', 'Experts on unproductive activities, the motive of which is enclosed in the process', 'Игроки', 'Специалисты по непродуктивным видам деятельности, мотив которых заключён в процессе', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(104, 'Mühəndislər', 'Strukturun, maşınların, qurğuların, materialların və ya proseslərin kəşf edilməsi, işləməsi, yaradılması, dəstəklənməsi və ya təmir edilməsi üzrə mütəxəssislər', 'Engineers', 'Experts on invention, design, construction, maintenance, support or correction of structures, machines, devices, materials or processes', 'Инженеры', 'Специалисты по изобретению, разработке, созданию, поддержке или исправлению структуры, машины, устройства, материалов или процессов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(105, 'İnformatlər', 'Məlumatın yığılma, saxlanma, emal, ötürülmə, təhlil, dəyərləlndirmə metodları və prosesləri üzrə mütəxəssislər', 'Information technology - experts', 'Experts on methods and processes of collecting, storing, processing, transmission, analysis and evaluation of information', 'Информатика - специалисты', 'Специалисты по методам и процессам сбора, хранения, обработке, передаче, анализу и оценке информации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(106, 'Tarixçilər', 'Keçmiş üzrə mütəxəssislər', 'Historians', 'Experts on past', 'Историки', 'Специалисты по прошлому', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(107, 'Kommunikasiya (rabitə) üzrə mütəxəssislər', 'Rabitənin texnoloji vasitələri üzrə mütəxəssislər', 'Communication - experts', 'Experts on technological means of communication', 'Коммуникация - специалисты', 'Специалисты по технологическим средствам связи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(108, 'Mədəniyyətşünaslar', 'Cəmiyyətin tarixi-sosial təcrübəsi üzrə mütəxəssislər', 'Cultural studies - experts', 'Experts on historically-social experience of people', 'Культурологи', 'Специалисты по исторически-социальному опыту людей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(109, 'Linqvistlər', 'Dillər üzrə mütəxəssislər', 'Linguists (linguists)', 'Experts on languages', 'Лингвисты (языковеды)', 'Специалисты по языкам', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(110, 'Təbabətçilər / Səhiyyə üzrə mütəxəssislər', 'Xəstəliklərin tanınması (diaqnostikası), qabağının alınması və müalicəsi üzrə mütəxəssislər', 'Doctors / Health Care', 'Experts on recognition, prevention and treatment of diseases', 'Медики / Здравоохранение - специалисты', 'Специалисты по распознаванию, предупреждению и лечению болезней', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(111, 'Meteoroloqlar', 'Hava üzrə mütəxəssislər', 'Meteorologists', 'Experts on weather', 'Метеорологи', 'Специалисты по погоде', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(112, 'Pedaqoqlar', 'İnsanın tərbiyəsi və tədrisi üzrə mütəxəssislər', 'Teachers / Leacturers', 'Experts on education and training of man', 'Педагоги', 'Специалисты по воспитанию и обучению человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(113, 'Siyasətçilər', 'Müəyyən ictimai mühitdə müəyyən maraqların reallaşdırılmadakı vasitə və üsulları üzrə mütəxəssislər ', 'Politicians', 'Experts on means and methods of realization of certain interests in a particular social environment', 'Политики', 'Специалисты по средствам и методам реализации определённых интересов в определённой социальной среде', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4);
INSERT INTO `categories` (`id`, `catNameAz`, `catInfoAz`, `catNameEn`, `catInfoEn`, `catNameRu`, `catInfoRu`, `createDate`, `lastUpdate`, `lastVideoAddDate`, `deleted`, `deleteDate`, `deleteUserId`, `questionId`, `createUserId`, `createUserIP`, `catGroupId`) VALUES
(114, 'Politoloqlar', 'Hökmranlıq münasibətləri ilə əlaqədar insanların həyat fəaliyyəti', 'Political scientists', 'Experts on sphere of human activity related to the power relations', 'Политологи', 'Специалисты по сфере жизнедеятельности людей, связанной с властными отношениями', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(115, 'Hüquqşünaslar', 'İctimai münasibətləri tənzimləlyən davranış qaydaları üzrə mütəxəssislər', 'Lawyers', 'Experts on rules of conduct governing public relations', 'Правоведы', 'Специалисты по правилам поведения, регулирующих общественные отношения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(116, 'İstehsalçılar', 'İnsanlar tərəfindən təbii resursların hər hansı məhsula aktiv dəyişdirilmə prosesi üzrə mütəxəssislər', 'Manufacturers', 'The process of active transformation of natural resources by people into any product', 'Производители', 'Специалисты по процессу активного преобразования людьми природных ресурсов в какой-либо продукт', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(117, 'Psixoloqlar / Özünün inkişafı üzrə mütəxəssislər', 'Psixiki (ruhi) proseslər / Psixikanın (ruhi aləmin) idarəedilməsi üsulları üzrə mütəxəssislər', 'Psychology / Self-development - experts', 'Experts on mental processes / Experts on methods of control over the psyche', 'Психологи / Саморазвитие  - специалисты', 'Специалисты по психическим процессам / Специалисты по способам управления психикой', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(118, 'Din xadimləri', 'Fövqəltəbii aləmə inam ilə şərtləndirilən dünya qavrayış formaları üzrə mütəxəssislər', 'Religious studies - experts', 'Experts on forms of consciousness of the world, due to the belief in the supernatural', 'Религиоведы', 'Специалисты по формам осознания мира, обусловленной верой в сверхъестественное', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(119, 'Təmir üzrə mütəxəssislər', 'Çalışa bilən və saz vəziyyətinin bərpası üzrə mütəxəssislər', 'Repairers', 'Experts on restoration (recovery) of serviceable condition', 'Ремонтники', 'Специалисты по восстановлению работоспособного или исправного состояния', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(120, 'Ritorika (natiqlik) üzrə mütəxəssislər', 'Nitq məharəti üzrə mütəxəssislər', 'Orators / Speakers', 'Experts on art of speech', 'Риторика - специалисты', 'Специалисты по искусству речи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(121, 'Seksoloqlar', 'Cinsi arzusunun təzahürü və təmin edilməsi ilə bağlı insan davranışları üzrə mütəxəssislər', 'Sexologists', 'Experts on actions of a man, associated with the manifestation and satisfaction of sexual desire', 'Сексологи', 'Специалисты по поступкам человека, связанных с проявлением и удовлетворением полового влечения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(122, 'Kənd təsərrüfatı üzrə mütəxəssislər', 'Ərzaqlarla (bitki, heyvan ilə) təmin edilməsi üzrə mütəxəssislər', 'Agriculture - experts', 'Experts on provision of food (vegetable, animal)', 'Сельское хозяйство - специалисты', 'Специалисты по обеспечению продовольствием (растительным, животным)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(123, 'Sosioloqlar', 'Cəmiyyət üzrə mütəxəssislər', 'Sociologists', 'Experts on society', 'Социологи', 'Специалисты по обществу', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(124, 'İdmançılar', 'Yarış məqsədilə aparılan fiziki və əqli fəaliyyət üzrə mütəxəssislər', 'Athletes', 'Experts on physical and intellectual activity, done with the aim of competition', 'Спортсмены', 'Специалисты по физической и интеллектуальной активности, совершаемой с целью соревнования', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(125, 'Standartlaşdırma / Metrologiya üzrə mütəxəssislər', 'Müxtəlif sahələrdə normaların, qaydaların və xarakteristikaların müəyyən edilməsi / ölçmədə, üsul və vasitələrdə vahidliyin təmin edilməsi üzrə mütəxəssislər', 'Standardization / Metrology - experts', 'Experts on establishing the rules, regulations and characteristics in different areas / Experts on uniformity in the measurements, methods and means', 'Стандартизаторы / Метрологи', 'Специалисты по установлению норм, правил и характеристик в различных областях / Специалисты по обеспечению единства в измерениях, методах и средствах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(126, 'İnşaatçılar', 'Binaların və  digər tikililərin inşaatı, təmiri, yenidən qurulması, bərpası və renovasiyası üzrə mütəxəssislər', 'Builders', 'Experts on construction of buildings and structures, their repairs, reconstructions, restorations and renovations', 'Строители', 'Специалисты по возведению зданий и сооружений, их ремонту, реконструкции, реставрации и реновации', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(127, 'Mətbəə işi / Litoqrafiya üzrə mütəxəssislər', 'Mətnin çapı üzrə mütəxəssislər', 'Typographers / Lithographers', 'Experts on printing texts', 'Типографы / Литографы', 'Специалисты по печати текста', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(128, 'Nəqliyyat üzrə mütəxəssislər', 'Maddi yüklərin yerdəyişmə prosesini təmin edən rabitə yolları üzrə mütəxəssislər', 'Transport workers', 'Experts on lines of communication, to ensure the process of moving material cargo', 'Транспортники', 'Специалисты по путям сообщения, обеспечивающих процесс перемещения материального груза', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(129, 'İşə düzəltmə üzrə mütəxəssislər', 'İşə düzəltmə prosesi üzrə mütəxəssislər', 'Employment - experts', 'Experts on a getting and giving a job', 'Трудоустройство - специалисты', 'Специалисты по устройству на работу', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(130, 'Ufoloqlar', 'Yer kürəsi ötəsi idrak üzrə mütəxəssislər', 'Ufologists', 'Experts on extraterrestrial intelligence', 'Уфологи', 'Специалисты по внеземному разуму', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(131, 'Filoloqlar', 'Bədii yaradıcılıq üzrə mütəxəssislər', 'Philologists', 'Experts on literary works', 'Филологи', 'Специалисты по литературному творчеству', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(132, 'Filosoflar', 'Dünya qavrayış formaları üzrə mütəxəssislər', 'Philosophers', 'Experts on forms of consciousness of the world', 'Философы', 'Специалисты по формам осознания мира', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(133, 'Ekoloqlar', 'Canlı və qeyri-canlı təbiətin qarşılıqlı münasibətləri üzrə mütəxəssislər', 'Environmentalists', 'Experts on relationship between animate and inanimate nature', 'Экологи', 'Специалисты по взаимоотношениям живой и неживой природы', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(134, 'İqtisadçılar', 'İstehsalat, bölüşdürmə, mübadilə və istehlak sistemində formalaşan münasibətlər üzrə mütəxəssislər', 'Economists', 'Experts on set of relations in the system of production, distribution, exchange and consumption', 'Экономисты', 'Специалисты по совокупности отношений, складывающихся в системе производства, распределении, обмену и потреблению', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(135, 'Ekstrasensorika / Хiromantiya / Magiya / Metafizika üzrə mütəxəssislər', 'Elm tərəfindən tam sübuta yetirilməyən insan hissiyyatı üzrə mütəxəssislər', 'Psychic / Palmists / Mages / Metaphysics / Paranormal - experts', 'Experts on feelings of a person, which are not fully proven by science', 'Экстрасенсорики / Хироманты / Маги / Метафизики / Паранормальное - специалисты', 'Люди, обладающие чувствами, существование которых не полностью доказано наукой', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(136, 'Energetiklər', 'Enerji resursların dəyişdirilməsi, bölüşdürülməsi və istifadəsi üzrə mütəxəssislər', 'Energy - experts', 'Experts on transformation, distribution and use of energy resources', 'Энергетики', 'Специалисты по  преобразованию, распределению и использованию энергетических ресурсов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(137, 'Etnoqraflar', 'Xalqlar üzrə mütəxəssislər', 'Ethnographers', 'Experts on peoples', 'Этнографы', 'Специалисты по народам', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 4),
(138, 'Aktyorlar / Teatr fəaliyyəti üzrə mütəxəssislər', 'Səhnə obrazlarının yaradılması üzrə mütəxəssislər', 'Actors (theater - specialists)', 'Experts on creation and performance of scenic images', 'Актёры (театральное искусство - специалисты)', 'Люди, участвующие в создании (воспроизведении) сценических образов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(139, 'Applikasiya (qurama) / dekupaj / inkrustasiya (qaxma) üzrə mütəxəssislər', 'Bir materialın onun üzərinə digər materialın (fiqurların, şəkillərin, naxışın, daşların) qoyulması, yapışdırılması və ya tikilməsi yolu ilə bəzədilməsi üzrə mütəxəssislər', 'Application / Decoupage / Inlay - experts', 'Experts on decorating a material by overlapping, sticking, sewing on it another material (figures, paintings, ornaments, stones)', 'Аппликация / Декупаж / Инкрустация - специалисты', 'Люди, участвующие в украшении материала, путём накладывания, наклеивания, нашивания на него другого материала (фигурок, картин, орнамента, камней)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(140, 'Muncuqlaşma üzrə mütəxəssislər', 'Muncuqdan məmulatların qayırması üzrə mütəxəssislər', 'Beading - experts', 'Experts on manufacture of products made of beads', 'Бисероплетение - специалисты', 'Люди, участвующие в  изготовлении изделий из бисера', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(141, 'Kağız incəsənəti üzrə mütəxəssislər', 'Kağızdan məmulatların qayırması üzrə mütəxəssislər', 'Paper art (origami, papier-mâché, etc.) - specialists', 'Experts on manufacture of products made of paper', 'Бумажное искусство (оригами, папье-маше и т.д.) - специалисты', 'Люди, участвующие в изготовлении изделий из бумаги', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(142, 'Güldançəkmə üzrə mütəxəssislər', 'Qabların boyalarla bəzədib bişirilməsi üzrə mütəxəssislər', 'Vase painters', 'Experts on painting vessels, followed by firing', 'Вазописцы', 'Люди, участвующие в росписи сосудов красками с последующим обжигом', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(143, 'Vitraj üzrə mütəxəssislər', 'Memarlıq tikilidəki qapı və ya pəncərə yerinin (yarı)şəffaf rəngli lövhələrlə doldurulması üzrə mütəxəssislər', 'Stained glass - experts', 'Experts on filling colored (semi)transparent plates (glasses, stones) into the aperture of an architectural construction', 'Витраж - специалисты', 'Люди, участвующие в заполнении цветными (полу)прозрачными плитами (стёклами, камнями) проёма в архитектурном сооружении', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(144, 'Vokal incəsənəti üzrə mütəxəssislər / Müğənnilər', 'Vokal əsərlərin yaradılması (ifası) üzrə mütəxəssislər', 'Singers', 'Experts on creation or performance of vocal works (songs)', 'Певцы', 'Люди, участвующие в создании (исполнении) вокальных произведений (песен)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(145, 'Yandırma üsulu ilə naxış açma üzrə mütəxəssislər', 'Bərk qızmış iynə vasitəsilə orqanik materialın (fanerin, kağızın, dərinin, parçanın) bəzədilməsi üzrə mütəxəssislər', 'Burning (pyrography) - experts', 'Experts on decorating an organic material (plywood, paper, leather, fabric) with an illustration by using a red-hot needle or a fine flame', 'Выжигание (пирография) - специалисты', 'Люди, участвующие в украшении органического материала (фанеры,  бумаги, кожи, ткани) рисунком, при помощи раскалённой иглы', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(146, 'Naxış tikmə üzrə mütəxəssislər', 'Tikilmiş (calanmış) saplar vasitəsilə materialların (parçanın, dərinin) naxışlarla bəzədilməsi üzrə mütəxəssislər', 'Embroidery - experts', 'Experts on decorating a material (textile, leather) with patterns, using the sewn threads', 'Вышивание - специалисты', 'Люди, участвующие в украшении узорами материалов (ткани, кожи), при помощи вшиваемых нитей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(147, 'Qravyura üzrə mütəxəssislər', 'Çap ottisklərdə (basmalarda) təsvirlərin yaradılması üzrə mütəxəssislər', 'Engravers', 'Experts on creation of images in print impressions', 'Гравюрщики', 'Люди, участвующие в создании изображений в печатных оттисках', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(148, 'Dizaynerlər', 'Obyektlərin insanın utilitar (tətbiqi) və estetik ehtiyaclarına uyğunlaşdırılması üzrə mütəxəssislər', 'Designers', 'Experts on matching objects to utilitarian and aesthetic needs of man', 'Дизайнеры', 'Люди, участвующие в привидении соответствия объектов  утилитарным и эстетическим потребностям человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(149, 'Rəssamlar (naqqaşlıq, naxışlıq, qrafika və s. üzrə mütəxəssislər)', 'Hər hansı səth üzərinə boyaların vurulması yolu ilə təsvirlərin yaradılması', 'Artists', 'Experts on creation of images by applying paint on any surface', 'Художники', 'Люди, участвующие в создании изображений посредством нанесения красок на какую-либо поверхность', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(150, 'İxtiraçılar', 'Yeniliklərin kəşf edilməsi üzrə mütəxəssislər', 'Inventors', 'Experts on invention of new', 'Изобретатели', 'Люди, участвующие в изобретении нового', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(151, 'Kinematoqraflar', 'Hərəkət edən təsvirlərin yaradılması üzrə mütəxəssislər', 'Cinematography - experts', 'Experts on creation of motion pictures', 'Кинематографы', 'Люди, участвующие в создании движущихся изображений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(152, 'Xalçalıq üzrə mütəxəssislər', 'Xalçaların istehsalı üzrə mütəxəssislər', 'Carpet weavers', 'Experts on manufacture of carpets', 'Ковроткачи', 'Люди, участвующие в производстве ковров', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(153, 'Aşbazlar', 'Qidanın hazırlanması üzrə mütəxəssislər', 'Cooks', 'Experts on cooking', 'Кулинары / Повара', 'Люди, участвующие в приготовлении пищи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(154, 'Tökmə üzrə mütəxəssislər', 'Tökmə qəlibə maye materialın (metalın, ərintinin, plastmassanın və ilaxır kimi şeylrəin) doldurulması və onun bərkilməsi yolu ilə əşyaların hazırlanması üzrə mütəxəssislər', 'Casters', 'Experts on making items by filling a mold with liquid materials (metals, alloys, plastics and so on), followed by their solidification', 'Литейщики', 'Люди, участвующие в изготовлении предметов, путём заполнения литейной формы жидким материалом (металлом, сплавом, пластмассой и т. п.) с последующим его затвердеванием', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(155, 'Mozaika üzrə mütəxəssislər', 'Bİr səthin üzərində əlvan materialların (daşların, smaltanın, keramik lövhələrin) quraşdırılması, yığılması və bərkidilməsi yolu ilə təsvirlərin formalaşdırılması üzrə mütəxəssislər', 'Mosaic - experts', 'Experts on formation of images by arranging, composition and fixing colored materials (stones, glazes, ceramic tiles) onto a surface', 'Мозаика - специалисты', 'Люди, участвующие в формировании изображения посредством компоновки, набора и закрепления на поверхности разноцветных материалов (камней, смальты, керамических плиток)', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(156, 'Musiqiçilər', 'Musiqi (audio) əsərlərin yaradılması (ifası) üzrə mütəxəssislər', 'Musicians', 'Experts on creation and playing music (audio works)', 'Музыканты', 'Люди, участвующие в создании (воспроизведении) музыкальных (аудио) произведений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(157, 'Multimediya üzrə mütəxəssislər', 'Multimedia (video-audio-təsviri) əsərlərinin yaradılması (ifası) üzrə mütəxəssislər', 'Multimedia art - experts', 'Experts on creation and playing multimedia (video audio-visual works)', 'Мультимедийное искусство  - специалисты', 'Люди, участвующие в создании (воспроизведении) мультимедийных (видео-ауди-изобразительных) произведений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(158, 'Bərbərlər', 'Saç düzülüşlərinin yaradılması üzrə mütəxəssislər', 'Hairdressers', 'Experts on creation of hairstyles', 'Парикмахеры', 'Люди, участвующие в создании причёсок', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(159, 'Yazıçılar', 'Yazı əsərlərinin yaradılması üzrə mütəxəssislər', 'Writers', 'Experts on creation of writings (written works)', 'Писатели', 'Люди, участвующие в создании письменного произведения', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(160, 'Hörmə (hörülmə) / Toxuma (toxunma) / Krujeva üzrə mütəxəssislər', 'Bərkliyi daha az olan bir və ya bir neçə sapdan (lentdən) daha bərk məmulatların hazırlanması üzrə mütəxəssislər', 'Weaving / Knitting / Lace - experts', 'Experts on manufacturing stronger products from less resistant yarn(s)', 'Плетение / Вязание / Кружево - специалисты', 'Об изготовлении более прочных изделий из одной или нескольких менее прочных нитей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(161, 'Şairlər', 'Ritm ilə ölçülən kəsiklərə bölünmə ilə təşkil olunmuş bədii nitqin yaradılması (ifası) üzrə mütəxəssislər', 'Poets', 'Experts on composition and performance of speech, divided by rhythmically commensurate segments', 'Поэты', 'Люди, участвующие в сочинении (воспроизведении) художественной речи, организованной делением на ритмически соизмеримые отрезки', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(162, 'Əyirmə (əyrilmə) üzrə mütəxəssislər', 'Ayrı-ayrı liflərin uzununa üst-üstə yığılması və spiralvari eşməsi yolu ilə uzun və bərk sapın hazırlanması üzrə mütəxəssislər', 'Spinners', 'Experts on manufacture of long and strong thread through the longitudinal folding and twisting spiral of individual fibers', 'Прядильщики', 'Люди, участвующие в изготовлении длинной и прочной нити, путём продольного складывания и спирального скручивания отдельных волокон', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(163, 'Oyma üzrə mütəxəssislər', 'Daha bərk və iti material ilə digər materialın (taxtanın, sümüyün, metalın) bədii emalı üzrə mütəxəssislər', 'Thread - experts', 'Experts on artistic working of the material (wood, bone, metal) with an acute, more hard material', 'Резьба - специалисты', 'Люди, участвующие в художественной обработки материала (дерева, кости, металла) острым, более твёрдым материалом', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(164, 'Bağçılıq-parkçılıq üzrə mütəxəssislər', 'Bağçaların, parkların və digər yaşıllaşdırılan ərazilərin yaradılması üzrə mütəxəssislər', 'Landscape art - experts', 'Experts on creation of gardens, parks and other vegetated areas', 'Садово-парковое искусство - специалисты', 'Люди, участвующие в создании садов, парков и других озеленяемых территорий', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(165, 'Skrapbukinq', 'Foto-albomların yaradılması və bəzədilməsi üzrə mütəxəssislər', 'Scrapbooking - experts', 'Experts on manufacture and design of photo albums', 'Скрапбукинг - специалисты', 'Люди, участвующие в изготовлении и оформлении фотоальбомов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(166, 'Heykəltəraşlar', 'Həcmi formada təsvirlərin yaradılması üzrə mütəxəssislər', 'Sculptures', 'Experts on creation of images in bulk form', 'Скульптуры', 'Люди, участвующие в создании изображений в объёмной форме', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(167, 'Əşyaların yaradılması (təkmilləşdirilməsi) üzrə mütəxəssislər', 'Əşyaların yaradılması və ya təmilləşdirilməsi üzrə mütəxəssislər', 'The creators (improvers) of items', 'Experts on creation or improvement of the items', 'Создатели (улучшатели) предметов', 'Люди, участвующие в создании или усовершенствовании предметов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(168, 'Stilistlər / Vizajıstlər', 'Zahirin (imicin) bəzədilməsi və qüsurların kamuflyaj edilməsi üzrə mütəxəssislər', 'Stylists / Makeup Artists', 'Experts on decorating the exterior (image) and camouflage flaws', 'Стилисты / Визажисты', 'Люди, участвующие в украшении внешности (имиджа) и камуфлировании изъянов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(169, 'Rəqqaslar / Xoreoqrafiya üzrə mütəxəssislər', 'Rəqslərin yaradılması (ifası) üzrə mütəxəssislər', 'Dancers', 'Experts on creation and performance of dance', 'Танцоры', 'Люди, участвующие в создании (исполнении) танцев', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(170, 'Tele-radio-internet yayım üzrə mütəxəssislər', 'Tele-radio-internet verilişlərin yaradılması (verilməsi) üzrə mütəxəssislər', 'TV, radio, Internet broadcasting - experts', 'Experts on creation of programs for TV, radio, Internet broadcasts', 'Теле-радио-интернет вещание - специалисты', 'Люди, участвующие в создании передач для теле-радио-интернет вещаний', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(171, 'Toxucular', 'Parçanın istehsalı üzrə mütəxəssislər', 'Weavers', 'Experts on production of textile', 'Ткачи', 'Люди, участвующие в производстве ткани', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(172, 'Floristika üzrə mütəxəssislər', 'Çiçəklərdən və digər bitki ünsürlərindən kompozisiyaların (interyerin, gül dəstələrinin) yaradılması üzrə mütəxəssislər', 'Florists', 'Experts on creation of compositions (interior, bouquets) made of flowers and other plant components', 'Флористы', 'Люди, участвующие в создании композиций (интерьера, букетов) из цветов и других растительных элементов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(173, 'Fotoqrafçılar', 'Foto-şəkillərin yaradılması üzrə mütəxəssislər', 'Photographers', 'Experts on creation of photos', 'Фотографы', 'Люди, участвующие в создании фотоснимков', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(174, 'Dərinin bədii emalı üzrə mütəxəssislər', 'Dəridən olan məmulatların bədii emalı üzrə mütəxəssislər', 'Leather crafting - experts', 'Experts on manufacture of leather goods', 'Художественная обработка кожи - специалисты', 'Люди, участвующие в изготовлении предметов из кожи', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(175, 'Əyləncə üzrə mütəxəssislər / Sehrbazlar', 'Əyləncə tamaşalarının yaradılması üzrə mütəxəssislər', 'Show / Circus / Entertainment - experts', 'Experts on creation of entertaining shows', 'Цирковое (развлекательное) искусство - специалисты', 'Люди, участвующие в создании развлекательных представлений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(176, 'Tikmə üzrə mütəxəssislər', 'Materiallardan (parçadan, dəridən) sırıq və tikişaraları vasitəsilə məmulatların hazırlanması üzrə mütəxəssislər', 'Tailoring - experts', 'Experts on manufacture of goods from the material (textile, leather) by means of seams and stitches', 'Шитьё - специалисты', 'Люди, участвующие в изготовлении изделия из материала (ткани, кожи), при помощи стежков и швов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(177, 'Zərgərlər', 'Zərgərlik materiallarından əşyaların hazırlanması üzrə mütəxəssislər', 'Jewellers', 'Experts on manufacture of goods made of precious materials', 'Ювелиры', 'Люди, участвующие в изготовлении предметов из драгоценных материалов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 5),
(178, 'Anatomlar (insan vücudu üzrə)', 'İnsan vücudu üzrə mütəxəssislər', 'Human anatomists', 'Experts on organizm of human body', 'Анатомы человека', 'Человек, владеющий широкими знаниями об организме человека', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(179, 'Astronomlar', 'Göy cisimləri üzrə mütəxəssislər', 'Astronomers', 'Experts on celestial bodies', 'Астрономы', 'Человек, владеющий широкими знаниями о небесных телах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(180, 'Botaniklər', 'Bitki orqanizmi üzrə mütəxəssislər', 'Botanists', 'Experts on the organizm of plants', 'Ботаники', 'Человек, владеющий широкими знаниями об организме растений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(181, 'Coğrafiya (fiziki) üzrə mütəxəssislər', 'Yer kürəsinin coğrafi qişası və onun tərkib hissələri üzrə mütəxəssislər', 'Geographers (on physical geography)', 'The geographical cover of the Earth and its structural parts', 'Географы (по физической географии)', 'Человек, владеющий широкими знаниями о географической оболочке Земли и её структурных частей', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(182, 'Geodeziyaçılar', 'Yer kürəsinin fiquru, cazibə sahəsi, fırlanma parametrləri və onların vaxtla dəyişiklikləri üzrə mütəxəssislər', 'Geodesist / Land-surveyor', 'Experts on figure, the gravitational field, rotation parameters of the Earth and their changes over time', 'Геодезики', 'Человек, владеющий широкими знаниями о фигуре, гравитационное поле, параметрах вращения Земли и их изменениях во времени', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(183, 'Geoloqlar', 'Yer kürəsinin tərkibi üzrə mütəxəssislər', 'Geologists', 'Experts on structure of the Earth', 'Геологи', 'Человек, владеющий широкими знаниями о строении Земли', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(184, 'Zooloqlar', 'Heyvanların orqanizmləri üzrə mütəxəssislər', 'Zoologists', 'Experts on the organizm of animals', 'Зоологи', 'Человек, владеющий широкими знаниями об организме животных', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(185, 'Məntiq üzrə mütəxəssislər', 'Mühakimə, sübut və təkzib etmə üsulları üzrə mütəxəssislər', 'Logic - experts', 'Experts on methods of reasoning, proof and refutation', 'Логика - специалисты', 'Человек, владеющий широкими знаниями о способах рассуждения, доказательств и опровержений', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(186, 'Riyaziyyatçılar', 'Hesablanma əməliyyatları, obyektlərin ölçülməsi və formalarının təsviri üzrə mütəxəssislər', 'Mathematicians', 'Experts on operations of counting, measuring and describing the shape of objects', 'Математики', 'Человек, владеющий широкими знаниями об операциях подсчёта, измерения и описания формы объектов', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(187, 'Statistika üzrə mütəxəssislər', 'Kütləvi kəmiyyət və keyfiyyət məlumatlarının yığılması, ölçülməsi və təhlili üzrə mütəxəssislər', 'Statistics - experts', 'Experts on collection, measurement and analysis of massive quantitative or qualitative data', 'Статистика - специалисты', 'Человек, владеющий широкими знаниями о сборе, измерении и анализе массовых количественных или качественных данных', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(188, 'Fiziklər', 'Təbiətin, materiyanın ümumi qanunları, onların strukturu və hərəkəti üzrə mütəxəssislər', 'Physicist', 'Experts on general laws of nature, matter, its structure and movement', 'Физики', 'Человек, владеющий широкими знаниями об общих законах природы, материи, её структуре и движении', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(189, 'Kimyaçılar', 'Maddələr, onların tərkibləri, quruluşu, xüsusiyyətləri üzrə mütəxəssislər', 'Chemist', 'Experts on substances, their composition, structure, properties', 'Химики', 'Человек, владеющий широкими знаниями о веществах, их составе, строении, свойствах', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(190, 'Digər mütəxəssislər və xadimlər', 'Unudulmuş və yeni sahələrin mütəxəssisləri', 'Experts in other fields', 'Experts on neglected and new areas', 'Специалисты и деятели в других областях', 'Деятели в редких областях', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 2, 0, '', 6),
(191, 'Biznes', '', 'Business', '', 'Бизнес', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(192, 'Kağız / Karton', '', 'Paper / Cardboard', '', 'Бумага / Картон', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(193, 'Məişət / Həyat', '', 'Mode of life (living) / Life', '', 'Быт / Жизнь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(194, 'Video / Kino', '', 'Videos / Films', '', 'Видео / Кино', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(195, 'Su', '', 'Water', '', 'Вода', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(196, 'Hərbi texnika', '', 'Military equipment', '', 'Военная техника', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(197, 'Ölkələr', '', 'Country / State', '', 'Государство', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(198, 'Dekorasiyalar', '', 'Scenery', '', 'Декорации', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(199, 'Pul', '', 'Money', '', 'Деньги', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(200, 'Taxta məmulatları', '', 'Wood', '', 'Деревянные предметы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(201, 'Uşaqlar', '', 'Children', '', 'Дети', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(202, 'Dizayn', '', 'Designing', '', 'Дизайн', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(203, 'Ev', '', 'House', '', 'Дом', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(204, 'Zinət əşyaları', '', 'Jewelry', '', 'Драгоценности', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(205, 'Qida', '', 'Food', '', 'Еда', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(206, 'Qadınlar', '', 'Women', '', 'Женщины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(207, 'Heyvanlar', '', 'Animals', '', 'Животные', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(208, 'Torpaq', '', 'Land', '', 'Земля', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(209, 'Oyunlar', '', 'Games', '', 'Игры', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(210, 'İxtiralar', '', 'Invention', '', 'Изобретения', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(211, 'İnternet', '', 'Internet', '', 'Интернет', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(212, 'Tarix', '', 'History', '', 'История', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(213, 'Kitablar / Jurnallar / Məqalələr', '', 'Books / Magazines', '', 'Книги / Журналы / Статьи', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(214, 'Dəri məmulatları', '', 'Leather goods', '', 'Кожаные изделия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(215, 'Kompüter / Hesablama maşınları', '', 'Computers', '', 'Компьютер / Вычислительные машины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(216, 'Dərmanlar / Sağlamlıq', '', 'Treating', '', 'Лекарства / Здоровье', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(217, 'Sevgi (məhəbbət)', '', 'Love', '', 'Любовь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(218, 'Makiyaj', '', 'Makeup', '', 'Макияж', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(219, 'Massaj / Fizioteropiya', '', 'Massage / Physiotherapy', '', 'Массаж / Физиотерапия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(220, 'Metal', '', 'Metal', '', 'Металл', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(221, 'Moda', '', 'Fashion', '', 'Мода', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(222, 'Kişilər', '', 'Men', '', 'Мужчины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(223, 'Musiqi', '', 'Music', '', 'Музыка', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(224, 'Cizgi filmləri', '', 'Cartoons', '', 'Мультики', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(225, 'Multimedia', '', 'Multimedia', '', 'Мультимедиа', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(226, 'Elm', '', 'Science', '', 'Наука', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(227, 'Müraciət (nitq, yazı, jestlər)', '', 'Address (speech, writing, gestures)', '', 'Обращение (речь, письмо, жесты)', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(228, 'Tədris / Təhsil / Tərbiyə', '', 'Study', '', 'Обучение / Учёба / Воспитание', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(229, 'Od (atəş)', '', 'Fire', '', 'Огонь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(230, 'Paltar / Trikotaj', '', 'Clothes', '', 'Одежда / Трикотаж', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(231, 'Təşkilatlar (qurumlar)', '', 'Organization', '', 'Организация', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(232, 'Ov', '', 'Hunting', '', 'Охота', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(233, 'Mühafizə / Təhlükəsizlik', '', 'Guarding / Protection', '', 'Охрана / Защита', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(234, 'Mağnılar', '', 'Songs', '', 'Песни', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(235, 'Plastmassa', '', 'Plastic', '', 'Пластмасса', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(236, 'Hava', '', 'Weather', '', 'Погода', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(237, 'Siyasət', '', 'Policy', '', 'Политика', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(238, 'Tikililər (binalar, körpülər ...)', '', 'Buildings', '', 'Постройки (здания, мосты …)', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(239, 'Qab-qacaq', '', 'Dishes', '', 'Посуда', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(240, 'Hüquq', '', 'Law', '', 'Право', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(241, 'Bayramlar / Tədbirlər', '', 'Holidays / Events', '', 'Праздники / Мероприятия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(242, 'Təbiət', '', 'Nature', '', 'Природа', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(243, 'Saç düzümü', '', 'Haircut', '', 'Причёска', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(244, 'Proqramlar (kompüter proqramları)', '', 'Software', '', 'Программы (компьютерные)', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0);
INSERT INTO `categories` (`id`, `catNameAz`, `catInfoAz`, `catNameEn`, `catInfoEn`, `catNameRu`, `catInfoRu`, `createDate`, `lastUpdate`, `lastVideoAddDate`, `deleted`, `deleteDate`, `deleteUserId`, `questionId`, `createUserId`, `createUserIP`, `catGroupId`) VALUES
(245, 'İstehsalat / Yaradıcılıq', '', 'Production / Creation', '', 'Производство / Создание', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(246, 'İş', '', 'Work', '', 'Работа', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(247, 'Bitki', '', 'Plants', '', 'Растения', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(248, 'Rezin', '', 'Rubber', '', 'Резина', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(249, 'Reklam', '', 'Advertisement', '', 'Реклама', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(250, 'Din', '', 'Religions', '', 'Религия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(251, 'Təmir', '', 'Repairing', '', 'Ремонт', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(252, 'Şəkil', '', 'Painting / Drawing', '', 'Рисование / картины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(253, 'Balıq ovu', '', 'Fishing', '', 'Рыбалка', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(254, 'Bağca', '', 'Garden', '', 'Сад / Огород', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(255, 'Özünün inkişafı / Psixologiya', '', 'Self-development / Psychology', '', 'Саморазвитие / Психология', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(256, 'Fövqal-qabiliyyətlər / Ekstrasensorika', '', 'Super-abilities / Extrasensorics', '', 'Сверхспособности / Экстрасенсорика', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(257, 'Rabitə', '', 'Communication', '', 'Связь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(258, 'Seks', '', 'Sex', '', 'Секс', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(259, 'Kənd təsərrüfatı', '', 'Agriculture', '', 'Сельское хозяйство', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(260, 'Heykəllər / Monumentlər', '', 'Sculptures / Monuments', '', 'Скульптуры / Монументы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(261, 'Yuxu', '', 'Dream', '', 'Сон', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(262, 'İdman', '', 'Sports', '', 'Спорт', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(263, 'Şüşə', '', 'Glass', '', 'Стекло', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(264, 'Stil', '', 'Style', '', 'Стиль', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(265, 'Şeirlər', '', 'Poems', '', 'Стихи', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(266, 'Ölkələr', '', 'Countries', '', 'Страны', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(267, 'Rəqslər', '', 'Dancing', '', 'Танцы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(268, 'Tele-radio-internet verilişlər', '', 'TV,  radio, internet programs', '', 'Теле-радио-интернет программы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(269, 'Telefon', '', 'Phones', '', 'Телефон', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(270, 'Texnika / Mexanizmlər (qurğular)', '', 'Engineering / Mechanisms', '', 'Техника / Механизмы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(271, 'Ənənələr', '', 'Traditions', '', 'Традиции / Ритуалы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(272, 'Nəqliyyat', '', 'Transport', '', 'Транспорт', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(273, 'Tryuklar (hoqqalar) / Tamaşalar', '', 'Tricks / Show', '', 'Трюки (фокусы) / Представления', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(274, 'Xidmət', '', 'Services', '', 'Услуги', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(275, 'Foto-şəkillər', '', 'Photos', '', 'Фото', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(276, 'İnsan / Camaat', '', 'Man / People', '', 'Человек / Люди', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(277, 'Rəqəmlər / Ölçü', '', 'Numbers / Measures', '', 'Числа / Мера', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(278, 'Təmizlik', '', 'Cleanliness', '', 'Чистота / Уборка', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(279, 'Enerji', '', 'Energy', '', 'Энергия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(280, 'Dillər', '', 'Languages', '', 'Языки', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(281, 'Digər', '', 'Other', '', 'Другое', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 3, 0, '', 0),
(282, 'Biznes', '', 'Business', '', 'Бизнес', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(283, 'Kağız / Karton', '', 'Paper / Cardboard', '', 'Бумага / Картон', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(284, 'Məişət / Həyat', '', 'Mode of life (living) / Life', '', 'Быт / Жизнь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(285, 'Video / Kino', '', 'Videos / Films', '', 'Видео / Кино', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(286, 'Su', '', 'Water', '', 'Вода', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(287, 'Hərbi texnika', '', 'Military equipment', '', 'Военная техника', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(288, 'Ölkələr', '', 'Country / State', '', 'Государство', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(289, 'Dekorasiyalar', '', 'Scenery', '', 'Декорации', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(290, 'Pul', '', 'Money', '', 'Деньги', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(291, 'Taxta məmulatları', '', 'Wood', '', 'Деревянные предметы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(292, 'Uşaqlar', '', 'Children', '', 'Дети', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(293, 'Dizayn', '', 'Designing', '', 'Дизайн', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(294, 'Ev', '', 'House', '', 'Дом', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(295, 'Zinət əşyaları', '', 'Jewelry', '', 'Драгоценности', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(296, 'Qida', '', 'Food', '', 'Еда', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(297, 'Qadınlar', '', 'Women', '', 'Женщины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(298, 'Heyvanlar', '', 'Animals', '', 'Животные', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(299, 'Torpaq', '', 'Land', '', 'Земля', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(300, 'Oyunlar', '', 'Games', '', 'Игры', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(301, 'İxtiralar', '', 'Invention', '', 'Изобретения', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(302, 'İnternet', '', 'Internet', '', 'Интернет', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(303, 'Tarix', '', 'History', '', 'История', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(304, 'Kitablar / Jurnallar / Məqalələr', '', 'Books / Magazines', '', 'Книги / Журналы / Статьи', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(305, 'Dəri məmulatları', '', 'Leather goods', '', 'Кожаные изделия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(306, 'Kompüter / Hesablama maşınları', '', 'Computers', '', 'Компьютер / Вычислительные машины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(307, 'Dərmanlar / Sağlamlıq', '', 'Treating', '', 'Лекарства / Здоровье', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(308, 'Sevgi (məhəbbət)', '', 'Love', '', 'Любовь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(309, 'Makiyaj', '', 'Makeup', '', 'Макияж', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(310, 'Massaj / Fizioteropiya', '', 'Massage / Physiotherapy', '', 'Массаж / Физиотерапия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(311, 'Metal', '', 'Metal', '', 'Металл', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(312, 'Moda', '', 'Fashion', '', 'Мода', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(313, 'Kişilər', '', 'Men', '', 'Мужчины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(314, 'Musiqi', '', 'Music', '', 'Музыка', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(315, 'Cizgi filmləri', '', 'Cartoons', '', 'Мультики', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(316, 'Multimedia', '', 'Multimedia', '', 'Мультимедиа', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(317, 'Elm', '', 'Science', '', 'Наука', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(318, 'Müraciət (nitq, yazı, jestlər)', '', 'Address (speech, writing, gestures)', '', 'Обращение (речь, письмо, жесты)', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(319, 'Tədris / Təhsil / Tərbiyə', '', 'Study', '', 'Обучение / Учёба / Воспитание', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(320, 'Od (atəş)', '', 'Fire', '', 'Огонь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(321, 'Paltar / Trikotaj', '', 'Clothes', '', 'Одежда / Трикотаж', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(322, 'Təşkilatlar (qurumlar)', '', 'Organization', '', 'Организация', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(323, 'Ov', '', 'Hunting', '', 'Охота', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(324, 'Mühafizə / Təhlükəsizlik', '', 'Guarding / Protection', '', 'Охрана / Защита', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(325, 'Mağnılar', '', 'Songs', '', 'Песни', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(326, 'Plastmassa', '', 'Plastic', '', 'Пластмасса', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(327, 'Hava', '', 'Weather', '', 'Погода', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(328, 'Siyasət', '', 'Policy', '', 'Политика', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(329, 'Tikililər (binalar, körpülər ...)', '', 'Buildings', '', 'Постройки (здания, мосты …)', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(330, 'Qab-qacaq', '', 'Dishes', '', 'Посуда', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(331, 'Hüquq', '', 'Law', '', 'Право', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(332, 'Bayramlar / Tədbirlər', '', 'Holidays / Events', '', 'Праздники / Мероприятия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(333, 'Təbiət', '', 'Nature', '', 'Природа', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(334, 'Saç düzümü', '', 'Haircut', '', 'Причёска', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(335, 'Proqramlar (kompüter proqramları)', '', 'Software', '', 'Программы (компьютерные)', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(336, 'İstehsalat / Yaradıcılıq', '', 'Production / Creation', '', 'Производство / Создание', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(337, 'İş', '', 'Work', '', 'Работа', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(338, 'Bitki', '', 'Plants', '', 'Растения', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(339, 'Rezin', '', 'Rubber', '', 'Резина', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(340, 'Reklam', '', 'Advertisement', '', 'Реклама', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(341, 'Din', '', 'Religions', '', 'Религия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(342, 'Təmir', '', 'Repairing', '', 'Ремонт', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(343, 'Şəkil', '', 'Painting / Drawing', '', 'Рисование / картины', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(344, 'Balıq ovu', '', 'Fishing', '', 'Рыбалка', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(345, 'Bağca', '', 'Garden', '', 'Сад / Огород', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(346, 'Özünün inkişafı / Psixologiya', '', 'Self-development / Psychology', '', 'Саморазвитие / Психология', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(347, 'Fövqal-qabiliyyətlər / Ekstrasensorika', '', 'Super-abilities / Extrasensorics', '', 'Сверхспособности / Экстрасенсорика', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(348, 'Rabitə', '', 'Communication', '', 'Связь', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(349, 'Seks', '', 'Sex', '', 'Секс', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(350, 'Kənd təsərrüfatı', '', 'Agriculture', '', 'Сельское хозяйство', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(351, 'Heykəllər / Monumentlər', '', 'Sculptures / Monuments', '', 'Скульптуры / Монументы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(352, 'Yuxu', '', 'Dream', '', 'Сон', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(353, 'İdman', '', 'Sports', '', 'Спорт', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(354, 'Şüşə', '', 'Glass', '', 'Стекло', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(355, 'Stil', '', 'Style', '', 'Стиль', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(356, 'Şeirlər', '', 'Poems', '', 'Стихи', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(357, 'Ölkələr', '', 'Countries', '', 'Страны', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(358, 'Rəqslər', '', 'Dancing', '', 'Танцы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(359, 'Tele-radio-internet verilişlər', '', 'TV,  radio, internet programs', '', 'Теле-радио-интернет программы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(360, 'Telefon', '', 'Phones', '', 'Телефон', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(361, 'Texnika / Mexanizmlər (qurğular)', '', 'Engineering / Mechanisms', '', 'Техника / Механизмы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(362, 'Ənənələr', '', 'Traditions', '', 'Традиции / Ритуалы', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(363, 'Nəqliyyat', '', 'Transport', '', 'Транспорт', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(364, 'Tryuklar (hoqqalar) / Tamaşalar', '', 'Tricks / Show', '', 'Трюки (фокусы) / Представления', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(365, 'Xidmət', '', 'Services', '', 'Услуги', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(366, 'Foto-şəkillər', '', 'Photos', '', 'Фото', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(367, 'İnsan / Camaat', '', 'Man / People', '', 'Человек / Люди', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(368, 'Rəqəmlər / Ölçü', '', 'Numbers / Measures', '', 'Числа / Мера', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(369, 'Təmizlik', '', 'Cleanliness', '', 'Чистота / Уборка', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(370, 'Enerji', '', 'Energy', '', 'Энергия', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(371, 'Dillər', '', 'Languages', '', 'Языки', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0),
(372, 'Digər', '', 'Other', '', 'Другое', '', '2015-03-30 16:39:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 4, 0, '', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

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
  `confirmed` tinyint(1) NOT NULL DEFAULT '1',
  `confirmUserId` int(11) NOT NULL,
  `confirmUserIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `userId` int(11) NOT NULL COMMENT 'commenter Id',
  `userIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `commentLastUpdate` datetime NOT NULL,
  `commentDate` datetime NOT NULL,
  `lastUpdateUserId` int(11) NOT NULL,
  `lastUpdateUserIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folderName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createDate` datetime NOT NULL,
  `createUserId` int(11) NOT NULL,
  `createUserIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastUpdateUserId` int(11) NOT NULL,
  `lastUpdate` datetime NOT NULL,
  `lastVideoAddUserId` int(11) NOT NULL,
  `lastVideoAddDate` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleteUserId` int(11) NOT NULL,
  `deleteUserIP` int(11) NOT NULL,
  `deleteDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `userIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `messageDate` datetime NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `fileName` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'attached file',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` tinyint(4) NOT NULL,
  `question` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`) VALUES
(1, 'what'),
(2, 'who'),
(3, 'how'),
(4, 'why');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE IF NOT EXISTS `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `userIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `searchDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fatherName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birthDate` date NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `registerDate` datetime NOT NULL,
  `registerIP` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastLoginDate` datetime NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `profession` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `interests` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleteDate` datetime NOT NULL,
  `deleteUserId` int(11) NOT NULL,
  `contentChangeCount` int(11) NOT NULL COMMENT 'Sayt kontentini dəyişdirmə sayı',
  `profileViewCount` int(11) NOT NULL COMMENT 'İstifadəçilərin profillərinə baxma sayı',
  `linksAddedCount` int(11) NOT NULL COMMENT 'Əlavə etdiyi video linklərinin sayı',
  `getEmailOnVideoComment` tinyint(1) NOT NULL DEFAULT '0',
  `videoWatchCount` int(11) NOT NULL COMMENT 'Baxdığı videoların sayı',
  `videoLikeCount` int(11) NOT NULL COMMENT 'Bəyəndiyi videoların sayı',
  `videoDislikeCount` int(11) NOT NULL COMMENT 'Bəyənmədiyi videoların sayı',
  `videoCommentCount` int(11) NOT NULL COMMENT 'Şərh etdiyi videoların sayı',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `password`, `name`, `surname`, `fatherName`, `birthDate`, `gender`, `email`, `registerDate`, `registerIP`, `lastLoginDate`, `lang`, `profession`, `interests`, `phone`, `notes`, `deleted`, `deleteDate`, `deleteUserId`, `contentChangeCount`, `profileViewCount`, `linksAddedCount`, `getEmailOnVideoComment`, `videoWatchCount`, `videoLikeCount`, `videoDislikeCount`, `videoCommentCount`) VALUES
(1, 'admin', 'admin', 'Admin', 'Adminovic', '', '0000-00-00', 1, '', '2015-03-12 11:31:00', '', '0000-00-00 00:00:00', '', '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `questionBit` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `info` text COLLATE utf8_unicode_ci NOT NULL,
  `categoryId` int(11) NOT NULL,
  `addUserId` int(11) NOT NULL,
  `addUserIP` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastUpdateUserId` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `deleteDate` datetime NOT NULL,
  `deleteUserId` int(11) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'by seconds',
  `tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'tags by comma',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
