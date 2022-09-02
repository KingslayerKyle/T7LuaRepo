-- 67ba970880d5ed0cdf7fa3b2a60b516b
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 117 )
	self:setTopBottom( true, false, 0, 16 )
	
	local Kickertxt2 = LUI.UITightText.new()
	Kickertxt2:setLeftRight( true, false, 0, 116.5 )
	Kickertxt2:setTopBottom( true, false, 0, 16 )
	Kickertxt2:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Kickertxt2:subscribeToGlobalModel( controller, "LobbyPlaylistName", "kickerText", function ( model )
		local kickerText = Engine.GetModelValue( model )
		if kickerText then
			Kickertxt2:setText( Engine.Localize( kickerText ) )
		end
	end )
	self:addElement( Kickertxt2 )
	self.Kickertxt2 = Kickertxt2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Kickertxt2:completeAnimation()
				self.Kickertxt2:setAlpha( 0 )
				self.clipFinished( Kickertxt2, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Kickertxt2:completeAnimation()
				self.Kickertxt2:setAlpha( 1 )
				self.clipFinished( Kickertxt2, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Kickertxt2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

