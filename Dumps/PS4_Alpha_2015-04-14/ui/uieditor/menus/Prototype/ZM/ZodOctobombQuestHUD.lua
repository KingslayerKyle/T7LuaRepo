LUI.createMenu.ZodOctobombQuestHUD = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ZodOctobombQuestHUD" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 670, 734 )
	Image0:setTopBottom( true, false, 54, 118 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_hud_octobomb" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 670, 734 )
	Image1:setTopBottom( true, false, 54, 118 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_hud_octobomb_plainjar" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 670, 734 )
	Image2:setTopBottom( true, false, 54, 118 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_hud_octobomb_magicjar" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 670, 734 )
	Image3:setTopBottom( true, false, 54, 118 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setImage( RegisterImage( "uie_hud_octobomb_brokenjar" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self.Image0:linkToElementModel( self, "zod_octo_quest_filled_alpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image0:setAlpha( modelValue )
		end
	end )
	self.Image1:linkToElementModel( self, "zod_octo_quest_plain_alpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image1:setAlpha( modelValue )
		end
	end )
	self.Image2:linkToElementModel( self, "zod_octo_quest_magic_alpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image2:setAlpha( modelValue )
		end
	end )
	self.Image3:linkToElementModel( self, "zod_octo_quest_broken_alpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image3:setAlpha( modelValue )
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
		self.Image0:close()
		self.Image1:close()
		self.Image2:close()
		self.Image3:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

