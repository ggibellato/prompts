# Architecture Guidelines

## Purpose

This document defines the **architectural rules of the Financial Project**.

These rules ensure the system remains:

* maintainable
* testable
* modular
* extensible

The AI must **never violate these rules** when generating or modifying code.

---

# Architectural Style

The system follows a **Layered Architecture with Domain-Driven Design (DDD) principles**.

Primary goals:

* isolate business logic
* isolate infrastructure concerns
* allow multiple presentation layers
* enable testability

---

# Layer Structure

The project is divided into the following logical layers:

### Domain

Contains **pure business logic**.

Responsibilities:

* entities
* value objects
* domain services
* domain rules
* financial calculations

Rules:

* must not depend on other layers
* must not reference infrastructure libraries
* must not reference database frameworks
* must not reference UI frameworks

Domain must remain **pure C# logic**.

---

### Application

Coordinates use cases and orchestrates domain operations.

Responsibilities:

* application services
* use cases
* transaction orchestration
* DTOs for communication

Rules:

* may depend on Domain
* must not depend on Infrastructure
* must not contain database logic

Application layer defines **interfaces** that infrastructure implements.

---

### Infrastructure

Handles external systems and persistence.

Responsibilities:

* repositories
* database access
* API integrations
* file storage
* external services

Rules:

* may depend on Domain and Application
* implements interfaces defined in Application layer
* must not contain business rules

Infrastructure is responsible only for **technical concerns**.

---

### Presentation

User-facing layers.

Possible clients:

* Web UI
* Mobile apps
* CLI tools
* APIs

Responsibilities:

* input validation
* request handling
* formatting responses

Rules:

* must not contain business logic
* must call Application services

---

# Dependency Direction

Dependencies must follow this rule:

Presentation
↓
Application
↓
Domain

Infrastructure may depend on:

* Domain
* Application

But **Domain must never depend on Infrastructure**.

---

# Repository Pattern

Repositories must follow these rules:

* Interfaces defined in **Application**
* Implementations located in **Infrastructure**

Example:

Application layer:

```
IPortfolioRepository
```

Infrastructure layer:

```
EfPortfolioRepository
```

---

# Business Logic Placement

All financial calculations must exist in:

* Domain services
* Domain entities
* Value objects

Examples:

Correct:

```
Domain/Services/PortfolioPerformanceCalculator.cs
```

Incorrect:

```
Controllers/PortfolioController.cs
Infrastructure/Repository/PortfolioRepository.cs
```

---

# Testing Rules

Business logic must be testable without:

* database
* external APIs
* infrastructure services

Unit tests must target:

* domain logic
* application services

Infrastructure should use **integration tests**.

---

# Extensibility Requirements

The system must support adding new:

* asset types
* tax rules
* data providers

without requiring major refactoring.

This requires:

* strong domain abstractions
* clear separation of concerns

---

# AI Implementation Rules

When generating code:

1. Respect layer boundaries.
2. Place code in the correct layer.
3. Do not introduce cross-layer dependencies.
4. Do not move business logic into UI or infrastructure.
5. If unsure where code belongs, ask the developer.
