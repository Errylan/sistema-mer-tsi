
SELECT 
    u.nome_usuario AS 'Usuário',
    r.data_hora AS 'Data do Registro',
    r.nivel_humor AS 'Nível de Humor (1-10)',
    r.motivo_gatilho AS 'Gatilho/Contexto'
FROM Usuario u
INNER JOIN RegistroHumor r ON u.id_usuario = r.id_usuario
ORDER BY r.data_hora DESC;

SELECT 
    u.nome_usuario AS 'Usuário',
    rec.nome_recompensa AS 'Recompensa Desbloqueada',
    ur.data_desbloqueio AS 'Data de Conquista'
FROM Usuario u
LEFT JOIN UsuarioRecompensa ur ON u.id_usuario = ur.id_usuario
LEFT JOIN Recompensa rec ON ur.id_recompensa = rec.id_recompensa
ORDER BY u.nome_usuario ASC, ur.data_desbloqueio DESC;

SELECT 
    u.nome_usuario AS 'Usuário',
    COUNT(ud.id_desafio) AS 'Desafios Concluídos'
FROM Usuario u
INNER JOIN UsuarioDesafio ud ON u.id_usuario = ud.id_usuario
GROUP BY u.id_usuario, u.nome_usuario
ORDER BY `Desafios Concluídos` DESC;

SELECT 
    e.nome_estrategia AS 'Estratégia',
    e.categoria AS 'Categoria',
    SUM(ue.quantidade_acessos) AS 'Total de Acessos Globais',
    COUNT(DISTINCT ue.id_usuario) AS 'Usuários Únicos'
FROM Estrategia e
INNER JOIN UsuarioEstrategia ue ON e.id_estrategia = ue.id_estrategia
GROUP BY e.id_estrategia, e.nome_estrategia, e.categoria
ORDER BY `Total de Acessos Globais` DESC;
