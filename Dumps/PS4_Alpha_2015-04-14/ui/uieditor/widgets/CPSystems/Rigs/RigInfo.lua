CoD.RigInfo = InheritFrom( LUI.UIElement )
CoD.RigInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RigInfo )
	self.id = "RigInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 50 )
	
	local rigImage = LUI.UIImage.new()
	rigImage:setLeftRight( false, true, -30.5, 0 )
	rigImage:setTopBottom( true, false, 0, 30.5 )
	rigImage:setRGB( 1, 1, 1 )
	rigImage:setAlpha( 0.8 )
	rigImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	rigImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rigImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rigImage )
	self.rigImage = rigImage
	
	local rigName = LUI.UIText.new()
	rigName:setLeftRight( false, true, -483, -36 )
	rigName:setTopBottom( true, false, 9, 25 )
	rigName:setRGB( 1, 1, 1 )
	rigName:setAlpha( 0.8 )
	rigName:setTTF( "fonts/Entovo.ttf" )
	rigName:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	rigName:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	rigName:setShaderVector( 1, 0, 0, 0, 0 )
	rigName:setShaderVector( 2, 0, 0, 0, 0 )
	rigName:setShaderVector( 3, 0, 0, 0, 0 )
	rigName:setShaderVector( 4, 0, 0, 0, 0 )
	rigName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	rigName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rigName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rigName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rigName )
	self.rigName = rigName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				rigImage:completeAnimation()
				self.rigImage:setAlpha( 1 )
				self.clipFinished( rigImage, {} )
				rigName:completeAnimation()
				self.rigName:setAlpha( 1 )
				self.clipFinished( rigName, {} )
			end
		}
	}
	self.close = function ( self )
		self.rigImage:close()
		self.rigName:close()
		CoD.RigInfo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

