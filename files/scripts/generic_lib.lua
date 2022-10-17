dofile_once( "data/scripts/lib/utilities.lua" )

function b2n( a )
	return a and 1 or 0
end

function binsearch( tbl, value )
	local low = 1
	local high = #tbl
	
	while( high >= low ) do
		local middle = math.floor(( low + high )/2 + 0.5)
		if( tbl[middle] < value ) then
			low = middle + 1
		elseif( tbl[middle] > value ) then
			high = middle - 1
		elseif( tbl[middle] == value ) then
			return middle
		end
	end
	
	return nil
end

function magic_sorter( tbl, func )
    local out_tbl = {}
    for n in pairs( tbl ) do
        table.insert( out_tbl, n )
    end
    table.sort( out_tbl, func )
	
    local i = 0
    local iter = function ()
        i = i + 1
        if( out_tbl[i] == nil ) then
            return nil
        else
            return out_tbl[i], tbl[out_tbl[i]]
        end
    end
    return iter
end

function render_sorter( tbl, topmost )
	topmost = topmost ~= 0 and topmost or nil

    local out_tbl = {}
    for n in pairs( tbl ) do
        table.insert( out_tbl, n )
    end
    table.sort( out_tbl, function( a, b )
		return ( topmost ~= b and ( topmost == a or string.byte( a ) > string.byte( b )))
	end)
	
    local i = 0
    local iter = function ()
        i = i + 1
        if out_tbl[i] == nil then
            return nil
        else
            return out_tbl[i], tbl[out_tbl[i]]
        end
    end
    return iter
end

function magic_parser( text, splitter )
	local out_table = {}
	
	for part in string.gmatch( text, "([^"..splitter.."]+)" ) do
		table.insert( out_table, part )
	end
	
	return out_table
end

