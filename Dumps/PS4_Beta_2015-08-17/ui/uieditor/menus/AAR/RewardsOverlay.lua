require( "ui.uieditor.menus.AAR.MPAAR" )
require( "ui.uieditor.widgets.AAR.RewardsScreen.RewardsCarouselItem" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Scrollbars.horizontalCounter" )

LUI.createMenu.RewardsOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "RewardsOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "RewardsOverlay.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( false, false, -651, 651 )
	Fade:setTopBottom( false, false, -374, 374 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0.5 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -640, 640 )
	Background:setTopBottom( false, false, -360, 360 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local TopBg = LUI.UIImage.new()
	TopBg:setLeftRight( true, true, 0, 0 )
	TopBg:setTopBottom( true, false, 0, 88 )
	TopBg:setRGB( 0, 0, 0 )
	self:addElement( TopBg )
	self.TopBg = TopBg
	
	local Fade0 = LUI.UIImage.new()
	Fade0:setLeftRight( false, false, -651, 651 )
	Fade0:setTopBottom( false, false, -374, 374 )
	Fade0:setRGB( 0, 0, 0 )
	Fade0:setAlpha( 0.7 )
	self:addElement( Fade0 )
	self.Fade0 = Fade0
	
	local RewardsTitle = LUI.UITightText.new()
	RewardsTitle:setLeftRight( true, false, 64, 564 )
	RewardsTitle:setTopBottom( true, false, 36, 84 )
	RewardsTitle:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	RewardsTitle:setTTF( "fonts/default.ttf" )
	self:addElement( RewardsTitle )
	self.RewardsTitle = RewardsTitle
	
	local BottomBg = LUI.UIImage.new()
	BottomBg:setLeftRight( true, true, 0, 0 )
	BottomBg:setTopBottom( true, false, 632, 720 )
	BottomBg:setRGB( 0, 0, 0 )
	BottomBg:setAlpha( 0 )
	self:addElement( BottomBg )
	self.BottomBg = BottomBg
	
	local RewardsCarousel = LUI.UIList.new( self, controller, 30, 200, nil, false, true, 452, 0, false, false )
	RewardsCarousel:makeFocusable()
	RewardsCarousel:setLeftRight( true, false, 0, 3176 )
	RewardsCarousel:setTopBottom( true, false, 136, 580 )
	RewardsCarousel:setDataSource( "RewardsCarousel" )
	RewardsCarousel:setWidgetType( CoD.RewardsCarouselItem )
	RewardsCarousel:setHorizontalCount( 9 )
	RewardsCarousel:setSpacing( 30 )
	self:addElement( RewardsCarousel )
	self.RewardsCarousel = RewardsCarousel
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local horizontalCounter = CoD.horizontalCounter.new( self, controller )
	horizontalCounter:setLeftRight( true, false, 485, 685 )
	horizontalCounter:setTopBottom( true, false, 623, 648 )
	horizontalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetAsListHorizontalCounter( self, element, "RewardsCarousel" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( horizontalCounter )
	self.horizontalCounter = horizontalCounter
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		NavigateToMenu( self, "MPAAR", false, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		NavigateToMenu( self, "MPAAR", false, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	RewardsCarousel.id = "RewardsCarousel"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.RewardsCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.RewardsCarousel:close()
		self.MenuFrame:close()
		self.horizontalCounter:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "RewardsOverlay.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

