CoD.bar = InheritFrom( LUI.UIElement )
CoD.bar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.bar )
	self.id = "bar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 269 )
	self:setTopBottom( true, false, 0, 53 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 1, 1 )
	background:setAlpha( 0.2 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local barfill = LUI.UIImage.new()
	barfill:setLeftRight( true, true, 4, -4 )
	barfill:setTopBottom( true, true, 2, -2 )
	barfill:setRGB( 1, 1, 1 )
	barfill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	barfill:setShaderVector( 0, 1, 0, 0, 0 )
	barfill:setShaderVector( 1, 0, 0, 0, 0 )
	barfill:setShaderVector( 2, 1, 0, 0, 0 )
	barfill:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( barfill )
	self.barfill = barfill
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setAlpha( 0.2 )
				self.clipFinished( background, {} )
			end
		},
		LowEnergy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.background:setAlpha( 0.2 )
				self.clipFinished( background, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

