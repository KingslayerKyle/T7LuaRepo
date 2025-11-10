CoD.StartMenu_Background = InheritFrom( LUI.UIElement )
CoD.StartMenu_Background.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Background )
	self.id = "StartMenu_Background"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0.06, 0.06, 0.06 )
	Background:setAlpha( 0.95 )
	Background:setImage( RegisterImage( "uie_default_white_255" ) )
	self:addElement( Background )
	self.Background = Background
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
			end
		},
		InGame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setAlpha( 0.2 )
				self.clipFinished( Background, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

