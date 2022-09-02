-- f64a51ee279b4dc1a5308b6e12944645
-- This hash is used for caching, delete to decompile the file again

CoD.StartMenu_ImageContainer_Credits_SM = InheritFrom( LUI.UIElement )
CoD.StartMenu_ImageContainer_Credits_SM.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.StartMenu_ImageContainer_Credits_SM )
	self.id = "StartMenu_ImageContainer_Credits_SM"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 181 )
	self:setTopBottom( true, false, 0, 119 )
	
	local ImageContainer = LUI.UIImage.new()
	ImageContainer:setLeftRight( false, false, -148.5, 148.5 )
	ImageContainer:setTopBottom( false, false, -68.5, 68.5 )
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

