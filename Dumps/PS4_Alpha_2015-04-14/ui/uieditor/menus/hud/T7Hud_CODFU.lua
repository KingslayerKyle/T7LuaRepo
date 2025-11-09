require( "ui.uieditor.widgets.HUD.GenericUpdateBarWithLink" )

LUI.hudMenuType.T7Hud_CODFU = "hud"
LUI.createMenu.T7Hud_CODFU = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_CODFU" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local player4health = CoD.GenericUpdateBarWithLink.new( menu, controller )
	player4health:setLeftRight( true, false, 64, 168.5 )
	player4health:setTopBottom( true, false, 610, 626 )
	player4health:setRGB( 1, 1, 1 )
	player4health.barImage:setImage( RegisterImage( "uie_health_large_left" ) )
	player4health.barImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( player4health )
	self.player4health = player4health
	
	local player4name = LUI.UIText.new()
	player4name:setLeftRight( true, false, 64, 168.5 )
	player4name:setTopBottom( true, false, 610, 626 )
	player4name:setRGB( 1, 1, 1 )
	player4name:setTTF( "fonts/UnitedSansRgMd.ttf" )
	player4name:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	player4name:setShaderVector( 0, 0, 0, 0, 0 )
	player4name:setShaderVector( 1, 0, 0, 0, 0 )
	player4name:setShaderVector( 2, 0, 0, 0, 0 )
	player4name:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	player4name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	player4name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	player4name:subscribeToGlobalModel( controller, "CodfuGlobal", "player4name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			player4name:setText( modelValue )
		end
	end )
	self:addElement( player4name )
	self.player4name = player4name
	
	local player3health = CoD.GenericUpdateBarWithLink.new( menu, controller )
	player3health:setLeftRight( true, false, 64, 584 )
	player3health:setTopBottom( true, false, 634, 659 )
	player3health:setRGB( 1, 1, 1 )
	player3health.barImage:setImage( RegisterImage( "uie_health_large_left" ) )
	player3health.barImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( player3health )
	self.player3health = player3health
	
	local player3name = LUI.UIText.new()
	player3name:setLeftRight( true, false, 64, 584 )
	player3name:setTopBottom( true, false, 634, 659 )
	player3name:setRGB( 1, 1, 1 )
	player3name:setTTF( "fonts/UnitedSansRgMd.ttf" )
	player3name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	player3name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	player3name:subscribeToGlobalModel( controller, "CodfuGlobal", "player1name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			player3name:setText( modelValue )
		end
	end )
	self:addElement( player3name )
	self.player3name = player3name
	
	local player2health = CoD.GenericUpdateBarWithLink.new( menu, controller )
	player2health:setLeftRight( true, false, 1111.5, 1216 )
	player2health:setTopBottom( true, false, 610, 626 )
	player2health:setRGB( 1, 1, 1 )
	player2health.barImage:setImage( RegisterImage( "uie_health_large_right" ) )
	player2health.barImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( player2health )
	self.player2health = player2health
	
	local player2name = LUI.UIText.new()
	player2name:setLeftRight( true, false, 1111.5, 1216 )
	player2name:setTopBottom( true, false, 610, 626 )
	player2name:setRGB( 1, 1, 1 )
	player2name:setTTF( "fonts/UnitedSansRgMd.ttf" )
	player2name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	player2name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	player2name:linkToElementModel( self, "player3name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			player2name:setText( modelValue )
		end
	end )
	self:addElement( player2name )
	self.player2name = player2name
	
	local player1health = CoD.GenericUpdateBarWithLink.new( menu, controller )
	player1health:setLeftRight( true, false, 695, 1215 )
	player1health:setTopBottom( true, false, 634, 659 )
	player1health:setRGB( 1, 1, 1 )
	player1health.barImage:setImage( RegisterImage( "uie_health_large_right" ) )
	player1health.barImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( player1health )
	self.player1health = player1health
	
	local player1name = LUI.UIText.new()
	player1name:setLeftRight( true, false, 695, 1215 )
	player1name:setTopBottom( true, false, 634, 659 )
	player1name:setRGB( 1, 1, 1 )
	player1name:setTTF( "fonts/UnitedSansRgMd.ttf" )
	player1name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	player1name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	player1name:subscribeToGlobalModel( controller, "CodfuGlobal", "player2name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			player1name:setText( modelValue )
		end
	end )
	self:addElement( player1name )
	self.player1name = player1name
	
	local GameTimer = LUI.UITightText.new()
	GameTimer:setLeftRight( true, false, 591, 689 )
	GameTimer:setTopBottom( true, false, 618, 666 )
	GameTimer:setRGB( 1, 1, 1 )
	GameTimer:setTTF( "fonts/default.ttf" )
	GameTimer:setupGameTimer()
	GameTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( GameTimer )
	self.GameTimer = GameTimer
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		LockInput( self, controller, false )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.player4health:close()
		self.player3health:close()
		self.player2health:close()
		self.player1health:close()
		self.player4name:close()
		self.player3name:close()
		self.player2name:close()
		self.player1name:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

