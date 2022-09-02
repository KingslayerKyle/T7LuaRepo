-- a260693666c5982fe223e630addc19ef
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.Infinite.lmgInfiniteReticle_AmmoBar" )
require( "ui.uieditor.widgets.Reticles.Infinite.lmgInfiniteReticle_Status" )
require( "ui.uieditor.widgets.Reticles.Infinite.lmgInfiniteReticle_Extras" )
require( "ui.uieditor.widgets.Reticles.Infinite.lmgInfiniteReticle_light" )

CoD.lmgInfiniteReticle_UI3D_Internal = InheritFrom( LUI.UIElement )
CoD.lmgInfiniteReticle_UI3D_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.lmgInfiniteReticle_UI3D_Internal )
	self.id = "lmgInfiniteReticle_UI3D_Internal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 92 )
	self.anyChildUsesUpdateState = true
	
	local Bg0 = LUI.UIImage.new()
	Bg0:setLeftRight( true, false, -10.01, 224.73 )
	Bg0:setTopBottom( true, false, -11.38, 106.42 )
	Bg0:setAlpha( 0.25 )
	Bg0:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_bg" ) )
	Bg0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bg0 )
	self.Bg0 = Bg0
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, false, -11.01, 222.73 )
	Bg:setTopBottom( true, false, -10.38, 107.42 )
	Bg:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_bg_add" ) )
	Bg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bg )
	self.Bg = Bg
	
	local AmmoBarTop = CoD.lmgInfiniteReticle_AmmoBar.new( menu, controller )
	AmmoBarTop:setLeftRight( true, false, 44.77, 169.77 )
	AmmoBarTop:setTopBottom( true, false, 29.52, 45.52 )
	AmmoBarTop:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )
		if ammoInClip then
			AmmoBarTop.ammoFull:setShaderVector( 0, ScaleVectorComponents( 2, 1, 1, 1, GetAmmoWipePercentageClipFull( controller, CoD.GetVectorComponentFromString( ammoInClip, 1 ), CoD.GetVectorComponentFromString( ammoInClip, 2 ), CoD.GetVectorComponentFromString( ammoInClip, 3 ), CoD.GetVectorComponentFromString( ammoInClip, 4 ) ) ) )
		end
	end )
	self:addElement( AmmoBarTop )
	self.AmmoBarTop = AmmoBarTop
	
	local AmmoBarBottom = CoD.lmgInfiniteReticle_AmmoBar.new( menu, controller )
	AmmoBarBottom:setLeftRight( true, false, 44.77, 169.77 )
	AmmoBarBottom:setTopBottom( true, false, 46.52, 61.52 )
	AmmoBarBottom:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )
		if ammoInClip then
			AmmoBarBottom.ammoFull:setShaderVector( 0, ScaleVectorComponents( 2, 1, 1, 1, AddToVector( -0.5, 0, 0, 0, GetAmmoWipePercentageClipFull( controller, CoD.GetVectorComponentFromString( ammoInClip, 1 ), CoD.GetVectorComponentFromString( ammoInClip, 2 ), CoD.GetVectorComponentFromString( ammoInClip, 3 ), CoD.GetVectorComponentFromString( ammoInClip, 4 ) ) ) ) )
		end
	end )
	self:addElement( AmmoBarBottom )
	self.AmmoBarBottom = AmmoBarBottom
	
	local Status = CoD.lmgInfiniteReticle_Status.new( menu, controller )
	Status:setLeftRight( true, false, 41, 176 )
	Status:setTopBottom( true, false, 6, 29 )
	Status.Status:setText( Engine.Localize( "MENU_STATUS_CAPS" ) )
	self:addElement( Status )
	self.Status = Status
	
	local lmgInfiniteReticleExtras = CoD.lmgInfiniteReticle_Extras.new( menu, controller )
	lmgInfiniteReticleExtras:setLeftRight( true, false, 45.41, 174 )
	lmgInfiniteReticleExtras:setTopBottom( true, false, 64.89, 82.58 )
	lmgInfiniteReticleExtras:setScale( 1.05 )
	self:addElement( lmgInfiniteReticleExtras )
	self.lmgInfiniteReticleExtras = lmgInfiniteReticleExtras
	
	local lightRight = LUI.UIImage.new()
	lightRight:setLeftRight( true, false, 161.18, 223.73 )
	lightRight:setTopBottom( true, false, 3, 89 )
	lightRight:setYRot( 180 )
	lightRight:setImage( RegisterImage( "uie_t7_weapon_lmg_lights_02" ) )
	lightRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lightRight )
	self.lightRight = lightRight
	
	local lightsLeft = LUI.UIImage.new()
	lightsLeft:setLeftRight( true, false, -11.01, 51.53 )
	lightsLeft:setTopBottom( true, false, 3, 89 )
	lightsLeft:setImage( RegisterImage( "uie_t7_weapon_lmg_lights_02" ) )
	lightsLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lightsLeft )
	self.lightsLeft = lightsLeft
	
	local lmgInfiniteReticlelightLeft = CoD.lmgInfiniteReticle_light.new( menu, controller )
	lmgInfiniteReticlelightLeft:setLeftRight( false, false, -118.01, -55.47 )
	lmgInfiniteReticlelightLeft:setTopBottom( false, false, -43, 43 )
	self:addElement( lmgInfiniteReticlelightLeft )
	self.lmgInfiniteReticlelightLeft = lmgInfiniteReticlelightLeft
	
	local lmgInfiniteReticlelightRight = CoD.lmgInfiniteReticle_light.new( menu, controller )
	lmgInfiniteReticlelightRight:setLeftRight( false, false, 54.18, 116.73 )
	lmgInfiniteReticlelightRight:setTopBottom( false, false, -43, 43 )
	lmgInfiniteReticlelightRight:setYRot( 180 )
	self:addElement( lmgInfiniteReticlelightRight )
	self.lmgInfiniteReticlelightRight = lmgInfiniteReticlelightRight
	
	local Bg10 = LUI.UIImage.new()
	Bg10:setLeftRight( true, false, -11.01, 222.73 )
	Bg10:setTopBottom( true, false, -10.38, 107.42 )
	Bg10:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_bg_add2" ) )
	Bg10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bg10 )
	self.Bg10 = Bg10
	
	local Bg100 = LUI.UIImage.new()
	Bg100:setLeftRight( true, false, -11.01, 222.73 )
	Bg100:setTopBottom( true, false, -10.38, 107.42 )
	Bg100:setImage( RegisterImage( "uie_t7_weapon_lmg_screen_bg_add2" ) )
	Bg100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bg100 )
	self.Bg100 = Bg100
	
	local lightsLeft0 = LUI.UIImage.new()
	lightsLeft0:setLeftRight( true, false, -11.01, 51.53 )
	lightsLeft0:setTopBottom( true, false, 3, 89 )
	lightsLeft0:setAlpha( 0 )
	lightsLeft0:setImage( RegisterImage( "uie_t7_weapon_lmg_lights_02" ) )
	lightsLeft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lightsLeft0 )
	self.lightsLeft0 = lightsLeft0
	
	local lightRight0 = LUI.UIImage.new()
	lightRight0:setLeftRight( true, false, 161.18, 223.73 )
	lightRight0:setTopBottom( true, false, 3, 89 )
	lightRight0:setAlpha( 0 )
	lightRight0:setYRot( 180 )
	lightRight0:setImage( RegisterImage( "uie_t7_weapon_lmg_lights_02" ) )
	lightRight0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lightRight0 )
	self.lightRight0 = lightRight0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				Bg0:completeAnimation()
				self.Bg0:setAlpha( 0.38 )
				self.clipFinished( Bg0, {} )

				Bg:completeAnimation()
				self.Bg:setAlpha( 1 )
				self.clipFinished( Bg, {} )

				AmmoBarTop:completeAnimation()
				self.AmmoBarTop:setAlpha( 1 )
				self.clipFinished( AmmoBarTop, {} )

				AmmoBarBottom:completeAnimation()
				self.AmmoBarBottom:setAlpha( 1 )
				self.clipFinished( AmmoBarBottom, {} )

				Status:completeAnimation()
				self.Status:setRGB( 1, 1, 1 )
				self.clipFinished( Status, {} )

				lmgInfiniteReticleExtras:completeAnimation()
				self.lmgInfiniteReticleExtras:setRGB( 1, 1, 1 )
				self.clipFinished( lmgInfiniteReticleExtras, {} )

				lightRight:completeAnimation()
				self.lightRight:setRGB( 1, 1, 1 )
				self.clipFinished( lightRight, {} )

				lightsLeft:completeAnimation()
				self.lightsLeft:setRGB( 1, 1, 1 )
				self.clipFinished( lightsLeft, {} )

				lmgInfiniteReticlelightLeft:completeAnimation()
				self.lmgInfiniteReticlelightLeft:setRGB( 1, 1, 1 )
				self.clipFinished( lmgInfiniteReticlelightLeft, {} )

				lmgInfiniteReticlelightRight:completeAnimation()
				self.lmgInfiniteReticlelightRight:setRGB( 1, 1, 1 )
				self.clipFinished( lmgInfiniteReticlelightRight, {} )

				Bg10:completeAnimation()
				self.Bg10:setRGB( 1, 1, 1 )
				self.clipFinished( Bg10, {} )

				Bg100:completeAnimation()
				self.Bg100:setAlpha( 1 )
				self.clipFinished( Bg100, {} )

				lightsLeft0:completeAnimation()
				self.lightsLeft0:setAlpha( 0 )
				self.clipFinished( lightsLeft0, {} )

				lightRight0:completeAnimation()
				self.lightRight0:setAlpha( 0 )
				self.clipFinished( lightRight0, {} )
			end
		},
		LowAmmoPrinting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				Bg0:completeAnimation()
				self.Bg0:setRGB( 1, 1, 1 )
				self.Bg0:setAlpha( 0.25 )
				self.clipFinished( Bg0, {} )

				Bg:completeAnimation()
				self.Bg:setRGB( 1, 1, 1 )
				self.Bg:setAlpha( 1 )
				self.clipFinished( Bg, {} )

				AmmoBarTop:completeAnimation()

				AmmoBarTop.ammoFull:completeAnimation()
				self.AmmoBarTop:setRGB( 1, 1, 1 )
				self.AmmoBarTop:setAlpha( 1 )
				self.AmmoBarTop.ammoFull:setRGB( 1, 0, 0 )
				self.clipFinished( AmmoBarTop, {} )

				AmmoBarBottom:completeAnimation()

				AmmoBarBottom.ammoFull:completeAnimation()
				self.AmmoBarBottom:setRGB( 1, 1, 1 )
				self.AmmoBarBottom:setAlpha( 1 )
				self.AmmoBarBottom.ammoFull:setRGB( 1, 0, 0 )
				self.clipFinished( AmmoBarBottom, {} )

				Status:completeAnimation()

				Status.FrameTop:completeAnimation()

				Status.FrameBottom:completeAnimation()

				Status.Status:completeAnimation()
				self.Status:setRGB( 1, 1, 1 )
				self.Status.FrameTop:setRGB( 1, 1, 1 )
				self.Status.FrameBottom:setRGB( 1, 1, 1 )
				self.Status.Status:setText( Engine.Localize( "MPUI_LMG_PRINTING_CAPS" ) )
				self.clipFinished( Status, {} )

				lmgInfiniteReticleExtras:completeAnimation()
				self.lmgInfiniteReticleExtras:setRGB( 1, 1, 1 )
				self.clipFinished( lmgInfiniteReticleExtras, {} )

				lightRight:completeAnimation()
				self.lightRight:setRGB( 1, 1, 1 )
				self.clipFinished( lightRight, {} )

				lightsLeft:completeAnimation()
				self.lightsLeft:setRGB( 1, 1, 1 )
				self.lightsLeft:setAlpha( 1 )
				self.clipFinished( lightsLeft, {} )

				lmgInfiniteReticlelightLeft:completeAnimation()
				self.lmgInfiniteReticlelightLeft:setRGB( 1, 1, 1 )
				self.lmgInfiniteReticlelightLeft:setAlpha( 1 )
				self.clipFinished( lmgInfiniteReticlelightLeft, {} )

				lmgInfiniteReticlelightRight:completeAnimation()
				self.lmgInfiniteReticlelightRight:setRGB( 1, 1, 1 )
				self.lmgInfiniteReticlelightRight:setAlpha( 1 )
				self.clipFinished( lmgInfiniteReticlelightRight, {} )

				Bg10:completeAnimation()
				self.Bg10:setRGB( 1, 1, 1 )
				self.Bg10:setAlpha( 1 )
				self.clipFinished( Bg10, {} )

				Bg100:completeAnimation()
				self.Bg100:setRGB( 1, 1, 1 )
				self.Bg100:setAlpha( 1 )
				self.clipFinished( Bg100, {} )

				lightsLeft0:completeAnimation()
				self.lightsLeft0:setAlpha( 0 )
				self.clipFinished( lightsLeft0, {} )

				lightRight0:completeAnimation()
				self.lightRight0:setAlpha( 0 )
				self.clipFinished( lightRight0, {} )
			end
		},
		Printing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				Bg0:completeAnimation()
				self.Bg0:setRGB( 1, 1, 1 )
				self.Bg0:setAlpha( 0.25 )
				self.clipFinished( Bg0, {} )

				Bg:completeAnimation()
				self.Bg:setRGB( 1, 1, 1 )
				self.Bg:setAlpha( 1 )
				self.clipFinished( Bg, {} )

				AmmoBarTop:completeAnimation()

				AmmoBarTop.ammoFull:completeAnimation()
				self.AmmoBarTop:setRGB( 1, 1, 1 )
				self.AmmoBarTop:setAlpha( 1 )
				self.AmmoBarTop.ammoFull:setRGB( 0.33, 0.95, 0.81 )
				self.clipFinished( AmmoBarTop, {} )

				AmmoBarBottom:completeAnimation()

				AmmoBarBottom.ammoFull:completeAnimation()
				self.AmmoBarBottom:setRGB( 1, 1, 1 )
				self.AmmoBarBottom:setAlpha( 1 )
				self.AmmoBarBottom.ammoFull:setRGB( 0.33, 0.95, 0.81 )
				self.clipFinished( AmmoBarBottom, {} )

				Status:completeAnimation()

				Status.FrameTop:completeAnimation()

				Status.FrameBottom:completeAnimation()

				Status.Status:completeAnimation()
				self.Status:setRGB( 1, 1, 1 )
				self.Status.FrameTop:setRGB( 1, 1, 1 )
				self.Status.FrameBottom:setRGB( 1, 1, 1 )
				self.Status.Status:setText( Engine.Localize( "MPUI_LMG_PRINTING_CAPS" ) )
				self.clipFinished( Status, {} )

				lmgInfiniteReticleExtras:completeAnimation()
				self.lmgInfiniteReticleExtras:setRGB( 1, 1, 1 )
				self.clipFinished( lmgInfiniteReticleExtras, {} )

				lightRight:completeAnimation()
				self.lightRight:setRGB( 1, 1, 1 )
				self.lightRight:setAlpha( 0.65 )
				self.clipFinished( lightRight, {} )

				lightsLeft:completeAnimation()
				self.lightsLeft:setRGB( 1, 1, 1 )
				self.lightsLeft:setAlpha( 0.65 )
				self.clipFinished( lightsLeft, {} )

				lmgInfiniteReticlelightLeft:completeAnimation()
				self.lmgInfiniteReticlelightLeft:setRGB( 1, 1, 1 )
				self.lmgInfiniteReticlelightLeft:setAlpha( 1 )
				self.clipFinished( lmgInfiniteReticlelightLeft, {} )

				lmgInfiniteReticlelightRight:completeAnimation()
				self.lmgInfiniteReticlelightRight:setRGB( 1, 1, 1 )
				self.lmgInfiniteReticlelightRight:setAlpha( 1 )
				self.clipFinished( lmgInfiniteReticlelightRight, {} )

				Bg10:completeAnimation()
				self.Bg10:setRGB( 1, 1, 1 )
				self.Bg10:setAlpha( 1 )
				self.clipFinished( Bg10, {} )

				Bg100:completeAnimation()
				self.Bg100:setRGB( 1, 1, 1 )
				self.clipFinished( Bg100, {} )

				lightsLeft0:completeAnimation()
				self.lightsLeft0:setAlpha( 0.1 )
				self.clipFinished( lightsLeft0, {} )

				lightRight0:completeAnimation()
				self.lightRight0:setAlpha( 0.1 )
				self.clipFinished( lightRight0, {} )
			end,
			MagazineFull = function ()
				self:setupElementClipCounter( 6 )

				AmmoBarTop:completeAnimation()

				AmmoBarTop.ammoFull:completeAnimation()
				self.AmmoBarTop:setAlpha( 1 )
				self.AmmoBarTop.ammoFull:setRGB( 0.33, 0.95, 0.81 )
				self.clipFinished( AmmoBarTop, {} )

				AmmoBarBottom:completeAnimation()

				AmmoBarBottom.ammoFull:completeAnimation()
				self.AmmoBarBottom:setRGB( 1, 1, 1 )
				self.AmmoBarBottom.ammoFull:setRGB( 0.33, 0.95, 0.81 )
				self.clipFinished( AmmoBarBottom, {} )
				local lightRightFrame2 = function ( lightRight, event )
					if not event.interrupted then
						lightRight:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
					end
					lightRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lightRight, event )
					else
						lightRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lightRight:completeAnimation()
				self.lightRight:setAlpha( 0.5 )
				lightRightFrame2( lightRight, {} )
				local lightsLeftFrame2 = function ( lightsLeft, event )
					if not event.interrupted then
						lightsLeft:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
					end
					lightsLeft:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lightsLeft, event )
					else
						lightsLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lightsLeft:completeAnimation()
				self.lightsLeft:setAlpha( 0.5 )
				lightsLeftFrame2( lightsLeft, {} )
				local lmgInfiniteReticlelightLeftFrame2 = function ( lmgInfiniteReticlelightLeft, event )
					if not event.interrupted then
						lmgInfiniteReticlelightLeft:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
					end
					lmgInfiniteReticlelightLeft:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lmgInfiniteReticlelightLeft, event )
					else
						lmgInfiniteReticlelightLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lmgInfiniteReticlelightLeft:completeAnimation()
				self.lmgInfiniteReticlelightLeft:setAlpha( 1 )
				lmgInfiniteReticlelightLeftFrame2( lmgInfiniteReticlelightLeft, {} )
				local lmgInfiniteReticlelightRightFrame2 = function ( lmgInfiniteReticlelightRight, event )
					if not event.interrupted then
						lmgInfiniteReticlelightRight:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
					end
					lmgInfiniteReticlelightRight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( lmgInfiniteReticlelightRight, event )
					else
						lmgInfiniteReticlelightRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lmgInfiniteReticlelightRight:completeAnimation()
				self.lmgInfiniteReticlelightRight:setAlpha( 1 )
				lmgInfiniteReticlelightRightFrame2( lmgInfiniteReticlelightRight, {} )
			end
		},
		EmptyMagazine = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				Bg0:completeAnimation()
				self.Bg0:setRGB( 1, 0, 0 )
				self.Bg0:setAlpha( 1 )
				self.Bg0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( Bg0, {} )

				Bg:completeAnimation()
				self.Bg:setRGB( 1, 0, 0 )
				self.Bg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( Bg, {} )

				AmmoBarTop:completeAnimation()

				AmmoBarTop.ammoFull:completeAnimation()
				self.AmmoBarTop:setRGB( 1, 1, 1 )
				self.AmmoBarTop:setAlpha( 1 )
				self.AmmoBarTop.ammoFull:setRGB( 1, 0, 0 )
				self.clipFinished( AmmoBarTop, {} )

				AmmoBarBottom:completeAnimation()

				AmmoBarBottom.ammoFull:completeAnimation()
				self.AmmoBarBottom:setRGB( 1, 1, 1 )
				self.AmmoBarBottom:setAlpha( 1 )
				self.AmmoBarBottom.ammoFull:setRGB( 1, 0, 0 )
				self.clipFinished( AmmoBarBottom, {} )

				Status:completeAnimation()

				Status.FrameTop:completeAnimation()

				Status.FrameBottom:completeAnimation()

				Status.Status:completeAnimation()
				self.Status:setRGB( 1, 0, 0 )
				self.Status.FrameTop:setRGB( 1, 0, 0 )
				self.Status.FrameBottom:setRGB( 1, 0, 0 )
				self.Status.Status:setText( Engine.Localize( "MPUI_LMG_MAGAZINE_EMPTY_CAPS" ) )
				self.clipFinished( Status, {} )

				lmgInfiniteReticleExtras:completeAnimation()
				self.lmgInfiniteReticleExtras:setRGB( 1, 0, 0 )
				self.lmgInfiniteReticleExtras:setAlpha( 1 )
				self.clipFinished( lmgInfiniteReticleExtras, {} )

				lightRight:completeAnimation()
				self.lightRight:setRGB( 1, 0, 0 )
				self.lightRight:setAlpha( 1 )
				self.clipFinished( lightRight, {} )

				lightsLeft:completeAnimation()
				self.lightsLeft:setRGB( 1, 0, 0 )
				self.lightsLeft:setAlpha( 1 )
				self.clipFinished( lightsLeft, {} )

				lmgInfiniteReticlelightLeft:completeAnimation()
				self.lmgInfiniteReticlelightLeft:setAlpha( 0 )
				self.clipFinished( lmgInfiniteReticlelightLeft, {} )

				lmgInfiniteReticlelightRight:completeAnimation()
				self.lmgInfiniteReticlelightRight:setAlpha( 0 )
				self.clipFinished( lmgInfiniteReticlelightRight, {} )

				Bg10:completeAnimation()
				self.Bg10:setRGB( 1, 0, 0 )
				self.clipFinished( Bg10, {} )

				Bg100:completeAnimation()
				self.Bg100:setRGB( 1, 0, 0 )
				self.clipFinished( Bg100, {} )

				lightsLeft0:completeAnimation()
				self.lightsLeft0:setRGB( 1, 0, 0 )
				self.lightsLeft0:setAlpha( 1 )
				self.clipFinished( lightsLeft0, {} )

				lightRight0:completeAnimation()
				self.lightRight0:setRGB( 1, 0, 0 )
				self.lightRight0:setAlpha( 1 )
				self.clipFinished( lightRight0, {} )
			end
		},
		Last25 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				Bg0:completeAnimation()
				self.Bg0:setRGB( 1, 1, 1 )
				self.Bg0:setAlpha( 0.25 )
				self.clipFinished( Bg0, {} )

				Bg:completeAnimation()
				self.Bg:setRGB( 1, 1, 1 )
				self.Bg:setAlpha( 1 )
				self.clipFinished( Bg, {} )

				AmmoBarTop:completeAnimation()

				AmmoBarTop.ammoFull:completeAnimation()
				self.AmmoBarTop:setRGB( 1, 1, 1 )
				self.AmmoBarTop:setAlpha( 1 )
				self.AmmoBarTop.ammoFull:setRGB( 1, 0, 0 )
				self.clipFinished( AmmoBarTop, {} )

				AmmoBarBottom:completeAnimation()

				AmmoBarBottom.ammoFull:completeAnimation()
				self.AmmoBarBottom:setRGB( 1, 1, 1 )
				self.AmmoBarBottom:setAlpha( 1 )
				self.AmmoBarBottom.ammoFull:setRGB( 1, 0, 0 )
				self.clipFinished( AmmoBarBottom, {} )

				Status:completeAnimation()

				Status.FrameTop:completeAnimation()

				Status.FrameBottom:completeAnimation()

				Status.Status:completeAnimation()
				self.Status:setRGB( 1, 1, 1 )
				self.Status.FrameTop:setRGB( 1, 1, 1 )
				self.Status.FrameBottom:setRGB( 1, 1, 1 )
				self.Status.Status:setText( Engine.Localize( "MPUI_LMG_FIRING_CAPS" ) )
				self.clipFinished( Status, {} )

				lmgInfiniteReticleExtras:completeAnimation()
				self.lmgInfiniteReticleExtras:setRGB( 1, 1, 1 )
				self.clipFinished( lmgInfiniteReticleExtras, {} )

				lightRight:completeAnimation()
				self.lightRight:setRGB( 1, 1, 1 )
				self.clipFinished( lightRight, {} )

				lightsLeft:completeAnimation()
				self.lightsLeft:setRGB( 1, 1, 1 )
				self.lightsLeft:setAlpha( 1 )
				self.clipFinished( lightsLeft, {} )

				lmgInfiniteReticlelightLeft:completeAnimation()
				self.lmgInfiniteReticlelightLeft:setRGB( 1, 1, 1 )
				self.lmgInfiniteReticlelightLeft:setAlpha( 1 )
				self.clipFinished( lmgInfiniteReticlelightLeft, {} )

				lmgInfiniteReticlelightRight:completeAnimation()
				self.lmgInfiniteReticlelightRight:setRGB( 1, 1, 1 )
				self.lmgInfiniteReticlelightRight:setAlpha( 1 )
				self.clipFinished( lmgInfiniteReticlelightRight, {} )

				Bg10:completeAnimation()
				self.Bg10:setRGB( 1, 1, 1 )
				self.Bg10:setAlpha( 1 )
				self.clipFinished( Bg10, {} )

				Bg100:completeAnimation()
				self.Bg100:setRGB( 1, 1, 1 )
				self.Bg100:setAlpha( 1 )
				self.clipFinished( Bg100, {} )

				lightsLeft0:completeAnimation()
				self.lightsLeft0:setAlpha( 0 )
				self.clipFinished( lightsLeft0, {} )

				lightRight0:completeAnimation()
				self.lightRight0:setAlpha( 0 )
				self.clipFinished( lightRight0, {} )
			end
		},
		WeaponFiring = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				AmmoBarTop:completeAnimation()

				AmmoBarTop.ammoFull:completeAnimation()
				self.AmmoBarTop.ammoFull:setRGB( 0.33, 0.95, 0.81 )
				self.clipFinished( AmmoBarTop, {} )

				AmmoBarBottom:completeAnimation()

				AmmoBarBottom.ammoFull:completeAnimation()
				self.AmmoBarBottom:setRGB( 1, 1, 1 )
				self.AmmoBarBottom.ammoFull:setRGB( 0.33, 0.95, 0.81 )
				self.clipFinished( AmmoBarBottom, {} )

				Status:completeAnimation()

				Status.Status:completeAnimation()
				self.Status.Status:setText( Engine.Localize( "MPUI_LMG_FIRING_CAPS" ) )
				self.clipFinished( Status, {} )

				lightRight:completeAnimation()
				self.lightRight:setAlpha( 1 )
				self.clipFinished( lightRight, {} )

				lightsLeft:completeAnimation()
				self.lightsLeft:setAlpha( 1 )
				self.clipFinished( lightsLeft, {} )

				lmgInfiniteReticlelightLeft:completeAnimation()
				self.lmgInfiniteReticlelightLeft:setAlpha( 0 )
				self.clipFinished( lmgInfiniteReticlelightLeft, {} )

				lmgInfiniteReticlelightRight:completeAnimation()
				self.lmgInfiniteReticlelightRight:setAlpha( 0 )
				self.clipFinished( lmgInfiniteReticlelightRight, {} )

				lightsLeft0:completeAnimation()
				self.lightsLeft0:setAlpha( 0.15 )
				self.clipFinished( lightsLeft0, {} )

				lightRight0:completeAnimation()
				self.lightRight0:setAlpha( 0.15 )
				self.clipFinished( lightRight0, {} )
			end
		},
		MagazineFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				AmmoBarTop:completeAnimation()

				AmmoBarTop.ammoFull:completeAnimation()
				self.AmmoBarTop:setRGB( 1, 1, 1 )
				self.AmmoBarTop.ammoFull:setRGB( 0.33, 0.95, 0.81 )
				self.clipFinished( AmmoBarTop, {} )

				AmmoBarBottom:completeAnimation()

				AmmoBarBottom.ammoFull:completeAnimation()
				self.AmmoBarBottom:setRGB( 1, 1, 1 )
				self.AmmoBarBottom.ammoFull:setRGB( 0.33, 0.95, 0.81 )
				self.clipFinished( AmmoBarBottom, {} )

				Status:completeAnimation()

				Status.Status:completeAnimation()
				self.Status:setRGB( 1, 1, 1 )
				self.Status.Status:setText( Engine.Localize( "MPUI_LMG_MAGAZINE_FULL_CAPS" ) )
				self.clipFinished( Status, {} )

				lightRight:completeAnimation()
				self.lightRight:setAlpha( 1 )
				self.clipFinished( lightRight, {} )

				lightsLeft:completeAnimation()
				self.lightsLeft:setAlpha( 1 )
				self.clipFinished( lightsLeft, {} )

				lmgInfiniteReticlelightLeft:completeAnimation()
				self.lmgInfiniteReticlelightLeft:setAlpha( 0 )
				self.clipFinished( lmgInfiniteReticlelightLeft, {} )

				lmgInfiniteReticlelightRight:completeAnimation()
				self.lmgInfiniteReticlelightRight:setAlpha( 0 )
				self.clipFinished( lmgInfiniteReticlelightRight, {} )

				lightsLeft0:completeAnimation()
				self.lightsLeft0:setAlpha( 0.15 )
				self.clipFinished( lightsLeft0, {} )

				lightRight0:completeAnimation()
				self.lightRight0:setAlpha( 0.15 )
				self.clipFinished( lightRight0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "LowAmmoPrinting",
			condition = function ( menu, element, event )
				return IsLowAmmoClip( controller ) and IsSelfModelValueEqualToEnum( element, controller, "lmgInfiniteState", Enum.LMGInfiniteState.LMG_INFINITE_STATE_PRINTING )
			end
		},
		{
			stateName = "Printing",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "lmgInfiniteState", Enum.LMGInfiniteState.LMG_INFINITE_STATE_PRINTING )
			end
		},
		{
			stateName = "EmptyMagazine",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "lmgInfiniteState", Enum.LMGInfiniteState.LMG_INFINITE_STATE_EMPTY )
			end
		},
		{
			stateName = "Last25",
			condition = function ( menu, element, event )
				return IsLowAmmoClip( controller )
			end
		},
		{
			stateName = "WeaponFiring",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "lmgInfiniteState", Enum.LMGInfiniteState.LMG_INFINITE_STATE_FIRING )
			end
		},
		{
			stateName = "MagazineFull",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "lmgInfiniteState", Enum.LMGInfiniteState.LMG_INFINITE_STATE_FULL )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
		} )
	end )
	self:linkToElementModel( self, "lmgInfiniteState", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lmgInfiniteState"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoBarTop:close()
		element.AmmoBarBottom:close()
		element.Status:close()
		element.lmgInfiniteReticleExtras:close()
		element.lmgInfiniteReticlelightLeft:close()
		element.lmgInfiniteReticlelightRight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

