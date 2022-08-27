-- 62e402250563c52c43796d0663595278
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.verticalScrollingTextBox" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_TabBar" )

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
	self:setLeftRight( true, false, 0, 506 )
	self:setTopBottom( true, false, 0, 480 )
	self.anyChildUsesUpdateState = true
	
	local ability = LUI.UIImage.new()
	ability:setLeftRight( false, false, -252, -80.69 )
	ability:setTopBottom( true, false, -1, 169.13 )
	ability:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	ability:setShaderVector( 0, -0.33, 0, 0, 0 )
	ability:linkToElementModel( self, "abilityCardBackIcon", true, function ( model )
		local abilityCardBackIcon = Engine.GetModelValue( model )
		if abilityCardBackIcon then
			ability:setImage( RegisterImage( abilityCardBackIcon ) )
		end
	end )
	self:addElement( ability )
	self.ability = ability
	
	local keyline = LUI.UIImage.new()
	keyline:setLeftRight( true, true, 0, 0 )
	keyline:setTopBottom( true, false, 212.25, 213 )
	keyline:setRGB( 0.82, 0.98, 1 )
	keyline:setAlpha( 0.7 )
	self:addElement( keyline )
	self.keyline = keyline
	
	local abilityDesc = CoD.verticalScrollingTextBox.new( menu, controller )
	abilityDesc:setLeftRight( true, true, 8, -10 )
	abilityDesc:setTopBottom( true, false, 215, 275 )
	abilityDesc:setRGB( 0.82, 0.98, 1 )
	abilityDesc:setAlpha( 0.8 )
	abilityDesc.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	abilityDesc.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	abilityDesc:linkToElementModel( self, "abilityDesc", true, function ( model )
		local _abilityDesc = Engine.GetModelValue( model )
		if _abilityDesc then
			abilityDesc.textBox:setText( Engine.Localize( _abilityDesc ) )
		end
	end )
	self:addElement( abilityDesc )
	self.abilityDesc = abilityDesc
	
	local schemaKeyline = LUI.UIImage.new()
	schemaKeyline:setLeftRight( true, true, 0, 0 )
	schemaKeyline:setTopBottom( true, false, 306.25, 307 )
	schemaKeyline:setRGB( 0.82, 0.98, 1 )
	schemaKeyline:setAlpha( 0.7 )
	self:addElement( schemaKeyline )
	self.schemaKeyline = schemaKeyline
	
	local abilitySchema = CoD.verticalScrollingTextBox.new( menu, controller )
	abilitySchema:setLeftRight( true, true, 8, -10 )
	abilitySchema:setTopBottom( true, false, 309, 425 )
	abilitySchema:setRGB( 0.82, 0.98, 1 )
	abilitySchema:setAlpha( 0.8 )
	abilitySchema.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	abilitySchema.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	abilitySchema:linkToElementModel( self, "abilitySchema", true, function ( model )
		local _abilitySchema = Engine.GetModelValue( model )
		if _abilitySchema then
			abilitySchema.textBox:setText( Engine.Localize( _abilitySchema ) )
		end
	end )
	self:addElement( abilitySchema )
	self.abilitySchema = abilitySchema
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, -20, 5 )
	Image4:setTopBottom( false, false, -28.75, -25.75 )
	Image4:setRGB( 0.82, 0.98, 1 )
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
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -4, 21 )
	Image0:setTopBottom( false, false, 65.25, 68.25 )
	Image0:setRGB( 0.82, 0.98, 1 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -4, 21 )
	Image1:setTopBottom( false, false, 65.25, 68.25 )
	Image1:setRGB( 0.82, 0.98, 1 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -20, 5 )
	Image2:setTopBottom( false, false, 65.25, 68.25 )
	Image2:setRGB( 0.82, 0.98, 1 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, -20, 5 )
	Image3:setTopBottom( false, false, 65.25, 68.25 )
	Image3:setRGB( 0.82, 0.98, 1 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( false, true, -337.64, -333.64 )
	Image31:setTopBottom( false, true, -315.5, -311.5 )
	Image31:setRGB( 0.82, 0.98, 1 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image32 = LUI.UIImage.new()
	Image32:setLeftRight( false, true, -336.64, -332.64 )
	Image32:setTopBottom( false, true, -315.5, -311.5 )
	Image32:setRGB( 0.82, 0.98, 1 )
	Image32:setYRot( 180 )
	Image32:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image32:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image32 )
	self.Image32 = Image32
	
	local Image33 = LUI.UIImage.new()
	Image33:setLeftRight( false, true, -336.64, -332.64 )
	Image33:setTopBottom( false, true, -481, -477 )
	Image33:setRGB( 0.82, 0.98, 1 )
	Image33:setZRot( 180 )
	Image33:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image33:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image33 )
	self.Image33 = Image33
	
	local Image34 = LUI.UIImage.new()
	Image34:setLeftRight( false, true, -337.64, -333.64 )
	Image34:setTopBottom( false, true, -481, -477 )
	Image34:setRGB( 0.82, 0.98, 1 )
	Image34:setXRot( 180 )
	Image34:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image34:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image34 )
	self.Image34 = Image34
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( false, true, -507, -503 )
	Image12:setTopBottom( false, true, -315.5, -311.5 )
	Image12:setRGB( 0.82, 0.98, 1 )
	Image12:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local Image13 = LUI.UIImage.new()
	Image13:setLeftRight( false, true, -506, -502 )
	Image13:setTopBottom( false, true, -315.5, -311.5 )
	Image13:setRGB( 0.82, 0.98, 1 )
	Image13:setYRot( 180 )
	Image13:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image13 )
	self.Image13 = Image13
	
	local Image14 = LUI.UIImage.new()
	Image14:setLeftRight( false, true, -506, -502 )
	Image14:setTopBottom( false, true, -481, -477 )
	Image14:setRGB( 0.82, 0.98, 1 )
	Image14:setZRot( 180 )
	Image14:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image14:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image14 )
	self.Image14 = Image14
	
	local Image15 = LUI.UIImage.new()
	Image15:setLeftRight( false, true, -507, -503 )
	Image15:setTopBottom( false, true, -481, -477 )
	Image15:setRGB( 0.82, 0.98, 1 )
	Image15:setXRot( 180 )
	Image15:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image15 )
	self.Image15 = Image15
	
	local keyline1 = LUI.UIImage.new()
	keyline1:setLeftRight( true, true, -1, -1 )
	keyline1:setTopBottom( true, false, 167.25, 168 )
	keyline1:setRGB( 0.82, 0.98, 1 )
	keyline1:setAlpha( 0.7 )
	self:addElement( keyline1 )
	self.keyline1 = keyline1
	
	local keyline10 = LUI.UIImage.new()
	keyline10:setLeftRight( true, true, -1, -1 )
	keyline10:setTopBottom( true, false, 0.65, 0 )
	keyline10:setRGB( 0.82, 0.98, 1 )
	keyline10:setAlpha( 0.7 )
	self:addElement( keyline10 )
	self.keyline10 = keyline10
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, false, -20, 5 )
	Image8:setTopBottom( false, false, -73.88, -70.88 )
	Image8:setRGB( 0.82, 0.98, 1 )
	Image8:setZRot( 180 )
	Image8:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( true, false, -20, 5 )
	Image9:setTopBottom( false, false, -73.88, -70.88 )
	Image9:setRGB( 0.82, 0.98, 1 )
	Image9:setZRot( 180 )
	Image9:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, -20, 5 )
	Image10:setTopBottom( false, false, -242, -239 )
	Image10:setRGB( 0.82, 0.98, 1 )
	Image10:setZRot( 180 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Border1 = CoD.Border.new( menu, controller )
	Border1:setLeftRight( false, false, -253, -80.69 )
	Border1:setTopBottom( true, false, 0, 168 )
	Border1:setRGB( 0.82, 0.98, 1 )
	self:addElement( Border1 )
	self.Border1 = Border1
	
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
	schemaLabel:linkToElementModel( self, "abilitySchemaTitle", true, function ( model )
		local abilitySchemaTitle = Engine.GetModelValue( model )
		if abilitySchemaTitle then
			schemaLabel:setText( abilitySchemaTitle )
		end
	end )
	self:addElement( schemaLabel )
	self.schemaLabel = schemaLabel
	
	local index = LUI.UITightText.new()
	index:setLeftRight( true, false, 8, 208 )
	index:setTopBottom( true, false, 192, 212 )
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
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( true, false, -20, 5 )
	Image100:setTopBottom( false, false, -242, -239 )
	Image100:setRGB( 0.82, 0.98, 1 )
	Image100:setZRot( 180 )
	Image100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
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
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( false, true, -3, 1 )
	Image30:setTopBottom( false, true, -48.5, -44.5 )
	Image30:setRGB( 0.82, 0.98, 1 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image311 = LUI.UIImage.new()
	Image311:setLeftRight( false, true, -2, 2 )
	Image311:setTopBottom( false, true, -48.5, -44.5 )
	Image311:setRGB( 0.82, 0.98, 1 )
	Image311:setYRot( 180 )
	Image311:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image311:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image311 )
	self.Image311 = Image311
	
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
	
	local Image341 = LUI.UIImage.new()
	Image341:setLeftRight( false, true, -2, 2 )
	Image341:setTopBottom( false, true, -174.5, -170.5 )
	Image341:setRGB( 0.82, 0.98, 1 )
	Image341:setZRot( 180 )
	Image341:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image341:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image341 )
	self.Image341 = Image341
	
	local Image35 = LUI.UIImage.new()
	Image35:setLeftRight( false, true, -3, 1 )
	Image35:setTopBottom( false, true, -174.5, -170.5 )
	Image35:setRGB( 0.82, 0.98, 1 )
	Image35:setXRot( 180 )
	Image35:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image35:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image35 )
	self.Image35 = Image35
	
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
	
	local Image321 = LUI.UIImage.new()
	Image321:setLeftRight( false, true, -2, 2 )
	Image321:setTopBottom( false, true, -268.5, -264.5 )
	Image321:setRGB( 0.82, 0.98, 1 )
	Image321:setZRot( 180 )
	Image321:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image321:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image321 )
	self.Image321 = Image321
	
	local Image331 = LUI.UIImage.new()
	Image331:setLeftRight( false, true, -3, 1 )
	Image331:setTopBottom( false, true, -268.5, -264.5 )
	Image331:setRGB( 0.82, 0.98, 1 )
	Image331:setXRot( 180 )
	Image331:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image331:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image331 )
	self.Image331 = Image331
	
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				local f7_local1 = function ( f9_arg0, f9_arg1 )
					if not f9_arg1.interrupted then
						f9_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
					end
					f9_arg0:setAlpha( 0.7 )
					if f9_arg1.interrupted then
						self.clipFinished( f9_arg0, f9_arg1 )
					else
						f9_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				keyline:setAlpha( 0 )
				keyline:registerEventHandler( "transition_complete_keyframe", f7_local1 )
				local f7_local2 = function ( f10_arg0, f10_arg1 )
					if not f10_arg1.interrupted then
						f10_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
					end
					f10_arg0:setAlpha( 1 )
					if f10_arg1.interrupted then
						self.clipFinished( f10_arg0, f10_arg1 )
					else
						f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				abilityDesc:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				abilityDesc:setAlpha( 0 )
				abilityDesc:registerEventHandler( "transition_complete_keyframe", f7_local2 )
				local f7_local3 = function ( f11_arg0, f11_arg1 )
					if not f11_arg1.interrupted then
						f11_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
					end
					f11_arg0:setAlpha( 0.7 )
					if f11_arg1.interrupted then
						self.clipFinished( f11_arg0, f11_arg1 )
					else
						f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				schemaKeyline:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				schemaKeyline:setAlpha( 0 )
				schemaKeyline:registerEventHandler( "transition_complete_keyframe", f7_local3 )
				local f7_local4 = function ( f12_arg0, f12_arg1 )
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
				
				keyline1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				keyline1:setAlpha( 0 )
				keyline1:registerEventHandler( "transition_complete_keyframe", f7_local4 )
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
				local f7_local8 = function ( f16_arg0, f16_arg1 )
					if not f16_arg1.interrupted then
						f16_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					f16_arg0:setAlpha( 1 )
					if f16_arg1.interrupted then
						self.clipFinished( f16_arg0, f16_arg1 )
					else
						f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TabBar1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				TabBar1:setAlpha( 0 )
				TabBar1:registerEventHandler( "transition_complete_keyframe", f7_local8 )
				local f7_local9 = function ( f17_arg0, f17_arg1 )
					if not f17_arg1.interrupted then
						f17_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					f17_arg0:setAlpha( 1 )
					if f17_arg1.interrupted then
						self.clipFinished( f17_arg0, f17_arg1 )
					else
						f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				schemaLabel:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				schemaLabel:setAlpha( 0 )
				schemaLabel:registerEventHandler( "transition_complete_keyframe", f7_local9 )
				local f7_local10 = function ( f18_arg0, f18_arg1 )
					if not f18_arg1.interrupted then
						f18_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
					end
					f18_arg0:setAlpha( 1 )
					if f18_arg1.interrupted then
						self.clipFinished( f18_arg0, f18_arg1 )
					else
						f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				index:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				index:setAlpha( 0 )
				index:registerEventHandler( "transition_complete_keyframe", f7_local10 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.abilityDesc:close()
		element.abilitySchema:close()
		element.Border1:close()
		element.TabBar3:close()
		element.TabBar1:close()
		element.iconBorder00:close()
		element.Border0:close()
		element.ability:close()
		element.schemaLabel:close()
		element.index:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

