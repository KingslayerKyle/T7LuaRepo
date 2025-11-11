CoD.FE_3dTitleHardcoreKicker = InheritFrom( LUI.UIElement )
CoD.FE_3dTitleHardcoreKicker.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_3dTitleHardcoreKicker )
	self.id = "FE_3dTitleHardcoreKicker"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 175 )
	self:setTopBottom( 0, 0, 0, 24 )
	
	local Kickertxt2 = LUI.UITightText.new()
	Kickertxt2:setLeftRight( 0, 0, 0, 175 )
	Kickertxt2:setTopBottom( 0, 0, 0, 24 )
	Kickertxt2:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Kickertxt2:subscribeToGlobalModel( controller, "LobbyPlaylistName", "kickerText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Kickertxt2:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Kickertxt2 )
	self.Kickertxt2 = Kickertxt2
	
	self.resetProperties = function ()
		Kickertxt2:completeAnimation()
		Kickertxt2:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Kickertxt2:completeAnimation()
				self.Kickertxt2:setAlpha( 0 )
				self.clipFinished( Kickertxt2, {} )
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
				return IsGlobalModelValueNonEmptyString( element, controller, "lobbyRoot.lobbyTitle" ) and ShouldShowPlaylistName()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyTitle" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyTitle"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Kickertxt2:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

