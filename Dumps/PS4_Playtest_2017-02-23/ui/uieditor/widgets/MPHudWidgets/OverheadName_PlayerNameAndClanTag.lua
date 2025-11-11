CoD.OverheadName_PlayerNameAndClanTag = InheritFrom( LUI.UIElement )
CoD.OverheadName_PlayerNameAndClanTag.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OverheadName_PlayerNameAndClanTag )
	self.id = "OverheadName_PlayerNameAndClanTag"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 200 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local ClanTag = LUI.UITightText.new()
	ClanTag:setLeftRight( 0, 0, 0, 90 )
	ClanTag:setTopBottom( 0, 0, 0, 27 )
	ClanTag:setTTF( "fonts/default.ttf" )
	ClanTag:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ClanTag:setText( StringAsClanTag( modelValue ) )
		end
	end )
	self:addElement( ClanTag )
	self.ClanTag = ClanTag
	
	local PlayerName = LUI.UITightText.new()
	PlayerName:setLeftRight( 0, 0, 92, 292 )
	PlayerName:setTopBottom( 0, 0, 0, 27 )
	PlayerName:setTTF( "fonts/default.ttf" )
	PlayerName:linkToElementModel( self, "playerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	self.resetProperties = function ()
		PlayerName:completeAnimation()
		ClanTag:completeAnimation()
		PlayerName:setAlpha( 1 )
		ClanTag:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ClanTag:completeAnimation()
				self.ClanTag:setAlpha( 0 )
				self.clipFinished( ClanTag, {} )
				PlayerName:completeAnimation()
				self.PlayerName:setAlpha( 0 )
				self.clipFinished( PlayerName, {} )
			end
		},
		NameOnly = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ClanTag:completeAnimation()
				self.ClanTag:setAlpha( 0 )
				self.clipFinished( ClanTag, {} )
				PlayerName:completeAnimation()
				self.PlayerName:setAlpha( 1 )
				self.clipFinished( PlayerName, {} )
			end
		},
		NameAndTag = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ClanTag:completeAnimation()
				self.ClanTag:setAlpha( 1 )
				self.clipFinished( ClanTag, {} )
				PlayerName:completeAnimation()
				self.PlayerName:setAlpha( 1 )
				self.clipFinished( PlayerName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NameOnly",
			condition = function ( menu, element, event )
				return CoD.OptionsUtility.IsProfileIntValue( controller, "team_indicator", Enum.SettingTeamIndicator.SettingTeamIndicator_ABBREVIATED )
			end
		},
		{
			stateName = "NameAndTag",
			condition = function ( menu, element, event )
				return CoD.OptionsUtility.IsProfileIntValue( controller, "team_indicator", Enum.SettingTeamIndicator.SettingTeamIndicator_FULL )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "storageGlobalRoot.user_settings" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "storageGlobalRoot.user_settings"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ClanTag:close()
		self.PlayerName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

