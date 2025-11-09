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
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 153 )
	self.anyChildUsesUpdateState = true
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( true, true, 0, 0 )
	BorderThin0:setTopBottom( true, true, 0, 0 )
	BorderThin0:setAlpha( 0.3 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, true, 0, -0.33 )
	Title:setTopBottom( false, true, -52.5, -34.5 )
	Title:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "medalRef", true, function ( model )
		local medalRef = Engine.GetModelValue( model )
		if medalRef then
			Title:setText( Engine.Localize( medalRef ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Value = LUI.UIText.new()
	Value:setLeftRight( true, true, 0, -0.33 )
	Value:setTopBottom( false, true, -34.5, -2.5 )
	Value:setRGB( 1, 0.8, 0.4 )
	Value:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Value:linkToElementModel( self, "value", true, function ( model )
		local value = Engine.GetModelValue( model )
		if value then
			Value:setText( Engine.Localize( value ) )
		end
	end )
	self:addElement( Value )
	self.Value = Value
	
	local MedalBacking = LUI.UIImage.new()
	MedalBacking:setLeftRight( true, false, 17.83, 101.83 )
	MedalBacking:setTopBottom( true, false, 7, 91 )
	MedalBacking:setupUIStreamedImage( 0 )
	MedalBacking:linkToElementModel( self, "backingLarge", true, function ( model )
		local backingLarge = Engine.GetModelValue( model )
		if backingLarge then
			MedalBacking:setImage( RegisterImage( backingLarge ) )
		end
	end )
	self:addElement( MedalBacking )
	self.MedalBacking = MedalBacking
	
	local MedalImage = LUI.UIImage.new()
	MedalImage:setLeftRight( true, false, 17.83, 101.83 )
	MedalImage:setTopBottom( true, false, 7, 91 )
	MedalImage:setupUIStreamedImage( 0 )
	MedalImage:linkToElementModel( self, "iconLarge", true, function ( model )
		local iconLarge = Engine.GetModelValue( model )
		if iconLarge then
			MedalImage:setImage( RegisterImage( iconLarge ) )
		end
	end )
	self:addElement( MedalImage )
	self.MedalImage = MedalImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderThin0:close()
		element.StartMenuframenoBG0:close()
		element.Title:close()
		element.Value:close()
		element.MedalBacking:close()
		element.MedalImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

