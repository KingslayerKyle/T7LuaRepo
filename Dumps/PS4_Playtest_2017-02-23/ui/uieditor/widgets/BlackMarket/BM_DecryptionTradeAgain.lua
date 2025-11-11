CoD.BM_DecryptionTradeAgain = InheritFrom( LUI.UIElement )
CoD.BM_DecryptionTradeAgain.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_DecryptionTradeAgain )
	self.id = "BM_DecryptionTradeAgain"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 163 )
	self:setTopBottom( 0, 0, 0, 25 )
	
	local tradeAgainText = LUI.UIText.new()
	tradeAgainText:setLeftRight( 0, 0, 0, 164 )
	tradeAgainText:setTopBottom( 0, 0, 0, 25 )
	tradeAgainText:setRGB( 0.69, 0.9, 0.8 )
	tradeAgainText:setScale( 0.9 )
	tradeAgainText:setText( LocalizeToUpperString( "MPUI_BM_TRADE_AGAIN" ) )
	tradeAgainText:setTTF( "fonts/escom.ttf" )
	tradeAgainText:setLineSpacing( 1 )
	tradeAgainText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	tradeAgainText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( tradeAgainText )
	self.tradeAgainText = tradeAgainText
	
	self.resetProperties = function ()
		tradeAgainText:completeAnimation()
		tradeAgainText:setAlpha( 1 )
		tradeAgainText:setText( LocalizeToUpperString( "MPUI_BM_TRADE_AGAIN" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Rolling = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				tradeAgainText:completeAnimation()
				self.tradeAgainText:setAlpha( 0 )
				self.clipFinished( tradeAgainText, {} )
			end
		},
		Bundle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				tradeAgainText:completeAnimation()
				self.tradeAgainText:setText( LocalizeToUpperString( "MPUI_BM_BUNDLE" ) )
				self.clipFinished( tradeAgainText, {} )
			end
		},
		TradeAgain = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

