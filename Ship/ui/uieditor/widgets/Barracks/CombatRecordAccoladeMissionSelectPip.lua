-- 89ad03de1d41daca9659a02b291b9e4a
-- This hash is used for caching, delete to decompile the file again

CoD.CombatRecordAccoladeMissionSelectPip = InheritFrom( LUI.UIElement )
CoD.CombatRecordAccoladeMissionSelectPip.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordAccoladeMissionSelectPip )
	self.id = "CombatRecordAccoladeMissionSelectPip"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 8 )
	
	local pip = LUI.UIImage.new()
	pip:setLeftRight( true, false, 1, 7 )
	pip:setTopBottom( true, false, 3, 5 )
	pip:setRGB( 0.53, 0.53, 0.53 )
	pip:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pip )
	self.pip = pip
	
	local pipGlow = LUI.UIImage.new()
	pipGlow:setLeftRight( true, false, 2, 6 )
	pipGlow:setTopBottom( true, false, -1, 9 )
	pipGlow:setRGB( 0.25, 0.25, 0.25 )
	pipGlow:setAlpha( 0.6 )
	pipGlow:setZRot( 90 )
	pipGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	pipGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pipGlow )
	self.pipGlow = pipGlow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				pip:completeAnimation()
				self.pip:setRGB( 0.53, 0.53, 0.53 )
				self.pip:setAlpha( 0.5 )
				self.clipFinished( pip, {} )

				pipGlow:completeAnimation()
				self.pipGlow:setLeftRight( true, false, 2, 6 )
				self.pipGlow:setTopBottom( true, false, -1, 9 )
				self.pipGlow:setRGB( 0.25, 0.25, 0.25 )
				self.pipGlow:setAlpha( 0.6 )
				self.clipFinished( pipGlow, {} )
			end
		},
		Selected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				pip:completeAnimation()
				self.pip:setRGB( 1, 0.72, 0.36 )
				self.pip:setAlpha( 0.7 )
				self.clipFinished( pip, {} )

				pipGlow:completeAnimation()
				self.pipGlow:setLeftRight( true, false, 2, 6 )
				self.pipGlow:setTopBottom( true, false, -1, 9 )
				self.pipGlow:setRGB( 1, 0.3, 0 )
				self.pipGlow:setAlpha( 1 )
				self.pipGlow:setScale( 1.2 )
				self.clipFinished( pipGlow, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return IsControllerModelValueEqualToSelfModelValue( element, controller, "CombatRecordAccolades.unique_id", "unique_id" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordAccolades.unique_id" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordAccolades.unique_id"
		} )
	end )
	self:linkToElementModel( self, "unique_id", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unique_id"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
