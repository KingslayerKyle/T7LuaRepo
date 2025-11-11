require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_TabBar" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )

CoD.ChooseCharacterLoadout_CardBack_Bio = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_Bio.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_Bio )
	self.id = "ChooseCharacterLoadout_CardBack_Bio"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 759 )
	self:setTopBottom( 0, 0, 0, 664 )
	
	local BlackGradient = LUI.UIImage.new()
	BlackGradient:setLeftRight( 0, 1, 0, 0 )
	BlackGradient:setTopBottom( 1, 1, -122, 0 )
	BlackGradient:setAlpha( 0.9 )
	BlackGradient:setImage( RegisterImage( "uie_t7_hud_hero_cardback_gradient" ) )
	self:addElement( BlackGradient )
	self.BlackGradient = BlackGradient
	
	local face = LUI.UIImage.new()
	face:setLeftRight( 0, 0, 0, 192 )
	face:setTopBottom( 0, 0, 0, 108 )
	face:linkToElementModel( self, "cardBackIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			face:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( face )
	self.face = face
	
	local nameTitle = LUI.UITightText.new()
	nameTitle:setLeftRight( 0, 0, 214, 514 )
	nameTitle:setTopBottom( 0, 0, 21, 51 )
	nameTitle:setRGB( 0.82, 0.98, 1 )
	nameTitle:setAlpha( 0.8 )
	nameTitle:setText( Engine.Localize( "HEROES_NAME" ) )
	nameTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( nameTitle )
	self.nameTitle = nameTitle
	
	local genderTitle = LUI.UITightText.new()
	genderTitle:setLeftRight( 0, 0, 214, 276 )
	genderTitle:setTopBottom( 0, 0, 57, 87 )
	genderTitle:setRGB( 0.82, 0.98, 1 )
	genderTitle:setAlpha( 0.8 )
	genderTitle:setText( Engine.Localize( "HEROES_GENDER" ) )
	genderTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( genderTitle )
	self.genderTitle = genderTitle
	
	local name = LUI.UITightText.new()
	name:setLeftRight( 0, 0, 356, 406 )
	name:setTopBottom( 0, 0, 21, 51 )
	name:setRGB( 0.82, 0.98, 1 )
	name:setAlpha( 0.8 )
	name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	name:linkToElementModel( self, "realName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( name )
	self.name = name
	
	local gender = LUI.UITightText.new()
	gender:setLeftRight( 0, 0, 356, 418 )
	gender:setTopBottom( 0, 0, 57, 87 )
	gender:setRGB( 0.82, 0.98, 1 )
	gender:setAlpha( 0.8 )
	gender:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	gender:linkToElementModel( self, "genderString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gender:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( gender )
	self.gender = gender
	
	local keyline = LUI.UIImage.new()
	keyline:setLeftRight( 0, 1, 8, 8 )
	keyline:setTopBottom( 0, 0, 164, 165 )
	keyline:setRGB( 0.82, 0.98, 1 )
	keyline:setAlpha( 0.7 )
	self:addElement( keyline )
	self.keyline = keyline
	
	local verticalScrollingTextBox0 = CoD.verticalScrollingTextBox.new( menu, controller )
	verticalScrollingTextBox0:setLeftRight( 0, 0, 11, 743 )
	verticalScrollingTextBox0:setTopBottom( 0, 0, 170, 649 )
	verticalScrollingTextBox0:setRGB( 0.82, 0.98, 1 )
	verticalScrollingTextBox0:setAlpha( 0.8 )
	verticalScrollingTextBox0.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	verticalScrollingTextBox0.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	verticalScrollingTextBox0:linkToElementModel( self, "bio", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			verticalScrollingTextBox0.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( verticalScrollingTextBox0 )
	self.verticalScrollingTextBox0 = verticalScrollingTextBox0
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, -30, 8 )
	Image2:setTopBottom( 0.5, 0.5, -171, -167 )
	Image2:setRGB( 0.82, 0.98, 1 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, -30, 8 )
	Image0:setTopBottom( 0.5, 0.5, 330, 334 )
	Image0:setRGB( 0.82, 0.98, 1 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, -30, 8 )
	Image1:setTopBottom( 0.5, 0.5, 330, 334 )
	Image1:setRGB( 0.82, 0.98, 1 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, -30, 8 )
	Image3:setTopBottom( 0.5, 0.5, -228, -224 )
	Image3:setRGB( 0.82, 0.98, 1 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 0, 0, -30, 8 )
	Image30:setTopBottom( 0.5, 0.5, -228, -224 )
	Image30:setRGB( 0.82, 0.98, 1 )
	Image30:setZRot( 180 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, -30, 8 )
	Image4:setTopBottom( 0.5, 0.5, -333, -329 )
	Image4:setRGB( 0.82, 0.98, 1 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( 0, 0, -30, 8 )
	Image5:setTopBottom( 0.5, 0.5, -334, -330 )
	Image5:setRGB( 0.82, 0.98, 1 )
	Image5:setZRot( 180 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( 0, 0, -30, 8 )
	Image20:setTopBottom( 0.5, 0.5, -171, -167 )
	Image20:setRGB( 0.82, 0.98, 1 )
	Image20:setZRot( 180 )
	Image20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local keyline1 = LUI.UIImage.new()
	keyline1:setLeftRight( 0, 1, 0, 0 )
	keyline1:setTopBottom( 0, 0, 107, 108 )
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
	
	local Border10 = CoD.Border.new( menu, controller )
	Border10:setLeftRight( 0, 0, -2, 192 )
	Border10:setTopBottom( 0, 0, 0, 107 )
	Border10:setRGB( 0.82, 0.98, 1 )
	self:addElement( Border10 )
	self.Border10 = Border10
	
	local Image94 = LUI.UIImage.new()
	Image94:setLeftRight( 1, 1, -571, -565 )
	Image94:setTopBottom( 1, 1, -562, -556 )
	Image94:setRGB( 0.82, 0.98, 1 )
	Image94:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image94:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image94 )
	self.Image94 = Image94
	
	local Image14 = LUI.UIImage.new()
	Image14:setLeftRight( 1, 1, -570, -564 )
	Image14:setTopBottom( 1, 1, -562, -556 )
	Image14:setRGB( 0.82, 0.98, 1 )
	Image14:setYRot( 180 )
	Image14:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image14:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image14 )
	self.Image14 = Image14
	
	local Image15 = LUI.UIImage.new()
	Image15:setLeftRight( 1, 1, -570, -564 )
	Image15:setTopBottom( 1, 1, -666, -660 )
	Image15:setRGB( 0.82, 0.98, 1 )
	Image15:setZRot( 180 )
	Image15:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image15 )
	self.Image15 = Image15
	
	local Image16 = LUI.UIImage.new()
	Image16:setLeftRight( 1, 1, -571, -565 )
	Image16:setTopBottom( 1, 1, -666, -660 )
	Image16:setRGB( 0.82, 0.98, 1 )
	Image16:setXRot( 180 )
	Image16:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image16:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image16 )
	self.Image16 = Image16
	
	local Image17 = LUI.UIImage.new()
	Image17:setLeftRight( 1, 1, -426, -420 )
	Image17:setTopBottom( 1, 1, -562, -556 )
	Image17:setRGB( 0.82, 0.98, 1 )
	Image17:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image17:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image17 )
	self.Image17 = Image17
	
	local Image18 = LUI.UIImage.new()
	Image18:setLeftRight( 1, 1, -425, -419 )
	Image18:setTopBottom( 1, 1, -562, -556 )
	Image18:setRGB( 0.82, 0.98, 1 )
	Image18:setYRot( 180 )
	Image18:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image18:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image18 )
	self.Image18 = Image18
	
	local Image19 = LUI.UIImage.new()
	Image19:setLeftRight( 1, 1, -426, -420 )
	Image19:setTopBottom( 1, 1, -666, -660 )
	Image19:setRGB( 0.82, 0.98, 1 )
	Image19:setZRot( 180 )
	Image19:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image19:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image19 )
	self.Image19 = Image19
	
	local Image21 = LUI.UIImage.new()
	Image21:setLeftRight( 1, 1, -427, -421 )
	Image21:setTopBottom( 1, 1, -666, -660 )
	Image21:setRGB( 0.82, 0.98, 1 )
	Image21:setXRot( 180 )
	Image21:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image21 )
	self.Image21 = Image21
	
	local Image22 = LUI.UIImage.new()
	Image22:setLeftRight( 1, 1, -762, -756 )
	Image22:setTopBottom( 1, 1, -562, -556 )
	Image22:setRGB( 0.82, 0.98, 1 )
	Image22:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image22:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image22 )
	self.Image22 = Image22
	
	local Image23 = LUI.UIImage.new()
	Image23:setLeftRight( 1, 1, -761, -755 )
	Image23:setTopBottom( 1, 1, -562, -556 )
	Image23:setRGB( 0.82, 0.98, 1 )
	Image23:setYRot( 180 )
	Image23:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image23:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image23 )
	self.Image23 = Image23
	
	local Image24 = LUI.UIImage.new()
	Image24:setLeftRight( 1, 1, -761, -755 )
	Image24:setTopBottom( 1, 1, -666, -660 )
	Image24:setRGB( 0.82, 0.98, 1 )
	Image24:setZRot( 180 )
	Image24:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image24:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image24 )
	self.Image24 = Image24
	
	local Image25 = LUI.UIImage.new()
	Image25:setLeftRight( 1, 1, -763, -757 )
	Image25:setTopBottom( 1, 1, -666, -660 )
	Image25:setRGB( 0.82, 0.98, 1 )
	Image25:setXRot( 180 )
	Image25:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image25:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image25 )
	self.Image25 = Image25
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( 1, 1, -199, -193 )
	Image6:setTopBottom( 1, 1, -562, -556 )
	Image6:setRGB( 0.82, 0.98, 1 )
	Image6:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( 1, 1, -198, -192 )
	Image7:setTopBottom( 1, 1, -562, -556 )
	Image7:setRGB( 0.82, 0.98, 1 )
	Image7:setYRot( 180 )
	Image7:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image28 = LUI.UIImage.new()
	Image28:setLeftRight( 1, 1, -199, -193 )
	Image28:setTopBottom( 1, 1, -666, -660 )
	Image28:setRGB( 0.82, 0.98, 1 )
	Image28:setZRot( 180 )
	Image28:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image28:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image28 )
	self.Image28 = Image28
	
	local Image29 = LUI.UIImage.new()
	Image29:setLeftRight( 1, 1, -201, -195 )
	Image29:setTopBottom( 1, 1, -666, -660 )
	Image29:setRGB( 0.82, 0.98, 1 )
	Image29:setXRot( 180 )
	Image29:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image29:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image29 )
	self.Image29 = Image29
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( 1, 1, -5, 1 )
	Image31:setTopBottom( 1, 1, -562, -556 )
	Image31:setRGB( 0.82, 0.98, 1 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image32 = LUI.UIImage.new()
	Image32:setLeftRight( 1, 1, -3, 3 )
	Image32:setTopBottom( 1, 1, -562, -556 )
	Image32:setRGB( 0.82, 0.98, 1 )
	Image32:setYRot( 180 )
	Image32:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image32:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image32 )
	self.Image32 = Image32
	
	local Image33 = LUI.UIImage.new()
	Image33:setLeftRight( 1, 1, -3, 3 )
	Image33:setTopBottom( 1, 1, -666, -660 )
	Image33:setRGB( 0.82, 0.98, 1 )
	Image33:setZRot( 180 )
	Image33:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image33:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image33 )
	self.Image33 = Image33
	
	local Image34 = LUI.UIImage.new()
	Image34:setLeftRight( 1, 1, -5, 1 )
	Image34:setTopBottom( 1, 1, -666, -660 )
	Image34:setRGB( 0.82, 0.98, 1 )
	Image34:setXRot( 180 )
	Image34:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image34:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image34 )
	self.Image34 = Image34
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( 1, 1, -3, 3 )
	Image8:setTopBottom( 1, 1, -502, -496 )
	Image8:setRGB( 0.41, 0.76, 0.6 )
	Image8:setZRot( 180 )
	Image8:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( 1, 1, -5, 1 )
	Image9:setTopBottom( 1, 1, -502, -496 )
	Image9:setRGB( 0.82, 0.98, 1 )
	Image9:setXRot( 180 )
	Image9:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 1, 1, -5, 1 )
	Image10:setTopBottom( 1, 1, -5, 1 )
	Image10:setRGB( 0.82, 0.98, 1 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( 1, 1, -3, 3 )
	Image11:setTopBottom( 1, 1, -5, 1 )
	Image11:setRGB( 0.82, 0.98, 1 )
	Image11:setYRot( 180 )
	Image11:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( 1, 1, -761, -755 )
	Image12:setTopBottom( 1, 1, -502, -496 )
	Image12:setRGB( 0.82, 0.98, 1 )
	Image12:setZRot( 180 )
	Image12:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local Image13 = LUI.UIImage.new()
	Image13:setLeftRight( 1, 1, -763, -757 )
	Image13:setTopBottom( 1, 1, -502, -496 )
	Image13:setRGB( 0.82, 0.98, 1 )
	Image13:setXRot( 180 )
	Image13:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image13 )
	self.Image13 = Image13
	
	local Image26 = LUI.UIImage.new()
	Image26:setLeftRight( 1, 1, -762, -756 )
	Image26:setTopBottom( 1, 1, -5, 1 )
	Image26:setRGB( 0.82, 0.98, 1 )
	Image26:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image26:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image26 )
	self.Image26 = Image26
	
	local Image27 = LUI.UIImage.new()
	Image27:setLeftRight( 1, 1, -761, -755 )
	Image27:setTopBottom( 1, 1, -5, 1 )
	Image27:setRGB( 0.82, 0.98, 1 )
	Image27:setYRot( 180 )
	Image27:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image27:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image27 )
	self.Image27 = Image27
	
	local iconBorder00 = CoD.Border.new( menu, controller )
	iconBorder00:setLeftRight( 0.5, 0.5, -381, 379 )
	iconBorder00:setTopBottom( 0.5, 0.5, -168, 332 )
	iconBorder00:setRGB( 0.87, 0.99, 1 )
	self:addElement( iconBorder00 )
	self.iconBorder00 = iconBorder00
	
	local TabBar3 = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	TabBar3:setLeftRight( 0, 0, -3, 762 )
	TabBar3:setTopBottom( 0, 0, 127, 169 )
	TabBar3:setRGB( 0.87, 0.99, 1 )
	self:addElement( TabBar3 )
	self.TabBar3 = TabBar3
	
	local index = LUI.UITightText.new()
	index:setLeftRight( 0, 0, 11, 311 )
	index:setTopBottom( 0, 0, 133, 163 )
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
		face:completeAnimation()
		index:completeAnimation()
		verticalScrollingTextBox0:completeAnimation()
		keyline10:completeAnimation()
		Border10:completeAnimation()
		TabBar3:completeAnimation()
		name:completeAnimation()
		genderTitle:completeAnimation()
		gender:completeAnimation()
		keyline1:completeAnimation()
		iconBorder00:completeAnimation()
		nameTitle:completeAnimation()
		keyline:completeAnimation()
		face:setAlpha( 1 )
		index:setAlpha( 1 )
		verticalScrollingTextBox0:setAlpha( 0.8 )
		keyline10:setAlpha( 0.7 )
		Border10:setAlpha( 1 )
		TabBar3:setAlpha( 1 )
		name:setAlpha( 0.8 )
		genderTitle:setAlpha( 0.8 )
		gender:setAlpha( 0.8 )
		keyline1:setAlpha( 0.7 )
		iconBorder00:setAlpha( 1 )
		nameTitle:setAlpha( 0.8 )
		keyline:setAlpha( 0.7 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				local faceFrame2 = function ( face, event )
					if not event.interrupted then
						face:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					face:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( face, event )
					else
						face:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				face:completeAnimation()
				self.face:setAlpha( 0 )
				faceFrame2( face, {} )
				local nameTitleFrame2 = function ( nameTitle, event )
					if not event.interrupted then
						nameTitle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					nameTitle:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( nameTitle, event )
					else
						nameTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				nameTitle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				nameTitle:setAlpha( 0 )
				nameTitle:registerEventHandler( "transition_complete_keyframe", nameTitleFrame2 )
				local genderTitleFrame2 = function ( genderTitle, event )
					if not event.interrupted then
						genderTitle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					genderTitle:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( genderTitle, event )
					else
						genderTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				genderTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				genderTitle:setAlpha( 0 )
				genderTitle:registerEventHandler( "transition_complete_keyframe", genderTitleFrame2 )
				local nameFrame2 = function ( name, event )
					if not event.interrupted then
						name:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					name:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( name, event )
					else
						name:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				name:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				name:setAlpha( 0 )
				name:registerEventHandler( "transition_complete_keyframe", nameFrame2 )
				local genderFrame2 = function ( gender, event )
					if not event.interrupted then
						gender:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
					end
					gender:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( gender, event )
					else
						gender:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gender:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				gender:setAlpha( 0 )
				gender:registerEventHandler( "transition_complete_keyframe", genderFrame2 )
				local keylineFrame2 = function ( keyline, event )
					if not event.interrupted then
						keyline:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
					end
					keyline:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( keyline, event )
					else
						keyline:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				keyline:setAlpha( 0 )
				keyline:registerEventHandler( "transition_complete_keyframe", keylineFrame2 )
				local verticalScrollingTextBox0Frame2 = function ( verticalScrollingTextBox0, event )
					if not event.interrupted then
						verticalScrollingTextBox0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					verticalScrollingTextBox0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( verticalScrollingTextBox0, event )
					else
						verticalScrollingTextBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				verticalScrollingTextBox0:completeAnimation()
				self.verticalScrollingTextBox0:setAlpha( 0 )
				verticalScrollingTextBox0Frame2( verticalScrollingTextBox0, {} )
				local keyline1Frame2 = function ( keyline1, event )
					if not event.interrupted then
						keyline1:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Bounce )
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
						keyline10:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Bounce )
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
				local Border10Frame2 = function ( Border10, event )
					if not event.interrupted then
						Border10:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Bounce )
					end
					Border10:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Border10, event )
					else
						Border10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Border10:completeAnimation()
				self.Border10:setAlpha( 0 )
				Border10Frame2( Border10, {} )
				local iconBorder00Frame2 = function ( iconBorder00, event )
					if not event.interrupted then
						iconBorder00:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
					end
					iconBorder00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( iconBorder00, event )
					else
						iconBorder00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconBorder00:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				iconBorder00:setAlpha( 0 )
				iconBorder00:registerEventHandler( "transition_complete_keyframe", iconBorder00Frame2 )
				local TabBar3Frame2 = function ( TabBar3, event )
					if not event.interrupted then
						TabBar3:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
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
				local indexFrame2 = function ( index, event )
					if not event.interrupted then
						index:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					index:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( index, event )
					else
						index:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				index:completeAnimation()
				self.index:setAlpha( 0 )
				indexFrame2( index, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.verticalScrollingTextBox0:close()
		self.Border10:close()
		self.iconBorder00:close()
		self.TabBar3:close()
		self.face:close()
		self.name:close()
		self.gender:close()
		self.index:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

