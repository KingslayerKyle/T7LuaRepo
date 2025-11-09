CoD.NetworkModeColor_Base = InheritFrom( LUI.UIElement )
CoD.NetworkModeColor_Base.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.NetworkModeColor_Base )
	self.id = "NetworkModeColor_Base"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 384 )
	self:setTopBottom( true, false, 0, 8 )
	
	local imgMode = LUI.UIImage.new()
	imgMode:setLeftRight( true, false, 0, 384 )
	imgMode:setTopBottom( true, false, 2, 0 )
	imgMode:setRGB( 1, 1, 1 )
	imgMode:setAlpha( 0 )
	imgMode:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imgMode )
	self.imgMode = imgMode
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				imgMode:completeAnimation()
				self.imgMode:setAlpha( 0 )
				self.clipFinished( imgMode, {} )
			end
		},
		LAN = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				imgMode:completeAnimation()
				self.imgMode:setRGB( 1, 0.71, 0 )
				self.imgMode:setAlpha( 0.37 )
				self.clipFinished( imgMode, {} )
			end
		},
		Local = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				imgMode:completeAnimation()
				self.imgMode:setRGB( 0.67, 0.67, 0.67 )
				self.imgMode:setAlpha( 0.56 )
				self.clipFinished( imgMode, {} )
			end
		},
		Live = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				imgMode:completeAnimation()
				self.imgMode:setRGB( 0.01, 1, 0 )
				self.imgMode:setAlpha( 0.37 )
				self.clipFinished( imgMode, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

