# sistema-mer-tsi

AcalmaTEA - Modelagem de Banco de Dados
Descrição do Minimundo

O AcalmaTEA é um aplicativo mobile voltado para a autorregulação, acompanhamento de rotina e suporte para adultos no Transtorno do Espectro Autista (TEA). Em sua versão inicial, a aplicação armazenava os registros de humor e as preferências do usuário apenas localmente no dispositivo.

O problema do mundo real que este projeto de banco de dados visa resolver é a persistência e sincronização em nuvem. Com a modelagem deste banco relacional, os usuários poderão criar contas, garantindo que seus históricos de crises, gatilhos, desafios concluídos e recompensas alcançadas não sejam perdidos caso troquem de smartphone ou precisem acessar a plataforma de outro dispositivo.
Contexto da Aplicação

O sistema atua como um diário de regulação emocional e gamificação do bem-estar. Ele gerencia o perfil do usuário, seu histórico de humor, as estratégias de conforto (como ruído branco ou exercícios de respiração) que ele utiliza, além de um sistema motivacional baseado em desafios diários e recompensas (badges/conquistas).
Processos Principais

O banco de dados precisa atender às seguintes tarefas fundamentais:

  Gestão de Contas: Cadastro e autenticação de usuários (e-mail, senha, nível de suporte).

  Registro de Humor (Diário): Inserção de logs diários contendo data, hora, o nível de humor no momento e possíveis gatilhos que causaram desregulação.

  Mapeamento de Estratégias: Associação de quais atividades de autorregulação o usuário mais acessa ou favorita em momentos de crise.

  Sistema de Gamificação: Rastreamento de quais desafios o usuário concluiu e quais recompensas do catálogo do app ele já destravou no seu perfil.

Regras de Negócio

  Privacidade de Dados: Cada Registro de Humor pertence exclusivamente a um único usuário. Nenhum usuário pode ter acesso aos logs de diário de outra conta.

  Catálogo Global: As Estratégias de autorregulação, os Desafios e as Recompensas são itens globais do sistema. Um mesmo desafio ou recompensa pode ser atribuído a múltiplos usuários diferentes.

   Integridade do Histórico: Se um usuário excluir sua conta, seus registros de humor pessoais devem ser excluídos (ou anonimizados), mas as entidades globais (desafios, recompensas) permanecem no banco.
