/decl/hierarchy/outfit/job
	name = "Standard Gear"
	hierarchy_type = /decl/hierarchy/outfit/job

	uniform = /obj/item/clothing/under/color
	l_ear = /obj/item/device/radio/headset
	shoes = /obj/item/clothing/shoes/color/black
	id_slot = slot_wear_id
	id_type = /obj/item/card/id
	pda_slot = slot_belt
	pda_type = /obj/item/modular_computer/pda

	flags = OUTFIT_HAS_BACKPACK

/decl/hierarchy/outfit/job/equip_id(mob/living/carbon/human/H)
	var/obj/item/card/id/C = ..()
	if(C)
		if(H.mind)
			if(H.mind.initial_account)
				C.associated_account_number = H.mind.initial_account.account_number
			if(H.mind.initial_email_login)
				C.associated_email_login = H.mind.initial_email_login.Copy()
		return C

///decl/hierarchy/outfit/job/equip(mob/living/carbon/human/H, rank, assignment, equip_adjustments)
//	var/obj/item/oddity/secdocs/D = /obj/item/oddity/secdocs
//	if(D.inv_spawn_count > 0 && !backpack_contents[D] && prob(5))
//		backpack_contents[D] = 1
//		--D.inv_spawn_count
//	..()
