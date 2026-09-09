# DagGo

**DagGo** is a simple yet robust demo project that demonstrates how to build, test, and run a Go web server using [Dagger](https://dagger.io).

The project combines the performance and reliability of **Go** 🐹 with **Dagger pipelines** 🪜 to provide containerized builds, automated testing, and CI/CD workflows.

---

## ✨ Features

* Go web server with HTML templating
* Static assets including CSS and images
* Middleware for:

  * Request logging
  * Panic recovery
  * Request timeouts
* Health check endpoint (`/healthz`)
* Graceful server shutdown
* Unit tests
* Dagger pipeline for automated testing and builds
* Containerized build environment

---

## 📂 Project Structure

```text
DagGo/
├── cmd/
│   └── server/          # Application entry point
├── internal/            # Handlers, middleware, and server setup
├── templates/           # HTML templates
├── static/              # CSS, images, and other static assets
├── tests/               # Unit tests
└── dagger/              # Dagger pipeline
```

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

* Go 1.22 or later
* Dagger CLI

### Run the Server Locally

Start the Go web server with:

```bash
go run ./cmd/server/main.go
```

Once the server is running, open:

```text
http://localhost:8080
```

---

## 🧪 Run Tests

Run all project tests using:

```bash
go test ./...
```

This will execute the available unit tests across the project.

---

## 🪜 Build with Dagger

Navigate to the Dagger pipeline directory:

```bash
cd dagger
go run main.go
```

The Dagger pipeline will:

1. Run the project tests inside a containerized environment.
2. Build the Go application.
3. Export the resulting binary as:

```text
./server
```

This provides a consistent and reproducible environment for building and testing the application.

---

## 🔗 API Endpoints

| Endpoint   | Description                                                             |
| ---------- | ----------------------------------------------------------------------- |
| `/`        | Displays the HTML greeting page with Go, Dagger, and Gopher information |
| `/healthz` | Health check endpoint that returns `ok`                                 |
| `/static/` | Serves static assets such as CSS and images                             |

---

## 🛠 Tech Stack

* **Go 1.22** — Web server and application logic
* **Chi** — Lightweight HTTP router
* **Dagger** — Containerized build and test pipelines
* **HTML Templates** — Server-side page rendering

---

## 🎯 Purpose

DagGo is intended as a learning and demonstration project for understanding how **Go applications can be integrated with Dagger** to create reproducible build and testing workflows.

It provides a simple starting point for experimenting with:

* Go web development
* Containerized builds
* Automated testing
* CI/CD pipelines
* Dagger-based development workflows

---

## 📜 License

This project is licensed under the **MIT License**.

You are free to use, modify, and distribute it for learning, experimentation, and other purposes.
