# Start by using the official Golang base image to build our application
FROM golang:1.21.1-alpine as builder

# Set the current working directory inside the container
WORKDIR /app

# Copy the local package files to the container's workspace.
COPY go.mod ./
COPY go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build the Go app
# Change the path according to where your Go files are located. 
# If it's directly in /app, use '.'
RUN go build -o main .

# Expose port 8080 to the outside world
EXPOSE 8080

CMD ["./main"]
