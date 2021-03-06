// some special stuff for flockdrones.
/datum/hud/critter/flock/drone
	icon_hud = 'icons/mob/flock_ui.dmi'

	New(M)
		..(M)
		var/obj/screen/releaseButton = create_screen("release", "Eject from Drone", 'icons/mob/flock_ui.dmi', "eject", "NORTH,WEST", HUD_LAYER+1, tooltipTheme = "flock")
		releaseButton.desc = "Remove yourself from this drone and become intangible."
		var/obj/screen/eggButton = create_screen("spawn", "Generate Egg", 'icons/mob/flock_ui.dmi', "spawn_egg", "SOUTH,EAST", HUD_LAYER+1, tooltipTheme = "flock")
		eggButton.desc = "Lay egg is true! Requires 100 resources."

	clicked(id, mob/user, list/params)				
		var/mob/living/critter/flock/drone/F = master
		if(F)
			if (id == "release")
				F.release_control()
			else if(id == "spawn")
				F.create_egg()
			else				
				..(id, user, params)
