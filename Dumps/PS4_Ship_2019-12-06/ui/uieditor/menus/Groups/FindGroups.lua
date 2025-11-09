require( "ui.uieditor.widgets.Groups.FindGroupsCategoryButton" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )

LUI.createMenu.FindGroups = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FindGroups" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FindGroups.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 92.93, 381 )
	Image0:setTopBottom( true, false, 154, 615 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local BlackTint0 = LUI.UIImage.new()
	BlackTint0:setLeftRight( true, false, 65, 468.5 )
	BlackTint0:setTopBottom( true, false, 86, 684 )
	BlackTint0:setRGB( 0, 0, 0 )
	BlackTint0:setAlpha( 0.3 )
	self:addElement( BlackTint0 )
	self.BlackTint0 = BlackTint0
	
	local CategoriesList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	CategoriesList:makeFocusable()
	CategoriesList:setLeftRight( true, false, 80, 454 )
	CategoriesList:setTopBottom( true, false, 156, 476 )
	CategoriesList:setWidgetType( CoD.FindGroupsCategoryButton )
	CategoriesList:setVerticalCount( 5 )
	CategoriesList:setSpacing( 5 )
	CategoriesList:setDataSource( "FindGroupsCategoryList" )
	CategoriesList:linkToElementModel( CategoriesList, "category", true, function ( model )
		local f2_local0 = CategoriesList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "category"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CategoriesList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchResultsVisible" ), function ( model )
		local f3_local0 = CategoriesList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchResultsVisible"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CategoriesList:linkToElementModel( CategoriesList, "action", true, function ( model )
		local f4_local0 = CategoriesList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "action"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	CategoriesList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchPlayerResultsVisible" ), function ( model )
		local f5_local0 = CategoriesList
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchPlayerResultsVisible"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CategoriesList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	CategoriesList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( CategoriesList, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsSelfModelValueEqualTo( element, controller, "category", "params" ) and IsModelValueTrue( controller, "groups.searchResultsVisible" ) then
			UpdateFindGroupsTabSearchFrameWidget( self, element, controller )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "playerSearch" ) and IsModelValueTrue( controller, "groups.searchPlayerResultsVisible" ) then
			UpdateFindGroupsTabSearchPlayerFrameWidget( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueEqualTo( element, controller, "category", "params" ) and IsModelValueTrue( controller, "groups.searchResultsVisible" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "GROUPS_UPDATE_SEARCH" )
			return true
		elseif IsSelfModelValueEqualTo( element, controller, "category", "playerSearch" ) and IsModelValueTrue( controller, "groups.searchPlayerResultsVisible" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "GROUPS_UPDATE_SEARCH" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( CategoriesList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsSelfModelValueNil( element, controller, "action" ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueNil( element, controller, "action" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	CategoriesList:mergeStateConditions( {
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return not IsParentListInFocus( element )
			end
		}
	} )
	self:addElement( CategoriesList )
	self.CategoriesList = CategoriesList
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 64, 1099 )
	Background:setTopBottom( true, false, 154, 614 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local FindGroupsTabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	FindGroupsTabFrame:setLeftRight( true, false, 495, 1245 )
	FindGroupsTabFrame:setTopBottom( true, false, 155, 706 )
	LUI.OverrideFunction_CallOriginalFirst( FindGroupsTabFrame, "close", function ( element )
		ClearSavedState( self, controller )
	end )
	self:addElement( FindGroupsTabFrame )
	self.FindGroupsTabFrame = FindGroupsTabFrame
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "GROUPS_FIND_GROUPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "GROUPS_FIND_GROUPS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_emblem" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 18, 70 )
	FEMenuLeftGraphics:setTopBottom( true, false, 91, 708.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 24, 84 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	FindGroupsTabFrame:linkToElementModel( CategoriesList, "frameWidget", true, function ( model )
		local frameWidget = Engine.GetModelValue( model )
		if frameWidget then
			FindGroupsTabFrame:changeFrameWidget( frameWidget )
		end
	end )
	CategoriesList.navigation = {
		right = FindGroupsTabFrame
	}
	FindGroupsTabFrame.navigation = {
		left = CategoriesList
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( self, event )
		local f17_local0 = nil
		HandleGroupsKeyboardComplete( self, self, controller, event )
		if not f17_local0 then
			f17_local0 = self:dispatchEventToChildren( event )
		end
		return f17_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ClearSavedState( self, controller )
		SetGlobalModelValue( "socialRoot.tab", "groups" )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if AlwaysFalse() then
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if AlwaysFalse() then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "" )
			return false
		else
			return false
		end
	end, false )
	CategoriesList.id = "CategoriesList"
	FindGroupsTabFrame.id = "FindGroupsTabFrame"
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
		self.CategoriesList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CategoriesList:close()
		element.MenuFrame:close()
		element.FEMenuLeftGraphics:close()
		element.SelfIdentityBadge:close()
		element.FindGroupsTabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FindGroups.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

