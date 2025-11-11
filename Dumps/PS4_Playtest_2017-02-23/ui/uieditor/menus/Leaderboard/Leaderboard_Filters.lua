require( "ui.uieditor.widgets.CodCaster.codcaster_options_slider_small" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

local PreLoadFunc = function ( self, controller )
	self.animateInFromOffset = 420
end

LUI.createMenu.Leaderboard_Filters = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Leaderboard_Filters" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_PrimaryWeapon"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Leaderboard_Filters.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( 1, 1, -795, 0 )
	leftBackground:setTopBottom( 0, 1, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.97 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local leftLineStripe = LUI.UIImage.new()
	leftLineStripe:setLeftRight( 1, 1, -795, -793 )
	leftLineStripe:setTopBottom( 0, 1, 0, 0 )
	leftLineStripe:setAlpha( 0.42 )
	self:addElement( leftLineStripe )
	self.leftLineStripe = leftLineStripe
	
	local FilterTitle = LUI.UIText.new()
	FilterTitle:setLeftRight( 1, 1, -729, -395 )
	FilterTitle:setTopBottom( 0, 0, 240, 291 )
	FilterTitle:setRGB( 1, 0.39, 0 )
	FilterTitle:setText( Engine.Localize( "MENU_FILTER_SERVERS_CAPS" ) )
	FilterTitle:setTTF( "fonts/escom.ttf" )
	FilterTitle:setLetterSpacing( 1 )
	FilterTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FilterTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FilterTitle )
	self.FilterTitle = FilterTitle
	
	local FilterList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	FilterList:makeFocusable()
	FilterList:setLeftRight( 1, 1, -752, -77 )
	FilterList:setTopBottom( 0, 0, 310, 467 )
	FilterList:setWidgetType( CoD.codcaster_options_slider_small )
	FilterList:setVerticalCount( 3 )
	FilterList:setDataSource( "LeaderboardFilterOptions" )
	self:addElement( FilterList )
	self.FilterList = FilterList
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( self, controller )
	fefooterRighSlideIn:setLeftRight( 1, 1, -1062, -414 )
	fefooterRighSlideIn:setTopBottom( 1, 1, -48, 0 )
	fefooterRighSlideIn:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Leaderboard_ApplyFilters( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_LB_APPLY_FILTER", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	FilterList.id = "FilterList"
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.FilterList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FilterList:close()
		self.fefooterRighSlideIn:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Leaderboard_Filters.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

