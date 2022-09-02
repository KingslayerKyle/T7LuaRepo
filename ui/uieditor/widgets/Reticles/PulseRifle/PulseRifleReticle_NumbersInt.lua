-- 85673f1f9972d5d9a208952cf67a2ee1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.PulseRifle.PulseRifleReticle_Numbers_Widget" )

CoD.PulseRifleReticle_NumbersInt = InheritFrom( LUI.UIElement )
CoD.PulseRifleReticle_NumbersInt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PulseRifleReticle_NumbersInt )
	self.id = "PulseRifleReticle_NumbersInt"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 156 )
	self:setTopBottom( true, false, 0, 144 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 156 )
	BG:setTopBottom( true, false, 0, 144 )
	BG:setAlpha( 0.9 )
	BG:setImage( RegisterImage( "uie_t7_mp_hud_pulse_rnd_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local PulseRifleReticleNumbersWidgetLeft = CoD.PulseRifleReticle_Numbers_Widget.new( menu, controller )
	PulseRifleReticleNumbersWidgetLeft:setLeftRight( true, false, -3.87, 92.13 )
	PulseRifleReticleNumbersWidgetLeft:setTopBottom( true, false, 0, 144 )
	PulseRifleReticleNumbersWidgetLeft:linkToElementModel( self, nil, false, function ( model )
		PulseRifleReticleNumbersWidgetLeft:setModel( model, controller )
	end )
	PulseRifleReticleNumbersWidgetLeft:mergeStateConditions( {
		{
			stateName = "One",
			condition = function ( menu, element, event )
				return IsClipAmmoTensDigitEqualTo( element, controller, 1 )
			end
		},
		{
			stateName = "Two",
			condition = function ( menu, element, event )
				return IsClipAmmoTensDigitEqualTo( element, controller, 2 )
			end
		},
		{
			stateName = "Three",
			condition = function ( menu, element, event )
				return IsClipAmmoTensDigitEqualTo( element, controller, 3 )
			end
		},
		{
			stateName = "Four",
			condition = function ( menu, element, event )
				return IsClipAmmoTensDigitEqualTo( element, controller, 4 )
			end
		},
		{
			stateName = "Five",
			condition = function ( menu, element, event )
				return IsClipAmmoTensDigitEqualTo( element, controller, 5 )
			end
		},
		{
			stateName = "Six",
			condition = function ( menu, element, event )
				return IsClipAmmoTensDigitEqualTo( element, controller, 6 )
			end
		},
		{
			stateName = "Seven",
			condition = function ( menu, element, event )
				return IsClipAmmoTensDigitEqualTo( element, controller, 7 )
			end
		},
		{
			stateName = "Eight",
			condition = function ( menu, element, event )
				return IsClipAmmoTensDigitEqualTo( element, controller, 8 )
			end
		},
		{
			stateName = "Nine",
			condition = function ( menu, element, event )
				return IsClipAmmoTensDigitEqualTo( element, controller, 9 )
			end
		},
		{
			stateName = "Zero",
			condition = function ( menu, element, event )
				return IsClipAmmoTensDigitEqualTo( element, controller, 0 )
			end
		}
	} )
	PulseRifleReticleNumbersWidgetLeft:linkToElementModel( PulseRifleReticleNumbersWidgetLeft, "ammoInClip", true, function ( model )
		menu:updateElementState( PulseRifleReticleNumbersWidgetLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammoInClip"
		} )
	end )
	self:addElement( PulseRifleReticleNumbersWidgetLeft )
	self.PulseRifleReticleNumbersWidgetLeft = PulseRifleReticleNumbersWidgetLeft
	
	local PulseRifleReticleNumbersWidgetRight = CoD.PulseRifleReticle_Numbers_Widget.new( menu, controller )
	PulseRifleReticleNumbersWidgetRight:setLeftRight( true, false, 62.13, 158.13 )
	PulseRifleReticleNumbersWidgetRight:setTopBottom( true, false, 0, 144 )
	PulseRifleReticleNumbersWidgetRight:linkToElementModel( self, nil, false, function ( model )
		PulseRifleReticleNumbersWidgetRight:setModel( model, controller )
	end )
	PulseRifleReticleNumbersWidgetRight:mergeStateConditions( {
		{
			stateName = "One",
			condition = function ( menu, element, event )
				return IsClipAmmoOnesDigitEqualTo( element, controller, 1 )
			end
		},
		{
			stateName = "Two",
			condition = function ( menu, element, event )
				return IsClipAmmoOnesDigitEqualTo( element, controller, 2 )
			end
		},
		{
			stateName = "Three",
			condition = function ( menu, element, event )
				return IsClipAmmoOnesDigitEqualTo( element, controller, 3 )
			end
		},
		{
			stateName = "Four",
			condition = function ( menu, element, event )
				return IsClipAmmoOnesDigitEqualTo( element, controller, 4 )
			end
		},
		{
			stateName = "Five",
			condition = function ( menu, element, event )
				return IsClipAmmoOnesDigitEqualTo( element, controller, 5 )
			end
		},
		{
			stateName = "Six",
			condition = function ( menu, element, event )
				return IsClipAmmoOnesDigitEqualTo( element, controller, 6 )
			end
		},
		{
			stateName = "Seven",
			condition = function ( menu, element, event )
				return IsClipAmmoOnesDigitEqualTo( element, controller, 7 )
			end
		},
		{
			stateName = "Eight",
			condition = function ( menu, element, event )
				return IsClipAmmoOnesDigitEqualTo( element, controller, 8 )
			end
		},
		{
			stateName = "Nine",
			condition = function ( menu, element, event )
				return IsClipAmmoOnesDigitEqualTo( element, controller, 9 )
			end
		},
		{
			stateName = "Zero",
			condition = function ( menu, element, event )
				return IsClipAmmoOnesDigitEqualTo( element, controller, 0 )
			end
		}
	} )
	PulseRifleReticleNumbersWidgetRight:linkToElementModel( PulseRifleReticleNumbersWidgetRight, "ammoInClip", true, function ( model )
		menu:updateElementState( PulseRifleReticleNumbersWidgetRight, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammoInClip"
		} )
	end )
	self:addElement( PulseRifleReticleNumbersWidgetRight )
	self.PulseRifleReticleNumbersWidgetRight = PulseRifleReticleNumbersWidgetRight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				BG:completeAnimation()
				self.BG:setAlpha( 0.9 )
				self.clipFinished( BG, {} )

				PulseRifleReticleNumbersWidgetLeft:completeAnimation()
				self.PulseRifleReticleNumbersWidgetLeft:setAlpha( 0 )
				self.clipFinished( PulseRifleReticleNumbersWidgetLeft, {} )

				PulseRifleReticleNumbersWidgetRight:completeAnimation()
				self.PulseRifleReticleNumbersWidgetRight:setAlpha( 1 )
				self.clipFinished( PulseRifleReticleNumbersWidgetRight, {} )
			end
		},
		Double = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				BG:completeAnimation()
				self.BG:setAlpha( 0.9 )
				self.clipFinished( BG, {} )

				PulseRifleReticleNumbersWidgetLeft:completeAnimation()
				self.PulseRifleReticleNumbersWidgetLeft:setAlpha( 1 )
				self.clipFinished( PulseRifleReticleNumbersWidgetLeft, {} )

				PulseRifleReticleNumbersWidgetRight:completeAnimation()
				self.PulseRifleReticleNumbersWidgetRight:setAlpha( 1 )
				self.clipFinished( PulseRifleReticleNumbersWidgetRight, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Double",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "ammoInClip", 10 )
			end
		}
	} )
	self:linkToElementModel( self, "ammoInClip", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ammoInClip"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PulseRifleReticleNumbersWidgetLeft:close()
		element.PulseRifleReticleNumbersWidgetRight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

