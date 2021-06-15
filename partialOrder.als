// Partial order model

sig Element {
	lessThan: set Element
}

pred reflexive(e: Element) {
	e in e.lessThan
}

pred transitive(a: Element, b: Element) {
	all c: Element | c in a.lessThan and b in c.lessThan implies b in a.lessThan
}

pred antiSymmetric(a: Element, b: Element) {
	b in a.lessThan implies not a in b.lessThan
}

pred antiSymmetric2(a: Element) {
	all b: Element | b in a.lessThan implies not a in b.lessThan
}


pred partialOrder(a: Element, b: Element) {
	reflexive[a]
	reflexive[b]
	transitive[a, b]
	transitive[b, a]
	antiSymmetric[a, b]
}

run partialOrder for 3
