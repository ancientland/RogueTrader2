/obj/item/organ/internal/eyes/unathi
	name = "reptilian eyes"
	desc = "Eyes belonging to a big lizard. They seem to be staring right at you no matter where you look from."
	icon = 'icons/mob/human_races/species/unathi/organs.dmi'
	eye_icon = 'icons/mob/human_races/species/unathi/eyes.dmi'

/obj/item/organ/internal/brain/unathi
	can_use_mmi = FALSE

/obj/item/organ/internal/stomach/unathi
	name = "gizzard"
	color = "#0033cc"
	var/static/list/gains_nutriment_from_inedible_reagents = list(
		/datum/reagent/woodpulp =      3,
		/datum/reagent/ultraglue =     1,
		/datum/reagent/coolant =       1,
		/datum/reagent/oil =      1,
		/datum/reagent/space_cleaner = 1,
		/datum/reagent/napalm =        1,
		/datum/reagent/napalm/b =      1,
		/datum/reagent/thermite =      1,
		/datum/reagent/foaming_agent = 1,
		/datum/reagent/surfactant =    1,
		/datum/reagent/paint =         1
	)
	var/static/list/can_digest_matter = list(
		MATERIAL_WOOD =        TRUE,
		MATERIAL_MAHOGANY =    TRUE,
		MATERIAL_MAPLE =       TRUE,
		MATERIAL_WALNUT =      TRUE,
		MATERIAL_LEATHER_GENERIC =     TRUE,
		MATERIAL_PLASTIC =     TRUE,
		MATERIAL_CARDBOARD =   TRUE,
		MATERIAL_CLOTH =       TRUE,
		MATERIAL_WASTE =       TRUE,
		MATERIAL_ROCK_SALT =   TRUE
	)
	var/static/list/can_process_matter = list(
		MATERIAL_GLASS =       TRUE,
		MATERIAL_BRONZE =      TRUE,
		MATERIAL_PITCHBLENDE = TRUE,
		MATERIAL_HEMATITE =    TRUE,
		MATERIAL_PYRITE =      TRUE,
		MATERIAL_SPODUMENE =   TRUE,
		MATERIAL_CINNABAR =    TRUE,
		MATERIAL_PHOSPHORITE = TRUE,
		MATERIAL_POTASH =      TRUE,
		MATERIAL_BAUXITE =     TRUE,
		MATERIAL_COPPER =      TRUE,
		MATERIAL_ALUMINIUM =   TRUE,
		MATERIAL_BORAX =       TRUE
	)
	var/list/stored_matter = list()

/obj/item/organ/internal/stomach/unathi/Process()
	. = ..()
	if(is_usable())

		// Handle some post-metabolism reagent processing for generally inedible foods.
		if(ingested.total_volume > 0)
			for(var/datum/reagent/R in ingested.reagent_list)
				var/inedible_nutriment_amount = gains_nutriment_from_inedible_reagents[R.type]
				if(inedible_nutriment_amount > 0)
					owner.adjust_nutrition(inedible_nutriment_amount)

		// Do we have any objects to digest?
		var/list/check_materials
		var/updated_stacks
		for(var/obj/item/food in contents)
			for(var/mat in food.matter)
				if(!can_digest_matter[mat] && !can_process_matter[mat])
					continue

				// Grab a chunk out of the object.
				var/digested = min(food.matter[mat], rand(200,500))
				food.matter[mat] -= digested
				digested *= 0.75
				if(food.matter[mat] <= 0)
					food.matter -= mat
				if(!length(food.matter))
					qdel(food)

				// Process it.
				if(can_digest_matter[mat])
					owner.adjust_nutrition(max(1, floor(digested/100)))
					updated_stacks = TRUE
				else if(can_process_matter[mat])
					LAZYDISTINCTADD(check_materials, mat)
					stored_matter[mat] += digested

		// Convert stored matter into sheets.
		for(var/mat in check_materials)
			var/material/M = SSmaterials.get_material_by_name(mat)
			if(M && M.stack_type && stored_matter[mat] >= M.units_per_sheet)

				// Remove as many sheets as possible from the gizzard.
				var/sheets = floor(stored_matter[mat]/M.units_per_sheet)
				stored_matter[mat] -= M.units_per_sheet * sheets
				if(stored_matter[mat] <= 0)
					stored_matter -= mat

				// Merge them into other stacks.
				for(var/obj/item/stack/material/mat_stack in contents)
					if(mat_stack.material == M && mat_stack.amount < mat_stack.max_amount)
						var/taking_sheets = min(sheets, mat_stack.max_amount - mat_stack.amount)
						mat_stack.set_amount(mat_stack.amount + taking_sheets)
						sheets -= taking_sheets
						updated_stacks = TRUE

				// Create new stacks if needed.
				while(sheets > 0)
					var/obj/item/stack/material/mat_stack = new M.stack_type(src)
					var/taking_sheets = min(sheets, mat_stack.max_amount)
					mat_stack.set_amount(mat_stack.amount + taking_sheets)
					sheets -= taking_sheets
					updated_stacks = TRUE

		if(updated_stacks && prob(5))
			to_chat(owner, SPAN_NOTICE("Your [name] churns as it digests some material into a usable form."))
