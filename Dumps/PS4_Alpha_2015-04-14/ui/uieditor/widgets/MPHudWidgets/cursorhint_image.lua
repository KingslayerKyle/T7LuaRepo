CoD.cursorhint_image = InheritFrom( LUI.UIElement )
CoD.cursorhint_image.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cursorhint_image )
	self.id = "cursorhint_image"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 64 )
	
	local c1x1 = LUI.UIImage.new()
	c1x1:setLeftRight( true, true, 0, -64 )
	c1x1:setTopBottom( true, true, 0, 0 )
	c1x1:setRGB( 1, 1, 1 )
	c1x1:setAlpha( 0 )
	c1x1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	c1x1:subscribeToGlobalModel( controller, "HUDItems", "cursorHintImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			c1x1:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( c1x1 )
	self.c1x1 = c1x1
	
	local x1x4 = LUI.UIImage.new()
	x1x4:setLeftRight( true, true, 0, 0 )
	x1x4:setTopBottom( true, true, 16, -16 )
	x1x4:setRGB( 1, 1, 1 )
	x1x4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	x1x4:subscribeToGlobalModel( controller, "HUDItems", "cursorHintImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			x1x4:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( x1x4 )
	self.x1x4 = x1x4
	
	local c1x2 = LUI.UIImage.new()
	c1x2:setLeftRight( true, true, 0, 0 )
	c1x2:setTopBottom( true, true, 0, 0 )
	c1x2:setRGB( 1, 1, 1 )
	c1x2:setAlpha( 0 )
	c1x2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	c1x2:subscribeToGlobalModel( controller, "HUDItems", "cursorHintImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			c1x2:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( c1x2 )
	self.c1x2 = c1x2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				c1x1:completeAnimation()
				self.c1x1:setAlpha( 0 )
				self.clipFinished( c1x1, {} )
				x1x4:completeAnimation()
				self.x1x4:setAlpha( 0 )
				self.clipFinished( x1x4, {} )
				c1x2:completeAnimation()
				self.c1x2:setAlpha( 0 )
				self.clipFinished( c1x2, {} )
			end
		},
		Active_1x1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				c1x1:completeAnimation()
				self.c1x1:setAlpha( 1 )
				self.clipFinished( c1x1, {} )
				x1x4:completeAnimation()
				self.x1x4:setAlpha( 0 )
				self.clipFinished( x1x4, {} )
				c1x2:completeAnimation()
				self.c1x2:setAlpha( 0 )
				self.clipFinished( c1x2, {} )
			end
		},
		Active_2x1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				c1x1:completeAnimation()
				self.c1x1:setAlpha( 0 )
				self.clipFinished( c1x1, {} )
				x1x4:completeAnimation()
				self.x1x4:setAlpha( 0 )
				self.clipFinished( x1x4, {} )
				c1x2:completeAnimation()
				self.c1x2:setAlpha( 1 )
				self.clipFinished( c1x2, {} )
			end
		},
		Active_4x1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				c1x1:completeAnimation()
				self.c1x1:setAlpha( 0 )
				self.clipFinished( c1x1, {} )
				x1x4:completeAnimation()
				self.x1x4:setAlpha( 1 )
				self.clipFinished( x1x4, {} )
				c1x2:completeAnimation()
				self.c1x2:setAlpha( 0 )
				self.clipFinished( c1x2, {} )
			end
		},
		Out = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.close = function ( self )
		self.c1x1:close()
		self.x1x4:close()
		self.c1x2:close()
		CoD.cursorhint_image.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

