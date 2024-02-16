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
	
	local platformPresence = LUI.UIText.new()
	platformPresence:setLeftRight( true, false, 3, 257 )
	platformPresence:setTopBottom( true, false, 2, 22 )
	platformPresence:setAlpha( 0 )
	platformPresence:setText( Engine.Localize( "Watching Netflix" ) )
	platformPresence:setTTF( "fonts/default.ttf" )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( platformPresence )
	self.platformPresence = platformPresence
	
	local titlePresence = LUI.UIText.new()
	titlePresence:setLeftRight( true, false, 25, 257 )
	titlePresence:setTopBottom( true, false, 2, 22 )
	titlePresence:setText( Engine.Localize( "MENU_MAIN_MENU" ) )
	titlePresence:setTTF( "fonts/default.ttf" )
	titlePresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titlePresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( titlePresence )
	self.titlePresence = titlePresence
	
	local titlePresenceIcon = LUI.UIImage.new()
	titlePresenceIcon:setLeftRight( true, false, 0, 24 )
	titlePresenceIcon:setTopBottom( true, false, 0, 24 )
	titlePresenceIcon:setImage( RegisterImage( "uie_t7_menu_frontend_iconmodebo3" ) )
	self:addElement( titlePresenceIcon )
	self.titlePresenceIcon = titlePresenceIcon
	
	local lastMet = LUI.UIText.new()
	lastMet:setLeftRight( false, true, -131, -1 )
	lastMet:setTopBottom( true, false, 5, 21 )
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
				self.titlePresence:setLeftRight( true, false, 25, 257 )
				self.titlePresence:setTopBottom( true, false, 2, 22 )
				self.titlePresence:setAlpha( 1 )
				self.clipFinished( titlePresence, {} )
				titlePresenceIcon:completeAnimation()
				self.titlePresenceIcon:setAlpha( 1 )
				self.clipFinished( titlePresenceIcon, {} )
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
	self:linkToElementModel( "activity", true, function ( model )
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

