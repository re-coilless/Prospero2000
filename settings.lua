dofile( "data/scripts/lib/mod_settings.lua" )

function mod_setting_custom_enum( mod_id, gui, in_main_menu, im_id, setting )
	local value = ModSettingGetNextValue( mod_setting_get_id( mod_id, setting ))
	local text = setting.ui_name .. ": " .. setting.values[ value ]
	
	local clicked,right_clicked = GuiButton( gui, im_id, mod_setting_group_x_offset, 0, text )
	if clicked then
		value = value + 1
		if( value > #setting.values ) then
			value = 1
		end
		ModSettingSetNextValue( mod_setting_get_id( mod_id,setting ), value, false )
	end
	if right_clicked and setting.value_default then
		ModSettingSetNextValue( mod_setting_get_id( mod_id, setting ), setting.value_default, false )
	end

	mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
end

local mod_id = "p2k"
mod_settings_version = 1
mod_settings = 
{
	{
		category_id = "GLOBAL",
		ui_name = "[GLOBAL]",
		ui_description = "Should be pretty important.",
		foldable = true,
		_folded = false,
		not_setting = true,
		settings = {
			{
				id = "P2K_ENABLED",
				ui_name = "Enable Prospero2000",
				ui_description = "Toggles all of the mod's functionality.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "TRANSFORMER",
				ui_name = "Enable Transform Gizmo",
				ui_description = "Allows you to quickly modify captured entity's position, rotation and scale.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "TASKBAR_POS",
				ui_name = "Taskbar Position",
				ui_description = "",
				hidden = false,
				value_default = 1,
				values = { "Bottom", "Top" },
				scope = MOD_SETTING_SCOPE_RUNTIME,
				ui_fn = mod_setting_custom_enum,
			},
			{
				id = "COMPACT_MODE",
				ui_name = "Compact Taskbar",
				ui_description = "Leaves only the P2K button visible.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "USE_CUSTOM_RES",
				ui_name = "Use Custom Resolution",
				ui_description = "You can specify the dimensions in the Camera Controller window.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "CAPTURE_BUTTON",
				ui_name = "Capture Button",
				ui_description = "Use this to capture any entity in the world.",
				hidden = false,
				value_default = 3,
				values = { "RMB", "USE + DOWN", "KICK", "NONE (M-Néé is required)", },
				scope = MOD_SETTING_SCOPE_RUNTIME,
				ui_fn = mod_setting_custom_enum,
			},
			{
				id = "CAPTURE_RADIUS",
				ui_name = "Capture Search Radius",
				ui_description = "Larger radius might make it easier to target an entity.",
				value_default = 15,
				value_min = 5,
				value_max = 50,
				value_display_multiplier = 1,
				value_display_formatting = " $0 ",
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
		},
	},
	
	{
		category_id = "UI",
		ui_name = "[INTERFACE]",
		ui_description = "Reduce UI clutter.",
		foldable = true,
		_folded = true,
		not_setting = true,
		settings = {
			{
				id = "TUTORIAL_MODE",
				ui_name = "Tutorial Mode",
				ui_description = "Tooltips contain extra information.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "DONT_CARE",
				ui_name = "\"Who Cares\" Mode",
				ui_description = "Hides all of the non-essential tooltips.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "MUTE_LOGS",
				ui_name = "Disable Console Logging",
				ui_description = "Disables all of the non-esential logging to in-game console.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "SHOW_POINTER",
				ui_name = "Show Pointer Position",
				ui_description = "Marker is a multicolored cross-like formation.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "SHOW_CAMERA",
				ui_name = "Show Camera Position",
				ui_description = "Marker is a single red dot.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "SHOW_ENTITIES",
				ui_name = "Enable Entity Radar",
				ui_description = "",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "SHOW_NUMBERS",
				ui_name = "Show Entity IDs on Entity Radar",
				ui_description = "",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
		},
	},
	
	{
		category_id = "PERSONALIZATION",
		ui_name = "[PERSONALIZATION]",
		ui_description = "Do the fancy.",
		foldable = true,
		_folded = true,
		not_setting = true,
		settings = {
			{
				id = "SILENT_BOOT",
				ui_name = "Silent Bootup",
				ui_description = "Mutes the startup sound.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "TEXT_POINTER",
				ui_name = "Text Pointer Style",
				ui_description = "",
				hidden = false,
				value_default = 1,
				values = { "<", "[", "=", },
				scope = MOD_SETTING_SCOPE_RUNTIME,
				ui_fn = mod_setting_custom_enum,
			},
			{
				id = "KEYSWITCH_TYPE",
				ui_name = "Keyswitch Typing Sound",
				ui_description = "May or may not be true-to-life and otherwise accurate.",
				hidden = false,
				value_default = 6,
				values = { "Divine Violet", "Cherry MX Black", "Cherry MX Blue", "Cherry MX Brown", "Cherry MX Red", "Everglide Crystal Purple", "Everglide Oreo", "Topre Purple Hybrid", },
				scope = MOD_SETTING_SCOPE_RUNTIME,
				ui_fn = mod_setting_custom_enum,
			},
		},
	},
	
	{
		category_id = "COMPATIBILITY",
		ui_name = "[COMPATIBILITY]",
		ui_description = "Some mods might not tolerate core system overrides.",
		foldable = true,
		_folded = true,
		not_setting = true,
		settings = {
			{
				id = "NO_MAGIC",
				ui_name = "Never Override Magic Numbers",
				ui_description = "Also disables all the features that rely on them.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "NO_SHADER_STUFF",
				ui_name = "Never Apply Custom Shaders",
				ui_description = "Also disables all the features that rely on them.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "NO_FONT",
				ui_name = "Never Override Font",
				ui_description = "Some of the vanilla characters are not displayed properly unless were edited.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "UI_Z",
				ui_name = "UI Z-Level",
				ui_description = "Higher values correspond to \"lower\" layers.",
				value_default = "-5",
				text_max_length = 5,
				allowed_characters = "-0123456789.",
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
		},
	},
	
	{
		category_id = "PERFORMANCE",
		ui_name = "[PERFORMANCE]",
		ui_description = "Frames have feelings too.",
		foldable = true,
		_folded = true,
		not_setting = true,
		settings = {
			{
				id = "FPS_UPDATE_RATE",
				ui_name = "Timings Update Delay",
				ui_description = "Controls how often all the time-related debug values update.",
				value_default = 30,
				value_min = 0,
				value_max = 30,
				value_display_multiplier = 1,
				value_display_formatting = " $0 ",
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
		},
	},
	
	{
		category_id = "MNEE",
		ui_name = "[M-NÉÉ]",
		ui_description = "Requires M-Néé to be installed. You can check the link in the P2K's description.",
		foldable = true,
		_folded = true,
		not_setting = true,
		settings = {
			{
				id = "MNEE_DISABLE",
				ui_name = "Disable M-Néé Integration",
				ui_description = "No custom bindings will be active even if the M-Néé itself is present.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "MNEE_VIP",
				ui_name = "Force VIP mode for M-Néé binds",
				ui_description = "P2K-specific bindings will be active even if all the other custom inputs were disabled.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "MNEE_MUTE",
				ui_name = "Mute Keyboard if M-Néé is active",
				ui_description = "Includes only typing sounds.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
			{
				id = "MNEE_REBINDING",
				ui_name = "Allow Keyboard Rebinding",
				ui_description = "Will make all the fundamental keyboard keys editable within mnee's new \"p2k_kbd\" tab.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_NEW_GAME,
			},
			{
				id = "MNEE_CLEANSING",
				ui_name = "Disable all non-P2K controls while inputting the text",
				ui_description = "Hold [LEFT-CTRL] while selecting the field for that.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME,
			},
		},
	},
	
	--hidden stuff
	{
		id = "CAMERA_MODE",
		ui_name = "Camera Mode",
		ui_description = "",
		hidden = true,
		value_default = 1,
		values = { "Vanilla", "Follow Entity", "Free", "Locked", },
		scope = MOD_SETTING_SCOPE_RUNTIME,
		ui_fn = mod_setting_custom_enum,
	},
	{
		id = "ZOOM_MODE",
		ui_name = "Zoom Mode",
		ui_description = "",
		hidden = true,
		value_default = 2,
		values = { "Lense", "TV", "Pointer", },
		scope = MOD_SETTING_SCOPE_RUNTIME,
		ui_fn = mod_setting_custom_enum,
	},
	{
		id = "ZOOM_RAW",
		ui_name = "Zoom Raw",
		ui_description = "",
		hidden = true,
		value_default = true,
		scope = MOD_SETTING_SCOPE_RUNTIME,
	},
	{
		id = "ZOOM_SCALE",
		ui_name = "Zoom Scale",
		ui_description = "",
		hidden = true,
		value_default = "1",
		text_max_length = 10,
		scope = MOD_SETTING_SCOPE_RUNTIME,
	},
	{
		id = "CUSTOM_RES",
		ui_name = "Custom Resolution",
		ui_description = "",
		hidden = true,
		value_default = "|800|450|",
		text_max_length = 100000,
		scope = MOD_SETTING_SCOPE_RUNTIME,
	},
	{
		id = "END_DISPLAY",
		ui_name = "Display Values From the End",
		ui_description = "",
		hidden = true,
		value_default = true,
		scope = MOD_SETTING_SCOPE_RUNTIME,
	},
	{
		id = "CLIPBOARD_INFO",
		ui_name = "Clipboard Info",
		ui_description = "",
		hidden = true,
		value_default = "|",
		text_max_length = 100000,
		scope = MOD_SETTING_SCOPE_RUNTIME,
	},
	{
		id = "TELEBOARD_INFO",
		ui_name = "Teleboard Info",
		ui_description = "",
		hidden = true,
		value_default = "|",
		text_max_length = 100000,
		scope = MOD_SETTING_SCOPE_RUNTIME,
	},
	{
		id = "SETTINGS_INFO",
		ui_name = "Settings Info",
		ui_description = "",
		hidden = true,
		value_default = "|",
		text_max_length = 100000,
		scope = MOD_SETTING_SCOPE_RUNTIME,
	},
	{
		id = "EXTENSION_INFO",
		ui_name = "Extension Info",
		ui_description = "",
		hidden = true,
		value_default = "|_|_|_|",
		text_max_length = 100000,
		scope = MOD_SETTING_SCOPE_RUNTIME,
	},
}

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id )
	mod_settings_update(mod_id, mod_settings, init_scope)
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end