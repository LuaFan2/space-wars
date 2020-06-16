spacewars.commands = {}
spacewars.commands_delay = {}

util.AddNetworkString "chat"

spacewars.AddCommand = (name, cb, delay) ->
	cdelay = delay or 0

	if spacewars.commands[name]
		print "Callback already installed for command #{name}"
	else
		spacewars.commands[name] = {callback: cb, delay: cdelay}

spacewars.chat = (player, name, text, radius) ->
	if not database.players[player]
		player\ChatPrint "You must create character to do it"

	ents = radius and ents.FindInSphere(player\EyePos!, radius) or ents.GetAll!
	col = team.GetColor player\Team!
	filter = {}

	for ent in *ents
		if ent\IsPlayer! and not ent\IsBot!
			table.insert(filter, v)
	
	if name == player\Nick!
		name = ""
	
	net.Start "chat"
		net.WriteUInt col.r, 8
		net.WriteUInt col.g, 8
		net.WriteUInt col.b, 8
		net.WriteString name
		net.WriteEntity player
		net.WriteUInt 255, 8
		net.WriteUInt 255, 8
		net.WriteUInt 255, 8
		net.WriteString text
	net.Send filter

hook.Add "PlayerSay", "spacewars.chat_handler", (player, text) ->
	prefix = string.sub(text, 1, 1)

	args = table.ExplodeByTags(text, " ", "\"", "\"", true)
	command = string.lower(string.sub(arguments[1], #prefix + 1))

	table.remove(args, 1)
	
	if command
		if spacewars.commands[command]
			if not spacewars.commands_delay[player][command] or spacewars.commands_delay[player][command] < os.time!
				spacewars.commands[command].callback player, args

				spacewars.commands_delay[player][command] = os.time! + spacewars.commands[command].delay
			else
				return
		else
			if database.config.chat.globalchat
				range = nil
			else
				range = database.config.chat.talkDistance

			spacewars.chat player, player\Nick!, text, range
	
	true