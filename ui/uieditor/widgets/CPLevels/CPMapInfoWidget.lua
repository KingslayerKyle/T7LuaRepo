-- 66df7d2856b08c0b0d40046d9480272c
-- This hash is used for caching, delete to decompile the file again

CoD.CPMapInfoWidget = InheritFrom( LUI.UIElement )
CoD.CPMapInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CPMapInfoWidget )
	self.id = "CPMapInfoWidget"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 587 )
	self:setTopBottom( true, false, 0, 281 )
	
	local MapPreviewImage = LUI.UIImage.new()
	MapPreviewImage:setLeftRight( true, false, 0, 587 )
	MapPreviewImage:setTopBottom( true, false, 0, 281 )
	MapPreviewImage:linkToElementModel( self, "Image", true, function ( model )
		local Image = Engine.GetModelValue( model )
		if Image then
			MapPreviewImage:setImage( RegisterImage( Image ) )
		end
	end )
	self:addElement( MapPreviewImage )
	self.MapPreviewImage = MapPreviewImage
	
	local MapName = LUI.UIText.new()
	MapName:setLeftRight( true, true, 8, -8 )
	MapName:setTopBottom( true, false, 236, 258 )
	MapName:setTTF( "fonts/default.ttf" )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MapName:linkToElementModel( self, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			MapName:setText( Engine.Localize( mapName ) )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local MapLocation = LUI.UIText.new()
	MapLocation:setLeftRight( true, true, 8, -8 )
	MapLocation:setTopBottom( true, false, 258, 276 )
	MapLocation:setTTF( "fonts/default.ttf" )
	MapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapLocation:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	MapLocation:linkToElementModel( self, "mapLocation", true, function ( model )
		local mapLocation = Engine.GetModelValue( model )
		if mapLocation then
			MapLocation:setText( Engine.Localize( mapLocation ) )
		end
	end )
	self:addElement( MapLocation )
	self.MapLocation = MapLocation
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MapPreviewImage:close()
		element.MapName:close()
		element.MapLocation:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

