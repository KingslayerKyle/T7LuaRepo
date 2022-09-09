-- 819f2aa5b716092e8f2f1241c2bf03c4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_TabBar" )

CoD.ChooseCharacterLoadout_CardBack_Stats = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_Stats.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_Stats )
	self.id = "ChooseCharacterLoadout_CardBack_Stats"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 506 )
	self:setTopBottom( true, false, 0, 443 )
	self.anyChildUsesUpdateState = true
	
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
	
	local weaponHeaderBar = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	weaponHeaderBar:setLeftRight( true, true, 5, -255.5 )
	weaponHeaderBar:setTopBottom( true, false, 123.5, 151.5 )
	weaponHeaderBar:setRGB( 0.87, 0.99, 1 )
	self:addElement( weaponHeaderBar )
	self.weaponHeaderBar = weaponHeaderBar
	
	local abilityHeaderBard = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	abilityHeaderBard:setLeftRight( true, true, 255.5, -5 )
	abilityHeaderBard:setTopBottom( true, false, 123.5, 151.5 )
	abilityHeaderBard:setRGB( 0.87, 0.99, 1 )
	self:addElement( abilityHeaderBard )
	self.abilityHeaderBard = abilityHeaderBard
	
	local weaponName = LUI.UIText.new()
	weaponName:setLeftRight( true, true, 5, -255.5 )
	weaponName:setTopBottom( true, false, 127.5, 147.5 )
	weaponName:setRGB( 0, 0, 0 )
	weaponName:setTTF( "fonts/default.ttf" )
	weaponName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponName:linkToElementModel( self, "weaponName", true, function ( model )
		local _weaponName = Engine.GetModelValue( model )
		if _weaponName then
			weaponName:setText( LocalizeToUpperString( _weaponName ) )
		end
	end )
	self:addElement( weaponName )
	self.weaponName = weaponName
	
	local abilityName = LUI.UIText.new()
	abilityName:setLeftRight( true, true, 255.5, -5 )
	abilityName:setTopBottom( true, false, 127.5, 147.5 )
	abilityName:setRGB( 0, 0, 0 )
	abilityName:setTTF( "fonts/default.ttf" )
	abilityName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	abilityName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	abilityName:linkToElementModel( self, "abilityName", true, function ( model )
		local _abilityName = Engine.GetModelValue( model )
		if _abilityName then
			abilityName:setText( LocalizeToUpperString( _abilityName ) )
		end
	end )
	self:addElement( abilityName )
	self.abilityName = abilityName
	
	local weaponBorder = CoD.Border.new( menu, controller )
	weaponBorder:setLeftRight( true, true, 5.5, -255.5 )
	weaponBorder:setTopBottom( true, false, 151.5, 255.25 )
	weaponBorder:setRGB( 0.87, 0.99, 1 )
	self:addElement( weaponBorder )
	self.weaponBorder = weaponBorder
	
	local abilityBorder = CoD.Border.new( menu, controller )
	abilityBorder:setLeftRight( true, true, 255.5, -5 )
	abilityBorder:setTopBottom( true, false, 151.5, 255.25 )
	abilityBorder:setRGB( 0.87, 0.99, 1 )
	self:addElement( abilityBorder )
	self.abilityBorder = abilityBorder
	
	local weaponKeyline = LUI.UIImage.new()
	weaponKeyline:setLeftRight( true, true, 6.5, -256.5 )
	weaponKeyline:setTopBottom( true, false, 200.88, 201.88 )
	weaponKeyline:setRGB( 0.82, 0.98, 1 )
	weaponKeyline:setAlpha( 0.7 )
	self:addElement( weaponKeyline )
	self.weaponKeyline = weaponKeyline
	
	local abilityKeyline = LUI.UIImage.new()
	abilityKeyline:setLeftRight( true, true, 256.5, -5.5 )
	abilityKeyline:setTopBottom( true, false, 200.88, 201.88 )
	abilityKeyline:setRGB( 0.82, 0.98, 1 )
	abilityKeyline:setAlpha( 0.7 )
	self:addElement( abilityKeyline )
	self.abilityKeyline = abilityKeyline
	
	local weaponKillsLabel = LUI.UIText.new()
	weaponKillsLabel:setLeftRight( true, true, 6.25, -254.25 )
	weaponKillsLabel:setTopBottom( true, false, 185.88, 199.88 )
	weaponKillsLabel:setRGB( 0.82, 0.98, 1 )
	weaponKillsLabel:setText( Engine.Localize( "MENU_KILLS" ) )
	weaponKillsLabel:setTTF( "fonts/default.ttf" )
	weaponKillsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponKillsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponKillsLabel )
	self.weaponKillsLabel = weaponKillsLabel
	
	local abilityKillsLabel = LUI.UIText.new()
	abilityKillsLabel:setLeftRight( true, true, 255.5, -5 )
	abilityKillsLabel:setTopBottom( true, false, 185.88, 199.88 )
	abilityKillsLabel:setRGB( 0.82, 0.98, 1 )
	abilityKillsLabel:setTTF( "fonts/default.ttf" )
	abilityKillsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	abilityKillsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	abilityKillsLabel:linkToElementModel( self, "abilityKillsLabel", true, function ( model )
		local _abilityKillsLabel = Engine.GetModelValue( model )
		if _abilityKillsLabel then
			abilityKillsLabel:setText( Engine.Localize( _abilityKillsLabel ) )
		end
	end )
	self:addElement( abilityKillsLabel )
	self.abilityKillsLabel = abilityKillsLabel
	
	local weaponKills = LUI.UIText.new()
	weaponKills:setLeftRight( true, true, 5, -255.5 )
	weaponKills:setTopBottom( true, false, 156.5, 182.5 )
	weaponKills:setRGB( 0.87, 0.99, 1 )
	weaponKills:setTTF( "fonts/default.ttf" )
	weaponKills:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponKills:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponKills:linkToElementModel( self, "weaponKills", true, function ( model )
		local _weaponKills = Engine.GetModelValue( model )
		if _weaponKills then
			weaponKills:setText( _weaponKills )
		end
	end )
	self:addElement( weaponKills )
	self.weaponKills = weaponKills
	
	local abilityKills = LUI.UIText.new()
	abilityKills:setLeftRight( true, true, 255.25, -5.25 )
	abilityKills:setTopBottom( true, false, 156.5, 182.5 )
	abilityKills:setRGB( 0.87, 0.99, 1 )
	abilityKills:setTTF( "fonts/default.ttf" )
	abilityKills:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	abilityKills:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	abilityKills:linkToElementModel( self, "abilityKills", true, function ( model )
		local _abilityKills = Engine.GetModelValue( model )
		if _abilityKills then
			abilityKills:setText( _abilityKills )
		end
	end )
	self:addElement( abilityKills )
	self.abilityKills = abilityKills
	
	local weaponKillsPerUseLAbel = LUI.UIText.new()
	weaponKillsPerUseLAbel:setLeftRight( true, true, 6.25, -254.25 )
	weaponKillsPerUseLAbel:setTopBottom( true, false, 206.88, 220.88 )
	weaponKillsPerUseLAbel:setRGB( 0.82, 0.98, 1 )
	weaponKillsPerUseLAbel:setText( Engine.Localize( "MENU_KILLS_PER_USE" ) )
	weaponKillsPerUseLAbel:setTTF( "fonts/default.ttf" )
	weaponKillsPerUseLAbel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponKillsPerUseLAbel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponKillsPerUseLAbel )
	self.weaponKillsPerUseLAbel = weaponKillsPerUseLAbel
	
	local abilityKillsPerUseLabel = LUI.UIText.new()
	abilityKillsPerUseLabel:setLeftRight( true, true, 256.5, -4 )
	abilityKillsPerUseLabel:setTopBottom( true, false, 206.88, 220.88 )
	abilityKillsPerUseLabel:setRGB( 0.82, 0.98, 1 )
	abilityKillsPerUseLabel:setTTF( "fonts/default.ttf" )
	abilityKillsPerUseLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	abilityKillsPerUseLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	abilityKillsPerUseLabel:linkToElementModel( self, "abilityKillsPerUseLabel", true, function ( model )
		local _abilityKillsPerUseLabel = Engine.GetModelValue( model )
		if _abilityKillsPerUseLabel then
			abilityKillsPerUseLabel:setText( Engine.Localize( _abilityKillsPerUseLabel ) )
		end
	end )
	self:addElement( abilityKillsPerUseLabel )
	self.abilityKillsPerUseLabel = abilityKillsPerUseLabel
	
	local weaponKillsPerUse = LUI.UIText.new()
	weaponKillsPerUse:setLeftRight( true, true, 6.25, -254.25 )
	weaponKillsPerUse:setTopBottom( true, false, 224.88, 250.88 )
	weaponKillsPerUse:setRGB( 0.87, 0.99, 1 )
	weaponKillsPerUse:setTTF( "fonts/default.ttf" )
	weaponKillsPerUse:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponKillsPerUse:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponKillsPerUse:linkToElementModel( self, "weaponKillsPerUse", true, function ( model )
		local _weaponKillsPerUse = Engine.GetModelValue( model )
		if _weaponKillsPerUse then
			weaponKillsPerUse:setText( _weaponKillsPerUse )
		end
	end )
	self:addElement( weaponKillsPerUse )
	self.weaponKillsPerUse = weaponKillsPerUse
	
	local abilityKillsPerUse = LUI.UIText.new()
	abilityKillsPerUse:setLeftRight( true, true, 256.5, -4 )
	abilityKillsPerUse:setTopBottom( true, false, 224.88, 250.88 )
	abilityKillsPerUse:setRGB( 0.87, 0.99, 1 )
	abilityKillsPerUse:setTTF( "fonts/default.ttf" )
	abilityKillsPerUse:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	abilityKillsPerUse:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	abilityKillsPerUse:linkToElementModel( self, "abilityKillsPerUse", true, function ( model )
		local _abilityKillsPerUse = Engine.GetModelValue( model )
		if _abilityKillsPerUse then
			abilityKillsPerUse:setText( _abilityKillsPerUse )
		end
	end )
	self:addElement( abilityKillsPerUse )
	self.abilityKillsPerUse = abilityKillsPerUse
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

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
				local f14_local1 = function ( f16_arg0, f16_arg1 )
					if not f16_arg1.interrupted then
						f16_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					f16_arg0:setAlpha( 1 )
					if f16_arg1.interrupted then
						self.clipFinished( f16_arg0, f16_arg1 )
					else
						f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				nameTitle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				nameTitle:setAlpha( 0 )
				nameTitle:registerEventHandler( "transition_complete_keyframe", f14_local1 )
				local f14_local2 = function ( f17_arg0, f17_arg1 )
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
				
				genderTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				genderTitle:setAlpha( 0 )
				genderTitle:registerEventHandler( "transition_complete_keyframe", f14_local2 )
				local f14_local3 = function ( f18_arg0, f18_arg1 )
					if not f18_arg1.interrupted then
						f18_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					f18_arg0:setAlpha( 1 )
					if f18_arg1.interrupted then
						self.clipFinished( f18_arg0, f18_arg1 )
					else
						f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				name:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				name:setAlpha( 0 )
				name:registerEventHandler( "transition_complete_keyframe", f14_local3 )
				local f14_local4 = function ( f19_arg0, f19_arg1 )
					if not f19_arg1.interrupted then
						f19_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
					end
					f19_arg0:setAlpha( 1 )
					if f19_arg1.interrupted then
						self.clipFinished( f19_arg0, f19_arg1 )
					else
						f19_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gender:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				gender:setAlpha( 0 )
				gender:registerEventHandler( "transition_complete_keyframe", f14_local4 )
				local f14_local5 = function ( f20_arg0, f20_arg1 )
					if not f20_arg1.interrupted then
						f20_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
					end
					f20_arg0:setAlpha( 0.7 )
					if f20_arg1.interrupted then
						self.clipFinished( f20_arg0, f20_arg1 )
					else
						f20_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				keyline:setAlpha( 0 )
				keyline:registerEventHandler( "transition_complete_keyframe", f14_local5 )
				local f14_local6 = function ( f21_arg0, f21_arg1 )
					if not f21_arg1.interrupted then
						f21_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Bounce )
					end
					f21_arg0:setAlpha( 0.7 )
					if f21_arg1.interrupted then
						self.clipFinished( f21_arg0, f21_arg1 )
					else
						f21_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				keyline1:setAlpha( 0 )
				keyline1:registerEventHandler( "transition_complete_keyframe", f14_local6 )
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
				local f14_local9 = function ( f24_arg0, f24_arg1 )
					if not f24_arg1.interrupted then
						f24_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Bounce )
					end
					f24_arg0:setAlpha( 1 )
					if f24_arg1.interrupted then
						self.clipFinished( f24_arg0, f24_arg1 )
					else
						f24_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconBorder00:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				iconBorder00:setAlpha( 0 )
				iconBorder00:registerEventHandler( "transition_complete_keyframe", f14_local9 )
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
		element.Border10:close()
		element.iconBorder00:close()
		element.TabBar3:close()
		element.weaponHeaderBar:close()
		element.abilityHeaderBard:close()
		element.weaponBorder:close()
		element.abilityBorder:close()
		element.face:close()
		element.name:close()
		element.gender:close()
		element.index:close()
		element.weaponName:close()
		element.abilityName:close()
		element.abilityKillsLabel:close()
		element.weaponKills:close()
		element.abilityKills:close()
		element.abilityKillsPerUseLabel:close()
		element.weaponKillsPerUse:close()
		element.abilityKillsPerUse:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
