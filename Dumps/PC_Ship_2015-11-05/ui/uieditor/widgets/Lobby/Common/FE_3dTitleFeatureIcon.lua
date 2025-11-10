local PreLoadFunc = function ( self, controller )
	self.setImage = function ( f2_arg0, f2_arg1 )
		f2_arg0.FeatureIcon:setImage( f2_arg1 )
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
	self:setLeftRight( true, false, 0, 35 )
	self:setTopBottom( true, false, 0, 37 )
	
	local FeatureIcon = LUI.UIImage.new()
	FeatureIcon:setLeftRight( true, true, 0, 0 )
	FeatureIcon:setTopBottom( true, true, 0, 0 )
	FeatureIcon:setAlpha( 0 )
	self:addElement( FeatureIcon )
	self.FeatureIcon = FeatureIcon
	
	local GameModeIcon = LUI.UIImage.new()
	GameModeIcon:setLeftRight( true, true, 0, 0 )
	GameModeIcon:setTopBottom( true, true, 0, 0 )
	GameModeIcon:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local gameTypeIcon = Engine.GetModelValue( model )
		if gameTypeIcon then
			GameModeIcon:setImage( RegisterImage( gameTypeIcon ) )
		end
	end )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )
				FeatureIcon:completeAnimation()
				self.FeatureIcon:setAlpha( 0 )
				self.clipFinished( FeatureIcon, {} )
				GameModeIcon:completeAnimation()
				self.GameModeIcon:setAlpha( 1 )
				self.clipFinished( GameModeIcon, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameModeIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

