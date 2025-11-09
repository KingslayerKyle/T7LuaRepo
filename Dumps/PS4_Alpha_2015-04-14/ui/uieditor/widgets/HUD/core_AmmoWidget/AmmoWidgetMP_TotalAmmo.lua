CoD.AmmoWidgetMP_TotalAmmo = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_TotalAmmo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_TotalAmmo )
	self.id = "AmmoWidgetMP_TotalAmmo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 54 )
	self:setTopBottom( true, false, 0, 30 )
	
	local TotalAmmoLbl = LUI.UITightText.new()
	TotalAmmoLbl:setLeftRight( false, false, -23, 23 )
	TotalAmmoLbl:setTopBottom( false, true, -30, 1 )
	TotalAmmoLbl:setRGB( 0.41, 0.54, 0.7 )
	TotalAmmoLbl:setAlpha( 0.26 )
	TotalAmmoLbl:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TotalAmmoLbl:setLetterSpacing( -1 )
	TotalAmmoLbl:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TotalAmmoLbl:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TotalAmmoLbl )
	self.TotalAmmoLbl = TotalAmmoLbl
	
	local TotalAmmoFakeLbl = LUI.UITightText.new()
	TotalAmmoFakeLbl:setLeftRight( false, false, -8, 8 )
	TotalAmmoFakeLbl:setTopBottom( false, true, -30, 1 )
	TotalAmmoFakeLbl:setRGB( 0.67, 0.75, 0.8 )
	TotalAmmoFakeLbl:setAlpha( 0 )
	TotalAmmoFakeLbl:setText( Engine.Localize( "0" ) )
	TotalAmmoFakeLbl:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TotalAmmoFakeLbl:setLetterSpacing( -0.6 )
	self:addElement( TotalAmmoFakeLbl )
	self.TotalAmmoFakeLbl = TotalAmmoFakeLbl
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TotalAmmoLbl:completeAnimation()
				self.TotalAmmoLbl:setRGB( 0.6, 0.6, 0.6 )
				self.TotalAmmoLbl:setAlpha( 1 )
				self.clipFinished( TotalAmmoLbl, {} )
				TotalAmmoFakeLbl:completeAnimation()
				self.TotalAmmoFakeLbl:setRGB( 0.7, 0.7, 0.7 )
				self.TotalAmmoFakeLbl:setAlpha( 0 )
				self.clipFinished( TotalAmmoFakeLbl, {} )
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 2 )
				local TotalAmmoLblFrame2 = function ( TotalAmmoLbl, event )
					if not event.interrupted then
						TotalAmmoLbl:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
					end
					TotalAmmoLbl:setRGB( 0.6, 0.6, 0.6 )
					TotalAmmoLbl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalAmmoLbl, event )
					else
						TotalAmmoLbl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalAmmoLbl:completeAnimation()
				self.TotalAmmoLbl:setRGB( 0.6, 0.6, 0.6 )
				self.TotalAmmoLbl:setAlpha( 1 )
				TotalAmmoLblFrame2( TotalAmmoLbl, {} )
				local TotalAmmoFakeLblFrame2 = function ( TotalAmmoFakeLbl, event )
					if not event.interrupted then
						TotalAmmoFakeLbl:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					TotalAmmoFakeLbl:setRGB( 0.7, 0.7, 0.7 )
					TotalAmmoFakeLbl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalAmmoFakeLbl, event )
					else
						TotalAmmoFakeLbl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalAmmoFakeLbl:completeAnimation()
				self.TotalAmmoFakeLbl:setRGB( 0.7, 0.7, 0.7 )
				self.TotalAmmoFakeLbl:setAlpha( 0 )
				TotalAmmoFakeLblFrame2( TotalAmmoFakeLbl, {} )
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local TotalAmmoLblFrame2 = function ( TotalAmmoLbl, event )
					local TotalAmmoLblFrame3 = function ( TotalAmmoLbl, event )
						if not event.interrupted then
							TotalAmmoLbl:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
						TotalAmmoLbl:setRGB( 1, 0, 0 )
						TotalAmmoLbl:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( TotalAmmoLbl, event )
						else
							TotalAmmoLbl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TotalAmmoLblFrame3( TotalAmmoLbl, event )
						return 
					else
						TotalAmmoLbl:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						TotalAmmoLbl:setAlpha( 0.8 )
						TotalAmmoLbl:registerEventHandler( "transition_complete_keyframe", TotalAmmoLblFrame3 )
					end
				end
				
				TotalAmmoLbl:completeAnimation()
				self.TotalAmmoLbl:setRGB( 1, 0, 0 )
				self.TotalAmmoLbl:setAlpha( 1 )
				TotalAmmoLblFrame2( TotalAmmoLbl, {} )
				TotalAmmoFakeLbl:completeAnimation()
				self.TotalAmmoFakeLbl:setAlpha( 0 )
				self.clipFinished( TotalAmmoFakeLbl, {} )
				self.nextClip = "DefaultClip"
			end,
			HeroWeapon = function ()
				self:setupElementClipCounter( 2 )
				local TotalAmmoLblFrame2 = function ( TotalAmmoLbl, event )
					if not event.interrupted then
						TotalAmmoLbl:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Bounce )
					end
					TotalAmmoLbl:setRGB( 1, 0, 0 )
					TotalAmmoLbl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalAmmoLbl, event )
					else
						TotalAmmoLbl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalAmmoLbl:completeAnimation()
				self.TotalAmmoLbl:setRGB( 1, 0, 0 )
				self.TotalAmmoLbl:setAlpha( 1 )
				TotalAmmoLblFrame2( TotalAmmoLbl, {} )
				local TotalAmmoFakeLblFrame2 = function ( TotalAmmoFakeLbl, event )
					if not event.interrupted then
						TotalAmmoFakeLbl:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Bounce )
					end
					TotalAmmoFakeLbl:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TotalAmmoFakeLbl, event )
					else
						TotalAmmoFakeLbl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalAmmoFakeLbl:completeAnimation()
				self.TotalAmmoFakeLbl:setAlpha( 0 )
				TotalAmmoFakeLblFrame2( TotalAmmoFakeLbl, {} )
			end
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TotalAmmoLbl:completeAnimation()
				self.TotalAmmoLbl:setRGB( 0.67, 0.75, 0.8 )
				self.TotalAmmoLbl:setAlpha( 0 )
				self.clipFinished( TotalAmmoLbl, {} )
				TotalAmmoFakeLbl:completeAnimation()
				self.TotalAmmoFakeLbl:setRGB( 0.67, 0.75, 0.8 )
				self.TotalAmmoFakeLbl:setAlpha( 0 )
				self.clipFinished( TotalAmmoFakeLbl, {} )
			end
		}
	}
	self.close = function ( self )
		self.TotalAmmoLbl:close()
		CoD.AmmoWidgetMP_TotalAmmo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

