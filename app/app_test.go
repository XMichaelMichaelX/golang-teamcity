package app

import (
	. "../config"
	"testing"
)

func Test_InitApp(t *testing.T) {
	config := createTestConfig()
	app := InitApp(config)

	if app.Config.DB == nil {
		t.Fatalf("DB configuration has not been set")
	}
}




func createTestConfig() (*Config) {
	return &Config{
		DB: struct{

		}{},
	}
}