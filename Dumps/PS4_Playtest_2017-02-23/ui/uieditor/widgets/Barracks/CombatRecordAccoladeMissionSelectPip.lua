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
	self:setLeftRight( 0, 0, 0, 12 )
	self:setTopBottom( 0, 0, 0, 12 )
	
	local pip = LUI.UIImage.new()
	pip:setLeftRight( 0, 0, 1, 10 )
	pip:setTopBottom( 0, 0, 4, 7 )
	pip:setRGB( 0.53, 0.53, 0.53 )
	pip:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pip )
	self.pip = pip
	
	local pipGlow = LUI.UIImage.new()
	pipGlow:setLeftRight( 0, 0, 3, 9 )
	pipGlow:setTopBottom( 0, 0, -2, 13 )
	pipGlow:setRGB( 0.25, 0.25, 0.25 )
	pipGlow:setAlpha( 0.6 )
	pipGlow:setZRot( 90 )
	pipGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	pipGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pipGlow )
	self.pipGlow = pipGlow
	
	self.resetProperties = function ()
		pip:completeAnimation()
		pipGlow:completeAnimation()
		pip:setRGB( 0.53, 0.53, 0.53 )
		pip:setAlpha( 1 )
		pipGlow:setRGB( 0.25, 0.25, 0.25 )
		pipGlow:setAlpha( 0.6 )
		pipGlow:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				pip:completeAnimation()
				self.pip:setAlpha( 0.5 )
				self.clipFinished( pip, {} )
			end
		},
		Selected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				pip:completeAnimation()
				self.pip:setRGB( 1, 0.72, 0.36 )
				self.pip:setAlpha( 0.7 )
				self.clipFinished( pip, {} )
				pipGlow:completeAnimation()
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

