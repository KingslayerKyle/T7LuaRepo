require( "ui.uieditor.widgets.CAC.OverCapacityItem_Internal" )
require( "ui.uieditor.widgets.Border" )

CoD.OverCapacityItem_old = InheritFrom( LUI.UIElement )
CoD.OverCapacityItem_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OverCapacityItem_old )
	self.id = "OverCapacityItem_old"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 150 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local itemInternal = CoD.OverCapacityItem_Internal.new( menu, controller )
	itemInternal:setLeftRight( true, false, 0, 300 )
	itemInternal:setTopBottom( true, false, 0, 150 )
	itemInternal:setRGB( 1, 1, 1 )
	itemInternal:linkToElementModel( self, nil, false, function ( model )
		itemInternal:setModel( model, controller )
	end )
	itemInternal:mergeStateConditions( {
		{
			stateName = "GadgetMod",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "WideImage",
			condition = function ( menu, element, event )
				return IsCACSlotOvercapacity2by1AspectRatio( element )
			end
		}
	} )
	self:addElement( itemInternal )
	self.itemInternal = itemInternal
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 0.41, 0 )
	border:setAlpha( 0 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 1 )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				border:completeAnimation()
				self.border:setAlpha( 0 )
				borderFrame2( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				self.border:setAlpha( 1 )
				border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 1 )
				local borderFrame2 = function ( border, event )
					if not event.interrupted then
						border:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					border:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( border, event )
					else
						border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				border:completeAnimation()
				self.border:setAlpha( 1 )
				borderFrame2( border, {} )
			end
		}
	}
	self.close = function ( self )
		self.itemInternal:close()
		self.border:close()
		CoD.OverCapacityItem_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

