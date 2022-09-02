-- e63a141123c122f77c9e2c8bb833d829
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PC.ServerBrowser.ServerBrowserFlag" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox_18pt" )

CoD.ServerBrowserRowInternal = InheritFrom( LUI.UIElement )
CoD.ServerBrowserRowInternal.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 2
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ServerBrowserRowInternal )
	self.id = "ServerBrowserRowInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 700 )
	self:setTopBottom( true, false, 0, 22 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local passwordFlag = CoD.ServerBrowserFlag.new( menu, controller )
	passwordFlag:setLeftRight( true, false, 0, 28 )
	passwordFlag:setTopBottom( true, true, 0, 0 )
	passwordFlag.icon:setImage( RegisterImage( "uie_t7_icon_serverbrowser_protected" ) )
	passwordFlag:linkToElementModel( self, nil, false, function ( model )
		passwordFlag:setModel( model, controller )
	end )
	passwordFlag:mergeStateConditions( {
		{
			stateName = "FlagOn",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "passwordProtected" )
			end
		}
	} )
	passwordFlag:linkToElementModel( passwordFlag, "passwordProtected", true, function ( model )
		menu:updateElementState( passwordFlag, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "passwordProtected"
		} )
	end )
	self:addElement( passwordFlag )
	self.passwordFlag = passwordFlag
	
	local dedicatedFlag = CoD.ServerBrowserFlag.new( menu, controller )
	dedicatedFlag:setLeftRight( true, false, 30, 58 )
	dedicatedFlag:setTopBottom( true, true, 0, 0 )
	dedicatedFlag.icon:setImage( RegisterImage( "uie_t7_icon_serverbrowser_dedicated" ) )
	dedicatedFlag:linkToElementModel( self, nil, false, function ( model )
		dedicatedFlag:setModel( model, controller )
	end )
	dedicatedFlag:mergeStateConditions( {
		{
			stateName = "FlagOn",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "dedicated" )
			end
		}
	} )
	dedicatedFlag:linkToElementModel( dedicatedFlag, "dedicated", true, function ( model )
		menu:updateElementState( dedicatedFlag, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "dedicated"
		} )
	end )
	self:addElement( dedicatedFlag )
	self.dedicatedFlag = dedicatedFlag
	
	local rankedFlag = CoD.ServerBrowserFlag.new( menu, controller )
	rankedFlag:setLeftRight( true, false, 60, 88 )
	rankedFlag:setTopBottom( true, true, 0, 0 )
	rankedFlag.icon:setImage( RegisterImage( "uie_t7_icon_serverbrowser_ranked" ) )
	rankedFlag:linkToElementModel( self, nil, false, function ( model )
		rankedFlag:setModel( model, controller )
	end )
	rankedFlag:mergeStateConditions( {
		{
			stateName = "FlagOn",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "ranked" )
			end
		}
	} )
	rankedFlag:linkToElementModel( rankedFlag, "ranked", true, function ( model )
		menu:updateElementState( rankedFlag, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ranked"
		} )
	end )
	self:addElement( rankedFlag )
	self.rankedFlag = rankedFlag
	
	local name = CoD.horizontalScrollingTextBox_18pt.new( menu, controller )
	name:setLeftRight( true, false, 90, 330 )
	name:setTopBottom( true, false, 2, 20 )
	name.textBox:setTTF( "fonts/default.ttf" )
	name.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	name:linkToElementModel( self, "name", true, function ( model )
		local _name = Engine.GetModelValue( model )
		if _name then
			name.textBox:setText( Engine.Localize( _name ) )
		end
	end )
	self:addElement( name )
	self.name = name
	
	local spacer = LUI.UIFrame.new( menu, controller, 0, 0, false )
	spacer:setLeftRight( true, false, 332, 339 )
	spacer:setTopBottom( true, false, 0, 22 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local map = CoD.horizontalScrollingTextBox_18pt.new( menu, controller )
	map:setLeftRight( true, false, 341, 446 )
	map:setTopBottom( true, false, 2, 20 )
	map.textBox:setTTF( "fonts/default.ttf" )
	map.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	map:linkToElementModel( self, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			map.textBox:setText( MapNameToLocalizedMapName( mapName ) )
		end
	end )
	self:addElement( map )
	self.map = map
	
	local hardcoreFlag = CoD.ServerBrowserFlag.new( menu, controller )
	hardcoreFlag:setLeftRight( true, false, 448, 470 )
	hardcoreFlag:setTopBottom( true, true, 0, 0 )
	hardcoreFlag.icon:setImage( RegisterImage( "uie_t7_icon_serverbrowser_skull" ) )
	hardcoreFlag:linkToElementModel( self, nil, false, function ( model )
		hardcoreFlag:setModel( model, controller )
	end )
	hardcoreFlag:mergeStateConditions( {
		{
			stateName = "FlagOn",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "hardcore" )
			end
		}
	} )
	hardcoreFlag:linkToElementModel( hardcoreFlag, "hardcore", true, function ( model )
		menu:updateElementState( hardcoreFlag, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hardcore"
		} )
	end )
	self:addElement( hardcoreFlag )
	self.hardcoreFlag = hardcoreFlag
	
	local gametype = LUI.UIText.new()
	gametype:setLeftRight( true, false, 472, 591 )
	gametype:setTopBottom( true, false, 2, 20 )
	gametype:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	gametype:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	gametype:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	gametype:linkToElementModel( self, "gameType", true, function ( model )
		local gameType = Engine.GetModelValue( model )
		if gameType then
			gametype:setText( Engine.Localize( GetGameTypeDisplayString( gameType ) ) )
		end
	end )
	self:addElement( gametype )
	self.gametype = gametype
	
	local playerCount = LUI.UIText.new()
	playerCount:setLeftRight( true, false, 593, 613 )
	playerCount:setTopBottom( true, false, 2, 20 )
	playerCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	playerCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	playerCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	playerCount:linkToElementModel( self, "clientCount", true, function ( model )
		local clientCount = Engine.GetModelValue( model )
		if clientCount then
			playerCount:setText( Engine.Localize( clientCount ) )
		end
	end )
	self:addElement( playerCount )
	self.playerCount = playerCount
	
	local slash = LUI.UIText.new()
	slash:setLeftRight( true, false, 615, 624 )
	slash:setTopBottom( true, false, 2, 20 )
	slash:setText( Engine.Localize( "/" ) )
	slash:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	slash:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	slash:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( slash )
	self.slash = slash
	
	local maxPlayers = LUI.UIText.new()
	maxPlayers:setLeftRight( true, false, 626, 659 )
	maxPlayers:setTopBottom( true, false, 2, 20 )
	maxPlayers:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	maxPlayers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	maxPlayers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	maxPlayers:linkToElementModel( self, "maxClients", true, function ( model )
		local maxClients = Engine.GetModelValue( model )
		if maxClients then
			maxPlayers:setText( Engine.Localize( maxClients ) )
		end
	end )
	self:addElement( maxPlayers )
	self.maxPlayers = maxPlayers
	
	local ping = LUI.UIText.new()
	ping:setLeftRight( true, false, 661, 699.37 )
	ping:setTopBottom( true, false, 2, 20 )
	ping:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ping:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ping:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ping:linkToElementModel( self, "ping", true, function ( model )
		local _ping = Engine.GetModelValue( model )
		if _ping then
			ping:setText( Engine.Localize( _ping ) )
		end
	end )
	self:addElement( ping )
	self.ping = ping
	
	spacer.id = "spacer"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.spacer:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.passwordFlag:close()
		element.dedicatedFlag:close()
		element.rankedFlag:close()
		element.name:close()
		element.map:close()
		element.hardcoreFlag:close()
		element.gametype:close()
		element.playerCount:close()
		element.maxPlayers:close()
		element.ping:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

