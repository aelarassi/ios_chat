# ChatBot Library

## Description
La bibliothèque `ChatBot` est une solution complète pour intégrer un chatbot dans une application iOS, que ce soit avec SwiftUI ou UIKit. Elle comprend deux composants principaux : `ChatBotView` et `SatisfactionBottomSheet`.

## Installation
Fichier -> Packages Swift -> Ajouter une dépendance de package et utilisez l'URL `https://scm-platform.inwi.ma/inwi/digitalworkspace/chatbot-inwi/ios`.

## Intégration de la bibliothèque `ChatBot` avec SwiftUI

### Utilisation de `ChatBotView`

#### Exemple d'intégration dans une interface SwiftUI

```swift
import Chatbot

struct YourView: View {
    var body: some View {
       ChatBotPackage.chatBotView(
            userInfos: UserInfos(
                firstName: "Badr",
                lastName: "Hourimeche",
                mdn: "+212600003520",
                lang: .francais,
                canal = "myinwi",
                profile = .prepaid
            ) {
                // Gérer le retour arrière
            }
        )
    }
}
```

#### Explication des paramètres
##### `modifier`
- **Type**: `ViewModifier`
- **Description**: Permet de personnaliser l'apparence et le comportement du composant `ChatBotView`. Vous pouvez utiliser des modificateurs pour ajuster la taille, le placement, les marges, etc. En SwiftUI, vous appliquez le modificateur directement à la vue en utilisant `.modifier()` ou d'autres modificateurs intégrés.

##### `userInfos`
- **Type**: `UserInfos`
- **Description**: Contient les informations relatives à l'utilisateur. Vous devez fournir un objet `UserInfos` avec les informations suivantes :
  - **`firstName`**: Le prénom de l'utilisateur.
  - **`lastName`**: Le nom de famille de l'utilisateur.
  - **`mdn`**: Le numéro de téléphone mobile de l'utilisateur.
  - **`lang`** (optionnel): La langue utilisée de l'utilisateur , qui peut être `.francais` ou `.arabe` (par défaut : `.francais`).
  - **`canal`** (optionnel): Le canal utilisé (par défaut : `"myinwi"`).
  - **`profile`** (optionnel): Le type de profil de l'utilisateur, qui peut être `.postpaid`, `.prepaid`, ou `.wifi` (par défaut : `.prepaid`).

##### `onHomeBackPressed`
- **Type**: `(() -> Void)?`
- **Description**: Une fermeture optionnelle qui sera appelée lorsque l'utilisateur appuie sur le bouton retour à la page d'accueil. Vous pouvez utiliser cette fonction pour gérer des actions spécifiques à cet événement.

### Utilisation de `SatisfactionBottomSheet`

La fonction `SatisfactionBottomSheet` de la bibliothèque `ChatBot` permet d'afficher une feuille de bas de page pour obtenir des avis de satisfaction. Voici comment l'intégrer dans votre projet.

#### Exemple d'intégration dans une interface SwiftUI


```swift
import Chatbot

struct YourView: View {
      @State var openBottomSheet = false

      var body: some View {
        ZStack {
            Button(action: {
                openBottomSheet = true
            }) {
                Text("Open Satisfaction POP-UP")
            }
        }.sheet(isPresented: $openBottomSheet) {
            ChatBotPackage.satisfactionBottomSheet(
                userInfos: UserInfos(
                    firstName: "Badr",
                    lastName: "Hourimeche",
                    mdn: "+212600003520",
                    lang: .francais,
                    canal = "myinwi",
                    profile = .prepaid
                ) {
                    openBottomSheet = false
                }
            )

        }
    }
}
```

#### Explication des paramètres

##### `modifier`

- **Type**: `ViewModifier`
- **Description**: Permet de personnaliser l'apparence et le comportement du composant `ChatBotView`. Vous pouvez utiliser des modificateurs pour ajuster la taille, le placement, les marges, etc. En SwiftUI, vous appliquez le modificateur directement à la vue en utilisant `.modifier()` ou d'autres modificateurs intégrés.

