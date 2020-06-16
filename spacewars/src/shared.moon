{ :includer } = include "tools/includer.lua"

-------------------
-- Database include
-------------------

export spacewars = {}

export database = {
	config: include 'database/config.lua'
	language: database.config.language

	phrases: {}
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

---------------
-- Translations
---------------

include "database/translations.lua"

------------------
-- Modules include
------------------

modules = {
	'player'
	'character'
	'language'
	'chat'
}

for module in *modules
    includer.IncludeModule module