module vote

pub struct Majority {
mut:
	candidates map[string]u32
}

pub fn Majority.new(candidates []string) !Majority {
	if candidates.len == 0 {
		return error('candidates.len = 0')
	}
	mut m := Majority{}
	for name in candidates {
		m.candidates[name] = 0
	}
	return m
}

pub fn (mut m Majority) vote(name string) ! {
	if name !in m.candidates {
		return error('${name} not in candidates')
	}
	m.candidates[name] += 1
}

pub fn (m Majority) result() !string {
	mut max := 0
	mut name := ''
	for n, v in m.candidates {
		if max < v {
			max = v
			name = n
		}
	}
	if max == 0 {
		return error('not voting yet')
	}
	if name == '' {
		return error('candidates not set')
	}
	return name
}
