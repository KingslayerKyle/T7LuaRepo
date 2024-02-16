-- 6de39a5c74905cef2ea6b6d854ae0756
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.AAR.MPAAR" )
require( "ui.uieditor.menus.AAR.ZM.ZMAAR" )
require( "ui.uieditor.widgets.AAR.RewardsScreen.RewardsCarouselItem" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Scrollbars.horizontalCounter" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0.RewardsCarousel.m_keepFocusAsParent = true
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" ), "closeAAR" ), function ( model )
		f2_arg0:close()
	end, false )
	if CoD.isPC then
		f0_local0( f2_arg0, f2_arg1 )
	end
end

LUI.createMenu.RewardsOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "RewardsOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "RewardsOverlay.buttonPrompts" )
	local f4_local1 = self
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
	
	local BottomBg = LUI.UIImage.new()
	BottomBg:setLeftRight( true, true, 0, 0 )
	BottomBg:setTopBottom( true, false, 632, 720 )
	BottomBg:setRGB( 0, 0, 0 )
	BottomBg:setAlpha( 0 )
	self:addElement( BottomBg )
	self.BottomBg = BottomBg
	
	local RewardsCarousel = LUI.UIList.new( f4_local1, controller, 30, 200, nil, false, true, 452, 0, false, false )
	RewardsCarousel:makeFocusable()
	RewardsCarousel:setLeftRight( true, false, 0, 3176 )
	RewardsCarousel:setTopBottom( true, false, 136, 580 )
	RewardsCarousel:setDataSource( "RewardsCarousel" )
	RewardsCarousel:setWidgetType( CoD.RewardsCarouselItem )
	RewardsCarousel:setHorizontalCount( 9 )
	RewardsCarousel:setSpacing( 30 )
	self:addElement( RewardsCarousel )
	self.RewardsCarousel = RewardsCarousel
	
	local MenuFrame = CoD.GenericMenuFrame.new( f4_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local horizontalCounter = CoD.horizontalCounter.new( f4_local1, controller )
	horizontalCounter:setLeftRight( true, false, 485, 685 )
	horizontalCounter:setTopBottom( true, false, 623, 648 )
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
	
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		local f6_local0 = self
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( f6_local0, f4_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if IsMultiplayer() then
			NavigateToMenu( self, "MPAAR", false, f7_arg2 )
			return true
		elseif IsZombies() then
			GoBackAndOpenOverlayOnParent( self, "ZMAAR", f7_arg2 )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		if IsMultiplayer() then
			return true
		elseif IsZombies() then
			return true
		else
			return false
		end
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if IsMultiplayer() then
			NavigateToMenu( self, "MPAAR", false, f9_arg2 )
			return true
		elseif IsZombies() then
			NavigateToMenu( self, "ZMAAR", false, f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		if IsMultiplayer() then
			return false
		elseif IsZombies() then
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
		menu = f4_local1
	} )
	if not self:restoreState() then
		self.RewardsCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RewardsCarousel:close()
		element.MenuFrame:close()
		element.horizontalCounter:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "RewardsOverlay.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

