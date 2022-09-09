-- 863b490d1bcd4c29a76ecb6b6da1805e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.verticalScrollingTextBox" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_TabBar" )

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
	self:setLeftRight( true, false, 0, 506 )
	self:setTopBottom( true, false, 0, 443 )
	self.anyChildUsesUpdateState = true
	
	local BlackGradient = LUI.UIImage.new()
	BlackGradient:setLeftRight( true, true, 0, 0 )
	BlackGradient:setTopBottom( false, true, -81.25, -0.25 )
	BlackGradient:setAlpha( 0.9 )
	BlackGradient:setImage( RegisterImage( "uie_t7_hud_hero_cardback_gradient" ) )
	self:addElement( BlackGradient )
	self.BlackGradient = BlackGradient
	
	local face = LUI.UIImage.new()
	face:setLeftRight( true, false, 0, 128 )
	face:setTopBottom( true, false, 0, 72 )
	face:linkToElementModel( self, "cardBackIcon", true, function ( model )
		local cardBackIcon = Engine.GetModelValue( model )
		if cardBackIcon then
			face:setImage( RegisterImage( cardBackIcon ) )
		end
	end )
	self:addElement( face )
	self.face = face
	
	local nameTitle = LUI.UITightText.new()
	nameTitle:setLeftRight( true, false, 143, 343 )
	nameTitle:setTopBottom( true, false, 13.94, 33.94 )
	nameTitle:setRGB( 0.82, 0.98, 1 )
	nameTitle:setAlpha( 0.8 )
	nameTitle:setText( Engine.Localize( "HEROES_NAME" ) )
	nameTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( nameTitle )
	self.nameTitle = nameTitle
	
	local genderTitle = LUI.UITightText.new()
	genderTitle:setLeftRight( true, false, 143, 184 )
	genderTitle:setTopBottom( true, false, 37.94, 57.94 )
	genderTitle:setRGB( 0.82, 0.98, 1 )
	genderTitle:setAlpha( 0.8 )
	genderTitle:setText( Engine.Localize( "HEROES_GENDER" ) )
	genderTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( genderTitle )
	self.genderTitle = genderTitle
	
	local name = LUI.UITightText.new()
	name:setLeftRight( true, false, 237.5, 270.5 )
	name:setTopBottom( true, false, 13.94, 33.94 )
	name:setRGB( 0.82, 0.98, 1 )
	name:setAlpha( 0.8 )
	name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	name:linkToElementModel( self, "realName", true, function ( model )
		local realName = Engine.GetModelValue( model )
		if realName then
			name:setText( Engine.Localize( realName ) )
		end
	end )
	self:addElement( name )
	self.name = name
	
	local gender = LUI.UITightText.new()
	gender:setLeftRight( true, false, 237.5, 278.5 )
	gender:setTopBottom( true, false, 37.94, 57.94 )
	gender:setRGB( 0.82, 0.98, 1 )
	gender:setAlpha( 0.8 )
	gender:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	gender:linkToElementModel( self, "genderString", true, function ( model )
		local genderString = Engine.GetModelValue( model )
		if genderString then
			gender:setText( Engine.Localize( genderString ) )
		end
	end )
	self:addElement( gender )
	self.gender = gender
	
	local keyline = LUI.UIImage.new()
	keyline:setLeftRight( true, true, 5, 5 )
	keyline:setTopBottom( true, false, 109.25, 110 )
	keyline:setRGB( 0.82, 0.98, 1 )
	keyline:setAlpha( 0.7 )
	self:addElement( keyline )
	self.keyline = keyline
	
	local verticalScrollingTextBox0 = CoD.verticalScrollingTextBox.new( menu, controller )
	verticalScrollingTextBox0:setLeftRight( true, false, 7.5, 495.5 )
	verticalScrollingTextBox0:setTopBottom( true, false, 113.5, 433 )
	verticalScrollingTextBox0:setRGB( 0.82, 0.98, 1 )
	verticalScrollingTextBox0:setAlpha( 0.8 )
	verticalScrollingTextBox0.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	verticalScrollingTextBox0.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	verticalScrollingTextBox0:linkToElementModel( self, "bio", true, function ( model )
		local bio = Engine.GetModelValue( model )
		if bio then
			verticalScrollingTextBox0.textBox:setText( Engine.Localize( bio ) )
		end
	end )
	self:addElement( verticalScrollingTextBox0 )
	self.verticalScrollingTextBox0 = verticalScrollingTextBox0
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -20, 5 )
	Image2:setTopBottom( false, false, -114, -111 )
	Image2:setRGB( 0.82, 0.98, 1 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -20, 5 )
	Image0:setTopBottom( false, false, 219.5, 222.5 )
	Image0:setRGB( 0.82, 0.98, 1 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -20, 5 )
	Image1:setTopBottom( false, false, 219.5, 222.5 )
	Image1:setRGB( 0.82, 0.98, 1 )
	Image1:setZRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, -20, 5 )
	Image3:setTopBottom( false, false, -152, -149 )
	Image3:setRGB( 0.82, 0.98, 1 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, -20, 5 )
	Image30:setTopBottom( false, false, -152, -149 )
	Image30:setRGB( 0.82, 0.98, 1 )
	Image30:setZRot( 180 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, -20, 5 )
	Image4:setTopBottom( false, false, -222, -219 )
	Image4:setRGB( 0.82, 0.98, 1 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, -20, 5 )
	Image5:setTopBottom( false, false, -223, -220 )
	Image5:setRGB( 0.82, 0.98, 1 )
	Image5:setZRot( 180 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, -20, 5 )
	Image20:setTopBottom( false, false, -114, -111 )
	Image20:setRGB( 0.82, 0.98, 1 )
	Image20:setZRot( 180 )
	Image20:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local keyline1 = LUI.UIImage.new()
	keyline1:setLeftRight( true, true, 0, 0 )
	keyline1:setTopBottom( true, false, 71.25, 72 )
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
	
	local Border10 = CoD.Border.new( menu, controller )
	Border10:setLeftRight( true, false, -1, 128 )
	Border10:setTopBottom( true, false, 0.38, 71.5 )
	Border10:setRGB( 0.82, 0.98, 1 )
	self:addElement( Border10 )
	self.Border10 = Border10
	
	local Image94 = LUI.UIImage.new()
	Image94:setLeftRight( false, true, -381, -377 )
	Image94:setTopBottom( false, true, -374.5, -370.5 )
	Image94:setRGB( 0.82, 0.98, 1 )
	Image94:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image94:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image94 )
	self.Image94 = Image94
	
	local Image14 = LUI.UIImage.new()
	Image14:setLeftRight( false, true, -380, -376 )
	Image14:setTopBottom( false, true, -374.5, -370.5 )
	Image14:setRGB( 0.82, 0.98, 1 )
	Image14:setYRot( 180 )
	Image14:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image14:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image14 )
	self.Image14 = Image14
	
	local Image15 = LUI.UIImage.new()
	Image15:setLeftRight( false, true, -380, -376 )
	Image15:setTopBottom( false, true, -444, -440 )
	Image15:setRGB( 0.82, 0.98, 1 )
	Image15:setZRot( 180 )
	Image15:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image15 )
	self.Image15 = Image15
	
	local Image16 = LUI.UIImage.new()
	Image16:setLeftRight( false, true, -381, -377 )
	Image16:setTopBottom( false, true, -444, -440 )
	Image16:setRGB( 0.82, 0.98, 1 )
	Image16:setXRot( 180 )
	Image16:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image16:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image16 )
	self.Image16 = Image16
	
	local Image17 = LUI.UIImage.new()
	Image17:setLeftRight( false, true, -284, -280 )
	Image17:setTopBottom( false, true, -374.5, -370.5 )
	Image17:setRGB( 0.82, 0.98, 1 )
	Image17:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image17:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image17 )
	self.Image17 = Image17
	
	local Image18 = LUI.UIImage.new()
	Image18:setLeftRight( false, true, -283, -279 )
	Image18:setTopBottom( false, true, -374.5, -370.5 )
	Image18:setRGB( 0.82, 0.98, 1 )
	Image18:setYRot( 180 )
	Image18:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image18:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image18 )
	self.Image18 = Image18
	
	local Image19 = LUI.UIImage.new()
	Image19:setLeftRight( false, true, -284, -280 )
	Image19:setTopBottom( false, true, -444, -440 )
	Image19:setRGB( 0.82, 0.98, 1 )
	Image19:setZRot( 180 )
	Image19:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image19:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image19 )
	self.Image19 = Image19
	
	local Image21 = LUI.UIImage.new()
	Image21:setLeftRight( false, true, -285, -281 )
	Image21:setTopBottom( false, true, -444, -440 )
	Image21:setRGB( 0.82, 0.98, 1 )
	Image21:setXRot( 180 )
	Image21:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image21 )
	self.Image21 = Image21
	
	local Image22 = LUI.UIImage.new()
	Image22:setLeftRight( false, true, -508, -504 )
	Image22:setTopBottom( false, true, -374.5, -370.5 )
	Image22:setRGB( 0.82, 0.98, 1 )
	Image22:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image22:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image22 )
	self.Image22 = Image22
	
	local Image23 = LUI.UIImage.new()
	Image23:setLeftRight( false, true, -507, -503 )
	Image23:setTopBottom( false, true, -374.5, -370.5 )
	Image23:setRGB( 0.82, 0.98, 1 )
	Image23:setYRot( 180 )
	Image23:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image23:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image23 )
	self.Image23 = Image23
	
	local Image24 = LUI.UIImage.new()
	Image24:setLeftRight( false, true, -507.5, -503.5 )
	Image24:setTopBottom( false, true, -444, -440 )
	Image24:setRGB( 0.82, 0.98, 1 )
	Image24:setZRot( 180 )
	Image24:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image24:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image24 )
	self.Image24 = Image24
	
	local Image25 = LUI.UIImage.new()
	Image25:setLeftRight( false, true, -508.5, -504.5 )
	Image25:setTopBottom( false, true, -444, -440 )
	Image25:setRGB( 0.82, 0.98, 1 )
	Image25:setXRot( 180 )
	Image25:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image25:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image25 )
	self.Image25 = Image25
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( false, true, -133, -129 )
	Image6:setTopBottom( false, true, -374.5, -370.5 )
	Image6:setRGB( 0.82, 0.98, 1 )
	Image6:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( false, true, -132, -128 )
	Image7:setTopBottom( false, true, -374.5, -370.5 )
	Image7:setRGB( 0.82, 0.98, 1 )
	Image7:setYRot( 180 )
	Image7:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image28 = LUI.UIImage.new()
	Image28:setLeftRight( false, true, -133, -129 )
	Image28:setTopBottom( false, true, -444, -440 )
	Image28:setRGB( 0.82, 0.98, 1 )
	Image28:setZRot( 180 )
	Image28:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image28:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image28 )
	self.Image28 = Image28
	
	local Image29 = LUI.UIImage.new()
	Image29:setLeftRight( false, true, -134, -130 )
	Image29:setTopBottom( false, true, -444, -440 )
	Image29:setRGB( 0.82, 0.98, 1 )
	Image29:setXRot( 180 )
	Image29:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image29:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image29 )
	self.Image29 = Image29
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( false, true, -3, 1 )
	Image31:setTopBottom( false, true, -374.5, -370.5 )
	Image31:setRGB( 0.82, 0.98, 1 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image32 = LUI.UIImage.new()
	Image32:setLeftRight( false, true, -2, 2 )
	Image32:setTopBottom( false, true, -374.5, -370.5 )
	Image32:setRGB( 0.82, 0.98, 1 )
	Image32:setYRot( 180 )
	Image32:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image32:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image32 )
	self.Image32 = Image32
	
	local Image33 = LUI.UIImage.new()
	Image33:setLeftRight( false, true, -2, 2 )
	Image33:setTopBottom( false, true, -444, -440 )
	Image33:setRGB( 0.82, 0.98, 1 )
	Image33:setZRot( 180 )
	Image33:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image33:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image33 )
	self.Image33 = Image33
	
	local Image34 = LUI.UIImage.new()
	Image34:setLeftRight( false, true, -3, 1 )
	Image34:setTopBottom( false, true, -444, -440 )
	Image34:setRGB( 0.82, 0.98, 1 )
	Image34:setXRot( 180 )
	Image34:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image34:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image34 )
	self.Image34 = Image34
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( false, true, -2, 2 )
	Image8:setTopBottom( false, true, -334.5, -330.5 )
	Image8:setRGB( 0.41, 0.76, 0.6 )
	Image8:setZRot( 180 )
	Image8:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local Image9 = LUI.UIImage.new()
	Image9:setLeftRight( false, true, -3, 1 )
	Image9:setTopBottom( false, true, -334.5, -330.5 )
	Image9:setRGB( 0.82, 0.98, 1 )
	Image9:setXRot( 180 )
	Image9:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image9:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image9 )
	self.Image9 = Image9
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( false, true, -3, 1 )
	Image10:setTopBottom( false, true, -3, 1 )
	Image10:setRGB( 0.82, 0.98, 1 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image11 = LUI.UIImage.new()
	Image11:setLeftRight( false, true, -2, 2 )
	Image11:setTopBottom( false, true, -3, 1 )
	Image11:setRGB( 0.82, 0.98, 1 )
	Image11:setYRot( 180 )
	Image11:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image11:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image11 )
	self.Image11 = Image11
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( false, true, -507.5, -503.5 )
	Image12:setTopBottom( false, true, -334.5, -330.5 )
	Image12:setRGB( 0.82, 0.98, 1 )
	Image12:setZRot( 180 )
	Image12:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local Image13 = LUI.UIImage.new()
	Image13:setLeftRight( false, true, -508.5, -504.5 )
	Image13:setTopBottom( false, true, -334.5, -330.5 )
	Image13:setRGB( 0.82, 0.98, 1 )
	Image13:setXRot( 180 )
	Image13:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image13 )
	self.Image13 = Image13
	
	local Image26 = LUI.UIImage.new()
	Image26:setLeftRight( false, true, -508, -504 )
	Image26:setTopBottom( false, true, -3.5, 0.5 )
	Image26:setRGB( 0.82, 0.98, 1 )
	Image26:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image26:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image26 )
	self.Image26 = Image26
	
	local Image27 = LUI.UIImage.new()
	Image27:setLeftRight( false, true, -507, -503 )
	Image27:setTopBottom( false, true, -3.5, 0.5 )
	Image27:setRGB( 0.82, 0.98, 1 )
	Image27:setYRot( 180 )
	Image27:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image27:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image27 )
	self.Image27 = Image27
	
	local iconBorder00 = CoD.Border.new( menu, controller )
	iconBorder00:setLeftRight( false, false, -254, 253 )
	iconBorder00:setTopBottom( false, false, -112, 221.5 )
	iconBorder00:setRGB( 0.87, 0.99, 1 )
	self:addElement( iconBorder00 )
	self.iconBorder00 = iconBorder00
	
	local TabBar3 = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	TabBar3:setLeftRight( true, false, -2, 508 )
	TabBar3:setTopBottom( true, false, 84.5, 112.5 )
	TabBar3:setRGB( 0.87, 0.99, 1 )
	self:addElement( TabBar3 )
	self.TabBar3 = TabBar3
	
	local index = LUI.UITightText.new()
	index:setLeftRight( true, false, 7.5, 207.5 )
	index:setTopBottom( true, false, 89, 109 )
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
				local f7_local1 = function ( f9_arg0, f9_arg1 )
					if not f9_arg1.interrupted then
						f9_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					f9_arg0:setAlpha( 1 )
					if f9_arg1.interrupted then
						self.clipFinished( f9_arg0, f9_arg1 )
					else
						f9_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				nameTitle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				nameTitle:setAlpha( 0 )
				nameTitle:registerEventHandler( "transition_complete_keyframe", f7_local1 )
				local f7_local2 = function ( f10_arg0, f10_arg1 )
					if not f10_arg1.interrupted then
						f10_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					f10_arg0:setAlpha( 1 )
					if f10_arg1.interrupted then
						self.clipFinished( f10_arg0, f10_arg1 )
					else
						f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				genderTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				genderTitle:setAlpha( 0 )
				genderTitle:registerEventHandler( "transition_complete_keyframe", f7_local2 )
				local f7_local3 = function ( f11_arg0, f11_arg1 )
					if not f11_arg1.interrupted then
						f11_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					f11_arg0:setAlpha( 1 )
					if f11_arg1.interrupted then
						self.clipFinished( f11_arg0, f11_arg1 )
					else
						f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				name:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				name:setAlpha( 0 )
				name:registerEventHandler( "transition_complete_keyframe", f7_local3 )
				local f7_local4 = function ( f12_arg0, f12_arg1 )
					if not f12_arg1.interrupted then
						f12_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
					end
					f12_arg0:setAlpha( 1 )
					if f12_arg1.interrupted then
						self.clipFinished( f12_arg0, f12_arg1 )
					else
						f12_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gender:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				gender:setAlpha( 0 )
				gender:registerEventHandler( "transition_complete_keyframe", f7_local4 )
				local f7_local5 = function ( f13_arg0, f13_arg1 )
					if not f13_arg1.interrupted then
						f13_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
					end
					f13_arg0:setAlpha( 0.7 )
					if f13_arg1.interrupted then
						self.clipFinished( f13_arg0, f13_arg1 )
					else
						f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				keyline:setAlpha( 0 )
				keyline:registerEventHandler( "transition_complete_keyframe", f7_local5 )
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
				local f7_local7 = function ( f15_arg0, f15_arg1 )
					if not f15_arg1.interrupted then
						f15_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Bounce )
					end
					f15_arg0:setAlpha( 0.7 )
					if f15_arg1.interrupted then
						self.clipFinished( f15_arg0, f15_arg1 )
					else
						f15_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				keyline1:setAlpha( 0 )
				keyline1:registerEventHandler( "transition_complete_keyframe", f7_local7 )
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
				local f7_local10 = function ( f18_arg0, f18_arg1 )
					if not f18_arg1.interrupted then
						f18_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
					end
					f18_arg0:setAlpha( 1 )
					if f18_arg1.interrupted then
						self.clipFinished( f18_arg0, f18_arg1 )
					else
						f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconBorder00:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				iconBorder00:setAlpha( 0 )
				iconBorder00:registerEventHandler( "transition_complete_keyframe", f7_local10 )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.verticalScrollingTextBox0:close()
		element.Border10:close()
		element.iconBorder00:close()
		element.TabBar3:close()
		element.face:close()
		element.name:close()
		element.gender:close()
		element.index:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
