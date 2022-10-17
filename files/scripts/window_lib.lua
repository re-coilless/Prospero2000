dofile_once( "mods/p2k/files/scripts/generic_lib.lua" )

--main
function create_main_window( loc, pic_z )
	local wnd = {
		title = "PROSPERO_"..( IS_1K_MODE and "1" or "2" ).."000",
		style = "main",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			custom_dragger = "mods/p2k/files/pics/button_drag_135.png",
			contents = main_window,
		},
	}
	
	local id = new_number()
	main_window_opened[dimension] = id
	add_window( wnd, id )
	
	return id
end

--engine manipulation
function create_camera_window( loc, pic_z )
	local wnd = {
		title = "CAMERA",
		style = "tiny",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = camera_window,
			is_hard = false,
			target_entity = nil,
			target_pos = nil,
			mouse_buffer = nil,
		},
	}
	
	local id = new_number()
	camera_window_opened[1] = dimension
	camera_window_opened[2] = id
	add_window( wnd, id )
	
	return id
end

function create_settings_window( loc, pic_z )
	local wnd = {
		title = "SETTINGS",
		style = "big_B",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = settings_window,
			values = {},
			page = 1,
			is_all = false,
		},
	}
	
	local id = new_number()
	add_window( wnd, id )
	
	return id
end

function create_flag_window( loc, pic_z )
	local wnd = {
		title = "FLAGS",
		style = "big_B",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = flag_window,
			page = 1,
		},
	}
	
	local id = new_number()
	flag_window_opened[dimension] = id
	add_window( wnd, id )
	
	return id
end

--utility
function create_manager_window( loc, pic_z )
	local wnd = {
		title = "TASK_MANAGER",
		style = "big_B",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			custom_dragger = "mods/p2k/files/pics/button_drag_109.png",
			contents = manager_window,
			page = 1,
			search = "",
		},
	}
	
	local id = new_number()
	manager_opened[dimension] = id
	add_window( wnd, id )
	
	return id
end

function create_keyboard( loc, pic_z )
	local wnd = {
		title = "KEYBOARD",
		style = "keyboard",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			custom_dragger = "mods/p2k/files/pics/button_drag_179.png",
			contents = keyboard_window,
			shift_down = false,
		},
	}
	
	local id = new_number()
	keyboard_opened[dimension] = id
	add_window( wnd, id, nil, true )
	
	return id
end

function create_keyboard_extra( loc, pic_z )
	local wnd = {
		title = "*",
		style = "keyboard_extra",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			custom_dragger = "mods/p2k/files/pics/button_drag_19.png",
			contents = keyboard_window_extra,
			layer = 1,
		},
	}
	
	local id = new_number()
	keyboard_extra_opened[dimension] = id
	add_window( wnd, id, nil, true )
	
	return id
end

function create_clipboard( loc, pic_z )
	local wnd = {
		title = "CLIPBOARD",
		style = "big_B",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = clipboard_window,
			page = 1,
		},
	}
	
	local id = new_number()
	clipboard_opened[dimension] = id
	add_window( wnd, id, nil, true )
	
	return id
end

function create_frame_window( loc, pic_z )
	local wnd = {
		title = "FRAMES",
		style = "frames",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			custom_dragger = "mods/p2k/files/pics/button_drag_53.png",
			contents = frame_window,
		},
	}
	
	local id = new_number()
	frame_window_opened[dimension] = id
	add_window( wnd, id )
	
	return id
end

function create_teleboard_window( loc, pic_z )
	local wnd = {
		title = "TELEBOARD",
		style = "big_B",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = teleboard_window,
			page = 1,
		},
	}
	
	local id = new_number()
	teleboard_window_opened[dimension] = id
	add_window( wnd, id )
	
	return id
end

function create_zoom_window( loc, pic_z )
	local wnd = {
		title = "ZOOM",
		style = "tiny",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = zoom_window,
			drift_action = function()
				GameSetPostFxParameter( "viewer_info", 0, 0, 0, 0 )
				GameSetPostFxParameter( "pointer_info", 0, 0, 0, 0 )
			end,
			minimize_action = function()
				GameSetPostFxParameter( "viewer_info", 0, 0, 0, 0 )
				GameSetPostFxParameter( "pointer_info", 0, 0, 0, 0 )
			end,
			close_action = function()
				GameSetPostFxParameter( "viewer_info", 0, 0, 0, 0 )
				GameSetPostFxParameter( "pointer_info", 0, 0, 0, 0 )
			end,
		},
	}
	
	local id = new_number()
	zoom_window_opened[dimension] = id
	add_window( wnd, id )
	
	return id
end

--API utility
function create_transform_window( loc, pic_z )
	local wnd = {
		title = "TRANSFORM",
		style = "trans",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			custom_dragger = "mods/p2k/files/pics/button_drag_66.png",
			custom_title_length = 64,
			contents = transform_window,
		},
	}
	
	local id = new_number()
	transform_window_opened[dimension] = id
	add_window( wnd, id )
	
	return id
end

function create_ecs_window( loc, pic_z )
	local wnd = {
		title = "ECS_PANEL",
		style = "ecs",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			custom_dragger = "mods/p2k/files/pics/button_drag_66.png",
			contents = ecs_window,
		},
	}
	
	local id = new_number()
	ecs_window_opened[dimension] = id
	add_window( wnd, id )
	
	return id
end

function create_animaler_window( loc, pic_z )
	local wnd = {
		title = "ANIMALER",
		style = "animaler",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			custom_dragger = "mods/p2k/files/pics/button_drag_109.png",
			contents = animaler_window,
			matter = "blood",
			damage = { 25, 1, 1 },
			anim = "walk",
			path = "",
			boxes = { true, { 0, 1, }, }
		},
	}
	
	local id = new_number()
	animaler_window_opened[dimension] = id
	add_window( wnd, id )
	
	return id
end

function create_scene_window( loc, pic_z )
	local wnd = {
		title = "PIXEL_SCENE",
		style = "medium",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = scene_window,
			info = { "", "", "", "", 0, true, true, },
		},
	}
	
	local id = new_number()
	add_window( wnd, id )
	
	return id
end

--esc manipulation
function create_entity_window( loc, pic_z, entity_id )
	if( entity_id == nil ) then
		play_sound( "error" )
		new_log( "[ERROR] Entity isn't real!", true )
		return
	end
	
	local wnd = {
		title = get_name( entity_id ),
		style = "big_A",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = entity_window,
			page = 1,
			entity = entity_id,
			comp_tag = "",
			delete_action = function( stuff )
				if( captured_entity == stuff.entity ) then
					captured_entity = 0
				end
				EntityKill( stuff.entity )
			end,
		},
	}
	
	local id = new_number()
	add_window( wnd, id )
	
	return id
end

function create_child_window( loc, pic_z, entity_id )
	local wnd = {
		title = "CHILDREN:"..entity_id,
		style = "big_B",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = child_window,
			page = 1,
			entity = entity_id,
		},
	}
	
	local id = new_number()
	add_window( wnd, id )
	
	return id
end

function create_tag_window( loc, pic_z, entity_id )
	local wnd = {
		title = "TAGS:"..entity_id,
		style = "big_B",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = tag_window,
			page = 1,
			entity = entity_id,
		},
	}
	
	local id = new_number()
	add_window( wnd, id )
	
	return id
end

function create_comp_window( loc, pic_z, entity_id, comp_id, object_name )
	local wnd = {
		title = object_name or ComponentGetTypeName( comp_id ),
		style = "big_A",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = comp_window,
			page = 1,
			entity = entity_id,
			comp = comp_id,
			object = object_name,
			delete_action = function( stuff )
				EntityRemoveComponent( stuff.entity, stuff.comp )
			end,
		},
	}
	
	local id = new_number()
	add_window( wnd, id )
	
	return id
end

function create_table_window( loc, pic_z, entity_id, comp_id, object_id, field_name )
	local wnd = {
		title = "TABLE:"..field_name,
		style = "big_B",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = table_window,
			page = 1,
			entity = entity_id,
			comp = comp_id,
			object = object_id,
			field = field_name,
		},
	}
	
	local id = new_number()
	add_window( wnd, id )
	
	return id
end

--other
function create_edit_window( loc, pic_z, ttl, stl, custom_contents, extra_stuff, dlt_action, cls_action, min_action, drft_action )
	local wnd = {
		title = ttl,
		style = stl or "tiny",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = custom_contents,
			value = extra_stuff,
			delete_action = dlt_action,
			close_action = cls_action,
			minimize_action = min_action,
			drift_action = drft_action,
		},
	}
	
	local id = new_number()
	add_window( wnd, id )
	
	return id
end

function create_misc_window( loc, pic_z )
	local wnd = {
		title = "MISC_STUFF",
		style = "medium",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = misc_window,
			uniform_info = { "uniform_editor", { 0, 0, 0, 0, }, false, },
			back_info = { "background_sprite", 0, },
			globals_info = "globals_editor",
			file_info = { "file_path", false, },
		},
	}
	
	local id = new_number()
	add_window( wnd, id )
	
	return id
end

function create_ext_window( loc, pic_z )
	local wnd = {
		title = "EXTENSIONS",
		style = "big_B",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			contents = ext_window,
			page = 1,
			ext_value = {},
		},
	}
	
	local id = new_number()
	ext_window_opened[dimension] = id
	add_window( wnd, id )
	
	return id
end

function create_help_window( loc, pic_z )
	local wnd = {
		title = "HELP",
		style = "trans",
		minimized = false,
		parent = 0,
		children = {},
		w_x = loc[1],
		w_y = loc[2],
		w_z = pic_z,
		extra = {
			custom_dragger = "mods/p2k/files/pics/button_drag_66.png",
			contents = help_window,
		},
	}
	
	local id = new_number()
	help_opened[dimension] = id
	add_window( wnd, id, nil, true )
	
	return id
end

