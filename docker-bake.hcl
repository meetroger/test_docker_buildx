group "default" {
    targets = ["hello", ]
}

target "multiarch" {
	dockerfile = "Dockerfile"
	platforms = ["linux/amd64", "linux/arm64"]
}

target "hello" {
    inherits = ["multiarch"]
    tags = ["hello:latest"]
}
