require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassGenericItemButton" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassMinorHeader" )

CoD.LethalAttachments = InheritFrom( LUI.UIElement )
CoD.LethalAttachments.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LethalAttachments )
	self.id = "LethalAttachments"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 134 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	local Attachment = CoD.CustomClassGenericItemButton.new( menu, controller )
	Attachment:setLeftRight( true, false, 0, 108 )
	Attachment:setTopBottom( true, false, 26, 134 )
	Attachment:setRGB( 1, 1, 1 )
	Attachment:linkToElementModel( self, nil, false, function ( model )
		Attachment:setModel( model, controller )
	end )
	Attachment:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Unavailable_Gadget",
			condition = function ( menu, element, event )
				return not IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "Unequipped_Gadget",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		},
		{
			stateName = "Equipped_Gadget",
			condition = function ( menu, element, event )
				return IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	if Attachment.m_eventHandlers.update_class then
		local currentEv = Attachment.m_eventHandlers.update_class
		Attachment:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		Attachment:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	Attachment:linkToElementModel( Attachment, "itemIndex", true, function ( model )
		menu:updateElementState( Attachment, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( Attachment )
	self.Attachment = Attachment
	
	local currentEv = CoD.CustomClassMinorHeader.new( menu, controller )
	currentEv:setLeftRight( true, false, 0, 108 )
	currentEv:setTopBottom( true, false, 0, 20 )
	currentEv.text:setText( Engine.Localize( "MENU_QUANTITY_CAPS" ) )
	self:addElement( currentEv )
	self.LethalQuantityHeader = currentEv
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Attachment:completeAnimation()
				self.Attachment:setAlpha( 1 )
				self.clipFinished( Attachment, {} )
			end
		}
	}
	Attachment.id = "Attachment"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Attachment:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.Attachment:close()
		self.LethalQuantityHeader:close()
		CoD.LethalAttachments.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

