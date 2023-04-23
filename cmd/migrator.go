package main

import (
	"flag"
	_ "github.com/lib/pq"
	_ "kprocat/migrations"
	"log"
	"os"

	"github.com/pressly/goose/v3"
)

var (
	flags = flag.NewFlagSet("goose", flag.ExitOnError)
	dir   = `migrations`
)

func main() {

	flags.Parse(os.Args[1:])
	args := flags.Args()

	dbstring, command := args[0], args[1]

	db, err := goose.OpenDBWithDriver("postgres", dbstring)
	if err != nil {
		log.Fatalf("goose: failed to open DB: %v\n", err)
	}

	defer func() {
		if err := db.Close(); err != nil {
			log.Fatalf("goose: failed to close DB: %v\n", err)
		}
	}()

	if err := goose.Run(command, db, dir); err != nil {
		log.Fatalf("goose %v: %v", command, err)
	}
}
