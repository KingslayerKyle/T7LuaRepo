require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.buttonprompt" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_CardBack_TransmissionContactsList" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacterLoadout_CardBack_TransmissionWaveForm" )
require( "ui.uieditor.widgets.Heroes.ChooseCharacterLoadout_TabBar" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )

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
	self:setLeftRight( 0, 0, 0, 759 )
	self:setTopBottom( 0, 0, 0, 664 )
	self.anyChildUsesUpdateState = true
	
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
	
	local frequencyLabel = LUI.UIText.new()
	frequencyLabel:setLeftRight( 0, 0, 344, 552 )
	frequencyLabel:setTopBottom( 0, 0, 9, 39 )
	frequencyLabel:setRGB( 0.82, 0.98, 1 )
	frequencyLabel:setAlpha( 0.8 )
	frequencyLabel:setText( Engine.Localize( "HEROES_FREQUENCY" ) )
	frequencyLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	frequencyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	frequencyLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( frequencyLabel )
	self.frequencyLabel = frequencyLabel
	
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
	
	local keyline = LUI.UIImage.new()
	keyline:setLeftRight( 0, 1, 0, 0 )
	keyline:setTopBottom( 0, 0, 166, 167 )
	keyline:setRGB( 0.82, 0.98, 1 )
	keyline:setAlpha( 0.7 )
	self:addElement( keyline )
	self.keyline = keyline
	
	local completeAssignmentText = CoD.verticalScrollingTextBox.new( menu, controller )
	completeAssignmentText:setLeftRight( 0, 1, 12, -218 )
	completeAssignmentText:setTopBottom( 0, 0, 170, 649 )
	completeAssignmentText:setRGB( 0.82, 0.98, 1 )
	completeAssignmentText:setAlpha( 0.8 )
	completeAssignmentText.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	completeAssignmentText.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	completeAssignmentText:linkToElementModel( self, "transmissionSynopsis", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			completeAssignmentText.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( completeAssignmentText )
	self.completeAssignmentText = completeAssignmentText
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( 0, 0, -30, 8 )
	Image40:setTopBottom( 0.5, 0.5, -195, -191 )
	Image40:setRGB( 0.82, 0.98, 1 )
	Image40:setZRot( 180 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image50 = LUI.UIImage.new()
	Image50:setLeftRight( 0, 0, -30, 8 )
	Image50:setTopBottom( 0.5, 0.5, -195, -191 )
	Image50:setRGB( 0.82, 0.98, 1 )
	Image50:setZRot( 180 )
	Image50:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image50:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image50 )
	self.Image50 = Image50
	
	local Image60 = LUI.UIImage.new()
	Image60:setLeftRight( 1, 1, -6, 32 )
	Image60:setTopBottom( 0.5, 0.5, -194, -190 )
	Image60:setRGB( 0.82, 0.98, 1 )
	Image60:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image60:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image60 )
	self.Image60 = Image60
	
	local Image70 = LUI.UIImage.new()
	Image70:setLeftRight( 1, 1, -6, 32 )
	Image70:setTopBottom( 0.5, 0.5, -194, -190 )
	Image70:setRGB( 0.82, 0.98, 1 )
	Image70:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image70:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image70 )
	self.Image70 = Image70
	
	local TabBar3 = CoD.ChooseCharacterLoadout_TabBar.new( menu, controller )
	TabBar3:setLeftRight( 0, 0, -3, 762 )
	TabBar3:setTopBottom( 0, 0, 130, 172 )
	TabBar3:setRGB( 0.87, 0.99, 1 )
	self:addElement( TabBar3 )
	self.TabBar3 = TabBar3
	
	local classifiedIndex = LUI.UITightText.new()
	classifiedIndex:setLeftRight( 0, 0, 12, 312 )
	classifiedIndex:setTopBottom( 0, 0, 136, 166 )
	classifiedIndex:setRGB( 0, 0, 0 )
	classifiedIndex:setTTF( "fonts/escom.ttf" )
	classifiedIndex:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	classifiedIndex:setShaderVector( 0, 0.05, 0, 0, 0 )
	classifiedIndex:setShaderVector( 1, 0.02, 0, 0, 0 )
	classifiedIndex:setShaderVector( 2, 1, 0, 0, 0 )
	classifiedIndex:setLetterSpacing( 1 )
	classifiedIndex:linkToElementModel( self, "transmissionName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			classifiedIndex:setText( modelValue )
		end
	end )
	self:addElement( classifiedIndex )
	self.classifiedIndex = classifiedIndex
	
	local classifiedBorder = CoD.Border.new( menu, controller )
	classifiedBorder:setLeftRight( 0.5, 0.5, -381, 379 )
	classifiedBorder:setTopBottom( 0.5, 0.5, -193, 332 )
	classifiedBorder:setRGB( 0.87, 0.99, 1 )
	self:addElement( classifiedBorder )
	self.classifiedBorder = classifiedBorder
	
	local Image341 = LUI.UIImage.new()
	Image341:setLeftRight( 1, 1, -3, 3 )
	Image341:setTopBottom( 1, 1, -414, -408 )
	Image341:setRGB( 0.82, 0.98, 1 )
	Image341:setZRot( 180 )
	Image341:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image341:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image341 )
	self.Image341 = Image341
	
	local Image350 = LUI.UIImage.new()
	Image350:setLeftRight( 1, 1, -5, 1 )
	Image350:setTopBottom( 1, 1, -414, -408 )
	Image350:setRGB( 0.82, 0.98, 1 )
	Image350:setXRot( 180 )
	Image350:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image350:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image350 )
	self.Image350 = Image350
	
	local Image400 = LUI.UIImage.new()
	Image400:setLeftRight( 1, 1, -761, -755 )
	Image400:setTopBottom( 1, 1, -414, -408 )
	Image400:setRGB( 0.82, 0.98, 1 )
	Image400:setZRot( 180 )
	Image400:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image400:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image400 )
	self.Image400 = Image400
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( 1, 1, -762, -756 )
	Image41:setTopBottom( 1, 1, -414, -408 )
	Image41:setRGB( 0.82, 0.98, 1 )
	Image41:setXRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local Image280 = LUI.UIImage.new()
	Image280:setLeftRight( 1, 1, -5, 1 )
	Image280:setTopBottom( 1, 1, -460, -454 )
	Image280:setRGB( 0.82, 0.98, 1 )
	Image280:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image280:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image280 )
	self.Image280 = Image280
	
	local Image290 = LUI.UIImage.new()
	Image290:setLeftRight( 1, 1, -3, 3 )
	Image290:setTopBottom( 1, 1, -460, -454 )
	Image290:setRGB( 0.82, 0.98, 1 )
	Image290:setYRot( 180 )
	Image290:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image290:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image290 )
	self.Image290 = Image290
	
	local Image321 = LUI.UIImage.new()
	Image321:setLeftRight( 1, 1, -3, 3 )
	Image321:setTopBottom( 1, 1, -555, -549 )
	Image321:setRGB( 0.82, 0.98, 1 )
	Image321:setZRot( 180 )
	Image321:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image321:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image321 )
	self.Image321 = Image321
	
	local Image331 = LUI.UIImage.new()
	Image331:setLeftRight( 1, 1, -5, 1 )
	Image331:setTopBottom( 1, 1, -555, -549 )
	Image331:setRGB( 0.82, 0.98, 1 )
	Image331:setXRot( 180 )
	Image331:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image331:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image331 )
	self.Image331 = Image331
	
	local Image36 = LUI.UIImage.new()
	Image36:setLeftRight( 1, 1, -761, -755 )
	Image36:setTopBottom( 1, 1, -556, -550 )
	Image36:setRGB( 0.82, 0.98, 1 )
	Image36:setZRot( 180 )
	Image36:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image36:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image36 )
	self.Image36 = Image36
	
	local Image37 = LUI.UIImage.new()
	Image37:setLeftRight( 1, 1, -762, -756 )
	Image37:setTopBottom( 1, 1, -556, -550 )
	Image37:setRGB( 0.82, 0.98, 1 )
	Image37:setXRot( 180 )
	Image37:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image37:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image37 )
	self.Image37 = Image37
	
	local Image38 = LUI.UIImage.new()
	Image38:setLeftRight( 1, 1, -762, -756 )
	Image38:setTopBottom( 1, 1, -460, -454 )
	Image38:setRGB( 0.82, 0.98, 1 )
	Image38:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image38:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image38 )
	self.Image38 = Image38
	
	local Image39 = LUI.UIImage.new()
	Image39:setLeftRight( 1, 1, -761, -755 )
	Image39:setTopBottom( 1, 1, -460, -454 )
	Image39:setRGB( 0.82, 0.98, 1 )
	Image39:setYRot( 180 )
	Image39:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image39:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image39 )
	self.Image39 = Image39
	
	local transmissionFrequency = LUI.UIText.new()
	transmissionFrequency:setLeftRight( 0, 0, 344, 552 )
	transmissionFrequency:setTopBottom( 0, 0, 9, 39 )
	transmissionFrequency:setRGB( 0.82, 0.98, 1 )
	transmissionFrequency:setAlpha( 0.8 )
	transmissionFrequency:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	transmissionFrequency:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	transmissionFrequency:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	transmissionFrequency:linkToElementModel( self, "transmissionFrequency", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			transmissionFrequency:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( transmissionFrequency )
	self.transmissionFrequency = transmissionFrequency
	
	local buttonprompt0 = CoD.buttonprompt.new( menu, controller )
	buttonprompt0:setLeftRight( 0, 0, 569, 758 )
	buttonprompt0:setTopBottom( 0, 0, 31, 77 )
	buttonprompt0.label:setText( Engine.Localize( "HEROES_PLAY_AUDIO" ) )
	buttonprompt0:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonprompt0.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( buttonprompt0 )
	self.buttonprompt0 = buttonprompt0
	
	local waveFormBorder = CoD.Border.new( menu, controller )
	waveFormBorder:setLeftRight( 0.5, 0.5, -37, 173 )
	waveFormBorder:setTopBottom( 0.5, 0.5, -293, -225 )
	waveFormBorder:setRGB( 0.87, 0.99, 1 )
	self:addElement( waveFormBorder )
	self.waveFormBorder = waveFormBorder
	
	local waveForm = CoD.ChooseCharacterLoadout_CardBack_TransmissionWaveForm.new( menu, controller )
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
	waveForm:setLeftRight( 0, 0, 344, 552 )
	waveForm:setTopBottom( 0, 0, 39, 107 )
	waveForm:linkToElementModel( self, nil, false, function ( model )
		waveForm:setModel( model, controller )
	end )
	self:addElement( waveForm )
	self.waveForm = waveForm
	
	local contacts = CoD.ChooseCharacterLoadout_CardBack_TransmissionContactsList.new( menu, controller )
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
	contacts:setLeftRight( 0, 0, 552, 744 )
	contacts:setTopBottom( 0, 0, 172.5, 607.5 )
	contacts:linkToElementModel( self, nil, false, function ( model )
		contacts:setModel( model, controller )
	end )
	self:addElement( contacts )
	self.contacts = contacts
	
	self.resetProperties = function ()
		face:completeAnimation()
		keyline10:completeAnimation()
		Border10:completeAnimation()
		keyline1:completeAnimation()
		frequencyLabel:completeAnimation()
		face:setAlpha( 1 )
		keyline10:setAlpha( 0.7 )
		Border10:setAlpha( 1 )
		keyline1:setAlpha( 0.7 )
		frequencyLabel:setAlpha( 0.8 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				local frequencyLabelFrame2 = function ( frequencyLabel, event )
					if not event.interrupted then
						frequencyLabel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					frequencyLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( frequencyLabel, event )
					else
						frequencyLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				frequencyLabel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				frequencyLabel:setAlpha( 0 )
				frequencyLabel:registerEventHandler( "transition_complete_keyframe", frequencyLabelFrame2 )
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
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border10:close()
		self.completeAssignmentText:close()
		self.TabBar3:close()
		self.classifiedBorder:close()
		self.buttonprompt0:close()
		self.waveFormBorder:close()
		self.waveForm:close()
		self.contacts:close()
		self.face:close()
		self.classifiedIndex:close()
		self.transmissionFrequency:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

