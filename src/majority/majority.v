module majority

// Majority rule

pub fn new(names []string) !Majority {
	return Majority.new(names)!
}

struct Candidate {
	name string
mut:
	score int
}

pub struct Majority {
mut:
	candidates []Candidate
}

pub fn Majority.new(names []string) !Majority {
	if names.len == 0 {
		return error('names.len = 0')
	}
	mut cands := []Candidate{}
	for name in names {
		cands << Candidate{
			name: name
		}
	}
	return Majority{cands}
}

pub fn (mut m Majority) vote(name string) {
	for i, _ in m.candidates {
		if m.candidates[i].name == name {
			m.candidates[i].score += 1
		}
	}
}

pub fn (m Majority) result() []Candidate {
	return m.candidates.sorted(a.score > b.score)
}
