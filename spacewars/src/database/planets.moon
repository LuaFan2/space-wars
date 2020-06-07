planets = {}

planets["Earth"] = {
	bounds: {Vector(1,1,1), Vector(2,2,2)}
	description: "Homeworld of human beings"

	params: {
		air: true
		toxic: false
	},

	spawns: {
		native: {
			Vector(0,0,0)
		}
	}
}

{ :planets }