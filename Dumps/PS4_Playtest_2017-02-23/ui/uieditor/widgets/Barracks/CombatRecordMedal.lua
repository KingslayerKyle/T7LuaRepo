require( "ui.uieditor.widgets.BorderThin" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.CombatRecordMedal = InheritFrom( LUI.UIElement )
CoD.CombatRecordMedal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordMedal )
	self.id = "CombatRecordMedal"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 229 )
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( 0, 1, 0, 0 )
	BorderThin0:setTopBottom( 0, 1, 0, 0 )
	BorderThin0:setAlpha( 0.3 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 1, -0.5, -0.5 )
	Title:setTopBottom( 1, 1, -79, -52 )
	Title:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "medalRef", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Value = LUI.UIText.new()
	Value:setLeftRight( 0, 1, 0, 0 )
	Value:setTopBottom( 1, 1, -52, -4 )
	Value:setRGB( 1, 0.8, 0.4 )
	Value:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Value:linkToElementModel( self, "value", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Value:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Value )
	self.Value = Value
	
	local MedalBacking = LUI.UIImage.new()
	MedalBacking:setLeftRight( 0, 0, 27, 153 )
	MedalBacking:setTopBottom( 0, 0, 11, 137 )
	MedalBacking:setupUIStreamedImage( 0 )
	MedalBacking:linkToElementModel( self, "backingLarge", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MedalBacking:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( MedalBacking )
	self.MedalBacking = MedalBacking
	
	local MedalImage = LUI.UIImage.new()
	MedalImage:setLeftRight( 0, 0, 27, 153 )
	MedalImage:setTopBottom( 0, 0, 11, 137 )
	MedalImage:setupUIStreamedImage( 0 )
	MedalImage:linkToElementModel( self, "iconLarge", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MedalImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( MedalImage )
	self.MedalImage = MedalImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, -2 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderThin0:close()
		self.StartMenuframenoBG0:close()
		self.Title:close()
		self.Value:close()
		self.MedalBacking:close()
		self.MedalImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

