player = FindMetaTable "Player"

player.CreateCharacter = (self, data) ->
	if database.players[self]
		return

	count = 0
	for player in *database.players
		if player.class == data.class
			count += 1

	if (count / #database.players) > data.class.quota
		return

	database.players[self] = do
		{
			["race"]: data.race

			["class"]: data.class
			["specialization"]: data.specialization

			["strength"]: data.strength
			["dexterity"]: data.dexterity
			["attentiveness"]: data.attentiveness
		}

hook.Add "PlayerInitialSpawn", "character.spawn", (player) ->
	if not database.players[self]
		return

	player = database.players[self]

	for weapon in *player.class.weapons
		self\Give weapon
	for weapon in *player.specialization.weapons
		self\Give weapon

	if player.class.health
		self\SetHealth player.class.health
	if player.class.armor
		self\SetArmor player.class.armor