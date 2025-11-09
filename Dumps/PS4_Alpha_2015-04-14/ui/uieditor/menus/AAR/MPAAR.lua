require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.PerformanceTabWidget" )
require( "ui.uieditor.widgets.AAR.MedalsTab.MedalsTabWidget" )
require( "ui.uieditor.widgets.AAR.ChallengesTab.ChallengesTabWidget" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.ScoreboardTabWidget" )

local PreLoadFunc = function ( self, controller )
	CoD.AARUtility.SetupUIModels( controller )
end

LUI.createMenu.MPAAR = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MPAAR" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, true, 0, 0 )
	Bg:setTopBottom( true, true, 0, 0 )
	Bg:setRGB( 0, 0, 0 )
	Bg:setAlpha( 0.85 )
	Bg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Bg )
	self.Bg = Bg
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0 )
	TabFrame:setLeftRight( true, false, 0, 1280 )
	TabFrame:setTopBottom( true, false, 127, 653 )
	TabFrame:setRGB( 1, 1, 1 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( false, false, -649, 645 )
	TitleBacking:setTopBottom( false, false, -361, -238 )
	TitleBacking:setRGB( 0, 0, 0 )
	TitleBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local Tabs = CoD.basicTabList.new( self, controller )
	Tabs:setLeftRight( true, false, 64, 1216 )
	Tabs:setTopBottom( true, false, 84, 124 )
	Tabs:setRGB( 1, 1, 1 )
	Tabs.grid:setDataSource( "AARTabs" )
	Tabs.grid:setWidgetType( CoD.paintshopTabWidget )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local Title = CoD.cac_3dTitleIntermediary.new( self, controller )
	Title:setLeftRight( true, false, -72, 537 )
	Title:setTopBottom( true, false, -4, 142 )
	Title:setRGB( 1, 1, 1 )
	Title.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_AAR_CAPS" ) )
	self:addElement( Title )
	self.Title = Title
	
	local TabLine = LUI.UIImage.new()
	TabLine:setLeftRight( true, false, -11, 1293 )
	TabLine:setTopBottom( true, false, 80, 88 )
	TabLine:setRGB( 0.9, 0.9, 0.9 )
	TabLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	TabLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TabLine )
	self.TabLine = TabLine
	
	local TabLine0 = LUI.UIImage.new()
	TabLine0:setLeftRight( true, false, -11, 1293 )
	TabLine0:setTopBottom( true, false, 653, 661 )
	TabLine0:setRGB( 0.9, 0.9, 0.9 )
	TabLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	TabLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TabLine0 )
	self.TabLine0 = TabLine0
	
	local FETabIdle0 = CoD.FE_TabIdle.new( self, controller )
	FETabIdle0:setLeftRight( true, false, 665, 1975 )
	FETabIdle0:setTopBottom( true, false, 83, 124 )
	FETabIdle0:setRGB( 1, 1, 1 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local FETabIdle00 = CoD.FE_TabIdle.new( self, controller )
	FETabIdle00:setLeftRight( true, false, -665, 67 )
	FETabIdle00:setTopBottom( true, false, 83, 124 )
	FETabIdle00:setRGB( 1, 1, 1 )
	self:addElement( FETabIdle00 )
	self.FETabIdle00 = FETabIdle00
	
	TabFrame:linkToElementModel( Tabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TabFrame:changeFrameWidget( modelValue )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		return true
	end
	
	self.buttonPromptAddFunctions.select = function ( menu, element, event )
		return true
	end
	
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "select" or event.button == "key_shortcut" and event.key == "T") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	TabFrame.id = "TabFrame"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.TabFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.Tabs:close()
		self.Title:close()
		self.FETabIdle0:close()
		self.FETabIdle00:close()
		self.TabFrame:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

