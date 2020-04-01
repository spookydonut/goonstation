// ITS WARC TIME BAYBEE 

// Moved these from BBSSS.dm to here because they're global and don't really give that much away (should they be global?)
var/johnbill_shuttle_fartnasium_active = 0
var/fartcount = 0

/area/diner/tug
	icon_state = "green"
	name = "Big Yank's Cheap Tug"

/area/shuttle/john/diner
	icon_state = "shuttle"

/area/shuttle/john/owlery
	icon_state = "shuttle2"

/area/shuttle/john/mining
	icon_state = "shuttle2"

/area/shuttle/john/grillnasium
	icon_state = "shuttle"

/obj/item/clothing/head/paper_hat/john
	name = "John Bill's paper bus captain hat"
	desc = "This is made from someone's tax returns"

/obj/item/clothing/mask/cigarette/john
	name = "John Bill's cigarette"
	on = 1
	put_out(var/mob/user as mob, var/message as text)
		// how about we do literally nothing instead?

/obj/item/clothing/shoes/thong
	name = "garbage flip-flops"
	desc = "These cheap sandals don't even look legal."
	icon_state = "thong"
	protective_temperature = 0
	permeability_coefficient = 1
	var/possible_names = list("sandals", "flip-flops", "thongs", "rubber slippers", "jandals", "slops", "chanclas")
	var/stapled = FALSE

	examine()
		. = ..()
		if(stapled)
			return "Two thongs stapled together, to make a MEGA VELOCITY boomarang."
		else
			return "These cheap [pick(possible_names)] don't even look legal."

	attackby(obj/item/W, mob/user)
		if (istype(W, /obj/item/staple_gun) && !stapled)
			stapled = TRUE
			boutput(user, "You staple the [src] together to create a mighty thongarang.")
			name = "thongarang"
			icon_state = "thongarang"
			throwforce = 5
			throw_range = 10
			throw_return = 1
		else
			..()

	setupProperties()
		..()
		setProperty("coldprot", 0)
		setProperty("heatprot", 0)
		setProperty("conductivity", 1)


var/list/JOHN_greetings = strings("johnbill.txt", "greetings")
var/list/JOHN_rude = strings("johnbill.txt", "rude")
var/list/JOHN_insults = strings("johnbill.txt", "insults")
var/list/JOHN_people = strings("johnbill.txt", "people")
var/list/JOHN_question = strings("johnbill.txt", "question")
var/list/JOHN_item = strings("johnbill.txt", "item")
var/list/JOHN_drugs = strings("johnbill.txt", "drugs")
var/list/JOHN_nouns = strings("johnbill.txt", "nouns")
var/list/JOHN_verbs = strings("johnbill.txt", "verbs")
var/list/JOHN_stories = strings("johnbill.txt", "stories1") + strings("johnbill.txt", "stories2") + strings("johnbill.txt", "stories3")
var/list/JOHN_doMiss = strings("johnbill.txt", "domiss")
var/list/JOHN_dontMiss = strings("johnbill.txt", "dontmiss")
var/list/JOHN_friends = strings("johnbill.txt", "friends")
var/list/JOHN_friendActions = strings("johnbill.txt", "friendsactions")
var/list/JOHN_emotes = strings("johnbill.txt", "emotes")
var/list/JOHN_deadguy = strings("johnbill.txt", "deadguy")
var/list/JOHN_murray = strings("johnbill.txt", "murraycompliment")
var/list/JOHN_grilladvice = strings("johnbill.txt", "grilladvice")


