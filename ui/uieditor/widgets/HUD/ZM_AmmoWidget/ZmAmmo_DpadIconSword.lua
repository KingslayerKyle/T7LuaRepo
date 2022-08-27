-- 4f1b166b46cc00add172419eafd46ec4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark1Img" )

CoD.ZmAmmo_DpadIconSword = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_DpadIconSword.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_DpadIconSword )
	self.id = "ZmAmmo_DpadIconSword"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local DpadIconSword = LUI.UIImage.new()
	DpadIconSword:setLeftRight( true, false, 0, 38 )
	DpadIconSword:setTopBottom( true, false, 0, 38 )
	DpadIconSword:setAlpha( 0 )
	DpadIconSword:setZoom( 4 )
	DpadIconSword:setImage( RegisterImage( "uie_t7_zm_hud_ammo_dpadicnswrd_new" ) )
	self:addElement( DpadIconSword )
	self.DpadIconSword = DpadIconSword
	
	local ZmFxSpark1Img0 = CoD.ZmFx_Spark1Img.new( menu, controller )
	ZmFxSpark1Img0:setLeftRight( true, false, -33.94, 46.72 )
	ZmFxSpark1Img0:setTopBottom( true, false, -77.44, 40.56 )
	ZmFxSpark1Img0:setAlpha( 0 )
	ZmFxSpark1Img0:setYRot( 180 )
	ZmFxSpark1Img0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark1Img0.Image00:setShaderVector( 0, 10, 2, 0, 0 )
	ZmFxSpark1Img0.Image00:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( ZmFxSpark1Img0 )
	self.ZmFxSpark1Img0 = ZmFxSpark1Img0
	
	local DpadIconSwordReady = LUI.UIImage.new()
	DpadIconSwordReady:setLeftRight( true, false, -19, 51 )
	DpadIconSwordReady:setTopBottom( true, false, -17, 53 )
	DpadIconSwordReady:setAlpha( 0 )
	DpadIconSwordReady:setImage( RegisterImage( "uie_t7_zm_hud_ammo_dpadicnswrd_new_ready" ) )
	self:addElement( DpadIconSwordReady )
	self.DpadIconSwordReady = DpadIconSwordReady
	
	local DpadIconSwordReady0 = LUI.UIImage.new()
	DpadIconSwordReady0:setLeftRight( true, false, -19, 51 )
	DpadIconSwordReady0:setTopBottom( true, false, -17, 53 )
	DpadIconSwordReady0:setAlpha( 0 )
	DpadIconSwordReady0:setImage( RegisterImage( "uie_t7_zm_hud_ammo_dpadicnswrd_electric_ready" ) )
	self:addElement( DpadIconSwordReady0 )
	self.DpadIconSwordReady0 = DpadIconSwordReady0
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( false, false, -22.75, 19 )
	GlowOrangeOver:setTopBottom( false, false, -17, 19 )
	GlowOrangeOver:setRGB( 0, 0.8, 1 )
	GlowOrangeOver:setAlpha( 0 )
	GlowOrangeOver:setZRot( -54 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
						local DpadIconSwordReadyFrame4 = function ( DpadIconSwordReady, event )
							local DpadIconSwordReadyFrame5 = function ( DpadIconSwordReady, event )
								if not event.interrupted then
									DpadIconSwordReady:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
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
								DpadIconSwordReadyFrame5( DpadIconSwordReady, event )
								return 
							else
								DpadIconSwordReady:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
								DpadIconSwordReady:setAlpha( 1 )
								DpadIconSwordReady:registerEventHandler( "transition_complete_keyframe", DpadIconSwordReadyFrame5 )
							end
						end
						
						if event.interrupted then
							DpadIconSwordReadyFrame4( DpadIconSwordReady, event )
							return 
						else
							DpadIconSwordReady:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							DpadIconSwordReady:setAlpha( 0.28 )
							DpadIconSwordReady:registerEventHandler( "transition_complete_keyframe", DpadIconSwordReadyFrame4 )
						end
					end
					
					if event.interrupted then
						DpadIconSwordReadyFrame3( DpadIconSwordReady, event )
						return 
					else
						DpadIconSwordReady:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						DpadIconSwordReady:setAlpha( 1 )
						DpadIconSwordReady:registerEventHandler( "transition_complete_keyframe", DpadIconSwordReadyFrame3 )
					end
				end
				
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setRGB( 1, 1, 1 )
				self.DpadIconSwordReady:setAlpha( 0 )
				DpadIconSwordReadyFrame2( DpadIconSwordReady, {} )
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady0, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 599, true, false, CoD.TweenType.Bounce )
						end
						GlowOrangeOver:setRGB( 1, 0.54, 0 )
						GlowOrangeOver:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GlowOrangeOver, event )
						else
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
						GlowOrangeOver:setAlpha( 1 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setRGB( 1, 0.54, 0 )
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
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
				self:setupElementClipCounter( 3 )
				ZmFxSpark1Img0:completeAnimation()
				self.ZmFxSpark1Img0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark1Img0, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setRGB( 1, 0.46, 0 )
				self.DpadIconSwordReady:setAlpha( 1 )
				self.clipFinished( DpadIconSwordReady, {} )
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady0, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
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
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				DpadIconSword:completeAnimation()
				self.DpadIconSword:setAlpha( 1 )
				self.clipFinished( DpadIconSword, {} )
				DpadIconSwordReady:completeAnimation()
				self.DpadIconSwordReady:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady, {} )
				DpadIconSwordReady0:completeAnimation()
				self.DpadIconSwordReady0:setAlpha( 0 )
				self.clipFinished( DpadIconSwordReady0, {} )
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
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 420, true, false, CoD.TweenType.Bounce )
						end
						GlowOrangeOver:setRGB( 0, 0.8, 1 )
						GlowOrangeOver:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GlowOrangeOver, event )
						else
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 200, true, false, CoD.TweenType.Bounce )
						GlowOrangeOver:setAlpha( 0.57 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setRGB( 0, 0.8, 1 )
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
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
				self:setupElementClipCounter( 3 )
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
			end
		},
		ElectricInUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
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

