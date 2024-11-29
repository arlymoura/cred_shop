# Relatório de Funcionários - Sistema de Gestão

Este é um sistema desenvolvido em Ruby on Rails que permite a visualização de relatórios de funcionários agrupados por faixas salariais. Além disso, os relatórios podem ser visualizados tanto em listagem quanto em gráficos interativos utilizando o Chart.js.

## Funcionalidades

- **Relatório de funcionários** agrupados por faixas salariais:
  - Até R$ 1.045,00
  - De R$ 1.045,01 a R$ 2.089,60
  - De R$ 2.089,61 até R$ 3.134,40
  - De R$ 3.134,41 até R$ 6.101,06
- **Gráficos interativos** para representação dos dados utilizando Chart.js.
- Navegação simples com links dinâmicos indicando a página atual.

---

## Pré-requisitos

Certifique-se de ter os seguintes softwares instalados:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## Como rodar o projeto

### 1. Clonar o repositório
Clone este repositório em sua máquina local:
```bash
git clone https://github.com/arlymoura/cred_shop.git
cd cred_shop
```

### 2. Subir docker compose
```bash
docker compose up
```
### OBS: Eu particurlamente acho melhor subir assim:
```bash
docker compose up -d db redis

Logo depois rodar

rails s
e
bundle exec sidekiq

Em uma outra aba do terminal rode também:

bin/setup

```

### 3. Logo apos é só acessar
```bash
http://localhost:3000
http://localhost:3000/sidekiq
```


## Nota
A gem devise para autenticação está configurada e instalda, o que pode ser feito para melhorar
- Adicionar no `app/controllers/application_controller.rb` `before_action :authenticate_user!`
- Ajustar o ajax para pegar o current user para a consulta de valor de desconto
