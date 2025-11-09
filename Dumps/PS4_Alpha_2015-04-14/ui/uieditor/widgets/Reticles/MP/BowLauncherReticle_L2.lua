CoD.BowLauncherReticle_L2 = InheritFrom( LUI.UIElement )
CoD.BowLauncherReticle_L2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BowLauncherReticle_L2 )
	self.id = "BowLauncherReticle_L2"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 12 )
	self:setTopBottom( true, false, 0, 6 )
	
	local Line2 = LUI.UIImage.new()
	Line2:setLeftRight( true, true, 0, 0 )
	Line2:setTopBottom( true, true, 0, 0 )
	Line2:setRGB( 1, 1, 1 )
	Line2:setImage( RegisterImage( "uie_bowlauncher_line2" ) )
	Line2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Line2:completeAnimation()
				self.Line2:setAlpha( 1 )
				self.clipFinished( Line2, {} )
			end
		},
		Drawn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Line2:completeAnimation()
				self.Line2:setAlpha( 0 )
				self.clipFinished( Line2, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

