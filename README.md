# DagGo

**DagGo** is a simple yet robust demo project showcasing how to build, test, and run a Go web server using [Dagger](https://dagger.io).

It combines the power of the **Go language** 🐹 for building fast, reliable servers with **Dagger pipelines** 🪜 for containerized builds and CI/CD workflows.

---

## ✨ Features

* Go web server with HTML templating
* Static assets (CSS, images)
* Middleware: logging, panic recovery, timeouts
* Health check endpoint (`/healthz`)
* Graceful shutdown
* Unit tests included
* Dagger pipeline for building & testing

---

## 📂 Project Structure

```
DagGo/
├── cmd/server/        # App entrypoint
├── internal/          # Handlers, middleware, server setup
├── templates/         # HTML templates
├── static/            # Static files (CSS, images)
├── tests/             # Unit tests
└── dagger/            # Dagger pipeline
```

---

## 🚀 Getting Started

### Run the server locally

```bash
go run ./cmd/server/main.go
```

Visit [http://localhost:8080](http://localhost:8080)

### Run tests

```bash
go test ./...
```

### Build with Dagger

```bash
cd dagger
go run main.go
```

This will:

* Run tests in a containerized environment
* Build the Go binary and export it as `./server`

---

## 🔗 Endpoints

* `/` → HTML greetings page (Go + Dagger info + Gopher image)
* `/healthz` → Health check (returns `ok`)
* `/static/` → Static files (CSS, images)

---

## 🛠 Tech Stack

* **Go** 1.22
* **Chi router** for routing
* **Dagger** for pipeline automation

---

## 📜 License

MIT License. Use freely for learning and experimenting with Dagger + Go.