--contents
function main_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked, value = 0, 0, 0, 0
	local w, h = GuiGetScreenDimensions( gui )
	
	pic_x = pic_x + 2
	for i = 1,3 do
		pic_y = pic_y + 11
		uid, clicked, r_clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, script_online[i], 10, tostring( i ))
		uid = new_tooltip( gui, uid, ui_z - 200, "Custom Script "..i, "LMB to execute once. @ RMB to toggle continuous mode.", true )
		if( clicked ) then
			play_sound( "button_generic" )
			dofile(( IS_1K_MODE and "mods/p2k/" or "" ).."data/p2k_custom/custom_script_"..tostring( i )..".lua" )
		end
		if( r_clicked ) then
			play_sound( "button_special" )
			script_online[i] = not( script_online[i])
		end
	end
	
	pic_x = pic_x + 13
	uid, clicked, r_clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, transform_editor, 21, "TSF" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Tranformer", "LMB to "..( transform_editor and "hide" or "show" ).." the gizmo. @ RMB to open Transform Window.", true )
	if( clicked ) then
		play_sound( "button_generic" )
		new_log( "Gizmo was ["..( transform_editor and "DIS" or "EN" ).."ABLED]" )
		ModSettingSetNextValue( "p2k.TRANSFORMER", not( transform_editor ), false )
	end
	if( r_clicked ) then
		if( transform_window_opened[dimension] ~= 0 ) then
			remove_window( transform_window_opened[dimension] )
		else
			if( captured_entity == 0 ) then
				new_log( "[WARNING] This window requires a captured target to work." )
			end
			create_transform_window({w - 84, h - 124}, ui_z )
		end
	end
	
	pic_y = pic_y - 11
	value = ( animaler_window_opened[dimension] ~= 0 )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "ANM" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Animaler", "LMB to open the captured animal control panel.", true )
	if( clicked ) then
		if( value ) then
			remove_window( animaler_window_opened[dimension] )
		else
			if( captured_entity == 0 ) then
				new_log( "[WARNING] This window requires a captured target to work." )
			end
			create_animaler_window({w - 479, h - 45}, ui_z )
		end
	end
	
	pic_y = pic_y - 11
	value = ( ecs_window_opened[dimension] ~= 0 )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "ECP" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Entity-Component System Panel", nil, true )
	if( clicked ) then
		if( value ) then
			remove_window( ecs_window_opened[dimension] )
		else
			create_ecs_window({w - 84, h - 181}, ui_z )
		end
	end
	
	pic_x = pic_x + 22
	value = ( camera_window_opened[2] ~= 0 )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "CMR" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Camera Controller", nil, true )
	if( new_mnee( clicked, "ec_camera" )) then
		if( value ) then
			if( camera_window_opened[1] == dimension ) then
				remove_window( camera_window_opened[2] )
			else
				play_sound( "error" )
				new_log( "[ERROR] This window is opened in another dimension!", true )
			end
		else
			create_camera_window({1, h - 34}, ui_z )
		end
	end
	
	pic_y = pic_y + 11
	if( IS_1K_MODE or ModSettingGetNextValue( "p2k.NO_SHADER_STUFF" )) then
		uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, false, 21, "ERR" )
		uid = new_tooltip( gui, uid, ui_z - 200, "Unsupported", nil, true )
	else
		value = ( zoom_window_opened[dimension] ~= 0 )
		uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "ZOM" )
		uid = new_tooltip( gui, uid, ui_z - 200, "Magnifier", nil, true )
		if( new_mnee( clicked, "eb_zoomer" )) then
			if( value ) then
				remove_window( zoom_window_opened[dimension] )
			else
				create_zoom_window({1, h - 159}, ui_z )
			end
		end
	end
	
	pic_y = pic_y + 11
	value = ( teleboard_window_opened[dimension] ~= 0 )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "TLP" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Teleporter", nil, true )
	if( new_mnee( clicked, "ea_teleporter" )) then
		if( value ) then
			remove_window( teleboard_window_opened[dimension] )
		else
			if( captured_entity == 0 ) then
				new_log( "[WARNING] This window requires a captured target to work." )
			end
			create_teleboard_window({new_spawn()}, ui_z )
		end
	end
	
	pic_x = pic_x + 24
	value = ModSettingGetNextValue( "p2k.SHOW_ENTITIES" )
	local val = ModSettingGetNextValue( "p2k.SHOW_NUMBERS" )
	uid, clicked, r_clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "EHL" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Entity Highlighter", "LMB to "..( value and "hide" or "show" ).." the entities. @ RMB to "..( val and "hide" or "show" ).." their IDs.", true )
	if( clicked ) then
		play_sound( "button_generic" )
		new_log( "Entity Radar: ["..( value and "DIS" or "EN" ).."ABLED]" )
		ModSettingSetNextValue( "p2k.SHOW_ENTITIES", not( value ), false )
	end
	if( r_clicked ) then
		play_sound( "button_special" )
		new_log( "Entity Radar Numbers: ["..( val and "DIS" or "EN" ).."ABLED]" )
		ModSettingSetNextValue( "p2k.SHOW_NUMBERS", not( val ), false )
	end
	
	pic_y = pic_y - 11
	value = ( frame_window_opened[dimension] ~= 0 )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "FRM" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Framer", nil, true )
	if( clicked ) then
		if( value ) then
			remove_window( frame_window_opened[dimension] )
		else
			create_frame_window({w - 155, h - 91}, ui_z )
		end
	end
	
	pic_y = pic_y - 11
	value = ModSettingGetNextValue( "p2k.END_DISPLAY" )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "TDM" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Text Display Mode", "LMB to display from the "..( value and "start" or "end" )..".", true )
	if( clicked ) then
		play_sound( "button_generic" )
		new_log( "Text is displayed from the "..( value and "[START]" or "[END]" ))
		ModSettingSetNextValue( "p2k.END_DISPLAY", not( value ), false )
	end
	
	pic_x = pic_x + 24
	value = ( flag_window_opened[dimension] ~= 0 )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "FLG" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Flags", nil, true )
	if( clicked ) then
		if( value ) then
			remove_window( flag_window_opened[dimension] )
		else
			create_flag_window({new_spawn()}, ui_z )
		end
	end
	
	pic_y = pic_y + 11
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, false, 21, "PXS" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Pixel Scene Spawner", nil, true )
	if( clicked ) then
		create_scene_window({new_spawn()}, ui_z )
	end
	
	pic_y = pic_y + 11
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, false, 21, "MSC" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Misc Utilities", nil, true )
	if( clicked ) then
		create_misc_window({new_spawn()}, ui_z )
	end
	
	pic_x = pic_x + 22
	value = ( ext_window_opened[dimension] ~= 0 )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "EXT" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Extensions", nil, true )
	if( clicked ) then
		if( value ) then
			remove_window( ext_window_opened[dimension] )
		else
			create_ext_window({new_spawn()}, ui_z )
		end
	end
	
	pic_y = pic_y - 11
	value = ( keyboard_opened[dimension] ~= 0 )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 21, "KBD" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Keyboard", nil, true )
	if( clicked ) then
		if( value ) then
			remove_window( keyboard_opened[dimension] )
		else
			create_keyboard({w - 352, h - 56}, ui_z )
		end
	end
	
	pic_y = pic_y - 11
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, false, 21, "STS" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Settings", nil, true )
	if( clicked ) then
		create_settings_window({new_spawn()}, ui_z )
	end
	
	pic_x = pic_x + 24
	local info = D_extractor( ModSettingGetNextValue( "p2k.EXTENSION_INFO" )) or {}
	for i = 1,3 do
		local text = "EX"..i
		local tooltip = { "[EXT SLOT "..i.."]", "RMB to select the extension for this slot.", }
		pic = "mods/p2k/files/pics/button_21_A.png"
		local style = 1
		local ext_data = {}
		if( info[i] ~= "_" ) then
			for e,ext in ipairs( extensions ) do
				if( ext.id == info[i] ) then
					ext_data = ext
				end
			end
			if( ext_data.quick_name ~= nil ) then
				text = ext_data.quick_name
				tooltip[1] = ext_data.tooltip
				tooltip[2] = ext_data.tooltip_tutorial
				style = 2
			else
				text = "_"
				tooltip[1] = "[ERROR]"
				tooltip[2] = "Selected extension is missing."
				style = 3
			end
			pic = "mods/p2k/files/pics/button_21_B.png"
		end
		new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, text, style )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, tooltip[1], tooltip[2] )
		if( clicked and ext_data.quick_script ~= nil ) then
			ext_data.quick_script()
		end
		if( r_clicked ) then
			local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
				local page = window_table[dimension][wid].extra.value.page
				
				local clicked = false
				local counter = 1
				local poses = {{ 2, 11 }, { 52, 11 }, { 2, 22 }, { 52, 22 },}
				if( #extensions > 0 ) then
					for e = ( 4*page - 3 ), 4*page do
						if( e > #extensions ) then
							break
						end
						
						local is_current = extensions[e].id == info[i]
						new_text( gui, pic_x + poses[counter][1] + 2, pic_y + poses[counter][2], pic_z - 0.01, liner( gui, extensions[e].id, 44 ), is_current and 3 or 1 )
						uid, clicked = new_button( gui, uid, pic_x + poses[counter][1], pic_y + poses[counter][2], pic_z, "mods/p2k/files/pics/button_48_"..( is_current and "B" or "A" )..".png" )
						uid = new_tooltip( gui, uid, ui_z - 200, extensions[e].id )
						if( clicked ) then
							play_sound( "confirm" )
							info[i] = is_current and "_" or extensions[e].id
							ModSettingSetNextValue( "p2k.EXTENSION_INFO", D_packer( info ), false )
							table.insert( to_delete, { wid, false, nil, false })
						end
						
						counter = counter + 1
					end
				end
				
				pic_x = pic_x + 101
				pic_y = pic_y + 11
				uid = new_image( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/dot_purple_dark.png", 1, 21 )
				
				pic_x = pic_x + 2
				uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #extensions/4 ))
				if( page ~= window_table[dimension][wid].extra.value.page ) then
					window_table[dimension][wid].extra.value.page = page
				end
				
				return uid
			end
			local cid = create_edit_window({new_spawn( wid )}, ui_z, "EXTENSION_LIST", "animaler_empty", custom_contents, { page = 1 } )
			born_child( wid, cid )
			window_table[dimension][cid].extra.custom_dragger = "mods/p2k/files/pics/button_drag_109.png"
		end
		pic_y = pic_y + 11
	end
	
	return uid
end

function camera_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked, value = 0, 0, 0, 0
	
	pic_x = pic_x + 2
	pic_y = pic_y + 11
	if( IS_1K_MODE ) then
		new_text( gui, pic_x, pic_y, pic_z, "UNSUPPORTED", 2 )
		pic_x = pic_x + 75
	else
		value = ModSettingGetNextValue( "p2k.USE_CUSTOM_RES" )
		uid, clicked, r_clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 10, {"F", "T"})
		uid = new_tooltip( gui, uid, ui_z - 200, "Resolution override: "..tostring( value ), "LMB to toggle. @ RMB to set to the currently applied. @ Completely fresh start is required (exit the game).", true )
		if( clicked ) then
			play_sound( "button_generic" )
			new_log( "Custom resolution ["..( value and "DIS" or "EN" ).."ABLED]" )
			ModSettingSetNextValue( "p2k.USE_CUSTOM_RES", not( value ), false )
		end
		if( r_clicked ) then
			play_sound( "confirm" )
			new_log( "[RESOLUTION RESET]", true )
			ModSettingSetNextValue( "p2k.CUSTOM_RES", D_packer({ MagicNumbersGetValue( "VIRTUAL_RESOLUTION_X" ), MagicNumbersGetValue( "VIRTUAL_RESOLUTION_Y" )}), false )
		end
		
		pic_x = pic_x + 11
		local custom_res = D_extractor( ModSettingGetNextValue( "p2k.CUSTOM_RES" ), true )
		local letters = { "W:", "H:", }
		for i = 1,2 do
			new_text( gui, pic_x, pic_y, pic_z, letters[i], 2 )
			uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 23, wid.."res_"..i, custom_res[i], false, -20, true )
			if( r_clicked ) then
				inputter( function( k_buffer )
					custom_res[i] = tonumber( k_buffer )
					ModSettingSetNextValue( "p2k.CUSTOM_RES", D_packer( custom_res ), false )
				end)
			end
			
			pic_x = pic_x + 32
		end
	end
	
	uid = new_image( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/dot_purple_dark.png", 1, 10 )
	
	pic_x = pic_x + 2
	local mode = ModSettingGetNextValue( "p2k.CAMERA_MODE" )
	local modes = {
		{ "Vanilla", nil, },
		{ "Follow Entity", "Set up the target from the captured one first with the button on the right.", },
		{ "Free", "Use WASD to move and SHIFT to accelerate. @ Hold RMB for faster movement.", },
		{ "Locked", "Set up the position with the button on the right. @ RMB to drag the screen. @ Directional buttons on the right can be used for precise positioning." },
	}
	uid, clicked, value = new_switcher( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/button_10_A.png", mode, { "V", "E", "F", "L" })
	uid = new_tooltip( gui, uid, ui_z - 200, modes[mode][1], modes[mode][2], true )
	if( clicked ) then
		free_cam( false )
		mode = value
		ModSettingSetNextValue( "p2k.CAMERA_MODE", value, false )
	end
	
	pic_x = pic_x + 11
	value = window_table[dimension][wid].extra.is_hard
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, value, 10, {"S", "H"})
	uid = new_tooltip( gui, uid, ui_z - 200, value and "Hard" or "Soft", "Works only on \"Vanilla mode\".", true )
	if( clicked ) then
		play_sound( "button_generic" )
		window_table[dimension][wid].extra.is_hard = not( value )
		if( mode ~= 1 ) then
			new_log( "[WARNING] Will take effect only in \"Vanilla\" mode." )
		end
	end
	
	pic_x = pic_x + 11
	uid, clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "", "LMB to set the "..( captured_entity == 0 and "position" or "target" )..".", true )
	if( clicked ) then
		play_sound( "button_generic" )
		if( captured_entity == 0 ) then
			window_table[dimension][wid].extra.target_pos = { cam_x, cam_y, }
		else
			window_table[dimension][wid].extra.target_entity = captured_entity
		end
		new_log( "["..( captured_entity == 0 and "POSITION" or "TARGET" ).." SET]", true )
	end
	
	pic_x = pic_x + 11
	uid = new_image( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/dot_purple_dark.png", 1, 10 )
	
	pic_x = pic_x + 2
	local target_pos = window_table[dimension][wid].extra.target_pos
	local target_entity = window_table[dimension][wid].extra.target_entity
	local movers = {{ "left", -1, 0, }, { "up", 0, -1, }, { "down", 0, 1, }, { "right", 1, 0, }}
	for i = 1,4 do
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_direction_"..movers[i][1]..".png" )
		uid = new_tooltip( gui, uid, ui_z - 200, string.upper( movers[i][1] ), "LMB to move one step. @ RMB to x5.", true )
		if( clicked ) then
			play_sound( "button_generic" )
			if( mode == 4 ) then
				window_table[dimension][wid].extra.target_pos[1] = target_pos[1] + movers[i][2]
				window_table[dimension][wid].extra.target_pos[2] = target_pos[2] + movers[i][3]
			else
				free_cam( false )
				ModSettingSetNextValue( "p2k.CAMERA_MODE", 4, false )
				mode = 4
				window_table[dimension][wid].extra.target_pos = { cam_x, cam_y, }
			end
		end
		if( r_clicked ) then
			if( mode == 4 ) then
				play_sound( "button_special" )
				window_table[dimension][wid].extra.target_pos[1] = target_pos[1] + movers[i][2]*5
				window_table[dimension][wid].extra.target_pos[2] = target_pos[2] + movers[i][3]*5
			else
				play_sound( "error" )
				new_log( "[ERROR] Will take effect only in \"Locked\" mode!", true )
			end
		end
		pic_x = pic_x + 11
	end
	
	local offsets = { 0, 0 }
	local rmb_down = false
	if( ctrl_body ~= nil ) then
		local ctrl_comp = EntityGetFirstComponentIncludingDisabled( ctrl_body, "ControlsComponent" )
		rmb_down = ComponentGetValue2( ctrl_comp, "mButtonDownRightClick" )
		
		-- local w_down = ComponentGetValue2( ctrl_comp, "mButtonDownUp" )
		-- local a_down = ComponentGetValue2( ctrl_comp, "mButtonDownLeft" )
		-- local s_down = ComponentGetValue2( ctrl_comp, "mButtonDownDown" )
		-- local d_down = ComponentGetValue2( ctrl_comp, "mButtonDownRight" )
		-- if(( w_down or s_down ) and ( w_down ~= s_down )) then
			-- offsets[2] = w_down and 2 or -2
		-- end
		-- if(( a_down or d_down ) and ( a_down ~= d_down )) then
			-- offsets[1] = a_down and 2 or -2
		-- end
	end
	
	if( mode == 1 ) then
		if( value ) then
			if( hooman ~= 0 ) then
				local shooter_comp = EntityGetFirstComponentIncludingDisabled( hooman, "PlatformShooterPlayerComponent" )
				local char_x, char_y = EntityGetTransform( hooman )
				ComponentSetValue2( shooter_comp, "mDesiredCameraPos", char_x, char_y )
			end
		end
	elseif( mode == 2 ) then
		if( target_entity ~= nil and EntityGetIsAlive( target_entity )) then
			local t_x, t_y = EntityGetTransform( target_entity )
			if( hooman ~= 0 ) then
				local shooter_comp = EntityGetFirstComponentIncludingDisabled( hooman, "PlatformShooterPlayerComponent" )
				if( shooter_comp ~= nil ) then
					ComponentSetValue2( shooter_comp, "mSmoothedCameraPosition", t_x, t_y )
					ComponentSetValue2( shooter_comp, "mDesiredCameraPos", t_x, t_y )
				end
			else
				free_cam( true )
				GameSetCameraPos( t_x + offsets[1], t_y + offsets[2] )
			end
		else
			free_cam( false )
		end
	elseif( mode == 3 ) then
		free_cam( true )
		
		if( rmb_down ) then
			local m_x, m_y = DEBUG_GetMouseWorld()
			GameSetCameraPos( m_x + offsets[1], m_y + offsets[2] )
		end
	elseif( mode == 4 ) then
		if( target_pos ~= nil ) then
			if( hooman ~= 0 ) then
				local shooter_comp = EntityGetFirstComponentIncludingDisabled( hooman, "PlatformShooterPlayerComponent" )
				if( shooter_comp ~= nil ) then
					ComponentSetValue2( shooter_comp, "mSmoothedCameraPosition", target_pos[1], target_pos[2] )
					ComponentSetValue2( shooter_comp, "mDesiredCameraPos", target_pos[1], target_pos[2] )
				end
			else
				free_cam( true )
				GameSetCameraPos( target_pos[1] + offsets[1], target_pos[2] + offsets[2] )
			end
			
			local m_x, m_y, shit_from_ass = get_mouse_pos( gui )
			local mouse_buffer = window_table[dimension][wid].extra.mouse_buffer
			if( rmb_down ) then
				local dm_x, dm_y = 0, 0
				if( mouse_buffer ~= nil ) then
					dm_x = m_x - mouse_buffer[1]
					dm_y = m_y - mouse_buffer[2]
				end
				target_pos[1] = target_pos[1] - dm_x/shit_from_ass
				target_pos[2] = target_pos[2] - dm_y/shit_from_ass
			end
			window_table[dimension][wid].extra.mouse_buffer = { m_x, m_y, }
		else
			window_table[dimension][wid].extra.target_pos = { cam_x, cam_y, }
		end
	end
	
	return uid
end

function settings_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	
	local page = window_table[dimension][wid].extra.page
	local is_all = window_table[dimension][wid].extra.is_all
	
	local values = {}
	local count = 0
	if( is_all ) then
		t_x = t_x + 2
		count = ModSettingGetCount()
		for i = ( 9*( page - 1 )), ( 9*page - 1 ) do
			if( i > ( count - 1 )) then
				break
			end
			
			t_y = t_y + 11
			local name, value = ModSettingGetAtIndex( i )
			new_text( gui, t_x, t_y, pic_z, liner( gui, name, 69 ), 2 )
			uid = new_tooltip( gui, uid, ui_z - 200, name )
			
			local mode = 1
			if( type( value ) == "boolean" ) then
				mode = 3
			elseif( type( value ) == "number" ) then
				mode = 2
			end
			if( mode == 3 ) then
				uid, clicked = new_toggler( gui, uid, t_x + 70, t_y, pic_z, value, 61, {"[FALSE]", "[TRUE]"})
				if( clicked ) then
					play_sound( "button_generic" )
					ModSettingSetNextValue( name, not( value ), false )
					ModSettingSet( name, not( value ))
				end
			else
				uid, r_clicked = new_input( gui, uid, t_x + 70, t_y, pic_z, 61, wid.."setting"..i, value )
				if( r_clicked ) then
					inputter( function( k_buffer )
						ModSettingSetNextValue( name, mode == 1 and k_buffer or tonumber( k_buffer ), false )
						ModSettingSet( name, mode == 1 and k_buffer or tonumber( k_buffer ))
					end)
				end
			end
		end
	else
		values = window_table[dimension][wid].extra.values
		if( #values > 0 ) then
			t_x = t_x + 2
			for i = ( 9*page - 8 ), 9*page do
				if( i > #values ) then
					break
				end
				
				t_y = t_y + 11
				local value = values[i][1]
				new_text( gui, t_x, t_y, pic_z, liner( gui, value, 69 ), 2 )
				uid = new_tooltip( gui, uid, ui_z - 200, value )
				
				local mode = values[i][2]
				local setting = ModSettingGetNextValue( value )
				if( mode == 3 ) then
					uid, clicked = new_toggler( gui, uid, t_x + 70, t_y, pic_z, setting, 61, {"[FALSE]", "[TRUE]"})
					if( clicked ) then
						play_sound( "button_generic" )
						ModSettingSetNextValue( value, not( setting ), false )
					end
				else
					uid, r_clicked = new_input( gui, uid, t_x + 70, t_y, pic_z, 61, wid.."setting"..i, setting )
					if( r_clicked ) then
						inputter( function( k_buffer )
							ModSettingSetNextValue( value, mode == 1 and k_buffer or tonumber( k_buffer ), false )
						end)
					end
				end
			end
		end
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 11
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, is_all, 21, "ALL" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Full List Mode", nil, true )
	if( clicked ) then
		play_sound( "button_generic" )
		window_table[dimension][wid].extra.is_all = not( is_all )
	end
	
	if( not( is_all )) then
		pic_y = pic_y + 11
		pic = "mods/p2k/files/pics/button_21_A.png"
		new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "ADD" )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
		-- uid = new_tooltip( gui, uid, ui_z - 200, "", nil, true )
		if( clicked ) then
			local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
				pic_y = pic_y + 11
				
				local values = window_table[dimension][wid].extra.value
				pic_x = pic_x + 2
				uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 48, wid.."mod_id", values[2] )
				if( r_clicked ) then
					inputter( function( k_buffer )
						window_table[dimension][wid].extra.value[2] = k_buffer
					end)
				end
				pic_x = pic_x + 49
				uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 84, wid.."stn_id", values[3] )
				if( r_clicked ) then
					inputter( function( k_buffer )
						window_table[dimension][wid].extra.value[3] = k_buffer
					end)
				end
				
				pic_x = pic_x + 85
				local value = 0
				local types = { "String", "Number", "Boolean", }
				uid, clicked, value = new_switcher( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/button_10_A.png", values[4], { "S", "N", "B" })
				uid = new_tooltip( gui, uid, ui_z - 200, types[values[4]], nil, true )
				if( clicked ) then
					window_table[dimension][wid].extra.value[4] = value
				end
				
				pic_x = pic_x + 11
				uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
				uid = new_tooltip( gui, uid, ui_z - 200, "MOD_ID | SETTING_ID | TYPE", "LMB to confirm. @ RMB to save to the memory list.", true )
				if( clicked ) then
					play_sound( "confirm" )
					table.insert( window_table[dimension][values[1]].extra.values, { values[2].."."..values[3], values[4] })
				end
				if( r_clicked ) then
					play_sound( "button_special" )
					ModSettingSetNextValue( "p2k.SETTINGS_INFO", ModSettingGetNextValue( "p2k.SETTINGS_INFO" )..values[2].."."..values[3]..":"..values[4].."|", false )
				end
				
				return uid
			end
			born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "ADD_SETTING", nil, custom_contents, { wid, "mod_id", "setting_id", 1 }))
		end
		
		pic_y = pic_y + 11
		new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "SCN" )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "Scan The File", nil, true )
		if( clicked ) then
			local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
				pic_x = pic_x + 2
				pic_y = pic_y + 11
				
				local values = window_table[dimension][wid].extra.value
				uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 34, wid.."mod_id", values[2] )
				if( r_clicked ) then
					inputter( function( k_buffer )
						window_table[dimension][wid].extra.value[2] = k_buffer
					end)
				end
				
				pic_x = pic_x + 35
				uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 109, wid.."path", values[3] )
				if( r_clicked ) then
					inputter( function( k_buffer )
						window_table[dimension][wid].extra.value[3] = k_buffer
					end)
				end
				
				pic_x = pic_x + 110
				uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
				uid = new_tooltip( gui, uid, ui_z - 200, "MOD_ID | PATH @ PATH will be autoassembled from MOD_ID if left empty. @", nil, true )
				if( clicked ) then
					play_sound( "confirm" )
					mod_settings = nil
					dofile( values[3] == "" and ( "mods/"..values[2].."/settings.lua" ) or values[3] )
					
					function appender( vls, sts )
						for i,setting in ipairs( sts ) do
							if( setting.category_id ~= nil ) then
								appender( vls, setting.settings )
							elseif( setting.id ~= nil ) then
								local full_id = vls[2].."."..setting.id
								local set_val = ModSettingGetNextValue( full_id ) or setting.value_default
								if( type( set_val ) == "boolean" ) then
									set_val = 3
								elseif( type( set_val ) == "number" ) then
									set_val = 2
								else
									set_val = 1
								end
								
								table.insert( window_table[dimension][vls[1]].extra.values, { full_id, set_val })
							end
						end
					end
					if( mod_settings ~= nil ) then
						appender( values, mod_settings )
					end
				end
				
				return uid
			end
			born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "FILE_SCAN", nil, custom_contents, { wid, "p2k", "" } ))
		end
		
		pic_y = pic_y + 11
		new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "MEM" )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "Memory List", nil, true )
		if( clicked ) then
			local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
				local pic, clicked, r_clicked = 0, 0, 0
				local t_x, t_y = pic_x, pic_y
				
				local page = window_table[dimension][wid].extra.value[1]
				local tbl = DD_extractor( ModSettingGetNextValue( "p2k.SETTINGS_INFO" )) or {}
				if( #tbl > 0 ) then
					t_x = t_x + 2
					for i = ( 9*page - 8 ), 9*page do
						if( i > #tbl ) then
							break
						end
						
						t_y = t_y + 11
						new_text( gui, t_x, t_y, pic_z, liner( gui, tbl[i][1], 109 ), 2 )
						uid = new_tooltip( gui, uid, ui_z - 200, tbl[i][1] )
						uid, clicked, r_clicked = new_button( gui, uid, t_x + 110, t_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
						uid = new_tooltip( gui, uid, ui_z - 200, "Load", nil, true )
						if( clicked ) then
							play_sound( "confirm" )
							table.insert( window_table[dimension][window_table[dimension][wid].extra.value[2]].extra.values, { tbl[i][1], tonumber( tbl[i][2] )})
						end
						uid, clicked, r_clicked = new_button( gui, uid, t_x + 121, t_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
						uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to delete.", true )
						if( r_clicked ) then
							play_sound( "delete" )
							table.remove( tbl, i )
							ModSettingSetNextValue( "p2k.SETTINGS_INFO", DD_packer( tbl ), false )
						end
					end
				end
				
				pic_x = pic_x + 136
				pic_y = pic_y + 11
				new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "CLR" )
				uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/button_21_A.png" )
				uid = new_tooltip( gui, uid, ui_z - 200, "Clear", "RMB to clear everything.", true )
				if( r_clicked ) then
					play_sound( "delete" )
					ModSettingSetNextValue( "p2k.SETTINGS_INFO", "|", false )
				end
				
				pic_y = pic_y + 77
				uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #tbl/9 ))
				if( page ~= window_table[dimension][wid].extra.value[1] ) then
					window_table[dimension][wid].extra.value[1] = page
				end
				
				return uid
			end
			create_edit_window({new_spawn()}, ui_z, "SAVED_SETTINGS", "big_B", custom_contents, { 1, wid })
		end
		
		pic_y = pic_y + 11
		new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "CLR" )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "Clear", "RMB to clear everything.", true )
		if( r_clicked ) then
			play_sound( "delete" )
			window_table[dimension][wid].extra.values = {}
		end
	end
	
	pic_y = pic_y + ( is_all and 77 or 33 )
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil(( is_all and count or #values )/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end

	return uid
end

function flag_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	local page = window_table[dimension][wid].extra.page
	
	local wse_id = GameGetWorldStateEntity()
	local ws_comp = EntityGetFirstComponentIncludingDisabled( wse_id, "WorldStateComponent" )
	if( ws_comp == nil ) then
		pic_x = pic_x + 2
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
		
		return uid
	end
	
	local run_flags = ComponentGetValue2( ws_comp, "flags" ) or {}
	if( #run_flags > 0 ) then
		t_x = t_x + 2
		for i = ( 9*page - 8 ), 9*page do
			if( i > #run_flags ) then
				break
			end
			
			t_y = t_y + 11
			new_text( gui, t_x, t_y, pic_z, liner( gui, run_flags[i], 120 ), 2 )
			uid = new_tooltip( gui, uid, ui_z - 200, run_flags[i] )
			uid, clicked, r_clicked = new_button( gui, uid, t_x + 121, t_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to delete.", true )
			if( r_clicked ) then
				play_sound( "delete" )
				GameRemoveFlagRun( run_flags[i] )
			end
		end
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 11
	pic = "mods/p2k/files/pics/button_21_A.png"
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "PRS" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Persistent Flag Editor", nil, true )
	if( clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			pic_x = pic_x + 2
			pic_y = pic_y + 11
			uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 133, wid.."flag_pers", "" )
			if( r_clicked ) then
				inputter( function( k_buffer )
					AddFlagPersistent( k_buffer )
					new_log( "[FLAG ADDED]", true )
				end)
			end
			
			pic_x = pic_x + 134
			uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_check.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "State Check", nil, true )
			if( clicked ) then
				play_sound( "button_generic" )
				local flag_name = keyboard_info[dimension][2]..keyboard_info[dimension][3]
				new_log( flag_name..": ["..string.upper( tostring( HasFlagPersistent( flag_name ))).."]", true )
			end
			
			pic_x = pic_x + 11
			uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to delete.", true )
			if( r_clicked ) then
				if( HasFlagPersistent( keyboard_info[dimension][2]..keyboard_info[dimension][3] )) then
					play_sound( "delete" )
					RemoveFlagPersistent( keyboard_info[dimension][2]..keyboard_info[dimension][3] )
					new_log( "[FLAG REMOVED]", true )
					keyboard_info[dimension] = { "", "<>", "" }
				else
					play_sound( "error" )
					new_log( "[ERROR] Fag isn't real!", true )
				end
			end
			
			return uid
		end
		born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "ADD_FLAG_PERSISTENT", nil, custom_contents ))
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "ADD" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	-- uid = new_tooltip( gui, uid, ui_z - 200, "New Run Flag", nil, true )
	if( clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			pic_x = pic_x + 2
			pic_y = pic_y + 11
			uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 155, wid.."flag_run", "" )
			if( r_clicked ) then
				inputter( function( k_buffer )
					GameAddFlagRun( k_buffer )
				end)
			end
			
			return uid
		end
		born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "ADD_FLAG_RUN", nil, custom_contents ))
	end
	
	pic_y = pic_y + 66
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #run_flags/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end
	
	return uid
end

function manager_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	
	local page = window_table[dimension][wid].extra.page
	local searcher = string.lower( window_table[dimension][wid].extra.search )
	
	uid = new_image( gui, uid, pic_x + 109, pic_y, pic_z, "mods/p2k/files/pics/dot_purple_dark.png", 1, 10 )
	new_text( gui, pic_x + 111, pic_y, pic_z, liner( gui, math.floor( performance_info + 0.5 ), 30 ), 1 )
	
	local windows = {}
	for i = 1,26 do
		if( window_count[i] > 0 ) then
			for e,wnd in magic_sorter( window_table[i] ) do
				if( wnd ~= nil ) then
					if( searcher == "" or string.find( string.lower( wnd.title ), searcher ) ~= nil ) then
						table.insert( windows, { i, e, wnd.title })
					end
				end
			end
		end
	end
	
	if( #windows > 0 ) then
		t_x = t_x + 2
		for i = ( 9*page - 8 ), 9*page do
			if( i > #windows ) then
				break
			end
			
			t_y = t_y + 11
			local is_minimized = window_table[windows[i][1]][windows[i][2]].minimized
			local is_processed = ( dimension == windows[i][1] ) and not( is_minimized )
			local is_active = ( active_window[dimension] == windows[i][2] ) and ( dimension == windows[i][1] )
			local style = is_processed and ( is_active and 3 or 2 ) or 1
			pic = is_processed and "mods/p2k/files/pics/button_19_B.png" or "mods/p2k/files/pics/button_19_A.png"
			new_text( gui, t_x + 2, t_y, pic_z - 0.01, string.char( windows[i][1] + 64 ).."::"..windows[i][2], style )
			uid = new_image( gui, uid, t_x, t_y, pic_z, pic, nil, nil, nil, true ) --open window and move to current dimension + make it active
			uid = new_tooltip( gui, uid, ui_z - 200, "DIMENSION | ID", nil, true )
			
			uid, r_clicked = new_input( gui, uid, t_x + 20, t_y, pic_z, 70, wid.."title"..i, windows[i][3] )
			if( r_clicked ) then
				inputter( function( k_buffer )
					window_table[windows[i][1]][windows[i][2]].title = k_buffer
				end)
			end
			
			local perf_text = "_"
			if( is_processed and performance_table_last[windows[i][1]][windows[i][2]] ~= nil ) then
				perf_text = math.floor( performance_table_last[windows[i][1]][windows[i][2]]*100 + 0.5 )/100
			end
			uid = new_input( gui, uid, t_x + 91, t_y, pic_z, 29, wid.."ms"..i, perf_text, true )
			
			uid, clicked, r_clicked = new_button( gui, uid, t_x + 121, t_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to delete.", true )
			if( r_clicked ) then
				table.insert( to_delete, { windows[i][2], false, windows[i][1] })
			end
		end
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 11
	pic = "mods/p2k/files/pics/button_21_A.png"
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "CLR" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Clear", "RMB to clear everything.", true )
	if( r_clicked ) then
		play_sound( "delete" )
		local dim = dimension
		for i = 1,26 do
			if( window_count[i] > 0 ) then
				for e,wnd in magic_sorter( window_table[i] ) do
					if( wnd ~= nil and ( i ~= dim or e ~= wid )) then
						dimension = i
						remove_window( e, false )
					end
				end
			end
		end
		dimension = dim
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "SCH" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Searcher", nil, true )
	if( clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			pic_x = pic_x + 2
			pic_y = pic_y + 11
			
			local parent_wid = window_table[dimension][wid].extra.value
			local searcher = window_table[dimension][parent_wid].extra.search
			
			uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 155, wid.."search", searcher )
			if( r_clicked ) then
				inputter( function( k_buffer )
					window_table[dimension][parent_wid].extra.search = k_buffer
				end)
			end
			
			return uid
		end
		born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "SEARCH_BY_TITLE", nil, custom_contents, wid ))
	end
	
	pic_y = pic_y + 66
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #windows/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end
	
	return uid
end

function keyboard_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local layout = {{2,11,"q"}, {13,11,"w"}, {24,11,"e"}, {35,11,"r"}, {46,11,"t"}, {57,11,"y"}, {68,11,"u"}, {79,11,"i"}, {90,11,"o"}, {101,11,"p"}, {127,11,"0","keypad_0"}, {138,11,"1","keypad_1"}, {149,11,"2","keypad_2"}, {160,11,"3","keypad_3"},
					{2,22,"a"}, {13,22,"s"}, {24,22,"d"}, {35,22,"f"}, {46,22,"g"}, {57,22,"h"}, {68,22,"j"}, {79,22,"k"}, {90,22,"l"},				  {127,22,"-","keypad_-"}, {138,22,"4","keypad_4"}, {149,22,"5","keypad_5"}, {160,22,"6","keypad_6"},
								{13,33,"z"}, {24,33,"x"}, {35,33,"c"}, {46,33,"v"}, {57,33,"b"}, {68,33,"n"}, {79,33,"m"},							  {127,33,".","keypad_."}, {138,33,"7","keypad_7"}, {149,33,"8","keypad_8"}, {160,33,"9","keypad_9"},
	}
	local target_acquired = keyboard_info[dimension][2] ~= "<>"
	for i,key in ipairs( layout ) do
		if( window_table[dimension][wid].extra.shift_down ) then
			if( key[3] == "." ) then
				key[3] = "/"
				key[4] = "keypad_/"
			elseif( key[3] == "-" ) then
				key[3] = "_"
				key[4] = "-"
			else
				key[3] = string.upper( key[3] )
			end
		end
		new_text( gui, pic_x + key[1] + 2, pic_y + key[2], pic_z - 0.01, key[3] )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x + key[1], pic_y + key[2], pic_z, "mods/p2k/files/pics/button_10_A.png" )
		if( new_mnee_keyboard( clicked, { string.lower( key[3] ), key[4] }) and target_acquired ) then
			play_key_sound()
			keyboard_info[dimension][2] = keyboard_info[dimension][2]..key[3]
		end
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 2, pic_y + 33, pic_z, "mods/p2k/files/pics/key_shift"..( window_table[dimension][wid].extra.shift_down and "_active" or "" )..".png" )
	if( new_mnee_keyboard( clicked, "left_shift" )) then
		play_key_sound( true )
		window_table[dimension][wid].extra.shift_down = not( window_table[dimension][wid].extra.shift_down )
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 90, pic_y + 33, pic_z, "mods/p2k/files/pics/key_space.png" )
	if( new_mnee_keyboard( clicked, "space" ) and target_acquired ) then
		play_key_sound( true )
		keyboard_info[dimension][2] = keyboard_info[dimension][2].." "
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 101, pic_y + 22, pic_z, "mods/p2k/files/pics/key_backspace.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "", "LMB to delete a symbol on the left. @ RMB to clear the input field.", true )
	if( target_acquired ) then
		if( new_mnee_keyboard( clicked, "backspace" ) and keyboard_info[dimension][2] ~= "" ) then
			play_key_sound()
			keyboard_info[dimension][2] = string.sub( keyboard_info[dimension][2], 1, string.len( keyboard_info[dimension][2] ) - 1 )
		end
		if( new_mnee( r_clicked, "za_nullspace" )) then
			play_key_sound( true )
			keyboard_info[dimension][2] = ""
			keyboard_info[dimension][3] = ""
		end
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 114, pic_y + 11, pic_z, "mods/p2k/files/pics/key_right.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "", "LMB to move to the right. @ RMB to jump to the end.", true )
	if( target_acquired and keyboard_info[dimension][3] ~= "" ) then
		if( new_mnee_keyboard( clicked, "right" )) then
			play_key_sound()
			keyboard_info[dimension][2] = keyboard_info[dimension][2]..string.sub( keyboard_info[dimension][3], 1, 1 )
			keyboard_info[dimension][3] = string.sub( keyboard_info[dimension][3], 2, string.len( keyboard_info[dimension][3] ))
		end
		if( new_mnee( r_clicked, "zd_full_right" )) then
			play_key_sound( true )
			keyboard_info[dimension][2] = keyboard_info[dimension][2]..keyboard_info[dimension][3]
			keyboard_info[dimension][3] = ""
		end
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 114, pic_y + 22, pic_z, "mods/p2k/files/pics/key_dlt.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "", "LMB to delete a symbol on the right. @ RMB to delete everything on the right.", true )
	if( target_acquired and keyboard_info[dimension][3] ~= "" ) then
		if( new_mnee_keyboard( clicked, "delete" )) then
			play_key_sound()
			keyboard_info[dimension][3] = string.sub( keyboard_info[dimension][3], 2, string.len( keyboard_info[dimension][3] ))
		end
		if( new_mnee( r_clicked, "zb_right_null" )) then
			play_key_sound( true )
			keyboard_info[dimension][3] = ""
		end
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 114, pic_y + 33, pic_z, "mods/p2k/files/pics/key_left.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "", "LMB to move to the left. @ RMB to jump to the start.", true )
	if( target_acquired and keyboard_info[dimension][2] ~= "" ) then
		if( new_mnee_keyboard( clicked, "left" )) then
			play_key_sound()
			keyboard_info[dimension][3] = string.sub( keyboard_info[dimension][2], string.len( keyboard_info[dimension][2] ), string.len( keyboard_info[dimension][2] ))..keyboard_info[dimension][3]
			keyboard_info[dimension][2] = string.sub( keyboard_info[dimension][2], 1, string.len( keyboard_info[dimension][2] ) - 1 )
		end
		if( new_mnee( r_clicked, "ze_full_left" )) then
			play_key_sound( true )
			keyboard_info[dimension][3] = keyboard_info[dimension][2]..keyboard_info[dimension][3]
			keyboard_info[dimension][2] = ""
		end
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 173, pic_y + 11, pic_z, "mods/p2k/files/pics/key_upload.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Copy", "LMB to copy. @ RMB to copy and save.", true )
	if( target_acquired ) then
		if( new_mnee( clicked, "zf_copy" )) then
			local keyboard_buffer = keyboard_info[dimension][2]..keyboard_info[dimension][3]
			if( keyboard_buffer ~= "" ) then
				play_sound( "button_generic" )
				buffered_value = keyboard_buffer
				new_log( "[BUFFERED]" )
			else
				play_sound( "error" )
				new_log( "[ERROR] Field is empty!", true )
			end
		end
		if( new_mnee( r_clicked, "zg_save" )) then
			local keyboard_buffer = keyboard_info[dimension][2]..keyboard_info[dimension][3]
			if( keyboard_buffer ~= "" ) then
				play_sound( "button_special" )
				ModSettingSetNextValue( "p2k.CLIPBOARD_INFO", ModSettingGetNextValue( "p2k.CLIPBOARD_INFO" )..keyboard_buffer.."|", false )
				buffered_value = keyboard_buffer
				new_log( "[SAVED AND BUFFERED]" )
			else
				play_sound( "error" )
				new_log( "[ERROR] Field is empty!", true )
			end
		end
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 173, pic_y + 22, pic_z, "mods/p2k/files/pics/key_clipboard.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Clipboard", nil, true )
	if( new_mnee( clicked, "zl_open_clipboard" )) then
		if( clipboard_opened[dimension] ~= 0 ) then
			remove_window( clipboard_opened[dimension] )
		else
			born_child( wid, create_clipboard({ window_table[dimension][wid].w_x, window_table[dimension][wid].w_y - 112 }, ui_z ))
		end
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 173, pic_y + 33, pic_z, "mods/p2k/files/pics/key_download.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Paste", "LMB to paste. @ RMB to clear and paste.", true )
	if( target_acquired ) then
		if( new_mnee( clicked, "zh_paste" )) then
			if( buffered_value ~= "" ) then
				play_sound( "button_generic" )
				keyboard_info[dimension][2] = keyboard_info[dimension][2]..buffered_value
			else
				play_sound( "error" )
				new_log( "[ERROR] Buffer is empty!", true )
			end
		end
		if( new_mnee( r_clicked, "zi_replace" )) then
			if( buffered_value ~= "" ) then
				play_sound( "button_special" )
				keyboard_info[dimension][2] = buffered_value
				keyboard_info[dimension][3] = ""
			else
				play_sound( "error" )
				new_log( "[ERROR] Buffer is empty!", true )
			end
		end
	end
	
	local value = controls_lock ~= 0
	uid, clicked = new_button( gui, uid, pic_x + 184, pic_y + 11, pic_z, "mods/p2k/files/pics/key_lock_"..( value and "B" or "A" )..".png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Controls Lock", "LMB to "..( value and "en" or "dis" ).."able vanilla inputs.", true )
	if( new_mnee( clicked, "zj_ctrl_lock" )) then
		play_sound( "button_special" )
		if( value ) then
			controls_lock = 2
		else
			controls_lock = 1
		end
		new_log( "Character controls are ["..( value and "EN" or "DIS" ).."ABLED]" )
	end
	
	value = ModSettingGetNextValue( "p2k.MNEE_VIP" )
	uid, clicked = new_button( gui, uid, pic_x + 184, pic_y + 22, pic_z, "mods/p2k/files/pics/key_vip_"..( value and "B" or "A" )..".png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "VIP Access", "LMB to "..( value and "dis" or "en" ).."able VIP mode for all p2k bindings @ (they will remain active even if all mnee custom inputs were disabled).", true )
	if( new_mnee( clicked, "zk_vip_switch" )) then
		play_sound( "button_special" )
		ModSettingSetNextValue( "p2k.MNEE_VIP", not( value ), false )
		new_log( "VIP mode is ["..( value and "DIS" or "EN" ).."ABLED]" )
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 184, pic_y + 33, pic_z, "mods/p2k/files/pics/key_extra.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Extra Keys", nil, true )
	if( new_mnee( clicked, "zc_more_keys" )) then
		if( keyboard_extra_opened[dimension] ~= 0 ) then
			remove_window( keyboard_extra_opened[dimension] )
		else
			born_child( wid, create_keyboard_extra({ window_table[dimension][wid].w_x + 160, window_table[dimension][wid].w_y - 46 }, ui_z ))
		end
	end
	if( target_acquired and r_clicked ) then
		play_sound( "s4s" )
		keyboard_info[dimension][2] = keyboard_info[dimension][2].."ඞ" --what are you looking for
	end
	
	return uid
