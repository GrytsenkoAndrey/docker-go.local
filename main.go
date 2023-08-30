package main

import (
    "fmt"
    // "net/http"
)

// func main() {
//     http.HandleFunc("/docker", func(w http.ResponseWritter, req *http.Request) {
//         fmt.Fprintf(w, "<h1>Hello from Docker container make by Golang!</h1>")
//     })

//     http.ListenAndServe(":8080", null)
// }

func main() {
    fmt.Println("Hello, world!")
}

// docker run --name=go-web-app -p 80:8080 go-app