-- 98919e657a9797b2e9602dde35e6427e
-- This hash is used for caching, delete to decompile the file again

CoD.BlackmarketRewards54i = InheritFrom( LUI.UIElement )
CoD.BlackmarketRewards54i.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BlackmarketRewards54i )
	self.id = "BlackmarketRewards54i"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 188 )
	self:setTopBottom( true, false, 0, 44 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 44.07, 187.67 )
	text:setTopBottom( true, false, 7, 24 )
	text:setRGB( 0.94, 0.89, 0.59 )
	text:setScale( 0.8 )
	text:setText( Engine.Localize( "MPUI_BM_CONTRACT_SPECIAL_CONTRACTS" ) )
	text:setTTF( "fonts/escom.ttf" )
	text:setLetterSpacing( 8 )
	text:setLineSpacing( -0.9 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( text )
	self.text = text
	
	local i54 = LUI.UIImage.new()
	i54:setLeftRight( true, false, 0, 60.9 )
	i54:setTopBottom( true, false, 0, 43.5 )
	i54:setImage( RegisterImage( "uie_t7_hud_notif_blackmarket_54i" ) )
	self:addElement( i54 )
	self.i54 = i54
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				text:completeAnimation()
				self.text:setLeftRight( true, false, 44.07, 187.67 )
				self.text:setTopBottom( true, false, 7, 24 )
				self.clipFinished( text, {} )
			end
		},
		SideBet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				text:completeAnimation()
				self.text:setLeftRight( true, false, 44.4, 188 )
				self.text:setTopBottom( true, false, 13.25, 30.25 )
				self.clipFinished( text, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