end

function keyboard_window_extra( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	
	local custom_font = not( ModSettingGetNextValue( "p2k.NO_FONT" ) or IS_1K_MODE )
	local magical_warning = "[WARNING] This symbol is magical within p2k."
	local grid = {
		pos = {{ 2, 11, }, { 13, 11, }, { 24, 11, }, { 2, 22, }, { 13, 22, }, { 24, 22, }, { 13, 33, }, { 24, 33, }, },
		A = {
			{ ",", "Comma", },
			{ "!", "Exclamation Mark", },
			{ "?", "Question Mark", },
			{ ":", "Colon", magical_warning, },
			{ ";", "Semicolon", },
			{ "\\", "Backslash", },
			{ "|", "Vertical Bar", magical_warning, },
			{ "#", "Hash", },
		},
		B = {
			{ "*", "Asterisk", },
			{ "+", "Plus Sign", },
			{ "=", "Equals Sign", },
			{ "~", "Tilde", ( custom_font and "[NOTE] For some reason Noita displays this one as [\"]." or nil ), },
			{ "%", "Percent Sign", },
			{ "^", "Caret", },
			{ "\"", "Double Quote", },
			{ "\'", "Single Quote", },
		},
		C = {
			{ "(", "Left Parenthesis", },
			{ ")", "Right Parenthesis", },
			{ "{", "Left Brace", ( custom_font and "[NOTE] This symbol is not supported by the default font and will look like [?]." or nil ), },
			{ "[", "Left Bracket", },
			{ "]", "Right Bracket", },
			{ "}", "Right Brace", ( custom_font and "[NOTE] This symbol is not supported by the default font and will look like [?]." or nil ), },
			{ "<", "Left Angle", magical_warning, },
			{ ">", "Right Angle", magical_warning, },
		},
		D = {
			{ "&", "Ampersand", },
			{ "@", "At", magical_warning, },
			{ "$", "Dollar Sign", },
			{ "`", "Grave Accent", },
			{ function()
				play_sound( "s4s" )
			end, "Popular Meme Sound Effects (For Video Editing)", "do it", },
		},
	}
	
	local page = window_table[dimension][wid].extra.layer
	local layer = string.char( page + 64 )
	local current = grid[layer]
	for i,symbol in ipairs( current ) do
		uid, clicked = new_button( gui, uid, pic_x + grid.pos[i][1], pic_y + grid.pos[i][2], pic_z, "mods/p2k/files/pics/extra_keys/"..( layer.."_"..i )..".png" )
		uid = new_tooltip( gui, uid, ui_z - 200, symbol[2], symbol[3], true )
		if( new_mnee( clicked, "zp_extra_key_"..i )) then
			if( type( symbol[1] ) == "string" ) then
				if( keyboard_info[dimension][2] ~= "<>" ) then
					play_key_sound()
					keyboard_info[dimension][2] = keyboard_info[dimension][2]..symbol[1]
				end
			else
				symbol[1]()
			end
		end
	end
	
	new_text( gui, pic_x + 4, pic_y + 33, pic_z - 0.01, layer, 3 )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 2, pic_y + 33, pic_z, "mods/p2k/files/pics/button_10_special.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Layer", "LMB to cycle forwards. @ RMB to cycle backwards.", true )
	if( new_mnee( clicked, "zn_next_layer" )) then
		play_sound( "button_special" )
		page = page + 1
		window_table[dimension][wid].extra.layer = page > 4 and 1 or page
	elseif( new_mnee( r_clicked, "zo_previous_layer" )) then
		play_sound( "button_special" )
		page = page - 1
		window_table[dimension][wid].extra.layer = page < 1 and 4 or page
	end
	
	return uid
