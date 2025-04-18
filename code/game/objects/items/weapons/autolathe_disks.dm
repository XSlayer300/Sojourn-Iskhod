/obj/item/pc_part/drive/disk/design
	name = "design disk"
	desc = "Data disk used to store autolathe designs."
	icon_state = "yellow"
	max_capacity = 1024	// Up to 255 designs, automatically reduced to the nearest power of 2
	origin_tech = list(TECH_DATA = 3) // Most design disks end up being 64 to 128 GQ
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 2, MATERIAL_GOLD = 0.5)
	license = -1
	var/list/designs = list()

/obj/item/pc_part/drive/disk/design/install_default_files()
	..()
	// Add design files to the disk
	for(var/design_typepath in designs)
		var/datum/computer_file/binary/design/D = new
		D.set_design_type(design_typepath)
		if(license > 0)
			D.set_point_cost(designs[design_typepath])

		store_file(D, TRUE) //Will force the disk to accept it in spite of size.

	// Prevent people from breaking DRM by copying files across protected disks.
	// Stops people from screwing around with unprotected disks too.
	read_only = TRUE
	return TRUE

