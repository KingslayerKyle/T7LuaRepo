require( "ui.uieditor.widgets.CAC.GridItemButtonBackdropContainer2x4" )
require( "ui.uieditor.menus.Craft.EmblemEditor.EmblemEditor" )
require( "ui.uieditor.menus.Craft.Paintshop.PaintjobSelectorOptions" )
require( "ui.uieditor.widgets.Craft.Paintshop.PaintjobSelectorItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )

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
	self:setLeftRight( true, false, 0, 920 )
	self:setTopBottom( true, false, 0, 528 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local WeaponListBacking = LUI.UIImage.new()
	WeaponListBacking:setLeftRight( true, false, 15, 276 )
	WeaponListBacking:setTopBottom( true, false, 32.5, 495.5 )
	WeaponListBacking:setRGB( 0.74, 0.82, 0.86 )
	WeaponListBacking:setAlpha( 0.03 )
	WeaponListBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( WeaponListBacking )
	self.WeaponListBacking = WeaponListBacking
	
	local GridItemButtonBackdropContainer2x40 = CoD.GridItemButtonBackdropContainer2x4.new( menu, controller )
	GridItemButtonBackdropContainer2x40:setLeftRight( true, false, 7, 240 )
	GridItemButtonBackdropContainer2x40:setTopBottom( true, false, 39, 495 )
	GridItemButtonBackdropContainer2x40:setRGB( 1, 1, 1 )
	GridItemButtonBackdropContainer2x40:setAlpha( 0.5 )
	self:addElement( GridItemButtonBackdropContainer2x40 )
	self.GridItemButtonBackdropContainer2x40 = GridItemButtonBackdropContainer2x40
	
	local paintjobsList = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	paintjobsList:makeFocusable()
	paintjobsList:setLeftRight( true, false, 31, 225 )
	paintjobsList:setTopBottom( true, false, 44.35, 434.35 )
	paintjobsList:setRGB( 1, 1, 1 )
	paintjobsList:setDataSource( "PaintjobList" )
	paintjobsList:setWidgetType( CoD.PaintjobSelectorItem )
	paintjobsList:setHorizontalCount( 2 )
	paintjobsList:setVerticalCount( 4 )
	paintjobsList:setVerticalScrollbar( CoD.verticalScrollbar )
	paintjobsList.buttonPromptAddFunctions = {}
	paintjobsList.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		if element:isInFocus() and Paintjobs_IsOccupied( element, controller ) then
			menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_PAINTJOB_OPTIONS" ), "A", element )
			return true
		else
			
		end
	end
	
	paintjobsList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		PaintjobSelector_ChoosePaintjob( self, element, controller )
		OpenOverlay( self, "EmblemEditor", controller )
		return retVal
	end )
	paintjobsList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		PaintjobSelector_GainFocus( self, element, controller )
		return retVal
	end )
	paintjobsList:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			if Paintjobs_IsOccupied( element, controller ) then
				OpenPopup( self, "PaintjobSelectorOptions", controller )
			end
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	paintjobsList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.alt1( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	paintjobsList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "alt1", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	paintjobsList:updateButtonPromptEventHandlers()
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
	
	local upperline = LUI.UIImage.new()
	upperline:setLeftRight( true, true, 0, 0 )
	upperline:setTopBottom( true, false, 1.35, 3.35 )
	upperline:setRGB( 1, 1, 1 )
	upperline:setAlpha( 0 )
	upperline:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( upperline )
	self.upperline = upperline
	
	local bottomline = LUI.UIImage.new()
	bottomline:setLeftRight( true, true, 0, 0 )
	bottomline:setTopBottom( true, false, 525.28, 527.28 )
	bottomline:setRGB( 1, 1, 1 )
	bottomline:setAlpha( 0 )
	bottomline:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bottomline )
	self.bottomline = bottomline
	
	local paintjobText = LUI.UIText.new()
	paintjobText:setLeftRight( true, false, 37, 443 )
	paintjobText:setTopBottom( true, false, 1, 26 )
	paintjobText:setRGB( 1, 1, 1 )
	paintjobText:setTTF( "fonts/Entovo.ttf" )
	paintjobText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				upperline:completeAnimation()
				self.upperline:setAlpha( 0 )
				self.clipFinished( upperline, {} )
				bottomline:completeAnimation()
				self.bottomline:setAlpha( 0 )
				self.clipFinished( bottomline, {} )
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
	self.close = function ( self )
		self.GridItemButtonBackdropContainer2x40:close()
		self.paintjobsList:close()
		self.paintjobText:close()
		CoD.PaintjobSelector.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

