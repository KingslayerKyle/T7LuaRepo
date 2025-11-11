CoD.WarScoreboardRowItem = InheritFrom( LUI.UIElement )
CoD.WarScoreboardRowItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WarScoreboardRowItem )
	self.id = "WarScoreboardRowItem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 166 )
	self:setTopBottom( 0, 0, 0, 60 )
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( 0, 0, 0, 166 )
	Text:setTopBottom( 0, 0, 12, 48 )
	Text:setText( "" )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 0, 0, 166 )
	TextBox:setTopBottom( 0, 0, 12, 48 )
	TextBox:setAlpha( 0 )
	TextBox:setText( Engine.Localize( "-" ) )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self.resetProperties = function ()
		Text:completeAnimation()
		TextBox:completeAnimation()
		Text:setLeftRight( 0, 0, 0, 166 )
		Text:setTopBottom( 0, 0, 12, 48 )
		Text:setRGB( 1, 1, 1 )
		Text:setAlpha( 1 )
		TextBox:setLeftRight( 0, 0, 0, 166 )
		TextBox:setTopBottom( 0, 0, 12, 48 )
		TextBox:setRGB( 1, 1, 1 )
		TextBox:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Text:completeAnimation()
				self.Text:setLeftRight( 0, 0, 0, 166 )
				self.Text:setTopBottom( 0, 0, 0, 61 )
				self.Text:setRGB( 0.67, 0.75, 0.71 )
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( 0, 0, 0, 166 )
				self.TextBox:setTopBottom( 0, 0, 0, 61 )
				self.TextBox:setRGB( 0.67, 0.75, 0.71 )
				self.TextBox:setAlpha( 1 )
				self.clipFinished( TextBox, {} )
			end
		},
		Shown = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Text:completeAnimation()
				self.Text:setLeftRight( 0, 0, 0, 166 )
				self.Text:setTopBottom( 0, 0, 0, 61 )
				self.Text:setRGB( 0.67, 0.75, 0.71 )
				self.clipFinished( Text, {} )
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( 0, 0, 0, 166 )
				self.TextBox:setTopBottom( 0, 0, 0, 61 )
				self.clipFinished( TextBox, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

