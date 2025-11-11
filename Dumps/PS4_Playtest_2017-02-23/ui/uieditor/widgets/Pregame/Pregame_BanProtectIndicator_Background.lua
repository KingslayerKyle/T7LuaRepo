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
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 0, 0, 162 )
	background:setTopBottom( 0, 0, 0, 162 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	self.resetProperties = function ()
		background:completeAnimation()
		background:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Protected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setRGB( 0.66, 0.85, 0.16 )
				self.clipFinished( background, {} )
			end
		},
		Banned = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setRGB( 1, 0.17, 0.23 )
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
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

