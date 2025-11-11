CoD.DirectorFilterItem = InheritFrom( LUI.UIElement )
CoD.DirectorFilterItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DirectorFilterItem )
	self.id = "DirectorFilterItem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 64 )
	self:setTopBottom( 0, 0, 0, 64 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, 0, 64 )
	Image:setTopBottom( 0, 0, 0, 64 )
	Image:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	Image:setAlpha( 0.5 )
	self:addElement( Image )
	self.Image = Image
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( 0, 0, 2, 62 )
	icon:setTopBottom( 0, 0, 2, 62 )
	icon:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	self.resetProperties = function ()
		Image:completeAnimation()
		icon:completeAnimation()
		Image:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
		Image:setAlpha( 0.5 )
		icon:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Image:completeAnimation()
				self.Image:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				icon:completeAnimation()
				self.icon:setRGB( 0.52, 0.52, 0.52 )
				self.clipFinished( icon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.icon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = self
	EnableMouseButton( self, controller )
	EnableMouseMove( self, controller )
	return self
end

