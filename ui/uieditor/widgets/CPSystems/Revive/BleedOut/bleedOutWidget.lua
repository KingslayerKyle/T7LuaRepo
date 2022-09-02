-- f8e3535972df29b97db41db274761158
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedOutHealth" )
require( "ui.uieditor.widgets.CPSystems.Revive.BleedOut.bleedOutClampedArrow" )

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
	playerName:setRGB( 0.58, 0.84, 0.87 )
	playerName:setTTF( "fonts/escom.ttf" )
	playerName:setLetterSpacing( 1 )
	playerName:linkToElementModel( self, "playerName", true, function ( model )
		local _playerName = Engine.GetModelValue( model )
		if _playerName then
			playerName:setText( _playerName )
		end
	end )
	self:addElement( playerName )
	self.playerName = playerName
	
	local prompt = LUI.UITightText.new()
	prompt:setLeftRight( true, false, 109, 198 )
	prompt:setTopBottom( true, false, 8, 55.68 )
	prompt:setTTF( "fonts/escom.ttf" )
	prompt:setLetterSpacing( 1 )
	prompt:linkToElementModel( self, "prompt", true, function ( model )
		local _prompt = Engine.GetModelValue( model )
		if _prompt then
			prompt:setText( Engine.Localize( _prompt ) )
		end
	end )
	self:addElement( prompt )
	self.prompt = prompt
	
	local bleedOutHealth0 = CoD.bleedOutHealth.new( menu, controller )
	bleedOutHealth0:setLeftRight( true, true, -70, 70 )
	bleedOutHealth0:setTopBottom( true, true, -70, 70 )
	bleedOutHealth0:linkToElementModel( self, nil, false, function ( model )
		bleedOutHealth0:setModel( model, controller )
	end )
	self:addElement( bleedOutHealth0 )
	self.bleedOutHealth0 = bleedOutHealth0
	
	local arrow = CoD.bleedOutClampedArrow.new( menu, controller )
	arrow:setLeftRight( false, false, -130, 130 )
	arrow:setTopBottom( false, false, -32, 32 )
	arrow:linkToElementModel( self, "arrowAngle", true, function ( model )
		local arrowAngle = Engine.GetModelValue( model )
		if arrowAngle then
			arrow:setZRot( arrowAngle )
		end
	end )
	self:addElement( arrow )
	self.arrow = arrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				playerName:completeAnimation()
				self.playerName:setAlpha( 0 )
				self.clipFinished( playerName, {} )

				prompt:completeAnimation()
				self.prompt:setAlpha( 0 )
				self.clipFinished( prompt, {} )

				bleedOutHealth0:completeAnimation()
				self.bleedOutHealth0:setAlpha( 0 )
				self.clipFinished( bleedOutHealth0, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
			end
		},
		Clamped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				playerName:completeAnimation()
				self.playerName:setAlpha( 0 )
				self.clipFinished( playerName, {} )

				prompt:completeAnimation()
				self.prompt:setAlpha( 0 )
				self.clipFinished( prompt, {} )

				bleedOutHealth0:completeAnimation()
				self.bleedOutHealth0:setAlpha( 1 )
				self.clipFinished( bleedOutHealth0, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.clipFinished( arrow, {} )
			end
		},
		Visible_Reviving = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				playerName:completeAnimation()
				self.playerName:setAlpha( 0 )
				self.clipFinished( playerName, {} )

				prompt:completeAnimation()
				self.prompt:setAlpha( 0 )
				self.clipFinished( prompt, {} )

				bleedOutHealth0:completeAnimation()
				self.bleedOutHealth0:setAlpha( 1 )
				self.clipFinished( bleedOutHealth0, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				playerName:completeAnimation()
				self.playerName:setAlpha( 1 )
				self.clipFinished( playerName, {} )

				prompt:completeAnimation()
				self.prompt:setAlpha( 1 )
				self.clipFinished( prompt, {} )

				bleedOutHealth0:completeAnimation()
				self.bleedOutHealth0:setAlpha( 1 )
				self.clipFinished( bleedOutHealth0, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Clamped",
			condition = function ( menu, element, event )
				return IsBleedOutVisible( element, controller ) and IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_CLAMPED )
			end
		},
		{
			stateName = "Visible_Reviving",
			condition = function ( menu, element, event )
				return IsBleedOutVisible( element, controller ) and IsSelfModelValueEnumBitSet( element, controller, "stateFlags", Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BEING_REVIVED )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsBleedOutVisible( element, controller )
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
	self:linkToElementModel( self, "beingRevived", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "beingRevived"
		} )
	end )
	self:linkToElementModel( self, "stateFlags", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "stateFlags"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.bleedOutHealth0:close()
		element.arrow:close()
		element.playerName:close()
		element.prompt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