function add_table( a, b )
	if( #b > 0 ) then
		table.sort( b )
		if( #a > 0 ) then
			for m,new in ipairs( b ) do 
				if( binsearch( a, new ) == nil ) then
					table.insert( a, new )
				end
			end
			
			table.sort( a )
		else
			a = b
		end
	end
	
	return a
end

function t2w( str )
	local t = {}
	
	for word in string.gmatch( str, "([^%s]+)" ) do
		table.insert( t, word )
	end
	
	return t
end

function world2gui( gui, x, y )
	local w, h = GuiGetScreenDimensions( gui )
	local cam_x, cam_y = GameGetCameraPos()
	local shit_from_ass = w/( MagicNumbersGetValue( "VIRTUAL_RESOLUTION_X" ) + MagicNumbersGetValue( "VIRTUAL_RESOLUTION_OFFSET_X" ))
	
	return w/2 + shit_from_ass*( x - cam_x ), h/2 + shit_from_ass*( y - cam_y ), shit_from_ass
end

function gui2world( gui, x, y )
	local w, h = GuiGetScreenDimensions( gui )
	local cam_x, cam_y = GameGetCameraPos()
	local shit_from_ass = w/( MagicNumbersGetValue( "VIRTUAL_RESOLUTION_X" ) + MagicNumbersGetValue( "VIRTUAL_RESOLUTION_OFFSET_X" ))
	
	return ( cam_x - x )/shit_from_ass - w/2, ( cam_y - y )/shit_from_ass - h/2, shit_from_ass
end

function D_extractor( data_raw, use_nums )
	if( data_raw == nil ) then
		return nil
	end
	use_nums = use_nums or false
	
	local data = {}
	
	for value in string.gmatch( data_raw, "([^|]+)" ) do
		if( use_nums ) then
			table.insert( data, tonumber( value ))
		else
			table.insert( data, value )
		end
	end
	
	return data
end

function D_packer( data )
	if( data == nil ) then
		return nil
	end

	local data_raw = "|"
	
	for i,value in ipairs( data ) do
		data_raw = data_raw..value.."|"
	end
	
	return data_raw
end

function DD_extractor( data_raw, use_nums )
	if( data_raw == nil ) then
		return nil
	end
	use_nums = use_nums or false
	
	local data = {}
	
	for subdata_raw in string.gmatch( data_raw, "([^|]+)" ) do
		local subdata = {}
		for value in string.gmatch( subdata_raw, "([^:]+)" ) do
			if( use_nums ) then
				table.insert( subdata, tonumber( value ))
			else
				table.insert( subdata, value )
			end
		end
		table.insert( data, subdata )
	end
	
	return data
end

function DD_packer( data )
	if( data == nil ) then
		return nil
	end
	
	local data_raw = "|"
	
	for i,subdata in ipairs( data ) do
		for e,value in ipairs( subdata ) do
			data_raw = data_raw..":"..value
			if( e == #subdata ) then
				data_raw = data_raw..":"
			end
		end
		data_raw = data_raw.."|"
	end
	
	return data_raw
end

function liner( gui, text, length, height, length_k, clean_mode, forced_reverse )
	local formated = {}
	if( text ~= nil and text ~= "" ) then
		local length_counter = 0
		if( height ~= nil ) then
			length_k = length_k or 6
			length = math.floor( length/length_k + 0.5 )
			height = math.floor( height/9 )
			local words = t2w( text )
			local height_counter = 1
			local rest = ""
			local buffer = ""
			local dont_touch = false
			text = ""
			
			for i,word in ipairs( words ) do
				buffer = word
				local w_length = string.len( buffer ) + 1
				length_counter = length_counter + w_length
				dont_touch = false
				
				if( length_counter > length or buffer == "@" ) then
					if( w_length >= length ) then
						rest = string.sub( buffer, length - ( length_counter - w_length - 1 ), w_length )
						text = text..buffer.." "
					else
						length_counter = w_length
					end
					table.insert( formated, tostring( string.gsub( string.sub( text, 1, length ), "@ ", "" )))
					height_counter = height_counter + 1
					text = ""
					while( rest ~= "" ) do
						w_length = string.len( rest ) + 1
						length_counter = w_length
						buffer = rest
						if( length_counter > length ) then
							rest = string.sub( rest, length + 1, w_length )
							table.insert( formated, tostring( string.sub( buffer, 1, length )))
							dont_touch = true
							height_counter = height_counter + 1
						else
							rest = ""
							length_counter = w_length
						end
						
						if( height_counter > height ) then
							break
						end
					end
				end
				
				if( height_counter > height ) then
					break
				end
				
				text = text..buffer.." "
			end
			
			if( not( dont_touch ) and text ~= "@ " ) then
				table.insert( formated, tostring( string.gsub( string.sub( text, 1, length ), "@", "" )))
			end
		else
			local starter = math.floor( math.abs( length )/7 + 0.5 )
			local total_length = string.len( text )
			if( starter < total_length ) then
				if(( length > 0 or not( ModSettingGetNextValue( "p2k.END_DISPLAY" ))) and forced_reverse == nil ) then
					length = math.abs( length )
					formated = string.sub( text, 1, starter )
					for i = starter + 1,total_length do
						formated = formated..string.sub( text, i, i )
						length_counter = GuiGetTextDimensions( gui, formated, 1, 2 )
						if( length_counter > length ) then
							formated = string.sub( formated, 1, string.len( formated ) - 1 )
							break
						end
					end
				else
					length = math.abs( length )
					starter = total_length - starter
					formated = string.sub( text, starter, total_length )
					while starter > 0 do
						starter = starter - 1
						formated = string.sub( text, starter, starter )..formated
						length_counter = GuiGetTextDimensions( gui, formated, 1, 2 )
						if( length_counter > length ) then
							formated = string.sub( formated, 2, string.len( formated ))
							break
						end
					end
				end
			else
				formated = text
			end
		end
	else
		if( clean_mode == nil ) then
			table.insert( formated, "[NIL]" )
		else
			formated = ""
		end
	end
	
	return formated
end

function get_mouse_pos( gui )
	local m_x, m_y = DEBUG_GetMouseWorld()
	return world2gui( gui, m_x, m_y )
end

function colourer( gui, c_type )
	local color = { r = 0, g = 0, b = 0 }
	if( type( c_type ) == "table" ) then
		color.r = c_type[1]
		color.g = c_type[2]
		color.b = c_type[3]
	else
		if( c_type == nil or c_type == 1 ) then
			color.r = 238
			color.g = 226
			color.b = 206
		elseif( c_type == 2 ) then
			color.r = 136
			color.g = 121
			color.b = 247
		elseif( c_type == 3 ) then
			color.r = 245
			color.g = 132
			color.b = 132
		end
	end
	
	GuiColorSetForNextWidget( gui, color.r/255, color.g/255, color.b/255, 1 )
end

function get_player()
	local players = get_players()
	if( players ) then
		return players[1]
	end
	
	return nil
end

function get_name( entity_id )
	local name = EntityGetName( entity_id )
	if( name == " " or name == "" or name == nil ) then
		name = tostring( entity_id )
	end
	
	return name
end

function is_object( field_name )
	local names = { "gun_config", "gunaction_config", "config", "config_explosion", "damage_by_type", "damage_multipliers", "damage_critical", "laser",
					"attack_melee_finish_config_explosion", "drug_fx_target", "m_drug_fx_current", "fx_add", "fx_multiply", }
	
	for i,name in ipairs( names ) do
		if( name == field_name ) then
			return true
		end
	end
	
	return false
end

function is_supported( comp_name, field_name )
	local unsupported_names = {
		LuaComponent = { "mLuaManager", "mPersistentValues", },
		SpriteComponent = { "mRenderList", "mSprite", },
		ParticleEmitterComponent = { "m_collision_angles", "m_cached_image_animation", },
		AnimalAIComponent = { "mAiStateStack", "mCurrentJob", },
		LightComponent = { "mSprite", },
		PlayerCollisionComponent = { "mPhysicsCollisionHax", },
		WorldStateComponent = { "pending_portals", "orbs_found_thisrun", "cuts_through_world", "npc_parties", "apparitions_per_level", "lua_globals", },
		MaterialSuckerComponent = { "randomized_position", },
		SpriteAnimatorComponent = { "mStates", "mCachedTargetSpriteTag", },
		PixelSpriteComponent = { "mPixelSprite", },
		VerletPhysicsComponent = { "sprite", "links", "colors", "materials", },
		VerletWorldJointComponent = { "mCell", },
		IngestionComponent = { "m_ingestion_satiation_material_cache", },
		ExplodeOnDamageComponent = { "delay", "damage_critical", "physics_explosion_power", "impl_position", },
		PhysicsBodyComponent = { "mLocalPosition", "mBody", "mBodyId", },
		PhysicsBody2Component = { "mBody", "mBodyId", },
		PhysicsImageShapeComponent = { "mBody", },
		ProjectileComponent = { "mTriggers", },
		IKLimbsAnimatorComponent = { "mLimbStates", },
		IKLimbWalkerComponent = { "mState", },
		IKLimbAttackerComponent = { "mState", },
		SpriteStainsComponent = { "mData", "mState", "mTextureHandle", },
		InventoryGuiComponent = { "imgui", "mLastPurchasedAction", },
		TeleportComponent = { "state", },
		PathFindingComponent = { "debug_path", "input", "job_result_receiver", "jump_trajectories", "mFallbackLogic", "mSelectedLogic", "mLogic", "mState", "path", "path_next_node", "path_previous_node", },
		PathFindingGridMarkerComponent = { "mNode", },
		PhysicsJointComponent = { "mJoint", },
		PhysicsJoint2MutatorComponent = { "mBox2DJointId", },
		PhysicsPickUpComponent = { "leftJoint", "rightJoint", },
		GunComponent = { "mLuaManager", },
	}
	
	local fields = unsupported_names[comp_name]
	if( fields ~= nil ) then
		for i,name in ipairs( fields ) do
			if( name == field_name ) then
				return false
			end
		end
	end
	
	return true
end

function play_sound( event )
	if( not( sound_played ) and not( IS_1K_MODE )) then
		sound_played = false
		local c_x, c_y = GameGetCameraPos()
		GamePlaySound( "mods/p2k/files/sfx/p2k.bank", event, c_x, c_y )
	end
end

function play_key_sound( is_special )
	if( not( IS_MNEE ) or not( ModSettingGetNextValue( "p2k.MNEE_MUTE" ))) then
		play_sound( "keys/key_"..ModSettingGetNextValue( "p2k.KEYSWITCH_TYPE" )..( is_special == nil and "_generic" or "_special" ))
	end
end

function free_cam( mode )
	if( mode ) then
		if( not( GameHasFlagRun( "CAMERA_IS_FREE" ))) then
			GameSetCameraFree( true )
			GameAddFlagRun( "CAMERA_IS_FREE" )
		end
	else
		if( GameHasFlagRun( "CAMERA_IS_FREE" )) then
			GameSetCameraFree( false )
			GameRemoveFlagRun( "CAMERA_IS_FREE" )
		end
	end
end

function new_number()
	if( window_count[dimension] > 0 ) then
		for i = 1,26 do
			if( window_table[dimension][ string.char( i + 64 )] == nil ) then
				return string.char( i + 64 )
			end
		end
		return nil
	end
	
	return "A"
end

function active_switch( direction )
	direction = direction or false
	
	if( window_count[dimension] > 0 ) then
		if( active_window[dimension] ~= 0 ) then
			local current = string.byte( active_window[dimension]) - 64
			local d_i = not( direction ) and -1 or 1
			local i = current + d_i
			while( i ~= current ) do
				local id = string.char( i + 64 )
				if( window_table[dimension][id] ~= nil and not( window_table[dimension][id].minimized )) then
					active_window[dimension] = id
					return
				end
				i = i + d_i
				if( i > 26 ) then
					i = 1
				elseif( i < 1 ) then
					i = 26
				end
			end
		else
			local i = 26
			local id = string.char( i + 64 )
			while( window_table[dimension][id] == nil ) do
				i = i - 1
				id = string.char( i + 64 )
				if( i < 1 ) then
					return
				end
			end
			active_window[dimension] = id
		end
	end
end

function new_spawn( p_wid )
	local pic_x = 20
	local pic_y = 41
	
	if( p_wid == nil ) then
		if( window_count[dimension] > 0 ) then
			for i = 1,3 do
				for e = 1,10 do
					local checker = true
					for k,wnd in pairs( window_table[dimension] ) do
						if( not( wnd.minimized ) and wnd.w_x == pic_x and wnd.w_y == pic_y ) then
							checker = false
							break
						end
					end
					if( checker ) then
						return pic_x, pic_y
					end
					pic_x = pic_x + 40
					pic_y = pic_y + 5
				end
				pic_x = 20
				pic_y = pic_y + 52
			end
		end
	else
		pic_x = window_table[dimension][p_wid].w_x + 12
		pic_y = window_table[dimension][p_wid].w_y + 12
		local children = window_table[dimension][p_wid].children
		for i = 1,#children + 1 do
			local checker = true
			for e,wnd in ipairs( children ) do
				if( not( window_table[dimension][wnd].minimized ) and window_table[dimension][wnd].w_x == pic_x and window_table[dimension][wnd].w_y == pic_y ) then
					checker = false
					break
				end
			end
			if( checker ) then
				return pic_x, pic_y
			end
			pic_x = pic_x + 12
			pic_y = pic_y - 12
		end
		
		return pic_x, pic_y
	end
	
	return 20, 41
end

function born_child( parent_id, child_id, force_active )
	if( child_id ~= nil ) then
		if( force_active or false ) then
			active_window[dimension] = child_id
		end
		table.insert( window_table[dimension][parent_id].children, child_id )
		window_table[dimension][child_id].parent = parent_id
	end
end

function entity_has_comp( entity_id, comp_id )
	local comps = EntityGetAllComponents( entity_id ) or {}
	if( #comps > 0 ) then
		table.sort( comps )
		return binsearch( comps, comp_id )
	end
	return nil
end

function new_text( gui, pic_x, pic_y, pic_z, text, colours )
	local out_str = {}
	if( text ~= nil ) then
		if( type( text ) == "table" ) then
			out_str = text
		else
			table.insert( out_str, text )
		end
	else
		table.insert( out_str, "[NIL]" )
	end
	
	for i,line in ipairs( out_str ) do
		colourer( gui, colours or 1 )
		GuiZSetForNextWidget( gui, pic_z )
		GuiText( gui, pic_x, pic_y, line )
		pic_y = pic_y + 9
	end
end

function new_image( gui, uid, pic_x, pic_y, pic_z, pic, s_x, s_y, alpha, interactive )
	if( s_x == nil ) then
		s_x = 1
	end
	if( s_y == nil ) then
		s_y = 1
	end
	if( alpha == nil ) then
		alpha = 1
	end
	if( interactive == nil ) then
		interactive = false
	end
	
	if( not( interactive )) then
		GuiOptionsAddForNextWidget( gui, 2 ) --NonInteractive
	end
	GuiZSetForNextWidget( gui, pic_z )
	uid = uid + 1
	GuiIdPush( gui, uid )
	GuiImage( gui, uid, pic_x, pic_y, pic, alpha, s_x, s_y )
	return uid
end

function new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	GuiZSetForNextWidget( gui, pic_z )
	uid = uid + 1
	GuiIdPush( gui, uid )
	GuiOptionsAddForNextWidget( gui, 6 ) --NoPositionTween
	GuiOptionsAddForNextWidget( gui, 4 ) --ClickCancelsDoubleClick
	GuiOptionsAddForNextWidget( gui, 21 ) --DrawNoHoverAnimation
	GuiOptionsAddForNextWidget( gui, 47 ) --NoSound
	local clicked, r_clicked = GuiImageButton( gui, uid, pic_x, pic_y, "", pic )
	return uid, clicked, r_clicked
end

function new_mnee( main_check, binding_name, is_vip, dirty_mode, mod_id )
	if( IS_MNEE and not( ModSettingGetNextValue( "p2k.MNEE_DISABLE" ))) then
		main_check = main_check or get_binding_pressed( mod_id or "p2k", binding_name, is_vip or ModSettingGetNextValue( "p2k.MNEE_VIP" ), dirty_mode )
	end
	return main_check
end

function new_mnee_key( main_check, key_name, dirty_mode, is_vip )
	if( IS_MNEE and not( ModSettingGetNextValue( "p2k.MNEE_DISABLE" ))) then
		main_check = main_check or get_key_pressed( key_name, dirty_mode, is_vip or ModSettingGetNextValue( "p2k.MNEE_VIP" ))
	end
	return main_check
end

function new_mnee_keyboard( main_check, key_name, dirty_mode, is_vip )
	if( ModSettingGet( "p2k.MNEE_REBINDING" )) then
		if( type( key_name ) == "table" ) then
			key_name = key_name[1]
		end
		
		return new_mnee( main_check, "KEY_"..key_name, is_vip, dirty_mode, "p2k_kbd" )
	else
		if( type( key_name ) == "table" ) then
			key_name = key_name[2] or key_name[1]
		end
		return new_mnee_key( main_check, key_name, dirty_mode, is_vip )
	end
end

function new_mnee_down( key_name, dirty_mode, is_vip )
	if( IS_MNEE and not( ModSettingGetNextValue( "p2k.MNEE_DISABLE" ))) then
		return is_key_down( key_name, dirty_mode, false, is_vip or ModSettingGetNextValue( "p2k.MNEE_VIP" ))
	end
	return false
end

function new_mnee_down_binding( main_check, binding_name, is_vip, dirty_mode, loose_mode, mod_id )
	if( IS_MNEE and not( ModSettingGetNextValue( "p2k.MNEE_DISABLE" ))) then
		return main_check or is_binding_down( "p2k", binding_name, dirty_mode, false, is_vip or ModSettingGetNextValue( "p2k.MNEE_VIP" ), loose_mode or false )
	end
	return main_check
end

function new_mnee_advanced( main_check, core_check, binding_name, is_vip, dirty_mode, mod_id )
	if( core_check ) then
		main_check = new_mnee( main_check, binding_name, is_vip, dirty_mode, mod_id )
	end
	return main_check
end

function new_mnee_confirm( main_check, core_check )
	if( not( core_check )) then
		return false
	else
		return new_mnee_key( main_check, "return" )
	end
end

function new_toggler( gui, uid, pic_x, pic_y, pic_z, value, pics, values )
	if( type( pics ) ~= "table" ) then
		pics = { "mods/p2k/files/pics/button_"..pics.."_A.png", "mods/p2k/files/pics/button_"..pics.."_B.png", }
	end
	
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, ( type( values ) == "table" ) and values[b2n( value ) + 1] or values, value and 3 or 1 )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pics[b2n( value ) + 1] )
	
	return uid, clicked, r_clicked
end

function new_switcher( gui, uid, pic_x, pic_y, pic_z, pic, value, values )
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, values[value] )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	if( clicked ) then
		play_sound( "button_generic" )
		value = value + 1
		if( value > #values ) then
			value = 1
		end
	end
	if( r_clicked ) then
		play_sound( "button_generic" )
		value = value - 1
		if( value < 1 ) then
			value = #values
		end
	end
	
	return uid, clicked or r_clicked, value
end

function new_log( text, is_vip )
	is_vip = is_vip or false
	if( is_vip or ( not( ModSettingGetNextValue( "p2k.MUTE_LOGS" )) and workspace_sound )) then
		GamePrint( text )
		print( text )
	end
end

function new_tooltip( gui, uid, pic_z, text, tutorial_text, is_fancy )
	is_fancy = is_fancy or false
	if( is_fancy and ModSettingGetNextValue( "p2k.DONT_CARE" )) then
		return uid
	end
	
	if( not( tooltip_opened )) then
		local _, _, t_hov = GuiGetPreviousWidgetInfo( gui )
		if( t_hov ) then
			tooltip_opened = true
			local w, h = GuiGetScreenDimensions( gui )
			local pic_x, pic_y = get_mouse_pos( gui )
			pic_x = pic_x + 10
			
			text = (( ModSettingGetNextValue( "p2k.TUTORIAL_MODE" ) or new_mnee_down( "left_alt", true )) and tutorial_text ~= nil ) and text..( text ~= "" and " @ " or "" )..tutorial_text.." @" or text
			if( text == "" ) then
				return uid
			end
			
			text = liner( gui, text, w*0.9, h - 2, 5.8 )
			local length = 0
			for i,line in ipairs( text ) do
				local current_length = GuiGetTextDimensions( gui, line, 1, 2 )
				if( current_length > length ) then
					length = current_length
				end
			end
			local extra = #text > 1 and 3 or 0
			local x_offset = length + extra
			local y_offset = 9*#text + 1 + extra - ( #text > 1 and 3 or 0 )
			if( w < pic_x + x_offset ) then
				pic_x = w - x_offset
			end
			if( h < pic_y + y_offset ) then
				pic_y = h - y_offset
			end
			uid = new_image( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/dot_purple_dark.png", x_offset, y_offset )
			uid = new_image( gui, uid, pic_x + 1, pic_y + 1, pic_z - 0.01, "mods/p2k/files/pics/dot_white.png", x_offset - 2, y_offset - 2 )
			
			new_text( gui, pic_x + 2, pic_y, pic_z - 0.02, text, 2 )
		end
	end
	
	return uid
end

function new_pointer( gui, uid, w, h, pic_z, t_x, t_y )
	local pic_x, pic_y = world2gui( gui, t_x, t_y )
	
	local pic = "mods/p2k/files/pics/pointer"
	if( pic_x >= w and pic_y >= h ) then
		pic = pic.."_se"
		pic_x = w - 2.5
		pic_y = h - 2.5
	elseif( pic_x <= 0 and pic_y >= h ) then
		pic = pic.."_sw"
		pic_x = 1.5
		pic_y = h - 2.5
	elseif( pic_x <= 0 and pic_y <= 0 ) then
		pic = pic.."_nw"
		pic_x = 1.5
		pic_y = 1.5
	elseif( pic_x >= w and pic_y <= 0 ) then
		pic = pic.."_ne"
		pic_x = w - 2.5
		pic_y = 1.5
	elseif( pic_x < 0 and pic_y > 0 ) then
		pic = pic.."_w"
		pic_x = 1.5
	elseif( pic_x > 0 and pic_y < 0 ) then
		pic = pic.."_n"
		pic_y = 1.5
	elseif( pic_x > w and pic_y < h ) then
		pic = pic.."_e"
		pic_x = w - 1.5
	elseif( pic_x > 0 and pic_y > h ) then
		pic = pic.."_s"
		pic_y = h - 1.5
	end
	
	uid = new_image( gui, uid, pic_x - 1.5, pic_y - 1.5, pic_z, pic..".png" )
	
	return uid, pic_x, pic_y
end

function new_connector( s_x, s_y, pic_z, dist, e_x, e_y, pic )
	local gui = GuiCreate()
	GuiStartFrame( gui )
	
	local l_x = e_x - s_x
	local l_y = e_y - s_y
	local length = math.sqrt(( l_x )^2 + ( l_y )^2 )
	
	local amount = math.min( math.ceil( length/dist ), 1000 )
	local delta_x = l_x/amount
	local delta_y = l_y/amount
	
	local uid = 0
	for k = 0,amount do
		local part_x = s_x + delta_x*k
		local part_y = s_y + delta_y*k
		uid = new_image( gui, uid, part_x - 0.5, part_y - 0.5, pic_z, pic or "mods/p2k/files/pics/dot_red.png" )
	end
	
	GuiDestroy( gui )
end

function new_dragger( gui, uid, pic_x, pic_y, pic_z, pic )
	GuiOptionsAddForNextWidget( gui, 51 ) --IsExtraDraggable
	new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = uid - 1018
	local _, _, _, _, _, _, _, d_x, d_y = GuiGetPreviousWidgetInfo( gui )
	if( d_x ~= pic_x and d_y ~= pic_y and d_x ~= 0 and d_y ~= 0 ) then
		if( local_grab_x[uid] == nil ) then
			local_grab_x[uid] = d_x - pic_x
		end
		if( local_grab_y[uid] == nil ) then
			local_grab_y[uid] = d_y - pic_y
		end
		
		pic_x = d_x - local_grab_x[uid]
		pic_y = d_y - local_grab_y[uid]
	else
		local_grab_x[uid] = nil
		local_grab_y[uid] = nil
	end
	
	return pic_x, pic_y
end

function new_transformer( gui, uid, w, h, pic_z, captured_x, captured_y )
	if( captured_x > 10 and captured_x < w - 10 and captured_y > 10 and captured_y < h - 10 ) then
		local_grab_x = local_grab_x or {}
		local_grab_y = local_grab_y or {}
		local shit_from_ass = w/( MagicNumbersGetValue( "VIRTUAL_RESOLUTION_X" ) + MagicNumbersGetValue( "VIRTUAL_RESOLUTION_OFFSET_X" ))
		local t_x, t_y, t_r, t_s_x, t_s_y = EntityGetTransform( captured_entity )
		local pic_x, pic_y = captured_x, captured_y
		local pic = "mods/p2k/files/pics/button_drag_tiny.png"
		local is_updated = false
		
		captured_x, captured_y = new_dragger( gui, 1019, pic_x - 3.5, pic_y - 3.5, pic_z - 0.01, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "", "General transformer", true )
		if( math.abs(( pic_x - 3.5 ) - captured_x ) > 0.001 and math.abs(( pic_y - 3.5 ) - captured_y ) > 0.001 ) then
			t_x = t_x + ( captured_x - ( pic_x - 3.5 ))/shit_from_ass
			t_y = t_y + ( captured_y - ( pic_y - 3.5 ))/shit_from_ass
			is_updated = true
		end
		
		uid = new_image( gui, uid, pic_x - 11.5, pic_y - 11.5, pic_z, "mods/p2k/files/pics/transformer_mover_x.png" )
		captured_x, captured_y = new_dragger( gui, 1020, pic_x + 5.5, pic_y - 3.5, pic_z - 0.01, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "", "X axis transformer", true )
		if( math.abs(( pic_x + 5.5 ) - captured_x ) > 0.001 ) then
			t_x = t_x + ( captured_x - ( pic_x + 5.5 ))/shit_from_ass
			is_updated = true
		end
		
		uid = new_image( gui, uid, pic_x - 11.5, pic_y - 11.5, pic_z, "mods/p2k/files/pics/transformer_mover_y.png" )
		captured_x, captured_y = new_dragger( gui, 1021, pic_x - 3.5, pic_y - 12.5, pic_z - 0.01, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "", "Y axis transformer", true )
		if( math.abs(( pic_y - 12.5 ) - captured_y ) > 0.001 ) then
			t_y = t_y + ( captured_y - ( pic_y - 12.5 ))/shit_from_ass
			is_updated = true
		end
		
		uid = new_image( gui, uid, pic_x - 11.5, pic_y - 11.5, pic_z, "mods/p2k/files/pics/transformer_scaler_x.png" )
		captured_x, captured_y = new_dragger( gui, 1022, pic_x - 10.5, pic_y - 3.5, pic_z - 0.01, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "", "X axis scaler", true )
		if( math.abs(( pic_x - 10.5 ) - captured_x ) > 0.001 ) then
			t_s_x = t_s_x + ( captured_x - ( pic_x - 10.5 ))/( shit_from_ass*30 )
			is_updated = true
		end
		
		uid = new_image( gui, uid, pic_x - 11.5, pic_y - 11.5, pic_z, "mods/p2k/files/pics/transformer_scaler_y.png" )
		captured_x, captured_y = new_dragger( gui, 1023, pic_x - 3.5, pic_y + 3.5, pic_z - 0.01, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "", "Y axis scaler", true )
		if( math.abs(( pic_y + 3.5 ) - captured_y ) > 0.001 ) then
			t_s_y = t_s_y + ( captured_y - ( pic_y + 3.5 ))/( shit_from_ass*30 )
			is_updated = true
		end
		
		local offsetter = math.rad( -45 )
		local tilt_x = pic_x + math.cos( t_r + offsetter )*20 - 1.5
		local tilt_y = pic_y + math.sin( t_r + offsetter )*20 - 1.5
		uid = new_image( gui, uid, tilt_x, tilt_y, pic_z, "mods/p2k/files/pics/transformer_tilter.png" )
		new_connector( pic_x, pic_y, pic_z + 0.01, 1, tilt_x + 1.5, tilt_y + 1.5, "mods/p2k/files/pics/dot_purple_dark.png" )
		captured_x, captured_y = new_dragger( gui, 1024, tilt_x - 2, tilt_y - 2, pic_z - 0.01, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "", "General tilter.", true )
		if( math.abs(( tilt_x - 2 ) - captured_x ) > 0.001 and math.abs(( tilt_y - 2 ) - captured_y ) > 0.001 ) then
			t_r = math.atan2( pic_y - captured_y, pic_x - captured_x ) + math.rad( 180 ) - offsetter
			is_updated = true
		end
		
		if( is_updated ) then
			EntitySetTransform( captured_entity, t_x, t_y, t_r, t_s_x, t_s_y )
			EntityApplyTransform( captured_entity, t_x, t_y, t_r, t_s_x, t_s_y )
		end
	end
	
	return uid
end

function input_cleanser( mode )
	mode = mode or false
	if( mode ) then
		if( GameHasFlagRun( "P2K_INPUT_MOMENT" ) or not( IS_MNEE ) or not( ModSettingGetNextValue( "p2k.MNEE_CLEANSING" ))) then
			return
		end
		if( new_mnee_down( "left_ctrl", true )) then
			controls_lock = 1
			if( ModSettingGetNextValue( "p2k.MNEE_VIP" ) and not( GameHasFlagRun( "MNEE_DISABLED" ))) then
				GameAddFlagRun( "MNEE_DISABLED" )
			end
			GameAddFlagRun( "P2K_INPUT_MOMENT" )
		end
	elseif( GameHasFlagRun( "P2K_INPUT_MOMENT" )) then
		controls_lock = 2
		if( ModSettingGetNextValue( "p2k.MNEE_VIP" ) and GameHasFlagRun( "MNEE_DISABLED" )) then
			GameRemoveFlagRun( "MNEE_DISABLED" )
		end
		GameRemoveFlagRun( "P2K_INPUT_MOMENT" )
	end
end

function new_input( gui, uid, pic_x, pic_y, pic_z, pics, fid, value, is_passive, max_length, compact_nil )
	dofile_once( "mods/p2k/files/scripts/window_lib.lua" )
	value = tostring( value )
	if( type( pics ) ~= "table" ) then
		pics = { "mods/p2k/files/pics/button_"..pics.."_A.png", "mods/p2k/files/pics/button_"..pics.."_B.png", }
	end
	is_passive = is_passive or false
	max_length = max_length or ( 4 - GuiGetImageDimensions( gui, pics[1], 1 ))
	
	local this_one = keyboard_info[dimension][1] == fid
	
	local ender = ModSettingGetNextValue( "p2k.END_DISPLAY" )
	local keyboard_buffer = keyboard_info[dimension][2]..keyboard_info[dimension][3]
	local pic_type = 1
	local color = 1
	if( this_one ) then
		pic_type = 2
		if( keyboard_buffer == value ) then
			color = 2
		else
			color = 3
		end
		value = keyboard_buffer
	end
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pics[pic_type] )
	if( new_mnee_advanced( clicked, this_one, "zm_cancel_input" ) and not( is_passive )) then
		play_sound( "select" )
		if( this_one ) then
			input_cleanser( false )
			keyboard_info[dimension] = { "", "<>", "" }
		else
			input_cleanser( true )
			keyboard_info[dimension] = ender and { fid, value or "", "" } or { fid, "", value or "" }
			this_one = false
			if( keyboard_opened[dimension] == 0 ) then
				local w, h = GuiGetScreenDimensions( gui )
				create_keyboard({w - 352, h - 56}, ui_z )
			elseif( window_table[dimension][keyboard_opened[dimension]].minimized ) then
				window_table[dimension][keyboard_opened[dimension]].minimized = false
			end
		end
	end
	uid = new_tooltip( gui, uid, ui_z - 200, value, not( is_passive ) and ( this_one and "LMB to cancel the input. @ RMB to confirm." or "LMB to initiate the input." ) or nil )
	
	if( value == nil or value == "" ) then
		if( compact_nil ~= nil ) then
			value = "_"
		end
	elseif( this_one ) then
		local pointers = { "<", "[", "=", }
		local right_part, left_part = 0, 0
		local pointer = GameGetFrameNum()%60 < 30 and pointers[ModSettingGetNextValue( "p2k.TEXT_POINTER" )] or " "
		local pointer_length = GuiGetTextDimensions( gui, pointer, 1, 2 )
		local potential_length = math.floor( math.abs( max_length/2 )) - pointer_length
		if( ender ) then
			local actual_length = math.min( GuiGetTextDimensions( gui, keyboard_info[dimension][3], 1, 2 ), potential_length )
			local extra_length = potential_length - actual_length
			left_part = liner( gui, keyboard_info[dimension][2], math.abs( max_length/2 ) + extra_length, nil, nil, true, true ) or ""
			local stolen_length = GuiGetTextDimensions( gui, left_part, 1, 2 )
			right_part = liner( gui, keyboard_info[dimension][3], math.abs( max_length ) - ( stolen_length + pointer_length ), nil, nil, true ) or ""
		else
			local actual_length = math.min( GuiGetTextDimensions( gui, keyboard_info[dimension][2], 1, 2 ), potential_length )
			local extra_length = potential_length - actual_length
			right_part = liner( gui, keyboard_info[dimension][3], math.abs( max_length/2 ) + extra_length, nil, nil, true ) or ""
			local stolen_length = GuiGetTextDimensions( gui, right_part, 1, 2 )
			left_part = liner( gui, keyboard_info[dimension][2], math.abs( max_length ) - ( stolen_length + pointer_length ), nil, nil, true, true ) or ""
		end
		value = left_part..pointer..right_part
	end
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, liner( gui, value, max_length ), color )
	
	return uid, new_mnee_confirm( r_clicked, this_one )
end

function inputter( todo, is_mute )
	if( is_mute == nil ) then
		play_sound( "confirm" )
	end
	
	local k_buffer = keyboard_info[dimension][2]..keyboard_info[dimension][3]
	if( todo( k_buffer ) == nil ) then
		input_cleanser( false )
		keyboard_info[dimension] = { "", "<>", "" }
	end
end

function new_pager( gui, uid, pic_x, pic_y, pic_z, page, max_page, dimension_mode )
	dimension_mode = dimension_mode or false
	
	local pic, clicked, r_clicked = 0, 0, 0
	pic = "mods/p2k/files/pics/key_left.png"
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Previous", "RMB to switch 5 pages.", true )
	if( clicked and max_page > 1 ) then
		if( dimension_mode ) then
			play_sound( "switch_dimension" )
		else
			play_sound( "button_special" )
		end
		page = page - 1
		if( page < 1 ) then
			page = max_page
		end
	end
	if( r_clicked and max_page > 5 ) then
		if( dimension_mode ) then
			play_sound( "switch_dimension" )
		else
			play_sound( "switch_page" )
		end
		page = page - 5
		if( page < 1 ) then
			page = max_page + page
		end
	end
	
	if( not( dimension_mode )) then
		pic = "mods/p2k/files/pics/button_21_B.png"
		uid = new_image( gui, uid, pic_x, pic_y + 11, pic_z, pic )
		new_text( gui, pic_x + 2, pic_y + 11, pic_z - 0.01, tostring( page ), 2 )
	else
		pic_x = pic_x + 11
		pic = "mods/p2k/files/pics/button_10_A.png"
		uid = new_image( gui, uid, pic_x, pic_y, pic_z, pic )
		new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, tostring( string.char( page + 64 )))
	end
	
	pic_x = pic_x + 11
	pic = "mods/p2k/files/pics/key_right.png"
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Next", "RMB to switch 5 pages.", true )
	if( clicked and max_page > 1 ) then
		if( dimension_mode ) then
			play_sound( "switch_dimension" )
		else
			play_sound( "button_special" )
		end
		page = page + 1
		if( page > max_page ) then
			page = 1
		end
	end
	if( r_clicked and max_page > 5 ) then
		if( dimension_mode ) then
			play_sound( "switch_dimension" )
		else
			play_sound( "switch_page" )
		end
		page = page + 5
		if( page > max_page ) then
			page = page - max_page
		end
	end
	
	if( max_page > 0 and page > max_page ) then
		page = max_page
	end
	
	return uid, page
