-- da29b352b58f8ad9eca69b8381244efe
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Revive.ZM_ReviveWidget" )
require( "ui.uieditor.widgets.HUD.ZM_Revive.ZM_ReviveClampedArrow" )

CoD.ZM_Revive = InheritFrom( LUI.UIElement )
CoD.ZM_Revive.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZM_Revive )
	self.id = "ZM_Revive"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1 )
	self:setTopBottom( true, false, 0, 1 )
	self.anyChildUsesUpdateState = true
	
	local playerName = LUI.UITightText.new()
	playerName:setLeftRight( true, false, 89, 267.69 )
	playerName:setTopBottom( true, false, -44, 6 )
	playerName:setRGB( 1, 0.75, 0.44 )
	playerName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
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
	prompt:setLeftRight( true, false, 89, 178 )
	prompt:setTopBottom( true, false, 3, 43 )
	prompt:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	prompt:setLetterSpacing( 1 )
	prompt:linkToElementModel( self, "prompt", true, function ( model )
		local _prompt = Engine.GetModelValue( model )
		if _prompt then
			prompt:setText( Engine.Localize( _prompt ) )
		end
	end )
	self:addElement( prompt )
	self.prompt = prompt
	
	local ZMReviveWidget = CoD.ZM_ReviveWidget.new( menu, controller )
	ZMReviveWidget:setLeftRight( true, false, -109.5, 110.5 )
	ZMReviveWidget:setTopBottom( true, false, -110, 110 )
	ZMReviveWidget:linkToElementModel( self, nil, false, function ( model )
		ZMReviveWidget:setModel( model, controller )
	end )
	self:addElement( ZMReviveWidget )
	self.ZMReviveWidget = ZMReviveWidget
	
	local ZMReviveClampedArrow = CoD.ZM_ReviveClampedArrow.new( menu, controller )
	ZMReviveClampedArrow:setLeftRight( false, false, -118.37, 141.63 )
	ZMReviveClampedArrow:setTopBottom( false, false, -32, 32 )
	ZMReviveClampedArrow:linkToElementModel( self, "arrowAngle", true, function ( model )
		local arrowAngle = Engine.GetModelValue( model )
		if arrowAngle then
			ZMReviveClampedArrow:setZRot( arrowAngle )
		end
	end )
	self:addElement( ZMReviveClampedArrow )
	self.ZMReviveClampedArrow = ZMReviveClampedArrow
	
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

				ZMReviveClampedArrow:completeAnimation()
				self.ZMReviveClampedArrow:setAlpha( 0 )
				self.clipFinished( ZMReviveClampedArrow, {} )
			end
		},
		Clamped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				playerName:completeAnimation()
				self.playerName:setAlpha( 0 )
				self.clipFinished( playerName, {} )

				prompt:completeAnimation()
				self.prompt:setAlpha( 0 )
				self.clipFinished( prompt, {} )

				ZMReviveClampedArrow:completeAnimation()
				self.ZMReviveClampedArrow:setAlpha( 1 )
				self.clipFinished( ZMReviveClampedArrow, {} )
			end
		},
		Visible_Reviving = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				playerName:completeAnimation()
				self.playerName:setAlpha( 0 )
				self.clipFinished( playerName, {} )

				prompt:completeAnimation()
				self.prompt:setAlpha( 0 )
				self.clipFinished( prompt, {} )

				ZMReviveClampedArrow:completeAnimation()
				self.ZMReviveClampedArrow:setAlpha( 0 )
				self.clipFinished( ZMReviveClampedArrow, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				playerName:completeAnimation()
				self.playerName:setAlpha( 1 )
				self.clipFinished( playerName, {} )

				prompt:completeAnimation()
				self.prompt:setAlpha( 1 )
				self.clipFinished( prompt, {} )

				ZMReviveClampedArrow:completeAnimation()
				self.ZMReviveClampedArrow:setAlpha( 0 )
				self.clipFinished( ZMReviveClampedArrow, {} )
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
		element.ZMReviveWidget:close()
		element.ZMReviveClampedArrow:close()
		element.playerName:close()
		element.prompt:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

