require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.Perk.PerkItemWidgetItem_Internal" )

CoD.PerkItemWidget_Internal = InheritFrom( LUI.UIElement )
CoD.PerkItemWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PerkItemWidget_Internal )
	self.id = "PerkItemWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 91 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	local PerkItemWidgetItemInternal0 = CoD.PerkItemWidgetItem_Internal.new( menu, controller )
	PerkItemWidgetItemInternal0:setLeftRight( true, false, 0, 128 )
	PerkItemWidgetItemInternal0:setTopBottom( true, false, 0, 91 )
	PerkItemWidgetItemInternal0:setRGB( 1, 1, 1 )
	PerkItemWidgetItemInternal0:mergeStateConditions( {
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				local f2_local0
				if not IsCACSlotAvailable( menu, element, controller ) then
					f2_local0 = IsCACAnyGreedWildcardUnequipped( element, controller )
				else
					f2_local0 = false
				end
				return f2_local0
			end
		},
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	if PerkItemWidgetItemInternal0.m_eventHandlers.update_class then
		local currentEv = PerkItemWidgetItemInternal0.m_eventHandlers.update_class
		PerkItemWidgetItemInternal0:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		PerkItemWidgetItemInternal0:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	PerkItemWidgetItemInternal0:linkToElementModel( PerkItemWidgetItemInternal0, "itemIndex", true, function ( model )
		menu:updateElementState( PerkItemWidgetItemInternal0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( PerkItemWidgetItemInternal0 )
	self.PerkItemWidgetItemInternal0 = PerkItemWidgetItemInternal0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PerkItemWidgetItemInternal0:completeAnimation()
				self.PerkItemWidgetItemInternal0:setZoom( 0 )
				self.clipFinished( PerkItemWidgetItemInternal0, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 1 )
				local PerkItemWidgetItemInternal0Frame2 = function ( PerkItemWidgetItemInternal0, event )
					if not event.interrupted then
						PerkItemWidgetItemInternal0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					PerkItemWidgetItemInternal0:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( PerkItemWidgetItemInternal0, event )
					else
						PerkItemWidgetItemInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PerkItemWidgetItemInternal0:completeAnimation()
				self.PerkItemWidgetItemInternal0:setZoom( 0 )
				PerkItemWidgetItemInternal0Frame2( PerkItemWidgetItemInternal0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				PerkItemWidgetItemInternal0:completeAnimation()
				self.PerkItemWidgetItemInternal0:setZoom( 25 )
				self.clipFinished( PerkItemWidgetItemInternal0, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 1 )
				local PerkItemWidgetItemInternal0Frame2 = function ( PerkItemWidgetItemInternal0, event )
					if not event.interrupted then
						PerkItemWidgetItemInternal0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					PerkItemWidgetItemInternal0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( PerkItemWidgetItemInternal0, event )
					else
						PerkItemWidgetItemInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PerkItemWidgetItemInternal0:completeAnimation()
				self.PerkItemWidgetItemInternal0:setZoom( 25 )
				PerkItemWidgetItemInternal0Frame2( PerkItemWidgetItemInternal0, {} )
			end
		}
	}
	PerkItemWidgetItemInternal0.id = "PerkItemWidgetItemInternal0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PerkItemWidgetItemInternal0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.PerkItemWidgetItemInternal0:close()
		CoD.PerkItemWidget_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

