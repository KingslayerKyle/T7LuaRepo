CoD.Social_PlayersListButton_Presence = InheritFrom( LUI.UIElement )
CoD.Social_PlayersListButton_Presence.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PlayersListButton_Presence )
	self.id = "Social_PlayersListButton_Presence"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 258 )
	self:setTopBottom( true, false, 0, 24 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local platformPresence = LUI.UIText.new()
	platformPresence:setLeftRight( true, true, 2, -2 )
	platformPresence:setTopBottom( false, true, -18, 2 )
	platformPresence:setRGB( 1, 1, 1 )
	platformPresence:setText( Engine.Localize( "Watching Netflix" ) )
	platformPresence:setTTF( "fonts/default.ttf" )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( platformPresence )
	self.platformPresence = platformPresence
	
	local titlePresence = LUI.UIText.new()
	titlePresence:setLeftRight( true, true, 28, 2 )
	titlePresence:setTopBottom( false, true, -18, 2 )
	titlePresence:setRGB( 1, 1, 1 )
	titlePresence:setAlpha( 0 )
	titlePresence:setText( Engine.Localize( "Main Menu" ) )
	titlePresence:setTTF( "fonts/default.ttf" )
	titlePresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titlePresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( titlePresence )
	self.titlePresence = titlePresence
	
	local titlePresenceIcon = LUI.UIImage.new()
	titlePresenceIcon:setLeftRight( true, false, 0, 24 )
	titlePresenceIcon:setTopBottom( true, false, 0, 24 )
	titlePresenceIcon:setRGB( 1, 1, 1 )
	titlePresenceIcon:setAlpha( 0 )
	titlePresenceIcon:setImage( RegisterImage( "uie_t7_menu_frontend_iconmodebo3" ) )
	titlePresenceIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( titlePresenceIcon )
	self.titlePresenceIcon = titlePresenceIcon
	
	local lastMet = LUI.UIText.new()
	lastMet:setLeftRight( false, true, -130, 0 )
	lastMet:setTopBottom( false, true, -18, 2 )
	lastMet:setRGB( 1, 1, 1 )
	lastMet:setAlpha( HideIfEmptyString( 1 ) )
	lastMet:setText( Engine.Localize( "" ) )
	lastMet:setTTF( "fonts/default.ttf" )
	lastMet:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	lastMet:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( lastMet )
	self.lastMet = lastMet
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				platformPresence:completeAnimation()
				self.platformPresence:setAlpha( 0 )
				self.clipFinished( platformPresence, {} )
				titlePresence:completeAnimation()
				self.titlePresence:setAlpha( 1 )
				self.clipFinished( titlePresence, {} )
				titlePresenceIcon:completeAnimation()
				self.titlePresenceIcon:setAlpha( 1 )
				self.clipFinished( titlePresenceIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		ShowPlatformPresence = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				platformPresence:completeAnimation()
				self.platformPresence:setAlpha( 1 )
				self.clipFinished( platformPresence, {} )
				titlePresence:completeAnimation()
				self.titlePresence:setAlpha( 0 )
				self.clipFinished( titlePresence, {} )
				titlePresenceIcon:completeAnimation()
				self.titlePresenceIcon:setAlpha( 0 )
				self.clipFinished( titlePresenceIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowPlatformPresence",
			condition = function ( menu, element, event )
				return not IsInTitle( self, controller )
			end
		}
	} )
	self:linkToElementModel( self, "activity", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "activity"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

