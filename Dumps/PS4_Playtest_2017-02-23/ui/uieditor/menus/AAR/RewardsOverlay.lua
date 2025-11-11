require( "ui.uieditor.menus.AAR.MPAAR" )
require( "ui.uieditor.menus.AAR.ZM.ZMAAR" )
require( "ui.uieditor.widgets.AAR.RewardsScreen.RewardsCarouselItem" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Scrollbars.horizontalCounter" )

local PostLoadFunc = function ( self, controller )
	local pregameRoot = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
	local pregameCloseAARModel = Engine.CreateModel( pregameRoot, "closeAAR" )
	self:subscribeToModel( pregameCloseAARModel, function ( model )
		self:close()
	end, false )
end

LUI.createMenu.RewardsOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "RewardsOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "RewardsOverlay.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( 0.5, 0.5, -976.5, 976.5 )
	Fade:setTopBottom( 0.5, 0.5, -561, 561 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0.5 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0.5, 0.5, -960, 960 )
	Background:setTopBottom( 0.5, 0.5, -540, 540 )
	Background:setImage( RegisterImage( "uie_t7_mp_menu_cac_version6_backdrop720p" ) )
	self:addElement( Background )
	self.Background = Background
	
	local TopBg = LUI.UIImage.new()
	TopBg:setLeftRight( 0, 1, 0, 0 )
	TopBg:setTopBottom( 0, 0, 0, 132 )
	TopBg:setRGB( 0, 0, 0 )
	self:addElement( TopBg )
	self.TopBg = TopBg
	
	local Fade0 = LUI.UIImage.new()
	Fade0:setLeftRight( 0.5, 0.5, -976.5, 976.5 )
	Fade0:setTopBottom( 0.5, 0.5, -561, 561 )
	Fade0:setRGB( 0, 0, 0 )
	Fade0:setAlpha( 0.7 )
	self:addElement( Fade0 )
	self.Fade0 = Fade0
	
	local BottomBg = LUI.UIImage.new()
	BottomBg:setLeftRight( 0, 1, 0, 0 )
	BottomBg:setTopBottom( 0, 0, 948, 1080 )
	BottomBg:setRGB( 0, 0, 0 )
	BottomBg:setAlpha( 0 )
	self:addElement( BottomBg )
	self.BottomBg = BottomBg
	
	local RewardsCarousel = LUI.UIList.new( self, controller, 45, 200, nil, false, true, 452, 0, false, false )
	RewardsCarousel:makeFocusable()
	RewardsCarousel:setLeftRight( 0, 0, 113, 4651 )
	RewardsCarousel:setTopBottom( 0, 0, 204, 870 )
	RewardsCarousel:setWidgetType( CoD.RewardsCarouselItem )
	RewardsCarousel:setHorizontalCount( 9 )
	RewardsCarousel:setSpacing( 45 )
	RewardsCarousel:setDataSource( "RewardsCarousel" )
	self:addElement( RewardsCarousel )
	self.RewardsCarousel = RewardsCarousel
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local horizontalCounter = CoD.horizontalCounter.new( self, controller )
	horizontalCounter:setLeftRight( 0, 0, 728, 1028 )
	horizontalCounter:setTopBottom( 0, 0, 934, 972 )
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
	
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsMultiplayer() then
			NavigateToMenu( self, "MPAAR", false, controller )
			return true
		elseif IsZombies() then
			GoBackAndOpenOverlayOnParent( self, "ZMAAR", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMultiplayer() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE", nil )
			return true
		elseif IsZombies() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsMultiplayer() then
			NavigateToMenu( self, "MPAAR", false, controller )
			return true
		elseif IsZombies() then
			NavigateToMenu( self, "ZMAAR", false, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsMultiplayer() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
			return false
		elseif IsZombies() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
			return false
		else
			return false
		end
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

