-- 9a42d41b57b721d64ed208f06256cd48
-- This hash is used for caching, delete to decompile the file again

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
	ImgRingDeplete:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringdeplete" ) )
	ImgRingDeplete:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingDeplete:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgRingDeplete:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingDeplete:setShaderVector( 3, -0.48, 0.93, 0, 0 )
	ImgRingDeplete:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local playerGadget3PowerRatio = Engine.GetModelValue( model )
		if playerGadget3PowerRatio then
			ImgRingDeplete:setShaderVector( 0, CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 1 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 2 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 3 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 4 ) )
		end
	end )
	self:addElement( ImgRingDeplete )
	self.ImgRingDeplete = ImgRingDeplete
	
	local ImgRingDeplete0 = LUI.UIImage.new()
	ImgRingDeplete0:setLeftRight( true, true, 9.33, -9.33 )
	ImgRingDeplete0:setTopBottom( true, true, 9.33, -9.33 )
	ImgRingDeplete0:setAlpha( 0.27 )
	ImgRingDeplete0:setZRot( -32 )
	ImgRingDeplete0:setZoom( -24 )
	ImgRingDeplete0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringdeplete" ) )
	ImgRingDeplete0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ImgRingDeplete0:setShaderVector( 1, 0.67, 0, 0, 0 )
	ImgRingDeplete0:setShaderVector( 2, 0.5, 0, 0, 0 )
	ImgRingDeplete0:setShaderVector( 3, -0.66, 1.58, 0, 0 )
	ImgRingDeplete0:subscribeToGlobalModel( controller, "PlayerAbilities", "playerGadget3.powerRatio", function ( model )
		local playerGadget3PowerRatio = Engine.GetModelValue( model )
		if playerGadget3PowerRatio then
			ImgRingDeplete0:setShaderVector( 0, CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 1 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 2 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 3 ), CoD.GetVectorComponentFromString( playerGadget3PowerRatio, 4 ) )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImgRingDeplete:close()
		element.ImgRingDeplete0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

