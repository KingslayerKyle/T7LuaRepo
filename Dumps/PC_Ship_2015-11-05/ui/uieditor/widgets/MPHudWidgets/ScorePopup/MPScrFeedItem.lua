CoD.MPScrFeedItem = InheritFrom( LUI.UIElement )
CoD.MPScrFeedItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MPScrFeedItem )
	self.id = "MPScrFeedItem"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 18 )
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( true, false, 0, 240 )
	TextBox:setTopBottom( true, false, 0, 18 )
	TextBox:setText( Engine.Localize( "Killed Attacker" ) )
	TextBox:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			NewLine = function ()
				self:setupElementClipCounter( 1 )
				local TextBoxFrame2 = function ( TextBox, event )
					if not event.interrupted then
						TextBox:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TextBox:setLeftRight( true, false, 0, 240 )
					TextBox:setTopBottom( true, false, 0, 18 )
					if event.interrupted then
						self.clipFinished( TextBox, event )
					else
						TextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( true, false, 0, 240 )
				self.TextBox:setTopBottom( true, false, 0, 4 )
				TextBoxFrame2( TextBox, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

