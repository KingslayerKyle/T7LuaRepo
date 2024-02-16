-- cf84613ae20736da82d615ab050369e5
-- This hash is used for caching, delete to decompile the file again

CoD.Pregame_BanProtectIndicator_Background = InheritFrom( LUI.UIElement )
CoD.Pregame_BanProtectIndicator_Background.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Pregame_BanProtectIndicator_Background )
	self.id = "Pregame_BanProtectIndicator_Background"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 108 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0.18, 108 )
	background:setTopBottom( true, false, 0, 108 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
			end
		},
		Protected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				background:completeAnimation()
				self.background:setRGB( 0.66, 0.85, 0.16 )
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
			end
		},
		Banned = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				background:completeAnimation()
				self.background:setRGB( 1, 0.17, 0.23 )
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Protected",
			condition = function ( menu, element, event )
				return ItemIsProtected( menu, element, controller )
			end
		},
		{
			stateName = "Banned",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
