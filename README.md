# 🌐 TechWorld News App

O TechWorld é um aplicativo de notícias moderno e bilíngue (Português e Inglês) desenvolvido para dispositivos móveis. O sistema consome dados em tempo real através da API da GNews, oferecendo um feed de manchetes atualizado com suporte a pesquisa, filtro por categorias, rolagem contínua (infinite scroll) e troca de temas (claro/escuro), mantendo as preferências do usuário salvas localmente no dispositivo.

## 🛠️ Tecnologias Utilizadas

* **[Flutter](https://flutter.dev/):** Framework principal para a construção da interface do aplicativo.
* **Dart:** Linguagem de programação base do projeto.
* **[http](https://pub.dev/packages/http):** Pacote utilizado para requisições assíncronas e consumo da API RESTful.
* **[get (GetX)](https://pub.dev/packages/get):** Utilizado para o roteamento de telas e sistema de internacionalização (tradução simultânea).
* **[shared_preferences](https://pub.dev/packages/shared_preferences):** Armazenamento local para salvar as configurações de tema e idioma escolhidas pelo usuário.

## 👥 Equipe de Desenvolvimento

Projeto desenvolvido de forma colaborativa por:
* **Thiago Alexandre Braga de Medeiros**
* **Marcos Vinícius Dantas da Silva**
* **Thiago Gomes de Oliveira**

* ## 🚀 Como Executar o Projeto

### 1. Clonar o Repositório

Clone o projeto para sua máquina local utilizando o comando:

```bash
git clone https://github.com/thiagobraga77/TechWorld.git
```

### 2. Acessar a Pasta do Projeto

Entre no diretório do projeto:

```bash
cd TechWorld
```

### 3. Instalar as Dependências

Execute o comando abaixo para baixar todas as dependências necessárias definidas no arquivo `pubspec.yaml`:

```bash
flutter pub get
```

### 4. Verificar a Instalação do Flutter

Opcionalmente, verifique se o ambiente Flutter está configurado corretamente:

```bash
flutter doctor
```

### 5. Executar a Aplicação

Inicie a aplicação utilizando um servidor web local:

```bash
flutter run -d web-server
```

Após a execução, o terminal exibirá uma mensagem semelhante a:

```text
Flutter Web Server listening at:
http://localhost:54321
```

### 6. Abrir no Navegador

Copie o endereço exibido pelo terminal e cole na barra de endereços do navegador (Google Chrome, Firefox ou outro navegador compatível).

Exemplo:

```text
http://localhost:54321
```

A aplicação será carregada e estará pronta para utilização.