// all of john's area specific lines here
area/var/john_talk = null
area/owlery/owleryhall/john_talk = list("Oh dang, That's me! Wait... Oh dang guys, I think I'm banned from here.","Hope these guys don't mind I stole their bus.","Oh i've seen a scanner like that before. Lotta radiation.","Hey that thing there? Looks important.")
area/owlery/owleryhall/gangzone/john_talk = list("I don't likesa the looksa these Italians, brud","That's some tough lookin boids- We cool?","Oughta grill a couple of these types. Grill em well done.")
area/diner/dining/john_talk = list("This place smells a lot like my bro.","This was a good spot to park the bus.","Y'all got a grill in here?","Could do a lot of crimes back there. Probably will.")
area/diner/bathroom/john_talk = list("I haven't been here in a foggy second!", "I wonder what the fungus on the walls here tastes like... wanna juice it?", "I always wondered what happened to this toilet.")
area/lower_arctic/lower/john_talk = list("I ain't a fan of wendibros, they steal my meat.","Chilly eh?")
area/moon/museum/west/john_talk = list("Got lost here once. More than once. Every time.","You got a map, beardo?","Can we go home yet?")
area/jones/bar/john_talk = list("When the heck am I gonna get some service here, I'm parched!","What do I gotta start purrin' to get a drink here?","What's the holdup, catscratch? Let's get this party started!")
area/solarium/john_talk = list("You kids will try anything, wontcha?","Nice sun, dorkus.","So it's a star? Big deal.","I betcha my bus coulda got us here faster, dork.","All righty, now let's grill a steak on that thing!","You bring any snacks?")
area/marsoutpost/john_talk= list("Things weren't this dry last time I was here.","Really let the place go to the rats didn't they.","Great place for a cookout, if you ask me.")
area/marsoutpost/duststorm/john_talk= list("Aw fuck, I've seen storms like this before. Where the hell was that planet...","Gehenna awaits.")
area/sim/racing_entry/john_talk = list("Haha I'm a Nintendo","Beep Boop","Lookit Ma'! I'm in the computer!","Ey cheggit out! Pixels!")
area/crypt/sigma/mainhall/john_talk = list("Looks a heck a spooky in here","Wonder if there's any meat in that swamp?")
area/iomoon/base/john_talk = list("Yknow, I think it's almost too hot to grill out there.","This place is a lot shittier than Mars, y'know that?","I didn't really wanna come along you know. I did this for you.")
area/dojo/john_talk = list("Eyyy, just like my cartoons!","What a sight! Gotta admire the Italians, eh?")
area/dojo/sakura/john_talk = list("Shoshun mazu, Sake ni ume uru, Nioi kana","Haru moya ya, Keshiki totonou, Tsuki to ume","Hana no kumo, Kane ha Ueno ka, Asakusa ka")
area/meat_derelict/entry/john_talk = list("Oooh baby now we're talkin! Now we're talkin!","Oh heck yeah now that's my kind of adventure, eh?","Oh boy do I have a good feelin' about this one!")
area/meat_derelict/main/john_talk = list("Aw yeah dog, this place just gets better and better!","Mmm Mmm! That smells fresh and ready for a grillin'!")
area/meat_derelict/guts/john_talk = list("And just when I thought it couldnt get better.","Pinch me, I'm dreaming!","Smells good in here, like vinegar!")
area/meat_derelict/boss/john_talk = list("I'm gonna need a bigger grill.","Fuck that's a big steak!","Oooh mama we are cooked now!")
area/meat_derelict/soviet/john_talk = list("Betcha these rooskies don't even own a grill","Wonder what these reds are doin in my steak palace?","Ah, gotta debone that before ya cook it.")
area/bee_trader/john_talk = list("That little Bee, always gettin' inta trouble.","Hey remember that weird puzzle with the showerheads?","What a nasty museum that was, eh? Nasty.")
area/flock_trader/john_talk = list("Woah, what's with these teal chickens? Must be good grillin'.","I feel like this was revealed to me in a fever dream once.","Dang, that's a mighty fine chair.")
area/timewarp/ship/john_talk = list("I wonder if my ol' compadre Murray is around.","Did ya see those clocks outside? Time just flies by.","I swear I saw a ship just like this years ago, but somewhere else.","Didn't they use to haul some strange stuff on these gals?")
area/derelict_ai_sat/core/john_talk = list("Hello, Daddy.","You should probably start writing down the shit I say, I certainly can't remember any of it.")
area/adventure/urs_dungeon/john_talk = list("This place smells like my bro.","Huh, Always wondered what those goggles did.","Huh, Always wondered what those goggles did.","Your hubris will be punished. Will you kill your fellow man to save yourself? Who harvests the harvestmen? What did it feel like when you lost your mind?")
/area/grillnasium/grill_chamber/john_talk = list("You better know what you've started.","This is where it happens.")

