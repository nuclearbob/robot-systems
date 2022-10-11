package main

import (
	"log"
	"os/exec"
)

func run_cmd(cmd string, args ...string) error {

	command := exec.Command(cmd, args...)

	err := command.Run()

	if err != nil {
		log.Fatal(err)
	}

	return err
}

func main() {
	run_cmd("yum", "-y", "makecache")
	run_cmd("yum", "-y", "upgrade")
	run_cmd("yum", "-y", "install", "httpd")
}
