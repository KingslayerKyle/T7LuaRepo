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
	TotalAmmoLbl:setRGB( 1, 1, 1 )
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
		},
		HeroWeapon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TotalAmmoLbl:completeAnimation()
				self.TotalAmmoLbl:setAlpha( 0 )
				self.clipFinished( TotalAmmoLbl, {} )
				TotalAmmoFakeLbl:completeAnimation()
				self.TotalAmmoFakeLbl:setAlpha( 1 )
				self.clipFinished( TotalAmmoFakeLbl, {} )
			end
		}
	}
	self.close = function ( self )
		self.TotalAmmoLbl:close()
		CoD.AmmoWidget_TotalAmmo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