// bus driver
/mob/living/carbon/human/john
	real_name = "John Bill"
	interesting = "Found in a coffee can at age fifteen. Went to jail for fraud. Recently returned to the can."
	gender = MALE
	var/talk_prob = 7
	var/greeted_murray = 0
	var/list/snacks = null
	var/gotsmokes = 0

	New()
		..()
		johnbills += src
		SPAWN_DBG(0)
			bioHolder.mobAppearance.customization_first = "Tramp"
			bioHolder.mobAppearance.customization_first_color = "#281400"
			bioHolder.mobAppearance.customization_second = "Pompadour"
			bioHolder.mobAppearance.customization_second_color = "#241200"
			bioHolder.mobAppearance.customization_third = "Tramp: Beard Stains"
			bioHolder.mobAppearance.customization_third_color = "#663300"
			bioHolder.age = 63
			bioHolder.bloodType = "A+"
			bioHolder.mobAppearance.gender = "male"
			bioHolder.mobAppearance.underwear = "briefs"
			bioHolder.mobAppearance.u_color = "#996633"

			SPAWN_DBG(1 SECOND)
				bioHolder.mobAppearance.UpdateMob()

			src.equip_new_if_possible(/obj/item/clothing/shoes/thong, slot_shoes)
			src.equip_new_if_possible(/obj/item/clothing/under/color/orange, slot_w_uniform)
			src.equip_new_if_possible(/obj/item/clothing/mask/cigarette/john, slot_wear_mask)
			src.equip_new_if_possible(/obj/item/clothing/suit/labcoat, slot_wear_suit)
			src.equip_new_if_possible(/obj/item/clothing/head/paper_hat/john, slot_head)

			var/obj/item/implant/access/infinite/shittybill/implant = new /obj/item/implant/access/infinite/shittybill(src)
			implant.implanted(src, src)

	disposing()
		johnbills -= src
		..()

	// John Bill always goes to the afterlife bar.
	death(gibbed)
		..(gibbed)

		johnbills.Remove(src)

		if (!src.client)
			var/turf/target_turf = pick(get_area_turfs(/area/afterlife/bar/barspawn))

			var/mob/living/carbon/human/john/newbody = new()
			newbody.set_loc(target_turf)
			newbody.overlays += image('icons/misc/32x64.dmi',"halo")
			if(inafterlifebar(src))
				qdel(src)
			return
		else
			boutput(src, "<span style='font-size: 1.5em; color: blue;'><B>Haha you died loser.</B></span>")
			src.become_ghost()

	Life(datum/controller/process/mobs/parent)
		if (..(parent))
			return 1
		if(!src.stat && !src.client)
			if(target)
				if(isdead(target))
					target = null
				if(get_dist(src, target) > 1)
					step_to(src, target, 1)
				if(get_dist(src, target) <= 1 && !LinkBlocked(src.loc, target.loc))
					var/obj/item/W = src.equipped()
					if (!src.restrained())
						if(W)
							W.attack(target, src, ran_zone("chest"))
						else
							target.attack_hand(src)
			else if(ai_aggressive)
				a_intent = INTENT_HARM
				for(var/mob/M in oview(5, src))
					if(M == src)
						continue
					if(M.type == src.type)
						continue
					if(M.stat)
						continue
					// stop on first human mob
					if(ishuman(M))
						target = M
						break
					target = M
			if(prob(20) && src.canmove && isturf(src.loc))
				step(src, pick(NORTH, SOUTH, EAST, WEST))
			if(prob(2))
				SPAWN_DBG(0) emote(pick(JOHN_emotes))
			if(prob(15))
				snacktime()
			var/area/A = get_area(src)
			if(prob(talk_prob) || A.john_talk)
				src.speak()

	proc/snacktime()
		snacks = list()
		for(var/obj/item/reagent_containers/food/snacks/S in src)
			snacks += S
		if(snacks.len > 0)
			var/obj/item/reagent_containers/food/snacks/snacc = pick(snacks)
			if(istype(snacc, /obj/item/reagent_containers/food/snacks/bite))
				if(prob(75))
					return
				else
					src.visible_message("<span style=\"color:red\">[src] horks up a lump from his stomach... </span>")
			snacc.Eat(src,src,1)


	proc/speak()
		SPAWN_DBG(0)
			var/list/grills = list()

			var/obj/machinery/bot/guardbot/old/tourguide/murray = pick(tourguides)
			if (murray && get_dist(src,murray) > 7)
				murray = null
			if (istype(murray))
				if (!findtext(murray.name, "murray"))
					murray = null

			var/area/A = get_area(src)
			var/list/alive_mobs = list()
			var/list/dead_mobs = list()
			if (A.population && A.population.len)
				for(var/mob/living/M in oview(5,src))
					if(!isdead(M))
						alive_mobs += M
					else
						dead_mobs += M

			if (prob(20))
				for(var/obj/machinery/shitty_grill/G in orange(5, src))
					grills.Add(G)

			if (A.john_talk && prob(90))
				SPAWN_DBG(5 SECONDS)
					var/area/john_area = get_area(src)
					say(pick(john_area.john_talk))
					john_area.john_talk = null

			else if (grills.len > 0)
				var/obj/machinery/shitty_grill/G = pick(grills)
				if (G.grillitem)
					switch(G.cooktime)
						if (0 to 15)
							say("Yep, \the [G.grillitem] needs a little more time.")
						if (16 to 49)
							say("[pick(JOHN_rude)], [pick(JOHN_grilladvice)] [G.grillitem].")
						if (50 to 59)
							say("Whoa! \The [G.grillitem] is cooked to perfection! Lemme get that for ya!")
							G.eject_food()
						else
							say("Good fuckin' job [pick(JOHN_insults)], you burnt it.")
				else
					if (G.grilltemp >= 200 + T0C)
						if(prob(70))
							say("That there ol' [G] looks about ready for a [pick(JOHN_drugs)]-seasoned steak!")
						else
							say("That [G] is hot! Who's grillin' ?")
					else
						say("Anyone gonna fire up \the [G]?")

			else if(prob(40) && dead_mobs && dead_mobs.len > 0) //SpyGuy for undefined var/len (what the heck)
				var/mob/M = pick(dead_mobs)
				say("[pick(JOHN_deadguy)] [M.name]...")
			else if (alive_mobs.len > 0)
				if (murray && !greeted_murray)
					greeted_murray = 1
					say("[pick(JOHN_greetings)] Murray! How's it [pick(JOHN_verbs)]?")
					SPAWN_DBG(rand(20,40))
						if (murray && murray.on && !murray.idle)
							murray.speak("Hi, John! It's [pick(JOHN_murray)] to see you here, of all places.")

				else
					var/mob/M = pick(alive_mobs)
					var/speech_type = rand(1,11)

					switch(speech_type)
						if(1)
							say("[pick(JOHN_greetings)] [M.name].")

						if(2)
							say("[pick(JOHN_question)] you lookin' at, [pick(JOHN_insults)]?")

						if(3)
							say("You a [pick(JOHN_people)]?")

						if(4)
							say("[pick(JOHN_rude)], gimme yer [pick(JOHN_item)].")

						if(5)
							say("Got a light, [pick(JOHN_insults)]?")

						if(6)
							say("Nice [pick(JOHN_nouns)], [pick(JOHN_insults)].")

						if(7)
							say("Got any [pick(JOHN_drugs)]?")

						if(8)
							say("I ever tell you 'bout [pick(JOHN_stories)]?")

						if(9)
							say("You [pick(JOHN_verbs)]?")

						if(10)
							if (prob(50))
								say("Man, I sure miss [pick(JOHN_doMiss)].")
							else
								say("Man, I sure don't miss [pick(JOHN_dontMiss)].")

						if(11)
							say("I think my [pick(JOHN_friends)] [pick(JOHN_friendActions)].")

					if (prob(25) && shittybills.len > 0)
						SPAWN_DBG(3.5 SECONDS)
							var/mob/living/carbon/human/biker/MB = pick(shittybills)
							switch (speech_type)
								if (4)
									MB.say("You borrowed mine fifty years ago, and I never got it back.")
								if (7)
									MB.say("If I had any, I wouldn't share it with ya [pick(BILL_insults)].")
								if (8)
									if (prob(2))
										MB.say("One of these days, you oughta. I don't believe it for a second but let's hear it, [pick(BILL_people)].")
									else if (prob(6))
										MB.say("No way, [src].")
									else
										MB.say("Yeah, [src], you told me that one before.")
								if (9)
									if (prob(50))
										MB.say("Yeah, sometimes.")
									else
										MB.say("No way.")
								else
									MB.speak()



	attackby(obj/item/W, mob/M)
		if (istype(W, /obj/item/paper/tug/invoice))
			if(ON_COOLDOWN(src, "attackby_chatter", 3 SECONDS)) return
			boutput(M, "<span style=\"color:blue\"><b>You show [W] to [src]</b> </span>")
			SPAWN_DBG(1 SECOND)
				say("One of them [pick(JOHN_people)] folks from the station helped us raise the cash. Lil bro been dreamin bout it fer years.")
			return
		#ifdef SECRETS_ENABLED
		if (istype(W, /obj/item/paper/grillnasium/fartnasium_recruitment))
			if(ON_COOLDOWN(src, "attackby_chatter", 3 SECONDS)) return
			boutput(M, "<span style=\"color:blue\"><b>You show [W] to [src]</b> </span>")
			SPAWN_DBG(1 SECOND)
				say("Well hot dog! [pick(JOHN_insults)], you wouldn't believe it but I use to work there!")
				johnbill_shuttle_fartnasium_active = 1
				sleep(20)
				say("Yer dag right we can go Juicin around in there! Pack yer shit we're doin a B&E ! ! ! ")
				emote("dance")
			return
		#endif
		if (istype(W, /obj/item/reagent_containers/food/snacks) || (istype(W, /obj/item/clothing/mask/cigarette/cigarillo) && !gotsmokes))
			if(ON_COOLDOWN(src, "attackby_chatter", 3 SECONDS)) return
			boutput(M, "<span style=\"color:blue\"><b>You offer [W] to [src]</b> </span>")
			M.u_equip(W)
			W.set_loc(src)
			W.dropped()
			src.drop_item()
			src.put_in_hand_or_drop(W)

			SPAWN_DBG(1 DECI SECOND)
				say("Oh? [W] eh?")
				say(pick("No kiddin' fer me?","I guess I could go fer a quick one yeah!","Oh dang dang dang! Haven't had one of these babies in a while!","Well I never get tired of those!","You're offering this to me? Don't mind if i do, [pick(JOHN_people)]"))
				src.a_intent = INTENT_HELP // pacify a juicer with food, obviously
				src.target = null
				src.ai_state = 0
				src.ai_target = null

				if (istype(W, /obj/item/clothing/mask/cigarette/cigarillo/juicer))
					gotsmokes = 1
					sleep(30)
					say(pick("Listen bud, I don't know who sold you these, but they ain't your pal.","Y'know these ain't legal in any NT facilities, right?","Maybe you ain't so dumb as ya look, brud."))
					var/obj/item/clothing/mask/cigarette/cigarillo/juicer/J = W
					src.u_equip(wear_mask)
					src.equip_if_possible(J, slot_wear_mask)
					J.cant_other_remove = 0
					sleep(30)
					J.light(src, "<span style='color:red'><b>[src]</b> casually lights [J] and takes a long draw.</span>")
					sleep(50)
