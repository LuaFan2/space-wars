{ :classes } = include "database/classes.lua"

specializations = {}

specializations["Stormtrooper"] = {
	description: "The main combat unit"
	class: classes["Trooper"]

	weapons: {

	}
}

specializations["Sniper"] = {
	description: "Long-range support unit"
	class: classes["Trooper"]

	weapons: {

	}
}

specializations["Demoman"] = {
	description: "Close support unit"
	class: classes["Trooper"]

	weapons: {
		
	}
}

{ :specializations }