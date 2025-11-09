CoD.StartMenu_ImageContainer = InheritFrom( LUI.UIElement )
CoD.StartMenu_ImageContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_ImageContainer )
	self.id = "StartMenu_ImageContainer"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 297 )
	self:setTopBottom( true, false, 0, 137 )
	
	local ImageContainer = LUI.UIImage.new()
	ImageContainer:setLeftRight( true, true, 0, 0 )
	ImageContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( ImageContainer )
	self.ImageContainer = ImageContainer
	
	self.clipsPerState = {
		DefaultState = {
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

