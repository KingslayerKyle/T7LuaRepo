require( "ui.uieditor.widgets.HUD.BombTimer.BombTimerWidgetInternal" )

CoD.BombTimerWidget = InheritFrom( LUI.UIElement )
CoD.BombTimerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BombTimerWidget )
	self.id = "BombTimerWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local BombTimerWidgetInternal = CoD.BombTimerWidgetInternal.new( menu, controller )
	BombTimerWidgetInternal:setLeftRight( true, false, 0, 73 )
	BombTimerWidgetInternal:setTopBottom( true, false, 0, 24 )
	BombTimerWidgetInternal.BombTimer:setupBombTimer( 0, true )
	BombTimerWidgetInternal.AOrBText:setText( Engine.Localize( "C" ) )
	BombTimerWidgetInternal:mergeStateConditions( {
		{
			stateName = "Attacking",
			condition = function ( menu, element, event )
				return not IsModelValueTrue( controller, "SearchAndDestroy.defending" )
			end
		},
		{
			stateName = "Defending",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	BombTimerWidgetInternal:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "SearchAndDestroy.defending" ), function ( model )
		menu:updateElementState( BombTimerWidgetInternal, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "SearchAndDestroy.defending"
		} )
	end )
	self:addElement( BombTimerWidgetInternal )
	self.BombTimerWidgetInternal = BombTimerWidgetInternal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BombTimerWidgetInternal:completeAnimation()
				self.BombTimerWidgetInternal:setAlpha( 0 )
				self.clipFinished( BombTimerWidgetInternal, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BombTimerWidgetInternal:completeAnimation()
				self.BombTimerWidgetInternal:setAlpha( 1 )
				self.clipFinished( BombTimerWidgetInternal, {} )
			end
		},
		VisibleForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BombTimerWidgetInternal:completeAnimation()
				self.BombTimerWidgetInternal:setAlpha( 1 )
				self.clipFinished( BombTimerWidgetInternal, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
			end
		},
		{
			stateName = "VisibleForCodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and IsCodCasterProfileValueEqualTo( controller, "shoutcaster_objective_status", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BombTimerWidgetInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

