-- 2a55fe51970a6d2e220c2191063b5411
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_TotalAmmo = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_TotalAmmo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_TotalAmmo )
	self.id = "AmmoWidget_TotalAmmo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 54 )
	self:setTopBottom( true, false, 0, 30 )
	
	local TotalAmmoLbl = LUI.UITightText.new()
	TotalAmmoLbl:setLeftRight( false, false, -23, 23 )
	TotalAmmoLbl:setTopBottom( false, true, -30, 1 )
	TotalAmmoLbl:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TotalAmmoLbl:setLetterSpacing( -1 )
	TotalAmmoLbl:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local ammoStock = Engine.GetModelValue( model )
		if ammoStock then
			TotalAmmoLbl:setText( Engine.Localize( ammoStock ) )
		end
	end )
	self:addElement( TotalAmmoLbl )
	self.TotalAmmoLbl = TotalAmmoLbl
	
	local TotalAmmoFakeLbl = LUI.UITightText.new()
	TotalAmmoFakeLbl:setLeftRight( false, false, -8, 8 )
	TotalAmmoFakeLbl:setTopBottom( false, true, -30, 1 )
	TotalAmmoFakeLbl:setRGB( 1, 0, 0 )
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
				self.TotalAmmoLbl:setRGB( 1, 1, 1 )
				self.TotalAmmoLbl:setAlpha( 0.8 )
				self.clipFinished( TotalAmmoLbl, {} )

				TotalAmmoFakeLbl:completeAnimation()
				self.TotalAmmoFakeLbl:setAlpha( 0 )
				self.clipFinished( TotalAmmoFakeLbl, {} )
			end,
			AmmoPickup = function ()
				self:setupElementClipCounter( 2 )

				local TotalAmmoLblFrame2 = function ( TotalAmmoLbl, event )
					if not event.interrupted then
						TotalAmmoLbl:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TotalAmmoLbl:setLeftRight( false, false, -23, 23 )
					TotalAmmoLbl:setTopBottom( false, true, -30, 1 )
					TotalAmmoLbl:setRGB( 1, 1, 1 )
					TotalAmmoLbl:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( TotalAmmoLbl, event )
					else
						TotalAmmoLbl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TotalAmmoLbl:completeAnimation()
				self.TotalAmmoLbl:setLeftRight( false, false, -23, 23 )
				self.TotalAmmoLbl:setTopBottom( false, true, 0, 31 )
				self.TotalAmmoLbl:setRGB( 1, 1, 1 )
				self.TotalAmmoLbl:setAlpha( 0.8 )
				TotalAmmoLblFrame2( TotalAmmoLbl, {} )

				TotalAmmoFakeLbl:completeAnimation()
				self.TotalAmmoFakeLbl:setAlpha( 0 )
				self.clipFinished( TotalAmmoFakeLbl, {} )
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				TotalAmmoLbl:completeAnimation()
				self.TotalAmmoLbl:setRGB( 1, 0, 0 )
				self.TotalAmmoLbl:setAlpha( 1 )
				self.clipFinished( TotalAmmoLbl, {} )

				TotalAmmoFakeLbl:completeAnimation()
				self.TotalAmmoFakeLbl:setAlpha( 0 )
				self.clipFinished( TotalAmmoFakeLbl, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "PerController", "hudItems.ammoPickedUp", function ( model )
		local f7_local0 = self
		PlayClip( self, "AmmoPickup", controller )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TotalAmmoLbl:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
