USE AcalmaTEA;

-- =========================================================================
-- Cenário 1 — Configuração Base e Catálogo de Recursos (Dados Iniciais)
-- Antes de abrir o aplicativo para o público, a equipe do AcalmaTEA 
-- cadastrou as 5 estratégias principais de autorregulação, 5 desafios 
-- diários de bem-estar e 5 recompensas gamificadas no catálogo global.
-- =========================================================================

INSERT INTO Estrategia (nome_estrategia, categoria, descricao) VALUES
('Respiração Quadrada (4-4-4-4)', 'Respiração', 'Inspire por 4 segundos, segure por 4, expire por 4 e aguarde 4 segundos antes de repetir.'),
('Chuva Suave na Floresta', 'Áudio', 'Faixa de ruído marrom e sons naturais de chuva para mascarar ruídos externos repentinos.'),
('Aterramento Sensorial 5-4-3-2-1', 'Cognitivo', 'Identifique 5 coisas que vê, 4 que pode tocar, 3 que ouve, 2 que cheira e 1 que saboreia.'),
('Guia de Pausa Visual', 'Visual', 'Animação minimalista de expansão e contração em tons pastéis para desacelerar o ritmo visual.'),
('Checklist de Ambiente Seguro', 'Rotina', 'Passo a passo rápido para ajustar iluminação, reduzir estímulos sonoros e usar abafador.');

INSERT INTO Desafio (titulo, descricao, pontuacao_necessaria) VALUES
('Primeiro Passo de Calma', 'Realizar o primeiro registro de humor no diário emocional.', 10),
('Explorador Sensorial', 'Testar e favoritar pelo menos uma estratégia de autorregulação.', 20),
('Constância de 3 Dias', 'Registrar o estado emocional por três dias consecutivos.', 50),
('Mestre da Respiração', 'Acessar estratégias da categoria Respiração 5 vezes.', 75),
('Autoconhecimento em Dia', 'Identificar e documentar gatilhos em 3 momentos distintos.', 100);

INSERT INTO Recompensa (nome_recompensa, icone_url, condicao_desbloqueio) VALUES
('Selo Primeiros Passos', 'https://acalmatea.app/icons/primeiros-passos.png', 'Completar o cadastro e o primeiro check-in emocional.'),
('Guardião da Calma', 'https://acalmatea.app/icons/guardiao-calma.png', 'Concluir 3 sessões de estratégias de respiração ou áudio.'),
('Explorador de Rotina', 'https://acalmatea.app/icons/explorador-rotina.png', 'Acumular 50 pontos em desafios diários.'),
('Observador Atento', 'https://acalmatea.app/icons/observador-atento.png', 'Registrar motivos de gatilho detalhados em momentos de sobrecarga.'),
('Mestre do Equilíbrio', 'https://acalmatea.app/icons/mestre-equilibrio.png', 'Alcançar 100 pontos totais na plataforma.');

-- =========================================================================
-- Cenário 2 — Chegada dos Primeiros Usuários
-- Na primeira semana de funcionamento, cinco usuários reais criaram suas 
-- contas no AcalmaTEA com diferentes níveis de suporte para acompanhar suas 
-- rotinas e momentos de desregulação sensorial.
-- =========================================================================

INSERT INTO Usuario (nome_usuario, email, senha, nivel_suporte) VALUES
('Lucas Mendes', 'lucas.mendes@email.com', '$2y$10$hashExemploLucas01', 1),
('Marina Costa', 'marina.costa@email.com', '$2y$10$hashExemploMarina02', 1),
('Pedro Henrique (Resp. Carla)', 'carla.pedro@email.com', '$2y$10$hashExemploPedro03', 2),
('Sofia Almeida', 'sofia.almeida@email.com', '$2y$10$hashExemploSofia04', 2),
('Rafael Nogueira', 'rafael.nogueira@email.com', '$2y$10$hashExemploRafael05', 3);

-- =========================================================================
-- Cenário 3 — Rotina Diária: Registros de Humor e Uso de Estratégias
-- Durante os primeiros dias de uso, os usuários documentaram situações de 
-- sobrecarga sensorial, ansiedade e calma, recorrendo às ferramentas do app 
-- para se autorregular.
-- =========================================================================

INSERT INTO RegistroHumor (id_usuario, data_hora, nivel_humor, motivo_gatilho) VALUES
(1, '2026-11-18 10:15:00', 3, 'Barulho intenso de obras próximo à sala de aula durante a prova.'),
(2, '2026-11-18 14:30:00', 4, 'Mudança inesperada no horário da reunião da faculdade.'),
(3, '2026-11-19 08:45:00', 2, 'Sobrecarga luminosa e som alto no transporte escolar pela manhã.'),
(4, '2026-11-19 19:20:00', 7, 'Ambiente tranquilo em casa após organizar a rotina do dia seguinte.'),
(5, '2026-11-20 11:00:00', 3, 'Desconforto sensorial com textura de roupa nova e ambiente agitado.'),
(1, '2026-11-20 16:00:00', 8, 'Sensação de alívio após usar abafador e praticar respiração guiada.');

INSERT INTO UsuarioEstrategia (id_usuario, id_estrategia, favorita, quantidade_acessos) VALUES
(1, 1, TRUE, 5),
(1, 2, TRUE, 3),
(2, 3, TRUE, 4),
(3, 5, TRUE, 6),
(4, 4, FALSE, 2),
(5, 2, TRUE, 7);

-- =========================================================================
-- Cenário 4 — Engajamento: Desafios Concluídos e Recompensas Desbloqueadas
-- Ao final da primeira semana, com base nos registros feitos e estratégias 
-- utilizadas, os cinco usuários concluíram desafios e desbloquearam suas 
-- primeiras conquistas gamificadas no perfil.
-- =========================================================================

-- ATENÇÃO: Ajuste o nome da 4ª coluna abaixo (pontos_ganhos) caso tenha usado outro nome no seu DDL
INSERT INTO UsuarioDesafio (id_usuario, id_desafio, data_conclusao, pontos_ganhos) VALUES
(1, 1, '2026-11-18 10:20:00', 10),
(1, 4, '2026-11-20 16:05:00', 75),
(2, 2, '2026-11-18 14:40:00', 20),
(3, 1, '2026-11-19 08:50:00', 10),
(4, 3, '2026-11-19 19:25:00', 50),
(5, 5, '2026-11-20 11:15:00', 100);

-- ATENÇÃO: Ajuste o nome da 4ª coluna abaixo (visualizada) caso tenha usado outro nome no seu DDL
INSERT INTO UsuarioRecompensa (id_usuario, id_recompensa, data_desbloqueio, visualizada) VALUES
(1, 1, '2026-11-18 10:21:00', TRUE),
(1, 2, '2026-11-20 16:06:00', TRUE),
(2, 1, '2026-11-18 14:41:00', FALSE),
(3, 3, '2026-11-19 09:00:00', TRUE),
(4, 4, '2026-11-19 19:30:00', FALSE),
(5, 5, '2026-11-20 11:20:00', TRUE);
