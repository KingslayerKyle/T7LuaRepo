CoD.WarScoreboardRowItemBonusTime = InheritFrom( LUI.UIElement )
CoD.WarScoreboardRowItemBonusTime.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WarScoreboardRowItemBonusTime )
	self.id = "WarScoreboardRowItemBonusTime"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 166 )
	self:setTopBottom( 0, 0, 0, 100 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 166 )
	bg:setTopBottom( 0, 0, 0, 100 )
	bg:setRGB( 0.42, 0.42, 0.42 )
	bg:setAlpha( 0 )
	self:addElement( bg )
	self.bg = bg
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( 0, 0, 0, 166 )
	Text:setTopBottom( 0, 0, 5, 41 )
	Text:setRGB( 0.66, 0.74, 0.69 )
	Text:setText( Engine.Localize( "Zone 1" ) )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local TimeText = LUI.UIText.new()
	TimeText:setLeftRight( 0, 0, 0, 166 )
	TimeText:setTopBottom( 0, 0, 58, 94 )
	TimeText:setText( Engine.Localize( "Zone 1" ) )
	TimeText:setTTF( "fonts/default.ttf" )
	TimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimeText )
	self.TimeText = TimeText
	
	local TimeRemaining = LUI.UIText.new()
	TimeRemaining:setLeftRight( 0, 0, 0, 166 )
	TimeRemaining:setTopBottom( 0, 0, 37, 63 )
	TimeRemaining:setText( Engine.Localize( "MENU_TIME_REMAINING" ) )
	TimeRemaining:setTTF( "fonts/default.ttf" )
	TimeRemaining:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TimeRemaining:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimeRemaining )
	self.TimeRemaining = TimeRemaining
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 0, 0, 166 )
	TextBox:setTopBottom( 0, 0, 27, 63 )
	TextBox:setAlpha( 0 )
	TextBox:setText( Engine.Localize( "-" ) )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self.resetProperties = function ()
		TextBox:completeAnimation()
		TimeRemaining:completeAnimation()
		TimeText:completeAnimation()
		Text:completeAnimation()
		TextBox:setAlpha( 0 )
		TimeRemaining:setAlpha( 1 )
		TimeText:setAlpha( 1 )
		Text:setLeftRight( 0, 0, 0, 166 )
		Text:setTopBottom( 0, 0, 5, 41 )
		Text:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
				TimeText:completeAnimation()
				self.TimeText:setAlpha( 0 )
				self.clipFinished( TimeText, {} )
				TimeRemaining:completeAnimation()
				self.TimeRemaining:setAlpha( 0 )
				self.clipFinished( TimeRemaining, {} )
				TextBox:completeAnimation()
				self.TextBox:setAlpha( 1 )
				self.clipFinished( TextBox, {} )
			end
		},
		ShownZero = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Text:completeAnimation()
				self.Text:setLeftRight( 0, 0, 0, 166 )
				self.Text:setTopBottom( 0, 0, 32, 68 )
				self.clipFinished( Text, {} )
				TimeText:completeAnimation()
				self.TimeText:setAlpha( 0 )
				self.clipFinished( TimeText, {} )
				TimeRemaining:completeAnimation()
				self.TimeRemaining:setAlpha( 0 )
				self.clipFinished( TimeRemaining, {} )
			end
		},
		Shown = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Text:completeAnimation()
				self.Text:setLeftRight( 0, 0, 0, 166 )
				self.Text:setTopBottom( 0, 0, 7, 43 )
				self.clipFinished( Text, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