end

function new_window( gui, uid, pic_x, pic_y, pic_z, title, wid, style, extra )
	local z_adjuster = string.byte( wid ) - 64
	if( active_window[dimension] == wid ) then
		z_adjuster = z_adjuster + 50
	end
	pic_z = pic_z - z_adjuster
	
	local pic = extra.custom_pic or "mods/p2k/files/pics/window_"..style..".png"
	local pic_w, pic_h = GuiGetImageDimensions( gui, pic, 1 )
	if( active_window[dimension] == wid ) then
		uid = new_image( gui, uid, pic_x - 1, pic_y - 1, pic_z + 0.01, "mods/p2k/files/pics/dot_red.png", pic_w + 2, pic_h + 2 )
	end
	local old_x, old_y = pic_x, pic_y
	
	local dpic = extra.custom_dragger or ( extra.delete_action ~= nil and "mods/p2k/files/pics/button_drag_135.png" or "mods/p2k/files/pics/button_drag.png" )
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, liner( gui, title, extra.custom_title_length or ( GuiGetImageDimensions( gui, dpic, 1 ) - 3 )))
	
	local closed, minimized, deleted = false, false, false
	uid, closed = new_button( gui, uid, pic_x + pic_w - 8, pic_y + 2, pic_z - 0.01, "mods/p2k/files/pics/key_close.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Close", nil, true )
	uid, minimized = new_button( gui, uid, pic_x + pic_w - 15, pic_y + 2, pic_z - 0.01, "mods/p2k/files/pics/key_minimize.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Minimize", nil, true )
	if( minimized ) then
		play_sound( "unminimize" )
	end
	if( extra.delete_action ~= nil ) then
		uid, _, deleted = new_button( gui, uid, pic_x + pic_w - 22, pic_y + 2, pic_z - 0.01, "mods/p2k/files/pics/key_kill.png" )
		uid = new_tooltip( gui, uid, ui_z - 200, "Delete", "RMB to perform context sensitive delete action.", true )
	end
	
	uid = extra.contents( gui, uid, pic_x, pic_y, pic_z - 0.01, wid )
	
	GuiOptionsAddForNextWidget( gui, 51 ) --IsExtraDraggable
	new_button( gui, drag_uid + ( string.byte( wid ) - 64 ), pic_x, pic_y, pic_z - 0.02, dpic )
	local clicked, r_clicked, _, _, _, _, _, d_x, d_y = GuiGetPreviousWidgetInfo( gui )
	if( clicked ) then
		active_window[dimension] = wid
	end
	if( r_clicked and active_window[dimension] == wid ) then
		active_window[dimension] = 0
	end
	if( d_x ~= pic_x and d_y ~= pic_y and d_x ~= 0 and d_y ~= 0 ) then
		if( active_window[dimension] ~= wid ) then
			active_window[dimension] = wid
		end
		
		if( grab_x[wid] == nil ) then
			grab_x[wid] = d_x - pic_x
		end
		if( grab_y[wid] == nil ) then
			grab_y[wid] = d_y - pic_y
		end
		
		pic_x = d_x - grab_x[wid]
		pic_y = d_y - grab_y[wid]
	else
		grab_x[wid] = nil
		grab_y[wid] = nil
	end
	
	uid, clicked = new_button( gui, uid, old_x, old_y, pic_z, pic )
	if( clicked ) then
		if( active_window[dimension] ~= wid ) then
			active_window[dimension] = wid
		end
	end
	
	return uid, pic_x, pic_y, new_mnee_advanced( closed, active_window[dimension] == wid, "ce_close_window" ), minimized, deleted
end