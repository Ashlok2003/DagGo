# -------------- Stage 1 — builder --------------

FROM golang:1.22 AS builder

# Metadata (optional)

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION=dev

WORKDIR /src

# Cache modules separately
COPY go.mod go.sum ./
RUN go env -w GOPROXY=[https://proxy.golang.org,direct](https://proxy.golang.org,direct) && go mod download

# Copy source

COPY . .

# Build statically linked, optimized binary
# -trimpath: remove file system paths
# -ldflags: strip debug info and embed simple metadata

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -trimpath -ldflags="-s -w -X 'main.version=${VERSION}' -X 'main.commit=${VCS_REF}' -X 'main.date=${BUILD_DATE}'" -o /out/daggo ./cmd/server

# -------------- Stage 2 — minimal runtime (distroless) --------------
FROM gcr.io/distroless/static-debian11:nonroot

LABEL org.opencontainers.image.title="DagGo" \
    org.opencontainers.image.description="DagGo — Go + Dagger demo server" \
    org.opencontainers.image.version="$VERSION" \
    org.opencontainers.image.revision="$VCS_REF"


EXPOSE 8080

COPY --from=builder /out/daggo /daggo

ENV PORT=8080
ENV GIN_MODE=release

# Run as non-root (distroless nonroot provides a nonroot user)
USER nonroot

ENTRYPOINT ["/daggo"]
