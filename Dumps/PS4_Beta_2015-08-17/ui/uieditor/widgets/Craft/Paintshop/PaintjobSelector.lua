require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditor" )
require( "ui.uieditor.menus.Craft.Paintshop.PaintjobSelectorOptions" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelectorItem" )

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
	self:setLeftRight( true, false, 0, 418 )
	self:setTopBottom( true, false, 0, 528 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local paintjobsList = LUI.UIList.new( menu, controller, 7, 0, nil, true, false, 0, 0, false, false )
	paintjobsList:makeFocusable()
	paintjobsList:setLeftRight( true, false, 31, 369 )
	paintjobsList:setTopBottom( true, false, 7.35, 460.35 )
	paintjobsList:setDataSource( "PaintjobList" )
	paintjobsList:setWidgetType( CoD.PaintjobSelectorItem )
	paintjobsList:setHorizontalCount( 3 )
	paintjobsList:setVerticalCount( 4 )
	paintjobsList:setSpacing( 7 )
	paintjobsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		PaintjobSelector_GainFocus( self, element, controller )
		return retVal
	end )
	paintjobsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	paintjobsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( paintjobsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		PaintjobSelector_ChoosePaintjob( self, element, controller )
		OpenOverlay( self, "EmblemEditor", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( paintjobsList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if Paintjobs_IsOccupied( element, controller ) then
			OpenPopup( self, "PaintjobSelectorOptions", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_PAINTJOB_OPTIONS" )
		if Paintjobs_IsOccupied( element, controller ) then
			return true
		else
			return false
		end
	end, true )
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
				self.paintjobsList:setLeftRight( true, false, 27, 365 )
				self.paintjobsList:setTopBottom( true, false, 7.35, 460.35 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.paintjobsList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

