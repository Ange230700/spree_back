<!-- README.md -->

# Spree Back

<!-- > ![Project Logo](link-to-logo.png) -->

A robust, scalable, and modular backend for a modern e-commerce platform. Built with **NestJS** and **TypeScript**, Spree Back provides a fully-featured REST API that manages users, authentication, products, orders, payments, reviews, and more. Powered by **Prisma ORM** and MySQL, it supports advanced database relationships and implements best practices for maintainability, security, and developer experience.

---

## Table of Contents

- [Demo](#demo)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Running the Project](#running-the-project)
- [Project Structure](#project-structure)
- [API Documentation](#api-documentation)
- [Testing](#testing)
- [Deployment](#deployment)
- [Environment Variables](#environment-variables)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)
- [Contact](#contact)

---

## Demo

_No live demo yet._

<!-- Optionally, add screenshots here if you have API playground screenshots, Swagger UI, or code samples. -->

---

## Tech Stack

**Backend:**

- **NestJS** (TypeScript)
- **Express** (via Nest)
- **Prisma ORM**

**Database:**

- **MySQL** <!-- (compatible with PostgreSQL/MongoDB if you adapt Prisma schema) -->

**Testing:**

- **Jest** (unit/e2e tests)
- **Supertest** (API endpoint testing)

**Tools & Dev Experience:**

- **Docker** (optional, for development & deployment)
- **Husky** (Git hooks)
- **Commitlint** & **Commitizen** (Conventional commits)
- **Prettier** & **ESLint** (code quality)
- **GitHub Actions** (CI/CD support)

---

## Getting Started

### Prerequisites

- Node.js (>=20.x)
- MySQL Database (or compatible)
- Docker (optional, for containerization)

### Installation

```bash
git clone https://github.com/username/spree_back.git
cd spree_back
npm install
```

---

## Running the Project

> **Start backend in development mode:**

```bash
npm run start:dev
```

> **Build for production:**

```bash
npm run build
npm run start:prod
```

> **Run database migrations and seed data:**

```bash
npm run prisma:migrate:dev
npm run prisma:db:seed
```

---

## Project Structure

```
├── src
│   ├── main.ts          # Application entrypoint
│   ├── app.module.ts    # Main NestJS module
│   └── ...              # Feature modules & controllers
├── prisma
│   ├── schema.prisma    # Prisma schema (DB models)
│   └── main.ts          # Seeder scripts
├── test                 # Unit and e2e tests
├── docs                 # Project & API docs
├── .env.sample          # Environment variable sample
├── package.json         # NPM configuration and scripts
└── tsconfig.json        # TypeScript configuration
```

---

## API Documentation

The backend exposes a REST API for managing:

- Users, authentication (sessions, roles, refresh tokens)
- Products, categories, sellers, shopping carts
- Orders, order items, payments, shipments
- Product reviews, likes

**See `/docs` for OpenAPI/Swagger documentation** (or link to API reference once generated).

---

## Testing

Run the tests using:

```bash
npm test
```

- **Unit tests**: Validate logic of individual modules.
- **e2e tests**: Validate API endpoints and integration.

---

## Deployment

1. **Build and start in production mode:**

   ```bash
   npm run build
   npm run start:prod
   ```

2. **Environment variables**: Copy `.env.sample` to `.env` and configure.
3. Optionally, deploy with Docker (add `Dockerfile` and config as needed).

---

## Environment Variables

Create a `.env` file at the project root:

```env
DATABASE_URL="mysql://johndoe:randompassword@localhost:3306/mydb"
SKIP_CLEANUP=false
FRONT_API_BASE_URL=http://localhost:3000
```

---

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Commit changes (`git commit -m 'feat: add your feature'`)
4. Push the branch (`git push origin feature/your-feature`)
5. Create a Pull Request

---

## License

UNLICENSED (or specify if you choose MIT or another license)

---

## Acknowledgements

Special thanks to the following projects and contributors:

- [NestJS](https://nestjs.com/)
- [Prisma](https://www.prisma.io/)
- [Jest](https://jestjs.io/)

---

## Contact

Ange KOUAKOU - [your.email@example.com](mailto:your.email@example.com)

[Project Link](https://github.com/username/spree_back)

---

### **Summary**

This backend is a **modular e-commerce API** supporting complex business logic with clean architecture, CI/CD, and modern developer tooling. It’s ready to power production commerce or serve as a template for new SaaS projects.
