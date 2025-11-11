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
	self:setLeftRight( 0, 0, 0, 195 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local officialIcon = LUI.UIImage.new()
	officialIcon:setLeftRight( 0, 0, 0, 35 )
	officialIcon:setTopBottom( 0, 0, 3, 38 )
	officialIcon:setImage( RegisterImage( "uie_t7_icon_shield_official" ) )
	self:addElement( officialIcon )
	self.officialIcon = officialIcon
	
	local Official = LUI.UIText.new()
	Official:setLeftRight( 0, 0, 42, 195 )
	Official:setTopBottom( 0, 0, -2, 37 )
	Official:setText( Engine.Localize( "MENU_OFFICIAL_CAPS" ) )
	Official:setTTF( "fonts/default.ttf" )
	Official:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Official:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Official )
	self.Official = Official
	
	self.resetProperties = function ()
		officialIcon:completeAnimation()
		Official:completeAnimation()
		officialIcon:setAlpha( 1 )
		Official:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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

