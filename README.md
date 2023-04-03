# CSTViOS
Fuze code Challenge using PandaScore API

CSTViOS is a study software purpose to demonstrate ability in various technologies such as software development, software engineering, knowledge in swift, git, unit tests, iOS Human Interface Guidelines, HTTP Requests and much more.

This app uses MVVM architectural pattern to facilitate test automation, using mock data as well as its maintenance. It was developed using swift as a program language and SwiftUI as a user interface framework as Apple suggests.

Some SOLID principles were used here such as Single Responsabilit, Dependency Inversion and anothers techniques like dependency injection.

The files of the project were organized in the following groups: Model, ViewModel, View and Service.

- Model refers to model structs to hold informations received from the JSON of API's responses
- ViewModel where classes that hold the logic
- View refers to screens or subcomponents 
- Service refers to a network layer that includes requests, errors definitions and protocols.

## Main files

* ContentView - It is the first view displayed in the project and it handles the exhibition between SplashScreenView and MatchListView. Beyond that it defines the colorScheme.

* MatchViewModel - It is the main viewModel of the app, it holds all the logic behind MatchListView information and behavior. It provides information to MatchListView as well the ability to select a match. It also holds an instance of playersViewModel.

* MatchListView - Displays a list of MatchCardView based on MatchViewModel, it also allows users to navigate to MatchDetailView.

* PlayersViewModel - Holds the logic around the information needed to display MatchDetailView.

* Service - Define the methods to request and process information from PandaScore endpoints.

## Unit tests

There are thow classes that tests the logic bihind the apps view models, they are: CSTVPlayersViewModelTests and CSTVMatchViewModelTests.
Its names make clear what about tests is, both thogeter cover about 46% of the code. The image below shows code covarage details.

![Screenshot 2023-04-03 at 11 50 50](https://user-images.githubusercontent.com/20543173/229546368-0094f83e-a8f1-42b5-b710-fbdfd8443343.png)
