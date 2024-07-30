module borda

// Borda rule

struct Candidate {
	name string
mut:
	score int
}

struct Borda {
mut:
	candidates []Candidate
}

pub fn Borda.new(names []string) Borda {
	mut candidates := []Candidate{}
	for name in names {
		candidates << Candidate{
			name: name
		}
	}
	return Borda{candidates}
}

pub fn (mut b Borda) vote(ranks []int) ! {
	if ranks.len != b.candidates.len {
		return error('The length of ranks must be the same as the length of candidates. want = ${b.candidates.len}, got = ${ranks.len}')
	}
	for i, rank in ranks {
		b.candidates[i].score += b.candidates.len - rank + 1
	}
}

pub fn (mut bo Borda) result() []Candidate {
	return bo.candidates.sorted(a.score > b.score)
}
