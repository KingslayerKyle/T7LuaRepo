CoD.island = InheritFrom( LUI.UIElement )
CoD.island.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.island )
	self.id = "island"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 128 )
	
	local island = LUI.UIImage.new()
	island:setLeftRight( true, false, 0, 256 )
	island:setTopBottom( true, false, 0, 128 )
	island:setImage( RegisterImage( "uie_island_loc" ) )
	self:addElement( island )
	self.island = island
	
	local islandlit = LUI.UIImage.new()
	islandlit:setLeftRight( true, false, 0, 256 )
	islandlit:setTopBottom( true, false, 0, 128 )
	islandlit:setImage( RegisterImage( "uie_island_stroke" ) )
	self:addElement( islandlit )
	self.islandlit = islandlit
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				islandlit:completeAnimation()
				self.islandlit:setAlpha( 0 )
				self.clipFinished( islandlit, {} )
			end
		},
		highlighted = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				islandlit:completeAnimation()
				self.islandlit:setAlpha( 1 )
				self.clipFinished( islandlit, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

