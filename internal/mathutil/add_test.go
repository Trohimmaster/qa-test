package mathutil

import "testing"

func TestAdd(t *testing.T) {
	tests := []struct {
		a, b   int
		expect int
	}{
		{1, 2, 3},
		{-1, 5, 4},
		{0, 0, 0},
	}

	for _, tt := range tests {
		if got := Add(tt.a, tt.b); got != tt.expect {
			t.Errorf("Add(%d, %d) = %d; want %d", tt.a, tt.b, got, tt.expect)
		}
	}
}

