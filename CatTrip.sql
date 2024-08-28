CREATE DATABASE CatTrip;
USE CatTrip;

CREATE TABLE usuario(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    cep INT(10),
    rua VARCHAR(255),
    numero INT(5),
    bairro VARCHAR(40),
    cidade VARCHAR(40),
    uf CHAR(2),
    complemento VARCHAR(100),
    referencia VARCHAR(255),
    pais CHAR(3),
    telefone VARCHAR(13),
    email VARCHAR(45),
    senha VARCHAR(45),
    tipo_usuario VARCHAR(45)
);

CREATE TABLE imagens(
	id_img int auto_increment primary key,
    imagem longblob);

CREATE TABLE imovel(
	id_imovel INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    diaria DECIMAL(10,2) NOT NULL,
    hospedes INT NOT NULL,
    quarto INT NOT NULL,
    cep INT(10),
    rua VARCHAR(255),
    numero INT,
    bairro VARCHAR(40),
    cidade VARCHAR(40),
    uf CHAR(2),
    complemento VARCHAR(100),
    referencia VARCHAR(255),
    pais CHAR(3),
    id_img int,
    foreign key (id_img) references imagens(id_img),
    id_locador INT NOT NULL,
    FOREIGN KEY (id_locador) REFERENCES usuario(id_usuario)
);

CREATE TABLE forma_pagamento(
	id_forma_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(25)
);

CREATE TABLE locatario(
	id_locatario INT auto_increment PRIMARY KEY,
    id_imovel INT NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE reserva(
	id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_imovel INT NOT NULL,
    id_locatario INT NOT NULL,
    checkin DATE NOT NULL,
    checkout DATE NOT NULL,
    numero_hospedes int(11),
    valor_total DECIMAL(10,2),
    id_forma_pagamento INT NOT NULL,
    FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel),
    FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento),
    FOREIGN KEY (id_locatario) REFERENCES locatario(id_locatario)
);



CREATE TABLE avaliacao(
	id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_imovel INT NOT NULL,
    id_reserva INT NOT NULL,
    nota TINYINT NOT NULL,
    mensagem VARCHAR(400),
    FOREIGN KEY (id_imovel) REFERENCES imovel(id_imovel),
    FOREIGN KEY (id_reserva) REFERENCES reserva(id_reserva)
);

INSERT INTO usuario (nome, cpf, cep, rua, numero, bairro, cidade, uf, complemento, referencia, pais, telefone, email, senha, tipo_usuario)
VALUES 
('João Silva', '123.456.789-00', 36880000, 'Rua Principal', 123, 'Centro', 'Muriaé', 'MG', 'Apto 101', 'Próximo ao mercado', 'BRA', '(32)999999999', 'joao.silva@example.com', 'senha123', 'locador'),
('Maria Oliveira', '987.654.321-00', 36880001, 'Av. São João', 456, 'São Pedro', 'Muriaé', 'MG', 'Casa', 'Em frente ao parque', 'BRA', '(32)988888888', 'maria.oliveira@example.com', 'senha456', 'locatario'),
('Carlos Santos', '111.222.333-44', 30100000, 'Rua das Flores', 789, 'Savassi', 'Belo Horizonte', 'MG', 'Apto 502', 'Perto da padaria', 'BRA', '(31)977777777', 'carlos.santos@example.com', 'senha789', 'locador'),
('Ana Paula', '555.666.777-88', 29200000, 'Av. Atlântica', 202, 'Praia do Morro', 'Guarapari', 'ES', 'Apto 303', 'De frente para o mar', 'BRA', '(27)966666666', 'ana.paula@example.com', 'senha101', 'locatario'),
('Pedro Martins', '999.888.777-66', 60000000, 'Rua do Comércio', 404, 'Centro', 'Salvador', 'BA', 'Casa', 'Próximo à igreja', 'BRA', '(71)955555555', 'pedro.martins@example.com', 'senha202', 'locatario');


