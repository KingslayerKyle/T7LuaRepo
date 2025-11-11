require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

CoD.scorestreakVignetteContainer = InheritFrom( LUI.UIElement )
CoD.scorestreakVignetteContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.scorestreakVignetteContainer )
	self.id = "scorestreakVignetteContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( 0, 1, 0, 0 )
	VignetteBack:setTopBottom( 0, 1, 0, 0 )
	VignetteBack:setAlpha( 0.2 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	self.resetProperties = function ()
		VignetteBack:completeAnimation()
		VignetteBack:setAlpha( 0.2 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					if not event.interrupted then
						VignetteBack:beginAnimation( "keyframe", 3930, false, false, CoD.TweenType.Linear )
					end
					VignetteBack:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( VignetteBack, event )
					else
						VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setAlpha( 0 )
				VignetteBackFrame2( VignetteBack, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VignetteBack:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

