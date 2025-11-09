CoD.AmmoWidget_AbilityRingBack = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityRingBack.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityRingBack )
	self.id = "AmmoWidget_AbilityRingBack"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	
	local ImgRingDeplete = LUI.UIImage.new()
	ImgRingDeplete:setLeftRight( true, true, 9.33, -9.33 )
	ImgRingDeplete:setTopBottom( true, true, 9.33, -9.33 )
	ImgRingDeplete:setRGB( 1, 1, 1 )
	ImgRingDeplete:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringdeplete" ) )
	ImgRingDeplete:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingDeplete:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgRingDeplete:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingDeplete:setShaderVector( 3, -0.48, 0.93, 0, 0 )
	ImgRingDeplete:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImgRingDeplete:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( ImgRingDeplete )
	self.ImgRingDeplete = ImgRingDeplete
	
	local ImgRingDeplete0 = LUI.UIImage.new()
	ImgRingDeplete0:setLeftRight( true, true, 9.33, -9.33 )
	ImgRingDeplete0:setTopBottom( true, true, 9.33, -9.33 )
	ImgRingDeplete0:setRGB( 1, 1, 1 )
	ImgRingDeplete0:setAlpha( 0.27 )
	ImgRingDeplete0:setZRot( -32 )
	ImgRingDeplete0:setZoom( -24 )
	ImgRingDeplete0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringdeplete" ) )
	ImgRingDeplete0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingDeplete0:setShaderVector( 1, 0.67, 0, 0, 0 )
	ImgRingDeplete0:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingDeplete0:setShaderVector( 3, -0.66, 1.58, 0, 0 )
	ImgRingDeplete0:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImgRingDeplete0:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( ImgRingDeplete0 )
	self.ImgRingDeplete0 = ImgRingDeplete0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ImgRingDeplete0:completeAnimation()
				self.ImgRingDeplete0:setAlpha( 0.27 )
				self.ImgRingDeplete0:setZRot( -32 )
				self.ImgRingDeplete0:setZoom( -24 )
				self.ImgRingDeplete0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
				self.ImgRingDeplete0:setShaderVector( 1, 0.67, 0, 0, 0 )
				self.ImgRingDeplete0:setShaderVector( 2, 0.5, 0, 0, 0 )
				self.ImgRingDeplete0:setShaderVector( 3, -0.66, 1.58, 0, 0 )
				self.clipFinished( ImgRingDeplete0, {} )
			end
		}
	}
	self.close = function ( self )
		self.ImgRingDeplete:close()
		self.ImgRingDeplete0:close()
		CoD.AmmoWidget_AbilityRingBack.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