end

function clipboard_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	
	local page = window_table[dimension][wid].extra.page
	
	local clips = D_extractor( ModSettingGetNextValue( "p2k.CLIPBOARD_INFO" )) or {}
	if( #clips > 0 ) then
		t_x = t_x + 2
		for i = ( 9*page - 8 ), 9*page do
			if( i > #clips ) then
				break
			end
			
			t_y = t_y + 11
			local clip = clips[i]
			uid, r_clicked = new_input( gui, uid, t_x, t_y, pic_z, 109, wid.."clip"..i, clip )
			if( r_clicked ) then
				inputter( function( k_buffer )
					clips[i] = k_buffer
					ModSettingSetNextValue( "p2k.CLIPBOARD_INFO", D_packer( clips ), false )
				end)
			end
			
			uid, clicked, r_clicked = new_button( gui, uid, t_x + 110, t_y, pic_z, "mods/p2k/files/pics/key_get.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Load", nil, true )
			if( clicked ) then
				play_sound( "button_generic" )
				buffered_value = clip
				new_log( "[BUFFERED]" )
			end
			
			uid, clicked, r_clicked = new_button( gui, uid, t_x + 121, t_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to delete.", true )
			if( r_clicked ) then
				play_sound( "delete" )
				table.remove( clips, i )
				ModSettingSetNextValue( "p2k.CLIPBOARD_INFO", D_packer( clips ), false )
			end
		end
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 11
	pic = "mods/p2k/files/pics/button_21_A.png"
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "CLR" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Clear", "RMB to clear everything.", true )
	if( r_clicked ) then
		play_sound( "delete" )
		ModSettingSetNextValue( "p2k.CLIPBOARD_INFO", "|", false )
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "ADD" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	-- uid = new_tooltip( gui, uid, ui_z - 200, "Add New", nil, true )
	if( clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			pic_x = pic_x + 2
			pic_y = pic_y + 11
			uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 155, wid.."new_clip", "" )
			if( r_clicked ) then
				inputter( function( k_buffer )
					ModSettingSetNextValue( "p2k.CLIPBOARD_INFO", ModSettingGetNextValue( "p2k.CLIPBOARD_INFO" )..k_buffer.."|", false )
				end)
			end
			
			return uid
		end
		born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "ADD_CLIP", nil, custom_contents ))
	end
	
	pic_y = pic_y + 66
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #clips/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end
	
	return uid
end

function frame_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	
	pic_x = pic_x + 2
	pic_y = pic_y + 11
	new_text( gui, pic_x, pic_y, pic_z, "C:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Frame Count", nil, true )
	uid = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 58, wid.."frame_c", GameGetFrameNum(), true )
	
	pic_y = pic_y + 11
	local update_rate = ModSettingGetNextValue( "p2k.FPS_UPDATE_RATE" )
	fps_timer[2] = GameGetRealWorldTimeSinceStarted()*1000
	local fps = 1000/( fps_timer[2] - fps_timer[1] )
	if( update_rate > 0 ) then
		fps_timer[4] = fps_timer[4] + fps
		fps_timer[5] = fps_timer[5] + 1
		if( fps_timer[5] >= update_rate ) then
			fps_timer[3] = fps_timer[4]/update_rate
			fps_timer[4] = 0
			fps_timer[5] = 0
		end
	else
		fps_timer[3] = fps
	end
	new_text( gui, pic_x, pic_y, pic_z, "F:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "FPS", nil, true )
	uid = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 23, wid.."frame_f", math.floor( 10*fps_timer[3] + 0.5 )/10, true, -20, true )
	fps_timer[1] = fps_timer[2]
	
	pic_x = pic_x + 32
	new_text( gui, pic_x, pic_y, pic_z, "L:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "FPS Limit", nil, true )
	uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 15, wid.."frame_l", fps_dropper[3], false, -12, true )
	if( r_clicked ) then
		inputter( function( k_buffer )
			fps_dropper[3] = tonumber( k_buffer )
		end)
	end
	local value = ( fps_dropper[4] > 0 )
	uid, clicked = new_toggler( gui, uid, pic_x + 24, pic_y, pic_z, value, 10, { "F", "T", })
	uid = new_tooltip( gui, uid, ui_z - 200, "FPS Lock: "..tostring( value ), nil, true )
	if( clicked ) then
		play_sound( "button_generic" )
		fps_dropper[4] = value and 0 or 1
	end
	
	return uid
