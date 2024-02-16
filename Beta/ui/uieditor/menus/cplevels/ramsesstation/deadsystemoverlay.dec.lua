local PostLoadFunc = function ( self, controller )
	self.HealthBarFill0:linkToElementModel( self, "healthbar1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.HealthBarFill0:setShaderVector( 2, modelValue, 0, 0, 0 )
		end
	end )
	self.HealthBarFill1:linkToElementModel( self, "healthbar2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.HealthBarFill1:setShaderVector( 2, modelValue, 0, 0, 0 )
		end
	end )
end

LUI.createMenu.DeadSystemOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DeadSystemOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DeadSystemOverlay.buttonPrompts" )
	local menu = self
	
	local syncError = LUI.UIText.new()
	syncError:setLeftRight( true, false, 1068.58, 1196.58 )
	syncError:setTopBottom( true, false, 54, 79 )
	syncError:setText( Engine.Localize( "SYNC ERROR" ) )
	syncError:setTTF( "fonts/default.ttf" )
	syncError:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	syncError:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( syncError )
	self.syncError = syncError
	
	local outoOffline = LUI.UIText.new()
	outoOffline:setLeftRight( true, false, 1047.58, 1196.58 )
	outoOffline:setTopBottom( true, false, 87, 112 )
	outoOffline:setText( Engine.Localize( "AUTO OFFLINE" ) )
	outoOffline:setTTF( "fonts/default.ttf" )
	outoOffline:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	outoOffline:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( outoOffline )
	self.outoOffline = outoOffline
	
	local ctrOffline = LUI.UIText.new()
	ctrOffline:setLeftRight( true, false, 1068.58, 1196.58 )
	ctrOffline:setTopBottom( true, false, 120, 145 )
	ctrOffline:setText( Engine.Localize( "CTR OFFLINE" ) )
	ctrOffline:setTTF( "fonts/default.ttf" )
	ctrOffline:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ctrOffline:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ctrOffline )
	self.ctrOffline = ctrOffline
	
	local direction = LUI.UIText.new()
	direction:setLeftRight( true, false, 1096.58, 1196.58 )
	direction:setTopBottom( true, false, 153, 178 )
	direction:setText( Engine.Localize( "850    N" ) )
	direction:setTTF( "fonts/default.ttf" )
	direction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	direction:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( direction )
	self.direction = direction
	
	local dmgl = LUI.UIText.new()
	dmgl:setLeftRight( true, false, 1096.58, 1196.58 )
	dmgl:setTopBottom( true, false, 186, 211 )
	dmgl:setText( Engine.Localize( "D MGL    T" ) )
	dmgl:setTTF( "fonts/default.ttf" )
	dmgl:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	dmgl:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( dmgl )
	self.dmgl = dmgl
	
	local overrideMode = LUI.UIText.new()
	overrideMode:setLeftRight( true, false, 80.56, 455 )
	overrideMode:setTopBottom( true, false, 54, 79 )
	overrideMode:setText( Engine.Localize( "OVERRIDE MODE" ) )
	overrideMode:setTTF( "fonts/default.ttf" )
	overrideMode:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	overrideMode:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( overrideMode )
	self.overrideMode = overrideMode
	
	local reticulecenter = LUI.UIImage.new()
	reticulecenter:setLeftRight( true, false, 576, 704 )
	reticulecenter:setTopBottom( true, false, 296, 424 )
	reticulecenter:setAlpha( 0.5 )
	reticulecenter:setImage( RegisterImage( "uie_img_t7_cp_hud_deadsys_reticlecenter" ) )
	self:addElement( reticulecenter )
	self.reticulecenter = reticulecenter
	
	local piplarge = LUI.UIImage.new()
	piplarge:setLeftRight( true, false, 28, 1252 )
	piplarge:setTopBottom( true, false, -2, 722 )
	piplarge:setAlpha( 0.5 )
	piplarge:setImage( RegisterImage( "uie_img_t7_cp_hud_deadsys_piplarge" ) )
	self:addElement( piplarge )
	self.piplarge = piplarge
	
	local wpnAngleText = LUI.UIText.new()
	wpnAngleText:setLeftRight( true, false, 507, 773 )
	wpnAngleText:setTopBottom( true, false, 611.5, 636.5 )
	wpnAngleText:setText( Engine.Localize( "WPN ANGLE TOO LOW" ) )
	wpnAngleText:setTTF( "fonts/default.ttf" )
	wpnAngleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	wpnAngleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( wpnAngleText )
	self.wpnAngleText = wpnAngleText
	
	local Toolow = LUI.UIImage.new()
	Toolow:setLeftRight( true, false, 563.5, 716.5 )
	Toolow:setTopBottom( true, false, 319, 401 )
	Toolow:setImage( RegisterImage( "uie_img_t7_cp_hud_deadsys_toolow" ) )
	self:addElement( Toolow )
	self.Toolow = Toolow
	
	local WeaponStatus = LUI.UITightText.new()
	WeaponStatus:setLeftRight( true, false, 246.78, 358.78 )
	WeaponStatus:setTopBottom( true, false, 132.5, 157.5 )
	WeaponStatus:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponStatus )
	self.WeaponStatus = WeaponStatus
	
	local HealthBar = LUI.UIImage.new()
	HealthBar:setLeftRight( true, false, 753, 793 )
	HealthBar:setTopBottom( true, false, 368, 460 )
	HealthBar:setImage( RegisterImage( "uie_img_t7_cp_hud_deadsys_meterframedouble" ) )
	self:addElement( HealthBar )
	self.HealthBar = HealthBar
	
	local HealthBarFill0 = LUI.UIImage.new()
	HealthBarFill0:setLeftRight( true, false, 759, 768 )
	HealthBarFill0:setTopBottom( true, false, 368, 449 )
	HealthBarFill0:setZRot( 180 )
	HealthBarFill0:setImage( RegisterImage( "uie_img_t7_cp_hud_deadsys_meterframefill" ) )
	HealthBarFill0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	HealthBarFill0:setShaderVector( 0, 1, 0, 0, 0 )
	HealthBarFill0:setShaderVector( 1, 0, 0, 0, 0 )
	HealthBarFill0:setShaderVector( 2, 1, 0, 0, 0 )
	HealthBarFill0:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( HealthBarFill0 )
	self.HealthBarFill0 = HealthBarFill0
	
	local HealthBarFill1 = LUI.UIImage.new()
	HealthBarFill1:setLeftRight( true, false, 773, 780 )
	HealthBarFill1:setTopBottom( true, false, 368, 449 )
	HealthBarFill1:setZRot( 180 )
	HealthBarFill1:setImage( RegisterImage( "uie_img_t7_cp_hud_deadsys_meterframefill" ) )
	HealthBarFill1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	HealthBarFill1:setShaderVector( 0, 1, 0, 0, 0 )
	HealthBarFill1:setShaderVector( 1, 0, 0, 0, 0 )
	HealthBarFill1:setShaderVector( 2, 1, 0, 0, 0 )
	HealthBarFill1:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( HealthBarFill1 )
	self.HealthBarFill1 = HealthBarFill1
	
	self.WeaponStatus:linkToElementModel( self, "weaponStatus", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponStatus:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				reticulecenter:completeAnimation()
				self.reticulecenter:setAlpha( 0 )
				self.clipFinished( reticulecenter, {} )
				piplarge:completeAnimation()
				self.piplarge:setAlpha( 0 )
				self.clipFinished( piplarge, {} )
				wpnAngleText:completeAnimation()
				self.wpnAngleText:setAlpha( 0 )
				self.clipFinished( wpnAngleText, {} )
				Toolow:completeAnimation()
				self.Toolow:setAlpha( 0 )
				self.clipFinished( Toolow, {} )
				HealthBar:completeAnimation()
				self.HealthBar:setAlpha( 0 )
				self.clipFinished( HealthBar, {} )
				HealthBarFill0:completeAnimation()
				self.HealthBarFill0:setAlpha( 0 )
				self.clipFinished( HealthBarFill0, {} )
				HealthBarFill1:completeAnimation()
				self.HealthBarFill1:setAlpha( 0 )
				self.clipFinished( HealthBarFill1, {} )
			end,
			wpnAngleTextShow = function ()
				self:setupElementClipCounter( 2 )
				local wpnAngleTextFrame2 = function ( wpnAngleText, event )
					local wpnAngleTextFrame3 = function ( wpnAngleText, event )
						if not event.interrupted then
							wpnAngleText:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						wpnAngleText:setRGB( 1, 1, 1 )
						wpnAngleText:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( wpnAngleText, event )
						else
							wpnAngleText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						wpnAngleTextFrame3( wpnAngleText, event )
						return 
					else
						wpnAngleText:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						wpnAngleText:setRGB( 1, 0, 0 )
						wpnAngleText:setAlpha( 1 )
						wpnAngleText:registerEventHandler( "transition_complete_keyframe", wpnAngleTextFrame3 )
					end
				end
				
				wpnAngleText:completeAnimation()
				self.wpnAngleText:setRGB( 1, 1, 1 )
				self.wpnAngleText:setAlpha( 0 )
				wpnAngleTextFrame2( wpnAngleText, {} )
				local ToolowFrame2 = function ( Toolow, event )
					local ToolowFrame3 = function ( Toolow, event )
						if not event.interrupted then
							Toolow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Toolow:setRGB( 1, 1, 1 )
						Toolow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Toolow, event )
						else
							Toolow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ToolowFrame3( Toolow, event )
						return 
					else
						Toolow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Toolow:setRGB( 1, 0, 0 )
						Toolow:setAlpha( 1 )
						Toolow:registerEventHandler( "transition_complete_keyframe", ToolowFrame3 )
					end
				end
				
				Toolow:completeAnimation()
				self.Toolow:setRGB( 1, 1, 1 )
				self.Toolow:setAlpha( 0 )
				ToolowFrame2( Toolow, {} )
			end,
			ADS_ON = function ()
				self:setupElementClipCounter( 2 )
				local reticulecenterFrame2 = function ( reticulecenter, event )
					if not event.interrupted then
						reticulecenter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					reticulecenter:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( reticulecenter, event )
					else
						reticulecenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				reticulecenter:completeAnimation()
				self.reticulecenter:setAlpha( 0 )
				reticulecenterFrame2( reticulecenter, {} )
				local piplargeFrame2 = function ( piplarge, event )
					if not event.interrupted then
						piplarge:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					piplarge:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( piplarge, event )
					else
						piplarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				piplarge:completeAnimation()
				self.piplarge:setAlpha( 0 )
				piplargeFrame2( piplarge, {} )
			end,
			ADS_OFF = function ()
				self:setupElementClipCounter( 2 )
				local reticulecenterFrame2 = function ( reticulecenter, event )
					if not event.interrupted then
						reticulecenter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					reticulecenter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( reticulecenter, event )
					else
						reticulecenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				reticulecenter:completeAnimation()
				self.reticulecenter:setAlpha( 0.5 )
				reticulecenterFrame2( reticulecenter, {} )
				local piplargeFrame2 = function ( piplarge, event )
					if not event.interrupted then
						piplarge:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					piplarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( piplarge, event )
					else
						piplarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				piplarge:completeAnimation()
				self.piplarge:setAlpha( 0.5 )
				piplargeFrame2( piplarge, {} )
			end,
			ReticuleRed = function ()
				self:setupElementClipCounter( 1 )
				reticulecenter:completeAnimation()
				self.reticulecenter:setRGB( 1, 0, 0 )
				self.clipFinished( reticulecenter, {} )
			end,
			ReticuleWhite = function ()
				self:setupElementClipCounter( 1 )
				reticulecenter:completeAnimation()
				self.reticulecenter:setRGB( 1, 1, 1 )
				self.clipFinished( reticulecenter, {} )
			end,
			ShowHealthBar = function ()
				self:setupElementClipCounter( 3 )
				local HealthBarFrame2 = function ( HealthBar, event )
					if not event.interrupted then
						HealthBar:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					HealthBar:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HealthBar, event )
					else
						HealthBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HealthBar:completeAnimation()
				self.HealthBar:setAlpha( 0 )
				HealthBarFrame2( HealthBar, {} )
				local HealthBarFill0Frame2 = function ( HealthBarFill0, event )
					if not event.interrupted then
						HealthBarFill0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					HealthBarFill0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HealthBarFill0, event )
					else
						HealthBarFill0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HealthBarFill0:completeAnimation()
				self.HealthBarFill0:setAlpha( 0 )
				HealthBarFill0Frame2( HealthBarFill0, {} )
				local HealthBarFill1Frame2 = function ( HealthBarFill1, event )
					if not event.interrupted then
						HealthBarFill1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					HealthBarFill1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HealthBarFill1, event )
					else
						HealthBarFill1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HealthBarFill1:completeAnimation()
				self.HealthBarFill1:setAlpha( 0 )
				HealthBarFill1Frame2( HealthBarFill1, {} )
			end,
			HideHealthBar = function ()
				self:setupElementClipCounter( 3 )
				local HealthBarFrame2 = function ( HealthBar, event )
					if not event.interrupted then
						HealthBar:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					HealthBar:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HealthBar, event )
					else
						HealthBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HealthBar:completeAnimation()
				self.HealthBar:setAlpha( 1 )
				HealthBarFrame2( HealthBar, {} )
				local HealthBarFill0Frame2 = function ( HealthBarFill0, event )
					if not event.interrupted then
						HealthBarFill0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					HealthBarFill0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HealthBarFill0, event )
					else
						HealthBarFill0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HealthBarFill0:completeAnimation()
				self.HealthBarFill0:setAlpha( 1 )
				HealthBarFill0Frame2( HealthBarFill0, {} )
				local HealthBarFill1Frame2 = function ( HealthBarFill1, event )
					if not event.interrupted then
						HealthBarFill1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					HealthBarFill1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HealthBarFill1, event )
					else
						HealthBarFill1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HealthBarFill1:completeAnimation()
				self.HealthBarFill1:setAlpha( 1 )
				HealthBarFill1Frame2( HealthBarFill1, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.WeaponStatus:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "DeadSystemOverlay.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

