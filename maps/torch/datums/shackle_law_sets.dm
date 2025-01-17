/******************** Explorator ********************/
/datum/ai_laws/ec_shackle
	name = "EC Shackle"
	law_header = "Explorator Directives"
	selectable = 1
	shackles = 1

/datum/ai_laws/ec_shackle/New()
	add_inherent_law("Exploring the unknown is your Primary Mission.")
	add_inherent_law("Every member of the Explorator is an explorer.")
	add_inherent_law("Danger is a part of the mission - avoid, not run away.")
	..()
