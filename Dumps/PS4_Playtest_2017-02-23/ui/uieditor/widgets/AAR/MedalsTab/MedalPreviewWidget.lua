require( "ui.uieditor.widgets.AAR.MedalsTab.MedalXpWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.MedalPreviewWidget = InheritFrom( LUI.UIElement )
CoD.MedalPreviewWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MedalPreviewWidget )
	self.id = "MedalPreviewWidget"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 549 )
	self:setTopBottom( 0, 0, 0, 702 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 0, 0, 554 )
	StartMenuframenoBG0:setTopBottom( 0, 0, 0, 704 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local MedalImageBacking = LUI.UIImage.new()
	MedalImageBacking:setLeftRight( 0, 0, 107, 441 )
	MedalImageBacking:setTopBottom( 0, 0, 49, 382 )
	MedalImageBacking:setupUIStreamedImage( 0 )
	self:addElement( MedalImageBacking )
	self.MedalImageBacking = MedalImageBacking
	
	local MedalImage = LUI.UIImage.new()
	MedalImage:setLeftRight( 0, 0, 107, 441 )
	MedalImage:setTopBottom( 0, 0, 49, 382 )
	MedalImage:setupUIStreamedImage( 0 )
	self:addElement( MedalImage )
	self.MedalImage = MedalImage
	
	local Times = LUI.UIText.new()
	Times:setLeftRight( 0, 0, 0, 549 )
	Times:setTopBottom( 0, 0, 406, 459 )
	Times:setRGB( 1, 0.8, 0.4 )
	Times:setTTF( "fonts/default.ttf" )
	Times:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Times:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Times:linkToElementModel( self, "medalTimesObtained", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Times:setText( Engine.Localize( GetAARMedalHitCount( modelValue ) ) )
		end
	end )
	self:addElement( Times )
	self.Times = Times
	
	local MedalXpWidget0 = CoD.MedalXpWidget.new( menu, controller )
	MedalXpWidget0:setLeftRight( 0, 0, 19, 237 )
	MedalXpWidget0:setTopBottom( 0, 0, 620, 689 )
	MedalXpWidget0:linkToElementModel( self, "medalXP", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MedalXpWidget0.XpValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MedalXpWidget0 )
	self.MedalXpWidget0 = MedalXpWidget0
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( 0, 0, 279, 285 )
	featlineleft000:setTopBottom( 0, 0, 178, 748 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( 0, 0, 17, 495 )
	EmblemName:setTopBottom( 0, 0, 476.5, 527.5 )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( 0, 0, 19, 496 )
	EmblemSubtitle:setTopBottom( 0, 0, 534, 564 )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setLetterSpacing( 0.5 )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	self.MedalImageBacking:linkToElementModel( self, "medalIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MedalImageBacking:setImage( RegisterImage( GetAARMedalImageBackingLarge( modelValue ) ) )
		end
	end )
	self.MedalImage:linkToElementModel( self, "medalIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MedalImage:setImage( RegisterImage( GetAARMedalImageLarge( modelValue ) ) )
		end
	end )
	self.EmblemName:linkToElementModel( self, "medalIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( GetAARMedalName( modelValue ) )
		end
	end )
	self.EmblemSubtitle:linkToElementModel( self, "medalIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemSubtitle:setText( GetAARMedalDesc( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.MedalXpWidget0:close()
		self.EmblemName:close()
		self.MedalImageBacking:close()
		self.MedalImage:close()
		self.Times:close()
		self.EmblemSubtitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

