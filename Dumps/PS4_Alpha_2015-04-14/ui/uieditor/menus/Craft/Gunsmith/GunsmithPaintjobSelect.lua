require( "ui.uieditor.widgets.CAC.TitleDotsWidget" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditor" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelectorItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithVariantModel )
end

LUI.createMenu.GunsmithPaintjobSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithPaintjobSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local HelpBacking00 = LUI.UIImage.new()
	HelpBacking00:setLeftRight( true, true, 0, 0 )
	HelpBacking00:setTopBottom( false, false, 292, 294 )
	HelpBacking00:setRGB( 0.01, 0.02, 0.02 )
	HelpBacking00:setAlpha( 0.7 )
	HelpBacking00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking00 )
	self.HelpBacking00 = HelpBacking00
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( true, true, 0, 0 )
	TitleBacking0:setTopBottom( true, false, -5, 83 )
	TitleBacking0:setRGB( 0, 0.02, 0.03 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local TitleDotsWidget0 = CoD.TitleDotsWidget.new( self, controller )
	TitleDotsWidget0:setLeftRight( true, false, 3, 528.34 )
	TitleDotsWidget0:setTopBottom( true, false, -65.33, 92.67 )
	TitleDotsWidget0:setRGB( 1, 1, 1 )
	TitleDotsWidget0:setAlpha( 0 )
	self:addElement( TitleDotsWidget0 )
	self.TitleDotsWidget0 = TitleDotsWidget0
	
	local WeaponListBacking = LUI.UIImage.new()
	WeaponListBacking:setLeftRight( true, false, 79.5, 380 )
	WeaponListBacking:setTopBottom( true, false, 174.5, 672.5 )
	WeaponListBacking:setRGB( 0.74, 0.82, 0.86 )
	WeaponListBacking:setAlpha( 0 )
	WeaponListBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( WeaponListBacking )
	self.WeaponListBacking = WeaponListBacking
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	CategoryListPanel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( self, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -71.25, 506.75 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -5.5, 140.5 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1293 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local HelpBacking0 = LUI.UIImage.new()
	HelpBacking0:setLeftRight( true, true, 0, 0 )
	HelpBacking0:setTopBottom( false, true, -68, 0 )
	HelpBacking0:setRGB( 0, 0, 0 )
	HelpBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking0 )
	self.HelpBacking0 = HelpBacking0
	
	local ElemsSideList = CoD.cac_ElemsSideList.new( self, controller )
	ElemsSideList:setLeftRight( true, false, 11, 78.87 )
	ElemsSideList:setTopBottom( true, false, 48, 718 )
	ElemsSideList:setRGB( 1, 1, 1 )
	self:addElement( ElemsSideList )
	self.ElemsSideList = ElemsSideList
	
	local paintjobsList = LUI.UIList.new( self, controller, 2, 0, nil, true, false, 0, 0, false, false )
	paintjobsList:makeFocusable()
	paintjobsList:setLeftRight( true, false, 108.75, 302.75 )
	paintjobsList:setTopBottom( true, false, 174.5, 564.5 )
	paintjobsList:setRGB( 1, 1, 1 )
	paintjobsList:setDataSource( "PaintjobList" )
	paintjobsList:setWidgetType( CoD.PaintjobSelectorItem )
	paintjobsList:setHorizontalCount( 2 )
	paintjobsList:setVerticalCount( 4 )
	paintjobsList:setVerticalScrollbar( CoD.verticalScrollbar )
	paintjobsList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		if not Paintjobs_IsOccupied( element, controller ) then
			Gunsmith_PaintjobSelector_ChooseEmptyPaintjob( self, element, controller )
			NavigateToMenu( self, "EmblemEditor", true, controller )
		elseif Paintjobs_IsOccupied( element, controller ) then
			Gunsmith_PaintjobSelector_ChooseOccupiedPaintjob( self, element, controller )
			Gunsmith_PaintjobSelector_Closed( self, element, controller )
			GoBack( self, controller )
		end
		return retVal
	end )
	paintjobsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		Gunsmith_PaintjobSelector_GainFocus( self, element, controller )
		return retVal
	end )
	paintjobsList:mergeStateConditions( {
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Paintjobs_IsOccupied( element, controller )
			end
		}
	} )
	self:addElement( paintjobsList )
	self.paintjobsList = paintjobsList
	
	local paintjobText = LUI.UIText.new()
	paintjobText:setLeftRight( true, false, 108.75, 514.75 )
	paintjobText:setTopBottom( true, false, 128, 153 )
	paintjobText:setRGB( 1, 1, 1 )
	paintjobText:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	paintjobText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	paintjobText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	paintjobText:subscribeToGlobalModel( controller, "Customization", "weapon_index", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			paintjobText:setText( Engine.Localize( LocalizeWeaponNameIntoString( modelValue, "MENU_PAINTSHOP_WEAPON_PAINTJOBS", controller ) ) )
		end
	end )
	self:addElement( paintjobText )
	self.paintjobText = paintjobText
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			Gunsmith_PaintjobSelector_Closed( self, element, controller )
			GoBack( self, controller )
		end
		if not self.occludedBy and event.button ~= "primary" and event.button == "key_shortcut" and event.key == "ENTER" then
			
		else
			
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	paintjobsList.id = "paintjobsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.paintjobsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.TitleDotsWidget0:close()
		self.cac3dTitleIntermediary0:close()
		self.ElemsSideList:close()
		self.paintjobsList:close()
		self.paintjobText:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

