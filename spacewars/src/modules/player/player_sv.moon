environmentDamage = ->
	for player in *player.GetAll!
		if not player\Alive!
			continue
		
		inDanger, kind = player\InDangerEnvironment!
		if not inDanger
			continue

		damage = DamageInfo!

		damage\SetDamage 10
		damage\SetInflictor self
		damage\SetAttacker self

		damage\SetDamageType((kind == "poisoning" and DMG_NERVEGAS) or (kind == "choke" and DMG_DROWN))
		player\TakeDamageInfo dmg

	
timer.Create("environmentDamage", 1, 0, environmentDamage)