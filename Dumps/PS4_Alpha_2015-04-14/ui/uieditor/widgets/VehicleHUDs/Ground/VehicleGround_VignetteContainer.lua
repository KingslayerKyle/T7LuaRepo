require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteFore" )

CoD.VehicleGround_VignetteContainer = InheritFrom( LUI.UIElement )
CoD.VehicleGround_VignetteContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_VignetteContainer )
	self.id = "VehicleGround_VignetteContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, false, 0, 1280 )
	VignetteBack:setTopBottom( true, false, 0, 720 )
	VignetteBack:setRGB( 1, 1, 1 )
	VignetteBack:setAlpha( 0.2 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local VignetteFore = CoD.VehicleGround_VignetteFore.new( menu, controller )
	VignetteFore:setLeftRight( true, false, 0, 1280 )
	VignetteFore:setTopBottom( true, false, 0, 720 )
	VignetteFore:setRGB( 1, 1, 1 )
	VignetteFore:setAlpha( 0.6 )
	self:addElement( VignetteFore )
	self.VignetteFore = VignetteFore
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
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
				local VignetteForeFrame2 = function ( VignetteFore, event )
					if not event.interrupted then
						VignetteFore:beginAnimation( "keyframe", 3029, false, false, CoD.TweenType.Linear )
					end
					VignetteFore:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( VignetteFore, event )
					else
						VignetteFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteFore:completeAnimation()
				self.VignetteFore:setAlpha( 0 )
				VignetteForeFrame2( VignetteFore, {} )
			end
		}
	}
	self.close = function ( self )
		self.VignetteBack:close()
		self.VignetteFore:close()
		CoD.VehicleGround_VignetteContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

