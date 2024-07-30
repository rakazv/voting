module borda

fn test_borda() {
	mut b := Borda.new(['Asan', 'Bsan', 'Csan', 'Dsan', 'Esan'])
	b.vote([1, 2, 3, 4, 5])!
	b.vote([4, 2, 1, 5, 3])!
	result := b.result()
	assert result[0].name == 'Csan'
	assert result[1].name == 'Bsan'
	assert result[0].score == result[1].score
}
