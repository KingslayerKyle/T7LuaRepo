-- c9150de18ceacec2d11721ce4691e182
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.AAR.MedalsTab.MedalXpWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )

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
	self:setLeftRight( true, false, 0, 366 )
	self:setTopBottom( true, false, 0, 468 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, false, 0, 369 )
	StartMenuframenoBG0:setTopBottom( true, false, 0, 469 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local MedalImageBacking = LUI.UIImage.new()
	MedalImageBacking:setLeftRight( true, false, 71.71, 294.29 )
	MedalImageBacking:setTopBottom( true, false, 32.48, 254.48 )
	MedalImageBacking:setupUIStreamedImage( 0 )
	self:addElement( MedalImageBacking )
	self.MedalImageBacking = MedalImageBacking
	
	local MedalImage = LUI.UIImage.new()
	MedalImage:setLeftRight( true, false, 71.71, 294.29 )
	MedalImage:setTopBottom( true, false, 32.48, 254.48 )
	MedalImage:setupUIStreamedImage( 0 )
	self:addElement( MedalImage )
	self.MedalImage = MedalImage
	
	local Times = LUI.UIText.new()
	Times:setLeftRight( true, false, 0, 366 )
	Times:setTopBottom( true, false, 270.48, 306 )
	Times:setRGB( 1, 0.8, 0.4 )
	Times:setTTF( "fonts/default.ttf" )
	Times:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Times:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Times:linkToElementModel( self, "medalTimesObtained", true, function ( model )
		local medalTimesObtained = Engine.GetModelValue( model )
		if medalTimesObtained then
			Times:setText( Engine.Localize( GetAARMedalHitCount( medalTimesObtained ) ) )
		end
	end )
	self:addElement( Times )
	self.Times = Times
	
	local MedalXpWidget0 = CoD.MedalXpWidget.new( menu, controller )
	MedalXpWidget0:setLeftRight( true, false, 12.5, 157.94 )
	MedalXpWidget0:setTopBottom( true, false, 413.35, 459.65 )
	MedalXpWidget0:linkToElementModel( self, "medalXP", true, function ( model )
		local medalXP = Engine.GetModelValue( model )
		if medalXP then
			MedalXpWidget0.XpValue:setText( Engine.Localize( medalXP ) )
		end
	end )
	self:addElement( MedalXpWidget0 )
	self.MedalXpWidget0 = MedalXpWidget0
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( true, false, 186, 190 )
	featlineleft000:setTopBottom( true, false, 118.5, 498.5 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( true, false, 11.5, 330 )
	EmblemName:setTopBottom( true, false, 317.69, 351.69 )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( true, false, 12.5, 330.5 )
	EmblemSubtitle:setTopBottom( true, false, 355.69, 375.69 )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setLetterSpacing( 0.5 )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	self.MedalImageBacking:linkToElementModel( self, "medalIndex", true, function ( model )
		local medalIndex = Engine.GetModelValue( model )
		if medalIndex then
			MedalImageBacking:setImage( RegisterImage( GetAARMedalImageBackingLarge( medalIndex ) ) )
		end
	end )
	self.MedalImage:linkToElementModel( self, "medalIndex", true, function ( model )
		local medalIndex = Engine.GetModelValue( model )
		if medalIndex then
			MedalImage:setImage( RegisterImage( GetAARMedalImageLarge( medalIndex ) ) )
		end
	end )
	self.EmblemName:linkToElementModel( self, "medalIndex", true, function ( model )
		local medalIndex = Engine.GetModelValue( model )
		if medalIndex then
			EmblemName.weaponNameLabel:setText( Engine.Localize( GetAARMedalName( medalIndex ) ) )
		end
	end )
	self.EmblemSubtitle:linkToElementModel( self, "medalIndex", true, function ( model )
		local medalIndex = Engine.GetModelValue( model )
		if medalIndex then
			EmblemSubtitle:setText( Engine.Localize( GetAARMedalDesc( medalIndex ) ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.MedalXpWidget0:close()
		element.EmblemName:close()
		element.MedalImageBacking:close()
		element.MedalImage:close()
		element.Times:close()
		element.EmblemSubtitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
