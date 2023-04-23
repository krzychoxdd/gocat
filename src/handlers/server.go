package main

import (
	"fmt"
	"kprocat/src/handlers/api/analyze"
	"net/http"
)

func main() {
	http.HandleFunc(`/`, analyze.Analyze)

	fmt.Println("http://localhost:8080")
	http.ListenAndServe(":8080", nil)
}
