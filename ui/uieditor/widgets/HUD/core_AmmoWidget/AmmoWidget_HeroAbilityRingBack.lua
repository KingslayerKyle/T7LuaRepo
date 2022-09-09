-- df1484046ecaf95ccd3f0c588fb5c4b5
-- This hash is used for caching, delete to decompile the file again

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
		local playerGadget3PowerRatio = Engine.GetModelValue( model )
		if playerGadget3PowerRatio then
			ImgRingDeplete:setShaderVector( 0, CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 1 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 2 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 3 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 4 ) )
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
		local playerGadget3PowerRatio = Engine.GetModelValue( model )
		if playerGadget3PowerRatio then
			ImgRingDeplete0:setShaderVector( 0, CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 1 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 2 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 3 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 4 ) )
		end
	end )
	self:addElement( ImgRingDeplete0 )
	self.ImgRingDeplete0 = ImgRingDeplete0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImgRingDeplete:close()
		element.ImgRingDeplete0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