end

function teleboard_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	
	local page = window_table[dimension][wid].extra.page
	
	local teles = DD_extractor( ModSettingGetNextValue( "p2k.TELEBOARD_INFO" )) or {}
	if( #teles > 0 ) then
		t_x = t_x + 2
		for i = ( 9*page - 8 ), 9*page do
			if( i > #teles ) then
				break
			end
			
			t_y = t_y + 11
			local tele = teles[i]
			new_text( gui, t_x, t_y, pic_z, liner( gui, tele[1], 109 ), 2 )
			uid = new_tooltip( gui, uid, ui_z - 200, tele[1] )
			
			uid, clicked, r_clicked = new_button( gui, uid, t_x + 110, t_y, pic_z, "mods/p2k/files/pics/key_tele.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Teleport Captured", nil, true )
			if( clicked ) then
				if( captured_entity ~= 0 ) then
					play_sound( "switch_dimension" )
					new_log( "[TELEPORTED]" )
					EntitySetTransform( captured_entity, tonumber( tele[2] ), tonumber( tele[3] ))
					EntityApplyTransform( captured_entity, tonumber( tele[2] ), tonumber( tele[3] ))
				else
					play_sound( "error" )
					new_log( "[ERROR] None is captured!", true )
				end
			end
			
			uid, clicked, r_clicked = new_button( gui, uid, t_x + 121, t_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to delete.", true )
			if( r_clicked ) then
				play_sound( "delete" )
				table.remove( teles, i )
				ModSettingSetNextValue( "p2k.TELEBOARD_INFO", DD_packer( teles ), false )
			end
		end
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 11
	pic = "mods/p2k/files/pics/button_21_A.png"
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "ADD" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	-- uid = new_tooltip( gui, uid, ui_z - 200, "Add New", nil, true )
	if( clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			pic_x = pic_x + 2
			pic_y = pic_y + 11
			if( captured_entity == 0 ) then
				new_text( gui, pic_x, pic_y, pic_z, "[NONE IS CAPTURED]", 2 )
			else
				uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 155, wid.."new_tele", "" )
				if( r_clicked ) then
					inputter( function( k_buffer )
						local captured_x, captured_y = EntityGetTransform( captured_entity )
						ModSettingSetNextValue( "p2k.TELEBOARD_INFO", ModSettingGetNextValue( "p2k.TELEBOARD_INFO" )..":"..k_buffer..":"..math.floor( captured_x )..":"..math.floor( captured_y )..":|", false )
					end)
				end
			end
			
			return uid
		end
		born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "ENTER_SPOT_NAME", nil, custom_contents ))
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "CMR" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "To Camera", "LMB to teleport captured entiry to the camera.", true )
	if( clicked ) then
		if( captured_entity ~= 0 ) then
			play_sound( "switch_dimension" )
			new_log( "[TELEPORTED]" )
			EntitySetTransform( captured_entity, cam_x, cam_y )
			EntityApplyTransform( captured_entity, cam_x, cam_y )
		else
			play_sound( "error" )
			new_log( "[ERROR] None is captured!", true )
		end
	end
	
	pic_y = pic_y + 66
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #teles/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end
	
	return uid
end

function zoom_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	
	local w, h = GuiGetScreenDimensions( gui )
	local v_x = ( pic_x + 79.5 )/w
	local v_y = -( pic_y + 74 )/h
	
	pic_x = pic_x + 2
	pic_y = pic_y + 11
	local scale = ModSettingGetNextValue( "p2k.ZOOM_SCALE" )
	uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 122, wid.."scale", scale )
	if( r_clicked ) then
		inputter( function( k_buffer )
			ModSettingSetNextValue( "p2k.ZOOM_SCALE", k_buffer, false )
		end)
	end
	
	pic_x = pic_x + 123
	local raw = ModSettingGetNextValue( "p2k.ZOOM_RAW" )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, raw, 10, {"N", "R"})
	uid = new_tooltip( gui, uid, ui_z - 200, "Draw Fog Of War: "..tostring( not( raw )), nil, true )
	if( clicked ) then
		play_sound( "button_generic" )
		ModSettingSetNextValue( "p2k.ZOOM_RAW", not( raw ), false )
	end
	
	pic_x = pic_x + 11
	local value = ModSettingGetNextValue( "p2k.ZOOM_MODE" )
	local modes = { "Lense", "TV", "Pointer", }
	uid, clicked, value = new_switcher( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/button_10_A.png", value, { "L", "T", "P", })
	uid = new_tooltip( gui, uid, ui_z - 200, modes[value], nil, true )
	if( clicked ) then
		ModSettingSetNextValue( "p2k.ZOOM_MODE", value, false )
	end
	
	pic_x = pic_x + 11
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "\"TV\" mode Anchor", nil, true )
	if( clicked ) then
		play_sound( "button_generic" )
		zoom_target[1] = v_x
		zoom_target[2] = -v_y
		new_log( "[ANCHOR SET]", true )
	end
	
	local p_x = v_x
	local p_y = v_y
	if( value == 2 ) then
		p_x = zoom_target[1]
		p_y = -zoom_target[2]
	elseif( value == 3 ) then
		local m_x, m_y = get_mouse_pos( gui )
		p_x = m_x/w
		p_y = -m_y/h
	end
	
	GameSetPostFxParameter( "viewer_info", v_x, v_y, 1/tonumber( scale ), b2n( raw ))
	GameSetPostFxParameter( "pointer_info", p_x, p_y, w, h )
	
	return uid
end

function transform_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local is_updated = false
	
	pic_x = pic_x + 2
	pic_y = pic_y + 11
	if( captured_entity ~= 0 ) then
		local t_x, t_y, t_r, t_s_x, t_s_y = EntityGetTransform( captured_entity )
		local k_buffer = keyboard_info[dimension][2]..keyboard_info[dimension][3]
		
		new_text( gui, pic_x, pic_y, pic_z, "X:", 2 )
		uid, r_clicked = new_input( gui, uid, pic_x + 9, pic_y, pic_z, 70, wid.."x", t_x )
		if( r_clicked ) then
			play_sound( "confirm" )
			if( tostring( t_x ) ~= k_buffer ) then
				t_x = tonumber( k_buffer )
				is_updated = true
			end
			keyboard_info[dimension] = { "", "<>", "" }
		end
		
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "Y:", 2 )
		uid, r_clicked = new_input( gui, uid, pic_x + 9, pic_y, pic_z, 70, wid.."y", t_y )
		if( r_clicked ) then
			play_sound( "confirm" )
			if( tostring( t_y ) ~= k_buffer ) then
				t_y = tonumber( k_buffer )
				is_updated = true
			end
			keyboard_info[dimension] = { "", "<>", "" }
		end
		
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "R:", 2 )
		uid, r_clicked = new_input( gui, uid, pic_x + 9, pic_y, pic_z, 70, wid.."r", math.deg( t_r ))
		if( r_clicked ) then
			play_sound( "confirm" )
			if( tostring( math.deg( t_r )) ~= k_buffer ) then
				t_r = math.rad( tonumber( k_buffer ))
				is_updated = true
			end
			keyboard_info[dimension] = { "", "<>", "" }
		end
		
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "W:", 2 )
		uid, r_clicked = new_input( gui, uid, pic_x + 9, pic_y, pic_z, 70, wid.."w", t_s_x )
		if( r_clicked ) then
			play_sound( "confirm" )
			if( tostring( t_s_x ) ~= k_buffer ) then
				t_s_x = math.abs( tonumber( k_buffer ))
				is_updated = true
			end
			keyboard_info[dimension] = { "", "<>", "" }
		end
		
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "H:", 2 )
		uid, r_clicked = new_input( gui, uid, pic_x + 9, pic_y, pic_z, 70, wid.."h", t_s_y )
		if( r_clicked ) then
			play_sound( "confirm" )
			if( tostring( t_s_y ) ~= k_buffer ) then
				t_s_y = math.abs( tonumber( k_buffer ))
				is_updated = true
			end
			keyboard_info[dimension] = { "", "<>", "" }
		end
		
		if( is_updated ) then
			EntitySetTransform( captured_entity, t_x, t_y, t_r, t_s_x, t_s_y )
			EntityApplyTransform( captured_entity, t_x, t_y, t_r, t_s_x, t_s_y )
		end
	else
		new_text( gui, pic_x, pic_y, pic_z, "[ERROR]", 2 )
	end
	
	return uid
end

