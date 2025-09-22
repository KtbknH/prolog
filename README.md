# Collection de Programmes Prolog

Cette collection contient plusieurs programmes Prolog illustrant différents concepts et applications de la programmation logique.

## Vue d'ensemble de Prolog

Prolog (PROgrammation en LOGique) est un langage de programmation basé sur la logique du premier ordre. Il utilise un paradigme déclaratif où les programmes sont exprimés sous forme de faits et de règles logiques. Le moteur d'inférence de Prolog utilise l'unification et le retour-arrière pour résoudre les requêtes.

## Fichiers inclus

### 1. base.pl - Concepts fondamentaux
Ce fichier introduit les concepts de base de Prolog :

#### Faits de base
- Animaux domestiques : `chat(tom)`, `chien(bobby)`, `lapin(bunny)`
- Relations de propriété : `proprietaire(animal, proprietaire)`

#### Règles logiques
- **Herbivores** : Les lapins sont herbivores
- **Domestiques** : Les chats, chiens et lapins sont domestiques
- **Carnivores** : Les chats, chiens et lions sont carnivores
- **Règles composées** : `domestiqueCarnivore(X)` combine deux prédicats

#### Concepts clés illustrés
- **Unification** : Liaison des variables avec les valeurs
- **Retour-arrière** : Exploration de toutes les solutions possibles
- **Conjonction (ET)** : Utilisation de la virgule `,`
- **Disjonction (OU)** : Règles multiples pour un même prédicat

**Tests suggérés** :
```prolog
?- chien(bobby).     % Vrai
?- domestique(X).    % Toutes les solutions
?- proprietaireLapin(P,L). % Propriétaires de lapins
```

### 2. arbre.pl - Relations familiales
Programme complexe modélisant un arbre généalogique complet.

#### Structure des données
- **Personnes** : `male(nom)`, `femelle(nom)`
- **Relations de base** : `enfant(enfant, parent)`, `mari(homme, femme)`

#### Relations dérivées
- **Relations directes** : `pere/2`, `mere/2`, `garcon/2`, `fille/2`
- **Relations fraternelles** : `sibilin/2`, `bro/2`, `sis/2`
- **Relations générationnelles** : `grandpere/2`, `grandmere/2`
- **Relations étendues** : `oncle/2`, `tante/2`, `cousin/2`, `cousine/2`
- **Relations génériques** : `famille/2`, `aieul/2`

#### Concepts avancés
- **Récursion** : Définition récursive des ancêtres
- **Négation** : `X \= Y` pour éviter l'auto-relation
- **Règles complexes** : Combinaison de multiples conditions

**Exemples d'utilisation** :
```prolog
?- pere(pierre, X).      % Enfants de Pierre
?- sibilin(X, Y).        % Toutes les paires de frères/sœurs
?- famille(pierre, X).   % Tous les membres de la famille de Pierre
```

### 3. peano.pl - Arithmétique de Peano
Implémentation de l'arithmétique naturelle selon Giuseppe Peano.

#### Représentation des nombres
- **Zéro** : `zero`
- **Successeur** : `s(X)` représente X+1
- **Exemples** : `s(zero)` = 1, `s(s(zero))` = 2

#### Opération d'addition
- **Cas de base** : `plus(X, zero, X)`
- **Cas récursif** : `plus(X, s(Y), s(Z)) :- plus(X, Y, Z)`

Cette approche illustre comment définir l'arithmétique de manière purement logique, sans opérateurs numériques prédéfinis.

**Tests** :
```prolog
?- peano(s(s(zero))).    % Vérifie si c'est un nombre de Peano
?- plus(s(zero), s(zero), X). % 1 + 1 = ?
```

### 4. jeu.pl - Le compte est bon
Résolveur pour le jeu "Le compte est bon" (version française de "Countdown Numbers").

#### Prédicats utilitaires
- `selection/3` : Sélection d'un élément dans une liste
- `ajouQueue/3`, `ajoutTete/3` : Manipulation de listes

#### Opérations arithmétiques
- `mult/3`, `add/3`, `sub/3`, `div/3` : Opérations de base
- Contraintes : Division entière seulement

#### Algorithme principal
- `selectionDouble/4` : Sélectionne deux nombres (le plus grand en premier)
- `calcul/4` : Effectue une opération et génère la trace
- `compte/3` : Algorithme récursif principal

**Utilisation** :
```prolog
?- compte([25,50,75,100,3,6], 952, Operations).
```
Trouve une séquence d'opérations pour atteindre 952 avec les nombres donnés.

### 5. jeu_expert.pl - Système expert de devinette d'animaux
Système expert interactif qui apprend en posant des questions.

#### Base de connaissances dynamique
- `arbre/3` : Structure d'arbre de décision
- Base initiale avec quelques animaux (vipère, chien, éléphant, âne)

#### Mécanisme d'apprentissage
- Pose des questions binaires
- Apprend de nouveaux animaux en cas d'échec
- Modifie automatiquement l'arbre de décision

#### Interface utilisateur
- `poseQuestion/2` : Interaction avec l'utilisateur
- `proposeAnimal/1` : Proposition finale
- `modifierArbre/3` : Apprentissage dynamique

**Utilisation** :
```prolog
?- jeu.
```
Lance une session interactive de devinette d'animaux.

## Concepts Prolog illustrés

### Unification
Mécanisme central de Prolog pour faire correspondre termes et variables.

### Retour-arrière (Backtracking)
Exploration systématique de toutes les solutions possibles.

### Récursion
Définition de prédicats en termes d'eux-mêmes (voir `aieul/2`, `plus/3`).

### Prédicats dynamiques
Modification de la base de connaissances à l'exécution (`jeu_expert.pl`).

### Manipulation de listes
Opérations fondamentales sur les structures de données.

### Contraintes arithmétiques
Utilisation d'opérateurs comme `is`, `\=`, `mod` pour les calculs.

## Exécution

Pour tester ces programmes :
1. Lancez votre interpréteur Prolog (SWI-Prolog recommandé)
2. Chargez un fichier : `?- [nomfichier].`
3. Testez avec les requêtes suggérées

## Objectifs pédagogiques

Ces programmes illustrent progressivement :
- Les concepts de base de la programmation logique
- La modélisation de relations complexes
- L'arithmétique symbolique
- Les algorithmes de recherche et optimisation
- Les systèmes experts et l'apprentissage automatique

Chaque fichier peut être étudié indépendamment ou dans l'ordre pour une progression logique dans l'apprentissage de Prolog.
