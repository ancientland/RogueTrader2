/singleton/hierarchy/outfit/job/torch/crew/exploration/New()
	..()
	backpack_overrides[/singleton/backpack_outfit/backpack]      = /obj/item/storage/backpack/explorer
	backpack_overrides[/singleton/backpack_outfit/satchel]       = /obj/item/storage/backpack/satchel/explorer
	backpack_overrides[/singleton/backpack_outfit/messenger_bag] = /obj/item/storage/backpack/messenger/explorer

/singleton/hierarchy/outfit/job/torch/crew/exploration/pathfinder
	name = OUTFIT_JOB_NAME("Pathfinder")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/torch/crew/pathfinder)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/pathfinder

/singleton/hierarchy/outfit/job/torch/crew/exploration/explorer
	name = OUTFIT_JOB_NAME("Explorer")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/torch/crew/explorer)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/exploration

/singleton/hierarchy/outfit/job/torch/passenger/pilot
	name = OUTFIT_JOB_NAME("Shuttle Pilot")
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/dutyboots
	l_ear = /obj/item/device/radio/headset/headset_pilot
	id_types = list(/obj/item/card/id/torch/passenger/research/nt_pilot)
	head = /obj/item/clothing/head/helmet/solgov/pilot

/singleton/hierarchy/outfit/job/torch/crew/exploration/pilot
	name = OUTFIT_JOB_NAME("Shuttle Pilot - Explorator")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/exploration
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/torch/crew/pilot)
	pda_type = /obj/item/modular_computer/pda/explorer
	l_ear = /obj/item/device/radio/headset/headset_pilot

/singleton/hierarchy/outfit/job/torch/crew/exploration/pilot/fleet
	name = OUTFIT_JOB_NAME("Shuttle Pilot - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/exploration
