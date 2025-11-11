require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

CoD.GroupEmblemsTab = InheritFrom( LUI.UIElement )
CoD.GroupEmblemsTab.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupEmblemsTab )
	self.id = "GroupEmblemsTab"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1728 )
	self:setTopBottom( 0, 0, 0, 691 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 0, 1725 )
	Background:setTopBottom( 0, 0, 0, 728 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0 )
	Background:setScale( 1.1 )
	self:addElement( Background )
	self.Background = Background
	
	local emblemDrawWidget = CoD.EmblemDrawWidgetNew.new( menu, controller )
	emblemDrawWidget:setLeftRight( 0, 0, 1044, 1694 )
	emblemDrawWidget:setTopBottom( 0, 0, 50, 458 )
	self:addElement( emblemDrawWidget )
	self.emblemDrawWidget = emblemDrawWidget
	
	local emblemList = LUI.UIList.new( menu, controller, 10, 0, nil, true, false, 0, 0, false, false )
	emblemList:makeFocusable()
	emblemList:mergeStateConditions( {
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return not Emblem_IsOccupied( element, controller )
			end
		}
	} )
	emblemList:linkToElementModel( emblemList, "isBMClassified", true, function ( model )
		menu:updateElementState( emblemList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	emblemList:linkToElementModel( emblemList, "emblemIndex", true, function ( model )
		menu:updateElementState( emblemList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "emblemIndex"
		} )
	end )
	emblemList:setLeftRight( 0, 0, 49.5, 861.5 )
	emblemList:setTopBottom( 0, 0, 50.5, 556.5 )
	emblemList:setWidgetType( CoD.EmblemItem )
	emblemList:setHorizontalCount( 3 )
	emblemList:setVerticalCount( 3 )
	emblemList:setSpacing( 10 )
	emblemList:setVerticalScrollbar( CoD.verticalScrollbar )
	emblemList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		EmblemSelect_GainFocus( self, element, controller )
		return retVal
	end )
	emblemList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	emblemList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( emblemList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if Emblem_IsOccupied( element, controller ) then
			PlaySoundSetSound( self, "toggle" )
			GoBack( self, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if Emblem_IsOccupied( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SET_AS_EMBLEM", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( emblemList )
	self.emblemList = emblemList
	
	emblemDrawWidget.navigation = {
		left = emblemList
	}
	emblemList.navigation = {
		right = emblemDrawWidget
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	emblemDrawWidget.id = "emblemDrawWidget"
	emblemList.id = "emblemList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.emblemList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.emblemDrawWidget:close()
		self.emblemList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

