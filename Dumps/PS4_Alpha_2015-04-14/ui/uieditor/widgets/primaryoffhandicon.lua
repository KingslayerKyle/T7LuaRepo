CoD.PrimaryOffhandIcon = InheritFrom( LUI.UIElement )
CoD.PrimaryOffhandIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.PrimaryOffhandIcon )
	self.id = "PrimaryOffhandIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local offhandIcon = LUI.UIImage.new()
	offhandIcon:setLeftRight( false, false, -16, 16 )
	offhandIcon:setTopBottom( false, false, -16, 16 )
	offhandIcon:setRGB( 1, 1, 1 )
	offhandIcon:setAlpha( 0.75 )
	offhandIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	offhandIcon:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			offhandIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( offhandIcon )
	self.offhandIcon = offhandIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		InvisibleGrenadeCountThree = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		InvisibleGrenadeCountOne = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		InvisibleGrenadeCountTwo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				offhandIcon:completeAnimation()
				self.offhandIcon:setAlpha( 0 )
				self.clipFinished( offhandIcon, {} )
			end
		}
	}
	self.close = function ( self )
		self.offhandIcon:close()
		CoD.PrimaryOffhandIcon.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

