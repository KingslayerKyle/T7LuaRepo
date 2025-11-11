local PreLoadFunc = function ( self, controller )
	self.setImage = function ( self, image )
		self.FeatureIcon:setImage( image )
	end
	
end

CoD.FE_3dTitleFeatureIcon = InheritFrom( LUI.UIElement )
CoD.FE_3dTitleFeatureIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_3dTitleFeatureIcon )
	self.id = "FE_3dTitleFeatureIcon"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 52 )
	self:setTopBottom( 0, 0, 0, 55 )
	
	local FeatureIcon = LUI.UIImage.new()
	FeatureIcon:setLeftRight( 0, 1, 0, 0 )
	FeatureIcon:setTopBottom( 0, 1, 0, 0 )
	FeatureIcon:setAlpha( 0 )
	self:addElement( FeatureIcon )
	self.FeatureIcon = FeatureIcon
	
	local GameModeIcon = LUI.UIImage.new()
	GameModeIcon:setLeftRight( 0, 1, 0, 0 )
	GameModeIcon:setTopBottom( 0, 1, 0, 0 )
	GameModeIcon:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameModeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	self.resetProperties = function ()
		GameModeIcon:completeAnimation()
		FeatureIcon:completeAnimation()
		GameModeIcon:setAlpha( 1 )
		FeatureIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FeatureIcon:completeAnimation()
				self.FeatureIcon:setAlpha( 1 )
				self.clipFinished( FeatureIcon, {} )
				GameModeIcon:completeAnimation()
				self.GameModeIcon:setAlpha( 0 )
				self.clipFinished( GameModeIcon, {} )
			end
		},
		GameModeIcon = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "GameModeIcon",
			condition = function ( menu, element, event )
				return PregameActive()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameModeIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

