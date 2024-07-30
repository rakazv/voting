module dowdall

// Dowdall rule
// ペア敗者基準を満たさないから推奨されない。
// Borda rule が推奨

struct Candidate {
	name string
mut:
	score f32
}

struct Dowdall {
mut:
	candidates []Candidate
}

pub fn new(names []string) Dowdall {
	return Dowdall.new(names)
}

fn Dowdall.new(names []string) Dowdall {
	mut candidates := []Candidate{}
	for name in names {
		candidates << Candidate{
			name: name
		}
	}
	return Dowdall{candidates}
}

pub fn (mut v Dowdall) vote(ranks []int) ! {
	if ranks.len != v.candidates.len {
		return error('The length of ranks must be the same as the length of candidates. want = ${v.candidates.len}, got = ${ranks.len}')
	}

	for rank in ranks {
		if rank > v.candidates.len || rank <= 0 {
			return error('An incorrect rank was entered. The rank must be 1 ~ ${v.candidates.len}. got = ${rank}')
		}
	}

	for i, rank in ranks {
		v.candidates[i].score += 1 / f32(rank)
	}
}

pub fn (v Dowdall) result() []Candidate {
	return v.candidates.sorted(a.score > b.score)
}
