CoD.PositionDraft_ClientNameText = InheritFrom( LUI.UIElement )
CoD.PositionDraft_ClientNameText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PositionDraft_ClientNameText )
	self.id = "PositionDraft_ClientNameText"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 200 )
	self:setTopBottom( 0, 0, 0, 34 )
	
	local ClientName = LUI.UIText.new()
	ClientName:setLeftRight( 0, 1, 0, 0 )
	ClientName:setTopBottom( 0, 1, 0, 0 )
	ClientName:setTTF( "fonts/default.ttf" )
	ClientName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ClientName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ClientName:linkToElementModel( self, "playerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ClientName:setText( modelValue )
		end
	end )
	self:addElement( ClientName )
	self.ClientName = ClientName
	
	self.resetProperties = function ()
		ClientName:completeAnimation()
		ClientName:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		IsMe = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ClientName:completeAnimation()
				self.ClientName:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
				self.clipFinished( ClientName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsMe",
			condition = function ( menu, element, event )
				return IsScoreboardPlayerSelf( self, controller )
			end
		}
	} )
	self:linkToElementModel( self, "clientNum", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clientNum"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "deadSpectator.playerIndex"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ClientName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

