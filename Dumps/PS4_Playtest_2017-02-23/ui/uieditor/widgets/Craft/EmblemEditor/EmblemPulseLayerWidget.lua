CoD.EmblemPulseLayerWidget = InheritFrom( LUI.UIElement )
CoD.EmblemPulseLayerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemPulseLayerWidget )
	self.id = "EmblemPulseLayerWidget"
	self.soundSet = "CustomizationEditor"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 471 )
	
	local emblemHiddenPulseLayer = LUI.UIElement.new()
	emblemHiddenPulseLayer:setLeftRight( 0, 1, 0, 0 )
	emblemHiddenPulseLayer:setTopBottom( 0, 1, 0, 0 )
	emblemHiddenPulseLayer:setAlpha( 0 )
	self:addElement( emblemHiddenPulseLayer )
	self.emblemHiddenPulseLayer = emblemHiddenPulseLayer
	
	self.resetProperties = function ()
		emblemHiddenPulseLayer:completeAnimation()
		emblemHiddenPulseLayer:setRGB( 1, 1, 1 )
		emblemHiddenPulseLayer:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local emblemHiddenPulseLayerFrame2 = function ( emblemHiddenPulseLayer, event )
					local emblemHiddenPulseLayerFrame3 = function ( emblemHiddenPulseLayer, event )
						if not event.interrupted then
							emblemHiddenPulseLayer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						emblemHiddenPulseLayer:setRGB( 0, 0, 1 )
						emblemHiddenPulseLayer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( emblemHiddenPulseLayer, event )
						else
							emblemHiddenPulseLayer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						emblemHiddenPulseLayerFrame3( emblemHiddenPulseLayer, event )
						return 
					else
						emblemHiddenPulseLayer:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						emblemHiddenPulseLayer:setRGB( 0, 0, 1 )
						emblemHiddenPulseLayer:setAlpha( 0.8 )
						emblemHiddenPulseLayer:registerEventHandler( "transition_complete_keyframe", emblemHiddenPulseLayerFrame3 )
					end
				end
				
				emblemHiddenPulseLayer:completeAnimation()
				self.emblemHiddenPulseLayer:setRGB( 1, 1, 0 )
				self.emblemHiddenPulseLayer:setAlpha( 1 )
				emblemHiddenPulseLayerFrame2( emblemHiddenPulseLayer, {} )
			end,
			Hide = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

