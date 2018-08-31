package models

type Restaurant struct {
	id int
}

func (m *Restaurant) GetId() (int) {
	return m.id
}

func (m *Restaurant) SetId(id int) {
	m.id = id
}
