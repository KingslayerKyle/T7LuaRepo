-- 76efb1fb488ed8a459254f1ad254de6b
-- This hash is used for caching, delete to decompile the file again

CoD.CodCasterMiniMap = InheritFrom( LUI.UIElement )
CoD.CodCasterMiniMap.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterMiniMap )
	self.id = "CodCasterMiniMap"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 561 )
	self:setTopBottom( true, false, 0, 357 )
	
	local minimapMap = LUI.UIImage.new()
	minimapMap:setLeftRight( false, false, -179, 163 )
	minimapMap:setTopBottom( false, false, -151, 199 )
	minimapMap:setupCompassMap( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( minimapMap )
	self.minimapMap = minimapMap
	
	local minimapItems = LUI.UIImage.new()
	minimapItems:setLeftRight( false, false, -179, 163 )
	minimapItems:setTopBottom( false, false, -151, 199 )
	minimapItems:setupCompassItems( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( minimapItems )
	self.minimapItems = minimapItems
	
	local minimapOverlay = LUI.UIImage.new()
	minimapOverlay:setLeftRight( false, false, -287, 271 )
	minimapOverlay:setTopBottom( false, false, -114, 173 )
	minimapOverlay:setupCompassOverlay( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( minimapOverlay )
	self.minimapOverlay = minimapOverlay
	
	local namebacking = LUI.UIImage.new()
	namebacking:setLeftRight( true, false, 53, 195 )
	namebacking:setTopBottom( true, false, 70, 103 )
	namebacking:setImage( RegisterImage( "uie_t7_codcaster_mapbacker" ) )
	self:addElement( namebacking )
	self.namebacking = namebacking
	
	local mapTitle = LUI.UIText.new()
	mapTitle:setLeftRight( true, false, 74, 208 )
	mapTitle:setTopBottom( true, false, 72, 90 )
	mapTitle:setRGB( 0, 0, 0 )
	mapTitle:setTTF( "fonts/default.ttf" )
	mapTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	mapTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	mapTitle:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "mapName", function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			mapTitle:setText( Engine.Localize( mapName ) )
		end
	end )
	self:addElement( mapTitle )
	self.mapTitle = mapTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				minimapMap:completeAnimation()
				self.minimapMap:setAlpha( 0 )
				self.clipFinished( minimapMap, {} )
				minimapItems:completeAnimation()
				self.minimapItems:setAlpha( 0 )
				self.clipFinished( minimapItems, {} )
				minimapOverlay:completeAnimation()
				self.minimapOverlay:setAlpha( 0 )
				self.clipFinished( minimapOverlay, {} )
				namebacking:completeAnimation()
				self.namebacking:setAlpha( 0 )
				self.clipFinished( namebacking, {} )
				mapTitle:completeAnimation()
				self.mapTitle:setAlpha( 0 )
				self.clipFinished( mapTitle, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				minimapMap:completeAnimation()
				self.minimapMap:setAlpha( 1 )
				self.clipFinished( minimapMap, {} )
				minimapItems:completeAnimation()
				self.minimapItems:setAlpha( 1 )
				self.clipFinished( minimapItems, {} )
				minimapOverlay:completeAnimation()
				self.minimapOverlay:setAlpha( 1 )
				self.clipFinished( minimapOverlay, {} )
				namebacking:completeAnimation()
				self.namebacking:setAlpha( 1 )
				self.clipFinished( namebacking, {} )
				mapTitle:completeAnimation()
				self.mapTitle:setAlpha( 1 )
				self.clipFinished( mapTitle, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.mapTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

