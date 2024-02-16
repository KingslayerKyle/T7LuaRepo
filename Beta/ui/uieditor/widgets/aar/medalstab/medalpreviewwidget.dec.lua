require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.AAR.MedalsTab.MedalXpWidget" )

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
	self:setLeftRight( true, false, 0, 287 )
	self:setTopBottom( true, false, 0, 465 )
	self.anyChildUsesUpdateState = true
	
	local TopPartBorder = CoD.Border.new( menu, controller )
	TopPartBorder:setLeftRight( true, false, 0, 286.57 )
	TopPartBorder:setTopBottom( true, false, 0, 281 )
	self:addElement( TopPartBorder )
	self.TopPartBorder = TopPartBorder
	
	local MedalImageBacking = LUI.UIImage.new()
	MedalImageBacking:setLeftRight( true, false, 32, 254.57 )
	MedalImageBacking:setTopBottom( true, false, 16.48, 238.48 )
	MedalImageBacking:setupUIStreamedImage( 0 )
	self:addElement( MedalImageBacking )
	self.MedalImageBacking = MedalImageBacking
	
	local MedalImage = LUI.UIImage.new()
	MedalImage:setLeftRight( true, false, 32, 254.57 )
	MedalImage:setTopBottom( true, false, 16.48, 238.48 )
	MedalImage:setupUIStreamedImage( 0 )
	self:addElement( MedalImage )
	self.MedalImage = MedalImage
	
	local Times = LUI.UIText.new()
	Times:setLeftRight( true, false, 0, 286.57 )
	Times:setTopBottom( true, false, 245.48, 281 )
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
	
	local BottomPartBorder = CoD.Border.new( menu, controller )
	BottomPartBorder:setLeftRight( true, false, 0, 286.57 )
	BottomPartBorder:setTopBottom( true, false, 281, 466.5 )
	self:addElement( BottomPartBorder )
	self.BottomPartBorder = BottomPartBorder
	
	local MedalName = LUI.UITightText.new()
	MedalName:setLeftRight( true, false, 12.29, 144.29 )
	MedalName:setTopBottom( true, false, 295.63, 325.63 )
	MedalName:setTTF( "fonts/default.ttf" )
	self:addElement( MedalName )
	self.MedalName = MedalName
	
	local MedalDescription = LUI.UIText.new()
	MedalDescription:setLeftRight( true, false, 12.29, 254.57 )
	MedalDescription:setTopBottom( true, false, 335.17, 360.17 )
	MedalDescription:setTTF( "fonts/default.ttf" )
	MedalDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MedalDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MedalDescription )
	self.MedalDescription = MedalDescription
	
	local XpBg = LUI.UIImage.new()
	XpBg:setLeftRight( true, false, 0, 286.57 )
	XpBg:setTopBottom( true, false, 400.5, 466.5 )
	XpBg:setRGB( 0, 0, 0 )
	XpBg:setAlpha( 0.31 )
	self:addElement( XpBg )
	self.XpBg = XpBg
	
	local MedalXpWidget0 = CoD.MedalXpWidget.new( menu, controller )
	MedalXpWidget0:setLeftRight( true, false, 32, 177.43 )
	MedalXpWidget0:setTopBottom( true, false, 410.35, 456.65 )
	MedalXpWidget0:linkToElementModel( self, "medalXP", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MedalXpWidget0.XpValue:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MedalXpWidget0 )
	self.MedalXpWidget0 = MedalXpWidget0
	
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
	self.MedalName:linkToElementModel( self, "medalIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MedalName:setText( GetAARMedalName( modelValue ) )
		end
	end )
	self.MedalDescription:linkToElementModel( self, "medalIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MedalDescription:setText( GetAARMedalDesc( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TopPartBorder:close()
		self.BottomPartBorder:close()
		self.MedalXpWidget0:close()
		self.MedalImageBacking:close()
		self.MedalImage:close()
		self.Times:close()
		self.MedalName:close()
		self.MedalDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

