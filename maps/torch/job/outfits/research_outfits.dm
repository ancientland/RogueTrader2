/singleton/hierarchy/outfit/job/torch/crew/research
	name = OUTFIT_JOB_NAME("Research Assistant - Explorator")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/research
	shoes = /obj/item/clothing/shoes/dutyboots
	id_types = list(/obj/item/card/id/torch/crew/research)
	pda_type = /obj/item/modular_computer/pda/science
	l_ear = /obj/item/device/radio/headset/science

/singleton/hierarchy/outfit/job/torch/crew/research/New()
	..()
	BACKPACK_OVERRIDE_RESEARCH

/singleton/hierarchy/outfit/job/torch/crew/research/cso
	name = OUTFIT_JOB_NAME("Chief Science Officer - Explorator")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/research
	l_ear = /obj/item/device/radio/headset/heads/torchntdirector
	id_types = list(/obj/item/card/id/torch/silver/research)
	pda_type = /obj/item/modular_computer/pda/heads/rd

/singleton/hierarchy/outfit/job/torch/crew/research/senior_scientist
	name = OUTFIT_JOB_NAME("Senior Scientist - Explorator")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/research
	id_types = list(/obj/item/card/id/torch/crew/research/senior_scientist)

/singleton/hierarchy/outfit/job/torch/crew/research/scientist
	name = OUTFIT_JOB_NAME("Scientist - Explorator")
	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/research
	id_types = list(/obj/item/card/id/torch/crew/research/scientist)

/singleton/hierarchy/outfit/job/torch/passenger/research/assist/solgov
	name = OUTFIT_JOB_NAME("Research Assistant - Imperial")
	head = /obj/item/clothing/head/beret/solgov/research

/singleton/hierarchy/outfit/job/torch/passenger/research/scientist/solgov
	name = OUTFIT_JOB_NAME("Scientist - Imperial")
	head = /obj/item/clothing/head/beret/solgov/research
