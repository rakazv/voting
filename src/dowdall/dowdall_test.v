module dowdall

fn test_dowdall() {
	mut dowdall := new(['Asan', 'Bsan', 'Csan', 'Dsan'])
	dowdall.vote([1, 2, 3, 4])!
	dowdall.vote([4, 3, 2, 1])!
	result := dowdall.result()
	assert result[0].name == 'Dsan'
	assert result[1].name == 'Asan'
}

fn test_invalid_rank() {
	mut dowdall := new(['Asan', 'Bsan', 'Csan', 'Dsan'])
	dowdall.vote([100, 3, 2, 1]) or {
		assert true
	}
}
