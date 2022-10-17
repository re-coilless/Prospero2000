--[[ THE STUFF or how to do the fancy
Step 1: Make sure you ACTUALLY have the p2k folder in the Noita/mods directory. If not, either copy it from workshop folder and rename to "p2k" or get it from https://modworkshop.net/mod/37816.
Step 2: At least once launch the game with p2k legitimately enabled and make sure you can see a new set of options appear within vanilla mod settings. This is needed so the values p1k is gonna access have been generated properly.
Step 3: Launch the noita.exe (or just press that magic button in your Steam client) and start a New Game
Step 4: Save and quit, then locate your save directory and find the player.xml (there might not be one but there will be the player.salakieli; unfortunately, I have 0 clue yet about what determines exactly which version will be created but I know for sure that this method won't work in such case; you can theoretically just replace the save with one that has the .xml file but this was never tested)
Step 5: Place the text below anywhere in between the formatting blocks inside the player.xml. Save the changes.
	<LuaComponent 
		_enabled="1" 
		execute_every_n_frame="1" 
		script_source_file="mods/p2k/prospero1000.lua" 
	></LuaComponent>
Step 6: Launch the game and continue the run - you should immediately notice the Prospero's taskbar. Enjoy your totally fairly obtained Steam achievements/eyes/cauldrons.

Note: some features will be lost - there will be no zoom window, no custom resolution setup, no sounds, no custom font and no extensions(unless you are gonna copy the entirety of them in the extensions_p1k.lua).
]]

IS_1K_MODE = IS_1K_MODE or true

IS_MNEE = IS_MNEE or ( ModIsEnabled( "mnee" ) and not( IS_1K_MODE ))
if( IS_MNEE ) then
	ModLuaFileAppend( "mods/mnee/bindings.lua", "mods/p2k/mnee.lua" )
end

function table_init( amount, value )
	local tbl = {}
	local temp = value
	for i = 1,amount do
		if( type( value ) == "table" ) then
			temp = {}
		elseif( value == "keyboard" ) then
			temp = { "", "<>", "" }
		end
		tbl[i] = temp
	end
	
	return tbl
end

init_frame = init_frame or 0

window_table = window_table or table_init( 26, {})
performance_info = performance_info or 0
performance_table_last = performance_table_last or table_init( 26, {})
performance_table = performance_table or table_init( 26, {})
dimension = dimension or 1
window_count = window_count or table_init( 26, 0 )
active_window = active_window or table_init( 26, 0 )
workspace_sound = workspace_sound or true

grab_x = grab_x or table_init( 26, {})
grab_y = grab_y or table_init( 26, {})

main_window_opened = main_window_opened or table_init( 26, 0 )
manager_opened = manager_opened or table_init( 26, 0 )
ext_window_opened = ext_window_opened or table_init( 26, 0 )
help_opened = help_opened or table_init( 26, 0 )
flag_window_opened = flag_window_opened or table_init( 26, 0 )
teleboard_window_opened = teleboard_window_opened or table_init( 26, 0 )
camera_window_opened = camera_window_opened or table_init( 2, 0 )
zoom_window_opened = zoom_window_opened or table_init( 26, 0 )
zoom_target = zoom_target or table_init( 2, 0.5 )
keyboard_opened = keyboard_opened or table_init( 26, 0 )
keyboard_extra_opened = keyboard_extra_opened or table_init( 26, 0 )
clipboard_opened = clipboard_opened or table_init( 26, 0 )
keyboard_info = keyboard_info or table_init( 26, "keyboard" )
buffered_value = buffered_value or ""
ecs_window_opened = ecs_window_opened or table_init( 26, 0 )
ecs_info = ecs_info or table_init( 4, "" )
animaler_window_opened = animaler_window_opened or table_init( 26, 0 )
transform_window_opened = transform_window_opened or table_init( 26, 0 )
frame_window_opened = frame_window_opened or table_init( 26, 0 )
fps_timer = fps_timer or table_init( 5, 0 )
fps_dropper = fps_dropper or table_init( 4, 0 )

captured_entity = captured_entity or 0
script_online = script_online or table_init( 3, false )

controls_lock = controls_lock or 0
current_tip = current_tip or 1

function add_window( wnd, index, with_sound, is_passive )
	if( window_count[dimension] > 25 or index == nil ) then
		play_sound( "error" )
		GamePrint( "[ERROR] Window Limit Exceeded!" )
		print( "[ERROR] Window Limit Exceeded!" )
	else
		if(( with_sound == nil and true or with_sound ) and workspace_sound ) then
			play_sound( "open_window" )
		end
		window_table[dimension][index] = wnd
		window_count[dimension] = window_count[dimension] + 1
		if( not( is_passive or false )) then
			active_window[dimension] = index
		end
	end
end

function remove_window( index, with_sound )
	if( active_window[dimension] == index ) then
		active_window[dimension] = 0
	end
	if( string.sub( keyboard_info[dimension][1], 1, 1 ) == index ) then
		keyboard_info[dimension] = { "", "<>", "" }
	end
	
	if( main_window_opened[dimension] == index ) then
		main_window_opened[dimension] = 0
	elseif( keyboard_opened[dimension] == index ) then
		keyboard_opened[dimension] = 0
		keyboard_info[dimension] = { "", "<>", "" }
	elseif( keyboard_extra_opened[dimension] == index ) then
		keyboard_extra_opened[dimension] = 0
	elseif( clipboard_opened[dimension] == index ) then
		clipboard_opened[dimension] = 0
	elseif( ecs_window_opened[dimension] == index ) then
		ecs_window_opened[dimension] = 0
	elseif( animaler_window_opened[dimension] == index ) then
		animaler_window_opened[dimension] = 0
	elseif( transform_window_opened[dimension] == index ) then
		transform_window_opened[dimension] = 0
	elseif( frame_window_opened[dimension] == index ) then
		frame_window_opened[dimension] = 0
	elseif( flag_window_opened[dimension] == index ) then
		flag_window_opened[dimension] = 0
	elseif( teleboard_window_opened[dimension] == index ) then
		teleboard_window_opened[dimension] = 0
	elseif( camera_window_opened[2] == index and camera_window_opened[1] == dimension ) then
		camera_window_opened = { 0, 0, }
	elseif( zoom_window_opened[dimension] == index ) then
		zoom_window_opened[dimension] = 0
	elseif( manager_opened[dimension] == index ) then
		manager_opened[dimension] = 0
	elseif( ext_window_opened[dimension] == index ) then
		ext_window_opened[dimension] = 0
	elseif( help_opened[dimension] == index ) then
		help_opened[dimension] = 0
	end
	
	if( window_table[dimension][index] == nil ) then
		new_log( "[ERROR] Kinda Weird", true )
		return
	end
	
	if( with_sound == nil and true or with_sound ) then
		play_sound( "close_window" )
	end
	
	local subwindows = window_table[dimension][index].children
	if( #subwindows > 0 ) then
		for e,child in ipairs( subwindows ) do
			remove_window( child, false )
		end
	end
	
	local parent = window_table[dimension][index].parent
	if( parent ~= 0 ) then
		local children = window_table[dimension][parent].children
		for e,child in ipairs( children ) do
			if( child == index ) then
				table.remove( children, e )
			end
		end
	end
	
	if( window_table[dimension][index].extra.close_action ~= nil ) then
		window_table[dimension][index].extra.close_action()
	end
	
	window_count[dimension] = window_count[dimension] - 1
	window_table[dimension][index] = nil
	grab_x[dimension][index] = nil
	grab_y[dimension][index] = nil
end

function kill_gui( gui )
	if( gui ~= nil ) then
		GameSetPostFxParameter( "viewer_info", 0, 0, 0, 0 )
		GameSetPostFxParameter( "pointer_info", 0, 0, 0, 0 )
		GuiDestroy( gui )
	end
end

if( P1K_init == nil ) then
	dofile_once( "mods/p2k/files/scripts/generic_lib.lua" )
	
	init_frame = GameGetFrameNum()
	
	P1K_init = true
end

--main stuff
local frame_num = GameGetFrameNum()
local hooman = 0

performance_table = table_init( 26, {})
fps_dropper[2] = GameGetRealWorldTimeSinceStarted()*1000
ui_z = tonumber( ModSettingGetNextValue( "p2k.UI_Z" ))
transform_editor = ModSettingGetNextValue( "p2k.TRANSFORMER" )
tooltip_opened = false
sound_played = false
drag_uid = 990
if( fps_dropper[3] == 0 ) then
	fps_dropper[3] = 30
end
if( camera_window_opened[2] == 0 ) then
	free_cam( false )
end

if( not( GameIsInventoryOpen())) then
	m_x, m_y = DEBUG_GetMouseWorld()
	cam_x, cam_y = GameGetCameraPos()
	
	dofile( "mods/p2k/files/scripts/generic_lib.lua" )
	dofile( "mods/p2k/files/scripts/window_lib.lua" )
	dofile( "mods/p2k/files/scripts/extensions_p1k.lua" )
	
	hooman = get_player() or 0
	
	--mnee
	if( IS_MNEE ) then
		dofile( "mods/mnee/lib.lua" )
		
		if( new_mnee( false, "aa_global_toggle" )) then
			play_sound( "switch_dimension" )
			local value = ModSettingGetNextValue( "p2k.P2K_ENABLED" )
			ModSettingSetNextValue( "p2k.P2K_ENABLED", not( value ), false )
			new_log( "[P2K "..( value and "DIS" or "EN" ).."ABLED]", true )
		end
		if( new_mnee( false, "ab_taskbar_shift" )) then
			play_sound( "switch_dimension" )
			local value = ModSettingGetNextValue( "p2k.TASKBAR_POS" ) + 1
			ModSettingSetNextValue( "p2k.TASKBAR_POS", value > 2 and 1 or value, false )
		end
		if( new_mnee( false, "ac_fps_lock" )) then
			play_sound( "button_special" )
			fps_dropper[4] = fps_dropper[4] > 0 and 0 or 1
		end
		if( new_mnee( false, "ad_show_pointer" )) then
			play_sound( "button_special" )
			local value = ModSettingGetNextValue( "p2k.SHOW_POINTER" )
			ModSettingSetNextValue( "p2k.SHOW_POINTER", not( value ), false )
		end
		if( new_mnee( false, "ae_show_camera" )) then
			play_sound( "button_special" )
			local value = ModSettingGetNextValue( "p2k.SHOW_CAMERA" )
			ModSettingSetNextValue( "p2k.SHOW_CAMERA", not( value ), false )
		end
		if( new_mnee( false, "af_mute_logs" )) then
			play_sound( "button_special" )
			local value = ModSettingGetNextValue( "p2k.MUTE_LOGS" )
			ModSettingSetNextValue( "p2k.MUTE_LOGS", not( value ), false )
			new_log( "Console logging ["..( value and "EN" or "DIS" ).."ABLED]", true )
		end
		if( new_mnee( false, "ag_hide_trans" )) then
			play_sound( "button_special" )
			ModSettingSetNextValue( "p2k.TRANSFORMER", not( transform_editor ), false )
			new_log( "Transformer Gizmo ["..( transform_editor and "DIS" or "EN" ).."ABLED]", true )
		end
		if( new_mnee( false, "ah_trans_window" )) then
			if( transform_window_opened[dimension] ~= 0 ) then
				remove_window( transform_window_opened[dimension] )
			else
				if( captured_entity == 0 ) then
					new_log( "[WARNING] This window requires a captured target to work." )
				end
				create_transform_window({new_spawn()}, ui_z )
			end
		end
		if( new_mnee( false, "ai_text_mode" )) then
			play_sound( "button_special" )
			local value = ModSettingGetNextValue( "p2k.END_DISPLAY" )
			ModSettingSetNextValue( "p2k.END_DISPLAY", not( value ), false )
			new_log( "Text is displayed from the "..( value and "[START]" or "[END]" ), true )
		end
		
		local next_dim = dimension
		if( new_mnee( false, "ca_next_dim" )) then
			play_sound( "switch_dimension" )
			next_dim = dimension + 1
			next_dim = next_dim > 26 and 1 or next_dim
		elseif( new_mnee( false, "cb_previous_dim" )) then
			play_sound( "switch_dimension" )
			next_dim = next_dim - 1
			next_dim = next_dim < 1 and 26 or next_dim
		end
		if( next_dim ~= dimension ) then
			for i,wnd in magic_sorter( window_table[dimension] ) do
				if( wnd ~= nil and wnd.extra.drift_action ~= nil ) then
					wnd.extra.drift_action()
				end
			end
			dimension = next_dim
		end
		
		if( new_mnee( false, "df_nuke" )) then
			play_sound( "clear_all" )
			local deadmen = EntityGetInRadius( cam_x, cam_y, 999999999 ) or {}
			if( #deadmen > 0 ) then
				for i,deadman in ipairs( deadmen ) do
					local actual_deadman = EntityGetRootEntity( deadman )
					if( EntityGetIsAlive( actual_deadman ) and actual_deadman ~= hooman and actual_deadman ~= GameGetWorldStateEntity()) then
						EntityKill( actual_deadman )
					end
				end
			end
			new_log( "[GROOVY!]" )
		end
	end
	
	if( ModSettingGetNextValue( "p2k.P2K_ENABLED" )) then
		if( gui == nil ) then
			gui = GuiCreate()
		end
		GuiStartFrame( gui )
		
		local w, h = GuiGetScreenDimensions( gui )
		
		local clicked, r_clicked, hovered, pic_x, pic_y, pic_z = 0, 0, 0, 0, 0, 0
		local closed, minimized, deleted = false, false, false
		local pic, pic_w, pic_h = 0, 0, 0
		local uid = 0
		
		if( help_tips == nil ) then
			help_tips = help_tips or {
				"This mod can easily ruin/crash/wipe the game if used carelessly - you were warned.",
				"Any window can be dragged via the top bar.",
				"Any window can be closed via the most right top button.",
				"Any window can be minimized via the second most right top button.",
				"Any entity can be captured at any time via the selected button scheme ([kick] by default).",
				"You [MUST] check mod settings for additional options.",
				"All the irreversible button-bound actions are RMB only.",
			}
			
			if( IS_MNEE ) then
				local mnee_tips = {
					"You can check M-Néé bindings by opening its main menu ([l_ctrl + m] by default).",
					"Hold [l_alt] to display extra tooltip information even if tutorial mode is disabled.",
					"Hold [l_ctrl] while selecting the text input field to disable all non-P2K keyboard inputs.",
					"Use [l_shift] as Caps Lock to switch between lower/upper cases.",
					"Use [return] to confirm the inputted text.",
					"Use [down_arrow] @ to cancel the text input once it has been initiated.",
				}
				for i,tip in ipairs( mnee_tips ) do
					table.insert( help_tips, tip )
				end
			end
		end
		
		--pointer highlighter
		if( ModSettingGetNextValue( "p2k.SHOW_POINTER" )) then
			GameCreateSpriteForXFrames( "mods/p2k/files/pics/pointer_dot.png", m_x, m_y, true, 0, 0, 2, false )
		end
		
		--camera highlighter
		if( ModSettingGetNextValue( "p2k.SHOW_CAMERA" )) then
			GameCreateSpriteForXFrames( "mods/p2k/files/pics/dot_red.png", cam_x, cam_y, true, 0, 0, 2, false )
		end
		
		--capturing
		if( not( EntityGetIsAlive( ctrl_body or 0 ))) then
			ctrl_body = EntityLoad( "mods/p2k/files/scripts/control_body.xml", m_x, m_y )
		end
		if( ctrl_body ~= nil ) then
			local ctrl_comp = EntityGetFirstComponentIncludingDisabled( ctrl_body, "ControlsComponent" )
			local button = ModSettingGetNextValue( "p2k.CAPTURE_BUTTON" )
			if( button == 1 ) then
				button = ComponentGetValue2( ctrl_comp, "mButtonDownRightClick" )
			elseif( button == 2 ) then
				button = ComponentGetValue2( ctrl_comp, "mButtonDownDown" ) and ComponentGetValue2( ctrl_comp, "mButtonDownInteract" )
			else
				button = ComponentGetValue2( ctrl_comp, "mButtonDownKick" )
			end
			if( new_mnee( button, "da_capture" )) then
				if( not( capture_activated )) then
					local targets = EntityGetInRadius( m_x, m_y, ModSettingGetNextValue( "p2k.CAPTURE_RADIUS" )) or {}
					local target_entity = 0
					if( #targets > 0 ) then
						local min_dist = -1
						for i,dud in ipairs( targets ) do
							if( EntityGetName( dud ) ~= "ctrl_body" ) then
								local t_x, t_y = EntityGetTransform( dud )
								local t_dist = math.sqrt(( m_x - t_x )^2 + ( m_y - t_y )^2 )
								if( min_dist == -1 or t_dist < min_dist ) then
									min_dist = t_dist
									target_entity = EntityGetRootEntity( dud )
								end
							end
						end
					end
					if( target_entity ~= 0 ) then
						if( EntityGetRootEntity( captured_entity ) == target_entity ) then
							create_entity_window({new_spawn()}, ui_z, captured_entity )
						else
							play_sound( "capture" )
							new_log( "[TARGET "..tostring( target_entity ).." CAPTURED]" )
							captured_entity = target_entity
						end
					else
						play_sound( "uncapture" )
						new_log( captured_entity == 0 and "[NONE DETECTED]" or "[TARGET "..tostring( captured_entity ).." RELEASED]" )
						captured_entity = 0
					end
				end
				capture_activated = true
			else
				capture_activated = false
			end
		end
		if( captured_entity ~= 0 ) then
			if( EntityGetIsAlive( captured_entity )) then
				local captured_x, captured_y = EntityGetTransform( captured_entity )
				uid, captured_x, captured_y = new_pointer( gui, uid, w, h, ui_z - 210, captured_x, captured_y )
				new_connector( w/2, h/2, ui_z + 1, 1, captured_x, captured_y )
				if( transform_editor ) then
					uid = new_transformer( gui, uid, w, h, -1, captured_x, captured_y )
				end
				
				if( IS_MNEE ) then
					if( new_mnee( false, "db_open" )) then
						create_entity_window({new_spawn()}, ui_z, captured_entity )
					end
					if( new_mnee( false, "dc_uncapture" )) then
						play_sound( "uncapture" )
						captured_entity = 0
					end
					if( new_mnee( false, "de_delete_target" )) then
						play_sound( "delete" )
						new_log( "[TARGET "..tostring( captured_entity ).." TERMINATED]" )
						EntityKill( captured_entity )
						captured_entity = 0
					end
				end
			else
				captured_entity = 0
			end
		end
		if( new_mnee_down_binding( ModSettingGetNextValue( "p2k.SHOW_ENTITIES" ), "bd_entity_radar" )) then
			dofile( "mods/p2k/files/scripts/entity_highlighter.lua" )
		end
		
		--taskbar
		local compact_mode = ModSettingGetNextValue( "p2k.COMPACT_MODE" )
		pic = "mods/p2k/files/pics/key_logo_"..( compact_mode and "B" or "A" )..".png"
		pic_w, pic_h = GuiGetImageDimensions( gui, pic, 1 )
		if( ModSettingGetNextValue( "p2k.TASKBAR_POS" ) == 1 ) then
			pic_y = h - pic_h
		end
		uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, ui_z, pic )
		uid = new_tooltip( gui, uid, ui_z - 200, "P2K", "LMB to open the Main Window. @ LMB again to set up the workspace. @ RMB to close all the windows. @ RMB again to toggle compact mode.", true )
		if( new_mnee( clicked, "ba_open_main" )) then
			if( main_window_opened[dimension] == 0 ) then
				create_main_window({w - 155, h - 56}, ui_z )
			else
				play_sound( "open_main" )
				workspace_sound = false
				if( ecs_window_opened[dimension] == 0 ) then
					create_ecs_window({w - 84, h - 181}, ui_z )
				end
				if( transform_window_opened[dimension] == 0 ) then
					create_transform_window({w - 84, h - 124}, ui_z )
				end
				if( frame_window_opened[dimension] == 0 ) then
					create_frame_window({w - 155, h - 91}, ui_z )
				end
				if( keyboard_opened[dimension] == 0 ) then
					create_keyboard({w - 352, h - 56}, ui_z )
				end
				if( animaler_window_opened[dimension] == 0 ) then
					create_animaler_window({w - 479, h - 45}, ui_z )
				end
				if( camera_window_opened[2] == 0 ) then
					create_camera_window({1, h - 34}, ui_z )
				end
				if( zoom_window_opened[dimension] == 0 ) then
					create_zoom_window({1, h - 159}, ui_z )
				end
				workspace_sound = true
			end
		end
		if( new_mnee( false, "bb_stealth_main" )) then
			if( main_window_opened[dimension] == 0 ) then
				create_main_window({ -151, -42 }, ui_z )
			else
				play_sound( "error" )
				new_log( "[ERROR] Main window is already present!", true )
			end
		end
		if( new_mnee( r_clicked, "bc_compact_close" )) then
			if( window_count[dimension] > 0 ) then
				play_sound( "clear_all" )
				new_log( "[DIMENSIONAL RESET]", true )
				for i,wnd in magic_sorter( window_table[dimension]) do
					if( wnd ~= nil ) then
						remove_window( i, false )
					end
				end
			else
				play_sound( "switch_dimension" )
				new_log( "Taskbar mode: "..( compact_mode and "[EXTENDED]" or "[COMPACT]" ))
				ModSettingSetNextValue( "p2k.COMPACT_MODE", not( compact_mode ), false )
			end
			window_table[dimension] = {}
		end
		
		if( not( compact_mode )) then
			pic = "mods/p2k/files/pics/module_mid_A.png"
			pic_x = pic_x + pic_w
			uid = new_image( gui, uid, pic_x, pic_y, ui_z, pic, w - pic_w*2, 1 )
			
			pic_x = w - pic_w
			local is_tutorial = ModSettingGetNextValue( "p2k.TUTORIAL_MODE" )
			uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, ui_z, "mods/p2k/files/pics/key_help"..( is_tutorial and "" or "_dark" )..".png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Help", "LMB to open tip window. @ RMB to disable the tutorial mode.", true )
			if( clicked ) then
				if( help_opened[dimension] ~= 0 ) then
					remove_window( help_opened[dimension] )
				else
					create_help_window({181, 21}, ui_z - 220 )
				end
			end
			if( r_clicked ) then
				play_sound( "button_special" )
				new_log( "Tooltip mode: "..( is_tutorial and "[CLEAN]" or "[DETAILED]" ))
				ModSettingSetNextValue( "p2k.TUTORIAL_MODE", not( is_tutorial ), false )
			end
			
			pic_x = pic_x - 11
			uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, ui_z - 0.01, "mods/p2k/files/pics/key_manager.png" )
			uid = new_tooltip( gui, uid, ui_z - 200, "Manager", "LMB to open the Task Manager.", true )
			if( clicked ) then
				if( manager_opened[dimension] ~= 0 ) then
					remove_window( manager_opened[dimension] )
				else
					create_manager_window({new_spawn()}, ui_z )
				end
			end
			
			pic_x = pic_x - 33
			uid, pic_x = new_pager( gui, uid, pic_x, pic_y, ui_z - 0.01, dimension, 26, true )
			if( pic_x ~= dimension ) then
				for i,wnd in magic_sorter( window_table[dimension] ) do
					if( wnd ~= nil and wnd.extra.drift_action ~= nil ) then
						wnd.extra.drift_action()
					end
				end
				dimension = pic_x
			end
		end
		
		--window handling
		pic_x = 0
		to_delete = {}
		if( window_count[dimension] > 0 ) then
			--active switch
			if( new_mnee( false, "cc_next_window" )) then
				play_sound( "switch_page" )
				active_switch( true )
			elseif( new_mnee( false, "cd_previous_window" )) then
				play_sound( "switch_page" )
				active_switch( false )
			end
			
			--windows
			for i,wnd in render_sorter( window_table[dimension], active_window[dimension] ) do
				if( wnd ~= nil ) then
					local mini_old = wnd.minimized
					if( not( wnd.minimized )) then
						performance_table[dimension][i] = GameGetRealWorldTimeSinceStarted()*1000
						uid, wnd.w_x, wnd.w_y, closed, wnd.minimized, deleted = new_window( gui, uid, wnd.w_x, wnd.w_y, wnd.w_z, i.."::"..wnd.title, i, wnd.style, wnd.extra )
						performance_table[dimension][i] = GameGetRealWorldTimeSinceStarted()*1000 - performance_table[dimension][i]
					end
					if( wnd.minimized and mini_old ~= wnd.minimized and wnd.extra.minimize_action ~= nil ) then
						wnd.extra.minimize_action()
					end
					if( closed or deleted ) then
						table.insert( to_delete, { i, deleted })
					end
				end
			end
			
			--taskbar
			if( not( compact_mode )) then
				for i,wnd in magic_sorter( window_table[dimension] ) do
					if( wnd ~= nil ) then
						pic_x = pic_x + 11
						local style = ( active_window[dimension] == i ) and 3 or 2
						pic = "mods/p2k/files/pics/button_10_B.png"
						if( wnd.minimized ) then
							style = 1
							pic = "mods/p2k/files/pics/button_10_A.png"
						end
						uid, clicked, r_clicked = new_button( gui, uid, pic_x, pic_y, ui_z - 0.01, pic )
						uid = new_tooltip( gui, uid, ui_z - 200, wnd.title, "LMB to "..( wnd.minimize and "un" or "" ).."minimize the window. @ RMB to close the window.", true )
						new_text( gui, pic_x + 2, pic_y, ui_z - 0.02, tostring( i ), style )
						local mini_old = wnd.minimized
						if( clicked ) then
							local yep = true
							if( wnd.minimized ) then
								play_sound( "minimize" )
								active_window[dimension] = i
							else
								if( active_window[dimension] == i ) then
									play_sound( "unminimize" )
									active_window[dimension] = 0
								else
									play_sound( "button_special" )
									yep = false
									active_window[dimension] = i
								end
							end
							if( yep ) then
								wnd.minimized = not( wnd.minimized )
								local subwindows = wnd.children
								if( #subwindows > 0 ) then
									for e,child in ipairs( subwindows ) do
										window_table[dimension][child].minimized = wnd.minimized
									end
								end
							end
						end
						if( r_clicked ) then
							table.insert( to_delete, { i, deleted })
						end
						if( wnd.minimized and mini_old ~= wnd.minimized and wnd.extra.minimize_action ~= nil ) then
							wnd.extra.minimize_action()
						end
					end
				end
			end
			
			for i,dlt in ipairs( to_delete ) do
				local tmp = dlt[3] or dimension
				if( dlt[2] ) then
					play_sound( "delete" )
					window_table[tmp][dlt[1]].extra.delete_action( window_table[tmp][dlt[1]].extra )
				end
				
				local dim = dimension
				dimension = tmp
				remove_window( dlt[1], dlt[4] ~= false )
				dimension = dim
			end
		end
		
		--custom scripts
		for i = 1,3 do
			if( new_mnee( false, "fb_script_"..i.."_cont" )) then
				script_online[i] = not( script_online[i] )
			end
			
			if( new_mnee( script_online[i], "fa_script_"..i )) then
				dofile( "data/p2k_custom/custom_script_"..tostring( i )..".lua" )
			end
		end
	else
		gui = kill_gui( gui )
	end
else
	gui = kill_gui( gui )
end

if( hooman ~= 0 ) then
	local controls = EntityGetFirstComponentIncludingDisabled( hooman, "ControlsComponent" )
	local ctrl_active = ComponentGetValue2( controls, "enabled" )
	if( controls_lock == 1 ) then
		if( ctrl_active ) then
			ComponentSetValue2( controls, "enabled", false )
		end
	elseif(( controls_lock ~= 0 ) or ( frame_num - init_frame < 10 )) then
		controls_lock = 0
		if( not( ctrl_active )) then
			ComponentSetValue2( controls, "enabled", true )
		end
	end
end

local target_fps = 1000/fps_dropper[3]
if( fps_dropper[1] > 0 ) then
	if( fps_dropper[4] > 0 ) then
		while( fps_dropper[2] - fps_dropper[1] < target_fps ) do
			fps_dropper[2] = GameGetRealWorldTimeSinceStarted()*1000
		end
	end
	
	local update_delay = ModSettingGetNextValue( "p2k.FPS_UPDATE_RATE" )
	if( update_delay == 0 or frame_num%update_delay == 0 ) then
		performance_info = fps_dropper[2] - fps_dropper[1]
		
		for i = 1,26 do
			for e,tm in magic_sorter( performance_table[i] ) do
				if( tm ~= nil ) then
					performance_table_last[i][e] = tm
				end
			end
		end
	end
end

fps_dropper[1] = fps_dropper[2]