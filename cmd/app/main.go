package main

import (
	"fmt"
	"os"
)

// Переменные будут заполнены при сборке через ldflags
var (
	Version   = "dev"
	Commit    = "none"
	BuildDate = "unknown"
)

func main() {
	fmt.Printf("Demo App\n")
	fmt.Printf("Version: %s\nCommit: %s\nBuilt: %s\n", Version, Commit, BuildDate)

	if len(os.Args) > 1 {
		fmt.Println("Args:", os.Args[1:])
	}
}

