require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedOutHealth" )

CoD.bleedOutWidget = InheritFrom( LUI.UIElement )
CoD.bleedOutWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.bleedOutWidget )
	self.id = "bleedOutWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1 )
	self:setTopBottom( true, false, 0, 1 )
	self.anyChildUsesUpdateState = true
	
	local playerName = LUI.UITightText.new()
	playerName:setLeftRight( true, false, 108, 286.69 )
	playerName:setTopBottom( true, false, -46, 13.68 )
	playerName:setRGB( 1, 1, 1 )
	playerName:setTTF( "fonts/Entovo.ttf" )
	playerName:setLetterSpacing( 1 )
	playerName:linkToElementModel( self, "playerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playerName:setText( modelValue )
		end
	end )
	self:addElement( playerName )
	self.playerName = playerName
	
	local prompt = LUI.UITightText.new()
	prompt:setLeftRight( true, false, 109, 198 )
	prompt:setTopBottom( true, false, 8, 55.68 )
	prompt:setRGB( 1, 1, 1 )
	prompt:setTTF( "fonts/Entovo.ttf" )
	prompt:setLetterSpacing( 1 )
	prompt:linkToElementModel( self, "prompt", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			prompt:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( prompt )
	self.prompt = prompt
	
	local bleedOutHealth0 = CoD.bleedOutHealth.new( menu, controller )
	bleedOutHealth0:setLeftRight( true, true, -67, 66 )
	bleedOutHealth0:setTopBottom( true, true, -66.5, 65.5 )
	bleedOutHealth0:setRGB( 1, 1, 1 )
	bleedOutHealth0:linkToElementModel( self, nil, false, function ( model )
		bleedOutHealth0:setModel( model, controller )
	end )
	self:addElement( bleedOutHealth0 )
	self.bleedOutHealth0 = bleedOutHealth0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				playerName:completeAnimation()
				self.playerName:setAlpha( 0 )
				self.clipFinished( playerName, {} )
				prompt:completeAnimation()
				self.prompt:setAlpha( 0 )
				self.clipFinished( prompt, {} )
				bleedOutHealth0:completeAnimation()
				self.bleedOutHealth0:setAlpha( 0 )
				self.clipFinished( bleedOutHealth0, {} )
			end
		},
		BleedingOut = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				playerName:completeAnimation()
				self.playerName:setAlpha( 1 )
				self.clipFinished( playerName, {} )
				prompt:completeAnimation()
				self.prompt:setAlpha( 1 )
				self.clipFinished( prompt, {} )
				bleedOutHealth0:completeAnimation()
				self.bleedOutHealth0:setAlpha( 1 )
				self.clipFinished( bleedOutHealth0, {} )
			end
		},
		BleedingOut_Low = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				playerName:completeAnimation()
				self.playerName:setAlpha( 1 )
				self.clipFinished( playerName, {} )
				prompt:completeAnimation()
				self.prompt:setAlpha( 1 )
				self.clipFinished( prompt, {} )
				bleedOutHealth0:completeAnimation()
				self.bleedOutHealth0:setAlpha( 1 )
				self.clipFinished( bleedOutHealth0, {} )
			end
		},
		Reviving = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				playerName:completeAnimation()
				self.playerName:setAlpha( 1 )
				self.clipFinished( playerName, {} )
				prompt:completeAnimation()
				self.prompt:setAlpha( 1 )
				self.clipFinished( prompt, {} )
				bleedOutHealth0:completeAnimation()
				self.bleedOutHealth0:setAlpha( 1 )
				self.clipFinished( bleedOutHealth0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BleedingOut",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "bleedingOut" ) and IsSelfModelValueGreaterThan( element, controller, "clockPercent", 0.3 )
			end
		},
		{
			stateName = "BleedingOut_Low",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "bleedingOut" )
			end
		},
		{
			stateName = "Reviving",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "beingRevived" )
			end
		}
	} )
	self:linkToElementModel( self, "bleedingOut", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bleedingOut"
		} )
	end )
	self:linkToElementModel( self, "clockPercent", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clockPercent"
		} )
	end )
	self:linkToElementModel( self, "beingRevived", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "beingRevived"
		} )
	end )
	self.close = function ( self )
		self.bleedOutHealth0:close()
		self.playerName:close()
		self.prompt:close()
		CoD.bleedOutWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

