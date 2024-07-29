module vote

fn test_majority_rule() {
	candidates := ['Asan', 'Bsan', 'Csan']
	mut m := Majority.new(candidates)!
	m.vote('Asan')!
	assert m.result()! == 'Asan'
}
