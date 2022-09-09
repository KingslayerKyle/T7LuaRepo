-- 76d3cdfed00d7690aa5365d6d41dfd17
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.verticalScrollingTextBox" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_TabBar" )

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
	self:setLeftRight( true, false, 0, 506 )
	self:setTopBottom( true, false, 0, 480 )
	self.anyChildUsesUpdateState = true
	
	local weapon = LUI.UIImage.new()
	weapon:setLeftRight( false, false, -252, -80.69 )
	weapon:setTopBottom( true, false, -1.18, 169.13 )
	weapon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	weapon:setShaderVector( 0, -0.33, 0, 0, 0 )
	weapon:linkToElementModel( self, "weaponCardBackIcon", true, function ( model )
		local weaponCardBackIcon = Engine.GetModelValue( model )
		if weaponCardBackIcon then
			weapon:setImage( RegisterImage( weaponCardBackIcon ) )
		end
	end )
	self:addElement( weapon )
	self.weapon = weapon
	
	local subImage = LUI.UIImage.new()
	subImage:setLeftRight( false, false, -21.5, 169 )
	subImage:setTopBottom( true, false, 46.77, 168 )
	subImage:setAlpha( 0 )
	subImage:linkToElementModel( self, "weaponCardBackSubIcon", true, function ( model )
		local weaponCardBackSubIcon = Engine.GetModelValue( model )
		if weaponCardBackSubIcon then
			subImage:setImage( RegisterImage( weaponCardBackSubIcon ) )
		end
	end )
	self:addElement( subImage )
	self.subImage = subImage
	
	local keyline = LUI.UIImage.new()
	keyline:setLeftRight( true, true, 0, 0 )
	keyline:setTopBottom( true, false, 212.25, 213 )
	keyline:setRGB( 0.82, 0.98, 1 )
	keyline:setAlpha( 0.7 )
	self:addElement( keyline )
	self.keyline = keyline
	
	local weaponDesc = CoD.verticalScrollingTextBox.new( menu, controller )
	weaponDesc:setLeftRight( true, true, 8, -10 )
	weaponDesc:setTopBottom( true, false, 215, 275 )
	weaponDesc:setRGB( 0.82, 0.98, 1 )
	weaponDesc:setAlpha( 0.8 )
	weaponDesc.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDesc.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDesc:linkToElementModel( self, "weaponDesc", true, function ( model )
		local _weaponDesc = Engine.GetModelValue( model )
		if _weaponDesc then
			weaponDesc.textBox:setText( Engine.Localize( _weaponDesc ) )
		end
	end )
	self:addElement( weaponDesc )
	self.weaponDesc = weaponDesc
	
	local schemaKeyline = LUI.UIImage.new()
	schemaKeyline:setLeftRight( true, true, 0, 0 )
	schemaKeyline:setTopBottom( true, false, 306.25, 307 )
	schemaKeyline:setRGB( 0.82, 0.98, 1 )
	schemaKeyline:setAlpha( 0.7 )
	self:addElement( schemaKeyline )
	self.schemaKeyline = schemaKeyline
	
	local schemaText = CoD.verticalScrollingTextBox.new( menu, controller )
	schemaText:setLeftRight( true, true, 8, -10 )
	schemaText:setTopBottom( true, false, 309, 430.5 )
	schemaText:setRGB( 0.82, 0.98, 1 )
	schemaText:setAlpha( 0.8 )
	schemaText.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	schemaText.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	schemaText:linkToElementModel( self, "weaponSchema", true, function ( model )
		local weaponSchema = Engine.GetModelValue( model )
		if weaponSchema then
			schemaText.textBox:setText( Engine.Localize( weaponSchema ) )
		end
	end )
	self:addElement( schemaText )
	self.schemaText = schemaText
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, -20, 5 )
	Image4:setTopBottom( false, false, -28.75, -25.75 )
	Image4:setRGB( 0.41, 0.76, 0.6 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, -20, 5 )
	Image5:setTopBottom( false, false, -28.75, -25.75 )
	Image5:setRGB( 0.82, 0.98, 1 )
	Image5:setZRot( 180 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( false, true, -4, 21 )
	Image6:setTopBottom( false, false, -28, -25 )
	Image6:setRGB( 0.82, 0.98, 1 )
	Image6:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( false, true, -4, 21 )
	Image7:setTopBottom( false, false, -28, -25 )
	Image7:setRGB( 0.82, 0.98, 1 )
	Image7:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, true, -4, 21 )
	Image2:setTopBottom( false, false, 66, 69 )
	Image2:setRGB( 0.82, 0.98, 1 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -4, 21 )
	Image3:setTopBottom( false, false, 66, 69 )
	Image3:setRGB( 0.82, 0.98, 1 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -20, 5 )
	Image0:setTopBottom( false, false, 65, 68 )
	Image0:setRGB( 0.82, 0.98, 1 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -20, 5 )
	Image1:setTopBottom( false, false, 65, 68 )
	Image1:setRGB( 0.82, 0.98, 1 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Border1 = CoD.Border.new( menu, controller )
	Border1:setLeftRight( false, false, -253, -80.69 )
	Border1:setTopBottom( true, false, 0, 168 )
	Border1:setRGB( 0.82, 0.98, 1 )
	self:addElement( Border1 )
	self.Border1 = Border1
	
	local Image22 = LUI.UIImage.new()
	Image22:setLeftRight( false, true, -507, -503 )
	Image22:setTopBottom( false, true, -315, -311 )
	Image22:setRGB( 0.82, 0.98, 1 )
	Image22:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image22:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image22 )
	self.Image22 = Image22
	
	local Image23 = LUI.UIImage.new()
	Image23:setLeftRight( false, true, -506, -502 )
	Image23:setTopBottom( false, true, -315, -311 )
	Image23:setRGB( 0.82, 0.98, 1 )
	Image23:setYRot( 180 )
	Image23:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image23:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image23 )
	self.Image23 = Image23
	
	local Image24 = LUI.UIImage.new()
	Image24:setLeftRight( false, true, -506, -502 )
	Image24:setTopBottom( false, true, -481, -477 )
	Image24:setRGB( 0.82, 0.98, 1 )
	Image24:setZRot( 180 )
	Image24:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image24:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image24 )
	self.Image24 = Image24
	
	local Image25 = LUI.UIImage.new()
	Image25:setLeftRight( false, true, -507, -503 )
	Image25:setTopBottom( false, true, -481, -477 )
	Image25:setRGB( 0.82, 0.98, 1 )
	Image25:setXRot( 180 )
	Image25:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image25:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image25 )
	self.Image25 = Image25
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( false, true, -335.69, -331.69 )
	Image8:setTopBottom( false, true, -315, -311 )
	Image8:setRGB( 0.82, 0.98, 1 )
	Image8:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( false, true, -334.69, -330.69 )
	Image9:setTopBottom( false, true, -315, -311 )
	Image9:setRGB( 0.82, 0.98, 1 )
	Image9:setYRot( 180 )
	Image9:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( false, true, -334.69, -330.69 )
	Image10:setTopBottom( false, true, -481, -477 )
	Image10:setRGB( 0.82, 0.98, 1 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( false, true, -335.69, -331.69 )
	Image11:setTopBottom( false, true, -481, -477 )
	Image11:setRGB( 0.82, 0.98, 1 )
	Image11:setXRot( 180 )
	Image11:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local keyline1 = LUI.UIImage.new()
	keyline1:setLeftRight( true, true, 0, 0 )
	keyline1:setTopBottom( true, false, 167.25, 168 )
	keyline1:setRGB( 0.82, 0.98, 1 )
	keyline1:setAlpha( 0.7 )
	self:addElement( keyline1 )
	self.keyline1 = keyline1
	
	local keyline10 = LUI.UIImage.new()
	keyline10:setLeftRight( true, true, 0, 0 )
	keyline10:setTopBottom( true, false, 0.65, 0 )
	keyline10:setRGB( 0.82, 0.98, 1 )
	keyline10:setAlpha( 0.7 )
	self:addElement( keyline10 )
	self.keyline10 = keyline10
	
	local Image18 = LUI.UIImage.new()
	Image18:setLeftRight( true, false, -20, 5 )
	Image18:setTopBottom( false, false, -73.88, -70.88 )
	Image18:setRGB( 0.82, 0.98, 1 )
	Image18:setZRot( 180 )
	Image18:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image18:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image18 )
	self.Image18 = Image18
	
	local Image19 = LUI.UIImage.new()
	Image19:setLeftRight( true, false, -20, 5 )
	Image19:setTopBottom( false, false, -73.88, -70.88 )
	Image19:setRGB( 0.82, 0.98, 1 )
	Image19:setZRot( 180 )
	Image19:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image19:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image19 )
	self.Image19 = Image19
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, -20, 5 )
	Image20:setTopBottom( false, false, -241.18, -238.18 )
	Image20:setRGB( 0.82, 0.98, 1 )
	Image20:setZRot( 180 )
	Image20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local Image21 = LUI.UIImage.new()
	Image21:setLeftRight( true, false, -20, 5 )
	Image21:setTopBottom( false, false, -241.18, -238.18 )
	Image21:setRGB( 0.82, 0.98, 1 )
	Image21:setZRot( 180 )
	Image21:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image21:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image21 )
	self.Image21 = Image21
	
	local TabBar3 = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	TabBar3:setLeftRight( true, false, -2, 508 )
	TabBar3:setTopBottom( true, false, 188.25, 216.25 )
	TabBar3:setRGB( 0.87, 0.99, 1 )
	self:addElement( TabBar3 )
	self.TabBar3 = TabBar3
	
	local TabBar1 = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	TabBar1:setLeftRight( true, false, -2, 508 )
	TabBar1:setTopBottom( true, false, 281.5, 309.5 )
	TabBar1:setRGB( 0.87, 0.99, 1 )
	self:addElement( TabBar1 )
	self.TabBar1 = TabBar1
	
	local iconBorder00 = CoD.Border.new( menu, controller )
	iconBorder00:setLeftRight( false, false, -254, 253 )
	iconBorder00:setTopBottom( false, false, -27.25, 38 )
	iconBorder00:setRGB( 0.87, 0.99, 1 )
	self:addElement( iconBorder00 )
	self.iconBorder00 = iconBorder00
	
	local Border0 = CoD.Border.new( menu, controller )
	Border0:setLeftRight( false, false, -254, 253 )
	Border0:setTopBottom( false, false, 66.3, 194.5 )
	Border0:setRGB( 0.87, 0.99, 1 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Image310 = LUI.UIImage.new()
	Image310:setLeftRight( false, true, -3, 1 )
	Image310:setTopBottom( false, true, -314.88, -310.88 )
	Image310:setRGB( 0.82, 0.98, 1 )
	Image310:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image310:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image310 )
	self.Image310 = Image310
	
	local Image320 = LUI.UIImage.new()
	Image320:setLeftRight( false, true, -2, 2 )
	Image320:setTopBottom( false, true, -314.88, -310.88 )
	Image320:setRGB( 0.82, 0.98, 1 )
	Image320:setYRot( 180 )
	Image320:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image320:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image320 )
	self.Image320 = Image320
	
	local Image330 = LUI.UIImage.new()
	Image330:setLeftRight( false, true, -2, 2 )
	Image330:setTopBottom( false, true, -480.5, -476.5 )
	Image330:setRGB( 0.82, 0.98, 1 )
	Image330:setZRot( 180 )
	Image330:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image330:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image330 )
	self.Image330 = Image330
	
	local Image340 = LUI.UIImage.new()
	Image340:setLeftRight( false, true, -3, 1 )
	Image340:setTopBottom( false, true, -480.5, -476.5 )
	Image340:setRGB( 0.82, 0.98, 1 )
	Image340:setXRot( 180 )
	Image340:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image340:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image340 )
	self.Image340 = Image340
	
	local Image28 = LUI.UIImage.new()
	Image28:setLeftRight( false, true, -3, 1 )
	Image28:setTopBottom( false, true, -205, -201 )
	Image28:setRGB( 0.82, 0.98, 1 )
	Image28:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image28:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image28 )
	self.Image28 = Image28
	
	local Image29 = LUI.UIImage.new()
	Image29:setLeftRight( false, true, -2, 2 )
	Image29:setTopBottom( false, true, -205, -201 )
	Image29:setRGB( 0.82, 0.98, 1 )
	Image29:setYRot( 180 )
	Image29:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image29:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image29 )
	self.Image29 = Image29
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( false, true, -3, 1 )
	Image30:setTopBottom( false, true, -48.5, -44.5 )
	Image30:setRGB( 0.82, 0.98, 1 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( false, true, -2, 2 )
	Image31:setTopBottom( false, true, -48.5, -44.5 )
	Image31:setRGB( 0.82, 0.98, 1 )
	Image31:setYRot( 180 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image32 = LUI.UIImage.new()
	Image32:setLeftRight( false, true, -2, 2 )
	Image32:setTopBottom( false, true, -268.5, -264.5 )
	Image32:setRGB( 0.82, 0.98, 1 )
	Image32:setZRot( 180 )
	Image32:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image32:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image32 )
	self.Image32 = Image32
	
	local Image33 = LUI.UIImage.new()
	Image33:setLeftRight( false, true, -3, 1 )
	Image33:setTopBottom( false, true, -268.5, -264.5 )
	Image33:setRGB( 0.82, 0.98, 1 )
	Image33:setXRot( 180 )
	Image33:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image33:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image33 )
	self.Image33 = Image33
	
	local Image34 = LUI.UIImage.new()
	Image34:setLeftRight( false, true, -2, 2 )
	Image34:setTopBottom( false, true, -174.5, -170.5 )
	Image34:setRGB( 0.82, 0.98, 1 )
	Image34:setZRot( 180 )
	Image34:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image34:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image34 )
	self.Image34 = Image34
	
	local Image35 = LUI.UIImage.new()
	Image35:setLeftRight( false, true, -3, 1 )
	Image35:setTopBottom( false, true, -174.5, -170.5 )
	Image35:setRGB( 0.82, 0.98, 1 )
	Image35:setXRot( 180 )
	Image35:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image35:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image35 )
	self.Image35 = Image35
	
	local Image36 = LUI.UIImage.new()
	Image36:setLeftRight( false, true, -507, -503 )
	Image36:setTopBottom( false, true, -269, -265 )
	Image36:setRGB( 0.82, 0.98, 1 )
	Image36:setZRot( 180 )
	Image36:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image36:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image36 )
	self.Image36 = Image36
	
	local Image37 = LUI.UIImage.new()
	Image37:setLeftRight( false, true, -508, -504 )
	Image37:setTopBottom( false, true, -269, -265 )
	Image37:setRGB( 0.82, 0.98, 1 )
	Image37:setXRot( 180 )
	Image37:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image37:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image37 )
	self.Image37 = Image37
	
	local Image38 = LUI.UIImage.new()
	Image38:setLeftRight( false, true, -508, -504 )
	Image38:setTopBottom( false, true, -205, -201 )
	Image38:setRGB( 0.82, 0.98, 1 )
	Image38:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image38:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image38 )
	self.Image38 = Image38
	
	local Image39 = LUI.UIImage.new()
	Image39:setLeftRight( false, true, -507, -503 )
	Image39:setTopBottom( false, true, -205, -201 )
	Image39:setRGB( 0.82, 0.98, 1 )
	Image39:setYRot( 180 )
	Image39:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image39:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image39 )
	self.Image39 = Image39
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( false, true, -507, -503 )
	Image40:setTopBottom( false, true, -174.5, -170.5 )
	Image40:setRGB( 0.82, 0.98, 1 )
	Image40:setZRot( 180 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( false, true, -508, -504 )
	Image41:setTopBottom( false, true, -174.5, -170.5 )
	Image41:setRGB( 0.82, 0.98, 1 )
	Image41:setXRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local Image42 = LUI.UIImage.new()
	Image42:setLeftRight( false, true, -508, -504 )
	Image42:setTopBottom( false, true, -48.5, -44.5 )
	Image42:setRGB( 0.82, 0.98, 1 )
	Image42:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image42:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image42 )
	self.Image42 = Image42
	
	local Image43 = LUI.UIImage.new()
	Image43:setLeftRight( false, true, -507, -503 )
	Image43:setTopBottom( false, true, -48.5, -44.5 )
	Image43:setRGB( 0.82, 0.98, 1 )
	Image43:setYRot( 180 )
	Image43:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image43:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image43 )
	self.Image43 = Image43
	
	local schemaLabel = LUI.UITightText.new()
	schemaLabel:setLeftRight( true, false, 8, 208 )
	schemaLabel:setTopBottom( true, false, 286, 306 )
	schemaLabel:setRGB( 0, 0, 0 )
	schemaLabel:setTTF( "fonts/escom.ttf" )
	schemaLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	schemaLabel:setShaderVector( 0, 0.05, 0, 0, 0 )
	schemaLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	schemaLabel:setShaderVector( 2, 1, 0, 0, 0 )
	schemaLabel:setLetterSpacing( 1 )
	schemaLabel:linkToElementModel( self, "weaponSchemaTitle", true, function ( model )
		local weaponSchemaTitle = Engine.GetModelValue( model )
		if weaponSchemaTitle then
			schemaLabel:setText( weaponSchemaTitle )
		end
	end )
	self:addElement( schemaLabel )
	self.schemaLabel = schemaLabel
	
	local index = LUI.UITightText.new()
	index:setLeftRight( true, false, 8, 208 )
	index:setTopBottom( true, false, 193, 213 )
	index:setRGB( 0, 0, 0 )
	index:setTTF( "fonts/escom.ttf" )
	index:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	index:setShaderVector( 0, 0.05, 0, 0, 0 )
	index:setShaderVector( 1, 0.02, 0, 0, 0 )
	index:setShaderVector( 2, 1, 0, 0, 0 )
	index:setLetterSpacing( 1 )
	index:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			index:setText( text )
		end
	end )
	self:addElement( index )
	self.index = index
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				local f8_local1 = function ( f10_arg0, f10_arg1 )
					if not f10_arg1.interrupted then
						f10_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Bounce )
					end
					f10_arg0:setAlpha( 0.7 )
					if f10_arg1.interrupted then
						self.clipFinished( f10_arg0, f10_arg1 )
					else
						f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				keyline:setAlpha( 0 )
				keyline:registerEventHandler( "transition_complete_keyframe", f8_local1 )
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
				local f8_local3 = function ( f12_arg0, f12_arg1 )
					if not f12_arg1.interrupted then
						f12_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
					end
					f12_arg0:setAlpha( 0.7 )
					if f12_arg1.interrupted then
						self.clipFinished( f12_arg0, f12_arg1 )
					else
						f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				schemaKeyline:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				schemaKeyline:setAlpha( 0 )
				schemaKeyline:registerEventHandler( "transition_complete_keyframe", f8_local3 )
				local f8_local4 = function ( f13_arg0, f13_arg1 )
					if not f13_arg1.interrupted then
						f13_arg0:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Bounce )
					end
					f13_arg0:setAlpha( 1 )
					if f13_arg1.interrupted then
						self.clipFinished( f13_arg0, f13_arg1 )
					else
						f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				schemaText:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				schemaText:setAlpha( 0 )
				schemaText:registerEventHandler( "transition_complete_keyframe", f8_local4 )
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
				local f8_local6 = function ( f15_arg0, f15_arg1 )
					if not f15_arg1.interrupted then
						f15_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
					end
					f15_arg0:setAlpha( 0.7 )
					if f15_arg1.interrupted then
						self.clipFinished( f15_arg0, f15_arg1 )
					else
						f15_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				keyline1:setAlpha( 0 )
				keyline1:registerEventHandler( "transition_complete_keyframe", f8_local6 )
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
				local f8_local8 = function ( f17_arg0, f17_arg1 )
					if not f17_arg1.interrupted then
						f17_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
					end
					f17_arg0:setAlpha( 1 )
					if f17_arg1.interrupted then
						self.clipFinished( f17_arg0, f17_arg1 )
					else
						f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBar3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				TabBar3:setAlpha( 0 )
				TabBar3:registerEventHandler( "transition_complete_keyframe", f8_local8 )
				local f8_local9 = function ( f18_arg0, f18_arg1 )
					if not f18_arg1.interrupted then
						f18_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					f18_arg0:setAlpha( 1 )
					if f18_arg1.interrupted then
						self.clipFinished( f18_arg0, f18_arg1 )
					else
						f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBar1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				TabBar1:setAlpha( 0 )
				TabBar1:registerEventHandler( "transition_complete_keyframe", f8_local9 )
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
				local f8_local13 = function ( f22_arg0, f22_arg1 )
					local f22_local0 = function ( f23_arg0, f23_arg1 )
						if not f23_arg1.interrupted then
							f23_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Bounce )
						end
						f23_arg0:setRGB( 0, 0, 0 )
						f23_arg0:setAlpha( 1 )
						if f23_arg1.interrupted then
							self.clipFinished( f23_arg0, f23_arg1 )
						else
							f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f22_arg1.interrupted then
						f22_local0( f22_arg0, f22_arg1 )
						return 
					else
						f22_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						f22_arg0:setAlpha( 0.94 )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
					end
				end
				
				index:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				index:setRGB( 0, 0, 0 )
				index:setAlpha( 0 )
				index:registerEventHandler( "transition_complete_keyframe", f8_local13 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weaponDesc:close()
		element.schemaText:close()
		element.Border1:close()
		element.TabBar3:close()
		element.TabBar1:close()
		element.iconBorder00:close()
		element.Border0:close()
		element.weapon:close()
		element.subImage:close()
		element.schemaLabel:close()
		element.index:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
