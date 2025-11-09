require( "ui.uieditor.menus.Craft.Paintshop.PaintjobSelectorOptions" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelectorItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

CoD.PaintjobSelector = InheritFrom( LUI.UIElement )
CoD.PaintjobSelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintjobSelector )
	self.id = "PaintjobSelector"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 340 )
	self:setTopBottom( true, false, 0, 572 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local paintjobsList = LUI.UIList.new( menu, controller, 7, 0, nil, true, false, 0, 0, false, false )
	paintjobsList:makeFocusable()
	paintjobsList:setLeftRight( true, false, 0, 338 )
	paintjobsList:setTopBottom( true, false, 0, 453 )
	paintjobsList:setWidgetType( CoD.PaintjobSelectorItem )
	paintjobsList:setHorizontalCount( 3 )
	paintjobsList:setVerticalCount( 4 )
	paintjobsList:setSpacing( 7 )
	paintjobsList:setVerticalCounter( CoD.verticalCounter )
	paintjobsList:setDataSource( "PaintjobList" )
	paintjobsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f2_local0 = nil
		PaintjobSelector_GainFocus( self, element, controller )
		return f2_local0
	end )
	paintjobsList:registerEventHandler( "gain_focus", function ( element, event )
		local f3_local0 = nil
		if element.gainFocus then
			f3_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f3_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return f3_local0
	end )
	paintjobsList:registerEventHandler( "lose_focus", function ( element, event )
		local f4_local0 = nil
		if element.loseFocus then
			f4_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f4_local0 = element.super:loseFocus( event )
		end
		return f4_local0
	end )
	menu:AddButtonCallbackFunction( paintjobsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if ListHasElements( element ) and not CraftItemIsReadOnly( element, controller ) then
			OpenEmblemEditor( element, menu, controller, model, "PaintjobSelect" )
			return true
		elseif ListHasElements( element ) and CraftItemIsReadOnly( element, controller ) then
			FileshareShowReadonlyToast( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ListHasElements( element ) and not CraftItemIsReadOnly( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif ListHasElements( element ) and CraftItemIsReadOnly( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( paintjobsList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if ListHasElements( element ) and Paintjobs_IsOccupied( element, controller ) then
			OpenPopup( self, "PaintjobSelectorOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ListHasElements( element ) and Paintjobs_IsOccupied( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_PAINTJOB_OPTIONS" )
			return true
		else
			return false
		end
	end, false )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				paintjobsList:completeAnimation()
				self.paintjobsList:setLeftRight( true, false, 0, 338 )
				self.paintjobsList:setTopBottom( true, false, 0, 453 )
				self.clipFinished( paintjobsList, {} )
			end
		}
	}
	paintjobsList.id = "paintjobsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.paintjobsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.paintjobsList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