#if BUILD_TIME_DAY >= 28 // this block controls whether or not it is the right time to smoke a fat doink with Big J
					say("You know a little more than you let on, don't you?")
					sleep(70)
					say("See but I been away long enough that I don't know much about you.")
					emote("cough")
					sleep(150)
					particleMaster.SpawnSystem(new /datum/particleSystem/blow_cig_smoke(src.loc, src.dir))
					say("Other than you 'trasies really did me and my bro a solid, back when there was that whole business with the bee n' all that. A real solid. But by now you're wonderin' why we were involved with her anyhow.")
					sleep(70)
					say("All in due time.")
					emote("cough")
					sleep(90)
					J.put_out(src, "<b>[src]</b> distractedly drops and treads on the lit [J.name], putting it out instantly.")
					src.u_equip(J)
					J.set_loc(src.loc)
					sleep(20)
					say("These just don't taste the same without him...")
#else // it is not time
					say(pick("This ain't the time, but we should have a talk. A long talk.","Under better circumstances, I'd like to smoke a few of these and reminesce with ya.","We'll have to do this again some time. When the time is right."))
#endif
					gotsmokes = 0

				else if(istype(W, /obj/item/clothing/mask/cigarette))
					say(pick("Well this ain't my usual brand, but...", "Oh actually, got any... uh nah you've probably never even seen one of those.","Wait a second, this ain't a real 'Rillo."))
					var/obj/item/clothing/mask/cigarette/cig = W
					src.u_equip(wear_mask)
					src.equip_if_possible(cig, slot_wear_mask)
					sleep(30)
					cig.light(src, "<span style='color:red'><b>[src]</b> cautiously lights [cig] and takes a short draw.</span>")
					sleep(50)
					say(pick("Yeah that's ol' Dan's stuff...","But hey, thanks for the smokes, bruddo.","Smooth. Too smooth."))
			return
		..()

	was_harmed(var/mob/M as mob, var/obj/item/weapon = 0, var/special = 0)
		if (special) //vamp or ling
			src.target = M
			src.ai_state = 2
			src.ai_threatened = world.timeofday
			src.ai_target = M
			src.a_intent = INTENT_HARM
			src.ai_active = 1

		for (var/mob/SB in shittybills)
			var/mob/living/carbon/human/biker/S = SB
			if (get_dist(S,src) <= 7)
				if(!(S.ai_active) || (prob(25)))
					S.say("That's my brother, you [pick(JOHN_insults)]!")
				S.target = M
				S.ai_active = 1
				S.a_intent = INTENT_HARM




