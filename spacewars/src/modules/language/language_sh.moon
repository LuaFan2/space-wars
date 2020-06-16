database.phrases.Add = (langauage, unique, phrase) ->
	if not database.phrases[language]
		database.phrases[language] = {}

	database.phrases[language][unique] = phrase

database.phrases.Get = (unique, ...) ->
	if not database.phrases[database.language][unique]
		return ""

	phrase = database.phrases[database.language][unique]
	result = ""

	if type(phrase) == "table"
		for element in *phrase
			if type(element) == "string"
				result = result .. element
	else
		result = phrase

	string.format result, ...