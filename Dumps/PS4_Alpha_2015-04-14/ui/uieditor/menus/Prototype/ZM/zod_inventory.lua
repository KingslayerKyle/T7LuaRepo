LUI.createMenu.zod_inventory = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "zod_inventory" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local SprayerIcon = LUI.UIImage.new()
	SprayerIcon:setLeftRight( true, true, 1184, -32 )
	SprayerIcon:setTopBottom( true, true, 396.5, -259.5 )
	SprayerIcon:setImage( RegisterImage( "uie_hud_zod_sprayer" ) )
	SprayerIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( SprayerIcon )
	self.SprayerIcon = SprayerIcon
	
	local EggIcon = LUI.UIImage.new()
	EggIcon:setLeftRight( true, true, 1184, -32 )
	EggIcon:setTopBottom( true, true, 443.5, -212.5 )
	EggIcon:setImage( RegisterImage( "uie_hud_zod_egg_0" ) )
	EggIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( EggIcon )
	self.EggIcon = EggIcon
	
	local EggRed = LUI.UIImage.new()
	EggRed:setLeftRight( true, false, 1184, 1248 )
	EggRed:setTopBottom( true, false, 443.5, 507.5 )
	EggRed:setRGB( 1, 1, 1 )
	EggRed:setZRot( 180 )
	EggRed:setImage( RegisterImage( "uie_hud_zod_egg_inv" ) )
	EggRed:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	EggRed:setShaderVector( 0, 1, 0, 0, 0 )
	EggRed:setShaderVector( 1, 0, 0, 0, 0 )
	EggRed:setShaderVector( 3, 0.1, 0, 0, 0 )
	self:addElement( EggRed )
	self.EggRed = EggRed
	
	local EggLevel = LUI.UIText.new()
	EggLevel:setLeftRight( true, true, 1228, 4 )
	EggLevel:setTopBottom( true, true, 475.5, -219.5 )
	EggLevel:setTTF( "fonts/default.ttf" )
	EggLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EggLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EggLevel )
	self.EggLevel = EggLevel
	
	self.SprayerIcon:linkToElementModel( self, "pod_sprayer", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SprayerIcon:setAlpha( modelValue )
		end
	end )
	self.EggIcon:linkToElementModel( self, "egg_acquired", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EggIcon:setAlpha( modelValue )
		end
	end )
	self.EggRed:linkToElementModel( self, "egg_completion", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EggRed:setShaderVector( 2, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self.EggLevel:linkToElementModel( self, "egg_acquired", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EggLevel:setAlpha( modelValue )
		end
	end )
	self.EggLevel:linkToElementModel( self, "egg_level", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EggLevel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.SprayerIcon:close()
		self.EggIcon:close()
		self.EggRed:close()
		self.EggLevel:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

