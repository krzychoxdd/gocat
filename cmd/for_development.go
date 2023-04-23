package main

import (
	"context"
	"fmt"
	"github.com/google/go-tika/tika"
	"io"
	"os"
)

func main() {
	client := tika.NewClient(nil, "http://localhost:9998")
	v, err := client.Version(context.Background())
	if err != nil {
		panic(err)
	}

	f, err := os.Open("cmd/some.xlsx")
	if err != nil {
		panic(err)
	}

	input := io.Reader(f)

	//str, _ := client.Parse(context.Background(), input)

	format, err := client.Detect(context.Background(), input)

	if err != nil {
		panic(err)
	}

	fmt.Print(v)
	//fmt.Print(str)
	fmt.Print(format)

	if err != nil {
		panic(err)
	}
}