function ecs_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	
	pic_x = pic_x + 2
	pic_y = pic_y + 11
	new_text( gui, pic_x, pic_y, pic_z, "P:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Load From File", "Enter the path.", true )
	uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 60, wid.."filename", ecs_info[1] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			ecs_info[1] = k_buffer
		end)
	end
	
	uid, clicked = new_button( gui, uid, pic_x + 69, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Load", "LMB to spawn at the camera position.", true )
	if( clicked ) then
		play_sound( "button_generic" )
		local out = EntityLoad( ecs_info[1], cam_x, cam_y )
		new_log(( out == nil or out == "" or out == 0 ) and "[ERROR] Invalid path!" or "[LOADED]", true )
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x, pic_y, pic_z, "N:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Get with ID", "Enter the numerical ID.", true )
	uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 36, wid.."entity_num", ecs_info[2] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			ecs_info[2] = k_buffer
		end)
	end
	
	uid, clicked = new_button( gui, uid, pic_x + 45, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Confirm", nil, true )
	if( clicked ) then
		create_entity_window({new_spawn()}, ui_z, tonumber( ecs_info[2] ))
	end
	
	pic = "mods/p2k/files/pics/button_21_A.png"
	new_text( gui, pic_x + 60, pic_y, pic_z - 0.01, "WSE" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 58, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "World State Entity", nil, true )
	if( clicked ) then
		create_entity_window({new_spawn()}, ui_z, GameGetWorldStateEntity())
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x, pic_y, pic_z, "T:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Get with Tag", nil, true )
	uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 36, wid.."comp_num", ecs_info[3] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			ecs_info[3] = k_buffer
		end)
	end
	
	uid, clicked = new_button( gui, uid, pic_x + 45, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Confirm", nil, true )
	if( clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			local pic, clicked, r_clicked = 0, 0, 0
			local t_x, t_y = pic_x, pic_y
			
			local page = window_table[dimension][wid].extra.value.page
			local tbl = EntityGetWithTag( window_table[dimension][wid].extra.value.target ) or {}
			table.sort( tbl )
			if( #tbl > 0 ) then
				t_x = t_x + 2
				for i = ( 9*page - 8 ), 9*page do
					if( i > #tbl ) then
						break
					end
					
					t_y = t_y + 11
					local entity = tbl[i]
					uid, clicked, r_clicked = new_toggler( gui, uid, t_x, t_y, pic_z, captured_entity == entity, 120, liner( gui, tostring( entity ), 116 ))
					uid = new_tooltip( gui, uid, ui_z - 200, get_name( entity ), "LMB to open. @ RMB to target.", true )
					if( clicked ) then
						create_entity_window({new_spawn()}, ui_z, entity )
					end
					if( r_clicked ) then
						play_sound( "button_special" )
						captured_entity = entity
					end
					
					uid, clicked, r_clicked = new_button( gui, uid, t_x + 121, t_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
					uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to delete.", true )
					if( r_clicked ) then
						play_sound( "delete" )
						EntityKill( entity )
					end
				end
			end
			
			pic_x = pic_x + 136
			pic_y = pic_y + 11
			new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "EDT" )
			uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/button_21_A.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Change The Filter", nil, true )
			if( clicked ) then
				local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
					pic_x = pic_x + 2
					pic_y = pic_y + 11
					local tag = window_table[dimension][window_table[dimension][wid].extra.value].extra.value.target
					uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 155, wid.."edit_tag", tag )
					if( r_clicked ) then
						inputter( function( k_buffer )
							window_table[dimension][window_table[dimension][wid].extra.value].extra.value.target = k_buffer
						end)
					end
					
					return uid
				end
				born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "EDIT_SEARCH", nil, custom_contents, wid ))
			end
			
			pic_y = pic_y + 77
			uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #tbl/9 ))
			if( page ~= window_table[dimension][wid].extra.value.page ) then
				window_table[dimension][wid].extra.value.page = page
			end
			
			return uid
		end
		function dlt_action( stuff )
			local tbl = EntityGetWithTag( stuff.value.target ) or {}
			if( #tbl > 0 ) then
				for i,entity in ipairs( tbl ) do
					EntityKill( entity )
				end
			end
		end
		create_edit_window({new_spawn()}, ui_z, "TAGGED_SEARCH", "big_A", custom_contents, { page = 1, target = ecs_info[3], }, dlt_action )
	end
	
	new_text( gui, pic_x + 60, pic_y, pic_z - 0.01, "PSE" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 58, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Player State Entity", nil, true )
	if( clicked ) then
		create_entity_window({new_spawn()}, ui_z, EntityGetWithName( "player_stats" ))
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x, pic_y, pic_z, "B:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Load Blank", "Enter the name.", true )
	uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 36, wid.."blank", ecs_info[4] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			ecs_info[4] = k_buffer
		end)
	end
	
	uid, clicked = new_button( gui, uid, pic_x + 45, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Load", "LMB to spawn at the camera position.", true )
	if( clicked ) then
		play_sound( "button_generic" )
		EntitySetTransform( EntityCreateNew( ecs_info[4] ), cam_x, cam_y, 0, 1, 1 )
		new_log( "[BLANK CREATED]" )
	end
	
	new_text( gui, pic_x + 60, pic_y, pic_z - 0.01, "PLR" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 58, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Player", nil, true )
	if( clicked ) then
		create_entity_window({new_spawn()}, ui_z, get_player())
	end
	
	return uid
end

function animaler_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	
	local values = window_table[dimension][wid].extra
	
	pic_x = pic_x + 2
	pic_y = pic_y + 11
	if( captured_entity ~= 0 ) then
		local cap_x, cap_y = EntityGetTransform( captured_entity )
	
		new_text( gui, pic_x, pic_y, pic_z, "M:", 2 )
		uid = new_tooltip( gui, uid, ui_z - 200, "Matter Applier", "Enter the matter name.", true )
		uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 34, wid.."matter", values.matter )
		if( r_clicked ) then
			inputter( function( k_buffer )
				window_table[dimension][wid].extra.matter = k_buffer
			end)
		end
		
		uid, clicked, r_clicked = new_button( gui, uid, pic_x + 43, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
		uid = new_tooltip( gui, uid, ui_z - 200, "Confirm", "LMB to add stains. @ RMB to force ingest.", true )
		if( clicked ) then
			play_sound( "button_generic" )
			new_log( "[STAINED]" )
			EntityAddRandomStains( captured_entity, CellFactory_GetType( values.matter ), 10 )
		end
		if( r_clicked ) then
			play_sound( "button_special" )
			new_log( "[INGESTED]" )
			EntityIngestMaterial( captured_entity, CellFactory_GetType( values.matter ), 10 )
		end
		
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "D:", 2 )
		uid = new_tooltip( gui, uid, ui_z - 200, "Hitter", "Enter the damage amount.", true )
		uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 23, wid.."damage", values.damage[1], false, -20, true )
		if( r_clicked ) then
			inputter( function( k_buffer )
				window_table[dimension][wid].extra.damage[1] = tonumber( k_buffer )
			end)
		end
		
		local ragdoll_effects = {
			{ "_", "N", "E", "S", "F", "M", "C", "D", "R", "P", },
			{ "NONE", "NORMAL", "BLOOD_EXPLOSION", "BLOOD_SPRAY", "FROZEN", "CONVERT_TO_MATERIAL", "CUSTOM_RAGDOLL_ENTITY", "DISINTEGRATED", "NO_RAGDOLL_FILE", "PLAYER_RAGDOLL_CAMERA", },
		}
		local damage_type = {
			{ "M", "P", "X", "F", "T", "E", "L", "S", "I", "H", "Y", "R", "C", "A", "O", "J", "G", "B", "W", },
			{ "DAMAGE_MELEE", "DAMAGE_PROJECTILE", "DAMAGE_EXPLOSION", "DAMAGE_FIRE", "DAMAGE_MATERIAL", "DAMAGE_ELECTRICITY", "DAMAGE_DRILL", "DAMAGE_SLICE", "DAMAGE_ICE", "DAMAGE_HEALING", "DAMAGE_PHYSICS_HIT", "DAMAGE_RADIOACTIVE", "DAMAGE_POISON", "DAMAGE_DROWNING", "DAMAGE_OVEREATING", "DAMAGE_BITE", "DAMAGE_FALL", "DAMAGE_PHYSICS_BODY_DAMAGED", "DAMAGE_MATERIAL_WITH_FLASH", },
		}
		local value = 0
		uid, clicked, value = new_switcher( gui, uid, pic_x + 32, pic_y, pic_z, "mods/p2k/files/pics/button_10_A.png", values.damage[2], ragdoll_effects[1])
		uid = new_tooltip( gui, uid, ui_z - 200, "Ragdoll Effect: "..ragdoll_effects[2][values.damage[2]], nil, true )
		if( clicked ) then
			window_table[dimension][wid].extra.damage[2] = value
		end
		
		new_text( gui, pic_x + 45, pic_y, pic_z - 0.01, damage_type[1][values.damage[3]] )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x + 43, pic_y, pic_z, "mods/p2k/files/pics/button_10_A.png" )
		uid = new_tooltip( gui, uid, ui_z - 200, "Damage Type: "..damage_type[2][values.damage[3]], "LMB to switch the damage_type. @ RMB to hit the captured entity.", true )
		if( clicked ) then
			play_sound( "button_generic" )
			if( values.damage[3] == #damage_type[1] ) then
				values.damage[3] = 0
			end
			window_table[dimension][wid].extra.damage[3] = values.damage[3] + 1
		end
		if( r_clicked ) then
			play_sound( "button_special" )
			EntityInflictDamage( captured_entity, values.damage[1]/25, damage_type[2][values.damage[3]], "ULTIMATE_POWER", ragdoll_effects[2][values.damage[2]], 0, 0, captured_entity, cap_x, cap_y, 0 )
		end
		
		pic_x = pic_x + 56
		new_text( gui, pic_x, pic_y, pic_z, "P:", 2 )
		uid = new_tooltip( gui, uid, ui_z - 200, "Entity Appender", "Enter the path.", true )
		uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 47, wid.."loader", values.path )
		if( r_clicked ) then
			inputter( function( k_buffer )
				window_table[dimension][wid].extra.path = k_buffer
			end)
		end
		
		uid, clicked = new_button( gui, uid, pic_x + 56, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
		uid = new_tooltip( gui, uid, ui_z - 200, "Load", "LMB to append to the captured entity.", true )
		if( clicked ) then
			play_sound( "button_generic" )
			new_log( "[LOADED]" )
			EntityLoadToEntity( values.path, captured_entity )
		end
		
		pic_y = pic_y - 11
		new_text( gui, pic_x, pic_y, pic_z, "A:", 2 )
		uid = new_tooltip( gui, uid, ui_z - 200, "Animator", "Enter the animation name.", true )
		uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 34, wid.."anim", values.anim )
		if( r_clicked ) then
			inputter( function( k_buffer )
				window_table[dimension][wid].extra.anim = k_buffer
			end)
		end
		
		uid, clicked, r_clicked = new_button( gui, uid, pic_x + 43, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
		uid = new_tooltip( gui, uid, ui_z - 200, "Play", "LMB to force the animation on the captured entity.", true )
		if( clicked ) then
			play_sound( "button_generic" )
			GamePlayAnimation( captured_entity, values.anim, 1 )
		end
		
		pic_x = pic_x + 56
		if( captured_entity ~= values.boxes[2][1] ) then
			window_table[dimension][wid].extra.boxes[2] = { captured_entity, 1, }
		end
		local bxs = EntityGetComponentIncludingDisabled( captured_entity, "HitboxComponent" ) or {}
		new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, values.boxes[1] and "H" or "C" )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/button_10_A.png" )
		uid = new_tooltip( gui, uid, ui_z - 200, ( values.boxes[1] and "Hitbox" or "Collider" ).." Viewer", "LMB to cycle through boxes. @ RMB to switch to "..( values.boxes[1] and "Collider" or "Hitbox" ).." mode.", true )
		if( clicked and #bxs > 0 ) then
			play_sound( "button_generic" )
			if( #bxs == values.boxes[2][2] ) then
				values.boxes[2][2] = 0
			end
			window_table[dimension][wid].extra.boxes[2][2] = values.boxes[2][2] + 1
		end
		if( r_clicked ) then
			play_sound( "button_special" )
			window_table[dimension][wid].extra.boxes[1] = not( values.boxes[1] )
		end
		
		local poses = { 0, 0, 0, 0, }
		if( values.boxes[1] ) then
			if( #bxs > 0 ) then
				local comp_id = type( bxs ) == "table" and bxs[values.boxes[2][2]] or bxs
				poses[1] = ComponentGetValue2( comp_id, "aabb_min_x" )
				poses[2] = ComponentGetValue2( comp_id, "aabb_max_x" )
				poses[3] = ComponentGetValue2( comp_id, "aabb_min_y" )
				poses[4] = ComponentGetValue2( comp_id, "aabb_max_y" )
			end
		else
			local char_comp = EntityGetFirstComponentIncludingDisabled( captured_entity, "CharacterDataComponent" )
			if( char_comp ~= nil ) then
				poses[1] = ComponentGetValue2( char_comp, "collision_aabb_min_x" )
				poses[2] = ComponentGetValue2( char_comp, "collision_aabb_max_x" )
				poses[3] = ComponentGetValue2( char_comp, "collision_aabb_min_y" )
				poses[4] = ComponentGetValue2( char_comp, "collision_aabb_max_y" )
			end
		end
		
		local duration = IS_1K_MODE and 1 or 2
		pic = "mods/p2k/files/pics/dot_purple_dark.png"
		GameCreateSpriteForXFrames( pic, cap_x + poses[1], cap_y, true, 0, 0, duration, true )
		GameCreateSpriteForXFrames( pic, cap_x + poses[2], cap_y, true, 0, 0, duration, true )
		GameCreateSpriteForXFrames( pic, cap_x, cap_y + poses[3], true, 0, 0, duration, true )
		GameCreateSpriteForXFrames( pic, cap_x, cap_y + poses[4], true, 0, 0, duration, true )
		GameCreateSpriteForXFrames( pic, cap_x + poses[1], cap_y, true, 0, 0, duration, false )
		GameCreateSpriteForXFrames( pic, cap_x + poses[2], cap_y, true, 0, 0, duration, false )
		GameCreateSpriteForXFrames( pic, cap_x, cap_y + poses[3], true, 0, 0, duration, false )
		GameCreateSpriteForXFrames( pic, cap_x, cap_y + poses[4], true, 0, 0, duration, false )
		pic = "mods/p2k/files/pics/dot_red.png"
		GameCreateSpriteForXFrames( pic, cap_x + poses[1], cap_y + poses[3], true, 0, 0, duration, true )
		GameCreateSpriteForXFrames( pic, cap_x + poses[1], cap_y + poses[4], true, 0, 0, duration, true )
		GameCreateSpriteForXFrames( pic, cap_x + poses[2], cap_y + poses[3], true, 0, 0, duration, true )
		GameCreateSpriteForXFrames( pic, cap_x + poses[2], cap_y + poses[4], true, 0, 0, duration, true )
		GameCreateSpriteForXFrames( pic, cap_x + poses[1], cap_y + poses[3], true, 0, 0, duration, false )
		GameCreateSpriteForXFrames( pic, cap_x + poses[1], cap_y + poses[4], true, 0, 0, duration, false )
		GameCreateSpriteForXFrames( pic, cap_x + poses[2], cap_y + poses[3], true, 0, 0, duration, false )
		GameCreateSpriteForXFrames( pic, cap_x + poses[2], cap_y + poses[4], true, 0, 0, duration, false )
	else
		new_text( gui, pic_x, pic_y, pic_z, "[ERROR]", 2 )
	end
	
	return uid
end

function scene_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	
	local info = window_table[dimension][wid].extra.info
	
	pic_x = pic_x + 2
	pic_y = pic_y + 11
	new_text( gui, pic_x, pic_y, pic_z, "M:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Matters", "See LoadPixelScene in the lua_api_doc.", true )
	uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 120, wid.."matter", info[1] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			window_table[dimension][wid].extra.info[1] = k_buffer
		end)
	end
	
	uid = new_image( gui, uid, pic_x + 129, pic_y, pic_z, "mods/p2k/files/pics/dot_purple_dark.png", 1, 43 )
	
	pic_y = pic_y + 11
	new_text( gui, pic_x, pic_y, pic_z, "C:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Colours", "See LoadPixelScene in the lua_api_doc.", true )
	uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 120, wid.."colors", info[2] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			window_table[dimension][wid].extra.info[2] = k_buffer
		end)
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x, pic_y, pic_z, "B:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Background", "See LoadPixelScene in the lua_api_doc.", true )
	uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 120, wid.."back", info[3] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			window_table[dimension][wid].extra.info[3] = k_buffer
		end)
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x, pic_y, pic_z, "T:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Conversion Table", "See LoadPixelScene in the lua_api_doc.", true )
	uid, r_clicked = new_input( gui, uid, pic_x + 8, pic_y, pic_z, 120, wid.."table", info[4] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			window_table[dimension][wid].extra.info[4] = k_buffer
		end)
	end
	
	pic_x = pic_x + 131
	pic_y = pic_y - 11
	new_text( gui, pic_x, pic_y, pic_z, "ET:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Edge Textures", "See LoadPixelScene in the lua_api_doc.", true )
	uid, clicked = new_toggler( gui, uid, pic_x + 14, pic_y, pic_z, info[7], 10, { "F", "T" })
	if( clicked ) then
		play_sound( "button_generic" )
		window_table[dimension][wid].extra.info[7] = not( info[7] )
	end
	
	pic_y = pic_y - 11
	new_text( gui, pic_x, pic_y, pic_z, "BC:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Biome Checks", "See LoadPixelScene in the lua_api_doc.", true )
	uid, clicked = new_toggler( gui, uid, pic_x + 14, pic_y, pic_z, info[6], 10, { "F", "T" })
	if( clicked ) then
		play_sound( "button_generic" )
		window_table[dimension][wid].extra.info[6] = not( info[6] )
	end
	
	pic_y = pic_y - 11
	new_text( gui, pic_x, pic_y, pic_z, "Z:", 2 )
	uid = new_tooltip( gui, uid, ui_z - 200, "Z-level", "See LoadPixelScene in the lua_api_doc.", true )
	uid, r_clicked = new_input( gui, uid, pic_x + 9, pic_y, pic_z, 15, wid.."z", info[5], false, -12, true )
	if( r_clicked ) then
		inputter( function( k_buffer )
			window_table[dimension][wid].extra.info[5] = tonumber( k_buffer )
		end)
	end
	
	pic_y = pic_y + 33
	pic_x = pic_x + 7
	uid, clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Load", "LMB to spawn at the camera position.", true )
	if( clicked ) then
		play_sound( "button_generic" )
		new_log( "[LOADED]" )
		dofile( info[4] )
		LoadPixelScene( info[1], info[2], cam_x, cam_y, info[3], not( info[6] ), not( info[7] ), color_to_material_table, info[5] )
	end

	return uid
