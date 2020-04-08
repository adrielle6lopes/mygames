-- Apaga e recria o banco de dados em "Momento de Desenvolvimento"
DROP DATABASE IF EXISTS mygames;

-- Cria o banco de dados novamente
CREATE DATABASE mygames CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona o banco de dados
USE mygames;

-- Tabela de usuários
CREATE TABLE users (
    u_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    u_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    u_name VARCHAR(128) NOT NULL COMMENT 'Nome que aparece no aplicativo',
    u_email VARCHAR(255) NOT NULL,
    u_password VARCHAR(30) NOT NULL,
    u_status ENUM('1', '0') DEFAULT '1'    
);

-- Tabela de plataformas
CREATE TABLE platforms (
    p_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    p_name VARCHAR(128) NOT NULL
);

-- Tabela de jogos
CREATE TABLE games (
    g_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    g_user INT,
    g_purchase DATE NOT NULL,
    g_title VARCHAR (128) NOT NULL,
    g_description TEXT NOT NULL,
    g_media ENUM('F', 'D') NOT NULL DEFAULT 'F' COMMENT 'F = Física, D = Digital',
    g_platform INT NOT NULL,
    g_status ENUM('1', '0') DEFAULT '1',
    FOREIGN KEY (g_user) REFERENCES users(u_id),
    FOREIGN KEY (g_platform) REFERENCES platforms(p_id)
);

--inserindo dados
INSERT INTO `users` (`u_id`, `u_date`, `u_name`, `u_email`, `u_password`, `u_status`) 
VALUES
(1, '2020-09-22 15:12:12', 'Adrielle Lopes', 'adrielle@gmail.com', '123', '1'),
(2, '2020-09-22 15:12:12', 'Gustavo Gabriel', 'gustavo@gmail.com', '123', '1');

INSERT INTO `platforms` (`p_id`, `p_name`) 
VALUES ('1', 'Playstation'), 
('2', 'Nintendo'), 
('3', 'Microsoft'), 
('4', 'Pc');

INSERT INTO `games` (`g_id`, `g_user`, `g_purchase`, `g_title`, `g_description`, `g_media`, `g_platform`, `g_status`) 
VALUES ('1', '1', '2020-10-10', 'The Last Of Us', 'aaaaa', 'F', '1', '1'), 
('2', '1', '2020-10-10', 'God Of War', 'bbbbb', 'F', '3', '1'), 
('3', '2', '2020-10-10', 'Far Cry 3', 'ccccc', 'F', '2', '1'), 
('4', '2', '2020-10-10', 'Shawdon Of The Colossus', 'ddddd', 'F', '4', '1'), 
('5', '2', '2020-10-10', 'Horizon Zero Down', 'eeeee', 'F', '3', '1');