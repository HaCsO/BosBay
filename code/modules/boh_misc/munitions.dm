/////////
// birdshot
/////////

//casing
/obj/item/ammo_casing/shotgun/birdshot
	name = "birdshot shell"
	desc = "A birdshot shell."
	icon = 'icons/boh/ammo.dmi'
	icon_state = "bdshell"
	spent_icon = "bdshell-spent"
	projectile_type = /obj/item/projectile/bullet/pellet/birdshot
	ammo_stack = /obj/item/ammo_magazine/handful/shotgun/shotgun_handful/birdshot/two
	matter = list(MATERIAL_STEEL = 80)

//projectile
/obj/item/projectile/bullet/pellet/birdshot
	name = "birdshot"
	fire_sound = 'sound/weapons/gunshot/gunshot_4mm.ogg'
	damage = 2
	pellets = 10
	range_step = 2
	spread_step = 10
	agony = 15//up from 8.5
	shrapnel_chance_multiplier = 99 //Guarantees shrapnel. Needed for the gimmick.
	embed = 1//shouldn't HAVE to be noted, but, y'know, seems like it's a problem.

//holder
/obj/item/ammo_magazine/shotholder/birdshot
	name = "birdshot shell holder"
	ammo_type = /obj/item/ammo_casing/shotgun/birdshot
	matter = list(MATERIAL_STEEL = 620)
	marking_color = COLOR_PALE_YELLOW

/////////
// Magnum 'less-lethal'
/////////

//casing
/obj/item/ammo_casing/pistol/magnum/rubber
	desc = "A high-power pistol rubber bullet casing."
	caliber = CALIBER_PISTOL_MAGNUM
	projectile_type = /obj/item/projectile/bullet/pistol/strong/rubber

//projectile
/obj/item/projectile/bullet/pistol/strong/rubber
	damage = 10
	armor_penetration = 5
	agony = 45

//mag
/obj/item/ammo_magazine/magnum/rubber
	name = "less-lethal magazine"
	ammo_type = /obj/item/ammo_casing/pistol/magnum/rubber

/////////
// Skrell Gas Charge
/////////
/obj/item/projectile/hotgas/skrell
	name = "gas"
	icon = 'icons/effects/effects.dmi'
	icon_state = "mustard"
	fire_sound = 'sound/effects/stealthoff.ogg'
	silenced = FALSE

/////////
// recoilless shell
/////////

//casing
/obj/item/ammo_casing/rocket/rcr
	name = "incendiary shell"
	desc = "A high explosive designed to be fired from a launcher. This one is marked with various warnings. As if anyone reads them, pfft. \
	It does mention something about being an incredibly localized explosive, however, and only to be used against non-organic targets. Whatever that means."
	icon = 'icons/boh/ammo.dmi'
	icon_state = "rcrshell"
	spent_icon = "rcrshell-spent"//for some reason needed because wacky
	matter = list(MATERIAL_STEEL = 50000) //Same as the RCD, retardedly high, for good reason.
	projectile_type = /obj/item/projectile/bullet/rcr

//projectile
/obj/item/projectile/bullet/rcr
	name ="incendiary shell"
	icon_state= "rod"
	damage_type = DAMAGE_BURN
	damage = 165//It's a rocket and there's so few of them. We'll down this if it's too powerful. Up from 90, which was a tickle cannon.
	armor_penetration = 65 //not 100, because recoilless rifles don't have that high of a velocity
	damage_flags = DAMAGE_FLAG_EDGE | DAMAGE_FLAG_DISPERSED | DAMAGE_FLAG_EXPLODE

/obj/item/projectile/bullet/rcr/on_hit(var/atom/target, var/blocked = 0)
	explosion(target, 0, 1, 6, 12)
	return 1

/////////
// EPP Projectile
/////////
/obj/item/projectile/beam/pulse/epp
	damage = 15
	agony = 20 //reduced for lethality bonus.

/////////
// .454
/////////
//casing
/obj/item/ammo_casing/pistol/magnum/large
	desc = "A high-power bullet casing."
	caliber = CALIBER_PISTOL_MAGNUM_LARGE
	projectile_type = /obj/item/projectile/bullet/pistol/large
	ammo_stack = /obj/item/ammo_magazine/handful/magnum_handful/two

//projectile
/obj/item/projectile/bullet/pistol/large
	damage = 70
	agony = 10

//mag
/obj/item/ammo_magazine/speedloader/large
	name = "heavy speed loader"
	icon_state = "spdloader_magnum"
	caliber = CALIBER_PISTOL_MAGNUM_LARGE
	ammo_type = /obj/item/ammo_casing/pistol/magnum/large
	matter = list(MATERIAL_STEEL = 50000) //Same as the RCD, retardedly high, for good reason.
	max_ammo = 6
	multiple_sprites = 1

/////////
// Sec Bullpup
/////////
//casing
/obj/item/ammo_casing/rifle/military/low
	desc = "A frangible bullet casing."
	caliber = CALIBER_RIFLE_MILITARY
	projectile_type = /obj/item/projectile/bullet/rifle/military/sec

//projectile
/obj/item/projectile/bullet/rifle/military/sec
	damage = 40 //higher damage
	armor_penetration = 5 //much worse pen - frangible bullets
	shrapnel_chance_multiplier = 1.5
	arterial_bleed_chance_multiplier = 1.5 //higher post pen

//mag
/obj/item/ammo_magazine/mil_rifle/sec
	name = "frangible munitions rifle magazine"
	ammo_type = /obj/item/ammo_casing/rifle/military/low

