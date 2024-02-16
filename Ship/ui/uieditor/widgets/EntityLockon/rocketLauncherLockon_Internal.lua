-- 1d4168c84fce0b22d799c1bb1fa43f43
-- This hash is used for caching, delete to decompile the file again

CoD.rocketLauncherLockon_Internal = InheritFrom( LUI.UIElement )
CoD.rocketLauncherLockon_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.rocketLauncherLockon_Internal )
	self.id = "rocketLauncherLockon_Internal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 70 )
	self:setTopBottom( true, false, 0, 70 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -35, 35 )
	Image0:setTopBottom( false, false, -35, 35 )
	Image0:setRGB( 0.64, 1, 0.81 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_rocket_launcher_lockon" ) )
	Image0:setShaderVector( 0, 3, 4, 0.07, 0.85 )
	Image0:setShaderVector( 1, 3, 4.35, 0.4, 1 )
	Image0:setShaderVector( 2, 1.5, 0.09, 180, 0 )
	Image0:setShaderVector( 4, 70, 70, 0, 0 )
	Image0:linkToElementModel( self, "lockOnPercent", true, function ( model )
		local lockOnPercent = Engine.GetModelValue( model )
		if lockOnPercent then
			Image0:setShaderVector( 3, CoD.GetVectorComponentFromString( lockOnPercent, 1 ), CoD.GetVectorComponentFromString( lockOnPercent, 2 ), CoD.GetVectorComponentFromString( lockOnPercent, 3 ), CoD.GetVectorComponentFromString( lockOnPercent, 4 ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image0:completeAnimation()
				self.Image0:setRGB( 0.64, 1, 0.81 )
				self.clipFinished( Image0, {} )
			end
		},
		LockedOn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image0:completeAnimation()
				self.Image0:setRGB( 0.79, 0.09, 0.12 )
				self.clipFinished( Image0, {} )
			end
		},
		AcquiringLock = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Image0:completeAnimation()
				self.Image0:setRGB( 0.64, 1, 0.81 )
				self.clipFinished( Image0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Image0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
