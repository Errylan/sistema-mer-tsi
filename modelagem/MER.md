
1- Entidades
* **Usuário:** Representa a conta da pessoa que acessa o aplicativo, garantindo a privacidade e a sincronização dos dados.
* **RegistroHumor:** Armazena o log do estado emocional e o contexto de uma desregulação em um momento específico (diário).
* **Estrategia:** Ferramentas e atividades de autorregulação oferecidas no app (ex: ruído branco, respiração).
* **Desafio:** Metas propostas pelo aplicativo para incentivar a rotina e o bem-estar.
* **Recompensa:** Conquistas, selos ou troféus que o usuário pode desbloquear ao usar o app.

2. Relacionamentos e Cardinalidades
* **[Usuário] (1) < registra > (N) [RegistroHumor]**
  Explicação: Um Usuário pode fazer N registros de humor ao longo do tempo, mas cada registro salvo no banco pertence exclusivamente a apenas 1 Usuário.
* **[Usuário] (N) < ganha > (M) [Recompensa]**
  Explicação: Um Usuário pode acumular múltiplas Recompensas em seu perfil, e uma mesma Recompensa do catálogo pode ser destravada por múltiplos Usuários.
* **[Usuário] (N) < conclui > (M) [Desafio]**
  Explicação: Um Usuário pode concluir vários Desafios, e um mesmo Desafio global pode ser concluído por vários Usuários diferentes.
* **[Usuário] (N) < acessa > (M) [Estrategia]**
  Explicação: O Usuário pode favoritar ou acessar várias Estratégias, e uma mesma Estratégia atende a vários Usuários.

3. Sugestão de Atributos
* **Usuário:** id_usuario (PK), nome_usuario, email, senha, nivel_suporte.
* **RegistroHumor:** id_registro (PK), id_usuario (FK), data_hora, nivel_humor, motivo_gatilho.
* **Estrategia:** id_estrategia (PK), nome_estrategia, categoria (ex: áudio, respiração), descricao.
* **Desafio:** id_desafio (PK), titulo, descricao, pontuacao_necessaria.
* **Recompensa:** id_recompensa (PK), nome_recompensa, icone_url, condicao_desbloqueio.

4. Diagrama Entidade e Relacionamento (DER)
![Diagrama DER do AcalmaTEA](./banco_de_dados_acalmatea.png)
