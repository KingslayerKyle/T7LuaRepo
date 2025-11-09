require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNoHero" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget" )
require( "ui.uieditor.widgets.CAC.ClassAllocation" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListCustomClass" )

local PreLoadFunc = function ( self, controller )
	CoD.CACUtility.SetDefaultCACRoot( controller )
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ( menu, model )
		Engine.PIXBeginEvent( "chooseClass model change" )
		menu:processEvent( {
			name = "update_state",
			menu = menu
		} )
		Engine.PIXEndEvent()
	end )
end

local PostLoadFunc = function ( self )
	local controller = self:getOwner()
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	CoD.MenuNavigation[controller] = {
		{
			"class"
		}
	}
	self.classList.navigation = {
		right = nil
	}
end

LUI.createMenu.ChooseClass_InGame = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseClass_InGame" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local blackimage = LUI.UIImage.new()
	blackimage:setLeftRight( true, true, 0, 0 )
	blackimage:setTopBottom( true, true, 0, 0 )
	blackimage:setRGB( 0, 0, 0 )
	blackimage:setAlpha( 0.2 )
	blackimage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( blackimage )
	self.blackimage = blackimage
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( true, false, 64, 378 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.24, 0.24, 0.24 )
	LeftPanel.FEButtonPanel:setShaderVector( 0, 24.98, 25, 0, 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local background = CoD.CACBackgroundNoHero.new( self, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 1, 1 )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 96, 375 )
	title:setTopBottom( true, false, 54, 102 )
	title:setRGB( 0.5, 0.51, 0.52 )
	title:setAlpha( 0 )
	title:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
	title:setTTF( "fonts/default.ttf" )
	self:addElement( title )
	self.title = title
	
	local classList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	classList:makeFocusable()
	classList:setLeftRight( true, false, 77, 357 )
	classList:setTopBottom( true, false, 136, 644 )
	classList:setRGB( 1, 1, 1 )
	classList:setDataSource( "ChooseClass_InGame" )
	classList:setWidgetType( CoD.List1ButtonChooseClass )
	classList:setVerticalCount( 15 )
	classList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not IsInGame() then
			ChangeClass( self, element, controller )
			GoBack( self, controller )
		elseif IsInGame() then
			ChangeClass( self, element, controller )
			CloseStartMenu( self, controller )
		end
		return retVal
	end )
	classList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		UpdateClassView( self, element, controller )
		return retVal
	end )
	self:addElement( classList )
	self.classList = classList
	
	local chooseClassWidget = CoD.chooseClassWidget.new( self, controller )
	chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
	chooseClassWidget:setTopBottom( true, false, 80, 663 )
	chooseClassWidget:setRGB( 1, 1, 1 )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local classAllocation = CoD.ClassAllocation.new( self, controller )
	classAllocation:setLeftRight( false, true, -531, -96 )
	classAllocation:setTopBottom( true, false, 43, 78 )
	classAllocation:setRGB( 1, 1, 1 )
	classAllocation:setAlpha( 0 )
	self:addElement( classAllocation )
	self.classAllocation = classAllocation
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -750, 750 )
	FooterBacking:setTopBottom( false, false, 300, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local cacElemsSideListCustomClass0 = CoD.cac_ElemsSideListCustomClass.new( self, controller )
	cacElemsSideListCustomClass0:setLeftRight( true, false, 19, 417 )
	cacElemsSideListCustomClass0:setTopBottom( true, false, -12, 658 )
	cacElemsSideListCustomClass0:setRGB( 1, 1, 1 )
	cacElemsSideListCustomClass0.Image10:setAlpha( 0 )
	cacElemsSideListCustomClass0.Image101:setAlpha( 0 )
	self:addElement( cacElemsSideListCustomClass0 )
	self.cacElemsSideListCustomClass0 = cacElemsSideListCustomClass0
	
	background:linkToElementModel( classList, nil, false, function ( model )
		background:setModel( model, controller )
	end )
	chooseClassWidget:linkToElementModel( classList, nil, false, function ( model )
		chooseClassWidget:setModel( model, controller )
	end )
	classAllocation:linkToElementModel( classList, nil, false, function ( model )
		classAllocation:setModel( model, controller )
	end )
	classList.navigation = {
		right = chooseClassWidget
	}
	chooseClassWidget.navigation = {
		left = classList
	}
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			SendMenuResponse( self, "ChooseClass_InGame", "cancel", controller )
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	classList.id = "classList"
	chooseClassWidget.id = "chooseClassWidget"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.classList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.LeftPanel:close()
		self.background:close()
		self.classList:close()
		self.chooseClassWidget:close()
		self.classAllocation:close()
		self.cacElemsSideListCustomClass0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

