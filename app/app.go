package app

import (
	. "../config"
)

type App struct {
	Config *Config
}

func InitApp(config *Config) (*App) {
	return &App{Config: config}
}
