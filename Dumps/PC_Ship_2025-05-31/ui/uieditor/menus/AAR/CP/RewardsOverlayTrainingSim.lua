require( "ui.uieditor.widgets.AAR.RewardsScreen.RewardsCarouselItem" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Scrollbars.horizontalCounter" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.RewardsCarousel.m_keepFocusAsParent = true
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	if CoD.isPC then
		f0_local0( f2_arg0, f2_arg1 )
	end
end

LUI.createMenu.RewardsOverlayTrainingSim = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "RewardsOverlayTrainingSim" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "RewardsOverlayTrainingSim.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local TopBg = LUI.UIImage.new()
	TopBg:setLeftRight( true, true, 0, 0 )
	TopBg:setTopBottom( true, false, 0, 88 )
	TopBg:setRGB( 0, 0, 0 )
	self:addElement( TopBg )
	self.TopBg = TopBg
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( true, true, -11, 11 )
	Fade:setTopBottom( true, true, -14, 14 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0.9 )
	self:addElement( Fade )
	self.Fade = Fade
	
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
	
	local feFooterContainer = CoD.fe_FooterContainer.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -80, 0 )
	feFooterContainer:setAlpha( 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		SizeToSafeArea( element, controller )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local horizontalCounter = CoD.horizontalCounter.new( self, controller )
	horizontalCounter:setLeftRight( false, false, -155, 45 )
	horizontalCounter:setTopBottom( false, false, 263, 288 )
	horizontalCounter:registerEventHandler( "menu_loaded", function ( element, event )
		local f5_local0 = nil
		SetAsListHorizontalCounter( self, element, "RewardsCarousel" )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( horizontalCounter )
	self.horizontalCounter = horizontalCounter
	
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		return true
	end, false )
	RewardsCarousel.id = "RewardsCarousel"
	feFooterContainer:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RewardsCarousel:close()
		element.feFooterContainer:close()
		element.MenuFrame:close()
		element.horizontalCounter:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "RewardsOverlayTrainingSim.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

