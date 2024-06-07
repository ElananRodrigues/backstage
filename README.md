# [Backstage.io](https://backstage.io)

Alimentado por um catálogo de software centralizado, o Backstage restaura a ordem em sua infraestrutura e permite que suas equipes de produto enviem códigos de alta qualidade rapidamente, sem comprometer a autonomia.

- [Node](https://nodejs.org/en)
- [nvm](https://github.com/nvm-sh/nvm)
- [Docker](https://www.docker.com/)
- [Postgres](https://www.postgresql.org/)

Para setar a versão do node, use o comando abaixo.

```sh
$ nvm use
```

É necessario instalar os pacotes:
```sh
$ yarn install
```

Para rodar a aplicação.
```sh
$ yarn dev
```


```mermaid
flowchart TD;
    B[Backstage.io Template] -->|Cria um novo Repo para a aplicação. <br>Adiciona um PR no Repo gitops para criar o serviço no ECS.| C{Action}
    C --> D[Repo gitops];
    C --> E[Repo novo-repo];
    C --> F[Repo repo-existente];
    C --> G[Repo dataops];
    D[Repo novo-repo] -->|Atualiza o serviço no ECS.| J{Action}
    E[Repo gitops] -->|Cria o serviço no ECS.| J{Action}
    F[Repo repo-existente] -->|Adiciona um PR para incluir a <br> estrutura necessaria.| J{Action}
    G[Repo dataops] -->|Adiciona um PR para <br> criar novos clusters| J{Action}
    J --> K[Cluster DEV];
    J --> L[Cluster STG];
    J --> M[Cluster PROD];
```