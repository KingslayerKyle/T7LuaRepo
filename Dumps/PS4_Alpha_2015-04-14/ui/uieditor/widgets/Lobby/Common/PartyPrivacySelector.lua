CoD.PartyPrivacySelector = InheritFrom( LUI.UIElement )
CoD.PartyPrivacySelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.PartyPrivacySelector )
	self.id = "PartyPrivacySelector"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 110 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local PartyPrivacy = LUI.UIText.new()
	PartyPrivacy:setLeftRight( true, true, 20.5, -18 )
	PartyPrivacy:setTopBottom( true, true, 0, 0 )
	PartyPrivacy:setRGB( 1, 1, 1 )
	PartyPrivacy:setText( Engine.Localize( "TEXT" ) )
	PartyPrivacy:setTTF( "fonts/default.ttf" )
	PartyPrivacy:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PartyPrivacy:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PartyPrivacy.buttonPromptAddFunctions = {}
	PartyPrivacy.buttonPromptAddFunctions.right = function ( menu, element, event )
		if element:isInFocus() then
			return true
		else
			
		end
	end
	
	PartyPrivacy:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "right" or event.button == "key_shortcut" and event.key == "RIGHTARROW") and element:isInFocus() then
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	PartyPrivacy:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.right( menu, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	PartyPrivacy:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		menu:removeButtonPrompt( "right", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( PartyPrivacy )
	self.PartyPrivacy = PartyPrivacy
	
	local LeftArrow = LUI.UIImage.new()
	LeftArrow:setLeftRight( true, false, 0, 26 )
	LeftArrow:setTopBottom( true, true, 1, 0 )
	LeftArrow:setRGB( 1, 1, 1 )
	LeftArrow:setImage( RegisterImage( "uie_ui_arrow_left" ) )
	LeftArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( LeftArrow )
	self.LeftArrow = LeftArrow
	
	local RightArrow = LUI.UIImage.new()
	RightArrow:setLeftRight( false, true, -25, 0 )
	RightArrow:setTopBottom( true, true, 1, 0 )
	RightArrow:setRGB( 1, 1, 1 )
	RightArrow:setAlpha( 0 )
	RightArrow:setImage( RegisterImage( "uie_ui_arrow_right" ) )
	RightArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( RightArrow )
	self.RightArrow = RightArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 1, 1 )
				self.PartyPrivacy:setAlpha( 1 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setRGB( 1, 1, 1 )
				self.LeftArrow:setAlpha( 1 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setRGB( 1, 1, 1 )
				self.RightArrow:setAlpha( 1 )
				self.clipFinished( RightArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 0.41, 0 )
				self.PartyPrivacy:setAlpha( 1 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setRGB( 1, 0.41, 0 )
				self.LeftArrow:setAlpha( 1 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setRGB( 1, 0.41, 0 )
				self.RightArrow:setAlpha( 1 )
				self.clipFinished( RightArrow, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 1, 1 )
				self.PartyPrivacy:setAlpha( 1 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setRGB( 1, 1, 1 )
				self.LeftArrow:setAlpha( 1 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setRGB( 1, 1, 1 )
				self.RightArrow:setAlpha( 1 )
				self.clipFinished( RightArrow, {} )
			end
		},
		LeftArrowDisabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 1, 1 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setAlpha( 0 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setRGB( 1, 1, 1 )
				self.RightArrow:setAlpha( 1 )
				self.clipFinished( RightArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 0.41, 0 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setAlpha( 0 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setRGB( 1, 0.41, 0 )
				self.clipFinished( RightArrow, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 1, 1 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setAlpha( 0 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setRGB( 1, 1, 1 )
				self.RightArrow:setAlpha( 1 )
				self.clipFinished( RightArrow, {} )
			end
		},
		RightArrowDisabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 1, 1 )
				self.PartyPrivacy:setAlpha( 1 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setRGB( 1, 1, 1 )
				self.LeftArrow:setAlpha( 1 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setAlpha( 0 )
				self.clipFinished( RightArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 0.41, 0 )
				self.PartyPrivacy:setAlpha( 1 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setRGB( 1, 0.41, 0 )
				self.LeftArrow:setAlpha( 1 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setAlpha( 0 )
				self.clipFinished( RightArrow, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 1, 1 )
				self.PartyPrivacy:setAlpha( 1 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setRGB( 1, 1, 1 )
				self.LeftArrow:setAlpha( 1 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setRGB( 1, 1, 1 )
				self.RightArrow:setAlpha( 0 )
				self.clipFinished( RightArrow, {} )
			end
		},
		BothArrowsDisabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 1, 1 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setAlpha( 0 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setAlpha( 0 )
				self.clipFinished( RightArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setRGB( 1, 0.41, 0 )
				self.clipFinished( PartyPrivacy, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				PartyPrivacy:completeAnimation()
				self.PartyPrivacy:setLeftRight( true, false, 19.25, 90.75 )
				self.PartyPrivacy:setTopBottom( true, false, 0, 25 )
				self.PartyPrivacy:setRGB( 1, 1, 1 )
				self.PartyPrivacy:setAlpha( 1 )
				self.clipFinished( PartyPrivacy, {} )
				LeftArrow:completeAnimation()
				self.LeftArrow:setRGB( 1, 1, 1 )
				self.LeftArrow:setAlpha( 0 )
				self.clipFinished( LeftArrow, {} )
				RightArrow:completeAnimation()
				self.RightArrow:setRGB( 1, 1, 1 )
				self.RightArrow:setAlpha( 0 )
				self.clipFinished( RightArrow, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

