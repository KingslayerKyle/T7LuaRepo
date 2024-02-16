CoD.PlayerStylesWidget = InheritFrom( LUI.UIElement )
CoD.PlayerStylesWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerStylesWidget )
	self.id = "PlayerStylesWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 103 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 201 )
	Image0:setTopBottom( true, false, 0, 101.5 )
	Image0:setRGB( 0.56, 0.56, 0.56 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 0, 201 )
	TextBox0:setTopBottom( true, false, 0, 42 )
	TextBox0:setText( Engine.Localize( "GeneralZOD" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 0, 201 )
	TextBox1:setTopBottom( true, false, 58.5, 101.5 )
	TextBox1:setText( Engine.Localize( "Gum Baller" ) )
	TextBox1:setTTF( "fonts/default.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
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

