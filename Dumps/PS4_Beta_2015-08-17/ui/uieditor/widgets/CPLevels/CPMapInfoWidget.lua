CoD.CPMapInfoWidget = InheritFrom( LUI.UIElement )
CoD.CPMapInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CPMapInfoWidget )
	self.id = "CPMapInfoWidget"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 817 )
	self:setTopBottom( true, false, 0, 260 )
	
	local MapPreviewImage = LUI.UIImage.new()
	MapPreviewImage:setLeftRight( true, false, 0, 817.1 )
	MapPreviewImage:setTopBottom( true, false, 0, 259.82 )
	MapPreviewImage:linkToElementModel( self, "Image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapPreviewImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( MapPreviewImage )
	self.MapPreviewImage = MapPreviewImage
	
	local MapName = LUI.UIText.new()
	MapName:setLeftRight( true, false, 8, 208 )
	MapName:setTopBottom( true, false, 204.69, 229.69 )
	MapName:setTTF( "fonts/default.ttf" )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MapName:linkToElementModel( self, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local MapLocation = LUI.UIText.new()
	MapLocation:setLeftRight( true, false, 8, 208 )
	MapLocation:setTopBottom( true, false, 229.69, 254.69 )
	MapLocation:setTTF( "fonts/default.ttf" )
	MapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MapLocation:linkToElementModel( self, "mapLocation", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapLocation:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MapLocation )
	self.MapLocation = MapLocation
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MapPreviewImage:close()
		self.MapName:close()
		self.MapLocation:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

