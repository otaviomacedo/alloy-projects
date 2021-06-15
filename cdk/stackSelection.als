sig Assembly {
	nested: set Assembly,
	stacks: set Stack
}

one sig MainAssembly extends Assembly {}

sig Construct {
	children: set Construct
}

sig Stack extends Construct {
	
}

fact {
	no a: Assembly | a in a.^nested
	no c: Construct | c in c.^children
	no disj a, a': Assembly | some a.stacks & a'.stacks
	all a: Assembly | lone a.~nested
	all c: Construct | lone c.~children
	all a: Assembly, c: Construct | no a.stacks & c.^children
	all a: Assembly - MainAssembly | a in MainAssembly.^nested
	some s: Stack, a: Assembly | s in a.stacks
}

assert multipleStacksInAnAssembly {
	some a: Assembly | #a.stacks > 1
}



pred show {}

run show for 4

check multipleStacksInAnAssembly
