require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.LethalGrenade.LethalGrenadeModItemWidget_Internal" )

local PostLoadFunc = function ( self, controller )
	self.modItemWidget.navigation = {}
end

CoD.LethalGrenadeModItemWidget = InheritFrom( LUI.UIElement )
CoD.LethalGrenadeModItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LethalGrenadeModItemWidget )
	self.id = "LethalGrenadeModItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 130 )
	self:setTopBottom( true, false, 0, 64 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	local modItemWidget = CoD.LethalGrenadeModItemWidget_Internal.new( menu, controller )
	modItemWidget:setLeftRight( true, true, 0, 0 )
	modItemWidget:setTopBottom( true, true, 0, 0 )
	modItemWidget:setRGB( 1, 1, 1 )
	modItemWidget:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return not IsPrimaryEquipmentModAvailable( menu, element, event )
			end
		},
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsCACSlotAvailable( menu, element, controller )
			end
		},
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	if modItemWidget.m_eventHandlers.update_class then
		local currentEv = modItemWidget.m_eventHandlers.update_class
		modItemWidget:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		modItemWidget:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	modItemWidget:linkToElementModel( modItemWidget, "itemIndex", true, function ( model )
		menu:updateElementState( modItemWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( modItemWidget )
	self.modItemWidget = modItemWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				modItemWidget:completeAnimation()
				self.modItemWidget:setZoom( 0 )
				self.clipFinished( modItemWidget, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 1 )
				local modItemWidgetFrame2 = function ( modItemWidget, event )
					if not event.interrupted then
						modItemWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					modItemWidget:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( modItemWidget, event )
					else
						modItemWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				modItemWidget:completeAnimation()
				self.modItemWidget:setZoom( 0 )
				modItemWidgetFrame2( modItemWidget, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				modItemWidget:completeAnimation()
				self.modItemWidget:setZoom( 25 )
				self.clipFinished( modItemWidget, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 1 )
				local modItemWidgetFrame2 = function ( modItemWidget, event )
					if not event.interrupted then
						modItemWidget:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					modItemWidget:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( modItemWidget, event )
					else
						modItemWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				modItemWidget:completeAnimation()
				self.modItemWidget:setZoom( 25 )
				modItemWidgetFrame2( modItemWidget, {} )
			end
		}
	}
	modItemWidget.id = "modItemWidget"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.modItemWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.modItemWidget:close()
		CoD.LethalGrenadeModItemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

