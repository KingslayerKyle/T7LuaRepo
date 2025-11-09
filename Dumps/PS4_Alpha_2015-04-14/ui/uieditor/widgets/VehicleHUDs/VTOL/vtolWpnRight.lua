require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HelpButtonContainerRight" )

CoD.vtolWpnRight = InheritFrom( LUI.UIElement )
CoD.vtolWpnRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vtolWpnRight )
	self.id = "vtolWpnRight"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 226 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local nameBkg = LUI.UIImage.new()
	nameBkg:setLeftRight( false, false, -119, 201 )
	nameBkg:setTopBottom( false, true, -43, 53 )
	nameBkg:setRGB( 1, 1, 1 )
	nameBkg:setAlpha( 0 )
	nameBkg:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_weaponrightactive" ) )
	nameBkg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( nameBkg )
	self.nameBkg = nameBkg
	
	local wpnName = LUI.UITightText.new()
	wpnName:setLeftRight( false, false, -42.5, 42.5 )
	wpnName:setTopBottom( false, false, -11, 11 )
	wpnName:setRGB( 0.5, 0.5, 0.5 )
	wpnName:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_VTOL_MISSILES" ) )
	wpnName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( wpnName )
	self.wpnName = wpnName
	
	local offImg = LUI.UIImage.new()
	offImg:setLeftRight( true, false, -10, 310 )
	offImg:setTopBottom( true, false, -20, 76 )
	offImg:setRGB( 0.73, 0.29, 0.29 )
	offImg:setAlpha( 0.5 )
	offImg:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_weaponrightinactive" ) )
	offImg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( offImg )
	self.offImg = offImg
	
	local fireButton = CoD.VehicleGround_HelpButtonContainerRight.new( menu, controller )
	fireButton:setLeftRight( false, false, -109.5, 185.5 )
	fireButton:setTopBottom( false, true, -71.5, 37.5 )
	fireButton:setRGB( 1, 1, 1 )
	fireButton:setAlpha( 0 )
	fireButton:linkToElementModel( self, "bottomRightButton", false, function ( model )
		fireButton:setModel( model, controller )
	end )
	self:addElement( fireButton )
	self.fireButton = fireButton
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				nameBkg:completeAnimation()
				self.nameBkg:setAlpha( 0 )
				self.clipFinished( nameBkg, {} )
				offImg:completeAnimation()
				self.offImg:setAlpha( 0.5 )
				self.clipFinished( offImg, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local nameBkgFrame2 = function ( nameBkg, event )
					if not event.interrupted then
						nameBkg:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					nameBkg:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( nameBkg, event )
					else
						nameBkg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				nameBkg:completeAnimation()
				self.nameBkg:setAlpha( 0 )
				nameBkgFrame2( nameBkg, {} )
				local offImgFrame2 = function ( offImg, event )
					if not event.interrupted then
						offImg:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					offImg:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( offImg, event )
					else
						offImg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				offImg:completeAnimation()
				self.offImg:setAlpha( 0.5 )
				offImgFrame2( offImg, {} )
				local fireButtonFrame2 = function ( fireButton, event )
					if not event.interrupted then
						fireButton:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					fireButton:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( fireButton, event )
					else
						fireButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fireButton:completeAnimation()
				self.fireButton:setAlpha( 0 )
				fireButtonFrame2( fireButton, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local nameBkgFrame2 = function ( nameBkg, event )
					if not event.interrupted then
						nameBkg:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					nameBkg:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( nameBkg, event )
					else
						nameBkg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				nameBkg:completeAnimation()
				self.nameBkg:setAlpha( 1 )
				nameBkgFrame2( nameBkg, {} )
				local offImgFrame2 = function ( offImg, event )
					if not event.interrupted then
						offImg:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					offImg:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( offImg, event )
					else
						offImg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				offImg:completeAnimation()
				self.offImg:setAlpha( 0 )
				offImgFrame2( offImg, {} )
				local fireButtonFrame2 = function ( fireButton, event )
					if not event.interrupted then
						fireButton:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					fireButton:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( fireButton, event )
					else
						fireButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fireButton:completeAnimation()
				self.fireButton:setAlpha( 1 )
				fireButtonFrame2( fireButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "weaponIndex", 1 )
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "weaponIndex", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "weaponIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "weaponIndex"
		} )
	end )
	self.close = function ( self )
		self.fireButton:close()
		CoD.vtolWpnRight.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

