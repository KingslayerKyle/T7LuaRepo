-- ee8548713c207d70af3ef49516508b51
-- This hash is used for caching, delete to decompile the file again

CoD.ChooseCharacter_HelpBubble_ButtonBackground = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_HelpBubble_ButtonBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_HelpBubble_ButtonBackground )
	self.id = "ChooseCharacter_HelpBubble_ButtonBackground"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 32 )
	
	local ButtonBackground = LUI.UIImage.new()
	ButtonBackground:setLeftRight( true, true, 0, 0 )
	ButtonBackground:setTopBottom( true, false, 0, 32 )
	ButtonBackground:setRGB( 0.18, 0.18, 0.18 )
	self:addElement( ButtonBackground )
	self.ButtonBackground = ButtonBackground
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ButtonBackground:completeAnimation()
				self.ButtonBackground:setAlpha( 1 )
				self.clipFinished( ButtonBackground, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
