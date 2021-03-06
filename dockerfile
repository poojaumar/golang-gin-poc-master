# Start from the latest golang base image
FROM golang:latest

# Add Maintainer Info
LABEL maintainer="PoojaUmar"

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy Go Modules dependency requirements file
COPY go.mod .

# Copy Go Modules expected hashes file
COPY go.sum .

# Download dependencies
RUN go mod download

# Copy all the app sources (recursively copies files and directories from the host into the image)
COPY . .

# Set http port
ENV PORT 50000

# Build the app
RUN go build server.go

# Run the app
CMD ["./server"]

