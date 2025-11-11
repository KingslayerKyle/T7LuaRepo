require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsPossibleItem" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectedItem_primary" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.SelectionItemCount" )

CoD.positionLoadoutsSelectionItem_primary = InheritFrom( LUI.UIElement )
CoD.positionLoadoutsSelectionItem_primary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.positionLoadoutsSelectionItem_primary )
	self.id = "positionLoadoutsSelectionItem_primary"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 140 )
	self:setTopBottom( 0, 0, 0, 120 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectedItem = CoD.positionLoadoutsSelectedItem_primary.new( menu, controller )
	selectedItem:setLeftRight( 0, 0, 10, 130 )
	selectedItem:setTopBottom( 0, 0, 0, 120 )
	selectedItem:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		SetPerControllerTableProperty( controller, "weaponCategory", element.actionParam )
		UpdateState( self, event )
		return retVal
	end )
	self:addElement( selectedItem )
	self.selectedItem = selectedItem
	
	local countLabel = CoD.SelectionItemCount.new( menu, controller )
	countLabel:setLeftRight( 0.5, 0.5, 85, 125 )
	countLabel:setTopBottom( 0, 0, 45, 75 )
	self:addElement( countLabel )
	self.countLabel = countLabel
	
	local possibleItemsList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	possibleItemsList:makeFocusable()
	possibleItemsList:setLeftRight( 0, 0, 146, 398 )
	possibleItemsList:setTopBottom( 0, 0, -6, 330 )
	possibleItemsList:setAlpha( 0 )
	possibleItemsList:setWidgetType( CoD.positionLoadoutsPossibleItem )
	possibleItemsList:setHorizontalCount( 3 )
	possibleItemsList:setVerticalCount( 4 )
	possibleItemsList:setSpacing( 0 )
	possibleItemsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	possibleItemsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( possibleItemsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		UpdateDataSource( self, self.possibleItemsList, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MPUI_EQUIP", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL )
		return true
	end, false )
	self:addElement( possibleItemsList )
	self.possibleItemsList = possibleItemsList
	
	selectedItem.navigation = {
		right = possibleItemsList
	}
	possibleItemsList.navigation = {
		left = selectedItem
	}
	self.resetProperties = function ()
		possibleItemsList:completeAnimation()
		possibleItemsList:setLeftRight( 0, 0, 146, 398 )
		possibleItemsList:setTopBottom( 0, 0, -6, 330 )
		possibleItemsList:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				possibleItemsList:completeAnimation()
				self.possibleItemsList:setAlpha( 0 )
				self.clipFinished( possibleItemsList, {} )
			end
		},
		FlyOut_Right = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				possibleItemsList:completeAnimation()
				self.possibleItemsList:setLeftRight( 0, 0, 138, 266 )
				self.possibleItemsList:setTopBottom( 0, 0, -2, 126 )
				self.possibleItemsList:setAlpha( 1 )
				self.clipFinished( possibleItemsList, {} )
			end
		},
		FlyOut_Left = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				possibleItemsList:completeAnimation()
				self.possibleItemsList:setLeftRight( 1, 1, -386, -136 )
				self.possibleItemsList:setTopBottom( 0, 0, -2, 333 )
				self.possibleItemsList:setAlpha( 1 )
				self.clipFinished( possibleItemsList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "FlyOut_Right",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "FlyOut_Right" )
			end
		},
		{
			stateName = "FlyOut_Left",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "FlyOut_Left" )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	selectedItem.id = "selectedItem"
	possibleItemsList.id = "possibleItemsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectedItem:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.selectedItem:close()
		self.countLabel:close()
		self.possibleItemsList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

