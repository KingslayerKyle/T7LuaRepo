-- 5ef40ab3d25698f0190039771df089c7
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_TopHeader = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_TopHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_TopHeader )
	self.id = "AbilityWheel_TopHeader"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 270 )
	self:setTopBottom( true, false, 0, 57 )
	
	local TabImg = LUI.UIImage.new()
	TabImg:setLeftRight( false, false, -95.5, 96.5 )
	TabImg:setTopBottom( false, false, -9, 23 )
	TabImg:setAlpha( RandomAddPercent( -10, 0 ) )
	TabImg:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_tabc" ) )
	TabImg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TabImg )
	self.TabImg = TabImg
	
	local PanelGlow = LUI.UIImage.new()
	PanelGlow:setLeftRight( true, false, 0, 270.46 )
	PanelGlow:setTopBottom( true, false, 0, 39 )
	PanelGlow:setRGB( 0.96, 0.44, 0.02 )
	PanelGlow:setAlpha( 0 )
	PanelGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	PanelGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PanelGlow )
	self.PanelGlow = PanelGlow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local TabImgFrame2 = function ( TabImg, event )
					if not event.interrupted then
						TabImg:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					TabImg:setAlpha( RandomAddPercent( -10, 0.99 ) )
					if event.interrupted then
						self.clipFinished( TabImg, event )
					else
						TabImg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabImg:completeAnimation()
				self.TabImg:setAlpha( RandomAddPercent( -10, 0 ) )
				TabImgFrame2( TabImg, {} )
				PanelGlow:completeAnimation()
				self.PanelGlow:setRGB( 1, 0.44, 0.04 )
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Control = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TabImg:completeAnimation()
				self.TabImg:setRGB( 0.14, 0.44, 0.79 )
				self.TabImg:setAlpha( RandomAddPercent( -10, 1 ) )
				self.clipFinished( TabImg, {} )
				PanelGlow:completeAnimation()
				self.PanelGlow:setRGB( 0.14, 0.44, 0.79 )
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
			end
		},
		Chaos = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TabImg:completeAnimation()
				self.TabImg:setRGB( 0.96, 0.44, 0.02 )
				self.TabImg:setAlpha( RandomAddPercent( -10, 1 ) )
				self.clipFinished( TabImg, {} )
				PanelGlow:completeAnimation()
				self.PanelGlow:setRGB( 0.96, 0.44, 0.02 )
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
			end
		},
		Martial = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TabImg:completeAnimation()
				self.TabImg:setLeftRight( false, false, -95.5, 96.5 )
				self.TabImg:setTopBottom( false, false, -9, 23 )
				self.TabImg:setRGB( 0.22, 0.75, 0.16 )
				self.TabImg:setAlpha( RandomAddPercent( -10, 1 ) )
				self.clipFinished( TabImg, {} )
				PanelGlow:completeAnimation()
				self.PanelGlow:setRGB( 0.23, 0.75, 0.16 )
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Control",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cybercomRequestedType", 0 )
			end
		},
		{
			stateName = "Chaos",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cybercomRequestedType", 2 )
			end
		},
		{
			stateName = "Martial",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.cybercomRequestedType", 1 )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

