-- 9d48614b3a38e8c6e5237d38da95562a
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 260 )
	
	local minimap = LUI.UIImage.new()
	minimap:setLeftRight( true, false, 0, 500 )
	minimap:setTopBottom( true, false, 0, 188 )
	minimap:setImage( RegisterImage( "uie_t7_mp_sector_color_blind_map" ) )
	self:addElement( minimap )
	self.minimap = minimap
	
	local playerArrow = LUI.UIImage.new()
	playerArrow:setLeftRight( true, false, 62, 94 )
	playerArrow:setTopBottom( true, false, 223, 255 )
	playerArrow:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_player" ) )
	playerArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			playerArrow:setRGB( GetColorBlindSafeColorFromBase( "PlayerYellow", profileColorblindMode ) )
		end
	end )
	self:addElement( playerArrow )
	self.playerArrow = playerArrow
	
	local playerScorestreakDiamond = LUI.UIImage.new()
	playerScorestreakDiamond:setLeftRight( true, false, 94, 124 )
	playerScorestreakDiamond:setTopBottom( true, false, 223, 255 )
	playerScorestreakDiamond:setImage( RegisterImage( "uie_t7_hud_enemysatellite_diamond_top_small" ) )
	playerScorestreakDiamond:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			playerScorestreakDiamond:setRGB( GetColorBlindSafeColorFromBase( "PlayerYellow", profileColorblindMode ) )
		end
	end )
	self:addElement( playerScorestreakDiamond )
	self.playerScorestreakDiamond = playerScorestreakDiamond
	
	local friendlyArrow = LUI.UIImage.new()
	friendlyArrow:setLeftRight( true, false, 234, 266 )
	friendlyArrow:setTopBottom( true, false, 223, 255 )
	friendlyArrow:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_friendly_mp" ) )
	friendlyArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			friendlyArrow:setRGB( GetColorBlindSafeColorFromBase( "FriendlyBlue", profileColorblindMode ) )
		end
	end )
	self:addElement( friendlyArrow )
	self.friendlyArrow = friendlyArrow
	
	local friendlyPartyArrow = LUI.UIImage.new()
	friendlyPartyArrow:setLeftRight( true, false, 202, 234 )
	friendlyPartyArrow:setTopBottom( true, false, 223, 255 )
	friendlyPartyArrow:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_friendly_mp" ) )
	friendlyPartyArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			friendlyPartyArrow:setRGB( GetColorBlindSafeColorFromBase( "PartyFriendlyBlue", profileColorblindMode ) )
		end
	end )
	self:addElement( friendlyPartyArrow )
	self.friendlyPartyArrow = friendlyPartyArrow
	
	local friendlyObjective = LUI.UIImage.new()
	friendlyObjective:setLeftRight( true, false, 266, 298 )
	friendlyObjective:setTopBottom( true, false, 223, 255 )
	friendlyObjective:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_blank_mini" ) )
	friendlyObjective:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			friendlyObjective:setRGB( GetColorBlindSafeColorFromBase( "FriendlyBlue", profileColorblindMode ) )
		end
	end )
	self:addElement( friendlyObjective )
	self.friendlyObjective = friendlyObjective
	
	local enemyArrow = LUI.UIImage.new()
	enemyArrow:setLeftRight( true, false, 359, 391 )
	enemyArrow:setTopBottom( true, false, 223, 255 )
	enemyArrow:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_enemydirectional" ) )
	enemyArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			enemyArrow:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", profileColorblindMode ) )
		end
	end )
	self:addElement( enemyArrow )
	self.enemyArrow = enemyArrow
	
	local enemyObjective = LUI.UIImage.new()
	enemyObjective:setLeftRight( true, false, 391, 423 )
	enemyObjective:setTopBottom( true, false, 223, 255 )
	enemyObjective:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_blank_mini" ) )
	enemyObjective:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			enemyObjective:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", profileColorblindMode ) )
		end
	end )
	self:addElement( enemyObjective )
	self.enemyObjective = enemyObjective
	
	local enemyScorestreakDiamond = LUI.UIImage.new()
	enemyScorestreakDiamond:setLeftRight( true, false, 423, 455 )
	enemyScorestreakDiamond:setTopBottom( true, false, 223, 255 )
	enemyScorestreakDiamond:setImage( RegisterImage( "uie_t7_hud_enemysatellite_diamond_top_small" ) )
	enemyScorestreakDiamond:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			enemyScorestreakDiamond:setRGB( GetColorBlindSafeColorFromBase( "EnemyScorestreakTarget", profileColorblindMode ) )
		end
	end )
	self:addElement( enemyScorestreakDiamond )
	self.enemyScorestreakDiamond = enemyScorestreakDiamond
	
	local playerHeader = LUI.UIText.new()
	playerHeader:setLeftRight( true, false, -6, 194 )
	playerHeader:setTopBottom( true, false, 198, 223 )
	playerHeader:setText( Engine.Localize( "MENU_YOU_CAPS" ) )
	playerHeader:setTTF( "fonts/default.ttf" )
	playerHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	playerHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	playerHeader:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			playerHeader:setRGB( GetColorBlindSafeColorFromBase( "PlayerYellow", profileColorblindMode ) )
		end
	end )
	self:addElement( playerHeader )
	self.playerHeader = playerHeader
	
	local friendlyHeader = LUI.UIText.new()
	friendlyHeader:setLeftRight( true, false, 150, 350 )
	friendlyHeader:setTopBottom( true, false, 198, 223 )
	friendlyHeader:setText( LocalizeToUpperString( "MENU_FRIENDLY" ) )
	friendlyHeader:setTTF( "fonts/default.ttf" )
	friendlyHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	friendlyHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	friendlyHeader:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			friendlyHeader:setRGB( GetColorBlindSafeColorFromBase( "FriendlyBlue", profileColorblindMode ) )
		end
	end )
	self:addElement( friendlyHeader )
	self.friendlyHeader = friendlyHeader
	
	local enemyHeader = LUI.UIText.new()
	enemyHeader:setLeftRight( true, false, 307, 507 )
	enemyHeader:setTopBottom( true, false, 198, 223 )
	enemyHeader:setText( LocalizeToUpperString( "MENU_ENEMY" ) )
	enemyHeader:setTTF( "fonts/default.ttf" )
	enemyHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	enemyHeader:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	enemyHeader:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			enemyHeader:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", profileColorblindMode ) )
		end
	end )
	self:addElement( enemyHeader )
	self.enemyHeader = enemyHeader
	
	local minimapPlayerArrow = LUI.UIImage.new()
	minimapPlayerArrow:setLeftRight( true, false, 41, 73 )
	minimapPlayerArrow:setTopBottom( true, false, 87, 119 )
	minimapPlayerArrow:setZRot( -90 )
	minimapPlayerArrow:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_player" ) )
	minimapPlayerArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			minimapPlayerArrow:setRGB( GetColorBlindSafeColorFromBase( "PlayerYellow", profileColorblindMode ) )
		end
	end )
	self:addElement( minimapPlayerArrow )
	self.minimapPlayerArrow = minimapPlayerArrow
	
	local minimapFriendlyPlayerArrow = LUI.UIImage.new()
	minimapFriendlyPlayerArrow:setLeftRight( true, false, 78, 110 )
	minimapFriendlyPlayerArrow:setTopBottom( true, false, 69, 101 )
	minimapFriendlyPlayerArrow:setZRot( -34 )
	minimapFriendlyPlayerArrow:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_friendly_mp" ) )
	minimapFriendlyPlayerArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			minimapFriendlyPlayerArrow:setRGB( GetColorBlindSafeColorFromBase( "FriendlyBlue", profileColorblindMode ) )
		end
	end )
	self:addElement( minimapFriendlyPlayerArrow )
	self.minimapFriendlyPlayerArrow = minimapFriendlyPlayerArrow
	
	local minimapPartyFriendlyPlayerArrow = LUI.UIImage.new()
	minimapPartyFriendlyPlayerArrow:setLeftRight( true, false, 186, 218 )
	minimapPartyFriendlyPlayerArrow:setTopBottom( true, false, 114, 146 )
	minimapPartyFriendlyPlayerArrow:setZRot( -34 )
	minimapPartyFriendlyPlayerArrow:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_friendly_mp" ) )
	minimapPartyFriendlyPlayerArrow:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			minimapPartyFriendlyPlayerArrow:setRGB( GetColorBlindSafeColorFromBase( "PartyFriendlyBlue", profileColorblindMode ) )
		end
	end )
	self:addElement( minimapPartyFriendlyPlayerArrow )
	self.minimapPartyFriendlyPlayerArrow = minimapPartyFriendlyPlayerArrow
	
	local minimapEnemyPing1 = LUI.UIImage.new()
	minimapEnemyPing1:setLeftRight( true, false, 202, 234 )
	minimapEnemyPing1:setTopBottom( true, false, 82, 114 )
	minimapEnemyPing1:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_enemy" ) )
	minimapEnemyPing1:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			minimapEnemyPing1:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", profileColorblindMode ) )
		end
	end )
	self:addElement( minimapEnemyPing1 )
	self.minimapEnemyPing1 = minimapEnemyPing1
	
	local minimapEnemyPing2 = LUI.UIImage.new()
	minimapEnemyPing2:setLeftRight( true, false, 275, 307 )
	minimapEnemyPing2:setTopBottom( true, false, 62, 94 )
	minimapEnemyPing2:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_enemy" ) )
	minimapEnemyPing2:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			minimapEnemyPing2:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", profileColorblindMode ) )
		end
	end )
	self:addElement( minimapEnemyPing2 )
	self.minimapEnemyPing2 = minimapEnemyPing2
	
	local minimapEnemyPing3 = LUI.UIImage.new()
	minimapEnemyPing3:setLeftRight( true, false, 359, 391 )
	minimapEnemyPing3:setTopBottom( true, false, 106, 138 )
	minimapEnemyPing3:setImage( RegisterImage( "uie_t7_hud_waypoints_compassping_enemy" ) )
	minimapEnemyPing3:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			minimapEnemyPing3:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", profileColorblindMode ) )
		end
	end )
	self:addElement( minimapEnemyPing3 )
	self.minimapEnemyPing3 = minimapEnemyPing3
	
	local objectivePointA = LUI.UIImage.new()
	objectivePointA:setLeftRight( true, false, 90, 122 )
	objectivePointA:setTopBottom( true, false, 97, 129 )
	objectivePointA:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_new_a_mini" ) )
	objectivePointA:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			objectivePointA:setRGB( GetColorBlindSafeColorFromBase( "FriendlyBlue", profileColorblindMode ) )
		end
	end )
	self:addElement( objectivePointA )
	self.objectivePointA = objectivePointA
	
	local objectivePointB = LUI.UIImage.new()
	objectivePointB:setLeftRight( true, false, 228, 260 )
	objectivePointB:setTopBottom( true, false, 81, 113 )
	objectivePointB:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_new_b_mini" ) )
	self:addElement( objectivePointB )
	self.objectivePointB = objectivePointB
	
	local objectivePointC = LUI.UIImage.new()
	objectivePointC:setLeftRight( true, false, 355, 387 )
	objectivePointC:setTopBottom( true, false, 66, 98 )
	objectivePointC:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_new_c_mini" ) )
	objectivePointC:subscribeToGlobalModel( controller, "PerController", "profile.colorblindMode", function ( model )
		local profileColorblindMode = Engine.GetModelValue( model )
		if profileColorblindMode then
			objectivePointC:setRGB( GetColorBlindSafeColorFromBase( "EnemyOrange", profileColorblindMode ) )
		end
	end )
	self:addElement( objectivePointC )
	self.objectivePointC = objectivePointC
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.playerArrow:close()
		element.playerScorestreakDiamond:close()
		element.friendlyArrow:close()
		element.friendlyPartyArrow:close()
		element.friendlyObjective:close()
		element.enemyArrow:close()
		element.enemyObjective:close()
		element.enemyScorestreakDiamond:close()
		element.playerHeader:close()
		element.friendlyHeader:close()
		element.enemyHeader:close()
		element.minimapPlayerArrow:close()
		element.minimapFriendlyPlayerArrow:close()
		element.minimapPartyFriendlyPlayerArrow:close()
		element.minimapEnemyPing1:close()
		element.minimapEnemyPing2:close()
		element.minimapEnemyPing3:close()
		element.objectivePointA:close()
		element.objectivePointC:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

