package jtd_codegen_e2e
import "encoding/json"
import "fmt"
type RootBar struct {
	Foo string `json:"foo"`
	Baz string `json:"baz"`
}
type RootQuux struct {
	Foo string `json:"foo"`
	Quuz string `json:"quuz"`
}
type Root struct {
	Foo string
	RootBar RootBar
	RootQuux RootQuux
}
func (v Root) MarshalJSON() ([]byte, error) {
	switch (v.Foo) {
	case "bar":
		return json.Marshal(struct { T string `json:"foo"`; RootBar }{ v.Foo, v.RootBar })
	case "quux":
		return json.Marshal(struct { T string `json:"foo"`; RootQuux }{ v.Foo, v.RootQuux })
	}
	return nil, fmt.Errorf("bad Foo value: %s", v.Foo)
}
func (v *Root) UnmarshalJSON(b []byte) error {
	var t struct { T string `json:"foo"` }
	if err := json.Unmarshal(b, &t); err != nil {
		return err
	}
	switch t.T {
	case "bar":
		if err := json.Unmarshal(b, &v.RootBar); err != nil {
			return err
		}
		v.Foo = "bar"
		return nil
	case "quux":
		if err := json.Unmarshal(b, &v.RootQuux); err != nil {
			return err
		}
		v.Foo = "quux"
		return nil
	}
	return fmt.Errorf("bad Foo value: %s", t.T)
}