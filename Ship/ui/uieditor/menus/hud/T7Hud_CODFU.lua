-- 7aeea44b18ae463a9159dbb033729c46
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.GenericUpdateBarWithLink" )

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
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_CODFU.buttonPrompts" )
	local f1_local1 = self
	
	local player1health = CoD.GenericUpdateBarWithLink.new( f1_local1, controller )
	player1health:setLeftRight( true, false, 64, 584 )
	player1health:setTopBottom( true, false, 671.5, 684 )
	player1health.barImage:setImage( RegisterImage( "uie_health_large_left" ) )
	player1health:subscribeToGlobalModel( controller, "CodfuGlobal", nil, function ( model )
		player1health:setModel( model, controller )
	end )
	player1health:subscribeToGlobalModel( controller, "CodfuGlobal", "player1health", function ( model )
		local _player1health = Engine.GetModelValue( model )
		if _player1health then
			player1health.barImage:setShaderVector( 0, CoD.GetVectorComponentFromString( _player1health, 1 ), CoD.GetVectorComponentFromString( _player1health, 2 ), CoD.GetVectorComponentFromString( _player1health, 3 ), CoD.GetVectorComponentFromString( _player1health, 4 ) )
		end
	end )
	self:addElement( player1health )
	self.player1health = player1health
	
	local player2health = CoD.GenericUpdateBarWithLink.new( f1_local1, controller )
	player2health:setLeftRight( true, false, 1215, 695 )
	player2health:setTopBottom( true, false, 671.5, 684 )
	player2health.barImage:setImage( RegisterImage( "uie_health_large_left" ) )
	player2health:subscribeToGlobalModel( controller, "CodfuGlobal", nil, function ( model )
		player2health:setModel( model, controller )
	end )
	player2health:subscribeToGlobalModel( controller, "CodfuGlobal", "player2health", function ( model )
		local _player2health = Engine.GetModelValue( model )
		if _player2health then
			player2health.barImage:setShaderVector( 0, CoD.GetVectorComponentFromString( _player2health, 1 ), CoD.GetVectorComponentFromString( _player2health, 2 ), CoD.GetVectorComponentFromString( _player2health, 3 ), CoD.GetVectorComponentFromString( _player2health, 4 ) )
		end
	end )
	self:addElement( player2health )
	self.player2health = player2health
	
	local GameTimer = LUI.UITightText.new()
	GameTimer:setLeftRight( true, false, 591, 689 )
	GameTimer:setTopBottom( true, false, 634.5, 682.5 )
	GameTimer:setTTF( "fonts/default.ttf" )
	GameTimer:setupGameTimer()
	GameTimer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( GameTimer )
	self.GameTimer = GameTimer
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f6_local0 = nil
		LockInput( self, controller, false )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.player1health:close()
		element.player2health:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_CODFU.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

