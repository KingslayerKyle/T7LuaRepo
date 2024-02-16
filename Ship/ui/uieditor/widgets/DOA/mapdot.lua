-- 0e1caaa956fe4e997dafb07cff809bef
-- This hash is used for caching, delete to decompile the file again

CoD.mapdot = InheritFrom( LUI.UIElement )
CoD.mapdot.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.mapdot )
	self.id = "mapdot"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local mapdot = LUI.UIImage.new()
	mapdot:setLeftRight( true, false, 0, 16 )
	mapdot:setTopBottom( true, false, 0, 16 )
	mapdot:setImage( RegisterImage( "uie_reddot" ) )
	self:addElement( mapdot )
	self.mapdot = mapdot
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				mapdot:completeAnimation()
				self.mapdot:setAlpha( 0 )
				self.clipFinished( mapdot, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
