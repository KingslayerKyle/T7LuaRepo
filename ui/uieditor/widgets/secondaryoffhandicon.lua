-- 91df13e66758fa2dea2cb64ae385d130
-- This hash is used for caching, delete to decompile the file again

CoD.SecondaryOffhandIcon = InheritFrom( LUI.UIElement )
CoD.SecondaryOffhandIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.SecondaryOffhandIcon )
	self.id = "SecondaryOffhandIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local offhandIcon = LUI.UIImage.new()
	offhandIcon:setLeftRight( false, false, -16, 16 )
	offhandIcon:setTopBottom( false, false, -16, 16 )
	offhandIcon:setAlpha( 0.75 )
	offhandIcon:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			offhandIcon:setImage( RegisterImage( secondaryOffhand ) )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.offhandIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

