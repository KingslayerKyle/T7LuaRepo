require( "ui.uieditor.widgets.HUD.T4ReviveWidget.T4Revive" )
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
	
	self.ZMReviveWidget = CoD.T4Revive.new( menu, controller )
	self.ZMReviveWidget:setLeftRight( true, false, -109.5, 110.5 )
	self.ZMReviveWidget:setTopBottom( true, false, -110, 110 )
	self.ZMReviveWidget:linkToElementModel( self, nil, false, function ( model )
		self.ZMReviveWidget:setModel( model, controller )
	end )
	self:addElement( self.ZMReviveWidget )
	
	self.ZMReviveClampedArrow = CoD.ZM_ReviveClampedArrow.new( menu, controller )
	self.ZMReviveClampedArrow:setLeftRight( false, false, -118.37, 141.63 )
	self.ZMReviveClampedArrow:setTopBottom( false, false, -32, 32 )
	self.ZMReviveClampedArrow.arrow:setImage( RegisterImage( "uie_safe_area_arrow" ) )
	self.ZMReviveClampedArrow.arrow:setZRot( 180 )
	self.ZMReviveClampedArrow.arrow:setScale( 0.75 )
	self.ZMReviveClampedArrow:linkToElementModel( self, "arrowAngle", true, function ( model )
		local arrowAngle = Engine.GetModelValue( model )

		if arrowAngle then
			self.ZMReviveClampedArrow:setZRot( arrowAngle )
		end
	end )
	self:addElement( self.ZMReviveClampedArrow )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.ZMReviveClampedArrow:completeAnimation()
				self.ZMReviveClampedArrow:setAlpha( 0 )
				self.clipFinished( self.ZMReviveClampedArrow, {} )
			end
		},
		Clamped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.ZMReviveClampedArrow:completeAnimation()
				self.ZMReviveClampedArrow:setAlpha( 1 )
				self.clipFinished( self.ZMReviveClampedArrow, {} )
			end
		},
		Visible_Reviving = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.ZMReviveClampedArrow:completeAnimation()
				self.ZMReviveClampedArrow:setAlpha( 0 )
				self.clipFinished( self.ZMReviveClampedArrow, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.ZMReviveClampedArrow:completeAnimation()
				self.ZMReviveClampedArrow:setAlpha( 0 )
				self.clipFinished( self.ZMReviveClampedArrow, {} )
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
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
