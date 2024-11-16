# Simples Sistema de Login com Flutter

## Visão Geral

Este projeto é uma aplicação de login desenvolvida em Flutter, utilizando o padrão BLoC (Business Logic Component) para gerenciamento de estado, e o pacote Formz para validação de formulários. O sistema de autenticação utiliza um serviço de API para validar as credenciais do usuário, realizando validação de senha através de chamadas HTTP.

## Funcionalidades
- Login: Validação de credenciais (usuário e senha).

- Validação de Senha: A senha é validada por meio de uma API externa.

- Mensagens de Sucesso/Erro: Exibição de mensagens de sucesso ou falha após a tentativa de login.

# Tecnologias Utilizadas

Flutter: Framework principal para o desenvolvimento do aplicativo.

- Bloc (flutter_bloc): Gerenciamento de estado e eventos.
- Formz: Validação de formulários.
- Dio: Biblioteca HTTP para chamadas de API.
- Equatable: Para facilitar a comparação de objetos no BLoC.

# Estrutura do Projeto
```css

lib/
├── main.dart
├── features/
│   └── login/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── dio_service.dart
│       │   ├── models/
│       │   │   └── password.dart
│       │   │   └── username.dart
│       │   └── repositories/
│       │       └── authentication_repository.dart
│       ├── domain/
│       │   └── entities/
│       │       └── user_entitie.dart
│       └── presentation/
│           ├── bloc/
│           │   └── login_bloc.dart
│           ├── pages/
│           │   └── login_page.dart
│           │   └── success_page.dart
│           └── widgets/
│               └── password_input.dart
│               └── username_input.dart

```