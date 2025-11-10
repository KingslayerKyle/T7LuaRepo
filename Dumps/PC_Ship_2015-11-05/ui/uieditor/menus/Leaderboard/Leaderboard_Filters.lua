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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Leaderboard_Filters.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( false, true, -530, 0 )
	leftBackground:setTopBottom( true, true, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.97 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local leftLineStripe = LUI.UIImage.new()
	leftLineStripe:setLeftRight( false, true, -530, -529 )
	leftLineStripe:setTopBottom( true, true, 0, 0 )
	leftLineStripe:setAlpha( 0.42 )
	self:addElement( leftLineStripe )
	self.leftLineStripe = leftLineStripe
	
	local FilterTitle = LUI.UIText.new()
	FilterTitle:setLeftRight( false, true, -486, -263.5 )
	FilterTitle:setTopBottom( true, false, 160, 194 )
	FilterTitle:setRGB( 1, 0.39, 0 )
	FilterTitle:setText( Engine.Localize( "MENU_FILTER_SERVERS_CAPS" ) )
	FilterTitle:setTTF( "fonts/escom.ttf" )
	FilterTitle:setLetterSpacing( 1 )
	FilterTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FilterTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FilterTitle )
	self.FilterTitle = FilterTitle
	
	local FilterList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	FilterList:makeFocusable()
	FilterList:setLeftRight( false, true, -501, -51 )
	FilterList:setTopBottom( true, false, 206, 312 )
	FilterList:setDataSource( "LeaderboardFilterOptions" )
	FilterList:setWidgetType( CoD.codcaster_options_slider_small )
	FilterList:setVerticalCount( 3 )
	self:addElement( FilterList )
	self.FilterList = FilterList
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( self, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -708, -276 )
	fefooterRighSlideIn:setTopBottom( false, true, -32, 0 )
	fefooterRighSlideIn:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SizeToSafeArea( element, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		Leaderboard_ApplyFilters( self, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_LB_APPLY_FILTER" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FilterList:close()
		element.fefooterRighSlideIn:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Leaderboard_Filters.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

