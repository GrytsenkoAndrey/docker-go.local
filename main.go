package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/docker", func(w http.ResponseWriter, req *http.Request) {
        fmt.Fprintf(w, "<h1>Hello from Docker container make by Golang!</h1>")
    })

    http.ListenAndServe(":8080", nil)
}

// func main() {
//     fmt.Println("Hello, world!")
// }