var/bombini_saved = 0

/obj/machinery/computer/shuttle_bus
	name = "John's Bus"
	icon_state = "shuttle"
	machine_registry_idx = MACHINES_SHUTTLECOMPS

/obj/machinery/computer/shuttle_bus/embedded
	icon_state = "shuttle-embed"
	density = 0
	layer = EFFECTS_LAYER_1 // Must appear over cockpit shuttle wall thingy.


	north
		dir = NORTH
		pixel_y = 25

	east
		dir = EAST
		pixel_x = 25

	south
		dir = SOUTH
		pixel_y = -25

	west
		dir = WEST
		pixel_x = -25




/obj/machinery/computer/shuttle_bus/attack_hand(mob/user as mob)
	if(..())
		return
	var/dat = "<a href='byond://?src=\ref[src];close=1'>Close</a><BR><BR>"

	switch(johnbus_location)
		if(0)
			dat += "Shuttle Location: Diner"
		if(1)
			dat += "Shuttle Location: Frontier Space Owlery"
		if(2)
			dat += "Shuttle Location: Old Mining Station"
		if(3)
			dat += "Shuttle Location: Juicer Schweet's"


	dat += "<BR>"
	switch(johnbus_destination)
		if(0)
			dat += "Shuttle Destination: Diner"
		if(1)
			dat += "Shuttle Destination: Frontier Space Owlery"
		if(2)
			dat += "Shuttle Destination: Old Mining Station"
		if(3)
			dat += "Shuttle Destination: Juicer Schweet's"

	dat += "<BR><BR>"
	if(johnbus_active)
		dat += "Status: Cruisin"
	else
		dat += "<a href='byond://?src=\ref[src];dine=1'>Set Target: Diner</a><BR>"
		dat += "<a href='byond://?src=\ref[src];owle=1'>Set Target: Owlery</a><BR>"
