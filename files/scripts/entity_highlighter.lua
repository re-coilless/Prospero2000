dofile_once( "mods/p2k/files/scripts/generic_lib.lua" )

local gui = GuiCreate()
GuiStartFrame( gui )

local targets = EntityGetInRadius( cam_x, cam_y, 250 ) or {}
if( #targets > 0 ) then
	local w, h = GuiGetScreenDimensions( gui )
	local uid = 0
	for i,entity_id in ipairs( targets ) do
		if( entity_id == EntityGetRootEntity( entity_id ) and EntityGetName( entity_id ) ~= "ctrl_body" ) then
			local t_x, t_y = EntityGetTransform( entity_id )
			if( captured_entity ~= entity_id ) then
				uid = new_pointer( gui, uid, w, h, -1, t_x, t_y )
			end
			
			if( ModSettingGetNextValue( "p2k.SHOW_NUMBERS" )) then
				local pic_x, pic_y = world2gui( gui, t_x, t_y )
				local pic_z = -0.5 + 2*i/100
				local text = tostring( entity_id )
				local length = GuiGetTextDimensions( gui, text, 1, 2 )
				local pic = "mods/p2k/files/pics/module_mid_B.png"
				uid = new_image( gui, uid, pic_x - length/2 - 1, pic_y - 12, pic_z, pic, length + 1, 1 )
				pic = "mods/p2k/files/pics/module_end.png"
				uid = new_image( gui, uid, pic_x - length/2 - 2, pic_y - 12, pic_z, pic )
				uid = new_image( gui, uid, pic_x + length/2, pic_y - 12, pic_z, pic )
				
				new_text( gui, pic_x - length/2, pic_y - 12, pic_z - 0.01, text, 2 )
			end
			
			if( uid > 1020 ) then
				break
			end
		end
	end
end

GuiDestroy( gui )