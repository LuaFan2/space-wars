spacewars.AddCommand "ooc", (player, arguments) ->
	text = table.concat arguments, ""

	spacewars.chat player, player\Nick!, text