#ifndef UNDERWATER_MAP
		dat += "<a href='byond://?src=\ref[src];mine=1'>Set Target: Old Mining Station</a><BR>"
#endif
		if(johnbill_shuttle_fartnasium_active)
			dat += "<a href='byond://?src=\ref[src];fart=1'>Set Target: Juicer Schweet's</a><BR>"
		dat += "<BR>"
		if (johnbus_location != johnbus_destination)
			dat += "<a href='byond://?src=\ref[src];send=1'>Send It</a><BR><BR>"
		else
			dat += "Let's go somewhere else, ok?<BR>"

	user.Browse(dat, "window=shuttle")
	onclose(user, "shuttle")
	return

/obj/machinery/computer/shuttle_bus/Topic(href, href_list)
	if(..())
		return
	if ((usr.contents.Find(src) || (in_range(src, usr) && istype(src.loc, /turf))) || (issilicon(usr)))
		usr.machine = src

		if (href_list["send"])
			if(!johnbus_active)
				var/turf/T = get_turf(src)
				johnbus_active = 1
				for(var/obj/machinery/computer/shuttle_bus/C in machine_registry[MACHINES_SHUTTLECOMPS])

					C.visible_message("<span style=\"color:red\">John is starting up the engines, this could take a minute!</span>")

				for(var/obj/machinery/computer/shuttle_bus/embedded/B in machine_registry[MACHINES_SHUTTLECOMPS])
					T = get_turf(B)
					SPAWN_DBG(1 DECI SECOND)
						playsound(T, "sound/effects/ship_charge.ogg", 60, 1)
						sleep(30)
						playsound(T, "sound/machines/weaponoverload.ogg", 60, 1)
						src.visible_message("<span style=\"color:red\">The shuttle is making a hell of a racket!</span>")
						sleep(50)
						playsound(T, "sound/impact_sounds/Machinery_Break_1.ogg", 60, 1)
						for(var/mob/living/M in range(src.loc, 10))
							shake_camera(M, 5, 2)

						sleep(20)
						playsound(T, "sound/effects/creaking_metal2.ogg", 70, 1)
						sleep(30)
						src.visible_message("<span style=\"color:red\">The shuttle engine alarms start blaring!</span>")
						playsound(T, "sound/machines/pod_alarm.ogg", 60, 1)
						var/obj/decal/fakeobjects/shuttleengine/smokyEngine = locate() in get_area(src)
						var/datum/effects/system/harmless_smoke_spread/smoke = new /datum/effects/system/harmless_smoke_spread()
						smoke.set_up(5, 0, smokyEngine)
						smoke.start()
						sleep(40)
						playsound(T, "sound/machines/boost.ogg", 60, 1)
						for(var/mob/living/M in range(src.loc, 10))
							shake_camera(M, 10, 4)

				T = get_turf(src)
				SPAWN_DBG(25 SECONDS)
					playsound(T, "sound/effects/flameswoosh.ogg", 70, 1)
					call_shuttle()

		else if (href_list["dine"])
			if(!johnbus_active)
				johnbus_destination = 0
				var/turf/T = get_turf(src)
				playsound(T, "sound/machines/glitch1.ogg", 60, 1)

		else if (href_list["owle"])
			if(!johnbus_active)
				johnbus_destination = 1
				var/turf/T = get_turf(src)
				playsound(T, "sound/machines/glitch1.ogg", 60, 1)

		else if (href_list["mine"])
			if(!johnbus_active)
				johnbus_destination = 2
				var/turf/T = get_turf(src)
				playsound(T, "sound/machines/glitch1.ogg", 60, 1)

		else if (href_list["fart"])
			if(!johnbus_active)
				johnbus_destination = 3
				var/turf/T = get_turf(src)
				playsound(T, "sound/machines/glitch1.ogg", 60, 1)


		else if (href_list["close"])
			usr.machine = null
			usr.Browse(null, "window=shuttle")

	src.add_fingerprint(usr)
	src.updateUsrDialog()
	return


