# Tablette

## Configurer l'adresse IP du serveur

Aller au fichier `lib/router.dart`.
Modifier la ligne 110 pour y écrire l'adresse du serveur.

## Lancer l'application sur simulateur sur macOS

Lancer les commandes 

```
open -a Simulator
flutter run
```

L'accès aux capteurs dépends des simulateurs et peut ne pas etre implémenté.

## Lancer l'application sur un autre dispolitif

Le lancement d'une application flutter dépends de l'OS de l'ordinateur, du choix d'utiliser un simulateur ou non, et de l'OS de la tablette cible.
Il est recommandé de lancer l'application sur des dispositifs iOS qui garantissent un accès aux capteurs utilisés.
Voir la documentation de flutter pour le lancement d'applications selon l'ordinateur et le dispositif cible.
https://flutter.dev/docs/get-started/install
