require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Prestige.Prestige_PrestigeIconButton" )
require( "ui.uieditor.widgets.Prestige.Prestige_PrestigeIconProfiler" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )

local PreLoadFunc = function ( self, controller )
	self.disablePopupOpenCloseAnim = true
end

LUI.createMenu.Prestige_CustomizePrestigeIconZM = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Prestige_CustomizePrestigeIconZM" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Prestige_CustomizePrestigeIconZM.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setAlpha( 0.65 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	FEButtonPanelShaderContainer0:setLeftRight( 0, 0, -16, 1928 )
	FEButtonPanelShaderContainer0:setTopBottom( 0, 0, 174, 1101 )
	FEButtonPanelShaderContainer0:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local MenuTitleBackground = LUI.UIImage.new()
	MenuTitleBackground:setLeftRight( 0, 1, 0, 0 )
	MenuTitleBackground:setTopBottom( 0.5, 0.5, -504, -414 )
	MenuTitleBackground:setRGB( 0.12, 0.13, 0.19 )
	MenuTitleBackground:setAlpha( 0 )
	self:addElement( MenuTitleBackground )
	self.MenuTitleBackground = MenuTitleBackground
	
	local ButtonBarBackground = LUI.UIImage.new()
	ButtonBarBackground:setLeftRight( 0, 1, -6, 0 )
	ButtonBarBackground:setTopBottom( 0.5, 0.5, 453, 498 )
	ButtonBarBackground:setRGB( 0.12, 0.13, 0.19 )
	ButtonBarBackground:setAlpha( 0 )
	self:addElement( ButtonBarBackground )
	self.ButtonBarBackground = ButtonBarBackground
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -412, -354 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_PRESTIGE_CUSTOMIZE_ICON_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PRESTIGE_CUSTOMIZE_ICON_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( self, controller )
	SelfIdentityBadge:setLeftRight( 1, 1, -652, -138 )
	SelfIdentityBadge:setTopBottom( 0, 0, 36, 126 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 27, 105 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 136, 1062 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local PrestigeIconList = LUI.UIList.new( self, controller, 8, 0, nil, true, false, 0, 0, false, false )
	PrestigeIconList:makeFocusable()
	PrestigeIconList:setLeftRight( 0, 0, 155.5, 657.5 )
	PrestigeIconList:setTopBottom( 0, 0, 217, 889 )
	PrestigeIconList:setWidgetType( CoD.Prestige_PrestigeIconButton )
	PrestigeIconList:setHorizontalCount( 3 )
	PrestigeIconList:setVerticalCount( 4 )
	PrestigeIconList:setSpacing( 8 )
	PrestigeIconList:setVerticalCounter( CoD.verticalCounter )
	PrestigeIconList:setDataSource( "PrestigeIconButtonList" )
	PrestigeIconList:linkToElementModel( PrestigeIconList, "isLocked", true, function ( model )
		local element = PrestigeIconList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	PrestigeIconList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	PrestigeIconList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( PrestigeIconList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsSelfModelValueTrue( element, controller, "isLocked" ) then
			SetParagonIcon( self, element, controller )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsSelfModelValueTrue( element, controller, "isLocked" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( PrestigeIconList )
	self.PrestigeIconList = PrestigeIconList
	
	local PrestigeIconProfiler = CoD.Prestige_PrestigeIconProfiler.new( self, controller )
	PrestigeIconProfiler:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" )
			end
		}
	} )
	PrestigeIconProfiler:linkToElementModel( PrestigeIconProfiler, "isLocked", true, function ( model )
		self:updateElementState( PrestigeIconProfiler, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	PrestigeIconProfiler:setLeftRight( 0, 0, 1103, 1553 )
	PrestigeIconProfiler:setTopBottom( 0, 0, 218, 668 )
	PrestigeIconProfiler:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeIconProfiler.RankText:setRGB( SetToParagonColorIfPrestigeMasterFromStorage( controller, "zm", 148, 162, 165, modelValue ) )
		end
	end )
	PrestigeIconProfiler:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeIconProfiler.RankText:setText( LevelStringFromStorage( controller, "zm", modelValue ) )
		end
	end )
	PrestigeIconProfiler:subscribeToGlobalModel( controller, "StorageGlobal", "stats_zm", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeIconProfiler.PrestigeMasterTierWidget.ParagonStars:setHorizontalCount( GetPrestigeMasterTierCountFromStorage( controller, "zm", modelValue ) )
		end
	end )
	self:addElement( PrestigeIconProfiler )
	self.PrestigeIconProfiler = PrestigeIconProfiler
	
	PrestigeIconProfiler:linkToElementModel( PrestigeIconList, nil, false, function ( model )
		PrestigeIconProfiler:setModel( model, controller )
	end )
	PrestigeIconProfiler:linkToElementModel( PrestigeIconList, "iconTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeIconProfiler.IconTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	PrestigeIconProfiler:linkToElementModel( PrestigeIconList, "gameTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeIconProfiler.GameTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	PrestigeIconProfiler:linkToElementModel( PrestigeIconList, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeIconProfiler.Description:setText( Engine.Localize( modelValue ) )
		end
	end )
	PrestigeIconProfiler:linkToElementModel( PrestigeIconList, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeIconProfiler.PrestigeIcon:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		GoBack( self, controller )
		ClearMenuSavedState( menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	PrestigeIconList.id = "PrestigeIconList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.PrestigeIconList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.FEButtonPanelShaderContainer0:close()
		self.MenuFrame:close()
		self.SelfIdentityBadge:close()
		self.FEMenuLeftGraphics:close()
		self.PrestigeIconList:close()
		self.PrestigeIconProfiler:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Prestige_CustomizePrestigeIconZM.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