end

function entity_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	
	local page = window_table[dimension][wid].extra.page
	local searcher = window_table[dimension][wid].extra.comp_tag
	local entity_id = window_table[dimension][wid].extra.entity
	if( not( EntityGetIsAlive( entity_id ))) then
		pic_x = pic_x + 2
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
		
		pic_y = pic_y + 11
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/button_61_A.png" )
		new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "Load Captured" )
		if( clicked ) then
			if( captured_entity ~= 0 ) then
				play_sound( "button_generic" )
				window_table[dimension][wid].extra.entity = captured_entity
				window_table[dimension][wid].title = get_name( captured_entity )
			else
				play_sound( "error" )
				new_log( "[ERROR] None is captured!", true )
			end
		end
		
		return uid
	end
	
	local full_comps = EntityGetAllComponents( entity_id ) or {}
	local comps = {}
	if( searcher == "" ) then
		comps = full_comps
	elseif( #full_comps > 0 ) then
		for i,comp in ipairs( full_comps ) do
			if( ComponentHasTag( comp, searcher )) then
				table.insert( comps, comp )
			end
		end
	end
	
	if( #comps > 0 ) then
		t_x = t_x + 2
		for i = ( 9*page - 8 ), 9*page do
			if( i > #comps ) then
				break
			end
			
			t_y = t_y + 11
			local comp_id = comps[i]
			local is_enabled = ComponentGetIsEnabled( comp_id )
			new_text( gui, t_x + 2, t_y, pic_z - 0.01, liner( gui, ComponentGetTypeName( comp_id ), 116 ), is_enabled and 3 or 1 )
			uid, clicked, r_clicked = new_button( gui, uid, t_x, t_y, pic_z, "mods/p2k/files/pics/button_120_"..( is_enabled and "B" or "A" )..".png" )
			uid = new_tooltip( gui, uid, ui_z - 200, ComponentGetTypeName( comp_id ), "LMB to open. @ RMB to "..( is_enabled and "dis" or "en" ).."able." )
			if( clicked ) then
				create_comp_window({new_spawn()}, ui_z, entity_id, comp_id )
			end
			if( r_clicked ) then
				play_sound( "button_special" )
				EntitySetComponentIsEnabled( entity_id, comp_id, not( is_enabled ))
			end
			
			uid, clicked, r_clicked = new_button( gui, uid, t_x + 121, t_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to delete.", true )
			if( r_clicked ) then
				play_sound( "delete" )
				EntityRemoveComponent( entity_id, comp_id )
			end
		end
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 11
	local is_enabled = captured_entity == entity_id
	uid, clicked, r_clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, is_enabled, 21, "TRK" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Targeter", "LMB to capture. @ RMB to toggle the transformer gizmo.", true )
	if( clicked ) then
		if( is_enabled ) then
			play_sound( "uncapture" )
			captured_entity = 0
		else
			play_sound( "capture" )
			captured_entity = entity_id
		end
	end
	if( r_clicked ) then
		play_sound( "button_special" )
		ModSettingSetNextValue( "p2k.TRANSFORMER", not( transform_editor ), false )
	end
	
	pic_y = pic_y + 11
	pic = "mods/p2k/files/pics/button_21_A.png"
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "FNM" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Copy Filename", nil, true )
	if( clicked ) then
		play_sound( "button_generic" )
		buffered_value = EntityGetFilename( entity_id )
		new_log( "[BUFFERED]: "..buffered_value, true )
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "TGS" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Tags", "LMB to open the tag window. @ RMB to filter components by the tag.", true )
	if( clicked ) then
		create_tag_window({new_spawn()}, ui_z, entity_id )
	end
	if( r_clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			pic_x = pic_x + 2
			pic_y = pic_y + 11
			
			local parent_wid = window_table[dimension][wid].extra.value
			local searcher = window_table[dimension][parent_wid].extra.comp_tag
			
			uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 155, wid.."search", searcher )
			if( r_clicked ) then
				inputter( function( k_buffer )
					window_table[dimension][parent_wid].extra.comp_tag = k_buffer
				end)
			end
			
			return uid
		end
		born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "SEARCH_BY_TAG", nil, custom_contents, wid ))
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "NME" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Name Editor", nil, true )
	if( clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			pic_x = pic_x + 2
			pic_y = pic_y + 11
			local entity_id = window_table[dimension][window_table[dimension][wid].extra.value].extra.entity
			if( not( EntityGetIsAlive( entity_id ))) then
				new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
				return uid
			end
			local value = EntityGetName( entity_id )
			uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 155, wid.."edit_name", value )
			if( r_clicked ) then
				inputter( function( k_buffer )
					if( value ~= k_buffer ) then
						EntitySetName( entity_id, k_buffer )
						if( k_buffer == " " or k_buffer == "" or k_buffer == nil ) then
							window_table[dimension][window_table[dimension][wid].extra.value].title = tostring( entity_id )
						else
							window_table[dimension][window_table[dimension][wid].extra.value].title = k_buffer
						end
					end
				end)
			end
			
			return uid
		end
		born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "EDIT_NAME", nil, custom_contents, wid ))
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "CLD" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Children", "LMB to view the children. @ RMB to get the parent.", true )
	if( clicked ) then
		create_child_window({new_spawn()}, ui_z, entity_id )
	end
	if( r_clicked ) then
		if( EntityGetRootEntity( entity_id ) ~= entity_id ) then
			create_entity_window({new_spawn()}, ui_z, EntityGetParent( entity_id ))
		else
			play_sound( "error" )
			new_log( "[ERROR] This is the root!", true )
		end
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "ADD" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Componenter", "LMB to add new component.", true )
	if( clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			pic_x = pic_x + 2
			pic_y = pic_y + 11
			local entity_id = window_table[dimension][window_table[dimension][wid].extra.value].extra.entity
			if( not( EntityGetIsAlive( entity_id ))) then
				new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
				return uid
			end
			uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 155, wid.."add_comp", "" )
			if( r_clicked ) then
				inputter( function( k_buffer )
					EntitySetComponentIsEnabled( entity_id, EntityAddComponent2( entity_id, k_buffer ), false )
				end)
			end
			
			return uid
		end
		born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "ADD_COMPONENT", nil, custom_contents, wid ))
	end
	
	pic_y = pic_y + 22
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #comps/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end
	
	return uid
end

