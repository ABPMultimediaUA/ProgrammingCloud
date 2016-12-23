-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 23, 2016 at 11:36 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ProgrammingCloud-ABP`
--

-- --------------------------------------------------------

--
-- Table structure for table `Administrador`
--

CREATE TABLE `Administrador` (
  `Login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Administrador`
--

INSERT INTO `Administrador` (`Login`) VALUES
('aci10'),
('family'),
('irenita'),
('LPMP'),
('valen'),
('weli'),
('yisus');

-- --------------------------------------------------------

--
-- Table structure for table `Alumno`
--

CREATE TABLE `Alumno` (
  `Login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Alumno`
--

INSERT INTO `Alumno` (`Login`) VALUES
('danielbean'),
('jaimito'),
('JorgitoSI'),
('manja'),
('pelocho'),
('pplu'),
('pucho'),
('tess');

-- --------------------------------------------------------

--
-- Table structure for table `Alumno_Aula`
--

CREATE TABLE `Alumno_Aula` (
  `login_alu` varchar(20) NOT NULL,
  `id_aula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Alumno_Aula`
--

INSERT INTO `Alumno_Aula` (`login_alu`, `id_aula`) VALUES
('pplu', 1),
('pucho', 1),
('danielbean', 2),
('tess', 2),
('JorgitoSI', 3),
('manja', 3),
('jaimito', 4),
('pelocho', 4),
('danielbean', 5),
('jaimito', 5),
('JorgitoSI', 5),
('manja', 5),
('pelocho', 5),
('pplu', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Aula`
--

CREATE TABLE `Aula` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `Login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Aula`
--

INSERT INTO `Aula` (`id`, `nombre`, `Login`) VALUES
(1, 'lancasteroom', 'LPMP'),
(2, 'candelaroom', 'family'),
(3, 'poloroom', 'irenita'),
(4, 'ibanezroom', 'weli'),
(5, 'partyacademy', 'LPMP');

-- --------------------------------------------------------

--
-- Table structure for table `Aula_Curso`
--