/obj/machinery/computer/shuttle_bus/proc/call_shuttle()
	var/area/end_location = null
	var/area/start_location = null

	switch(johnbus_destination)
		if(0)
			end_location = locate(/area/shuttle/john/diner)
		if(1)
			end_location = locate(/area/shuttle/john/owlery)
		if(2)
			end_location = locate(/area/shuttle/john/mining)
		if(3)
			end_location = locate(/area/shuttle/john/grillnasium)

	switch(johnbus_location)
		if(0)
			start_location = locate(/area/shuttle/john/diner)
			start_location.move_contents_to(end_location)

		if(1)
			start_location = locate(/area/shuttle/john/owlery)

			if(!bombini_saved)
				for(var/obj/npc/trader/bee/b in start_location)
					bombini_saved = 1
					for(var/mob/M in start_location)
						boutput(M, "<span style=\"color:blue\">It would be great if things worked that way, but they don't. You'll need to find what <b>Bombini</b> is missing, now.</span>")

			start_location.move_contents_to(end_location)

		if(2)
			start_location = locate(/area/shuttle/john/mining)
			start_location.move_contents_to(end_location)

		if(3)
			start_location = locate(/area/shuttle/john/grillnasium)
			start_location.move_contents_to(end_location)

	johnbus_location = johnbus_destination

	johnbus_active = 0

	for(var/obj/machinery/computer/shuttle_bus/C in machine_registry[MACHINES_TURRETS])

		C.visible_message("<span style=\"color:red\">John's Juicin' Bus has Moved!</span>")

	return

obj/decal/fakeobjects/thrust
	icon = 'icons/effects/effects.dmi'
	icon_state = "shieldsparkles"
	name = "ionized exhaust"
	desc = "Thankfully harmless, to registered employees anyway."

obj/decal/fakeobjects/thrust/flames
	icon_state = "engineshit"
obj/decal/fakeobjects/thrust/flames2
	icon_state = "engineshit2"

