require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.Wildcard.WildcardCardItem_Internal" )
require( "ui.uieditor.widgets.Border" )

CoD.WildcardCard_Internal = InheritFrom( LUI.UIElement )
CoD.WildcardCard_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardCard_Internal )
	self.id = "WildcardCard_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 314 )
	self:setTopBottom( true, false, 0, 68 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local WildcardCardItemInternal0 = CoD.WildcardCardItem_Internal.new( menu, controller )
	WildcardCardItemInternal0:setLeftRight( true, false, 0, 314 )
	WildcardCardItemInternal0:setTopBottom( true, false, 0, 68 )
	WildcardCardItemInternal0:setRGB( 1, 1, 1 )
	WildcardCardItemInternal0:mergeStateConditions( {
		{
			stateName = "Unequipped",
			condition = function ( menu, element, event )
				return not IsCACSlotEquipped( menu, element, controller )
			end
		}
	} )
	WildcardCardItemInternal0:linkToElementModel( WildcardCardItemInternal0, "itemIndex", true, function ( model )
		menu:updateElementState( WildcardCardItemInternal0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( WildcardCardItemInternal0 )
	self.WildcardCardItemInternal0 = WildcardCardItemInternal0
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 0.41, 0 )
	border:setAlpha( 0 )
	border:setZoom( 25 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				WildcardCardItemInternal0:completeAnimation()
				self.WildcardCardItemInternal0:setZoom( 0 )
				self.clipFinished( WildcardCardItemInternal0, {} )
				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.border:setZoom( 0 )
				self.clipFinished( border, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )
				local WildcardCardItemInternal0Frame2 = function ( WildcardCardItemInternal0, event )
					if not event.interrupted then
						WildcardCardItemInternal0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					WildcardCardItemInternal0:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( WildcardCardItemInternal0, event )
					else
						WildcardCardItemInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WildcardCardItemInternal0:completeAnimation()
				self.WildcardCardItemInternal0:setZoom( 0 )
				WildcardCardItemInternal0Frame2( WildcardCardItemInternal0, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 1 )
					border:setZoom( 25 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 0 )
				borderFrame2( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				WildcardCardItemInternal0:completeAnimation()
				self.WildcardCardItemInternal0:setZoom( 25 )
				self.clipFinished( WildcardCardItemInternal0, {} )
				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				self.clipFinished( border, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )
				local WildcardCardItemInternal0Frame2 = function ( WildcardCardItemInternal0, event )
					if not event.interrupted then
						WildcardCardItemInternal0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					WildcardCardItemInternal0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( WildcardCardItemInternal0, event )
					else
						WildcardCardItemInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				WildcardCardItemInternal0:completeAnimation()
				self.WildcardCardItemInternal0:setZoom( 25 )
				WildcardCardItemInternal0Frame2( WildcardCardItemInternal0, {} )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 0 )
					border:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				border:completeAnimation()
				self.border:setAlpha( 1 )
				self.border:setZoom( 25 )
				borderFrame2( border, {} )
			end
		}
	}
	self.close = function ( self )
		self.WildcardCardItemInternal0:close()
		self.border:close()
		CoD.WildcardCard_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

