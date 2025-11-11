CoD.StartMenu_Options_Graphics_ColorBlindMinimapPreview = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Graphics_ColorBlindMinimapPreview.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Graphics_ColorBlindMinimapPreview )
	self.id = "StartMenu_Options_Graphics_ColorBlindMinimapPreview"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 390 )
	
	local minimap = LUI.UIImage.new()
	minimap:setLeftRight( 0, 0, 0, 750 )
	minimap:setTopBottom( 0, 0, 0, 282 )
	minimap:setImage( RegisterImage( "uie_t7_mp_sector_color_blind_map" ) )
	self:addElement( minimap )
	self.minimap = minimap
	
	local playerArrow = LUI.UIImage.new()
	playerArrow:setLeftRight( 0, 0, 93, 141 )
	playerArrow:setTopBottom( 0, 0, 334, 382 )
	playerArrow:setImage( RegisterImage( "t7_hud_waypoints_compassping_player" ) )
	playerArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playerArrow:setRGB( GetColorBlindSafeColorFromBase( "PlayerYellow", modelValue ) )
		end
	end )
	self:addElement( playerArrow )
	self.playerArrow = playerArrow
	
	local playerScorestreakDiamond = LUI.UIImage.new()
	playerScorestreakDiamond:setLeftRight( 0, 0, 141, 186 )
	playerScorestreakDiamond:setTopBottom( 0, 0, 334, 382 )
	playerScorestreakDiamond:setImage( RegisterImage( "uie_t7_hud_enemysatellite_diamond_top_small" ) )
	playerScorestreakDiamond:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playerScorestreakDiamond:setRGB( GetColorBlindSafeColorFromBase( "PlayerYellow", modelValue ) )
		end
	end )
	self:addElement( playerScorestreakDiamond )
	self.playerScorestreakDiamond = playerScorestreakDiamond
	
	local friendlyArrow = LUI.UIImage.new()
	friendlyArrow:setLeftRight( 0, 0, 351, 399 )
	friendlyArrow:setTopBottom( 0, 0, 334, 382 )
	friendlyArrow:setImage( RegisterImage( "t7_hud_waypoints_compassping_friendly_mp" ) )
	friendlyArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			friendlyArrow:setRGB( GetColorBlindSafeColorFromBase( "FriendlyBlue", modelValue ) )
		end
	end )
	self:addElement( friendlyArrow )
	self.friendlyArrow = friendlyArrow
	
	local friendlyPartyArrow = LUI.UIImage.new()
	friendlyPartyArrow:setLeftRight( 0, 0, 303, 351 )
	friendlyPartyArrow:setTopBottom( 0, 0, 334, 382 )
	friendlyPartyArrow:setImage( RegisterImage( "t7_hud_waypoints_compassping_friendly_mp" ) )
	friendlyPartyArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			friendlyPartyArrow:setRGB( GetColorBlindSafeColorFromBase( "PartyFriendlyBlue", modelValue ) )
		end
	end )
	self:addElement( friendlyPartyArrow )
	self.friendlyPartyArrow = friendlyPartyArrow
	
	local friendlyObjective = LUI.UIImage.new()
	friendlyObjective:setLeftRight( 0, 0, 399, 447 )
	friendlyObjective:setTopBottom( 0, 0, 334, 382 )
	friendlyObjective:setImage( RegisterImage( "t7_hud_waypoints_neutral_blank_mini" ) )
	friendlyObjective:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			friendlyObjective:setRGB( GetColorBlindSafeColorFromBase( "FriendlyBlue", modelValue ) )
		end
	end )
	self:addElement( friendlyObjective )
	self.friendlyObjective = friendlyObjective
	
	local enemyArrow = LUI.UIImage.new()
	enemyArrow:setLeftRight( 0, 0, 538, 586 )
	enemyArrow:setTopBottom( 0, 0, 334, 382 )
	enemyArrow:setImage( RegisterImage( "t7_hud_waypoints_compassping_enemydirectional" ) )
	enemyArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			enemyArrow:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", modelValue ) )
		end
	end )
	self:addElement( enemyArrow )
	self.enemyArrow = enemyArrow
	
	local enemyObjective = LUI.UIImage.new()
	enemyObjective:setLeftRight( 0, 0, 586, 634 )
	enemyObjective:setTopBottom( 0, 0, 334, 382 )
	enemyObjective:setImage( RegisterImage( "t7_hud_waypoints_neutral_blank_mini" ) )
	enemyObjective:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			enemyObjective:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", modelValue ) )
		end
	end )
	self:addElement( enemyObjective )
	self.enemyObjective = enemyObjective
	
	local enemyScorestreakDiamond = LUI.UIImage.new()
	enemyScorestreakDiamond:setLeftRight( 0, 0, 634, 682 )
	enemyScorestreakDiamond:setTopBottom( 0, 0, 334, 382 )
	enemyScorestreakDiamond:setImage( RegisterImage( "uie_t7_hud_enemysatellite_diamond_top_small" ) )
	enemyScorestreakDiamond:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			enemyScorestreakDiamond:setRGB( GetColorBlindSafeColorFromBase( "EnemyScorestreakTarget", modelValue ) )
		end
	end )
	self:addElement( enemyScorestreakDiamond )
	self.enemyScorestreakDiamond = enemyScorestreakDiamond
	
	local playerHeader = LUI.UIText.new()
	playerHeader:setLeftRight( 0, 0, -9, 291 )
	playerHeader:setTopBottom( 0, 0, 297, 335 )
	playerHeader:setText( Engine.Localize( "MENU_YOU_CAPS" ) )
	playerHeader:setTTF( "fonts/default.ttf" )
	playerHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	playerHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	playerHeader:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playerHeader:setRGB( GetColorBlindSafeColorFromBase( "PlayerYellow", modelValue ) )
		end
	end )
	self:addElement( playerHeader )
	self.playerHeader = playerHeader
	
	local friendlyHeader = LUI.UIText.new()
	friendlyHeader:setLeftRight( 0, 0, 225, 525 )
	friendlyHeader:setTopBottom( 0, 0, 297, 335 )
	friendlyHeader:setText( LocalizeToUpperString( "MENU_FRIENDLY" ) )
	friendlyHeader:setTTF( "fonts/default.ttf" )
	friendlyHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	friendlyHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	friendlyHeader:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			friendlyHeader:setRGB( GetColorBlindSafeColorFromBase( "FriendlyBlue", modelValue ) )
		end
	end )
	self:addElement( friendlyHeader )
	self.friendlyHeader = friendlyHeader
	
	local enemyHeader = LUI.UIText.new()
	enemyHeader:setLeftRight( 0, 0, 460, 760 )
	enemyHeader:setTopBottom( 0, 0, 297, 335 )
	enemyHeader:setText( LocalizeToUpperString( "MENU_ENEMY" ) )
	enemyHeader:setTTF( "fonts/default.ttf" )
	enemyHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	enemyHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	enemyHeader:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			enemyHeader:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", modelValue ) )
		end
	end )
	self:addElement( enemyHeader )
	self.enemyHeader = enemyHeader
	
	local minimapPlayerArrow = LUI.UIImage.new()
	minimapPlayerArrow:setLeftRight( 0, 0, 62, 110 )
	minimapPlayerArrow:setTopBottom( 0, 0, 130, 178 )
	minimapPlayerArrow:setZRot( -90 )
	minimapPlayerArrow:setImage( RegisterImage( "t7_hud_waypoints_compassping_player" ) )
	minimapPlayerArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			minimapPlayerArrow:setRGB( GetColorBlindSafeColorFromBase( "PlayerYellow", modelValue ) )
		end
	end )
	self:addElement( minimapPlayerArrow )
	self.minimapPlayerArrow = minimapPlayerArrow
	
	local minimapFriendlyPlayerArrow = LUI.UIImage.new()
	minimapFriendlyPlayerArrow:setLeftRight( 0, 0, 117, 165 )
	minimapFriendlyPlayerArrow:setTopBottom( 0, 0, 104, 152 )
	minimapFriendlyPlayerArrow:setZRot( -34 )
	minimapFriendlyPlayerArrow:setImage( RegisterImage( "t7_hud_waypoints_compassping_friendly_mp" ) )
	minimapFriendlyPlayerArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			minimapFriendlyPlayerArrow:setRGB( GetColorBlindSafeColorFromBase( "FriendlyBlue", modelValue ) )
		end
	end )
	self:addElement( minimapFriendlyPlayerArrow )
	self.minimapFriendlyPlayerArrow = minimapFriendlyPlayerArrow
	
	local minimapPartyFriendlyPlayerArrow = LUI.UIImage.new()
	minimapPartyFriendlyPlayerArrow:setLeftRight( 0, 0, 279, 327 )
	minimapPartyFriendlyPlayerArrow:setTopBottom( 0, 0, 171, 219 )
	minimapPartyFriendlyPlayerArrow:setZRot( -34 )
	minimapPartyFriendlyPlayerArrow:setImage( RegisterImage( "t7_hud_waypoints_compassping_friendly_mp" ) )
	minimapPartyFriendlyPlayerArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			minimapPartyFriendlyPlayerArrow:setRGB( GetColorBlindSafeColorFromBase( "PartyFriendlyBlue", modelValue ) )
		end
	end )
	self:addElement( minimapPartyFriendlyPlayerArrow )
	self.minimapPartyFriendlyPlayerArrow = minimapPartyFriendlyPlayerArrow
	
	local minimapEnemyPing1 = LUI.UIImage.new()
	minimapEnemyPing1:setLeftRight( 0, 0, 303, 351 )
	minimapEnemyPing1:setTopBottom( 0, 0, 123, 171 )
	minimapEnemyPing1:setImage( RegisterImage( "t7_hud_waypoints_compassping_enemy" ) )
	minimapEnemyPing1:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			minimapEnemyPing1:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", modelValue ) )
		end
	end )
	self:addElement( minimapEnemyPing1 )
	self.minimapEnemyPing1 = minimapEnemyPing1
	
	local minimapEnemyPing2 = LUI.UIImage.new()
	minimapEnemyPing2:setLeftRight( 0, 0, 412, 460 )
	minimapEnemyPing2:setTopBottom( 0, 0, 93, 141 )
	minimapEnemyPing2:setImage( RegisterImage( "t7_hud_waypoints_compassping_enemy" ) )
	minimapEnemyPing2:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			minimapEnemyPing2:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", modelValue ) )
		end
	end )
	self:addElement( minimapEnemyPing2 )
	self.minimapEnemyPing2 = minimapEnemyPing2
	
	local minimapEnemyPing3 = LUI.UIImage.new()
	minimapEnemyPing3:setLeftRight( 0, 0, 538, 586 )
	minimapEnemyPing3:setTopBottom( 0, 0, 159, 207 )
	minimapEnemyPing3:setImage( RegisterImage( "t7_hud_waypoints_compassping_enemy" ) )
	minimapEnemyPing3:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			minimapEnemyPing3:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", modelValue ) )
		end
	end )
	self:addElement( minimapEnemyPing3 )
	self.minimapEnemyPing3 = minimapEnemyPing3
	
	local objectivePointA = LUI.UIImage.new()
	objectivePointA:setLeftRight( 0, 0, 135, 183 )
	objectivePointA:setTopBottom( 0, 0, 146, 194 )
	objectivePointA:setImage( RegisterImage( "t7_hud_waypoints_neutral_new_a_mini" ) )
	objectivePointA:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			objectivePointA:setRGB( GetColorBlindSafeColorFromBase( "FriendlyBlue", modelValue ) )
		end
	end )
	self:addElement( objectivePointA )
	self.objectivePointA = objectivePointA
	
	local objectivePointB = LUI.UIImage.new()
	objectivePointB:setLeftRight( 0, 0, 342, 390 )
	objectivePointB:setTopBottom( 0, 0, 122, 170 )
	objectivePointB:setImage( RegisterImage( "t7_hud_waypoints_neutral_new_b_mini" ) )
	self:addElement( objectivePointB )
	self.objectivePointB = objectivePointB
	
	local objectivePointC = LUI.UIImage.new()
	objectivePointC:setLeftRight( 0, 0, 532, 580 )
	objectivePointC:setTopBottom( 0, 0, 99, 147 )
	objectivePointC:setImage( RegisterImage( "t7_hud_waypoints_neutral_new_c_mini" ) )
	objectivePointC:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			objectivePointC:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", modelValue ) )
		end
	end )
	self:addElement( objectivePointC )
	self.objectivePointC = objectivePointC
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.playerArrow:close()
		self.playerScorestreakDiamond:close()
		self.friendlyArrow:close()
		self.friendlyPartyArrow:close()
		self.friendlyObjective:close()
		self.enemyArrow:close()
		self.enemyObjective:close()
		self.enemyScorestreakDiamond:close()
		self.playerHeader:close()
		self.friendlyHeader:close()
		self.enemyHeader:close()
		self.minimapPlayerArrow:close()
		self.minimapFriendlyPlayerArrow:close()
		self.minimapPartyFriendlyPlayerArrow:close()
		self.minimapEnemyPing1:close()
		self.minimapEnemyPing2:close()
		self.minimapEnemyPing3:close()
		self.objectivePointA:close()
		self.objectivePointC:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

