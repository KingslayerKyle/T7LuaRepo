-- 990c880563a04dfdf176311105783a1a
-- This hash is used for caching, delete to decompile the file again

CoD.BowLauncherReticle_L1 = InheritFrom( LUI.UIElement )
CoD.BowLauncherReticle_L1.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BowLauncherReticle_L1 )
	self.id = "BowLauncherReticle_L1"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 12 )
	self:setTopBottom( true, false, 0, 6 )
	
	local Line1 = LUI.UIImage.new()
	Line1:setLeftRight( true, true, 0, 0 )
	Line1:setTopBottom( true, true, 0, 0 )
	Line1:setImage( RegisterImage( "uie_bowlauncher_line1" ) )
	Line1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Line1:completeAnimation()
				self.Line1:setAlpha( 1 )
				self.clipFinished( Line1, {} )
			end
		},
		Drawn = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Line1:completeAnimation()
				self.Line1:setAlpha( 0 )
				self.clipFinished( Line1, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

