require( "ui.uieditor.widgets.HUD.GenericUpdateBarWithLink" )
require( "ui.uieditor.widgets.HUD.GenericUpdateBarWithLinkV" )

CoD.tank_player1 = InheritFrom( LUI.UIElement )
CoD.tank_player1.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.tank_player1 )
	self.id = "tank_player1"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 31 )
	
	local PlayerName = LUI.UIText.new()
	PlayerName:setLeftRight( true, false, -346.5, 0 )
	PlayerName:setTopBottom( true, false, -58.14, -28.14 )
	PlayerName:setRGB( 1, 1, 1 )
	PlayerName:setTTF( "fonts/default.ttf" )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayerName:linkToElementModel( self, "tank_name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local TankImage = LUI.UIImage.new()
	TankImage:setLeftRight( true, false, -93, 9 )
	TankImage:setTopBottom( true, false, -45, 41 )
	TankImage:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_type_quadtank" ) )
	TankImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	TankImage:linkToElementModel( self, "tank_rgb", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TankImage:setRGB( modelValue )
		end
	end )
	self:addElement( TankImage )
	self.TankImage = TankImage
	
	local healthBar = CoD.GenericUpdateBarWithLink.new( menu, controller )
	healthBar:setLeftRight( true, false, -166, -85.88 )
	healthBar:setTopBottom( true, false, -18.14, -10.86 )
	healthBar:setRGB( 0.87, 0.96, 0.71 )
	healthBar:linkToElementModel( self, "tank_health", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			healthBar.barImage:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( healthBar )
	self.healthBar = healthBar
	
	local health = LUI.UITightText.new()
	health:setLeftRight( false, true, -482, -401.88 )
	health:setTopBottom( true, false, -34.14, -18.14 )
	health:setRGB( 1, 1, 1 )
	health:setText( Engine.Localize( "MENU_HEALTH" ) )
	health:setTTF( "fonts/default.ttf" )
	self:addElement( health )
	self.health = health
	
	local fuel = LUI.UITightText.new()
	fuel:setLeftRight( true, false, -1.5, 23.5 )
	fuel:setTopBottom( true, false, 22, 33 )
	fuel:setRGB( 1, 1, 1 )
	fuel:setText( Engine.Localize( "MENU_FUEL" ) )
	fuel:setTTF( "fonts/default.ttf" )
	self:addElement( fuel )
	self.fuel = fuel
	
	local fuelBar = CoD.GenericUpdateBarWithLinkV.new( menu, controller )
	fuelBar:setLeftRight( true, false, 5.5, 12.5 )
	fuelBar:setTopBottom( true, false, 20, -32 )
	fuelBar:setRGB( 0.09, 0.56, 0.99 )
	fuelBar:linkToElementModel( self, "tank_fuel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			fuelBar.barImage:setShaderVector( 2, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( fuelBar )
	self.fuelBar = fuelBar
	
	local fuelreboot = LUI.UIText.new()
	fuelreboot:setLeftRight( true, false, -199.5, -1.5 )
	fuelreboot:setTopBottom( true, false, 33, 44 )
	fuelreboot:setRGB( 1, 0.8, 0.22 )
	fuelreboot:setTTF( "fonts/default.ttf" )
	fuelreboot:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	fuelreboot:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	fuelreboot:linkToElementModel( self, "tank_msg", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			fuelreboot:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( fuelreboot )
	self.fuelreboot = fuelreboot
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				PlayerName:completeAnimation()
				self.PlayerName:setAlpha( 1 )
				self.clipFinished( PlayerName, {} )
				TankImage:completeAnimation()
				self.TankImage:setAlpha( 1 )
				self.clipFinished( TankImage, {} )
				healthBar:completeAnimation()
				self.healthBar:setAlpha( 1 )
				self.clipFinished( healthBar, {} )
				health:completeAnimation()
				self.health:setAlpha( 1 )
				self.clipFinished( health, {} )
				fuel:completeAnimation()
				self.fuel:setAlpha( 1 )
				self.clipFinished( fuel, {} )
				fuelBar:completeAnimation()
				self.fuelBar:setAlpha( 1 )
				self.clipFinished( fuelBar, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				PlayerName:completeAnimation()
				self.PlayerName:setAlpha( 0 )
				self.clipFinished( PlayerName, {} )
				TankImage:completeAnimation()
				self.TankImage:setAlpha( 0 )
				self.clipFinished( TankImage, {} )
				healthBar:completeAnimation()
				self.healthBar:setAlpha( 0 )
				self.clipFinished( healthBar, {} )
				health:completeAnimation()
				self.health:setAlpha( 0 )
				self.clipFinished( health, {} )
				fuel:completeAnimation()
				self.fuel:setAlpha( 0 )
				self.clipFinished( fuel, {} )
				fuelBar:completeAnimation()
				self.fuelBar:setAlpha( 0 )
				self.clipFinished( fuelBar, {} )
			end
		}
	}
	self.close = function ( self )
		self.healthBar:close()
		self.fuelBar:close()
		self.PlayerName:close()
		self.TankImage:close()
		self.fuelreboot:close()
		CoD.tank_player1.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

