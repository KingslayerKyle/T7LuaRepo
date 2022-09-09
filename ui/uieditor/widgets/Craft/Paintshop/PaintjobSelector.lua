-- 54a2b442eba2d801ff5d388477074369
-- This hash is used for caching, delete to decompile the file again

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
	menu:AddButtonCallbackFunction( paintjobsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if ListHasElements( f5_arg0 ) and not CraftItemIsReadOnly( f5_arg0, f5_arg2 ) then
			OpenEmblemEditor( f5_arg0, f5_arg1, f5_arg2, f5_arg3, "PaintjobSelect" )
			return true
		elseif ListHasElements( f5_arg0 ) and CraftItemIsReadOnly( f5_arg0, f5_arg2 ) then
			FileshareShowReadonlyToast( self, f5_arg0, f5_arg2 )
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		if ListHasElements( f6_arg0 ) and not CraftItemIsReadOnly( f6_arg0, f6_arg2 ) then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		elseif ListHasElements( f6_arg0 ) and CraftItemIsReadOnly( f6_arg0, f6_arg2 ) then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( paintjobsList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if ListHasElements( f7_arg0 ) and Paintjobs_IsOccupied( f7_arg0, f7_arg2 ) then
			OpenPopup( self, "PaintjobSelectorOptions", f7_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if ListHasElements( f8_arg0 ) and Paintjobs_IsOccupied( f8_arg0, f8_arg2 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_PAINTJOB_OPTIONS" )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.paintjobsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
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
