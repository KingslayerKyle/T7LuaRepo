-- 2e6b248f4f167eb92a06fe9bd370ef77
-- This hash is used for caching, delete to decompile the file again

CoD.BackgroundPattern03 = InheritFrom( LUI.UIElement )
CoD.BackgroundPattern03.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.BackgroundPattern03 )
	self.id = "BackgroundPattern03"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Pattern = LUI.UIImage.new()
	Pattern:setLeftRight( false, false, -40, 40 )
	Pattern:setTopBottom( false, false, -16, 16 )
	Pattern:setImage( RegisterImage( "uie_t7_menu_pattern_01" ) )
	Pattern:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Pattern:setShaderVector( 0, 2.5, 1, 0, 0 )
	Pattern:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( Pattern )
	self.Pattern = Pattern
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
