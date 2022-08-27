-- 4409a3103f8534efadf3fa0b3202ec5b
-- This hash is used for caching, delete to decompile the file again

CoD.IncomingExplosive_DistanceText = InheritFrom( LUI.UIElement )
CoD.IncomingExplosive_DistanceText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IncomingExplosive_DistanceText )
	self.id = "IncomingExplosive_DistanceText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 133 )
	self:setTopBottom( true, false, 0, 36 )
	
	local textDistance = LUI.UIText.new()
	textDistance:setLeftRight( true, false, 0, 133 )
	textDistance:setTopBottom( false, false, -18, 13 )
	textDistance:setRGB( 1, 0.75, 0.75 )
	textDistance:setText( Engine.Localize( "32" ) )
	textDistance:setTTF( "fonts/escom.ttf" )
	textDistance:setLetterSpacing( 2 )
	textDistance:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	textDistance:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textDistance )
	self.textDistance = textDistance
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 0, 133 )
	TextBox0:setTopBottom( false, false, 6, 28 )
	TextBox0:setRGB( 1, 0.75, 0.75 )
	TextBox0:setText( Engine.Localize( "m" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setLetterSpacing( 2 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				textDistance:completeAnimation()
				self.textDistance:setAlpha( 0 )
				self.clipFinished( textDistance, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		},
		Grenade = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				textDistance:completeAnimation()
				self.textDistance:setAlpha( 1 )
				self.clipFinished( textDistance, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

