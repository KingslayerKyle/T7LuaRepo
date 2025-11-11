require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_lines" )
require( "ui.uieditor.widgets.Social.Social_JoinBtn" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self:setForceMouseEventDispatch( true )
	end
	self:registerEventHandler( "update_state", LUI.UIElement.updateState )
end

CoD.Social_InfoPane_Presence_Joinable = InheritFrom( LUI.UIElement )
CoD.Social_InfoPane_Presence_Joinable.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_InfoPane_Presence_Joinable )
	self.id = "Social_InfoPane_Presence_Joinable"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 531 )
	self:setTopBottom( 0, 0, 0, 99 )
	self.anyChildUsesUpdateState = true
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 0, 14, 36 )
	Icon:setTopBottom( 0, 0, -36, -3 )
	Icon:setRGB( 0.87, 0.9, 0.9 )
	Icon:setAlpha( 0 )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconjoinable" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local notjoinableText = LUI.UIText.new()
	notjoinableText:setLeftRight( 0, 1, 16, -110 )
	notjoinableText:setTopBottom( 1, 1, -89, -56 )
	notjoinableText:setScale( LanguageOverrideNumber( "japanese", 0.9, 1 ) )
	notjoinableText:setTTF( "fonts/default.ttf" )
	notjoinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	notjoinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	notjoinableText:linkToElementModel( self, "joinable", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			notjoinableText:setText( Engine.Localize( LobbyJoinableToString( modelValue ) ) )
		end
	end )
	self:addElement( notjoinableText )
	self.notjoinableText = notjoinableText
	
	local MissionRecordVaultlines01 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines01:setLeftRight( 0, 1, 3, -3 )
	MissionRecordVaultlines01:setTopBottom( 1, 1, -98, -92 )
	MissionRecordVaultlines01:setAlpha( 0.75 )
	self:addElement( MissionRecordVaultlines01 )
	self.MissionRecordVaultlines01 = MissionRecordVaultlines01
	
	local MissionRecordVaultlines010 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines010:setLeftRight( 0, 1, 3, -3 )
	MissionRecordVaultlines010:setTopBottom( 1, 1, -19, -13 )
	MissionRecordVaultlines010:setAlpha( 0.75 )
	self:addElement( MissionRecordVaultlines010 )
	self.MissionRecordVaultlines010 = MissionRecordVaultlines010
	
	local SocialJoinBtn = CoD.Social_JoinBtn.new( menu, controller )
	SocialJoinBtn:setLeftRight( 1, 1, -313, -15 )
	SocialJoinBtn:setTopBottom( 1, 1, -91.5, -52.5 )
	SocialJoinBtn:linkToElementModel( self, nil, false, function ( model )
		SocialJoinBtn:setModel( model, controller )
	end )
	SocialJoinBtn:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( SocialJoinBtn )
	self.SocialJoinBtn = SocialJoinBtn
	
	self.resetProperties = function ()
		notjoinableText:completeAnimation()
		SocialJoinBtn:completeAnimation()
		notjoinableText:setAlpha( 1 )
		SocialJoinBtn:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		LobbyLocked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				notjoinableText:completeAnimation()
				self.notjoinableText:setAlpha( 0 )
				self.clipFinished( notjoinableText, {} )
				SocialJoinBtn:completeAnimation()
				self.SocialJoinBtn:setAlpha( 0 )
				self.clipFinished( SocialJoinBtn, {} )
			end
		},
		HideJoinButton = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				notjoinableText:completeAnimation()
				self.notjoinableText:setAlpha( 0 )
				self.clipFinished( notjoinableText, {} )
				SocialJoinBtn:completeAnimation()
				self.SocialJoinBtn:setAlpha( 0 )
				self.clipFinished( SocialJoinBtn, {} )
			end
		},
		NotJoinable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				SocialJoinBtn:completeAnimation()
				self.SocialJoinBtn:setAlpha( 0 )
				self.clipFinished( SocialJoinBtn, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "LobbyLocked",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "lobbyRoot.lobbyLockedIn" )
			end
		},
		{
			stateName = "HideJoinButton",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "hideJoinButton" )
			end
		},
		{
			stateName = "NotJoinable",
			condition = function ( menu, element, event )
				return not IsJoinable( self, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		} )
	end )
	self:linkToElementModel( self, "joinable", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "joinable"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MissionRecordVaultlines01:close()
		self.MissionRecordVaultlines010:close()
		self.SocialJoinBtn:close()
		self.notjoinableText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

