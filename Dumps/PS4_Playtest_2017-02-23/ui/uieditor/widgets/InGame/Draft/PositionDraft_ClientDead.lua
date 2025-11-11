CoD.PositionDraft_ClientDead = InheritFrom( LUI.UIElement )
CoD.PositionDraft_ClientDead.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PositionDraft_ClientDead )
	self.id = "PositionDraft_ClientDead"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 200 )
	self:setTopBottom( 0, 0, 0, 161 )
	
	local DeathX = LUI.UIText.new()
	DeathX:setLeftRight( -0.5, 0.5, 100, 100 )
	DeathX:setTopBottom( 0, 1, 0, 0 )
	DeathX:setRGB( 0.55, 0.08, 0.08 )
	DeathX:setText( Engine.Localize( "X" ) )
	DeathX:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	DeathX:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DeathX:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DeathX )
	self.DeathX = DeathX
	
	self.resetProperties = function ()
		DeathX:completeAnimation()
		DeathX:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				DeathX:completeAnimation()
				self.DeathX:setAlpha( 0 )
				self.clipFinished( DeathX, {} )
			end
		},
		Dead = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Dead",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "dead", true )
			end
		}
	} )
	self:linkToElementModel( self, "dead", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "dead"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

