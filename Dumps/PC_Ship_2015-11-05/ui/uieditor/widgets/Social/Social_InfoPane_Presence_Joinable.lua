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
	self:setLeftRight( true, false, 0, 354 )
	self:setTopBottom( true, false, 0, 66 )
	self.anyChildUsesUpdateState = true
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 9, 23.67 )
	Icon:setTopBottom( true, false, -24, -2 )
	Icon:setRGB( 0.87, 0.9, 0.9 )
	Icon:setAlpha( 0 )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconjoinable" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local notjoinableText = LUI.UIText.new()
	notjoinableText:setLeftRight( true, true, 10.67, -73.33 )
	notjoinableText:setTopBottom( false, true, -59, -37 )
	notjoinableText:setScale( LanguageOverrideNumber( "japanese", 0.9, 1 ) )
	notjoinableText:setTTF( "fonts/default.ttf" )
	notjoinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	notjoinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	notjoinableText:linkToElementModel( self, "joinable", true, function ( model )
		local joinable = Engine.GetModelValue( model )
		if joinable then
			notjoinableText:setText( Engine.Localize( LobbyJoinableToString( joinable ) ) )
		end
	end )
	self:addElement( notjoinableText )
	self.notjoinableText = notjoinableText
	
	local MissionRecordVaultlines01 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines01:setLeftRight( true, true, 2, -2 )
	MissionRecordVaultlines01:setTopBottom( false, true, -65.44, -61.44 )
	MissionRecordVaultlines01:setAlpha( 0.75 )
	self:addElement( MissionRecordVaultlines01 )
	self.MissionRecordVaultlines01 = MissionRecordVaultlines01
	
	local MissionRecordVaultlines010 = CoD.MissionRecordVault_lines.new( menu, controller )
	MissionRecordVaultlines010:setLeftRight( true, true, 2, -2 )
	MissionRecordVaultlines010:setTopBottom( false, true, -12.44, -8.44 )
	MissionRecordVaultlines010:setAlpha( 0.75 )
	self:addElement( MissionRecordVaultlines010 )
	self.MissionRecordVaultlines010 = MissionRecordVaultlines010
	
	local SocialJoinBtn = CoD.Social_JoinBtn.new( menu, controller )
	SocialJoinBtn:setLeftRight( false, true, -209, -10 )
	SocialJoinBtn:setTopBottom( false, true, -61, -35 )
	SocialJoinBtn:linkToElementModel( self, nil, false, function ( model )
		SocialJoinBtn:setModel( model, controller )
	end )
	SocialJoinBtn:registerEventHandler( "button_action", function ( element, event )
		local f5_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:addElement( SocialJoinBtn )
	self.SocialJoinBtn = SocialJoinBtn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
				notjoinableText:completeAnimation()
				self.notjoinableText:setAlpha( 1 )
				self.clipFinished( notjoinableText, {} )
				SocialJoinBtn:completeAnimation()
				self.SocialJoinBtn:setAlpha( 1 )
				self.clipFinished( SocialJoinBtn, {} )
			end
		},
		LobbyLocked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
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
				self:setupElementClipCounter( 3 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
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
				self:setupElementClipCounter( 3 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
				notjoinableText:completeAnimation()
				self.notjoinableText:setAlpha( 1 )
				self.clipFinished( notjoinableText, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MissionRecordVaultlines01:close()
		element.MissionRecordVaultlines010:close()
		element.SocialJoinBtn:close()
		element.notjoinableText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