INSERT INTO imovel (titulo, descricao, diaria, hospedes, quarto, cep, rua, numero, bairro, cidade, uf, complemento, referencia, pais, id_locador)
VALUES 
('Apartamento no Centro de Muriaé', 'Espaçoso apartamento no centro de Muriaé, ideal para quem busca conforto e praticidade.', 150.00, 4, 2, 36880000, 'Rua Principal', 150, 'Centro', 'Muriaé', 'MG', 'Apto 101', 'Próximo à estação de ônibus', 'BRA', 1),
('Casa Aconchegante em Muriaé', 'Charmosa casa em Muriaé, perfeita para famílias que desejam tranquilidade.', 250.00, 6, 3, 36880001, 'Rua São João', 220, 'São Pedro', 'Muriaé', 'MG', 'Casa', 'Em um bairro residencial tranquilo', 'BRA', 1),
('Flat Moderno em Belo Horizonte', 'Flat estiloso e bem equipado, localizado no coração do bairro Savassi.', 300.00, 2, 1, 30100000, 'Rua das Flores', 789, 'Savassi', 'Belo Horizonte', 'MG', 'Apto 502', 'Próximo a restaurantes e lojas', 'BRA', 3),
('Casa de Praia em Guarapari', 'Ampla casa de praia em Guarapari, com área de lazer completa e vista para o oceano.', 400.00, 8, 4, 29200000, 'Av. Atlântica', 202, 'Praia do Morro', 'Guarapari', 'ES', 'Casa', 'A poucos metros da areia', 'BRA', 4),
('Casa Histórica em Salvador', 'Casa com valor histórico no centro de Salvador, preservando a arquitetura tradicional.', 200.00, 5, 3, 60000000, 'Rua do Comércio', 404, 'Centro', 'Salvador', 'BA', 'Casa', 'Próxima aos principais pontos turísticos', 'BRA', 5);

INSERT INTO forma_pagamento (nome)
VALUES 
('Cartão de Crédito'),
('Boleto Bancário'),
('Transferência Bancária'),
('Pix'),
('PayPal');

INSERT INTO locatario (id_imovel, id_usuario)
VALUES 
(1, 2),  
(2, 2), 
(3, 4), 
(4, 4),  
(5, 5); 

INSERT INTO reserva (id_imovel, id_locatario, checkin, checkout, numero_hospedes, valor_total, id_forma_pagamento)
VALUES 
(1, 2, '2025-01-05', '2025-01-10', 4, 750.00, 1),   
(2, 3, '2025-02-15', '2025-02-20', 6, 1250.00, 2),  
(3, 4, '2025-03-10', '2025-03-15', 2, 1500.00, 3),  
(4, 5, '2025-04-01', '2025-04-07', 8, 2800.00, 4),   
(5, 1, '2025-05-20', '2025-05-25', 5, 1000.00, 5); 


INSERT INTO avaliacao (id_imovel, id_reserva, nota, mensagem)
VALUES 
(1, 1, 5, 'Ótima estadia! O apartamento estava perfeito e muito bem localizado.'),
(2, 2, 4, 'A casa é excelente, mas o aquecimento não estava funcionando corretamente.'),
(3, 3, 5, 'Adoramos o flat! Muito bem localizado e com ótimo atendimento.'),
(4, 4, 3, 'A casa de praia é boa, mas a limpeza deixou a desejar.'),
(5, 5, 4, 'A casa histórica é muito charmosa, mas o wifi não funcionou bem durante a nossa estadia.');




alter table usuario 
modify telefone varchar(14);
alter table usuario
add column sobrenome varchar(45);

SELECT * FROM usuario
WHERE nome LIKE '%Silva%';

SELECT * FROM imovel
WHERE diaria >300;


SELECT i.titulo, i.cidade
FROM imovel as i 
INNER JOIN reserva as r
ON r.id_imovel = i.id_imovel
WHERE i.cidade = 'Guarapari'
AND (r.checkin BETWEEN '2024-01-01' and '2024-01-31');



SELECT i.titulo as Imovel,
count(r.id_reserva) as Qtd_Reservas
from reserva as r
left join imovel as i
on i.id_imovel = r.id_imovel
group by i.titulo;


select i.titulo, i.diaria as Maior_Diaria
from imovel as i
where diaria = (select max(diaria) from imovel);


select i.titulo as Titulo, i.diaria as Menor_Diaria
from imovel as i
where diaria = (select min(diaria) from imovel)
AND i.cidade = 'Belo Horizonte';


update usuario set cidade = 'Belo Horizonte'
where id_usuario = 3;


INSERT INTO usuario (nome, cpf, cep, rua, numero, bairro, cidade, uf, complemento, referencia, pais, telefone, email, senha, tipo_usuario)
VALUES 
('Lucas Pereira', '444.555.666-77', 12345000, 'Rua Nova', 100, 'Centro', 'Belo Horizonte', 'MG', 'Apto 202', 'Próximo ao parque', 'BRA', '(31)99999-8888', 'lucas.pereira@example.com', 'senha123', 'locatario');

DELETE FROM usuario
WHERE email = 'lucas.pereira@example.com';








 


