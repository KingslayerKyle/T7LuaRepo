CoD.AmmoWidget_HeroAbilityRingBack = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityRingBack.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityRingBack )
	self.id = "AmmoWidget_HeroAbilityRingBack"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	
	local ImgRingDeplete = LUI.UIImage.new()
	ImgRingDeplete:setLeftRight( true, true, 8.33, -8.33 )
	ImgRingDeplete:setTopBottom( true, true, 8.33, -8.33 )
	ImgRingDeplete:setRGB( 1, 0.58, 0.02 )
	ImgRingDeplete:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringdeplete" ) )
	ImgRingDeplete:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingDeplete:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgRingDeplete:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingDeplete:setShaderVector( 3, -1.24, 1.38, 0, 0 )
	ImgRingDeplete:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImgRingDeplete:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( ImgRingDeplete )
	self.ImgRingDeplete = ImgRingDeplete
	
	local ImgRingDeplete0 = LUI.UIImage.new()
	ImgRingDeplete0:setLeftRight( true, true, 13.83, -13.84 )
	ImgRingDeplete0:setTopBottom( true, true, 13.84, -13.84 )
	ImgRingDeplete0:setRGB( 1, 0.81, 0 )
	ImgRingDeplete0:setZoom( -24 )
	ImgRingDeplete0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringdeplete" ) )
	ImgRingDeplete0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingDeplete0:setShaderVector( 1, 0.67, 0, 0, 0 )
	ImgRingDeplete0:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingDeplete0:setShaderVector( 3, -0.66, 0.67, 0, 0 )
	ImgRingDeplete0:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImgRingDeplete0:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( ImgRingDeplete0 )
	self.ImgRingDeplete0 = ImgRingDeplete0
	
	self.close = function ( self )
		self.ImgRingDeplete:close()
		self.ImgRingDeplete0:close()
		CoD.AmmoWidget_HeroAbilityRingBack.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

