CoD.PositionDraft_ClientLevelText = InheritFrom( LUI.UIElement )
CoD.PositionDraft_ClientLevelText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PositionDraft_ClientLevelText )
	self.id = "PositionDraft_ClientLevelText"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 30 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( 0, 0, 0, 30 )
	Bg:setTopBottom( 0, 0, 0, 30 )
	Bg:setRGB( 0.87, 0.86, 1 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local Level = LUI.UIText.new()
	Level:setLeftRight( 0, 0, -11, 41 )
	Level:setTopBottom( 0, 0, 0, 31 )
	Level:setRGB( 0, 0, 0 )
	Level:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Level:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Level:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Level:linkToElementModel( self, "lpLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Level:setText( Engine.Localize( GetClientLPLevel( controller, modelValue ) ) )
		end
	end )
	self:addElement( Level )
	self.Level = Level
	
	self.resetProperties = function ()
		Bg:completeAnimation()
		Bg:setRGB( 0.87, 0.86, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Bg:completeAnimation()
				self.Bg:setRGB( 0.17, 0.51, 0.77 )
				self.clipFinished( Bg, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Bg:completeAnimation()
				self.Bg:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
				self.clipFinished( Bg, {} )
			end
		},
		IsEnemy = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Bg:completeAnimation()
				self.Bg:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
				self.clipFinished( Bg, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsSelfClient( controller, self )
			end
		},
		{
			stateName = "IsEnemy",
			condition = function ( menu, element, event )
				return IsEnemyClient( controller, element )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Level:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

