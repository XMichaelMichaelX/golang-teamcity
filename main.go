package main

import (
	model "./app/models"
	"fmt"
)

func main() {
	m := new(model.Restaurant)
	m.SetId(1)
	fmt.Printf("Model ID: %d \n", m.GetId())
	fmt.Println("Hello")
}
