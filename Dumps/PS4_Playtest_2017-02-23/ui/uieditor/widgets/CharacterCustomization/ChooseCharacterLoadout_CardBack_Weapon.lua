require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_TabBar" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )

CoD.ChooseCharacterLoadout_CardBack_Weapon = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_Weapon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_Weapon )
	self.id = "ChooseCharacterLoadout_CardBack_Weapon"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 759 )
	self:setTopBottom( 0, 0, 0, 720 )
	
	local weapon = LUI.UIImage.new()
	weapon:setLeftRight( 0.5, 0.5, -378, -121 )
	weapon:setTopBottom( 0, 0, -2, 253 )
	weapon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	weapon:setShaderVector( 0, -0.33, 0, 0, 0 )
	weapon:linkToElementModel( self, "weaponCardBackIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weapon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( weapon )
	self.weapon = weapon
	
	local subImage = LUI.UIImage.new()
	subImage:setLeftRight( 0.5, 0.5, -32, 254 )
	subImage:setTopBottom( 0, 0, 70, 252 )
	subImage:setAlpha( 0 )
	subImage:linkToElementModel( self, "weaponCardBackSubIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			subImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( subImage )
	self.subImage = subImage
	
	local keyline = LUI.UIImage.new()
	keyline:setLeftRight( 0, 1, 0, 0 )
	keyline:setTopBottom( 0, 0, 318, 319 )
	keyline:setRGB( 0.82, 0.98, 1 )
	keyline:setAlpha( 0.7 )
	self:addElement( keyline )
	self.keyline = keyline
	
	local weaponDesc = CoD.verticalScrollingTextBox.new( menu, controller )
	weaponDesc:setLeftRight( 0, 1, 12, -16 )
	weaponDesc:setTopBottom( 0, 0, 323, 413 )
	weaponDesc:setRGB( 0.82, 0.98, 1 )
	weaponDesc:setAlpha( 0.8 )
	weaponDesc.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDesc.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDesc:linkToElementModel( self, "weaponDesc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponDesc.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( weaponDesc )
	self.weaponDesc = weaponDesc
	
	local schemaKeyline = LUI.UIImage.new()
	schemaKeyline:setLeftRight( 0, 1, 0, 0 )
	schemaKeyline:setTopBottom( 0, 0, 459, 460 )
	schemaKeyline:setRGB( 0.82, 0.98, 1 )
	schemaKeyline:setAlpha( 0.7 )
	self:addElement( schemaKeyline )
	self.schemaKeyline = schemaKeyline
	
	local schemaText = CoD.verticalScrollingTextBox.new( menu, controller )
	schemaText:setLeftRight( 0, 1, 12, -16 )
	schemaText:setTopBottom( 0, 0, 464, 646 )
	schemaText:setRGB( 0.82, 0.98, 1 )
	schemaText:setAlpha( 0.8 )
	schemaText.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	schemaText.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	schemaText:linkToElementModel( self, "weaponSchema", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			schemaText.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( schemaText )
	self.schemaText = schemaText
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, -30, 8 )
	Image4:setTopBottom( 0.5, 0.5, -43, -39 )
	Image4:setRGB( 0.41, 0.76, 0.6 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 0, -30, 8 )
	Image5:setTopBottom( 0.5, 0.5, -43, -39 )
	Image5:setRGB( 0.82, 0.98, 1 )
	Image5:setZRot( 180 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( 1, 1, -6, 32 )
	Image6:setTopBottom( 0.5, 0.5, -42, -38 )
	Image6:setRGB( 0.82, 0.98, 1 )
	Image6:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( 1, 1, -6, 32 )
	Image7:setTopBottom( 0.5, 0.5, -42, -38 )
	Image7:setRGB( 0.82, 0.98, 1 )
	Image7:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 1, 1, -6, 32 )
	Image2:setTopBottom( 0.5, 0.5, 99, 103 )
	Image2:setRGB( 0.82, 0.98, 1 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 1, 1, -6, 32 )
	Image3:setTopBottom( 0.5, 0.5, 99, 103 )
	Image3:setRGB( 0.82, 0.98, 1 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, -30, 8 )
	Image0:setTopBottom( 0.5, 0.5, 98, 102 )
	Image0:setRGB( 0.82, 0.98, 1 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, -30, 8 )
	Image1:setTopBottom( 0.5, 0.5, 98, 102 )
	Image1:setRGB( 0.82, 0.98, 1 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Border1 = CoD.Border.new( menu, controller )
	Border1:setLeftRight( 0.5, 0.5, -379, -121 )
	Border1:setTopBottom( 0, 0, 0, 252 )
	Border1:setRGB( 0.82, 0.98, 1 )
	self:addElement( Border1 )
	self.Border1 = Border1
	
	local Image22 = LUI.UIImage.new()
	Image22:setLeftRight( 1, 1, -761, -755 )
	Image22:setTopBottom( 1, 1, -473, -467 )
	Image22:setRGB( 0.82, 0.98, 1 )
	Image22:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image22:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image22 )
	self.Image22 = Image22
	
	local Image23 = LUI.UIImage.new()
	Image23:setLeftRight( 1, 1, -759, -753 )
	Image23:setTopBottom( 1, 1, -473, -467 )
	Image23:setRGB( 0.82, 0.98, 1 )
	Image23:setYRot( 180 )
	Image23:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image23:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image23 )
	self.Image23 = Image23
	
	local Image24 = LUI.UIImage.new()
	Image24:setLeftRight( 1, 1, -759, -753 )
	Image24:setTopBottom( 1, 1, -721, -715 )
	Image24:setRGB( 0.82, 0.98, 1 )
	Image24:setZRot( 180 )
	Image24:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image24:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image24 )
	self.Image24 = Image24
	
	local Image25 = LUI.UIImage.new()
	Image25:setLeftRight( 1, 1, -761, -755 )
	Image25:setTopBottom( 1, 1, -721, -715 )
	Image25:setRGB( 0.82, 0.98, 1 )
	Image25:setXRot( 180 )
	Image25:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image25:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image25 )
	self.Image25 = Image25
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( 1, 1, -504, -498 )
	Image8:setTopBottom( 1, 1, -473, -467 )
	Image8:setRGB( 0.82, 0.98, 1 )
	Image8:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( 1, 1, -502, -496 )
	Image9:setTopBottom( 1, 1, -473, -467 )
	Image9:setRGB( 0.82, 0.98, 1 )
	Image9:setYRot( 180 )
	Image9:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 1, 1, -502, -496 )
	Image10:setTopBottom( 1, 1, -721, -715 )
	Image10:setRGB( 0.82, 0.98, 1 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( 1, 1, -504, -498 )
	Image11:setTopBottom( 1, 1, -721, -715 )
	Image11:setRGB( 0.82, 0.98, 1 )
	Image11:setXRot( 180 )
	Image11:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local keyline1 = LUI.UIImage.new()
	keyline1:setLeftRight( 0, 1, 0, 0 )
	keyline1:setTopBottom( 0, 0, 251, 252 )
	keyline1:setRGB( 0.82, 0.98, 1 )
	keyline1:setAlpha( 0.7 )
	self:addElement( keyline1 )
	self.keyline1 = keyline1
	
	local keyline10 = LUI.UIImage.new()
	keyline10:setLeftRight( 0, 1, 0, 0 )
	keyline10:setTopBottom( 0, 0, 0.5, -0.5 )
	keyline10:setRGB( 0.82, 0.98, 1 )
	keyline10:setAlpha( 0.7 )
	self:addElement( keyline10 )
	self.keyline10 = keyline10
	
	local Image18 = LUI.UIImage.new()
	Image18:setLeftRight( 0, 0, -30, 8 )
	Image18:setTopBottom( 0.5, 0.5, -111, -107 )
	Image18:setRGB( 0.82, 0.98, 1 )
	Image18:setZRot( 180 )
	Image18:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image18:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image18 )
	self.Image18 = Image18
	
	local Image19 = LUI.UIImage.new()
	Image19:setLeftRight( 0, 0, -30, 8 )
	Image19:setTopBottom( 0.5, 0.5, -111, -107 )
	Image19:setRGB( 0.82, 0.98, 1 )
	Image19:setZRot( 180 )
	Image19:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image19:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image19 )
	self.Image19 = Image19
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( 0, 0, -30, 8 )
	Image20:setTopBottom( 0.5, 0.5, -362, -358 )
	Image20:setRGB( 0.82, 0.98, 1 )
	Image20:setZRot( 180 )
	Image20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local Image21 = LUI.UIImage.new()
	Image21:setLeftRight( 0, 0, -30, 8 )
	Image21:setTopBottom( 0.5, 0.5, -362, -358 )
	Image21:setRGB( 0.82, 0.98, 1 )
	Image21:setZRot( 180 )
	Image21:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image21:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image21 )
	self.Image21 = Image21
	
	local TabBar3 = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	TabBar3:setLeftRight( 0, 0, -3, 762 )
	TabBar3:setTopBottom( 0, 0, 282, 324 )
	TabBar3:setRGB( 0.87, 0.99, 1 )
	self:addElement( TabBar3 )
	self.TabBar3 = TabBar3
	
	local TabBar1 = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	TabBar1:setLeftRight( 0, 0, -3, 762 )
	TabBar1:setTopBottom( 0, 0, 422, 464 )
	TabBar1:setRGB( 0.87, 0.99, 1 )
	self:addElement( TabBar1 )
	self.TabBar1 = TabBar1
	
	local iconBorder00 = CoD.Border.new( menu, controller )
	iconBorder00:setLeftRight( 0.5, 0.5, -381, 379 )
	iconBorder00:setTopBottom( 0.5, 0.5, -41, 57 )
	iconBorder00:setRGB( 0.87, 0.99, 1 )
	self:addElement( iconBorder00 )
	self.iconBorder00 = iconBorder00
	
	local Border0 = CoD.Border.new( menu, controller )
	Border0:setLeftRight( 0.5, 0.5, -381, 379 )
	Border0:setTopBottom( 0.5, 0.5, 100, 292 )
	Border0:setRGB( 0.87, 0.99, 1 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Image310 = LUI.UIImage.new()
	Image310:setLeftRight( 1, 1, -5, 1 )
	Image310:setTopBottom( 1, 1, -472, -466 )
	Image310:setRGB( 0.82, 0.98, 1 )
	Image310:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image310:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image310 )
	self.Image310 = Image310
	
	local Image320 = LUI.UIImage.new()
	Image320:setLeftRight( 1, 1, -3, 3 )
	Image320:setTopBottom( 1, 1, -472, -466 )
	Image320:setRGB( 0.82, 0.98, 1 )
	Image320:setYRot( 180 )
	Image320:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image320:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image320 )
	self.Image320 = Image320
	
	local Image330 = LUI.UIImage.new()
	Image330:setLeftRight( 1, 1, -3, 3 )
	Image330:setTopBottom( 1, 1, -721, -715 )
	Image330:setRGB( 0.82, 0.98, 1 )
	Image330:setZRot( 180 )
	Image330:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image330:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image330 )
	self.Image330 = Image330
	
	local Image340 = LUI.UIImage.new()
	Image340:setLeftRight( 1, 1, -5, 1 )
	Image340:setTopBottom( 1, 1, -721, -715 )
	Image340:setRGB( 0.82, 0.98, 1 )
	Image340:setXRot( 180 )
	Image340:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image340:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image340 )
	self.Image340 = Image340
	
	local Image28 = LUI.UIImage.new()
	Image28:setLeftRight( 1, 1, -5, 1 )
	Image28:setTopBottom( 1, 1, -307, -301 )
	Image28:setRGB( 0.82, 0.98, 1 )
	Image28:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image28:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image28 )
	self.Image28 = Image28
	
	local Image29 = LUI.UIImage.new()
	Image29:setLeftRight( 1, 1, -3, 3 )
	Image29:setTopBottom( 1, 1, -307, -301 )
	Image29:setRGB( 0.82, 0.98, 1 )
	Image29:setYRot( 180 )
	Image29:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image29:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image29 )
	self.Image29 = Image29
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 1, 1, -5, 1 )
	Image30:setTopBottom( 1, 1, -73, -67 )
	Image30:setRGB( 0.82, 0.98, 1 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( 1, 1, -3, 3 )
	Image31:setTopBottom( 1, 1, -73, -67 )
	Image31:setRGB( 0.82, 0.98, 1 )
	Image31:setYRot( 180 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image32 = LUI.UIImage.new()
	Image32:setLeftRight( 1, 1, -3, 3 )
	Image32:setTopBottom( 1, 1, -403, -397 )
	Image32:setRGB( 0.82, 0.98, 1 )
	Image32:setZRot( 180 )
	Image32:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image32:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image32 )
	self.Image32 = Image32
	
	local Image33 = LUI.UIImage.new()
	Image33:setLeftRight( 1, 1, -5, 1 )
	Image33:setTopBottom( 1, 1, -403, -397 )
	Image33:setRGB( 0.82, 0.98, 1 )
	Image33:setXRot( 180 )
	Image33:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image33:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image33 )
	self.Image33 = Image33
	
	local Image34 = LUI.UIImage.new()
	Image34:setLeftRight( 1, 1, -3, 3 )
	Image34:setTopBottom( 1, 1, -262, -256 )
	Image34:setRGB( 0.82, 0.98, 1 )
	Image34:setZRot( 180 )
	Image34:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image34:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image34 )
	self.Image34 = Image34
	
	local Image35 = LUI.UIImage.new()
	Image35:setLeftRight( 1, 1, -5, 1 )
	Image35:setTopBottom( 1, 1, -262, -256 )
	Image35:setRGB( 0.82, 0.98, 1 )
	Image35:setXRot( 180 )
	Image35:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image35:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image35 )
	self.Image35 = Image35
	
	local Image36 = LUI.UIImage.new()
	Image36:setLeftRight( 1, 1, -761, -755 )
	Image36:setTopBottom( 1, 1, -403, -397 )
	Image36:setRGB( 0.82, 0.98, 1 )
	Image36:setZRot( 180 )
	Image36:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image36:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image36 )
	self.Image36 = Image36
	
	local Image37 = LUI.UIImage.new()
	Image37:setLeftRight( 1, 1, -762, -756 )
	Image37:setTopBottom( 1, 1, -403, -397 )
	Image37:setRGB( 0.82, 0.98, 1 )
	Image37:setXRot( 180 )
	Image37:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image37:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image37 )
	self.Image37 = Image37
	
	local Image38 = LUI.UIImage.new()
	Image38:setLeftRight( 1, 1, -762, -756 )
	Image38:setTopBottom( 1, 1, -307, -301 )
	Image38:setRGB( 0.82, 0.98, 1 )
	Image38:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image38:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image38 )
	self.Image38 = Image38
	
	local Image39 = LUI.UIImage.new()
	Image39:setLeftRight( 1, 1, -761, -755 )
	Image39:setTopBottom( 1, 1, -307, -301 )
	Image39:setRGB( 0.82, 0.98, 1 )
	Image39:setYRot( 180 )
	Image39:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image39:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image39 )
	self.Image39 = Image39
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( 1, 1, -761, -755 )
	Image40:setTopBottom( 1, 1, -262, -256 )
	Image40:setRGB( 0.82, 0.98, 1 )
	Image40:setZRot( 180 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( 1, 1, -762, -756 )
	Image41:setTopBottom( 1, 1, -262, -256 )
	Image41:setRGB( 0.82, 0.98, 1 )
	Image41:setXRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local Image42 = LUI.UIImage.new()
	Image42:setLeftRight( 1, 1, -762, -756 )
	Image42:setTopBottom( 1, 1, -73, -67 )
	Image42:setRGB( 0.82, 0.98, 1 )
	Image42:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image42:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image42 )
	self.Image42 = Image42
	
	local Image43 = LUI.UIImage.new()
	Image43:setLeftRight( 1, 1, -761, -755 )
	Image43:setTopBottom( 1, 1, -73, -67 )
	Image43:setRGB( 0.82, 0.98, 1 )
	Image43:setYRot( 180 )
	Image43:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image43:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image43 )
	self.Image43 = Image43
	
	local schemaLabel = LUI.UITightText.new()
	schemaLabel:setLeftRight( 0, 0, 12, 312 )
	schemaLabel:setTopBottom( 0, 0, 429, 459 )
	schemaLabel:setRGB( 0, 0, 0 )
	schemaLabel:setTTF( "fonts/escom.ttf" )
	schemaLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	schemaLabel:setShaderVector( 0, 0.05, 0, 0, 0 )
	schemaLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	schemaLabel:setShaderVector( 2, 1, 0, 0, 0 )
	schemaLabel:setLetterSpacing( 1 )
	schemaLabel:linkToElementModel( self, "weaponSchemaTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			schemaLabel:setText( modelValue )
		end
	end )
	self:addElement( schemaLabel )
	self.schemaLabel = schemaLabel
	
	local index = LUI.UITightText.new()
	index:setLeftRight( 0, 0, 12, 312 )
	index:setTopBottom( 0, 0, 289, 319 )
	index:setRGB( 0, 0, 0 )
	index:setTTF( "fonts/escom.ttf" )
	index:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	index:setShaderVector( 0, 0.05, 0, 0, 0 )
	index:setShaderVector( 1, 0.02, 0, 0, 0 )
	index:setShaderVector( 2, 1, 0, 0, 0 )
	index:setLetterSpacing( 1 )
	index:linkToElementModel( self, "text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			index:setText( modelValue )
		end
	end )
	self:addElement( index )
	self.index = index
	
	self.resetProperties = function ()
		weapon:completeAnimation()
		schemaLabel:completeAnimation()
		weaponDesc:completeAnimation()
		keyline10:completeAnimation()
		Border1:completeAnimation()
		Border0:completeAnimation()
		iconBorder00:completeAnimation()
		keyline1:completeAnimation()
		TabBar3:completeAnimation()
		index:completeAnimation()
		keyline:completeAnimation()
		schemaText:completeAnimation()
		TabBar1:completeAnimation()
		schemaKeyline:completeAnimation()
		weapon:setAlpha( 1 )
		schemaLabel:setAlpha( 1 )
		weaponDesc:setAlpha( 0.8 )
		keyline10:setAlpha( 0.7 )
		Border1:setAlpha( 1 )
		Border0:setAlpha( 1 )
		iconBorder00:setAlpha( 1 )
		keyline1:setAlpha( 0.7 )
		TabBar3:setAlpha( 1 )
		index:setRGB( 0, 0, 0 )
		index:setAlpha( 1 )
		keyline:setAlpha( 0.7 )
		schemaText:setAlpha( 0.8 )
		TabBar1:setAlpha( 1 )
		schemaKeyline:setAlpha( 0.7 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				local weaponFrame2 = function ( weapon, event )
					if not event.interrupted then
						weapon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
					end
					weapon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weapon, event )
					else
						weapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weapon:completeAnimation()
				self.weapon:setAlpha( 0 )
				weaponFrame2( weapon, {} )
				local keylineFrame2 = function ( keyline, event )
					if not event.interrupted then
						keyline:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Bounce )
					end
					keyline:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( keyline, event )
					else
						keyline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				keyline:setAlpha( 0 )
				keyline:registerEventHandler( "transition_complete_keyframe", keylineFrame2 )
				local weaponDescFrame2 = function ( weaponDesc, event )
					if not event.interrupted then
						weaponDesc:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
					end
					weaponDesc:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponDesc, event )
					else
						weaponDesc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponDesc:completeAnimation()
				self.weaponDesc:setAlpha( 0 )
				weaponDescFrame2( weaponDesc, {} )
				local schemaKeylineFrame2 = function ( schemaKeyline, event )
					if not event.interrupted then
						schemaKeyline:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
					end
					schemaKeyline:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( schemaKeyline, event )
					else
						schemaKeyline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				schemaKeyline:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				schemaKeyline:setAlpha( 0 )
				schemaKeyline:registerEventHandler( "transition_complete_keyframe", schemaKeylineFrame2 )
				local schemaTextFrame2 = function ( schemaText, event )
					if not event.interrupted then
						schemaText:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Bounce )
					end
					schemaText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( schemaText, event )
					else
						schemaText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				schemaText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				schemaText:setAlpha( 0 )
				schemaText:registerEventHandler( "transition_complete_keyframe", schemaTextFrame2 )
				local Border1Frame2 = function ( Border1, event )
					if not event.interrupted then
						Border1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					Border1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Border1, event )
					else
						Border1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Border1:completeAnimation()
				self.Border1:setAlpha( 0 )
				Border1Frame2( Border1, {} )
				local keyline1Frame2 = function ( keyline1, event )
					if not event.interrupted then
						keyline1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
					end
					keyline1:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( keyline1, event )
					else
						keyline1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				keyline1:setAlpha( 0 )
				keyline1:registerEventHandler( "transition_complete_keyframe", keyline1Frame2 )
				local keyline10Frame2 = function ( keyline10, event )
					if not event.interrupted then
						keyline10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
					end
					keyline10:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( keyline10, event )
					else
						keyline10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline10:completeAnimation()
				self.keyline10:setAlpha( 0 )
				keyline10Frame2( keyline10, {} )
				local TabBar3Frame2 = function ( TabBar3, event )
					if not event.interrupted then
						TabBar3:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
					end
					TabBar3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TabBar3, event )
					else
						TabBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBar3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				TabBar3:setAlpha( 0 )
				TabBar3:registerEventHandler( "transition_complete_keyframe", TabBar3Frame2 )
				local TabBar1Frame2 = function ( TabBar1, event )
					if not event.interrupted then
						TabBar1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					TabBar1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TabBar1, event )
					else
						TabBar1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBar1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				TabBar1:setAlpha( 0 )
				TabBar1:registerEventHandler( "transition_complete_keyframe", TabBar1Frame2 )
				local iconBorder00Frame2 = function ( iconBorder00, event )
					if not event.interrupted then
						iconBorder00:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					iconBorder00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( iconBorder00, event )
					else
						iconBorder00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconBorder00:completeAnimation()
				self.iconBorder00:setAlpha( 0 )
				iconBorder00Frame2( iconBorder00, {} )
				local Border0Frame2 = function ( Border0, event )
					if not event.interrupted then
						Border0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					Border0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Border0, event )
					else
						Border0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Border0:completeAnimation()
				self.Border0:setAlpha( 0 )
				Border0Frame2( Border0, {} )
				local schemaLabelFrame2 = function ( schemaLabel, event )
					if not event.interrupted then
						schemaLabel:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
					end
					schemaLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( schemaLabel, event )
					else
						schemaLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				schemaLabel:completeAnimation()
				self.schemaLabel:setAlpha( 0 )
				schemaLabelFrame2( schemaLabel, {} )
				local indexFrame2 = function ( index, event )
					local indexFrame3 = function ( index, event )
						if not event.interrupted then
							index:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Bounce )
						end
						index:setRGB( 0, 0, 0 )
						index:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( index, event )
						else
							index:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						indexFrame3( index, event )
						return 
					else
						index:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						index:setAlpha( 0.94 )
						index:registerEventHandler( "transition_complete_keyframe", indexFrame3 )
					end
				end
				
				index:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				index:setRGB( 0, 0, 0 )
				index:setAlpha( 0 )
				index:registerEventHandler( "transition_complete_keyframe", indexFrame2 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.weaponDesc:close()
		self.schemaText:close()
		self.Border1:close()
		self.TabBar3:close()
		self.TabBar1:close()
		self.iconBorder00:close()
		self.Border0:close()
		self.weapon:close()
		self.subImage:close()
		self.schemaLabel:close()
		self.index:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