obj/item/paper/tug/invoice
	name = "Big Yank's Space Tugs, Limited."
	desc = "Looks like a bill of sale."
	info = {"<b>Client:</b> Bill, John
			<br><b>Date:</b> TBD
			<br><b>Articles:</b> Structure, Static. Pressurized. Single.
			<br><b>Destination:</b> \"where there's rocks at\"\[sic\]
			<br>
			<br><b>Total Charge:</b> 17,440 paid in full with value-added meat.
			<br>Big Yank's Cheap Tug"}

obj/item/paper/tug/warehouse
	name = "Big Yank's Space Tugs, Limited."
	desc = "Looks like a bill of sale. It is blank"
	info = {"<b>Client:</b>
			<br><b>Date:</b>
			<br><b>Articles:</b>
			<br><b>Duration:</b>
			<br>
			<br><b>Total Charge:</b>
			<br>Big Yank's Stash N Dash"}


/turf/simulated/wall/r_wall/afterbar
	name = "wall"
	desc = null
	attackby(obj/item/W as obj, mob/user as mob, params)
		return


/*
Urs' Hauntdog critter
*/
/obj/critter/hauntdog
	name = "hauntdog"
	desc = "A very, <i>very</i> haunted hotdog. Hopping around. Hopdog."
	icon = 'icons/misc/hauntdog.dmi'
	icon_state = "hauntdog"
	health = 30
	density = 0

	patrol_step()
		if (!mobile)
			return
		var/turf/moveto = locate(src.x + rand(-1,1),src.y + rand(-1, 1),src.z)

		if(isturf(moveto) && !moveto.density)
			flick("hauntdog-hop",src)
			step_towards(src, moveto)
		if(src.aggressive) seek_target()
		steps += 1
		if (steps == rand(5,20)) src.task = "thinking"

	ai_think()
		if(prob(5))
			flip()
		..()

	proc/flip()
		src.visible_message("<b>[src]</b> does a flip!",2)
		flick("hauntdog-flip",src)
		sleep(13)

	CritterDeath()
		if (!src.alive) return
		src.visible_message("<b>[src]</b> stops moving.",2)
		var/obj/item/reagent_containers/food/snacks/hotdog/H = new /obj/item/reagent_containers/food/snacks/hotdog(get_turf(src))

		H.bun = 5
		H.desc = "A very haunted hotdog. A hauntdog, perhaps."
		H.heal_amt += 1
		H.name = "ordinary hauntdog"
		H.food_effects = list("food_all","food_brute")
		if (H.reagents)
			H.reagents.add_reagent("ectoplasm", 10)
		H.update_icon()

		qdel(src)

/mob/living/critter/small_animal/pig/hogg
	name = "hogg vorbis"
	real_name = "hogg vorbis"
	desc = "the hogg vorbis."
	icon_state = "hogg"
	icon_state_dead = "pig-dead"
	density = 1
	speechverb_say = "screams!"
	speechverb_exclaim = "screams!"
	meat_type = /obj/item/reagent_containers/food/snacks/ingredient/meat/bacon
	name_the_meat = 0

	specific_emotes(var/act, var/param = null, var/voluntary = 0)
		switch (act)
			if ("scream")
				if (src.emote_check(voluntary, 50))
					var/turf/T = get_turf(src)
					return "<span style='color:#605b59'><b>[src]</b> screeeams!</span>"
					var/hogg = pick("sound/voice/hagg_vorbis.ogg","sound/voice/hogg_vorbis.ogg","sound/voice/hogg_vorbis_the.ogg","sound/voice/hogg_vorbis_screams.ogg","sound/voice/hogg_with_scream.ogg","sound/voice/hoooagh2.ogg","sound/voice/hoooagh.ogg",)
					playsound(T, hogg, 60, 1)
		return null

	specific_emote_type(var/act)
		switch (act)
			if ("scream")
				return 2
		return ..()

	on_pet(mob/user)
		if (..())
			return 1
		if (prob(25))
			var/turf/T = get_turf(src)
			src.visible_message("[src] screams![prob(5) ? " ...uh?" : null]",\
			"You screams!")
			var/hogg = pick("sound/voice/hagg_vorbis.ogg","sound/voice/hogg_vorbis.ogg","sound/voice/hogg_vorbis_the.ogg","sound/voice/hogg_vorbis_screams.ogg","sound/voice/hogg_with_scream.ogg","sound/voice/hoooagh2.ogg","sound/voice/hoooagh.ogg",)
			playsound(T, hogg, 60, 1)
