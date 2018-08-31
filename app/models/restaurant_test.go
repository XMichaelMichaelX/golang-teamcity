package models

import "testing"

func TestRestaurant_SetId(t *testing.T) {
	m := new(Restaurant)
	m.SetId(1)

	if m.GetId() != 1 {
		t.Fatalf("Expected '1', Got: %d", m.GetId())
	}
}
