require( "ui.uieditor.widgets.BorderBakedSolid" )

CoD.CodCasterFakeMap = InheritFrom( LUI.UIElement )
CoD.CodCasterFakeMap.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterFakeMap )
	self.id = "CodCasterFakeMap"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 527 )
	self:setTopBottom( true, false, 0, 602 )
	
	local Border = CoD.BorderBakedSolid.new( menu, controller )
	Border:setLeftRight( true, false, 0, 527 )
	Border:setTopBottom( true, false, 124, 458 )
	self:addElement( Border )
	self.Border = Border
	
	local Map = LUI.UIImage.new()
	Map:setLeftRight( true, false, 0, 527 )
	Map:setTopBottom( true, false, 0, 602 )
	Map:setImage( RegisterImage( "uie_hud_t7_minimap_mp_sector_clean_full" ) )
	self:addElement( Map )
	self.Map = Map
	
	local ObjA = LUI.UIImage.new()
	ObjA:setLeftRight( true, false, 98.5, 130.5 )
	ObjA:setTopBottom( true, false, 287, 319 )
	ObjA:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_new_a_mini" ) )
	ObjA:subscribeToGlobalModel( controller, "TeamIdentity", "team1.teamColor", function ( model )
		local team1TeamColor = Engine.GetModelValue( model )
		if team1TeamColor then
			ObjA:setRGB( team1TeamColor )
		end
	end )
	self:addElement( ObjA )
	self.ObjA = ObjA
	
	local ObjB = LUI.UIImage.new()
	ObjB:setLeftRight( true, false, 241.5, 273.5 )
	ObjB:setTopBottom( true, false, 269, 301 )
	ObjB:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_new_b_mini" ) )
	self:addElement( ObjB )
	self.ObjB = ObjB
	
	local ObjC = LUI.UIImage.new()
	ObjC:setLeftRight( true, false, 377.5, 409.5 )
	ObjC:setTopBottom( true, false, 250.5, 282.5 )
	ObjC:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_new_c_mini" ) )
	ObjC:subscribeToGlobalModel( controller, "TeamIdentity", "team2.teamColor", function ( model )
		local team2TeamColor = Engine.GetModelValue( model )
		if team2TeamColor then
			ObjC:setRGB( team2TeamColor )
		end
	end )
	self:addElement( ObjC )
	self.ObjC = ObjC
	
	local Self = LUI.UIImage.new()
	Self:setLeftRight( true, false, 49.5, 81.5 )
	Self:setTopBottom( true, false, 283, 315 )
	Self:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	Self:setZRot( -90 )
	Self:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_player" ) )
	self:addElement( Self )
	self.Self = Self
	
	local Friendly1 = LUI.UIImage.new()
	Friendly1:setLeftRight( true, false, 196, 228 )
	Friendly1:setTopBottom( true, false, 311, 343 )
	Friendly1:setZRot( -29 )
	Friendly1:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_friendly_mp" ) )
	Friendly1:subscribeToGlobalModel( controller, "TeamIdentity", "team1.teamColor", function ( model )
		local team1TeamColor = Engine.GetModelValue( model )
		if team1TeamColor then
			Friendly1:setRGB( team1TeamColor )
		end
	end )
	self:addElement( Friendly1 )
	self.Friendly1 = Friendly1
	
	local Friendly2 = LUI.UIImage.new()
	Friendly2:setLeftRight( true, false, 86.5, 118.5 )
	Friendly2:setTopBottom( true, false, 248, 280 )
	Friendly2:setZRot( -19 )
	Friendly2:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_friendly_mp" ) )
	Friendly2:subscribeToGlobalModel( controller, "TeamIdentity", "team1.teamColor", function ( model )
		local team1TeamColor = Engine.GetModelValue( model )
		if team1TeamColor then
			Friendly2:setRGB( team1TeamColor )
		end
	end )
	self:addElement( Friendly2 )
	self.Friendly2 = Friendly2
	
	local Enemy1 = LUI.UIImage.new()
	Enemy1:setLeftRight( true, false, 269.5, 301.5 )
	Enemy1:setTopBottom( true, false, 255, 287 )
	Enemy1:setZRot( 110 )
	Enemy1:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_enemydirectional" ) )
	Enemy1:subscribeToGlobalModel( controller, "TeamIdentity", "team2.teamColor", function ( model )
		local team2TeamColor = Engine.GetModelValue( model )
		if team2TeamColor then
			Enemy1:setRGB( team2TeamColor )
		end
	end )
	self:addElement( Enemy1 )
	self.Enemy1 = Enemy1
	
	local Enemy2 = LUI.UIImage.new()
	Enemy2:setLeftRight( true, false, 413.5, 445.5 )
	Enemy2:setTopBottom( true, false, 271, 303 )
	Enemy2:setZRot( 90 )
	Enemy2:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_enemydirectional" ) )
	Enemy2:subscribeToGlobalModel( controller, "TeamIdentity", "team2.teamColor", function ( model )
		local team2TeamColor = Engine.GetModelValue( model )
		if team2TeamColor then
			Enemy2:setRGB( team2TeamColor )
		end
	end )
	self:addElement( Enemy2 )
	self.Enemy2 = Enemy2
	
	local Obit = LUI.UIImage.new()
	Obit:setLeftRight( true, false, 218, 238 )
	Obit:setTopBottom( true, false, 272.5, 292.5 )
	Obit:setImage( RegisterImage( "uie_headicon_dead" ) )
	Obit:subscribeToGlobalModel( controller, "TeamIdentity", "team2.teamColor", function ( model )
		local team2TeamColor = Engine.GetModelValue( model )
		if team2TeamColor then
			Obit:setRGB( team2TeamColor )
		end
	end )
	self:addElement( Obit )
	self.Obit = Obit
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 2, 201 )
	Title:setTopBottom( true, false, 92, 112 )
	Title:setText( Engine.Localize( LocalizeToUpperString( "CODCASTER_TEAM_COLOR_PREVIEW" ) ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.08, 0, 0, 0 )
	Title:setShaderVector( 1, 0, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setLetterSpacing( 1 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border:close()
		element.ObjA:close()
		element.ObjC:close()
		element.Friendly1:close()
		element.Friendly2:close()
		element.Enemy1:close()
		element.Enemy2:close()
		element.Obit:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

