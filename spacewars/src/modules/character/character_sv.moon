player = FindMetaTable "Player"

player.CreateCharacter = (self, data) ->
	database.players[#database.players + 1] = do
		{
			["race"]: data.race

			["class"]: data.class
			["specialization"] = data.specialization

			["strength"]: data.strength
			["dexterity"]: data.dexterity
			["attentiveness"]: data.attentiveness
		}