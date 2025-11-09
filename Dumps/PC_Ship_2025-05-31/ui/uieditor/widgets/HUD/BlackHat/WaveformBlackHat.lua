CoD.WaveformBlackHat = InheritFrom( LUI.UIElement )
CoD.WaveformBlackHat.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WaveformBlackHat )
	self.id = "WaveformBlackHat"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 206 )
	self:setTopBottom( true, false, 0, 173 )
	
	local ShaderImage = LUI.UIImage.new()
	ShaderImage:setLeftRight( true, false, 0, 206 )
	ShaderImage:setTopBottom( true, false, 0, 173 )
	ShaderImage:setRGB( 0, 0.93, 1 )
	ShaderImage:setImage( RegisterImage( "uie_gradient_noise" ) )
	ShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_blackhat_waveform" ) )
	ShaderImage:subscribeToGlobalModel( controller, "Blackhat", "offsetShaderValue", function ( model )
		local offsetShaderValue = Engine.GetModelValue( model )
		if offsetShaderValue then
			ShaderImage:setShaderVector( 0, CoD.GetVectorComponentFromString( offsetShaderValue, 1 ), CoD.GetVectorComponentFromString( offsetShaderValue, 2 ), CoD.GetVectorComponentFromString( offsetShaderValue, 3 ), CoD.GetVectorComponentFromString( offsetShaderValue, 4 ) )
		end
	end )
	self:addElement( ShaderImage )
	self.ShaderImage = ShaderImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ShaderImageFrame2 = function ( ShaderImage, event )
					if not event.interrupted then
						ShaderImage:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ShaderImage:setRGB( 0, 0.91, 1 )
					ShaderImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ShaderImage, event )
					else
						ShaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ShaderImage:completeAnimation()
				self.ShaderImage:setRGB( 0, 0.62, 1 )
				self.ShaderImage:setAlpha( 0.3 )
				ShaderImageFrame2( ShaderImage, {} )
			end
		},
		Hacking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ShaderImage:completeAnimation()
				self.ShaderImage:setRGB( 1, 0.52, 0 )
				self.ShaderImage:setAlpha( 1 )
				self.clipFinished( ShaderImage, {} )
			end
		},
		Breaching = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ShaderImage:completeAnimation()
				self.ShaderImage:setRGB( 1, 0, 0.02 )
				self.ShaderImage:setAlpha( 1 )
				self.clipFinished( ShaderImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hacking",
			condition = function ( menu, element, event )
				return IsBlackhatHacking( controller )
			end
		},
		{
			stateName = "Breaching",
			condition = function ( menu, element, event )
				return IsBlackhatBreaching( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.blackhat.status" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.blackhat.status"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ShaderImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

