// ============================================================================================================
// p2k zoom stuff (overlays) ===========================================================================
	if( viewer_info[2] > 0.0 )
	{
		vec2 viewer_center = vec2( viewer_info.x*window_size.x, viewer_info.y*window_size.y + window_size.y );
		vec2 pointer_center = vec2( pointer_info.x*window_size.x, pointer_info.y*window_size.y + window_size.y );
		vec2 viewer_size = vec2( 79.5, 50 )*window_size/vec2( pointer_info[2], pointer_info[3] );
		vec2 viewer_frame = gl_FragCoord.xy - viewer_center.xy;
		if( viewer_frame.x > -viewer_size[0] && viewer_frame.x < viewer_size[0] && viewer_frame.y > -viewer_size[1] && viewer_frame.y < viewer_size[1] )
		{
			vec2 viewer_offset = ( viewer_center - pointer_center/viewer_info[2] )/window_size*viewer_info[2];
			vec2 new_coord = mat2( viewer_info[2], 0.0, 0.0, viewer_info[2] )*tex_coord;
			vec3 source_bg = texture2D( tex_bg, new_coord - viewer_offset ).rgb;
			vec4 source_fg = texture2D( tex_fg, new_coord - viewer_offset );
			source_fg.a = pow( source_fg.a, 0.5 );
			source_fg.rgb = source_fg.rgb*( 1.0/source_fg.a );
			source_fg.rgb = clamp( source_fg.rgb, vec3( 0.0, 0.0, 0.0 ), vec3( 1.0, 1.0, 1.0 ));
			if( !( viewer_info[3] > 0.0 ))
			{
				if( ENABLE_LIGHTING )
					source_fg.rgb *= lights;
				source_fg.rgb = mix( source_fg.rgb, fog_color_fg.rgb, fog_amount_fg*fog_amount_multiplier_final );
			}
			
			color = source_fg.rgb*source_fg.a + source_bg*( 1.0 - source_fg.a );
		}
	}
	
// ============================================================================================================
// additive overlay ===========================================================================================