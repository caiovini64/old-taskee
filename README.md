
<h1 align="center">
    📌<a> Taskee </a>
</h1>

![Frame 1 (1)](https://user-images.githubusercontent.com/45527157/128557946-b05f0d22-1afa-452a-a6a5-5bf406b24f5b.jpg)




 <div align="center"><img alt="Codemagic build badge" src="https://api.codemagic.io/apps/610a8cf053f857d6d492dd2b/610a8cf053f857d6d492dd2a/status_badge.svg"> <img alt="License badge" src="https://img.shields.io/static/v1?label=license&message=MIT&color=blue"></div>



<h3 align="center">
    Taskee is an App where you will manage and organize your tasks.
</h3>

## 📃 About
  Taskee is a to do app developed using Clean Architecture and TDD. 
  
  Using firebase services to authentication and realtime database with CI/CD in CodeMagic.  

## ⚙️ Functionalities

- [x] The user can sign in with your account
- [x] The user can create an account
- [ ] The user can sign in with a Google account
- [x] The user can create tasks
- [ ] The user can delete your tasks
- [ ] The user can update your tasks
- [ ] The user can update the state of your tasks 

## 📐 Architecture

   The project structure is divided into four principal layers:
   - Domain: The heart of the application, business rules, and use cases are here, as well as the datasources interfaces.
   - Data: In here are the external connection behind data sources implementations.
   - UI: All pages of the app with your controllers and components.
   
## 🎨 Layout

The application layout could be accessed in the [Figma](https://www.figma.com/file/of21LcDFLXU6aTN2GiSSyh/Taskee?node-id=0%3A1).

## 🛠 Technologies

- **[Firebase](https://firebase.google.com/products/auth?gclsrc=aw.ds&gclid=CjwKCAjw9aiIBhA1EiwAJ_GTSoOXq5Yt_uQblGU9Z2aQuUxWfH8sD9eL1DcpVUXG11RJ7QxhshJ6sRoCKogQAvD_BwE)** - To authentication and realtime database.
- **[Codemagic](https://codemagic.io/)** - To Continuous integration and deployment.
- **[GitFlow with Sourcetree](https://www.sourcetreeapp.com/)** - To better management of the branches

All the Firebase communications were made with Rest API to avoid coupling with the external world. 

## 💻 Development Technologies
- **[Cubit](https://pub.dev/packages/flutter_bloc)** - A bloc based state management with Cubit
- **[Get_it](https://pub.dev/packages/get_it)** - A service locator and singleton management
- **[DartZ](https://pub.dev/packages/dartz)** - To functional programming
- **[Mocktail](https://pub.dev/packages/mocktail)** - To unity tests
