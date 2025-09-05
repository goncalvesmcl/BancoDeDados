PRAGMA foreign_keys = ON;

CREATE TABLE Participante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

CREATE TABLE Evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL
);

CREATE TABLE Inscricao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_evento INTEGER NOT NULL,
    id_participante INTEGER NOT NULL,
    data_inscricao TEXT,
    status TEXT,
    FOREIGN KEY (id_evento) REFERENCES Evento(id) ON DELETE CASCADE,
    FOREIGN KEY (id_participante) REFERENCES Participante(id) ON DELETE CASCADE
);

CREATE TABLE Pagamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_inscricao INTEGER NOT NULL UNIQUE,
    valor REAL,
    data_pagamento TEXT,
    status TEXT,
    FOREIGN KEY (id_inscricao) REFERENCES Inscricao(id) ON DELETE CASCADE
);

INSERT INTO Participante (nome, email, telefone) VALUES
('Maria Clara', 'mcllara@email.com', '(34) 98547-1111'),
('Julia Santos', 'julia.santos@email.com', '(34) 84567-2222'),
('Pedro', 'pedro.oliveira@email.com', '(34) 35624-3333');

INSERT INTO Evento (nome, descricao, local, data) VALUES
('Seminário de Tecnologia', 'Seminário sobre as últimas tendências em TI', 'Auditório N', '2025-09-10'),
('Workshop de Java', 'Workshop prático sobre POO', 'Centro de convenção', '2025-09-15');

INSERT INTO Inscricao (id_evento, id_participante, data_inscricao, status) VALUES
(1, 1, '2025-09-01', 'confirmada'),
(1, 2, '2025-09-02', 'cancelada'),
(2, 1, '2025-09-03', 'confirmada'),
(2, 3, '2025-09-04', 'cancelada');

INSERT INTO Pagamento (id_inscricao, valor, data_pagamento, status) VALUES
(1, 35.00, '2025-09-01', 'pago'),
(2, 50.00, '2025-09-02', 'pago'),
(3, 175.00, '2025-09-03', 'pago'),
(4, 210.00, NULL, 'pendente');