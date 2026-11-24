-- Projeto de Banco  de Dados AcalmaTEA

-- Remover Banco de dados caso ele exista
DROP DATABASE IF EXISTS AcalmaTEA;

-- Criando banco de dados
CREATE DATABASE AcalmaTEA;
USE AcalmaTEA;

-- Identificando os Atributos e Entidades e suas relações:

-- Entidades:
-- Usuário: Representa a conta da pessoa que acessa o aplicativo, garantindo a privacidade e a sincronização dos dados.
-- RegistroHumor: Armazena o log do estado emocional e o contexto de uma desregulação em um momento específico (diário).
-- Estrategia: Ferramentas e atividades de autorregulação oferecidas no app (ex: ruído branco, respiração).
-- Desafio: Metas propostas pelo aplicativo para incentivar a rotina e o bem-estar.
-- Recompensa: Conquistas, selos ou troféus que o usuário pode desbloquear ao usar o app.

-- Relacionamentos e Cardinalidades

-- Um usuário pode fazer N registros de humor ao longo do tempo, mas cada registro salvo no banco pertence exclusivamente a apenas 1 Usuário.
-- Um Usuário pode acumular múltiplas Recompensas em seu perfil, e uma mesma Recompensa do catálogo pode ser destravada por múltiplos Usuários.
-- Um Usuário pode concluir vários Desafios, e um mesmo Desafio global pode ser concluído por vários Usuários diferentes.
-- O Usuário pode favoritar ou acessar várias Estratégias, e uma mesma Estratégia atende a vários Usuários.

-- Atributos

-- Usuário: id_usuario (PK), nome_usuario, email, senha, nivel_suporte
-- RegistroHumor: id_registro (PK), id_usuario (FK), data_hora, nivel_humor, motivo_gatilho
-- Estrategia: id_estrategia (PK), nome_estrategia, categoria (ex: áudio, respiração), descricao
-- Desafio: id_desafio (PK), titulo, descricao, pontuacao_necessaria
-- Recompensa: id_recompensa (PK), nome_recompensa, icone_url, condicao_desbloqueio

-- Criando uma tabela para usuario
CREATE TABLE  Usuario (
-- O  Id_usuario é  criado como uma chave epprimária
id_usuario INT  UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_usuario VARCHAR(100) NOT NULL,
email VARCHAR (150)NOT NULL UNIQUE,
senha  VARCHAR(255) NOT NULL,
nivel_suporte INT NOT NULL


);

CREATE TABLE  Estrategia (
id_estrategia INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_estrategia VARCHAR(100) NOT NULL,
categoria VARCHAR(50) NOT NULL,
descricao TEXT
);

CREATE TABLE Desafio (
    id_desafio INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    pontuacao_necessaria INT UNSIGNED NOT NULL
);

CREATE TABLE Recompensa (
    id_recompensa INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_recompensa VARCHAR(100) NOT NULL,
    icone_url VARCHAR(255),
    condicao_desbloqueio VARCHAR(255)
);

CREATE TABLE RegistroHumor (
    id_registro INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT UNSIGNED NOT NULL,
    data_hora DATETIME NOT NULL,
    nivel_humor INT NOT NULL,
    motivo_gatilho TEXT,
    
    
    -- Integridade: Se a conta for excluída, os registros pessoais são apagados
    CONSTRAINT fk_registro_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario)
        ON DELETE CASCADE 
);

-- =========================================================================
-- 4. TABELAS ASSOCIATIVAS (Relacionamentos N:M)
-- APLICAÇÃO DA 2FN: A Chave Primária é COMPOSTA em relacionamentos N:M[cite: 1].
-- Qualquer atributo extra nestas tabelas (como data_conclusao) depende da 
-- TOTALIDADE da PK Composta (Usuário + Entidade Global)[cite: 1].
-- =========================================================================

-- Tabela Associativa: [Usuário] < ganha > [Recompensa]
CREATE TABLE UsuarioRecompensa (
    id_usuario INT UNSIGNED NOT NULL,
    id_recompensa INT UNSIGNED NOT NULL,
    data_desbloqueio DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (id_usuario, id_recompensa),
    
    CONSTRAINT fk_ur_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_ur_recompensa FOREIGN KEY (id_recompensa) REFERENCES Recompensa(id_recompensa) ON DELETE CASCADE
);

-- Tabela Associativa: [Usuário] < conclui > [Desafio]
CREATE TABLE UsuarioDesafio (
    id_usuario INT UNSIGNED NOT NULL,
    id_desafio INT UNSIGNED NOT NULL,
    data_conclusao DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (id_usuario, id_desafio),
    
    CONSTRAINT fk_ud_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_ud_desafio FOREIGN KEY (id_desafio) REFERENCES Desafio(id_desafio) ON DELETE CASCADE
);

-- Tabela Associativa: [Usuário] < acessa > [Estrategia]
CREATE TABLE UsuarioEstrategia (
    id_usuario INT UNSIGNED NOT NULL,
    id_estrategia INT UNSIGNED NOT NULL,
    favorita BOOLEAN DEFAULT FALSE,
    quantidade_acessos INT UNSIGNED DEFAULT 1,
    
    PRIMARY KEY (id_usuario, id_estrategia),
    
    CONSTRAINT fk_ue_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_ue_estrategia FOREIGN KEY (id_estrategia) REFERENCES Estrategia(id_estrategia) ON DELETE CASCADE
);
