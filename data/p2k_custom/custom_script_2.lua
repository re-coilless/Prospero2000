GamePrint( "Custom Script 2 Was Executed." )

dofile_once( "data/scripts/lib/utilities.lua" )
dofile_once( "data/scripts/perks/perk.lua" )

perk_spawn( cam_x - 5, cam_y, "EDIT_WANDS_EVERYWHERE" )
perk_spawn( cam_x + 5, cam_y, "UNLIMITED_SPELLS" )
perk_spawn( cam_x, cam_y - 5, "REMOVE_FOG_OF_WAR" )
perk_spawn( cam_x, cam_y + 5, "DISSOLVE_POWDERS" )

-- GamePrint( get_flag_name( "noita" ).."|"..get_flag_name( "best_gymtipz" ) )
-- GamePrint( get_flag_name( "u_dheglmticg" ).."|"..get_flag_name( "bqedcjkvxooa" ) )
-- GamePrint( get_flag_name( "abcdefghijklmnopqrstuvwxyzdsice_trual_fgoipucrs_sm_t_theme" ))
-- GamePrint( teststring )