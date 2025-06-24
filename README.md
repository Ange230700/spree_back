<!-- README.md -->

# Spree Back

<!-- > ![Logo du projet](lien-vers-logo.png) -->

Un backend robuste, évolutif et modulaire pour une plateforme e-commerce moderne. Construit avec **NestJS** et **TypeScript**, Spree Back propose une API REST complète pour gérer les utilisateurs, l’authentification, les produits, les commandes, les paiements, les avis, et plus encore. Propulsé par **Prisma ORM** et MySQL, il gère des relations avancées et applique les meilleures pratiques en termes de maintenabilité, de sécurité et d’expérience développeur.

---

## Table des matières

<!-- * [Démo](#démo) -->

- [Stack Technique](#stack-technique)
- [Démarrage](#démarrage)
- [Lancement du projet](#lancement-du-projet)
- [Architecture du projet](#architecture-du-projet)
- [Documentation de l’API](#documentation-de-lapi)
- [Tests](#tests)
- [Déploiement](#déploiement)
- [Variables d’environnement](#variables-denvironnement)
- [Contribuer](#contribuer)
- [Licence](#licence)
  <!-- * [Remerciements](#remerciements) -->
  <!-- * [Contact](#contact) -->

<!-- ---

## Démo

*Aucune démo en ligne pour le moment.* -->

<!-- Tu peux ajouter ici des captures d'écran de l’API, Swagger UI ou exemples de code si tu veux. -->

---

## Stack Technique

**Backend :**

- **NestJS** (TypeScript)
- **Express** (via Nest)
- **Prisma ORM**

**Base de données :**

- **MySQL** <!-- (compatible avec PostgreSQL/MongoDB si tu adaptes le schéma Prisma) -->

**Tests :**

- **Jest** (tests unitaires/e2e)
- **Supertest** (tests des endpoints API)

**Outils & Expérience Dev :**

- **Docker** (optionnel, pour dev & déploiement)
- **Husky** (hooks Git)
- **Commitlint** & **Commitizen** (commits conventionnels)
- **Prettier** & **ESLint** (qualité du code)
- **GitHub Actions** (CI/CD)

---

## Démarrage

### Prérequis

- Node.js (>=20.x)
- Base de données MySQL (ou compatible)
- Docker (optionnel, pour la containerisation)

### Installation

```bash
git clone https://github.com/username/spree_back.git
cd spree_back
npm install
```

---

## Lancement du projet

> **Démarrer le backend en mode développement :**

```bash
npm run start:dev
```

> **Construire pour la production :**

```bash
npm run build
npm run start:prod
```

> **Lancer les migrations et le seed de la base de données :**

```bash
npm run prisma:migrate:dev
npm run prisma:db:seed
```

---

## Architecture du projet

```
├── src
│   ├── main.ts           # Point d'entrée de l’application
│   ├── app.module.ts     # Module principal NestJS
│   └── ...               # Modules fonctionnels et controllers
├── prisma
│   ├── schema.prisma     # Schéma Prisma (modèles DB)
│   └── main.ts           # Scripts de seed
├── test                  # Tests unitaires et e2e
├── docs                  # Docs projet & API
├── .env.sample           # Exemple de variables d’environnement
├── package.json          # Config & scripts NPM
└── tsconfig.json         # Config TypeScript
```

---

## Documentation de l’API

Le backend expose une API REST pour la gestion des :

- Utilisateurs, authentification (sessions, rôles, tokens de refresh)
- Produits, catégories, vendeurs, paniers
- Commandes, articles de commande, paiements, livraisons
- Avis produits, likes

**Voir la route API `/docs` pour la documentation OpenAPI/Swagger** (ou lien vers la doc API dès qu’elle sera générée).

---

## Tests

Lance les tests avec :

```bash
npm test
```

- **Tests unitaires :** Vérifient la logique des modules individuels.
- **Tests e2e :** Vérifient les endpoints API et l’intégration.

---

## Déploiement

1. **Build et lancement en mode production :**

```bash
npm run build
npm run start:prod
```

2. **Variables d’environnement :** Copie `.env.sample` vers `.env` et configure selon tes besoins.

3. Déploiement Docker optionnel (ajoute un `Dockerfile` et ta config si besoin).

---

## Variables d’environnement

Crée un fichier `.env` à la racine du projet :

```env
DATABASE_URL="mysql://johndoe:randompassword@localhost:3306/mydb"
SKIP_CLEANUP=false
FRONT_API_BASE_URL=http://localhost:3000
```

---

## Contribuer

En tant que collaborateur, on peut suivre ces étapes :

1. Clone le repo
2. S'assurer que la branche `dev` est à jour (`git pull origin dev`)
3. Créer une branche (`git checkout -b feat/nom-de-la-fonctionnalite`)
4. Commiter les changements (`git commit -m 'feat: ajoute la fonctionnalité'` ou `npm run commit`)
5. Pusher la branche (`git push origin feat/nom-de-la-fonctionnalite`)
6. Créer une Pull Request

Les contributions externes sont bienvenues ! Merci de suivre ces étapes :

1. Fork le repo
2. Crée une nouvelle branche (`git checkout -b feat/nom-de-la-fonctionnalite`)
3. Commiter les changements (`git commit -m 'feat: ajoute la fonctionnalité'`)
4. Push ta branche (`git push origin feat/nom-de-la-fonctionnalite`)
5. Crée une Pull Request

> **Commitizen** et **Commitlint** assurent la standardisation des messages de commit.

---

## Licence

UNLICENSED

<!-- ---

## Remerciements

Un grand merci aux projets et contributeurs suivants :

- [NestJS](https://nestjs.com/)
- [Prisma](https://www.prisma.io/)
- [Jest](https://jestjs.io/) -->

<!-- ---

## Contact

Ange KOUAKOU - [your.email@example.com](mailto:your.email@example.com)

[Lien vers le projet](https://github.com/username/spree_back) -->

<!-- ---

### **Résumé**

Ce backend est une **API e-commerce modulaire** qui gère une logique métier complexe avec une architecture propre, CI/CD et des outils modernes pour développeur. Prêt à propulser un projet de commerce en production ou à servir de template pour un nouveau SaaS. -->

[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)
