player = FindMetaTable "Player"

player.GetPlanet = (self) ->
	for planet in *database.planets
		if self\GetPos!\WithinAABox planet.bounds[1], planet.bounds[2]
			return planet
	false

player.GetRace = (self) ->
	if not database.players[self]
		return nil

	database.players[self].race

player.InDangerEnvironment = (self) ->
	planet = self\GetPlanet!
	race = self\GetRace!

	if not race
		return nil

	if (not planet and race.params.need_air == true) or (planet and planet.params.air == false and race.params.need_air == true)
		return true, "choke"

	if (planet and planet.params.toxic == true and race.params.toxic_resist == false)
		return true, "poisoning"

	false