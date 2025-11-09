CoD.CustomGameOfficial = InheritFrom( LUI.UIElement )
CoD.CustomGameOfficial.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CustomGameOfficial )
	self.id = "CustomGameOfficial"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 130 )
	self:setTopBottom( true, false, 0, 25 )
	
	local officialIcon = LUI.UIImage.new()
	officialIcon:setLeftRight( true, false, 0, 23 )
	officialIcon:setTopBottom( true, false, 2, 25 )
	officialIcon:setImage( RegisterImage( "uie_t7_icon_shield_official" ) )
	self:addElement( officialIcon )
	self.officialIcon = officialIcon
	
	local Official = LUI.UIText.new()
	Official:setLeftRight( true, false, 28, 130 )
	Official:setTopBottom( true, false, -1, 25 )
	Official:setText( Engine.Localize( "MENU_OFFICIAL_CAPS" ) )
	Official:setTTF( "fonts/default.ttf" )
	Official:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Official:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Official )
	self.Official = Official
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				officialIcon:completeAnimation()
				self.officialIcon:setAlpha( 0 )
				self.clipFinished( officialIcon, {} )
				Official:completeAnimation()
				self.Official:setAlpha( 0 )
				self.clipFinished( Official, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				officialIcon:completeAnimation()
				self.officialIcon:setAlpha( 1 )
				self.clipFinished( officialIcon, {} )
				Official:completeAnimation()
				self.Official:setAlpha( 1 )
				self.clipFinished( Official, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsCustomMPLobby() and IsSelfModelValueTrue( element, controller, "isOfficial" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:linkToElementModel( self, "isOfficial", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isOfficial"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

