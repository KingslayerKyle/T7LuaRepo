CoD.BowLauncherReticle_L4 = InheritFrom( LUI.UIElement )
CoD.BowLauncherReticle_L4.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BowLauncherReticle_L4 )
	self.id = "BowLauncherReticle_L4"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 12 )
	self:setTopBottom( true, false, 0, 6 )
	
	local Line4 = LUI.UIImage.new()
	Line4:setLeftRight( true, true, 0, 0 )
	Line4:setTopBottom( true, true, 0, 0 )
	Line4:setRGB( 1, 1, 1 )
	Line4:setImage( RegisterImage( "uie_bowlauncher_line4" ) )
	Line4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line4 )
	self.Line4 = Line4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Line4:completeAnimation()
				self.Line4:setAlpha( 1 )
				self.clipFinished( Line4, {} )
			end
		},
		Drawn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Line4:completeAnimation()
				self.Line4:setAlpha( 0 )
				self.clipFinished( Line4, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

