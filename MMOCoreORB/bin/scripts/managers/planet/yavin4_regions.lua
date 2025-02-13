-- Planet Region Definitions
--
-- {"regionName", x, y, shape and size, tier, {"spawnGroup1", ...}, maxSpawnLimit}
-- For circle and ring, x and y are the center point
-- For rectangles, x and y are the bottom left corner. x2 and y2 (see below) are the upper right corner
-- Shape and size is a table with the following format depending on the shape of the area:
--   - Circle: {CIRCLE, radius}
--   - Rectangle: {RECTANGLE, x2, y2}
--   - Ring: {RING, inner radius, outer radius}
-- Tier is a bit mask with the following possible values where each hexadecimal position is one possible configuration.
-- That means that it is not possible to have both a spawn area and a no spawn area in the same region, but
-- a spawn area that is also a no build zone is possible.

require("scripts.managers.planet.regions")

yavin4_regions = {
	-- No Build Zones
	{"northedge_yavin4_nobuild", -8000, 7640, {RECTANGLE, 8000, 8000}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"westedge_yavin4_nobuild", -8000, -7640, {RECTANGLE, -7640, 7640}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"southedge_yavin4_nobuild", -8000, -8000, {RECTANGLE, 8000, -7640}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"eastedge_yavin4_nobuild", 7640, -7640, {RECTANGLE, 7999, 7640}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"old_battlefield_nobuild_yav1", 3791, -2416, {CIRCLE, 256}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"old_battlefield_nobuild_yav2", -4230, 3755, {CIRCLE, 256}, NOSPAWNAREA + NOBUILDZONEAREA},

	-- Named Regions, POIs and Decor
	{"beach_debris", -6888, -2044, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"bench", -6322, 5087, {CIRCLE, 20}, NOBUILDZONEAREA},
	{"BH_camp", -7370, 4398, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"broken_pillar", 933, 3560, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"broken_wall", -7558, -5915, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"broken_wall_2", -7101, 5001, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"broken_wall_3", 2382, 3076, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"burning_tree", 329, -5308, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"camp", -3182, 3342, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"debris", -1952, 7127, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"fallen_log", 2125, 981, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"fallen_engine_part", 312, -3145, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"fallen_tree", -3851, 3048, {CIRCLE, 15}, NOBUILDZONEAREA},
	{"fence_and_tent", -5514, -1243, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"gazebo", 944, -1470, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"giant_statue_face", 931, 4453, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"green_force_stone", 6080, 5439, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"hut", -6359, -668, {CIRCLE, 64}, NOBUILDZONEAREA},
	{"jedi_ruins", -6464, 7355, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"life_day_home", -14, -3920, {CIRCLE, 128}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"marker", -3255, 3839, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"military_tower", -7571, -1084, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"military_tower_2", 4035, -6508, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"rebel_compound", -7096, 4388, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"rebel_commando_camp", 1590, 1538, {CIRCLE, 64}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"rebel_ruins", -2991, -1122, {CIRCLE, 64}, NOBUILDZONEAREA},
	{"ruins_and_alter", 934, 616, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"shelter", -6412, -2231, {CIRCLE, 32}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"tower_ruins", 305, -4425, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"tower_and_graves", 949, 1520, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"tribal_totem", -3151, -5093, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"wall", 5714, 6801, {CIRCLE, 32}, NOBUILDZONEAREA},
	{"@yavin4_region_names:great_masassi_temple", -3038, -2960, {CIRCLE, 150}, NAMEDREGION},
	{"yavin4_masassi_temple", -3038, -2960, {CIRCLE, 500}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"@yavin4_region_names:blueleaf_temple", -830, -2056, {CIRCLE, 150}, NAMEDREGION},
	{"yavin4_blueleaf_temple", -830, -2056, {CIRCLE, 250}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"@yavin4_region_names:temple_of_exar_kun", 5056, 5537, {CIRCLE, 100}, NAMEDREGION},
	{"yavin4_exar_kun_temple", 5056, 5537, {CIRCLE, 400}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"@yavin4_region_names:woolamander_temple", 512, -655, {CIRCLE, 100}, NAMEDREGION},
	{"yavin4_woolamander_temple", 512, -655, {CIRCLE, 400}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"@yavin4_region_names:borundi_peak", 5904, -4432, {CIRCLE, 1900}, NAMEDREGION},
	{"@yavin4_region_names:swamp_of_fallen_stars", 5024, -1728, {RECTANGLE, 8000, 2016}, NAMEDREGION},
	--{"@yavin4_region_names:isle_of_kun", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},
	{"@yavin4_region_names:isle_of_kun_1", 947, 6400, {CIRCLE, 1152}, NAMEDREGION},
	{"@yavin4_region_names:isle_of_kun_2", 3040, 3872, {RECTANGLE, 6176, 7360}, NAMEDREGION},
	{"@yavin4_region_names:isle_of_kun_3", 2416, 4592, {CIRCLE, 2070}, NAMEDREGION},
	{"@yavin4_region_names:isle_of_kun_4", 4160, 3744, {CIRCLE, 608}, NAMEDREGION},
	{"@yavin4_region_names:taurin_delta_1", 0, -4544, {CIRCLE, 1875}, NAMEDREGION},
	{"@yavin4_region_names:taurin_delta_2", -800, -5600, {CIRCLE, 1622}, NAMEDREGION},
	{"@yavin4_region_names:taurin_delta_3", -512, -2784, {CIRCLE, 1399}, NAMEDREGION},
	{"@yavin4_region_names:taurin_delta_4", 2096, -4944, {CIRCLE, 1266}, NAMEDREGION},
	{"@yavin4_region_names:valarnos_jungle_1", 256, -1376, {RECTANGLE, 5024, 1920}, NAMEDREGION},
	{"@yavin4_region_names:valarnos_jungle_2", 1888, -3392, {RECTANGLE, 2720, -1248}, NAMEDREGION},
	{"@yavin4_region_names:valarnos_jungle_3", 1312, -2816, {RECTANGLE, 2048, -1344}, NAMEDREGION},
	{"@yavin4_region_names:valarnos_jungle_4", 1520, -1392, {CIRCLE, 912}, NAMEDREGION},
	{"@yavin4_region_names:ersham_ridge", -4864, -4480, {CIRCLE, 1500}, NAMEDREGION},
	{"@yavin4_region_names:wayward_jungle_1", -6624, 3712, {RECTANGLE, -5056, 7680}, NAMEDREGION},
	{"@yavin4_region_names:wayward_jungle_2", -8000, 3404, {RECTANGLE, -3424, 5376}, NAMEDREGION},
	{"@yavin4_region_names:wayward_jungle_3", -4960, 2880, {RECTANGLE, -3584, 6496}, NAMEDREGION},
	{"@yavin4_region_names:wayward_jungle_4", -3424, 2048, {RECTANGLE, -928, 3968}, NAMEDREGION},
	{"@yavin4_region_names:wayward_jungle_5", -2592, -736, {RECTANGLE, -1440, 2112}, NAMEDREGION},
	{"@yavin4_region_names:wayward_jungle_6", -4144, 2672, {CIRCLE, 560}, NAMEDREGION},
	{"@yavin4_region_names:yunteh_mountains_1", -6384, 1744, {CIRCLE, 1616}, NAMEDREGION},
	{"@yavin4_region_names:yunteh_mountains_2", -4000, 640, {CIRCLE, 1344}, NAMEDREGION},
	{"@yavin4_region_names:nacolo_peak", 3728, -2480, {CIRCLE, 912}, NAMEDREGION},
	{"yavin4_coa2_imperial_base", 1596, -3533, {CIRCLE, 60}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"yavin4_coa2_rebel_base", -4238, 2277, {CIRCLE, 60}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"yavin4_geo_bunker_nobuild", -6488, -417, {CIRCLE, 250}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"yavin4_force_shrine_01", -4585, -3761, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"yavin4_force_shrine_02", 2390, -4935, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"yavin4_force_shrine_03", 6455, 6420, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"yavin4_force_shrine_04", -3362, 6915, {CIRCLE, 199}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"yavin4_jedi_enclave_dark", 5070, 310, {CIRCLE, 577}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},
	{"yavin4_jedi_enclave_light", -5514, 4912, {CIRCLE, 577}, NOSPAWNAREA + NOBUILDZONEAREA + NAVAREA},

	-- TBD
	--{"death_star_debris", 5846, 1444, {CIRCLE, 350}, NOSPAWNAREA + NOBUILDZONEAREA},
	--{"death_star_debris_2", 6087, 1396, {CIRCLE, 350}, NOSPAWNAREA + NOBUILDZONEAREA},
	--{"death_star_debris_3", 5161, 1163, {CIRCLE, 500}, NOSPAWNAREA + NOBUILDZONEAREA},
	--{"death_star_debris_4", 5717, 1284, {CIRCLE, 350}, NOSPAWNAREA + NOBUILDZONEAREA},
	--{"death_star_debris_5", 5040, 969, {CIRCLE, 350}, NOSPAWNAREA + NOBUILDZONEAREA},
	--{"@yavin4_region_names:an_outpost", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},
	--{"@yavin4_region_names:central_jungle", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},
	--{"@yavin4_region_names:eastern_swamp", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},
	--{"@yavin4_region_names:ersam_peak", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},
	--{"@yavin4_region_names:northwest_reach", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},
	--{"@yavin4_region_names:soutern_delta_2", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},
	--{"@yavin4_region_names:southeast_peak", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},
	--{"@yavin4_region_names:southwest_isle", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},
	--{"@yavin4_region_names:taurin_delta", 0, 0, {CIRCLE, 0}, UNDEFINEDAREA},

	-- Cities
	{"@yavin4_region_names:yavin4_labor_outpost", -6925, -5707, {CIRCLE, 200}, CITY + NOSPAWNAREA},
	{"@yavin4_region_names:yavin4_mining_outpost", -307, 4861, {CIRCLE, 200}, CITY + NOSPAWNAREA},
	{"@yavin4_region_names:imperial_fort", 4030, -6230, {CIRCLE, 200}, CITY + NOSPAWNAREA},
	{"@yavin4_region_names:yavin4_imperial_fort", 4030, -6215, {CIRCLE, 200}, NAMEDREGION},

	{"yavin4_imperial_base", 4034, -6212, {CIRCLE, 128}, UNDEFINEDAREA},
	{"yavin4_labor_outpost_nobuild_1", -6925, -5707, {CIRCLE, 200}, NOBUILDZONEAREA},
	{"yavin4_mining_outpost_nobuild_1", -307, 4861, {CIRCLE, 200}, NOBUILDZONEAREA},

	--[[
	{"yavin4_labor_outpost_1", -6954, -5735, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_labor_outpost_2", -6979, -5676, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_labor_outpost_3", -6921, -5653, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_labor_outpost_4", -6912, -5732, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_labor_outpost_5", -6948, -5754, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_mining_outpost_1", -364, 4839, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_mining_outpost_2", -366, 4867, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_mining_outpost_3", -348, 4882, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_mining_outpost_4", -325, 4889, {CIRCLE, 5}, UNDEFINEDAREA},
	{"yavin4_mining_outpost_5", -329, 4823, {CIRCLE, 5}, UNDEFINEDAREA},
	{"yavin4_mining_outpost_6", -353, 4821, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_mining_outpost_7", -312, 4825, {CIRCLE, 5}, UNDEFINEDAREA},
	{"yavin4_mining_outpost_8", -274, 4828, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_mining_outpost_9", -258, 4838, {CIRCLE, 2}, UNDEFINEDAREA},
	{"yavin4_mining_outpost_10", -256, 4892, {CIRCLE, 5}, UNDEFINEDAREA},
	]]

	-- Spawn Areas
	{"@yavin4_region_names:central_medium", -3975, -1240, {RECTANGLE, 975, 2990}, SPAWNAREA, {"yavin4_central_medium"}, 128},
	{"@yavin4_region_names:eastern_hard", 975, -1240, {RECTANGLE, 8000, 2999}, SPAWNAREA, {"yavin4_eastern_hard"}, 256},
	{"@yavin4_region_names:northeastern_hard", 1975, 2991, {RECTANGLE, 8000, 7900}, SPAWNAREA, {"yavin4_northeastern_hard"}, 256},
	{"@yavin4_region_names:northern_easy", -1542, 2991, {RECTANGLE, 1990, 5900}, SPAWNAREA, {"yavin4_northern_easy"}, 256},
	{"@yavin4_region_names:northwestern_hard", -7998, 2984, {RECTANGLE, -1520, 8000}, SPAWNAREA, {"yavin4_northwestern_hard"}, 256},
	{"@yavin4_region_names:southeastern_hard", 3525, -6875, {RECTANGLE, 8000, -1250}, SPAWNAREA, {"yavin4_southeastern_hard"}, 256},
	{"@yavin4_region_names:southern_medium", -1809, -6892, {RECTANGLE, 3530, -1240}, SPAWNAREA, {"yavin4_southern_medium"}, 256},
	{"@yavin4_region_names:southwestern_easy", -8000, -6875, {RECTANGLE, -1790, -1240}, SPAWNAREA, {"yavin4_southwestern_easy"}, 256},
	{"@yavin4_region_names:western_medium", -8000, -1242, {RECTANGLE, -3970, 2983}, SPAWNAREA, {"yavin4_western_medium"}, 256},

	{"@yavin4_region_names:swamp_one", 5200, 5488, {CIRCLE, 464}, SPAWNAREA, {"yavin4_isle_of_kun"}, 256},
	{"@yavin4_region_names:swamp_two", 4992, -1728, {RECTANGLE, 7776, 2476}, SPAWNAREA, {"yavin4_eastern_swamp"}, 256},
	{"@yavin4_region_names:jungle_one", -7296, 3744, {RECTANGLE, -3808, 6144}, SPAWNAREA, {"yavin4_hard_angler_nw", "yavin4_hard_kliknik_nw"}, 256},
	{"@yavin4_region_names:jungle_two", -3456, -768, {RECTANGLE, -928, 4128}, SPAWNAREA, {"yavin4_medium_gackle_bat_nw"}, 256},
	{"@yavin4_region_names:jungle_three", -1504, -6432, {RECTANGLE, 1920, -1696}, SPAWNAREA, {"yavin4_southern_delta"}, 256},
	{"@yavin4_region_names:jungle_four", -7999, -7999, {RECTANGLE, 7999, 7999}, SPAWNAREA, {"yavin4_central_jungle"}, 1024},
	{"@yavin4_region_names:jungle_five", 1280, 4224, {RECTANGLE, 5216, 7008}, SPAWNAREA, {"yavin4_hard_kliknik_ne", "yavin4_hard_angler_ne"}, 256},
	--{"@yavin4_region_names:mountain_one", -1408, 4384, {RECTANGLE, 544, 5440}, SPAWNAREA, {"yavin4_world"}, 256},
	{"@yavin4_region_names:mountain_two", -6272, 2176, {CIRCLE, 1472}, SPAWNAREA, {"yavin4_northwest_reach"}, 256},
	{"@yavin4_region_names:mountain_three", -4000, 896, {CIRCLE, 1312}, SPAWNAREA, {"yavin4_western_peak"}, 256},
	{"@yavin4_region_names:mountain_four", -5300, -4944, {CIRCLE, 2500}, SPAWNAREA, {"yavin4_southwest_isle", "yavin4_hard_mamien_sw", "yavin4_hard_skreeg_sw", "yavin4_hard_crystal_snake_sw"}, 256},
	{"@yavin4_region_names:mountain_five", 3600, -2256, {CIRCLE, 1424}, SPAWNAREA, {"yavin4_southeast_peak"}, 64},
	{"@yavin4_region_names:mountain_six", 5744, -4304, {CIRCLE, 1936}, SPAWNAREA, {"yavin4_hard_angler_se", "yavin4_hard_crystal_snake_ne", "yavin4_medium_gackle_bat_se", "yavin4_hard_kliknik_se"}, 128},

	{"@yavin4_region_names:world_spawner", 0, 0, {RECTANGLE, 0, 0}, SPAWNAREA + WORLDSPAWNAREA, {"yavin4_world"}, 1024},

	--[[ Infinity ]]
	-- mandalorian quest
	{"fishing_village", 5100, 4400, {CIRCLE, 256}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"fishing_village_nav", 5100, 4400, {CIRCLE, 368}, NAVAREA},
	{"fishing_village_outerSpawns", 5100, 4400, {CIRCLE, 525}, NOSPAWNAREA},
	{"fishing_village_eject", 5329, 3796, {CIRCLE, 64}, NOSPAWNAREA},
	{"mandobunker_1", 1524, -6320, {CIRCLE, 96}, NOSPAWNAREA + NOBUILDZONEAREA},
}
