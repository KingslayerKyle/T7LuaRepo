-- f3e0e342fda5e1d579b6ce8b5755c0b6
-- This hash is used for caching, delete to decompile the file again

CoD.StartMenu_Options_SliderBar_Bar = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_SliderBar_Bar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_SliderBar_Bar )
	self.id = "StartMenu_Options_SliderBar_Bar"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 6 )
	self:setTopBottom( true, false, 0, 21 )
	
	local Bar = LUI.UIImage.new()
	Bar:setLeftRight( true, false, 0, 6 )
	Bar:setTopBottom( false, false, -4.2, 4.2 )
	self:addElement( Bar )
	self.Bar = Bar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Bar:completeAnimation()
				self.Bar:setRGB( 1, 1, 1 )
				self.Bar:setAlpha( 1 )
				self.clipFinished( Bar, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
