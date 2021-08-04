<h1 align="center">
    📌<a> Taskee </a>
</h1>

<h3 align="center">
    Taskee is an App where you will manage and organize your tasks.
</h3>

## 📃 About
  Taskee is a to do app developed using Clean Architecture and TDD. 
  
  Using firebase services to authentication and realtime database with CI/CD in CodeMagic.  

## ⚙️ Functionalities

- [x] The user can sign in with your account
- [ ] The user can sign in with a Google account
- [ ] The user can create an account
- [ ] The user can create tasks
- [ ] The user can delete your tasks
- [ ] The user can update your tasks
- [ ] The user can update the state of your tasks 

## 📐 Architecture 
   The project is being done using Clean Architecture, TDD, and Conventional Commits.
   
   Your structure is divided into four principal layers:
   - Domain: The heart of the application, business rules, and use cases are here, as well as the repositories interfaces.
   - Infra: In here are the repositories implementations, models, and data sources interfaces.
   - External: In here are the external connection behind data sources implementations.
   - UI: All pages of the app with your controllers and components.
   


## 🎨 Layout

O layout da aplicação pode ser acessado no [Figma](https://www.figma.com/file/of21LcDFLXU6aTN2GiSSyh/Taskee?node-id=0%3A1).

## 🛠 Technologies

- **[Firebase](https://firebase.google.com/products/auth?gclsrc=aw.ds&gclid=CjwKCAjw9aiIBhA1EiwAJ_GTSoOXq5Yt_uQblGU9Z2aQuUxWfH8sD9eL1DcpVUXG11RJ7QxhshJ6sRoCKogQAvD_BwE)** - To authentication and realtime database.
- **[Codemagic](https://codemagic.io/)** - To Continuous integration and deployment.
- **[GitFlow with Sourcetree](https://www.sourcetreeapp.com/)** - To better management of the branches

All the Firebase communications were made with Rest API to avoid coupling with the external world. 

## 💻 Development Technologies
- **[Cubit](https://pub.dev/packages/flutter_bloc)** - A bloc based state management with Cubit
- **[Get_it](https://pub.dev/packages/get_it)** - A service locator to dependency injection and singleton management
- **[DartZ](https://pub.dev/packages/dartz)** - To functional programming
- **[Mocktail](https://pub.dev/packages/mocktail)** - To unity tests
