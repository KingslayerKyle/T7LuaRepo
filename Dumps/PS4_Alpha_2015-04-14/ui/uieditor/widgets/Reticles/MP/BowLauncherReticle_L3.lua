CoD.BowLauncherReticle_L3 = InheritFrom( LUI.UIElement )
CoD.BowLauncherReticle_L3.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BowLauncherReticle_L3 )
	self.id = "BowLauncherReticle_L3"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 12 )
	self:setTopBottom( true, false, 0, 6 )
	
	local Line3 = LUI.UIImage.new()
	Line3:setLeftRight( true, true, 0, 0 )
	Line3:setTopBottom( true, true, 0, 0 )
	Line3:setRGB( 1, 1, 1 )
	Line3:setImage( RegisterImage( "uie_bowlauncher_line3" ) )
	Line3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line3 )
	self.Line3 = Line3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Line3:completeAnimation()
				self.Line3:setAlpha( 1 )
				self.clipFinished( Line3, {} )
			end
		},
		Drawn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Line3:completeAnimation()
				self.Line3:setAlpha( 0 )
				self.clipFinished( Line3, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

