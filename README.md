# Microservice Template

This is a template for a microservice written in Go, using Docker, Makefile, and gRPC. It provides a starting point for building and deploying microservices with a clear structure and common tools.

## Project Structure

- `/cmd` — the entry point for the application
- `/internal` — business logic and application code
- `/api/proto` — gRPC service definitions
- `/pkg` — utility packages (e.g., logging, configuration)
- `/scripts` — deployment and migration scripts
- `Dockerfile` — containerization setup for building and running the microservice
- `Makefile` — a set of commands to build, test, and run the service

## Getting Started

### 1. Install dependencies:

```bash
go mod tidy
```

### 2. Build the binary

```bash
make build
```

### 3. Run the application

```bash
make run
```

### 4. Build and run with Docker

```bash
make docker-build
make docker-run
```

### Testing

```bash
make test
```

### gRPC Definitions

The project includes gRPC service definitions located in `/api/proto`. These definitions are used to generate Go code for communication between services. You can find the `.proto` files in that directory.

Example `.proto` File:

```proto
// api/proto/service.proto

syntax = "proto3";

package mymicroservice;

service MyService {
  rpc ProcessFile (FileRequest) returns (FileResponse);
}

message FileRequest {
  string file_url = 1;
}

message FileResponse {
  string status = 1;
  string message = 2;
}
```

### Deployment

For deployment, you can build and push the Docker image to your container registry (e.g., Docker Hub, AWS ECR). You can also use Kubernetes or any other orchestrator to deploy the microservice.

For additional deployment and migration scripts, see the `/scripts` folder.

### Makefile Commands

Here are the available Makefile commands:

- `make build` - Build the application binary
- `make test` - Run tests
- `make run` - Run the application locally
- `make docker-build` - Build the Docker image
- `make docker-run` - Run the application in a Docker container
- `make clean` - Clean up the generated binary
