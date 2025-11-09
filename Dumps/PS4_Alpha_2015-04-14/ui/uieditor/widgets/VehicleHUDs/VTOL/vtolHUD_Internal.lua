require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HelpButtonContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HelpButtonContainerRight" )
require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolWpnRight" )
require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolWpnLeft" )
require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolCenterFrame" )

CoD.vtolHUD_Internal = InheritFrom( LUI.UIElement )
CoD.vtolHUD_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vtolHUD_Internal )
	self.id = "vtolHUD_Internal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local switchButton = CoD.VehicleGround_HelpButtonContainer.new( menu, controller )
	switchButton:setLeftRight( false, false, -43, 252 )
	switchButton:setTopBottom( false, true, -159, -50 )
	switchButton:setRGB( 1, 1, 1 )
	switchButton:linkToElementModel( self, "bottomLeftButton", false, function ( model )
		switchButton:setModel( model, controller )
	end )
	self:addElement( switchButton )
	self.switchButton = switchButton
	
	local landButton = CoD.VehicleGround_HelpButtonContainerRight.new( menu, controller )
	landButton:setLeftRight( false, false, 115, 410 )
	landButton:setTopBottom( false, true, -499, -390 )
	landButton:setRGB( 1, 1, 1 )
	landButton:linkToElementModel( self, "topRightButton", false, function ( model )
		landButton:setModel( model, controller )
	end )
	self:addElement( landButton )
	self.landButton = landButton
	
	local lockButton = CoD.VehicleGround_HelpButtonContainer.new( menu, controller )
	lockButton:setLeftRight( false, false, -410, -115 )
	lockButton:setTopBottom( false, true, -499, -390 )
	lockButton:setRGB( 1, 1, 1 )
	lockButton:linkToElementModel( self, "topLeftButton", false, function ( model )
		lockButton:setModel( model, controller )
	end )
	self:addElement( lockButton )
	self.lockButton = lockButton
	
	local rWeapon = CoD.vtolWpnRight.new( menu, controller )
	rWeapon:setLeftRight( false, false, 59, 285 )
	rWeapon:setTopBottom( false, true, -123.5, -101.5 )
	rWeapon:setRGB( 1, 1, 1 )
	rWeapon:linkToElementModel( self, nil, false, function ( model )
		rWeapon:setModel( model, controller )
	end )
	self:addElement( rWeapon )
	self.rWeapon = rWeapon
	
	local lWeapon = CoD.vtolWpnLeft.new( menu, controller )
	lWeapon:setLeftRight( false, false, -284.5, -58.5 )
	lWeapon:setTopBottom( false, true, -123.5, -101.5 )
	lWeapon:setRGB( 1, 1, 1 )
	lWeapon:linkToElementModel( self, nil, false, function ( model )
		lWeapon:setModel( model, controller )
	end )
	self:addElement( lWeapon )
	self.lWeapon = lWeapon
	
	local compassImg = LUI.UIImage.new()
	compassImg:setLeftRight( false, false, -267.6, 255 )
	compassImg:setTopBottom( false, true, -615, -548 )
	compassImg:setRGB( 1, 1, 1 )
	compassImg:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_compass" ) )
	compassImg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( compassImg )
	self.compassImg = compassImg
	
	local centerFrame = CoD.vtolCenterFrame.new( menu, controller )
	centerFrame:setLeftRight( false, false, -64, 64 )
	centerFrame:setTopBottom( false, true, -391, -263 )
	centerFrame:setRGB( 1, 1, 1 )
	centerFrame:linkToElementModel( self, nil, false, function ( model )
		centerFrame:setModel( model, controller )
	end )
	self:addElement( centerFrame )
	self.centerFrame = centerFrame
	
	local rollArrows = LUI.UIImage.new()
	rollArrows:setLeftRight( false, false, -249.73, 249.13 )
	rollArrows:setTopBottom( false, true, -528, -315 )
	rollArrows:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_rollarrows" ) )
	rollArrows:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rollArrows )
	self.rollArrows = rollArrows
	
	local horizon = LUI.UIImage.new()
	horizon:setLeftRight( false, false, -532.5, 532.5 )
	horizon:setTopBottom( false, true, -331.98, -316 )
	horizon:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_horizon" ) )
	horizon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( horizon )
	self.horizon = horizon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				switchButton:completeAnimation()
				self.switchButton:setAlpha( 1 )
				self.clipFinished( switchButton, {} )
				landButton:completeAnimation()
				self.landButton:setAlpha( 1 )
				self.clipFinished( landButton, {} )
				lockButton:completeAnimation()
				self.lockButton:setAlpha( 1 )
				self.clipFinished( lockButton, {} )
				rWeapon:completeAnimation()
				self.rWeapon:setAlpha( 1 )
				self.clipFinished( rWeapon, {} )
				lWeapon:completeAnimation()
				self.lWeapon:setAlpha( 1 )
				self.clipFinished( lWeapon, {} )
			end
		},
		InControl = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local switchButtonFrame2 = function ( switchButton, event )
					if not event.interrupted then
						switchButton:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					switchButton:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( switchButton, event )
					else
						switchButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				switchButton:completeAnimation()
				self.switchButton:setAlpha( 0 )
				switchButtonFrame2( switchButton, {} )
				local landButtonFrame2 = function ( landButton, event )
					if not event.interrupted then
						landButton:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					landButton:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( landButton, event )
					else
						landButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				landButton:completeAnimation()
				self.landButton:setAlpha( 0 )
				landButtonFrame2( landButton, {} )
				local lockButtonFrame2 = function ( lockButton, event )
					if not event.interrupted then
						lockButton:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					lockButton:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lockButton, event )
					else
						lockButton:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockButton:completeAnimation()
				self.lockButton:setAlpha( 0 )
				lockButtonFrame2( lockButton, {} )
				local rWeaponFrame2 = function ( rWeapon, event )
					if not event.interrupted then
						rWeapon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					rWeapon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( rWeapon, event )
					else
						rWeapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rWeapon:completeAnimation()
				self.rWeapon:setAlpha( 0 )
				rWeaponFrame2( rWeapon, {} )
				local lWeaponFrame2 = function ( lWeapon, event )
					if not event.interrupted then
						lWeapon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					lWeapon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lWeapon, event )
					else
						lWeapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lWeapon:completeAnimation()
				self.lWeapon:setAlpha( 0 )
				lWeaponFrame2( lWeapon, {} )
			end
		},
		AutoPilot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				switchButton:completeAnimation()
				self.switchButton:setAlpha( 0 )
				self.clipFinished( switchButton, {} )
				landButton:completeAnimation()
				self.landButton:setAlpha( 0 )
				self.clipFinished( landButton, {} )
				lockButton:completeAnimation()
				self.lockButton:setAlpha( 0 )
				self.clipFinished( lockButton, {} )
				rWeapon:completeAnimation()
				self.rWeapon:setAlpha( 0 )
				self.clipFinished( rWeapon, {} )
				lWeapon:completeAnimation()
				self.lWeapon:setAlpha( 0 )
				self.clipFinished( lWeapon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InControl",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "outOfRange" )
			end
		},
		{
			stateName = "AutoPilot",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "outOfRange" )
			end
		}
	} )
	self:linkToElementModel( self, "outOfRange", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "outOfRange"
		} )
	end )
	self.close = function ( self )
		self.switchButton:close()
		self.landButton:close()
		self.lockButton:close()
		self.rWeapon:close()
		self.lWeapon:close()
		self.centerFrame:close()
		CoD.vtolHUD_Internal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