//bigger mag
/obj/item/ammo_magazine/mil_rifle/sec/large
	name = "high-cap frangible munitions rifle magazine"
	icon_state = "assault_rifle"
	ammo_type = /obj/item/ammo_casing/rifle/military/low
	max_ammo = 30

/////////
// SL Shotty
/////////
//casing
/obj/item/ammo_casing/sabot
	name = "sabot shell"
	desc = "APFSDS in a neat little package. It's prone to over penetrating, and as such does little damage to targets without armor." //even though it does little damage overall, being a niche round.
	icon = 'icons/boh/ammo.dmi'
	icon_state = "sabshell"
	spent_icon = "sabshell-spent"
	caliber = CALIBER_SABOT
	projectile_type = /obj/item/projectile/bullet/sabot
	ammo_stack = /obj/item/ammo_magazine/handful/shotgun/shotgun_handful/sabot/two
	matter = list(MATERIAL_STEEL = 420)

//projectile
/obj/item/projectile/bullet/sabot
	name = "sabot"
	icon_state= "rod"
	fire_sound = 'sound/weapons/gunshot/shotgun.ogg'
	damage = 35
	armor_penetration = 80
	shrapnel_chance_multiplier = 0.1
	arterial_bleed_chance_multiplier = 0.1
	penetrating = 1
	damage_flags = DAMAGE_FLAG_EDGE

//holder
/obj/item/ammo_magazine/shotholder/sabot
	name = "sabot shell holder"
	caliber = CALIBER_SABOT
	ammo_type = /obj/item/ammo_casing/sabot
	matter = list(MATERIAL_STEEL = 1240)
	marking_color = COLOR_GUNMETAL

/////////
//Skrell QX2
/////////

//magazine
/obj/item/ammo_magazine/skrell_shotgun
	name = "skrellian flechette magazine"
	desc = "A magazine with pointy, alien flechettes inside"
	icon = 'icons/boh/obj/ammo.dmi'
	icon_state = "skrellflechettemag"
	mag_type = MAGAZINE
	caliber = CALIBER_SKRELL_SHOTGUN
	ammo_type = /obj/item/ammo_casing/skrell_shotgun
	matter = list(MATERIAL_STEEL = 1240)
	max_ammo = 8
	multiple_sprites = 1

//projectile
/obj/item/projectile/bullet/magnetic/skrell_flechette
	name = "flechette"
	icon_state = "flechette"
	damage = 25
	armor_penetration = 100
	fire_sound = 'sound/weapons/rapidslice.ogg'
	distance_falloff = 0.5

//casing
/obj/item/ammo_casing/skrell_shotgun
	name = "skrellian flechette"
	desc = "A pointy flechette of alien design"
	icon = 'icons/boh/obj/ammo.dmi'
	icon_state = "skrellflechette"
	spent_icon = "skrellflechette-spent"
	caliber = CALIBER_SKRELL_SHOTGUN
	projectile_type = /obj/item/projectile/bullet/magnetic/skrell_flechette

/////////
// smg frangibles
/////////

//casing
/obj/item/ammo_casing/pistol/small/frangible
	desc = "A small pistol bullet casing."
	projectile_type = /obj/item/projectile/bullet/pistol/frangible
	caliber = CALIBER_PISTOL_FRANGIBLE
	icon_state = "smallcasing"
	spent_icon = "smallcasing-spent"

//projectile
/obj/item/projectile/bullet/pistol/frangible
	name = "frangible bullet"
	damage = 15
	armor_penetration = 35 //Lets try this. Up from 5.
	shrapnel_chance_multiplier = 2 //Smaller, tumbling projectile.
	arterial_bleed_chance_multiplier = 1.2 //Less post-pen compared to rifles.

//Magazine
/obj/item/ammo_magazine/smg_top/frangible
	labels = list("frangible")
	caliber = CALIBER_PISTOL_FRANGIBLE
	ammo_type = /obj/item/ammo_casing/pistol/small/frangible

// Rockets //

/obj/item/ammo_casing/rocket
	name = "rocket shell"
	desc = "A high explosive designed to be fired from a launcher."
	icon_state = "rocketshell"
	projectile_type = /obj/item/projectile/missile
	caliber = CALIBER_ROCKET

// Yes, this a copy paste of above, but these shouldn't be under the normal rocket subcategory so you can't reload one use launchers without admins.
/obj/item/ammo_casing/oneuse_rocket
	name = "rocket shell"
	desc = "A high explosive designed to be fired from a launcher."
	icon_state = "rocketshell"
	projectile_type = /obj/item/projectile/missile
	caliber = CALIBER_ROCKET

//Idk what is this why is it in rocket category i don't know bay shitcode goddamn it
/obj/item/ammo_magazine/speedloader/xo
	labels = list("magnum")
	caliber = CALIBER_PISTOL_MAGNUM
	ammo_type = /obj/item/ammo_casing/pistol/magnum

// BOS ROCKETS NEXT //

/obj/item/ammo_casing/rocket/point_rocket
	name = "point rocket shell"
	desc = "A high explosive designed to be fired from a launcher. This one has a smaller damage radius, but an stronger explosion. Good for destruction of fortifications."
	projectile_type = /obj/item/projectile/missile/point_missile

/obj/item/ammo_casing/rocket/smoke_rocket
	name = "smoke rocket shell"
	desc = "A rocket designed to create smoke-clouds. Good for enemy distraction."
	projectile_type = /obj/item/projectile/missile/smoke_missile

/obj/item/ammo_casing/rocket/shrapnel_rocket
	name = "shrapnel rocket shell"
	desc = "A rocket designed to violate the Moon Convention."
	projectile_type = /obj/item/projectile/missile/shrapnel_missile
