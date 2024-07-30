module majority

fn test_majority_rule() {
	mut m := new(['Asan', 'Bsan', 'Csan'])!
	m.vote('Bsan')
	result := m.result()
	assert result[0].name == 'Bsan'
}
