-- ac1026bfe2b9f13b07a614e09daa7d89
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_AbilityRingBackDeplete = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityRingBackDeplete.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityRingBackDeplete )
	self.id = "AmmoWidget_AbilityRingBackDeplete"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 109 )
	self:setTopBottom( true, false, 0, 109 )
	
	local ImgRingDepleteOutter = LUI.UIImage.new()
	ImgRingDepleteOutter:setLeftRight( true, true, 0, 0.33 )
	ImgRingDepleteOutter:setTopBottom( true, true, 0, 0.33 )
	ImgRingDepleteOutter:setZRot( -360 )
	ImgRingDepleteOutter:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringdepleteoutter" ) )
	ImgRingDepleteOutter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgRingDepleteOutter )
	self.ImgRingDepleteOutter = ImgRingDepleteOutter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local ImgRingDepleteOutterFrame2 = function ( ImgRingDepleteOutter, event )
					if not event.interrupted then
						ImgRingDepleteOutter:beginAnimation( "keyframe", 5000, false, false, CoD.TweenType.Linear )
					end
					ImgRingDepleteOutter:setZRot( -360 )
					if event.interrupted then
						self.clipFinished( ImgRingDepleteOutter, event )
					else
						ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgRingDepleteOutter:completeAnimation()
				self.ImgRingDepleteOutter:setZRot( 0 )
				ImgRingDepleteOutterFrame2( ImgRingDepleteOutter, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
