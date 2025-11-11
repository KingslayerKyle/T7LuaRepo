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
	self:setLeftRight( 0, 0, 0, 790 )
	self:setTopBottom( 0, 0, 0, 903 )
	
	local Border = CoD.BorderBakedSolid.new( menu, controller )
	Border:setLeftRight( 0, 0, 0, 790 )
	Border:setTopBottom( 0, 0, 186, 687 )
	self:addElement( Border )
	self.Border = Border
	
	local Map = LUI.UIImage.new()
	Map:setLeftRight( 0, 0, 0, 790 )
	Map:setTopBottom( 0, 0, 0, 903 )
	Map:setImage( RegisterImage( "uie_hud_t7_minimap_mp_sector_clean_full" ) )
	self:addElement( Map )
	self.Map = Map
	
	local ObjA = LUI.UIImage.new()
	ObjA:setLeftRight( 0, 0, 148, 196 )
	ObjA:setTopBottom( 0, 0, 430, 478 )
	ObjA:setImage( RegisterImage( "t7_hud_waypoints_neutral_new_a_mini" ) )
	ObjA:subscribeToGlobalModel( controller, "TeamIdentity", "team1.teamColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ObjA:setRGB( modelValue )
		end
	end )
	self:addElement( ObjA )
	self.ObjA = ObjA
	
	local ObjB = LUI.UIImage.new()
	ObjB:setLeftRight( 0, 0, 362, 410 )
	ObjB:setTopBottom( 0, 0, 404, 452 )
	ObjB:setImage( RegisterImage( "t7_hud_waypoints_neutral_new_b_mini" ) )
	self:addElement( ObjB )
	self.ObjB = ObjB
	
	local ObjC = LUI.UIImage.new()
	ObjC:setLeftRight( 0, 0, 566, 614 )
	ObjC:setTopBottom( 0, 0, 376, 424 )
	ObjC:setImage( RegisterImage( "t7_hud_waypoints_neutral_new_c_mini" ) )
	ObjC:subscribeToGlobalModel( controller, "TeamIdentity", "team2.teamColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ObjC:setRGB( modelValue )
		end
	end )
	self:addElement( ObjC )
	self.ObjC = ObjC
	
	local Self = LUI.UIImage.new()
	Self:setLeftRight( 0, 0, 74, 122 )
	Self:setTopBottom( 0, 0, 424, 472 )
	Self:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	Self:setZRot( -90 )
	Self:setImage( RegisterImage( "t7_hud_waypoints_compassping_player" ) )
	self:addElement( Self )
	self.Self = Self
	
	local Friendly1 = LUI.UIImage.new()
	Friendly1:setLeftRight( 0, 0, 294, 342 )
	Friendly1:setTopBottom( 0, 0, 466, 514 )
	Friendly1:setZRot( -29 )
	Friendly1:setImage( RegisterImage( "t7_hud_waypoints_compassping_friendly_mp" ) )
	Friendly1:subscribeToGlobalModel( controller, "TeamIdentity", "team1.teamColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Friendly1:setRGB( modelValue )
		end
	end )
	self:addElement( Friendly1 )
	self.Friendly1 = Friendly1
	
	local Friendly2 = LUI.UIImage.new()
	Friendly2:setLeftRight( 0, 0, 130, 178 )
	Friendly2:setTopBottom( 0, 0, 372, 420 )
	Friendly2:setZRot( -19 )
	Friendly2:setImage( RegisterImage( "t7_hud_waypoints_compassping_friendly_mp" ) )
	Friendly2:subscribeToGlobalModel( controller, "TeamIdentity", "team1.teamColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Friendly2:setRGB( modelValue )
		end
	end )
	self:addElement( Friendly2 )
	self.Friendly2 = Friendly2
	
	local Enemy1 = LUI.UIImage.new()
	Enemy1:setLeftRight( 0, 0, 404, 452 )
	Enemy1:setTopBottom( 0, 0, 382, 430 )
	Enemy1:setZRot( 110 )
	Enemy1:setImage( RegisterImage( "t7_hud_waypoints_compassping_enemydirectional" ) )
	Enemy1:subscribeToGlobalModel( controller, "TeamIdentity", "team2.teamColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Enemy1:setRGB( modelValue )
		end
	end )
	self:addElement( Enemy1 )
	self.Enemy1 = Enemy1
	
	local Enemy2 = LUI.UIImage.new()
	Enemy2:setLeftRight( 0, 0, 620, 668 )
	Enemy2:setTopBottom( 0, 0, 406, 454 )
	Enemy2:setZRot( 90 )
	Enemy2:setImage( RegisterImage( "t7_hud_waypoints_compassping_enemydirectional" ) )
	Enemy2:subscribeToGlobalModel( controller, "TeamIdentity", "team2.teamColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Enemy2:setRGB( modelValue )
		end
	end )
	self:addElement( Enemy2 )
	self.Enemy2 = Enemy2
	
	local Obit = LUI.UIImage.new()
	Obit:setLeftRight( 0, 0, 327, 357 )
	Obit:setTopBottom( 0, 0, 409, 439 )
	Obit:subscribeToGlobalModel( controller, "TeamIdentity", "team2.teamColor", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Obit:setRGB( modelValue )
		end
	end )
	self:addElement( Obit )
	self.Obit = Obit
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 3, 301 )
	Title:setTopBottom( 0, 0, 138, 168 )
	Title:setText( LocalizeToUpperString( "CODCASTER_TEAM_COLOR_PREVIEW" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	Title:setShaderVector( 0, 0.08, 0, 0, 0 )
	Title:setShaderVector( 1, 0, 0, 0, 0 )
	Title:setShaderVector( 2, 1, 0, 0, 0 )
	Title:setLetterSpacing( 1 )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border:close()
		self.ObjA:close()
		self.ObjC:close()
		self.Friendly1:close()
		self.Friendly2:close()
		self.Enemy1:close()
		self.Enemy2:close()
		self.Obit:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

