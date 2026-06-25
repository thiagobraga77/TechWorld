# 🌐 TechWorld News App

O TechWorld é um aplicativo de notícias moderno e bilíngue (Português e Inglês) desenvolvido para dispositivos móveis. O sistema consome dados em tempo real através da API da GNews, oferecendo um feed de manchetes atualizado com suporte a pesquisa, filtro por categorias, rolagem contínua (infinite scroll) e troca de temas (claro/escuro), mantendo as preferências do usuário salvas localmente no dispositivo.

## 🛠️ Tecnologias Utilizadas

* **[Flutter](https://flutter.dev/):** Framework principal para a construção da interface do aplicativo.
* **Dart:** Linguagem de programação base do projeto.
* **[http](https://pub.dev/packages/http):** Pacote utilizado para requisições assíncronas e consumo da API RESTful.
* **[get (GetX)](https://pub.dev/packages/get):** Utilizado para o roteamento de telas e sistema de internacionalização (tradução simultânea).
* **[shared_preferences](https://pub.dev/packages/shared_preferences):** Armazenamento local para salvar as configurações de tema e idioma escolhidas pelo usuário.

## ⚙️ Instalação e Configuração do Ambiente

Antes de executar o projeto, é necessário instalar e configurar o Flutter SDK, que já inclui o Dart SDK, além do Visual Studio Code.

### 1. Instalar o Flutter SDK

1. Acesse o site oficial do Flutter:
   https://flutter.dev/docs/get-started/install

2. Selecione o seu sistema operacional (Windows, Linux ou macOS).

3. Faça o download da versão estável mais recente do Flutter SDK.

4. Extraia o arquivo baixado para um diretório de sua preferência.

   Exemplo no Windows:

   ```text
   C:\flutter
   ```

5. Adicione o diretório `flutter/bin` às variáveis de ambiente (PATH) do sistema.

   Exemplo:

   ```text
   C:\flutter\bin
   ```

6. Reinicie o terminal após concluir a configuração.

### 2. Verificar a Instalação do Flutter

Abra um terminal e execute:

```bash
flutter doctor
```

Esse comando verifica se todas as dependências necessárias estão instaladas corretamente e informa possíveis problemas de configuração.

### 3. Instalar o Visual Studio Code

1. Acesse:
   https://code.visualstudio.com/

2. Faça o download da versão compatível com seu sistema operacional.

3. Execute o instalador e conclua a instalação normalmente.

### 4. Instalar as Extensões Flutter e Dart

Após instalar o VS Code:

1. Abra o Visual Studio Code.
2. Clique na aba **Extensions** (Extensões) ou pressione `Ctrl + Shift + X`.
3. Pesquise por **Flutter**.
4. Instale a extensão oficial do Flutter.
5. Durante a instalação, a extensão **Dart** também será instalada automaticamente.

Essas extensões fornecem recursos como:

* Destaque de sintaxe;
* Autocompletar código;
* Depuração integrada;
* Hot Reload;
* Integração com projetos Flutter.

### 5. Verificar a Instalação do Dart

O Dart é instalado automaticamente junto com o Flutter.

Para verificar a instalação, execute:

```bash
dart --version
```

ou

```bash
flutter --version
```

A saída deverá exibir as versões instaladas do Dart e do Flutter.

Exemplo:

```text
Flutter 3.x.x
Dart 3.x.x
```

Se os comandos forem executados corretamente, o ambiente estará configurado e pronto para executar o projeto.

## 🚀 Como Executar o Projeto

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

### 4. Executar a Aplicação

Inicie a aplicação utilizando um servidor web local:

```bash
flutter run -d web-server
```

Após a execução, o terminal exibirá uma mensagem semelhante a:

```text
Flutter Web Server listening at:
http://localhost:54321
```

### 5. Abrir no Navegador

Copie o endereço exibido pelo terminal e cole na barra de endereços do navegador (Google Chrome, Firefox ou outro navegador compatível).

Exemplo:

```text
http://localhost:54321
```

A aplicação será carregada e estará pronta para utilização.

## 👥 Equipe de Desenvolvimento

Projeto desenvolvido de forma colaborativa por:

* **Thiago Alexandre Braga de Medeiros**
* **Marcos Vinícius Dantas da Silva**
* **Thiago Gomes de Oliveira**
