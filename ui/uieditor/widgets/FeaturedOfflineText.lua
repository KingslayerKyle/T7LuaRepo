-- 327ca0ab0c5345b59c295f09d0b787f3
-- This hash is used for caching, delete to decompile the file again

CoD.FeaturedOfflineText = InheritFrom( LUI.UIElement )
CoD.FeaturedOfflineText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FeaturedOfflineText )
	self.id = "FeaturedOfflineText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 293 )
	self:setTopBottom( true, false, 0, 25 )
	
	local OfflineNotice = LUI.UIText.new()
	OfflineNotice:setLeftRight( true, false, 0, 293 )
	OfflineNotice:setTopBottom( true, false, 0, 20 )
	OfflineNotice:setText( Engine.Localize( "MENU_NEW" ) )
	OfflineNotice:setTTF( "fonts/default.ttf" )
	OfflineNotice:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	OfflineNotice:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( OfflineNotice )
	self.OfflineNotice = OfflineNotice
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				OfflineNotice:completeAnimation()
				self.OfflineNotice:setAlpha( 0 )
				self.OfflineNotice:setText( Engine.Localize( "" ) )
				self.clipFinished( OfflineNotice, {} )
			end,
			FeaturedCardsVisible = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		OfflineNormal = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				OfflineNotice:completeAnimation()
				self.OfflineNotice:setAlpha( 1 )
				self.OfflineNotice:setText( Engine.Localize( "MENU_FEATURED_OFFLINE" ) )
				self.clipFinished( OfflineNotice, {} )
			end
		},
		OfflineError = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				OfflineNotice:completeAnimation()
				self.OfflineNotice:setAlpha( 1 )
				self.OfflineNotice:setText( Engine.Localize( "MENU_FEATURED_OFFLINE_ERROR" ) )
				self.clipFinished( OfflineNotice, {} )
			end
		},
		OfflineVoluntary = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				OfflineNotice:completeAnimation()
				self.OfflineNotice:setAlpha( 1 )
				self.OfflineNotice:setText( Engine.Localize( "MENU_FEATURED_OFFLINE_CARRY_WARNING" ) )
				self.clipFinished( OfflineNotice, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "OfflineNormal",
			condition = function ( menu, element, event )
				return ShouldShowOfflineNormalMessage( controller ) and not ShouldShowOfflineVoluntaryMessage( controller )
			end
		},
		{
			stateName = "OfflineError",
			condition = function ( menu, element, event )
				return ShouldShowOfflineNetworkErrorMessage( controller )
			end
		},
		{
			stateName = "OfflineVoluntary",
			condition = function ( menu, element, event )
				return ShouldShowOfflineVoluntaryMessage( controller ) and not ShouldShowOfflineNormalMessage( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

