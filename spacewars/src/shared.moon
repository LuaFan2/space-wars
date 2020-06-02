{ :includer } = include "tools/includer.lua"

-------------------
-- Database include
-------------------

export database = {
	config: require 'database/config.lua'

	players: {}
	progress: {}

	races: require 'database/races.lua'

	buildings: require 'database/buildings.lua'
	planets: require 'database/planets.lua'

	classes: require 'database/classes.lua'
	specialization: require 'database/specializations.lua'

	researches: require 'database/researches.lua'
	tech: require 'database/tech.lua'
}

------------------
-- Modules include
------------------

modules = {}

for module in *modules
    includer.IncludeModule(module)