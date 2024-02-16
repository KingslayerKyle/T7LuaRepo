-- ba9b180dd2efe35ca2f3871a3c3c358c
-- This hash is used for caching, delete to decompile the file again

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
	offhandIcon:setAlpha( 0.75 )
	offhandIcon:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			offhandIcon:setImage( RegisterImage( primaryOffhand ) )
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
