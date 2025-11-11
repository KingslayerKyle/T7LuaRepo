require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.FileShare.FileshareCustomGamesLocalGameTypeImage" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

CoD.MyShowcase_CustomGameListInfo = InheritFrom( LUI.UIElement )
CoD.MyShowcase_CustomGameListInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MyShowcase_CustomGameListInfo )
	self.id = "MyShowcase_CustomGameListInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 600 )
	self.anyChildUsesUpdateState = true
	
	local FileshareGameTypeImage = CoD.FileshareCustomGamesLocalGameTypeImage.new( menu, controller )
	FileshareGameTypeImage:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	FileshareGameTypeImage:setLeftRight( 0.5, 0.5, -322, 322 )
	FileshareGameTypeImage:setTopBottom( 0, 0, 20, 406 )
	FileshareGameTypeImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareGameTypeImage.LocalGameTypeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( FileshareGameTypeImage )
	self.FileshareGameTypeImage = FileshareGameTypeImage
	
	local FileName = CoD.WeaponNameWidget.new( menu, controller )
	FileName:setLeftRight( 0, 0, 57, 691 )
	FileName:setTopBottom( 0, 0, 427.5, 478.5 )
	FileName:linkToElementModel( self, nil, false, function ( model )
		FileName:setModel( model, controller )
	end )
	FileName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileName.weaponNameLabel:setText( modelValue )
		end
	end )
	self:addElement( FileName )
	self.FileName = FileName
	
	local GameTypeName = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	GameTypeName:setLeftRight( 0, 0, 53, 695 )
	GameTypeName:setTopBottom( 0, 0, 488, 527 )
	GameTypeName.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GameTypeName:linkToElementModel( self, "gameTypeString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeName.SubTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GameTypeName )
	self.GameTypeName = GameTypeName
	
	local CustomGameDesc = LUI.UIText.new()
	CustomGameDesc:setLeftRight( 0, 0, 63, 697 )
	CustomGameDesc:setTopBottom( 0, 0, 529, 562 )
	CustomGameDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CustomGameDesc:setLetterSpacing( 0.5 )
	CustomGameDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CustomGameDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CustomGameDesc:linkToElementModel( self, "gameDescription", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CustomGameDesc:setText( modelValue )
		end
	end )
	self:addElement( CustomGameDesc )
	self.CustomGameDesc = CustomGameDesc
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FileshareGameTypeImage:close()
		self.FileName:close()
		self.GameTypeName:close()
		self.CustomGameDesc:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

