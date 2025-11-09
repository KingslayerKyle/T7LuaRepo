require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark1Img" )

CoD.ZmAmmo_DpadIconPistolFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_DpadIconPistolFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_DpadIconPistolFactory )
	self.id = "ZmAmmo_DpadIconPistolFactory"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local DpadIconSword = LUI.UIImage.new()
	DpadIconSword:setLeftRight( true, false, -16.75, 48.25 )
	DpadIconSword:setTopBottom( true, false, -15.75, 49.25 )
	DpadIconSword:setAlpha( 0 )
	DpadIconSword:setZoom( 4 )
	DpadIconSword:setImage( RegisterImage( MapOverrideString( "zm_genesis", "t7_hud_zm_hud_ammo_icon_spike", MapOverrideString( "zm_stalingrad", "uie_t7_zm_dragon_gauntlet_ammo_icon_gun", MapOverrideString( "zm_island", "t7_hud_zm_hud_ammo_icon_skull_weapon", MapOverrideString( "zm_castle", "t7_hud_zm_hud_ammo_icon_spike", "uie_t7_zm_derriese_hud_ammo_icon_gun" ) ) ) ) ) )
	self:addElement( DpadIconSword )
	self.DpadIconSword = DpadIconSword
	
	local ZmFxSpark1Img0 = CoD.ZmFx_Spark1Img.new( menu, controller )
	ZmFxSpark1Img0:setLeftRight( true, false, -33.94, 46.72 )
	ZmFxSpark1Img0:setTopBottom( true, false, -77.44, 40.56 )
	ZmFxSpark1Img0:setRGB( 0, 0.89, 1 )
	ZmFxSpark1Img0:setAlpha( 0 )
	ZmFxSpark1Img0:setYRot( 180 )
	ZmFxSpark1Img0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark1Img0.Image00:setShaderVector( 0, 10, 2, 0, 0 )
	ZmFxSpark1Img0.Image00:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( ZmFxSpark1Img0 )
	self.ZmFxSpark1Img0 = ZmFxSpark1Img0
	
	local DpadIconSwordReady = LUI.UIImage.new()
	DpadIconSwordReady:setLeftRight( true, false, -16, 47.5 )
	DpadIconSwordReady:setTopBottom( true, false, -14.5, 48 )
	DpadIconSwordReady:setImage( RegisterImage( MapOverrideString( "zm_genesis", "t7_hud_zm_hud_ammo_icon_spike_ready", MapOverrideString( "zm_stalingrad", "uie_t7_zm_dragon_gauntlet_ammo_icon_gun_ready", MapOverrideString( "zm_island", "t7_hud_zm_hud_ammo_icon_skull_weapon_ready", MapOverrideString( "zm_castle", "t7_hud_zm_hud_ammo_icon_spike_ready", "uie_t7_zm_derriese_hud_ammo_icon_gun_ready" ) ) ) ) ) )
	self:addElement( DpadIconSwordReady )
	self.DpadIconSwordReady = DpadIconSwordReady
	
	local DpadIconSwordReady0 = LUI.UIImage.new()
	DpadIconSwordReady0:setLeftRight( true, false, -15.63, 46.72 )
	DpadIconSwordReady0:setTopBottom( true, false, -14.35, 48 )
	DpadIconSwordReady0:setAlpha( 0 )
	DpadIconSwordReady0:setImage( RegisterImage( MapOverrideString( "zm_genesis", "t7_hud_zm_hud_ammo_icon_spike_readyflash", MapOverrideString( "zm_stalingrad", "uie_t7_zm_dragon_gauntlet_ammo_icon_gun_readyflash", MapOverrideString( "zm_island", "t7_hud_zm_hud_ammo_icon_skull_weapon_readyflash", MapOverrideString( "zm_castle", "t7_hud_zm_hud_ammo_icon_spike_readyflash", "uie_t7_zm_derriese_hud_ammo_icon_gun_readyflash" ) ) ) ) ) )
	self:addElement( DpadIconSwordReady0 )
	self.DpadIconSwordReady0 = DpadIconSwordReady0
	
	local Lightning = LUI.UIImage.new()
	Lightning:setLeftRight( true, false, -67.86, 99.36 )
	Lightning:setTopBottom( true, false, -67.72, 73.72 )
	Lightning:setAlpha( 0 )
	Lightning:setImage( RegisterImage( "uie_t7_zm_derriese_hud_notification_anim" ) )
	Lightning:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Lightning:setShaderVector( 0, 28, 0, 0, 0 )
	Lightning:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( Lightning )
	self.Lightning = Lightning
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				DpadIconSword:completeAnimation()
				self.DpadIconSword:setAlpha( 0 )
				self.clipFinished( DpadIconSword, {} )
				ZmFxSpark1Img0:completeAnimation()
				self.ZmFxSpark1Img0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark1Img0, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady, {} )
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady0, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local ZmFxSpark1Img0Frame2 = function ( ZmFxSpark1Img0, event )
					local ZmFxSpark1Img0Frame3 = function ( ZmFxSpark1Img0, event )
						local ZmFxSpark1Img0Frame4 = function ( ZmFxSpark1Img0, event )
							if not event.interrupted then
								ZmFxSpark1Img0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark1Img0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark1Img0, event )
							else
								ZmFxSpark1Img0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark1Img0Frame4( ZmFxSpark1Img0, event )
							return 
						else
							ZmFxSpark1Img0:beginAnimation( "keyframe", 489, false, false, CoD.TweenType.Linear )
							ZmFxSpark1Img0:setAlpha( 0.8 )
							ZmFxSpark1Img0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark1Img0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark1Img0Frame3( ZmFxSpark1Img0, event )
						return 
					else
						ZmFxSpark1Img0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						ZmFxSpark1Img0:setAlpha( 1 )
						ZmFxSpark1Img0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark1Img0Frame3 )
					end
				end
				
				ZmFxSpark1Img0:completeAnimation()
				self.ZmFxSpark1Img0:setAlpha( 0.82 )
				ZmFxSpark1Img0Frame2( ZmFxSpark1Img0, {} )
				local DpadIconSwordReadyFrame2 = function ( DpadIconSwordReady, event )
					local DpadIconSwordReadyFrame3 = function ( DpadIconSwordReady, event )
						if not event.interrupted then
							DpadIconSwordReady:beginAnimation( "keyframe", 1080, false, false, CoD.TweenType.Linear )
						end
						DpadIconSwordReady:setRGB( 1, 1, 1 )
						DpadIconSwordReady:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( DpadIconSwordReady, event )
						else
							DpadIconSwordReady:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DpadIconSwordReadyFrame3( DpadIconSwordReady, event )
						return 
					else
						DpadIconSwordReady:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						DpadIconSwordReady:setAlpha( 1 )
						DpadIconSwordReady:registerEventHandler( "transition_complete_keyframe", DpadIconSwordReadyFrame3 )
					end
				end
				
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setRGB( 1, 1, 1 )
				self.DpadIconSwordReady:setAlpha( 0 )
				DpadIconSwordReadyFrame2( DpadIconSwordReady, {} )
				local DpadIconSwordReady0Frame2 = function ( DpadIconSwordReady0, event )
					local DpadIconSwordReady0Frame3 = function ( DpadIconSwordReady0, event )
						local DpadIconSwordReady0Frame4 = function ( DpadIconSwordReady0, event )
							local DpadIconSwordReady0Frame5 = function ( DpadIconSwordReady0, event )
								if not event.interrupted then
									DpadIconSwordReady0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
								end
								DpadIconSwordReady0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( DpadIconSwordReady0, event )
								else
									DpadIconSwordReady0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								DpadIconSwordReady0Frame5( DpadIconSwordReady0, event )
								return 
							else
								DpadIconSwordReady0:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
								DpadIconSwordReady0:setAlpha( 1 )
								DpadIconSwordReady0:registerEventHandler( "transition_complete_keyframe", DpadIconSwordReady0Frame5 )
							end
						end
						
						if event.interrupted then
							DpadIconSwordReady0Frame4( DpadIconSwordReady0, event )
							return 
						else
							DpadIconSwordReady0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							DpadIconSwordReady0:setAlpha( 0 )
							DpadIconSwordReady0:registerEventHandler( "transition_complete_keyframe", DpadIconSwordReady0Frame4 )
						end
					end
					
					if event.interrupted then
						DpadIconSwordReady0Frame3( DpadIconSwordReady0, event )
						return 
					else
						DpadIconSwordReady0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						DpadIconSwordReady0:setAlpha( 1 )
						DpadIconSwordReady0:registerEventHandler( "transition_complete_keyframe", DpadIconSwordReady0Frame3 )
					end
				end
				
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setAlpha( 0 )
				DpadIconSwordReady0Frame2( DpadIconSwordReady0, {} )
				local LightningFrame2 = function ( Lightning, event )
					local LightningFrame3 = function ( Lightning, event )
						local LightningFrame4 = function ( Lightning, event )
							if not event.interrupted then
								Lightning:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
							end
							Lightning:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Lightning, event )
							else
								Lightning:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LightningFrame4( Lightning, event )
							return 
						else
							Lightning:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
							Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame4 )
						end
					end
					
					if event.interrupted then
						LightningFrame3( Lightning, event )
						return 
					else
						Lightning:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						Lightning:setAlpha( 1 )
						Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame3 )
					end
				end
				
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				LightningFrame2( Lightning, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 2 )
				ZmFxSpark1Img0:completeAnimation()
				self.ZmFxSpark1Img0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark1Img0, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setAlpha( 1 )
				self.clipFinished( DpadIconSwordReady, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ZmFxSpark1Img0:completeAnimation()
				self.ZmFxSpark1Img0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark1Img0, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setRGB( 1, 1, 1 )
				self.DpadIconSwordReady:setAlpha( 0.3 )
				self.clipFinished( DpadIconSwordReady, {} )
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady0, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ZmFxSpark1Img0:completeAnimation()
				self.ZmFxSpark1Img0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark1Img0, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setRGB( 1, 1, 1 )
				self.DpadIconSwordReady:setAlpha( 1 )
				self.clipFinished( DpadIconSwordReady, {} )
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady0, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				DpadIconSword:completeAnimation()
				self.DpadIconSword:setAlpha( 1 )
				self.clipFinished( DpadIconSword, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady, {} )
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady0, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end
		},
		ElectricReady = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local ZmFxSpark1Img0Frame2 = function ( ZmFxSpark1Img0, event )
					local ZmFxSpark1Img0Frame3 = function ( ZmFxSpark1Img0, event )
						local ZmFxSpark1Img0Frame4 = function ( ZmFxSpark1Img0, event )
							if not event.interrupted then
								ZmFxSpark1Img0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark1Img0:setRGB( 0, 0.8, 1 )
							ZmFxSpark1Img0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark1Img0, event )
							else
								ZmFxSpark1Img0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark1Img0Frame4( ZmFxSpark1Img0, event )
							return 
						else
							ZmFxSpark1Img0:beginAnimation( "keyframe", 489, false, false, CoD.TweenType.Linear )
							ZmFxSpark1Img0:setAlpha( 0.8 )
							ZmFxSpark1Img0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark1Img0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark1Img0Frame3( ZmFxSpark1Img0, event )
						return 
					else
						ZmFxSpark1Img0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						ZmFxSpark1Img0:setAlpha( 1 )
						ZmFxSpark1Img0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark1Img0Frame3 )
					end
				end
				
				ZmFxSpark1Img0:completeAnimation()
				self.ZmFxSpark1Img0:setRGB( 0, 0.8, 1 )
				self.ZmFxSpark1Img0:setAlpha( 0.82 )
				ZmFxSpark1Img0Frame2( ZmFxSpark1Img0, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setRGB( 1, 1, 1 )
				self.DpadIconSwordReady:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady, {} )
				local DpadIconSwordReady0Frame2 = function ( DpadIconSwordReady0, event )
					local DpadIconSwordReady0Frame3 = function ( DpadIconSwordReady0, event )
						local DpadIconSwordReady0Frame4 = function ( DpadIconSwordReady0, event )
							if not event.interrupted then
								DpadIconSwordReady0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
							end
							DpadIconSwordReady0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( DpadIconSwordReady0, event )
							else
								DpadIconSwordReady0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							DpadIconSwordReady0Frame4( DpadIconSwordReady0, event )
							return 
						else
							DpadIconSwordReady0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							DpadIconSwordReady0:setAlpha( 0.28 )
							DpadIconSwordReady0:registerEventHandler( "transition_complete_keyframe", DpadIconSwordReady0Frame4 )
						end
					end
					
					if event.interrupted then
						DpadIconSwordReady0Frame3( DpadIconSwordReady0, event )
						return 
					else
						DpadIconSwordReady0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						DpadIconSwordReady0:setAlpha( 1 )
						DpadIconSwordReady0:registerEventHandler( "transition_complete_keyframe", DpadIconSwordReady0Frame3 )
					end
				end
				
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setAlpha( 0 )
				DpadIconSwordReady0Frame2( DpadIconSwordReady0, {} )
				local LightningFrame2 = function ( Lightning, event )
					local LightningFrame3 = function ( Lightning, event )
						local LightningFrame4 = function ( Lightning, event )
							if not event.interrupted then
								Lightning:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
							end
							Lightning:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Lightning, event )
							else
								Lightning:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LightningFrame4( Lightning, event )
							return 
						else
							Lightning:beginAnimation( "keyframe", 530, false, false, CoD.TweenType.Linear )
							Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame4 )
						end
					end
					
					if event.interrupted then
						LightningFrame3( Lightning, event )
						return 
					else
						Lightning:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Lightning:setAlpha( 1 )
						Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame3 )
					end
				end
				
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				LightningFrame2( Lightning, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 3 )
				ZmFxSpark1Img0:completeAnimation()
				self.ZmFxSpark1Img0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark1Img0, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady, {} )
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setAlpha( 1 )
				self.clipFinished( DpadIconSwordReady0, {} )
			end
		},
		ElectricCharge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ZmFxSpark1Img0:completeAnimation()
				self.ZmFxSpark1Img0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark1Img0, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setRGB( 1, 0.46, 0 )
				self.DpadIconSwordReady:setAlpha( 1 )
				self.clipFinished( DpadIconSwordReady, {} )
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setRGB( 0, 0.97, 1 )
				self.DpadIconSwordReady0:setAlpha( 1 )
				self.clipFinished( DpadIconSwordReady0, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end
		},
		ElectricInUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ZmFxSpark1Img0:completeAnimation()
				self.ZmFxSpark1Img0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark1Img0, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setRGB( 1, 1, 1 )
				self.DpadIconSwordReady:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady, {} )
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setRGB( 1, 1, 1 )
				self.DpadIconSwordReady0:setAlpha( 1 )
				self.clipFinished( DpadIconSwordReady0, {} )
				Lightning:completeAnimation()
				self.Lightning:setAlpha( 0 )
				self.clipFinished( Lightning, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmhud.swordState", 2 )
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmhud.swordState", 1 )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmhud.swordState", 3 )
			end
		},
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmhud.swordState", 4 )
			end
		},
		{
			stateName = "ElectricReady",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmhud.swordState", 6 )
			end
		},
		{
			stateName = "ElectricCharge",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmhud.swordState", 5 )
			end
		},
		{
			stateName = "ElectricInUse",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "zmhud.swordState", 7 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmhud.swordState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmhud.swordState"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark1Img0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

