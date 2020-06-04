{ :includer } = include "tools/includer.lua"

-------------------
-- Database include
-------------------

export database = {
	config: include 'database/config.lua'

	players: {}
	progress: {}

	races: include 'database/races.lua'

	buildings: include 'database/buildings.lua'
	planets: include 'database/planets.lua'

	classes: include 'database/classes.lua'
	specialization: include 'database/specializations.lua'

	researches: include 'database/researches.lua'
	tech: include 'database/tech.lua'
}

------------------
-- Modules include
------------------

modules = {
	'player'
}

for module in *modules
    includer.IncludeModule(module)