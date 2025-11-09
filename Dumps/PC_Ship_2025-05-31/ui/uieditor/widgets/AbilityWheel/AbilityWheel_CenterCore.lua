require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_CenterAberation" )

CoD.AbilityWheel_CenterCore = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_CenterCore.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_CenterCore )
	self.id = "AbilityWheel_CenterCore"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 415 )
	self:setTopBottom( true, false, 0, 422 )
	self.anyChildUsesUpdateState = true
	
	local PanelGlow0 = LUI.UIImage.new()
	PanelGlow0:setLeftRight( true, false, 0, 415.46 )
	PanelGlow0:setTopBottom( true, false, 0, 422 )
	PanelGlow0:setRGB( 0.97, 0.36, 0.07 )
	PanelGlow0:setAlpha( 0 )
	PanelGlow0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	PanelGlow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PanelGlow0 )
	self.PanelGlow0 = PanelGlow0
	
	local PanelGlow00 = LUI.UIImage.new()
	PanelGlow00:setLeftRight( true, false, 0, 415.46 )
	PanelGlow00:setTopBottom( true, false, 0, 422 )
	PanelGlow00:setRGB( 0.02, 0.44, 0.07 )
	PanelGlow00:setAlpha( 0 )
	PanelGlow00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	PanelGlow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PanelGlow00 )
	self.PanelGlow00 = PanelGlow00
	
	local AbilityWheelCenterAberation0 = CoD.AbilityWheel_CenterAberation.new( menu, controller )
	AbilityWheelCenterAberation0:setLeftRight( false, false, -153.17, 154.62 )
	AbilityWheelCenterAberation0:setTopBottom( false, false, -160, 160 )
	AbilityWheelCenterAberation0:setRGB( 0, 0, 0 )
	AbilityWheelCenterAberation0:setAlpha( 0 )
	self:addElement( AbilityWheelCenterAberation0 )
	self.AbilityWheelCenterAberation0 = AbilityWheelCenterAberation0
	
	local CenterSphere0 = LUI.UIImage.new()
	CenterSphere0:setLeftRight( false, false, -154.39, 154.39 )
	CenterSphere0:setTopBottom( false, false, -160, 160 )
	CenterSphere0:setRGB( 0.02, 0.36, 0.98 )
	CenterSphere0:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_sphere" ) )
	CenterSphere0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( CenterSphere0 )
	self.CenterSphere0 = CenterSphere0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Close = function ()
				self:setupElementClipCounter( 1 )
				local PanelGlow0Frame2 = function ( PanelGlow0, event )
					local PanelGlow0Frame3 = function ( PanelGlow0, event )
						if not event.interrupted then
							PanelGlow0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
						end
						PanelGlow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PanelGlow0, event )
						else
							PanelGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelGlow0Frame3( PanelGlow0, event )
						return 
					else
						PanelGlow0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						PanelGlow0:setAlpha( 0.75 )
						PanelGlow0:registerEventHandler( "transition_complete_keyframe", PanelGlow0Frame3 )
					end
				end
				
				PanelGlow0:completeAnimation()
				self.PanelGlow0:setAlpha( 0.34 )
				PanelGlow0Frame2( PanelGlow0, {} )
			end
		},
		ControlCore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				PanelGlow0:completeAnimation()
				self.PanelGlow0:setRGB( 0.16, 0.45, 0.55 )
				self.PanelGlow0:setAlpha( 1 )
				self.clipFinished( PanelGlow0, {} )
				PanelGlow00:completeAnimation()
				self.PanelGlow00:setRGB( 0.15, 0.25, 0.72 )
				self.PanelGlow00:setAlpha( 0 )
				self.clipFinished( PanelGlow00, {} )
				AbilityWheelCenterAberation0:completeAnimation()
				self.AbilityWheelCenterAberation0:setAlpha( 0 )
				self.AbilityWheelCenterAberation0:setScale( 0.8 )
				self.clipFinished( AbilityWheelCenterAberation0, {} )
				CenterSphere0:completeAnimation()
				self.CenterSphere0:setLeftRight( false, false, -154.17, 154.62 )
				self.CenterSphere0:setTopBottom( false, false, -160, 160 )
				self.CenterSphere0:setRGB( 0, 0, 0 )
				self.CenterSphere0:setAlpha( 0 )
				self.CenterSphere0:setScale( 0.9 )
				self.CenterSphere0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
				self.clipFinished( CenterSphere0, {} )
			end
		},
		MartialCore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				PanelGlow0:completeAnimation()
				self.PanelGlow0:setRGB( 0.31, 0.71, 0.19 )
				self.PanelGlow0:setAlpha( 1 )
				self.clipFinished( PanelGlow0, {} )
				PanelGlow00:completeAnimation()
				self.PanelGlow00:setRGB( 0.02, 0.44, 0.07 )
				self.PanelGlow00:setAlpha( 0 )
				self.clipFinished( PanelGlow00, {} )
				AbilityWheelCenterAberation0:completeAnimation()
				self.AbilityWheelCenterAberation0:setAlpha( 0 )
				self.AbilityWheelCenterAberation0:setScale( 1 )
				self.clipFinished( AbilityWheelCenterAberation0, {} )
				CenterSphere0:completeAnimation()
				self.CenterSphere0:setRGB( 0, 0, 0 )
				self.CenterSphere0:setAlpha( 0.5 )
				self.clipFinished( CenterSphere0, {} )
			end
		},
		ChaosCore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				PanelGlow0:completeAnimation()
				self.PanelGlow0:setRGB( 0.97, 0.36, 0.07 )
				self.PanelGlow0:setAlpha( 1 )
				self.clipFinished( PanelGlow0, {} )
				PanelGlow00:completeAnimation()
				self.PanelGlow00:setRGB( 0.96, 0.44, 0.02 )
				self.PanelGlow00:setAlpha( 0 )
				self.clipFinished( PanelGlow00, {} )
				AbilityWheelCenterAberation0:completeAnimation()
				self.AbilityWheelCenterAberation0:setLeftRight( false, false, -153.67, 154.12 )
				self.AbilityWheelCenterAberation0:setTopBottom( false, false, -160, 160 )
				self.AbilityWheelCenterAberation0:setAlpha( 0 )
				self.AbilityWheelCenterAberation0:setScale( 0.8 )
				self.clipFinished( AbilityWheelCenterAberation0, {} )
				CenterSphere0:completeAnimation()
				self.CenterSphere0:setLeftRight( false, false, -154.39, 154.39 )
				self.CenterSphere0:setTopBottom( false, false, -160, 160 )
				self.CenterSphere0:setAlpha( 0.5 )
				self.clipFinished( CenterSphere0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ControlCore",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cybercomRequestedType", 0 )
			end
		},
		{
			stateName = "MartialCore",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cybercomRequestedType", 1 )
			end
		},
		{
			stateName = "ChaosCore",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cybercomRequestedType", 2 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomRequestedType" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cybercomRequestedType"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelCenterAberation0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