function child_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	
	local page = window_table[dimension][wid].extra.page
	local entity_id = window_table[dimension][wid].extra.entity
	if( not( EntityGetIsAlive( entity_id ))) then
		pic_x = pic_x + 2	
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
		
		pic_y = pic_y + 11
		new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "Load Captured" )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/button_61_A.png" )
		if( clicked ) then
			if( captured_entity ~= 0 ) then
				play_sound( "button_generic" )
				window_table[dimension][wid].extra.entity = captured_entity
			else
				play_sound( "error" )
				new_log( "[ERROR] None is captured!", true )
			end
		end
		
		return uid
	end
	local children = EntityGetAllChildren( entity_id ) or {}
	
	if( #children > 0 ) then
		t_x = t_x + 2
		for i = ( 9*page - 8 ), 9*page do
			if( i > #children ) then
				break
			end
			
			t_y = t_y + 11
			local child_id = children[i]
			pic = "mods/p2k/files/pics/button_109_A.png"
			new_text( gui, t_x + 2, t_y, pic_z - 0.01, liner( gui, get_name( child_id ), 105 ))
			uid, clicked, r_clicked = new_button( gui, uid, t_x, t_y, pic_z, pic )
			uid = new_tooltip( gui, uid, ui_z - 200, get_name( child_id ), "LMB to open the child's window." )
			if( clicked ) then
				create_entity_window({new_spawn()}, ui_z, child_id )
			end
			
			uid, clicked, r_clicked = new_button( gui, uid, t_x + 110, t_y, pic_z, "mods/p2k/files/pics/key_unparent.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to unparent the child.", true )
			if( r_clicked ) then
				play_sound( "button_special" )
				EntityRemoveFromParent( child_id )
			end
			
			uid, clicked, r_clicked = new_button( gui, uid, t_x + 121, t_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Kill", "RMB to delete the child.", true )
			if( r_clicked ) then
				play_sound( "delete" )
				EntityKill( child_id )
			end
		end
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 11
	pic = "mods/p2k/files/pics/button_21_A.png"
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "CLR" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Clear", "RMB to unparent all the children.", true )
	if( r_clicked ) then
		play_sound( "button_special" )
		for i,child in ipairs( children ) do
			EntityRemoveFromParent( child )
		end
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "DLT" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Delete", "RMB to kill all the children.", true )
	if( r_clicked ) then
		play_sound( "delete" )
		for i,child in ipairs( children ) do
			EntityKill( child )
		end
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "ADD" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Adopter", "LMB to add the captured entity as a child.", true )
	if( clicked ) then
		if( captured_entity ~= 0 ) then
			if( captured_entity == EntityGetRootEntity( captured_entity ) and captured_entity ~= entity_id ) then
				play_sound( "button_generic" )
				EntityAddChild( entity_id, captured_entity )
			else
				play_sound( "error" )
				new_log( "[ERROR] Target already has a parent!", true )
			end
		else
			play_sound( "error" )
			new_log( "[ERROR] None is captured!", true )
		end
	end
	
	pic_y = pic_y + 55
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #children/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end
	
	return uid
end

function tag_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	
	local page = window_table[dimension][wid].extra.page
	local entity_id = window_table[dimension][wid].extra.entity
	if( not( EntityGetIsAlive( entity_id ))) then
		pic_x = pic_x + 2	
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
		
		pic_y = pic_y + 11
		new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "Load Captured" )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/button_61_A.png" )
		if( clicked ) then
			if( captured_entity ~= 0 ) then
				play_sound( "button_generic" )
				window_table[dimension][wid].extra.entity = captured_entity
			else
				play_sound( "error" )
				new_log( "[ERROR] None is captured!", true )
			end
		end
		
		return uid
	end
	
	local tags = magic_parser( EntityGetTags( entity_id ), "," ) or {}
	if( #tags > 0 ) then
		t_x = t_x + 2
		for i = ( 9*page - 8 ), 9*page do
			if( i > #tags ) then
				break
			end
			
			t_y = t_y + 11
			new_text( gui, t_x, t_y, pic_z, liner( gui, tags[i], 120 ), 2 )
			uid = new_tooltip( gui, uid, ui_z - 200, tags[i] )
			uid, clicked, r_clicked = new_button( gui, uid, t_x + 121, t_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to delete.", true )
			if( r_clicked ) then
				play_sound( "delete" )
				EntityRemoveTag( entity_id, tags[i] )
			end
		end
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 11
	pic = "mods/p2k/files/pics/button_21_A.png"
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "CLR" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Clear", "RMB to remove all the tags.", true )
	if( r_clicked ) then
		play_sound( "delete" )
		for i,tag in ipairs( tags ) do
			EntityRemoveTag( entity_id, tag )
		end
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "ADD" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	-- uid = new_tooltip( gui, uid, ui_z - 200, "Tagger", "LMB to add the new tag.", true )
	if( clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			pic_x = pic_x + 2
			pic_y = pic_y + 11
			local entity_id = window_table[dimension][window_table[dimension][wid].extra.value].extra.entity
			if( not( EntityGetIsAlive( entity_id ))) then
				new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
				return uid
			end
			uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 155, wid.."add_tag", "" )
			if( r_clicked ) then
				inputter( function( k_buffer )
					EntityAddTag( entity_id, k_buffer )
				end)
			end
			
			return uid
		end
		born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "ADD_TAG", nil, custom_contents, wid ))
	end
	
	pic_y = pic_y + 66
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #tags/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end
	
	return uid
end

function comp_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	
	local page = window_table[dimension][wid].extra.page
	local entity_id = window_table[dimension][wid].extra.entity
	local comp_id = window_table[dimension][wid].extra.comp
	if( not( EntityGetIsAlive( entity_id )) or entity_has_comp( entity_id, comp_id ) == nil ) then
		pic_x = pic_x + 2
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
		return uid
	end
	local object = window_table[dimension][wid].extra.object
	local fields = {}
	if( object == nil ) then
		fields = ComponentGetMembers( comp_id ) or {}
	else
		fields = ComponentObjectGetMembers( comp_id, object ) or {}
	end
	
	local comp_name = ComponentGetTypeName( comp_id )
	local counter = 1
	local starter = 9*page - 9
	local ender = 9*page + 1
	t_x = t_x + 2
	for field in magic_sorter( fields ) do
		-- if( counter == ender ) then --shit needs to be counted
			-- break
		-- end
		if( counter > starter and counter < ender ) then
			t_y = t_y + 11
			new_text( gui, t_x, t_y, pic_z, liner( gui, field, 69 ), 2 )
			uid = new_tooltip( gui, uid, ui_z - 200, field )
			if( is_supported( comp_name, field )) then
				local new_value = "<>"
				
				if( is_object( field )) then
					new_text( gui, t_x + 72, t_y, pic_z - 0.01, "[EDIT]" )
					uid, clicked, r_clicked = new_button( gui, uid, t_x + 70, t_y, pic_z, "mods/p2k/files/pics/button_61_A.png" )
					uid = new_tooltip( gui, uid, ui_z - 200, "Edit Object", nil, true )
					if( clicked ) then
						born_child( wid, create_comp_window({new_spawn()}, ui_z, entity_id, comp_id, field ))
					end
				else
					local value = {}
					if( object == nil ) then
						value = {ComponentGetValue2( comp_id, field )} or {}
					else
						value = {ComponentObjectGetValue2( comp_id, object, field )} or {}
					end
					if( #value > 0 ) then
						if( #value > 1 and #value < 5 ) then
							new_text( gui, t_x + 72, t_y, pic_z - 0.01, "[EDIT]" )
							uid, clicked, r_clicked = new_button( gui, uid, t_x + 70, t_y, pic_z, "mods/p2k/files/pics/button_61_A.png" )
							uid = new_tooltip( gui, uid, ui_z - 200, "Edit Vector", nil, true )
							if( clicked ) then
								local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
									pic_y = pic_y + 11
									local entity_id = window_table[dimension][window_table[dimension][wid].extra.value[1]].extra.entity
									local comp_id = window_table[dimension][window_table[dimension][wid].extra.value[1]].extra.comp
									if( not( EntityGetIsAlive( entity_id )) or ComponentGetTypeName( comp_id ) == nil ) then
										pic_x = pic_x + 2
										new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
										return uid
									end
									local field = window_table[dimension][wid].extra.value[2]
									local values = {ComponentGetValue2( comp_id, field )} or {}
									local shapes = { 144, 71, 47, 35, }
									pic_x = pic_x - shapes[ #values ] + 1
									for i,value in ipairs( values ) do
										pic_x = pic_x + shapes[ #values ] + 1
										uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, shapes[ #values ], wid..i, value )
										if( r_clicked ) then
											inputter( function( k_buffer )
												if( value ~= k_buffer ) then
													values[i] = k_buffer
													if( type( value ) == "number" ) then
														values[i] = tonumber( values[i])
													end
													ComponentSetValue2( comp_id, field, values[1], values[2], values[3], values[4] )
												end
											end)
										end
									end
									
									pic_x = pic_x + shapes[ #value ] + ( #values > 1 and 2 or 1 )
									uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
									if( r_clicked ) then
										play_sound( "delete" )
										keyboard_info[dimension][2] = ""
										keyboard_info[dimension][3] = ""
									end
									
									return uid
								end
								born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "VECTOR:"..field, nil, custom_contents, { wid, field }))
							end
						elseif( type( value[1] ) == "table" ) then
							new_text( gui, t_x + 72, t_y, pic_z - 0.01, "[EDIT]" )
							uid, clicked, r_clicked = new_button( gui, uid, t_x + 70, t_y, pic_z, "mods/p2k/files/pics/button_61_A.png" )
							uid = new_tooltip( gui, uid, ui_z - 200, "Edit Table", nil, true )
							if( clicked ) then
								if( object == nil ) then
									born_child( wid, create_table_window({new_spawn( wid )}, ui_z, entity_id, comp_id, nil, field ))
								else
									born_child( wid, create_table_window({new_spawn( wid )}, ui_z, entity_id, comp_id, object, field ))
								end
							end
						elseif( type( value[1] ) == "boolean" ) then
							value = value[1]
							uid, clicked = new_toggler( gui, uid, t_x + 70, t_y, pic_z, value, 61, {"[FALSE]", "[TRUE]"})
							if( clicked ) then
								play_sound( "button_generic" )
								new_value = not( value )
							end
						else
							value = value[1]
							uid, r_clicked = new_input( gui, uid, t_x + 70, t_y, pic_z, 61, wid..tostring( field ), value )
							if( r_clicked ) then
								inputter( function( k_buffer )
									if( tostring( value ) ~= k_buffer ) then
										if( type( value ) == "string" ) then
											new_value = k_buffer
										else
											new_value = tonumber( k_buffer )
										end
									end
								end)
							end
						end
					end
				end
				
				if( new_value ~= "<>" ) then
					if( object == nil ) then
						ComponentSetValue2( comp_id, field, new_value )
					else
						ComponentObjectSetValue2( comp_id, object, field, new_value )
					end
				end
			else
				new_text( gui, t_x + 72, t_y, pic_z, "[ERROR]", 2 )
				uid = new_tooltip( gui, uid, ui_z - 200, "Is not supported by the API." )
			end
		end
		counter = counter + 1
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 11
	local is_enabled = ComponentGetIsEnabled( comp_id )
	uid, clicked = new_toggler( gui, uid, pic_x, pic_y, pic_z, is_enabled, 21, "ENL" )
	uid = new_tooltip( gui, uid, ui_z - 200, "", "LMB to "..( is_enabled and "dis" or "en" ).."able.", true )
	if( clicked ) then
		play_sound( "button_generic" )
		EntitySetComponentIsEnabled( entity_id, comp_id, not( is_enabled ))
	end
	
	pic_y = pic_y + 11
	pic = "mods/p2k/files/pics/button_21_A.png"
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "OWN" )
	uid, clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Owner", "LMB to open the owner-entity.", true )
	if( clicked ) then
		create_entity_window({new_spawn()}, ui_z, entity_id )
	end
	
	pic_y = pic_y + 11
	new_text( gui, pic_x + 2, pic_y, pic_z - 0.01, "TGS" )
	uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, pic )
	uid = new_tooltip( gui, uid, ui_z - 200, "Tagger", "LMB to edit the tags.", true )
	if( clicked ) then
		local custom_contents = function( gui, uid, pic_x, pic_y, pic_z, wid )
			pic_x = pic_x + 2
			pic_y = pic_y + 11
			local comp_id = window_table[dimension][window_table[dimension][wid].extra.value].extra.comp
			if( ComponentGetTypeName( comp_id ) == nil ) then
				new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
				return uid
			end
			uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 133, wid.."comp_tag", "" )
			if( r_clicked ) then
				inputter( function( k_buffer )
					ComponentAddTag( comp_id, k_buffer )
					new_log( "[TAG ADDDED]", true )
				end)
			end
			
			pic_x = pic_x + 134
			uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_check.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "State Check", nil, true )
			if( clicked ) then
				play_sound( "button_generic" )
				local tag_name = keyboard_info[dimension][2]..keyboard_info[dimension][3]
				new_log( tag_name..": ["..string.upper( tostring( ComponentHasTag( comp_id, tag_name ))).."]", true )
			end
			
			pic_x = pic_x + 11
			uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, pic_z, "mods/p2k/files/pics/key_delete.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Remove", "RMB to delete.", true )
			if( r_clicked ) then
				if( ComponentHasTag( comp_id, keyboard_info[dimension][2]..keyboard_info[dimension][3] )) then
					play_sound( "delete" )
					ComponentRemoveTag( comp_id, keyboard_info[dimension][2]..keyboard_info[dimension][3] )
					new_log( "[TAG REMOVED]", true )
					keyboard_info[dimension] = { "", "<>", "" }
				else
					play_sound( "error" )
					new_log( "[ERROR] Tag isn't real!", true )
				end
			end
			
			return uid
		end
		born_child( wid, create_edit_window({new_spawn( wid )}, ui_z, "TAGS:"..ComponentGetTypeName( comp_id ), nil, custom_contents, wid ))
	end
	
	if( comp_name == "SpriteComponent" ) then
		pic = "mods/p2k/files/pics/button_21_A.png"
		new_text( gui, pic_x + 2, pic_y + 11, pic_z - 0.01, "RFR" )
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y + 11, pic_z, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "Refresh", "LMB to update the sprite.", true )
		if( clicked ) then
			play_sound( "button_generic" )
			new_log( "[REFRESHED]", true )
			EntityRefreshSprite( entity_id, comp_id )
		end
	end
	
	pic_y = pic_y + 55
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil(( counter - 1 )/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end

	return uid
end

function table_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	
	local page = window_table[dimension][wid].extra.page
	local entity_id = window_table[dimension][wid].extra.entity
	local comp_id = window_table[dimension][wid].extra.comp
	if( not( EntityGetIsAlive( entity_id )) or ComponentGetTypeName( comp_id ) == nil ) then
		pic_x = pic_x + 2
		pic_y = pic_y + 11
		new_text( gui, pic_x, pic_y, pic_z, "[CRITICAL ERROR]", 2 )
		
		return uid
	end
	local object = window_table[dimension][wid].extra.object
	local field = window_table[dimension][wid].extra.field
	local tbl = {}
	if( object == nil ) then
		tbl = ComponentGetValue2( comp_id, field ) or {}
	else
		tbl = ComponentObjectGetValue2( comp_id, object, field ) or {}
	end
	
	t_x = t_x + 2
	local counter = 1
	local updater = false
	local starter = 9*page - 9
	local ender = 9*page + 1
	for name,value in pairs( tbl ) do
		if( counter == ender ) then
			break
		end
		if( counter > starter and counter < ender ) then
			t_y = t_y + 11
			local fancy_text = name
			if( field == "count_per_material_type" ) then
				fancy_text = CellFactory_GetName( name - 1 )
			end
			new_text( gui, t_x, t_y, pic_z, liner( gui, fancy_text, 69 ), 2 )
			uid = new_tooltip( gui, uid, ui_z - 200, fancy_text )
			
			uid, r_clicked = new_input( gui, uid, t_x + 70, t_y, pic_z, 61, wid..tostring( fancy_text ), value )
			if( r_clicked ) then
				inputter( function( k_buffer )
					if( tostring( value ) ~= k_buffer ) then
						if( field == "count_per_material_type" ) then
							AddMaterialInventoryMaterial( entity_id, fancy_text, tonumber( k_buffer ))
						else
							updater = true
							if( type( value ) == "string" ) then
								tbl[name] = k_buffer
							else
								tbl[name] = tonumber( k_buffer )
							end
						end
					end
				end)
			end
		end
		counter = counter + 1
	end
	
	if( updater ) then
		ComponentSetValue2( comp_id, field, tbl )
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 88
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #tbl/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end
	
	return uid
end

function misc_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	
	local info = window_table[dimension][wid].extra
	local gonna_update = info.uniform_info[3]
	local gonna_execute = info.file_info[2]
	
	pic_x = pic_x + 2
	pic_y = pic_y + 11
	uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 48, wid.."uni_name", info.uniform_info[1] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			window_table[dimension][wid].extra.uniform_info[1] = k_buffer
		end)
	end
	
	local t_x, t_y = pic_x, pic_y
	t_x = t_x + 49
	for i = 1,4 do
		uid, r_clicked = new_input( gui, uid, t_x, pic_y, pic_z, 23, wid.."uni_value"..i, info.uniform_info[2][i], false, -20, true )
		if( r_clicked ) then
			inputter( function( k_buffer )
				window_table[dimension][wid].extra.uniform_info[2][i] = k_buffer
			end)
		end
		
		t_x = t_x + 24
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, t_x, pic_y, pic_z, "mods/p2k/files/pics/key_confirm"..( gonna_update and "_special" or "" )..".png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Shader Uniform Editor: UNIFORM_NAME | VALUES", "LMB to apply the uniform. @ RMB to toggle the continuous mode." )
	if( clicked ) then
		play_sound( "button_generic" )
		gonna_update = true
		new_log( "[APPLIED]", true )
	end
	if( r_clicked ) then
		play_sound( "button_special" )
		new_log( "Continuous mode ["..( window_table[dimension][wid].extra.uniform_info[3] and "DIS" or "EN" ).."ABLED]" )
		window_table[dimension][wid].extra.uniform_info[3] = not( info.uniform_info[3] )
	end
	
	pic_y = pic_y + 11
	uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 120, wid.."back_path", info.back_info[1] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			window_table[dimension][wid].extra.back_info[1] = k_buffer
		end)
	end
	
	uid, r_clicked = new_input( gui, uid, pic_x + 121, pic_y, pic_z, 23, wid.."back_z", info.back_info[2], false, -20, true )
	if( r_clicked ) then
		inputter( function( k_buffer )
			window_table[dimension][wid].extra.back_info[2] = tonumber( k_buffer )
		end)
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 145, pic_y, pic_z, "mods/p2k/files/pics/key_confirm.png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Background Sprite Loader: PATH | Z-LEVEL", "LMB to load at the camera position." )
	if( clicked ) then
		play_sound( "button_generic" )
		new_log( "[LOADED]", true )
		LoadBackgroundSprite( info.back_info[1], cam_x, cam_y, info.back_info[2], false )
	end
	
	pic_y = pic_y + 11
	uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 144, wid.."path", info.file_info[1] )
	if( r_clicked ) then
		inputter( function( k_buffer )
			window_table[dimension][wid].extra.file_info[1] = k_buffer
		end)
	end
	
	uid, clicked, r_clicked = new_button( gui, uid, pic_x + 145, pic_y, pic_z, "mods/p2k/files/pics/key_confirm"..( gonna_execute and "_special" or "" )..".png" )
	uid = new_tooltip( gui, uid, ui_z - 200, "Lua Executer", "LMB to execute. @ RMB to toggle the continuous mode." )
	if( clicked ) then
		play_sound( "button_generic" )
		new_log( "[EXECUTED]", true )
		gonna_execute = true
	end
	if( r_clicked ) then
		play_sound( "button_special" )
		new_log( "Continuous mode ["..( window_table[dimension][wid].extra.file_info[2] and "DIS" or "EN" ).."ABLED]" )
		window_table[dimension][wid].extra.file_info[2] = not( info.file_info[2] )
	end
	
	pic_y = pic_y + 11
	uid, r_clicked = new_input( gui, uid, pic_x, pic_y, pic_z, 70, wid.."globals_name", info.globals_info )
	if( r_clicked ) then
		inputter( function( k_buffer )
			window_table[dimension][wid].extra.globals_info = k_buffer
		end)
	end
	
	uid, r_clicked = new_input( gui, uid, pic_x + 71, pic_y, pic_z, 84, wid.."globals_value", GlobalsGetValue( info.globals_info, "_" ))
	if( r_clicked ) then
		if( GlobalsGetValue( info.globals_info, "{<=@=>}" ) ~= "{<=@=>}" ) then
			play_sound( "confirm" )
			GlobalsSetValue( info.globals_info, keyboard_info[dimension][2]..keyboard_info[dimension][3] )
		else
			play_sound( "error" )
			new_log( "[ERROR] Incorrect ID!", true )
		end
		keyboard_info[dimension] = { "", "<>", "" }
	end
	
	if( gonna_update ) then
		GameSetPostFxParameter( info.uniform_info[1], info.uniform_info[2][1], info.uniform_info[2][2], info.uniform_info[2][3], info.uniform_info[2][4] )
	end
	if( gonna_execute ) then
		dofile( info.file_info[1] )
	end
	
	return uid
end

function ext_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	local t_x, t_y = pic_x, pic_y
	
	local page = window_table[dimension][wid].extra.page
	local ext_value = window_table[dimension][wid].extra.ext_value
	
	if( #extensions > 0 ) then
		t_x = t_x + 2
		for i = ( 9*page - 8 ), 9*page do
			if( i > #extensions ) then
				break
			end
			
			t_y = t_y + 11
			uid, window_table[dimension][wid].extra.ext_value[extensions[i].id] = extensions[i].custom_line( gui, uid, t_x, t_y, pic_z, wid, ext_value[extensions[i].id] )
		end
	end
	
	pic_x = pic_x + 136
	pic_y = pic_y + 88
	uid, page = new_pager( gui, uid, pic_x, pic_y, pic_z, page, math.ceil( #extensions/9 ))
	if( page ~= window_table[dimension][wid].extra.page ) then
		window_table[dimension][wid].extra.page = page
	end

	return uid
end

function help_window( gui, uid, pic_x, pic_y, pic_z, wid )
	local pic, clicked, r_clicked = 0, 0, 0
	
	pic_x = pic_x + 2
	pic_y = pic_y + 11
	new_text( gui, pic_x, pic_y, pic_z, liner( gui, help_tips[current_tip], 79, 54, 4 ), 2 )
	
	uid, clicked = new_button( gui, uid, pic_x, pic_y, pic_z - 0.01, "mods/p2k/files/pics/hitbox_help.png" )
	uid = new_tooltip( gui, uid, ui_z - 400, "LMB me", nil )
	if( clicked ) then
		play_sound( "button_special" )
		
		table.remove( help_tips, current_tip )
		if( #help_tips > 0 ) then
			SetRandomSeed( GameGetFrameNum(), m_x + cam_y + #help_tips )
			current_tip = Random( 1, #help_tips )
		else
			current_tip = 1
			help_tips = nil
		end
	end
	
	return uid
end