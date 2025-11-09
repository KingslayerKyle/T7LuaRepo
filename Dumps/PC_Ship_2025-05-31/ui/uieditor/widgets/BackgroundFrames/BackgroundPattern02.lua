CoD.BackgroundPattern02 = InheritFrom( LUI.UIElement )
CoD.BackgroundPattern02.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.BackgroundPattern02 )
	self.id = "BackgroundPattern02"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 640 )
	self:setTopBottom( true, false, 0, 64 )
	
	local Pattern = LUI.UIImage.new()
	Pattern:setLeftRight( false, false, -320, 320 )
	Pattern:setTopBottom( false, false, -32, 32 )
	Pattern:setImage( RegisterImage( "uie_t7_menu_pattern_01" ) )
	Pattern:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Pattern:setShaderVector( 0, 20, 2, 0, 0 )
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

