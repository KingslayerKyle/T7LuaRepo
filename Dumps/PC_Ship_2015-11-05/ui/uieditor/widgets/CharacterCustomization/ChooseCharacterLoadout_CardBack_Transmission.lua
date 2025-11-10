require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_TabBar" )
require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_CardBack_TransmissionWaveForm" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_CardBack_TransmissionContactsList" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_CardBack_FrontOfCardFooter" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.audioPromptPC.clickableButton.m_button = Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE
	f1_arg0.audioPromptPC.clickableButton.keyshortcut:setText( Engine.Localize( "[^3P^7]" ) )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.ChooseCharacterLoadout_CardBack_Transmission = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_Transmission.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_Transmission )
	self.id = "ChooseCharacterLoadout_CardBack_Transmission"
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
	
	local frequencyLabel = LUI.UIText.new()
	frequencyLabel:setLeftRight( true, false, 229, 368 )
	frequencyLabel:setTopBottom( true, false, 6, 26 )
	frequencyLabel:setRGB( 0.82, 0.98, 1 )
	frequencyLabel:setAlpha( 0.8 )
	frequencyLabel:setText( Engine.Localize( "HEROES_FREQUENCY" ) )
	frequencyLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	frequencyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	frequencyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( frequencyLabel )
	self.frequencyLabel = frequencyLabel
	
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
	
	local keyline = LUI.UIImage.new()
	keyline:setLeftRight( true, true, 0, 0 )
	keyline:setTopBottom( true, false, 110.75, 111.5 )
	keyline:setRGB( 0.82, 0.98, 1 )
	keyline:setAlpha( 0.7 )
	self:addElement( keyline )
	self.keyline = keyline
	
	local completeAssignmentText = CoD.verticalScrollingTextBox.new( menu, controller )
	completeAssignmentText:setLeftRight( true, true, 8, -145 )
	completeAssignmentText:setTopBottom( true, false, 113.5, 433 )
	completeAssignmentText:setRGB( 0.82, 0.98, 1 )
	completeAssignmentText:setAlpha( 0.8 )
	completeAssignmentText.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	completeAssignmentText.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	completeAssignmentText:linkToElementModel( self, "transmissionSynopsis", true, function ( model )
		local transmissionSynopsis = Engine.GetModelValue( model )
		if transmissionSynopsis then
			completeAssignmentText.textBox:setText( Engine.Localize( transmissionSynopsis ) )
		end
	end )
	self:addElement( completeAssignmentText )
	self.completeAssignmentText = completeAssignmentText
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, -20, 5 )
	Image40:setTopBottom( false, false, -130.25, -127.25 )
	Image40:setRGB( 0.82, 0.98, 1 )
	Image40:setZRot( 180 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image50 = LUI.UIImage.new()
	Image50:setLeftRight( true, false, -20, 5 )
	Image50:setTopBottom( false, false, -130.25, -127.25 )
	Image50:setRGB( 0.82, 0.98, 1 )
	Image50:setZRot( 180 )
	Image50:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image50:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image50 )
	self.Image50 = Image50
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( false, true, -4, 21 )
	Image60:setTopBottom( false, false, -129.5, -126.5 )
	Image60:setRGB( 0.82, 0.98, 1 )
	Image60:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local Image70 = LUI.UIImage.new()
	Image70:setLeftRight( false, true, -4, 21 )
	Image70:setTopBottom( false, false, -129.5, -126.5 )
	Image70:setRGB( 0.82, 0.98, 1 )
	Image70:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image70:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image70 )
	self.Image70 = Image70
	
	local TabBar3 = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	TabBar3:setLeftRight( true, false, -2, 508 )
	TabBar3:setTopBottom( true, false, 86.75, 114.75 )
	TabBar3:setRGB( 0.87, 0.99, 1 )
	self:addElement( TabBar3 )
	self.TabBar3 = TabBar3
	
	local classifiedIndex = LUI.UITightText.new()
	classifiedIndex:setLeftRight( true, false, 8, 208 )
	classifiedIndex:setTopBottom( true, false, 90.5, 110.5 )
	classifiedIndex:setRGB( 0, 0, 0 )
	classifiedIndex:setTTF( "fonts/escom.ttf" )
	classifiedIndex:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	classifiedIndex:setShaderVector( 0, 0.05, 0, 0, 0 )
	classifiedIndex:setShaderVector( 1, 0.02, 0, 0, 0 )
	classifiedIndex:setShaderVector( 2, 1, 0, 0, 0 )
	classifiedIndex:setLetterSpacing( 1 )
	classifiedIndex:linkToElementModel( self, "transmissionName", true, function ( model )
		local transmissionName = Engine.GetModelValue( model )
		if transmissionName then
			classifiedIndex:setText( transmissionName )
		end
	end )
	self:addElement( classifiedIndex )
	self.classifiedIndex = classifiedIndex
	
	local classifiedBorder = CoD.Border.new( menu, controller )
	classifiedBorder:setLeftRight( false, false, -254, 253 )
	classifiedBorder:setTopBottom( false, false, -128.75, 221.5 )
	classifiedBorder:setRGB( 0.87, 0.99, 1 )
	self:addElement( classifiedBorder )
	self.classifiedBorder = classifiedBorder
	
	local Image341 = LUI.UIImage.new()
	Image341:setLeftRight( false, true, -2, 2 )
	Image341:setTopBottom( false, true, -276, -272 )
	Image341:setRGB( 0.82, 0.98, 1 )
	Image341:setZRot( 180 )
	Image341:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image341:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image341 )
	self.Image341 = Image341
	
	local Image350 = LUI.UIImage.new()
	Image350:setLeftRight( false, true, -3, 1 )
	Image350:setTopBottom( false, true, -276, -272 )
	Image350:setRGB( 0.82, 0.98, 1 )
	Image350:setXRot( 180 )
	Image350:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image350:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image350 )
	self.Image350 = Image350
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( false, true, -507, -503 )
	Image400:setTopBottom( false, true, -276, -272 )
	Image400:setRGB( 0.82, 0.98, 1 )
	Image400:setZRot( 180 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( false, true, -508, -504 )
	Image41:setTopBottom( false, true, -276, -272 )
	Image41:setRGB( 0.82, 0.98, 1 )
	Image41:setXRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local Image280 = LUI.UIImage.new()
	Image280:setLeftRight( false, true, -3, 1 )
	Image280:setTopBottom( false, true, -306.5, -302.5 )
	Image280:setRGB( 0.82, 0.98, 1 )
	Image280:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image280:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image280 )
	self.Image280 = Image280
	
	local Image290 = LUI.UIImage.new()
	Image290:setLeftRight( false, true, -2, 2 )
	Image290:setTopBottom( false, true, -306.5, -302.5 )
	Image290:setRGB( 0.82, 0.98, 1 )
	Image290:setYRot( 180 )
	Image290:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image290:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image290 )
	self.Image290 = Image290
	
	local Image321 = LUI.UIImage.new()
	Image321:setLeftRight( false, true, -2, 2 )
	Image321:setTopBottom( false, true, -370, -366 )
	Image321:setRGB( 0.82, 0.98, 1 )
	Image321:setZRot( 180 )
	Image321:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image321:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image321 )
	self.Image321 = Image321
	
	local Image331 = LUI.UIImage.new()
	Image331:setLeftRight( false, true, -3, 1 )
	Image331:setTopBottom( false, true, -370, -366 )
	Image331:setRGB( 0.82, 0.98, 1 )
	Image331:setXRot( 180 )
	Image331:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image331:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image331 )
	self.Image331 = Image331
	
	local Image36 = LUI.UIImage.new()
	Image36:setLeftRight( false, true, -507, -503 )
	Image36:setTopBottom( false, true, -370.5, -366.5 )
	Image36:setRGB( 0.82, 0.98, 1 )
	Image36:setZRot( 180 )
	Image36:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image36:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image36 )
	self.Image36 = Image36
	
	local Image37 = LUI.UIImage.new()
	Image37:setLeftRight( false, true, -508, -504 )
	Image37:setTopBottom( false, true, -370.5, -366.5 )
	Image37:setRGB( 0.82, 0.98, 1 )
	Image37:setXRot( 180 )
	Image37:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image37:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image37 )
	self.Image37 = Image37
	
	local Image38 = LUI.UIImage.new()
	Image38:setLeftRight( false, true, -508, -504 )
	Image38:setTopBottom( false, true, -306.5, -302.5 )
	Image38:setRGB( 0.82, 0.98, 1 )
	Image38:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image38:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image38 )
	self.Image38 = Image38
	
	local Image39 = LUI.UIImage.new()
	Image39:setLeftRight( false, true, -507, -503 )
	Image39:setTopBottom( false, true, -306.5, -302.5 )
	Image39:setRGB( 0.82, 0.98, 1 )
	Image39:setYRot( 180 )
	Image39:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image39:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image39 )
	self.Image39 = Image39
	
	local transmissionFrequency = LUI.UIText.new()
	transmissionFrequency:setLeftRight( true, false, 229, 368 )
	transmissionFrequency:setTopBottom( true, false, 6, 26 )
	transmissionFrequency:setRGB( 0.82, 0.98, 1 )
	transmissionFrequency:setAlpha( 0.8 )
	transmissionFrequency:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	transmissionFrequency:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	transmissionFrequency:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	transmissionFrequency:linkToElementModel( self, "transmissionFrequency", true, function ( model )
		local _transmissionFrequency = Engine.GetModelValue( model )
		if _transmissionFrequency then
			transmissionFrequency:setText( Engine.Localize( _transmissionFrequency ) )
		end
	end )
	self:addElement( transmissionFrequency )
	self.transmissionFrequency = transmissionFrequency
	
	local buttonprompt0 = CoD.buttonprompt.new( menu, controller )
	buttonprompt0:setLeftRight( true, false, 379, 505 )
	buttonprompt0:setTopBottom( true, false, 20.5, 51.5 )
	buttonprompt0.label:setText( Engine.Localize( "HEROES_PLAY_AUDIO" ) )
	buttonprompt0:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			buttonprompt0.buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	self:addElement( buttonprompt0 )
	self.buttonprompt0 = buttonprompt0
	
	local waveFormBorder = CoD.Border.new( menu, controller )
	waveFormBorder:setLeftRight( false, false, -25, 115 )
	waveFormBorder:setTopBottom( false, false, -195.5, -150 )
	waveFormBorder:setRGB( 0.87, 0.99, 1 )
	self:addElement( waveFormBorder )
	self.waveFormBorder = waveFormBorder
	
	local waveForm = CoD.ChooseCharacterLoadout_CardBack_TransmissionWaveForm.new( menu, controller )
	waveForm:setLeftRight( true, false, 229, 368 )
	waveForm:setTopBottom( true, false, 26, 71.5 )
	waveForm:linkToElementModel( self, nil, false, function ( model )
		waveForm:setModel( model, controller )
	end )
	waveForm:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "playingSound" )
			end
		}
	} )
	waveForm:linkToElementModel( waveForm, "playingSound", true, function ( model )
		menu:updateElementState( waveForm, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playingSound"
		} )
	end )
	self:addElement( waveForm )
	self.waveForm = waveForm
	
	local contacts = CoD.ChooseCharacterLoadout_CardBack_TransmissionContactsList.new( menu, controller )
	contacts:setLeftRight( true, false, 368, 496 )
	contacts:setTopBottom( true, false, 114.75, 404.75 )
	contacts:linkToElementModel( self, nil, false, function ( model )
		contacts:setModel( model, controller )
	end )
	contacts:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "playingSound" )
			end
		}
	} )
	contacts:linkToElementModel( contacts, "playingSound", true, function ( model )
		menu:updateElementState( contacts, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playingSound"
		} )
	end )
	self:addElement( contacts )
	self.contacts = contacts
	
	local audioPromptPC = CoD.ChooseCharacterLoadout_CardBack_FrontOfCardFooter.new( menu, controller )
	audioPromptPC:setLeftRight( true, false, 412, 486 )
	audioPromptPC:setTopBottom( true, false, 23, 57 )
	audioPromptPC:setAlpha( 0 )
	audioPromptPC.text:setText( Engine.Localize( "HEROES_PLAY_AUDIO" ) )
	audioPromptPC.clickableButton.label:setText( Engine.Localize( "HEROES_PLAY_AUDIO" ) )
	audioPromptPC:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			audioPromptPC.Button2:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	self:addElement( audioPromptPC )
	self.audioPromptPC = audioPromptPC
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
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
				local f16_local1 = function ( f18_arg0, f18_arg1 )
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
				
				frequencyLabel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				frequencyLabel:setAlpha( 0 )
				frequencyLabel:registerEventHandler( "transition_complete_keyframe", f16_local1 )
				local f16_local2 = function ( f19_arg0, f19_arg1 )
					if not f19_arg1.interrupted then
						f19_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Bounce )
					end
					f19_arg0:setAlpha( 0.7 )
					if f19_arg1.interrupted then
						self.clipFinished( f19_arg0, f19_arg1 )
					else
						f19_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				keyline1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				keyline1:setAlpha( 0 )
				keyline1:registerEventHandler( "transition_complete_keyframe", f16_local2 )
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
			end
		},
		PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				buttonprompt0:completeAnimation()
				self.buttonprompt0:setAlpha( 0 )
				self.clipFinished( buttonprompt0, {} )
				audioPromptPC:completeAnimation()
				self.audioPromptPC:setAlpha( 1 )
				self.clipFinished( audioPromptPC, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PC",
			condition = function ( menu, element, event )
				return IsPC()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border10:close()
		element.completeAssignmentText:close()
		element.TabBar3:close()
		element.classifiedBorder:close()
		element.buttonprompt0:close()
		element.waveFormBorder:close()
		element.waveForm:close()
		element.contacts:close()
		element.audioPromptPC:close()
		element.face:close()
		element.classifiedIndex:close()
		element.transmissionFrequency:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