CREATE TABLE `Aula_Curso` (
  `id_aula` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Aula_Curso`
--

INSERT INTO `Aula_Curso` (`id_aula`, `id_curso`) VALUES
(1, 1),
(1, 2),
(2, 3),
(5, 3),
(2, 4),
(3, 5),
(3, 6),
(5, 6),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Comprar`
--

CREATE TABLE `Comprar` (
  `fecha` date NOT NULL,
  `plazo` date NOT NULL,
  `id_pack` int(11) NOT NULL,
  `login_usuR` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Comprar`
--

INSERT INTO `Comprar` (`fecha`, `plazo`, `id_pack`, `login_usuR`) VALUES
('2016-12-07', '2017-05-08', 1, 'murka'),
('2016-12-08', '2017-02-08', 2, 'danielbean'),
('2016-12-02', '2017-05-03', 3, 'cerdicola'),
('2016-12-23', '2017-04-23', 4, 'jaimito'),
('2017-01-04', '2017-06-05', 5, 'pelocho'),
('2017-01-01', '2017-06-01', 6, 'manja');

-- --------------------------------------------------------

--
-- Table structure for table `Compra_Instituto`
--

CREATE TABLE `Compra_Instituto` (
  `fecha` date NOT NULL,
  `plazo` date NOT NULL,
  `nombre_insti` varchar(20) NOT NULL,
  `id_pack` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Compra_Instituto`
--

INSERT INTO `Compra_Instituto` (`fecha`, `plazo`, `nombre_insti`, `id_pack`) VALUES
('2016-12-01', '2018-01-01', 'Aula 12', 10),
('2016-12-01', '2017-12-01', 'Fake High School', 11),
('2017-02-15', '2017-10-16', 'Manolos House', 12),
('2016-12-08', '2017-07-09', 'UA', 9);

-- --------------------------------------------------------

--
-- Table structure for table `Curso`
--

CREATE TABLE `Curso` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` text NOT NULL,
  `nivel` int(11) NOT NULL,
  `tema` varchar(20) NOT NULL,
  `Login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Curso`
--

INSERT INTO `Curso` (`id`, `nombre`, `descripcion`, `nivel`, `tema`, `Login`) VALUES
(1, 'java basico', 'aprende java desde cero', 1, 'java', 'aci10'),
(2, 'como rapear en c++', 'conviertete en el rey de las rimas cmasmaseras', 3, 'c++', 'valen'),
(3, 'weedpython', 'aprende ha acer dibujos de cannabis con el tito yisus', 2, 'python', 'yisus'),
(4, 'java para avanzados', 'solo para putos amos programando', 5, 'java', 'LPMP'),
(5, 'web anti lujan', 'crea tu propia web fuera de los estandares establecidos por mora el tirano', 4, 'jacaScript', 'family'),
(6, 'arduino para papis', 'aprende a hacer robotitos en arduino, mejor que un niño de verdad', 5, 'arduino', 'irenita'),
(7, 'c para ton_ especial', 'pues eso, hasta yaros lo aprueba a la primera :DDD', 1, 'c', 'weli'),
(8, 'codeblox life', 'aprende la vida de codeblox desde cero.', 1, 'code block', 'aci10');

-- --------------------------------------------------------

--
-- Table structure for table `Curso_Leccion`
--

CREATE TABLE `Curso_Leccion` (
  `id_Curso` int(11) NOT NULL,
  `id_Leccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Curso_Leccion`
--

INSERT INTO `Curso_Leccion` (`id_Curso`, `id_Leccion`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16);

-- --------------------------------------------------------

--
-- Table structure for table `Curso_Pack`
--

CREATE TABLE `Curso_Pack` (
  `id_Curso` int(11) NOT NULL,
  `id_Pack` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Curso_Pack`
--

INSERT INTO `Curso_Pack` (`id_Curso`, `id_Pack`) VALUES
(1, 1),
(4, 1),
(5, 2),
(5, 3),
(7, 3),
(1, 4),
(2, 4),
(4, 4),
(1, 5),
(3, 5),
(4, 6),
(7, 9),
(2, 10),
(8, 10),
(7, 11),
(7, 12);

-- --------------------------------------------------------

--
-- Table structure for table `Ejercicio`
--

CREATE TABLE `Ejercicio` (
  `id` int(11) NOT NULL,
  `valoracion` int(11) DEFAULT NULL,
  `descripcion` text,
  `tema` varchar(20) DEFAULT NULL,
  `Login_usu` varchar(20) NOT NULL,
  `Login_ges` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ejercicio`
--

INSERT INTO `Ejercicio` (`id`, `valoracion`, `descripcion`, `tema`, `Login_usu`, `Login_ges`) VALUES
(1, NULL, NULL, NULL, 'aci10', 'aci10'),
(2, 5, 'bah', 'java', 'LPMP', 'aci10'),
(3, 4, NULL, 'javascript', 'pucho', 'valen'),
(4, 2, 'na na na na na na batmaaaaaan', 'javaScript', 'murka', 'yisus'),
(5, NULL, 'solo se que no se correr', NULL, 'pplu', 'aci10'),
(6, 3, NULL, 'c++', 'moky', 'valen'),
(7, NULL, NULL, 'arduino', 'JorgitoSI', 'yisus'),
(8, 2, NULL, NULL, 'LPMP', 'aci10'),
(9, 3, 'little pirate mouse princess xx baterella', 'c', 'LPMP', 'aci10'),
(10, NULL, NULL, 'css', 'danielbean', 'valen'),
(11, 3, 'de ejemplo', 'c++', 'manja', 'yisus'),
(12, 3, 'otro ejemplo', 'php', 'pelocho', 'valen'),
(13, 2, 'de ejemplos va la cosa', 'c', 'LPMP', 'valen'),
(14, 1, 'ejemplo ejemplo ejemplo', 'java', 'danielbean', 'aci10'),
(15, 5, 'no es un ejemplo', 'rubi', 'carahuevoa', 'yisus'),
(16, 1, 'esto si', 'javascript', 'pitufilla', 'aci10'),
(17, NULL, NULL, 'prolog', 'murka', 'yisus'),
(18, 3, NULL, 'java', 'moky', 'valen'),
(19, 1, NULL, 'php', 'pelocho', 'valen'),
(20, 3, 'no tan buen ejercicio', 'PHP', 'family', 'aci10'),
(21, 2, NULL, 'code block', 'pplu', 'aci10'),
(22, 5, NULL, 'prolog', 'Pralaralarala', 'valen'),
(23, 1, NULL, 'php', 'bluecross', 'aci10'),
(24, 2, NULL, 'c', 'pucho', 'yisus'),
(25, 3, NULL, 'c', 'JorgitoSI', 'aci10'),
(26, 4, NULL, 'rubi', 'bluecross', 'aci10'),
(27, 1, NULL, 'jacaScript', 'manja', 'valen'),
(28, 2, NULL, NULL, 'carahuevoa', 'aci10'),
(29, 11, 'la bomba', 'PHP', 'aci10', 'aci10'),
(31, 0, 'bumbaa', 'latumba', 'pucho', 'valen'),
(32, 0, 'bumbaa', 'latumba', 'pucho', 'valen'),
(33, 0, 'bumbaa', 'latumba', 'pucho', 'valen');

-- --------------------------------------------------------

--
-- Table structure for table `Free`
--

CREATE TABLE `Free` (
  `Login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Free`
--

INSERT INTO `Free` (`Login`) VALUES
('bluecross'),
('moky'),
('pitufilla'),
('tess');

-- --------------------------------------------------------

--
-- Table structure for table `Gestor`
--

CREATE TABLE `Gestor` (
  `Login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Gestor`
--

INSERT INTO `Gestor` (`Login`) VALUES
('aci10'),
('valen'),
('yisus');

-- --------------------------------------------------------

--
-- Table structure for table `Instituto`
--

CREATE TABLE `Instituto` (
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `mail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Instituto`
--

INSERT INTO `Instituto` (`nombre`, `direccion`, `mail`) VALUES
('Aula 12', 'al lado de la antigua', 'a12@gmail.com'),
('Fake High School', 'Calle Falsa 123', 'cf@gmail.com'),
('IES Miguel Hernandez', 'Calle caca', 'buuumba'),
('Manolos House', 'en el iris', 'mh@gmail.com'),
('UA', 'alicante 123', 'ua@alu.ua.es');

-- --------------------------------------------------------

--
-- Table structure for table `Ins_alu_prof`
--

CREATE TABLE `Ins_alu_prof` (
  `nombre_insti` varchar(20) NOT NULL,
  `login_prof` varchar(20) NOT NULL,
  `login_alu` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Ins_alu_prof`
--

INSERT INTO `Ins_alu_prof` (`nombre_insti`, `login_prof`, `login_alu`) VALUES
('Manolos House', 'family', 'manja'),
('UA', 'family', 'pplu'),
('Aula 12', 'irenita', 'pelocho'),
('Fake High School', 'irenita', 'pucho'),
('Fake High School', 'irenita', 'tess'),
('Aula 12', 'LPMP', 'danielbean'),
('Aula 12', 'LPMP', 'jaimito'),
('UA', 'LPMP', 'danielbean'),
('UA', 'LPMP', 'pelocho'),
('UA', 'LPMP', 'pucho'),
('Manolos House', 'weli', 'JorgitoSI');

-- --------------------------------------------------------

--
-- Table structure for table `Juego`
--

CREATE TABLE `Juego` (
  `id` int(11) NOT NULL,
  `url_serv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Juego`
--

INSERT INTO `Juego` (`id`, `url_serv`) VALUES
(1, 'cagoento_es'),
(2, 'askdfjañsgasj'),
(3, 'qwertwqr'),
(5, 'jajajajajjajajajajajajjajaja'),
(11, 'asfasd'),
(12, 'afdasf'),
(13, 'asdfasa'),
(14, 'sadfasd'),
(15, 'gasdfagasfad'),
(16, 'fasdfasf'),
(21, 'asfdasdf'),
(24, 'agasfasgasgf');

-- --------------------------------------------------------

--
-- Table structure for table `Leccion`
--

CREATE TABLE `Leccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `url_video` varchar(100) NOT NULL,
  `url_pdf` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Leccion`
--

INSERT INTO `Leccion` (`id`, `nombre`, `url_video`, `url_pdf`) VALUES
(1, 'variables en java', 'asdfasfd', 'asdgasfas'),
(2, 'condicionales', 'asdfgasf', 'asgdsafda'),
(3, 'bucles', 'asdgfasf', 'asdgasf'),
(4, 'clases', 'asdgasf', 'asfdgasfa'),
(5, 'variables 2', 'asdgfasgf', 'asdgfasf'),
(6, 'bucles for', 'asdgaf', 'asdgasf'),
(7, 'bucles while', 'asdfasfa', 'sfgasdas'),
(8, 'condicionales switch', 'asdfagst', 'asgasdfjkk'),
(9, 'estructuras', 'asdgajskf', 'ashdjgalñsjfkl'),
(10, 'diseño de bbdd', 'asdgfñlajksf', 'kasjdgalsñf'),
(11, 'memoria dinamica', 'askldñfgjaslñf', 'asjdgklasñfj'),
(12, 'memoria estatica', 'aksñdjfkadsñjgfklña', 'jasklgñajsdkñ'),
(13, 'cuda', 'jdaskflñjas', 'jfaksldfjasñ'),
(14, 'nvidia', 'jksdfla', 'jaksdflñjaksñfj'),
(15, 'hackeo1', 'ajfskdlñasjfk', 'jksladñfjklñ'),
(16, 'hackeo2', 'fjaskdlajlsñ', 'jkfasdlñjfaksñf'),
(17, 'sdsd', 'ddd', 'ddd'),
(19, 'LuaLua', 'a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `Leccion_Ejercicio`
--

CREATE TABLE `Leccion_Ejercicio` (
  `id_leccion` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Leccion_Ejercicio`
--

INSERT INTO `Leccion_Ejercicio` (`id_leccion`, `id_ejercicio`) VALUES
(1, 1),
(16, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(15, 5),
(3, 6),
(15, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(15, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(8, 16),
(9, 17),
(9, 18),
(10, 19),
(10, 20),
(11, 21),
(11, 22),
(12, 23),
(12, 24),
(13, 25),
(13, 26),
(14, 27),
(14, 28),
(15, 28);

-- --------------------------------------------------------

--
-- Table structure for table `NormalEj`
--

CREATE TABLE `NormalEj` (
  `id` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `respuesta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `NormalEj`
--

INSERT INTO `NormalEj` (`id`, `pregunta`, `respuesta`) VALUES
(7, 'que vino antes el huevo o la gallina?', 'el huevo'),
(8, 'justin bieber o gemeliers?', 'a la hoguera'),
(9, 'me quiere?', 'como amigo'),
(10, 'si tengo tres manzanas y me como dos, cual es la densidad de marte?', 'teniendo encuenta que es inversamente proporcional a la calidad de las rimas de valentin... infinito xD\r\n'),
(17, 'safdasfgdas', 'asfagasfa'),
(18, 'gasadfsgasf', 'agfhdgfafgadgha'),
(19, 'fsgadghhfagsf', 'jfghsdgd fg'),
(26, 'faggaafhagt', 'qrtqrqrqreqwrwq'),
(27, 'yrtuoqpuigs njnvj', 'uqioerpyufjdasññ'),
(28, 'jkfldasfjkñsdjñlas', 'nkcxvnjañj ncuia');

-- --------------------------------------------------------

--
-- Table structure for table `Noticias`
--

CREATE TABLE `Noticias` (
  `id` int(11) NOT NULL,
  `asunto` varchar(50) NOT NULL,
  `mensage` text NOT NULL,
  `login_admin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Noticias`
--

INSERT INTO `Noticias` (`id`, `asunto`, `mensage`, `login_admin`) VALUES
(1, 'fin de clases', 'el jueves es el ultimo dia chavales', 'LPMP'),
(2, 'modificaciones', 'realizaremos actualizaciones en el curso', 'aci10'),
(3, 'examen 1º trimestre', 'se suspende el examen del primer trimestre', 'weli'),
(4, 'examen 2º semestre', 'este sigue vigente', 'family'),
(5, 'fusion', 'este curso se fusionara con otro', 'aci10'),
(6, 'fision', 'es un curso demasiado largo, lo dividiremos en dos', 'yisus'),
(7, 'd', 'dd', 'family'),
(8, 'ggg', 'gggg', 'irenita'),
(10, 'ssss', 'dasdddd', 'family');

-- --------------------------------------------------------

--
-- Table structure for table `Noticias_Aula`
--

CREATE TABLE `Noticias_Aula` (
  `id_aula` int(11) NOT NULL,
  `id_noticia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Noticias_Aula`
--

INSERT INTO `Noticias_Aula` (`id_aula`, `id_noticia`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Noticia_Curso`
--

CREATE TABLE `Noticia_Curso` (
  `id_noticia` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Noticia_Curso`
--

INSERT INTO `Noticia_Curso` (`id_noticia`, `id_curso`) VALUES
(3, 2),
(1, 3),
(1, 6),
(4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Pack`
--

CREATE TABLE `Pack` (
  `id` int(11) NOT NULL,
  `descuento` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pack`
--

INSERT INTO `Pack` (`id`, `descuento`) VALUES
(1, 0),
(2, 5),
(3, 10),
(4, 15),
(5, 20),
(6, 25),
(7, 30),
(8, 35),
(9, 40),
(10, 45),
(11, 50),
(12, 55),
(13, 20);

-- --------------------------------------------------------

--
-- Table structure for table `Premium`
--

CREATE TABLE `Premium` (
  `Login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Premium`
--

INSERT INTO `Premium` (`Login`) VALUES
('carahuevoa'),
('cerdicola'),
('murka'),
('Pralaralarala');

-- --------------------------------------------------------

--
-- Table structure for table `Profesor`
--

CREATE TABLE `Profesor` (
  `Login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Profesor`
--

INSERT INTO `Profesor` (`Login`) VALUES
('family'),
('irenita'),
('LPMP'),
('weli');

-- --------------------------------------------------------

--
-- Table structure for table `Streaming`
--

CREATE TABLE `Streaming` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` text NOT NULL,
  `url` text NOT NULL,
  `Login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Streaming`
--

INSERT INTO `Streaming` (`id`, `fecha`, `descripcion`, `url`, `Login`) VALUES
(2, '2016-12-25', 'clse especial en navidad', 'hajsdñsfdjhqpotruqwiro', 'family'),
(3, '2017-02-01', 'clase especial con el experto de c++ pepe flores', 'syuopiwtqrhf', 'aci10');

-- --------------------------------------------------------

--
-- Table structure for table `Streaming_Aula`
--

CREATE TABLE `Streaming_Aula` (
  `id_streaming` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Streaming_Aula`
--

INSERT INTO `Streaming_Aula` (`id_streaming`, `id_aula`) VALUES
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Streaming_Curso`
--

CREATE TABLE `Streaming_Curso` (
  `id_streaming` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Streaming_Curso`
--

INSERT INTO `Streaming_Curso` (`id_streaming`, `id_curso`) VALUES
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Sube`
--

CREATE TABLE `Sube` (
  `id_ej` int(11) NOT NULL,
  `login_usu` varchar(20) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Sube`
--

INSERT INTO `Sube` (`id_ej`, `login_usu`, `fecha`) VALUES
(1, 'aci10', '2016-12-01'),
(3, 'pucho', '2016-12-07'),
(5, 'pplu', '2016-12-15'),
(7, 'JorgitoSI', '2016-12-09'),
(8, 'LPMP', '2016-12-21'),
(9, 'LPMP', '2016-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE `Usuario` (
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `photo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Usuario`
--

INSERT INTO `Usuario` (`login`, `password`, `email`, `nombre`, `apellidos`, `photo`) VALUES
('aci10', '1234', 'x@email.com', 'antonio', 'candela', 'x'),
('bluecross', '1234', 'abc@gmail.com', 'Aina', 'García Ballester', 'asdf'),
('carahuevoa', '12341', 'ch@gmail.co', 'Lucí', 'Carrasco Rodrígue', 'asd'),
('cerdicola', '1234', 'cr@gmail.com', 'Lorena', 'None', 'asdf'),
('danielbean', '1234', 'i@email.com', 'daniel', 'belmonte', 'i'),
('ELlili', '123456', 'lolo@gmail.com', 'Lolo', 'El Golo', 'no consta'),
('family', '1234', 'fm@gmail.com', 'Antonio Maria Teresa', 'Candela Ibáñez', 'amtci'),
('irenita', '1234', 'rp@gmail.com', 'Antonio Irene', 'Candela Polo', 'asdf'),
('italiana', '1234', 'it@gmail.com', 'Marina', 'Duó', 'adf'),
('jaimito', '1234', 'jm@gmail.com', 'Jaime', 'Valero Adsuar', 'asdf'),
('JorgitoSI', '1234', 'j@gmail.com', 'Jorge', 'Sempere Ibáñez', 'T..T'),
('LPMP', '1234', 'a@gmail.com', 'Anna Louis', 'Worthington-Bramhall', 'xD'),
('manja', '1234', 'mn@gmail.com', 'Daniel', 'Pérez Sánchez', 'asdf'),
('moky', '1234', 'mok@gmail.com', 'Eva', 'Payá García', 'asdf'),
('murka', 'chunga1234', 'chunga', 'chunga chunga', 'chunga chunga', 'sadf'),
('pelocho', '1234', 'ja@gmail.com', 'Javier', 'Mas Rodríguez', 'chocho'),
('pitufilla', '1234', 'pt@gmail.com', 'Alba', 'Mas Sánchez', 'ttt'),
('pplu', '1234', 'pp@gmail.com', 'Jose Luís', 'Macía Penalva', 'pptuis'),
('Pralaralarala', '1234', 'm@gmail.com', 'Maria Francisca', 'Gacitúa', 'xP'),
('pucho', '1234', 'pc@gmail.com', 'Pablo', 'Mas Guilabert', 'asdf'),
('tess', '1234', 'ts@gmail.com', 'Teresa', 'Candela Ibáñez', 'qwer'),
('tonytony', '123456', 'ellolco', 'Loco', 'Tony Antony', 'aa'),
('valen', '1234', 'y@email.com', 'valentin', 'ututui', 'y'),
('weli', '1234', 'wl@gmail.com', 'Miguel Teresa', 'Ibáñez Onteniente', 'asdf'),
('yisus', '1234', 'z@email.com', 'jesus', 'sanchez', 'z');

-- --------------------------------------------------------

--
-- Table structure for table `UsuarioRegistrado`
--

CREATE TABLE `UsuarioRegistrado` (
  `Login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UsuarioRegistrado`
--

INSERT INTO `UsuarioRegistrado` (`Login`) VALUES
('bluecross'),
('carahuevoa'),
('cerdicola'),
('danielbean'),
('italiana'),
('jaimito'),
('JorgitoSI'),
('manja'),
('moky'),
('murka'),
('pelocho'),
('pitufilla'),
('pplu'),
('Pralaralarala'),
('pucho'),
('tess'),
('tonytony');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Administrador`
--
ALTER TABLE `Administrador`
  ADD PRIMARY KEY (`Login`);

--
-- Indexes for table `Alumno`
--
ALTER TABLE `Alumno`
  ADD PRIMARY KEY (`Login`);

--
-- Indexes for table `Alumno_Aula`
--
ALTER TABLE `Alumno_Aula`
  ADD PRIMARY KEY (`login_alu`,`id_aula`),
  ADD KEY `CAJ_aula_alu` (`id_aula`);

--
-- Indexes for table `Aula`
--
ALTER TABLE `Aula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Login` (`Login`);

--
-- Indexes for table `Aula_Curso`
--
ALTER TABLE `Aula_Curso`
  ADD PRIMARY KEY (`id_aula`,`id_curso`),
  ADD KEY `CAJ_idcurso_aula` (`id_curso`);

--
-- Indexes for table `Comprar`
--
ALTER TABLE `Comprar`
  ADD PRIMARY KEY (`id_pack`,`login_usuR`),
  ADD KEY `CAJ_loginUsuR_pack` (`login_usuR`);

--
-- Indexes for table `Compra_Instituto`
--
ALTER TABLE `Compra_Instituto`
  ADD PRIMARY KEY (`nombre_insti`,`id_pack`),
  ADD KEY `CAJ_pack_instituto` (`id_pack`);

--
-- Indexes for table `Curso`
--
ALTER TABLE `Curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Login` (`Login`);

--
-- Indexes for table `Curso_Leccion`
--
ALTER TABLE `Curso_Leccion`
  ADD PRIMARY KEY (`id_Curso`,`id_Leccion`),
  ADD KEY `CAJ_idLeccion_Curso` (`id_Leccion`);

--
-- Indexes for table `Curso_Pack`
--
ALTER TABLE `Curso_Pack`
  ADD PRIMARY KEY (`id_Curso`,`id_Pack`),
  ADD KEY `CAJ_pack_curso` (`id_Pack`);

--
-- Indexes for table `Ejercicio`
--
ALTER TABLE `Ejercicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Login_usu` (`Login_usu`,`Login_ges`),
  ADD KEY `CAJ_loginGest` (`Login_ges`);

--
-- Indexes for table `Free`
--
ALTER TABLE `Free`
  ADD PRIMARY KEY (`Login`);

--
-- Indexes for table `Gestor`
--
ALTER TABLE `Gestor`
  ADD PRIMARY KEY (`Login`);

--
-- Indexes for table `Instituto`
--
ALTER TABLE `Instituto`
  ADD PRIMARY KEY (`nombre`);

--
-- Indexes for table `Ins_alu_prof`
--
ALTER TABLE `Ins_alu_prof`
  ADD PRIMARY KEY (`nombre_insti`,`login_alu`),
  ADD KEY `login_prof` (`login_prof`),
  ADD KEY `CAJ_loginAlu_insti_prof` (`login_alu`);

--
-- Indexes for table `Juego`
--
ALTER TABLE `Juego`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Leccion`
--
ALTER TABLE `Leccion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Leccion_Ejercicio`
--
ALTER TABLE `Leccion_Ejercicio`
  ADD PRIMARY KEY (`id_leccion`,`id_ejercicio`),
  ADD KEY `CAJ_ejercicio_leccion` (`id_ejercicio`);

--
-- Indexes for table `NormalEj`
--
ALTER TABLE `NormalEj`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Noticias`
--
ALTER TABLE `Noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_admin` (`login_admin`);

--
-- Indexes for table `Noticias_Aula`
--
ALTER TABLE `Noticias_Aula`
  ADD PRIMARY KEY (`id_aula`,`id_noticia`),
  ADD KEY `CAJ_noticia_aula` (`id_noticia`);

--
-- Indexes for table `Noticia_Curso`
--
ALTER TABLE `Noticia_Curso`
  ADD PRIMARY KEY (`id_noticia`,`id_curso`),
  ADD KEY `CAJ_curso_noticia` (`id_curso`);

--
-- Indexes for table `Pack`
--
ALTER TABLE `Pack`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Premium`
--
ALTER TABLE `Premium`
  ADD PRIMARY KEY (`Login`);

--
-- Indexes for table `Profesor`
--
ALTER TABLE `Profesor`
  ADD PRIMARY KEY (`Login`);

--
-- Indexes for table `Streaming`
--
ALTER TABLE `Streaming`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Login` (`Login`);

--
-- Indexes for table `Streaming_Aula`
--
ALTER TABLE `Streaming_Aula`
  ADD PRIMARY KEY (`id_streaming`,`id_aula`),
  ADD KEY `CAJ_aula_streaming` (`id_aula`);

--
-- Indexes for table `Streaming_Curso`
--
ALTER TABLE `Streaming_Curso`
  ADD PRIMARY KEY (`id_streaming`,`id_curso`),
  ADD KEY `CAJ_curso_streaming` (`id_curso`);

--
-- Indexes for table `Sube`
--
ALTER TABLE `Sube`
  ADD PRIMARY KEY (`id_ej`),
  ADD KEY `login_usu` (`login_usu`);

--
-- Indexes for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`login`);

--
-- Indexes for table `UsuarioRegistrado`
--
ALTER TABLE `UsuarioRegistrado`
  ADD PRIMARY KEY (`Login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Aula`
--
ALTER TABLE `Aula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Curso`
--
ALTER TABLE `Curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Ejercicio`
--
ALTER TABLE `Ejercicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `Leccion`
--
ALTER TABLE `Leccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `Noticias`
--
ALTER TABLE `Noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Pack`
--
ALTER TABLE `Pack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `Streaming`
--
ALTER TABLE `Streaming`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Administrador`
--
ALTER TABLE `Administrador`
  ADD CONSTRAINT `CAJ_loginUsu_admin` FOREIGN KEY (`Login`) REFERENCES `Usuario` (`login`) ON UPDATE CASCADE;

--
-- Constraints for table `Alumno`
--
ALTER TABLE `Alumno`
  ADD CONSTRAINT `CAJ_loginUsu_Reg` FOREIGN KEY (`Login`) REFERENCES `UsuarioRegistrado` (`Login`);

--
-- Constraints for table `Alumno_Aula`
--
ALTER TABLE `Alumno_Aula`
  ADD CONSTRAINT `CAJ_aula_alu` FOREIGN KEY (`id_aula`) REFERENCES `Aula` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_loginAlu_aula` FOREIGN KEY (`login_alu`) REFERENCES `Alumno` (`Login`) ON UPDATE CASCADE;

--
-- Constraints for table `Aula`
--
ALTER TABLE `Aula`
  ADD CONSTRAINT `CAJ_loginProf_Aula` FOREIGN KEY (`Login`) REFERENCES `Profesor` (`Login`) ON UPDATE CASCADE;

--
-- Constraints for table `Aula_Curso`
--
ALTER TABLE `Aula_Curso`
  ADD CONSTRAINT `CAJ_aula_curso` FOREIGN KEY (`id_aula`) REFERENCES `Aula` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_idcurso_aula` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Comprar`
--
ALTER TABLE `Comprar`
  ADD CONSTRAINT `CAJ_loginUsuR_pack` FOREIGN KEY (`login_usuR`) REFERENCES `UsuarioRegistrado` (`Login`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_pack_usuario` FOREIGN KEY (`id_pack`) REFERENCES `Pack` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Compra_Instituto`
--
ALTER TABLE `Compra_Instituto`
  ADD CONSTRAINT `CAJ_instituto_pack` FOREIGN KEY (`nombre_insti`) REFERENCES `Instituto` (`nombre`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_pack_instituto` FOREIGN KEY (`id_pack`) REFERENCES `Pack` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Curso`
--
ALTER TABLE `Curso`
  ADD CONSTRAINT `CAJ_loginAdmin_Curso` FOREIGN KEY (`Login`) REFERENCES `Administrador` (`Login`) ON UPDATE CASCADE;

--
-- Constraints for table `Curso_Leccion`
--
ALTER TABLE `Curso_Leccion`
  ADD CONSTRAINT `CAJ_idLeccion_Curso` FOREIGN KEY (`id_Leccion`) REFERENCES `Leccion` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_idcurso_leccion` FOREIGN KEY (`id_Curso`) REFERENCES `Curso` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Curso_Pack`
--
ALTER TABLE `Curso_Pack`
  ADD CONSTRAINT `CAJ_idcurso_pack` FOREIGN KEY (`id_Curso`) REFERENCES `Curso` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_pack_curso` FOREIGN KEY (`id_Pack`) REFERENCES `Pack` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Ejercicio`
--
ALTER TABLE `Ejercicio`
  ADD CONSTRAINT `CAJ_loginGest` FOREIGN KEY (`Login_ges`) REFERENCES `Gestor` (`Login`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_loginUsu` FOREIGN KEY (`Login_usu`) REFERENCES `Usuario` (`login`) ON UPDATE CASCADE;

--
-- Constraints for table `Free`
--
ALTER TABLE `Free`
  ADD CONSTRAINT `CAJ_loginUsu_adminFree` FOREIGN KEY (`Login`) REFERENCES `UsuarioRegistrado` (`Login`) ON UPDATE CASCADE;

--
-- Constraints for table `Gestor`
--
ALTER TABLE `Gestor`
  ADD CONSTRAINT `CAJ_loginUsu_adminGest` FOREIGN KEY (`Login`) REFERENCES `Administrador` (`Login`) ON UPDATE CASCADE;

--
-- Constraints for table `Ins_alu_prof`
--
ALTER TABLE `Ins_alu_prof`
  ADD CONSTRAINT `CAJ_loginAlu_insti_prof` FOREIGN KEY (`login_alu`) REFERENCES `Alumno` (`Login`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_loginProf_alu_insti` FOREIGN KEY (`login_prof`) REFERENCES `Profesor` (`Login`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_nombreInst_alu_prof` FOREIGN KEY (`nombre_insti`) REFERENCES `Instituto` (`nombre`) ON UPDATE CASCADE;

--
-- Constraints for table `Juego`
--
ALTER TABLE `Juego`
  ADD CONSTRAINT `CAJ_ejercicio_juego` FOREIGN KEY (`id`) REFERENCES `Ejercicio` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Leccion_Ejercicio`
--
ALTER TABLE `Leccion_Ejercicio`
  ADD CONSTRAINT `CAJ_ejercicio_leccion` FOREIGN KEY (`id_ejercicio`) REFERENCES `Ejercicio` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_leccion_ejercicio` FOREIGN KEY (`id_leccion`) REFERENCES `Leccion` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `NormalEj`
--
ALTER TABLE `NormalEj`
  ADD CONSTRAINT `CAJ_ejercicio_normal` FOREIGN KEY (`id`) REFERENCES `Ejercicio` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Noticias`
--
ALTER TABLE `Noticias`
  ADD CONSTRAINT `CAJ_logAdmin_noticia` FOREIGN KEY (`login_admin`) REFERENCES `Administrador` (`Login`) ON UPDATE CASCADE;

--
-- Constraints for table `Noticias_Aula`
--
ALTER TABLE `Noticias_Aula`
  ADD CONSTRAINT `CAJ_idAula_noticias` FOREIGN KEY (`id_aula`) REFERENCES `Aula` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_noticia_aula` FOREIGN KEY (`id_noticia`) REFERENCES `Noticias` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Noticia_Curso`
--
ALTER TABLE `Noticia_Curso`
  ADD CONSTRAINT `CAJ_curso_noticia` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_noticia_curso` FOREIGN KEY (`id_noticia`) REFERENCES `Noticias` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Premium`
--
ALTER TABLE `Premium`
  ADD CONSTRAINT `CAJ_loginUsu_RegPrem` FOREIGN KEY (`Login`) REFERENCES `UsuarioRegistrado` (`Login`) ON UPDATE CASCADE;

--
-- Constraints for table `Profesor`
--
ALTER TABLE `Profesor`
  ADD CONSTRAINT `CAJ_loginUsu_adminProf` FOREIGN KEY (`Login`) REFERENCES `Administrador` (`Login`) ON UPDATE CASCADE;

--
-- Constraints for table `Streaming`
--
ALTER TABLE `Streaming`
  ADD CONSTRAINT `CAJ_loginAdmin_Streaming` FOREIGN KEY (`Login`) REFERENCES `Administrador` (`Login`) ON UPDATE CASCADE;

--
-- Constraints for table `Streaming_Aula`
--
ALTER TABLE `Streaming_Aula`
  ADD CONSTRAINT `CAJ_aula_streaming` FOREIGN KEY (`id_aula`) REFERENCES `Aula` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_streaming_aula` FOREIGN KEY (`id_streaming`) REFERENCES `Streaming` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Streaming_Curso`
--
ALTER TABLE `Streaming_Curso`
  ADD CONSTRAINT `CAJ_curso_streaming` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_streaming_curso` FOREIGN KEY (`id_streaming`) REFERENCES `Streaming` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `Sube`
--
ALTER TABLE `Sube`
  ADD CONSTRAINT `CAJ_ejercicio_sube` FOREIGN KEY (`id_ej`) REFERENCES `Ejercicio` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CAJ_usu_sube` FOREIGN KEY (`login_usu`) REFERENCES `Usuario` (`login`) ON UPDATE CASCADE;

--
-- Constraints for table `UsuarioRegistrado`
--
ALTER TABLE `UsuarioRegistrado`
  ADD CONSTRAINT `CAJ_loginUsu_deReg` FOREIGN KEY (`Login`) REFERENCES `Usuario` (`login`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
