require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.menus.AAR.CP.CPAAR" )
require( "ui.uieditor.menus.AAR.CP.RewardsOverlayCP" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_GenericForeground_Full" )

local PreLoadFunc = function ( self, controller )
	CoD.AARUtilityCP.CreateModelsForRewards( controller )
end

CoD.cpReachedMaxLevelOverlayFrame = InheritFrom( LUI.UIElement )
CoD.cpReachedMaxLevelOverlayFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cpReachedMaxLevelOverlayFrame )
	self.id = "cpReachedMaxLevelOverlayFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, false, 0, 352 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:setAlpha( 0 )
	self:addElement( backing )
	self.backing = backing
	
	local secretHiddenButton = CoD.list1ButtonNewStyle.new( menu, controller )
	secretHiddenButton:setLeftRight( true, false, 418, 698 )
	secretHiddenButton:setTopBottom( true, false, 256, 288 )
	secretHiddenButton:setAlpha( 0 )
	secretHiddenButton:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			secretHiddenButton.btnDisplayText:setText( Engine.Localize( displayText ) )
		end
	end )
	secretHiddenButton:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			secretHiddenButton.btnDisplayTextStroke:setText( Engine.Localize( displayText ) )
		end
	end )
	secretHiddenButton:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards.aarRewardsCount" ), function ( model )
		local f5_local0 = secretHiddenButton
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "aarRewards.aarRewardsCount"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	secretHiddenButton:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	secretHiddenButton:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( secretHiddenButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsModelValueEqualTo( controller, "aarRewards.aarRewardsCount", 0 ) then
			SetPerControllerTableProperty( controller, "fromMaxLevelMessage", true )
			OpenOverlay( self, "CPAAR", controller, "", "" )
			return true
		else
			SetPerControllerTableProperty( controller, "fromMaxLevelMessage", true )
			OpenOverlay( self, "RewardsOverlayCP", controller, "", "" )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		return true
	end, false )
	secretHiddenButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:addElement( secretHiddenButton )
	self.secretHiddenButton = secretHiddenButton
	
	local foreground = CoD.systemOverlay_Layout_GenericForeground_Full.new( menu, controller )
	foreground:setLeftRight( true, true, 0, 0 )
	foreground:setTopBottom( true, true, 0, 0 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( true, false, 48, 304 )
	rankIcon:setTopBottom( true, false, 32, 288 )
	rankIcon:setImage( RegisterImage( "uie_t7_icon_rank_cp_level_20_lrg" ) )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	secretHiddenButton.navigation = {
		up = foreground,
		right = foreground
	}
	foreground.navigation = {
		left = secretHiddenButton,
		down = secretHiddenButton
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	secretHiddenButton.id = "secretHiddenButton"
	foreground.id = "foreground"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.secretHiddenButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.secretHiddenButton:close()
		element.foreground:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

