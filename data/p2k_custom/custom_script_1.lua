GamePrint( "Custom Script 1 Was Executed." )

-- GamePrint( "Pro Gamer Strats Activated" )

-- local orb_path = { "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "13", }
-- for i = 1,13 do
	-- local path = "data/entities/items/orbs/orb_"..orb_path[i]..".xml"
	-- local id = tonumber( orb_path[i] )
	-- for e = 1,3 do
		-- local orb_id = EntityLoad( path, cam_x - 20*( e - 1 ), cam_y )
		-- ComponentSetValue2( EntityGetFirstComponentIncludingDisabled( orb_id, "OrbComponent" ), "orb_id", id + 128*( e - 1 ))
		-- EntitySetComponentIsEnabled( orb_id, EntityGetFirstComponentIncludingDisabled( orb_id, "AudioLoopComponent" ), false )
		-- -- GamePickUpInventoryItem( hooman, orb_id, false )
	-- end
-- end

-- dofile_once( "data/scripts/gun/gun.lua" )
-- _set_gun2()
-- _start_shot( 300 )
-- print( tostring( __globaldata ))

-- dofile_once( "data/scripts/gun/gun_actions.lua" )
-- dofile_once( "data/scripts/perks/perk_list.lua" )
-- GamePrint( #actions.."|"..#perk_list )

-- GameCreateParticle( "meat_burned", cam_x, cam_y, 1, 0, 0, false, false )

EntityLoad( "data/entities/animals/scavenger_smg.xml", cam_x, cam_y )