##### `userInfos`
- **Type**: `UserInfos`
- **Description**: Contient les informations relatives à l'utilisateur. Vous devez fournir un objet `UserInfos` avec les informations suivantes :
  - **`firstName`**: Le prénom de l'utilisateur.
  - **`lastName`**: Le nom de famille de l'utilisateur.
  - **`mdn`**: Le numéro de téléphone mobile de l'utilisateur.
  - **`lang`** (optionnel): La langue utilisée de l'utilisateur , qui peut être `.francais` ou `.arabe` (par défaut : `.francais`).
  - **`canal`** (optionnel): Le canal utilisé (par défaut : `"myinwi"`).
  - **`profile`** (optionnel): Le type de profil de l'utilisateur, qui peut être `.postpaid`, `.prepaid`, ou `.wifi` (par défaut : `.prepaid`).

##### `openBottomSheet`

- **Type**: `Boolean`
- **Description**: Indique si la feuille de bas de page doit être affichée ou non. Vous devez contrôler cette valeur pour ouvrir ou fermer la feuille de bas de page. Par exemple, vous pouvez utiliser une variable d'état pour gérer cette visibilité.

##### `onDismiss`

- **Type**: `() -> Void`
- **Description**: Fonction de rappel appelée lorsque la feuille de bas de page est fermée. Vous devez fournir une fonction qui gère les actions à effectuer lorsque l'utilisateur ferme la feuille de bas de page, comme mettre à jour l'état `openBottomSheet`.


## Intégration de la bibliothèque `ChatBot` dans une application avec UIKit :
Vous pouvez intégrer ChatBotView dans un UIViewController. Voici un exemple de comment vous pouvez le faire :


```swift
import UIKit
import Chatbot

class YourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialiser et configurer le ChatBotView
        let chatBotView = ChatBotPackage.chatBotView(
            userInfos: UserInfos(
                firstName: "Badr",
                lastName: "Hourimeche",
                mdn: "+212600003520",
                lang: .francais,
                canal: "myinwi",
                profile: .prepaid
            )
        ) {
            // Gérer le retour arrière
        }

        // Ajouter le ChatBotView à la vue principale
        chatBotView.frame = self.view.bounds // Ajuster la taille si nécessaire
        chatBotView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(chatBotView)
    }
}

```


## Callback pour la gestion des événements Firebase

```swift
ChatBotPackage.setFirebaseCallback { event in
    // Ce callback est déclenché à chaque fois qu'un événement doit être enregistré ou traité
    // L'objet `event` contient le nom de l'événement, qui est passé au callback
}
```

### Détails de la fonction :
- **ChatBotPackage.setFirebaseCallback** : Cette fonction permet de définir un callback pour capturer et traiter les événements déclenchés au sein de l'application.

#### Paramètre event :
- **event.rawValue** : C'est une chaîne de caractères représentant le nom de l'événement à traiter. L'utilisateur peut utiliser ce nom pour enregistrer ou gérer l'événement selon les besoins spécifiques de l'application.
Ce callback fournit un moyen flexible pour réagir à différents événements, tels que des interactions utilisateur ou des actions importantes, et permet à l'utilisateur de définir sa propre logique de traitement.




## Callback pour la gestion des codes de redirection

```swift
ChatBotPackage.setRedirectCodeCallback { code in
    // Ce callback est déclenché chaque fois qu'un code interne de redirection est généré
    // Le paramètre `code` contient le code de redirection à utiliser pour naviguer dans l'application
}
```

### Détails de la fonction :
- **ChatBotPackage.setRedirectCodeCallback** : Cette fonction permet de définir un callback qui capture les codes de redirection internes.

#### Paramètre code :
- **code** : Représente un code de redirection unique généré par le module. Ce code peut être utilisé pour naviguer vers une page ou un écran spécifique au sein de l'application.

## Dépendance de l'Environnement sur le Bundle ID

Ce SDK est conçu pour adapter son environnement en fonction du Bundle ID de l'application iOS sur laquelle il est utilisé. La classe Environment gère plusieurs environnements (DEV, RECETTE, PREPROD, PROD) en fonction du Bundle ID associé. Chaque environnement a une URL de base distincte ainsi qu'une liste de noms de package spécifiques pour diriger les appels API vers le bon environnement.

  - **DEV** : Environnement de développement avec le Bundle ID ma.inwi.selfcaremobile.dev.
  - **RECETTE** : Environnement de test avec le Bundle ID ma.inwi.selfcaremobile.recette.
  - **PREPROD** : Environnement de pré-production avec le Bundle ID ma.inwi.selfcaremobile.preprod.
  - **PROD** : Environnement de production avec le Bundle ID ma.inwi.selfcaremobile.

Ainsi, en fonction du Bundle ID, le SDK pointe automatiquement vers l'environnement approprié pour garantir le bon fonctionnement.
