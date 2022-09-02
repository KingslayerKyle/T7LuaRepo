-- a206c967f1333e6c613157142abb3468
-- This hash is used for caching, delete to decompile the file again

CoD.Social_PlayersListButton_Joinable = InheritFrom( LUI.UIElement )
CoD.Social_PlayersListButton_Joinable.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Social_PlayersListButton_Joinable )
	self.id = "Social_PlayersListButton_Joinable"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 24 )
	
	local joinableIcon = LUI.UIImage.new()
	joinableIcon:setLeftRight( false, true, -16, 0 )
	joinableIcon:setTopBottom( false, false, -12, 12 )
	joinableIcon:setRGB( 0.87, 0.9, 0.9 )
	joinableIcon:setImage( RegisterImage( "uie_t7_menu_frontend_iconjoinable" ) )
	joinableIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( joinableIcon )
	self.joinableIcon = joinableIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				joinableIcon:completeAnimation()
				self.joinableIcon:setAlpha( 0 )
				self.clipFinished( joinableIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )

			end,
			Focusx = function ()
				self:setupElementClipCounter( 0 )

			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Joinable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				joinableIcon:completeAnimation()
				self.joinableIcon:setAlpha( 1 )
				self.clipFinished( joinableIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Joinable",
			condition = function ( menu, element, event )
				return IsJoinable( self, controller )
			end
		}
	} )
	self:linkToElementModel( self, "joinable", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "joinable"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyLockedIn"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

