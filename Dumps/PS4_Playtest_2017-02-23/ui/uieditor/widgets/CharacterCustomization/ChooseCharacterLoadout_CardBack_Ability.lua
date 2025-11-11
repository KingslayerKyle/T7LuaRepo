require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_TabBar" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )

CoD.ChooseCharacterLoadout_CardBack_Ability = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_Ability.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_Ability )
	self.id = "ChooseCharacterLoadout_CardBack_Ability"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 759 )
	self:setTopBottom( 0, 0, 0, 720 )
	
	local ability = LUI.UIImage.new()
	ability:setLeftRight( 0.5, 0.5, -378, -121 )
	ability:setTopBottom( 0, 0, -1, 254 )
	ability:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	ability:setShaderVector( 0, -0.33, 0, 0, 0 )
	ability:linkToElementModel( self, "abilityCardBackIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ability:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ability )
	self.ability = ability
	
	local keyline = LUI.UIImage.new()
	keyline:setLeftRight( 0, 1, 0, 0 )
	keyline:setTopBottom( 0, 0, 318, 319 )
	keyline:setRGB( 0.82, 0.98, 1 )
	keyline:setAlpha( 0.7 )
	self:addElement( keyline )
	self.keyline = keyline
	
	local abilityDesc = CoD.verticalScrollingTextBox.new( menu, controller )
	abilityDesc:setLeftRight( 0, 1, 12, -16 )
	abilityDesc:setTopBottom( 0, 0, 323, 413 )
	abilityDesc:setRGB( 0.82, 0.98, 1 )
	abilityDesc:setAlpha( 0.8 )
	abilityDesc.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	abilityDesc.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	abilityDesc:linkToElementModel( self, "abilityDesc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			abilityDesc.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( abilityDesc )
	self.abilityDesc = abilityDesc
	
	local schemaKeyline = LUI.UIImage.new()
	schemaKeyline:setLeftRight( 0, 1, 0, 0 )
	schemaKeyline:setTopBottom( 0, 0, 459, 460 )
	schemaKeyline:setRGB( 0.82, 0.98, 1 )
	schemaKeyline:setAlpha( 0.7 )
	self:addElement( schemaKeyline )
	self.schemaKeyline = schemaKeyline
	
	local abilitySchema = CoD.verticalScrollingTextBox.new( menu, controller )
	abilitySchema:setLeftRight( 0, 1, 12, -16 )
	abilitySchema:setTopBottom( 0, 0, 463, 637 )
	abilitySchema:setRGB( 0.82, 0.98, 1 )
	abilitySchema:setAlpha( 0.8 )
	abilitySchema.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	abilitySchema.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	abilitySchema:linkToElementModel( self, "abilitySchema", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			abilitySchema.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( abilitySchema )
	self.abilitySchema = abilitySchema
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, -30, 8 )
	Image4:setTopBottom( 0.5, 0.5, -43, -39 )
	Image4:setRGB( 0.82, 0.98, 1 )
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
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 1, 1, -6, 32 )
	Image0:setTopBottom( 0.5, 0.5, 98, 102 )
	Image0:setRGB( 0.82, 0.98, 1 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 1, 1, -6, 32 )
	Image1:setTopBottom( 0.5, 0.5, 98, 102 )
	Image1:setRGB( 0.82, 0.98, 1 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, -30, 8 )
	Image2:setTopBottom( 0.5, 0.5, 98, 102 )
	Image2:setRGB( 0.82, 0.98, 1 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, -30, 8 )
	Image3:setTopBottom( 0.5, 0.5, 98, 102 )
	Image3:setRGB( 0.82, 0.98, 1 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( 1, 1, -506, -500 )
	Image31:setTopBottom( 1, 1, -473, -467 )
	Image31:setRGB( 0.82, 0.98, 1 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image32 = LUI.UIImage.new()
	Image32:setLeftRight( 1, 1, -505, -499 )
	Image32:setTopBottom( 1, 1, -473, -467 )
	Image32:setRGB( 0.82, 0.98, 1 )
	Image32:setYRot( 180 )
	Image32:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image32:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image32 )
	self.Image32 = Image32
	
	local Image33 = LUI.UIImage.new()
	Image33:setLeftRight( 1, 1, -505, -499 )
	Image33:setTopBottom( 1, 1, -721, -715 )
	Image33:setRGB( 0.82, 0.98, 1 )
	Image33:setZRot( 180 )
	Image33:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image33:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image33 )
	self.Image33 = Image33
	
	local Image34 = LUI.UIImage.new()
	Image34:setLeftRight( 1, 1, -506, -500 )
	Image34:setTopBottom( 1, 1, -721, -715 )
	Image34:setRGB( 0.82, 0.98, 1 )
	Image34:setXRot( 180 )
	Image34:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image34:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image34 )
	self.Image34 = Image34
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( 1, 1, -761, -755 )
	Image12:setTopBottom( 1, 1, -473, -467 )
	Image12:setRGB( 0.82, 0.98, 1 )
	Image12:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local Image13 = LUI.UIImage.new()
	Image13:setLeftRight( 1, 1, -759, -753 )
	Image13:setTopBottom( 1, 1, -473, -467 )
	Image13:setRGB( 0.82, 0.98, 1 )
	Image13:setYRot( 180 )
	Image13:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image13 )
	self.Image13 = Image13
	
	local Image14 = LUI.UIImage.new()
	Image14:setLeftRight( 1, 1, -759, -753 )
	Image14:setTopBottom( 1, 1, -721, -715 )
	Image14:setRGB( 0.82, 0.98, 1 )
	Image14:setZRot( 180 )
	Image14:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image14:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image14 )
	self.Image14 = Image14
	
	local Image15 = LUI.UIImage.new()
	Image15:setLeftRight( 1, 1, -761, -755 )
	Image15:setTopBottom( 1, 1, -721, -715 )
	Image15:setRGB( 0.82, 0.98, 1 )
	Image15:setXRot( 180 )
	Image15:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image15 )
	self.Image15 = Image15
	
	local keyline1 = LUI.UIImage.new()
	keyline1:setLeftRight( 0, 1, -2, -2 )
	keyline1:setTopBottom( 0, 0, 251, 252 )
	keyline1:setRGB( 0.82, 0.98, 1 )
	keyline1:setAlpha( 0.7 )
	self:addElement( keyline1 )
	self.keyline1 = keyline1
	
	local keyline10 = LUI.UIImage.new()
	keyline10:setLeftRight( 0, 1, -2, -2 )
	keyline10:setTopBottom( 0, 0, 0.5, -0.5 )
	keyline10:setRGB( 0.82, 0.98, 1 )
	keyline10:setAlpha( 0.7 )
	self:addElement( keyline10 )
	self.keyline10 = keyline10
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( 0, 0, -30, 8 )
	Image8:setTopBottom( 0.5, 0.5, -111, -107 )
	Image8:setRGB( 0.82, 0.98, 1 )
	Image8:setZRot( 180 )
	Image8:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( 0, 0, -30, 8 )
	Image9:setTopBottom( 0.5, 0.5, -111, -107 )
	Image9:setRGB( 0.82, 0.98, 1 )
	Image9:setZRot( 180 )
	Image9:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0, 0, -30, 8 )
	Image10:setTopBottom( 0.5, 0.5, -363, -359 )
	Image10:setRGB( 0.82, 0.98, 1 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Border1 = CoD.Border.new( menu, controller )
	Border1:setLeftRight( 0.5, 0.5, -379, -121 )
	Border1:setTopBottom( 0, 0, 0, 252 )
	Border1:setRGB( 0.82, 0.98, 1 )
	self:addElement( Border1 )
	self.Border1 = Border1
	
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
	schemaLabel:linkToElementModel( self, "abilitySchemaTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			schemaLabel:setText( modelValue )
		end
	end )
	self:addElement( schemaLabel )
	self.schemaLabel = schemaLabel
	
	local index = LUI.UITightText.new()
	index:setLeftRight( 0, 0, 12, 312 )
	index:setTopBottom( 0, 0, 288, 318 )
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
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( 0, 0, -30, 8 )
	Image100:setTopBottom( 0.5, 0.5, -363, -359 )
	Image100:setRGB( 0.82, 0.98, 1 )
	Image100:setZRot( 180 )
	Image100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
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
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 1, 1, -5, 1 )
	Image30:setTopBottom( 1, 1, -73, -67 )
	Image30:setRGB( 0.82, 0.98, 1 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image311 = LUI.UIImage.new()
	Image311:setLeftRight( 1, 1, -3, 3 )
	Image311:setTopBottom( 1, 1, -73, -67 )
	Image311:setRGB( 0.82, 0.98, 1 )
	Image311:setYRot( 180 )
	Image311:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image311:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image311 )
	self.Image311 = Image311
	
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
	
	local Image341 = LUI.UIImage.new()
	Image341:setLeftRight( 1, 1, -3, 3 )
	Image341:setTopBottom( 1, 1, -262, -256 )
	Image341:setRGB( 0.82, 0.98, 1 )
	Image341:setZRot( 180 )
	Image341:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image341:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image341 )
	self.Image341 = Image341
	
	local Image35 = LUI.UIImage.new()
	Image35:setLeftRight( 1, 1, -5, 1 )
	Image35:setTopBottom( 1, 1, -262, -256 )
	Image35:setRGB( 0.82, 0.98, 1 )
	Image35:setXRot( 180 )
	Image35:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image35:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image35 )
	self.Image35 = Image35
	
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
	
	local Image321 = LUI.UIImage.new()
	Image321:setLeftRight( 1, 1, -3, 3 )
	Image321:setTopBottom( 1, 1, -403, -397 )
	Image321:setRGB( 0.82, 0.98, 1 )
	Image321:setZRot( 180 )
	Image321:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image321:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image321 )
	self.Image321 = Image321
	
	local Image331 = LUI.UIImage.new()
	Image331:setLeftRight( 1, 1, -5, 1 )
	Image331:setTopBottom( 1, 1, -403, -397 )
	Image331:setRGB( 0.82, 0.98, 1 )
	Image331:setXRot( 180 )
	Image331:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image331:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image331 )
	self.Image331 = Image331
	
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
	
	self.resetProperties = function ()
		ability:completeAnimation()
		keyline10:completeAnimation()
		Border1:completeAnimation()
		iconBorder00:completeAnimation()
		Border0:completeAnimation()
		TabBar3:completeAnimation()
		index:completeAnimation()
		abilityDesc:completeAnimation()
		keyline1:completeAnimation()
		TabBar1:completeAnimation()
		schemaLabel:completeAnimation()
		keyline:completeAnimation()
		schemaKeyline:completeAnimation()
		ability:setAlpha( 1 )
		keyline10:setAlpha( 0.7 )
		Border1:setAlpha( 1 )
		iconBorder00:setAlpha( 1 )
		Border0:setAlpha( 1 )
		TabBar3:setAlpha( 1 )
		index:setAlpha( 1 )
		abilityDesc:setAlpha( 0.8 )
		keyline1:setAlpha( 0.7 )
		TabBar1:setAlpha( 1 )
		schemaLabel:setAlpha( 1 )
		keyline:setAlpha( 0.7 )
		schemaKeyline:setAlpha( 0.7 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				local abilityFrame2 = function ( ability, event )
					if not event.interrupted then
						ability:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					ability:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ability, event )
					else
						ability:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ability:completeAnimation()
				self.ability:setAlpha( 0 )
				abilityFrame2( ability, {} )
				local keylineFrame2 = function ( keyline, event )
					if not event.interrupted then
						keyline:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
					end
					keyline:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( keyline, event )
					else
						keyline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				keyline:setAlpha( 0 )
				keyline:registerEventHandler( "transition_complete_keyframe", keylineFrame2 )
				local abilityDescFrame2 = function ( abilityDesc, event )
					if not event.interrupted then
						abilityDesc:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
					end
					abilityDesc:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( abilityDesc, event )
					else
						abilityDesc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				abilityDesc:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				abilityDesc:setAlpha( 0 )
				abilityDesc:registerEventHandler( "transition_complete_keyframe", abilityDescFrame2 )
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
				
				schemaKeyline:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				schemaKeyline:setAlpha( 0 )
				schemaKeyline:registerEventHandler( "transition_complete_keyframe", schemaKeylineFrame2 )
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
				
				keyline1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				keyline1:setAlpha( 0 )
				keyline1:registerEventHandler( "transition_complete_keyframe", keyline1Frame2 )
				local keyline10Frame2 = function ( keyline10, event )
					if not event.interrupted then
						keyline10:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
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
				local Border1Frame2 = function ( Border1, event )
					if not event.interrupted then
						Border1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
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
				local TabBar3Frame2 = function ( TabBar3, event )
					if not event.interrupted then
						TabBar3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					TabBar3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TabBar3, event )
					else
						TabBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBar3:completeAnimation()
				self.TabBar3:setAlpha( 0 )
				TabBar3Frame2( TabBar3, {} )
				local TabBar1Frame2 = function ( TabBar1, event )
					if not event.interrupted then
						TabBar1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					TabBar1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TabBar1, event )
					else
						TabBar1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBar1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				TabBar1:setAlpha( 0 )
				TabBar1:registerEventHandler( "transition_complete_keyframe", TabBar1Frame2 )
				local schemaLabelFrame2 = function ( schemaLabel, event )
					if not event.interrupted then
						schemaLabel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					schemaLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( schemaLabel, event )
					else
						schemaLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				schemaLabel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				schemaLabel:setAlpha( 0 )
				schemaLabel:registerEventHandler( "transition_complete_keyframe", schemaLabelFrame2 )
				local indexFrame2 = function ( index, event )
					if not event.interrupted then
						index:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
					end
					index:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( index, event )
					else
						index:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				index:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				index:setAlpha( 0 )
				index:registerEventHandler( "transition_complete_keyframe", indexFrame2 )
				local iconBorder00Frame2 = function ( iconBorder00, event )
					if not event.interrupted then
						iconBorder00:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
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
						Border0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
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
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.abilityDesc:close()
		self.abilitySchema:close()
		self.Border1:close()
		self.TabBar3:close()
		self.TabBar1:close()
		self.iconBorder00:close()
		self.Border0:close()
		self.ability:close()
		self.schemaLabel:close()
		self.index:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

