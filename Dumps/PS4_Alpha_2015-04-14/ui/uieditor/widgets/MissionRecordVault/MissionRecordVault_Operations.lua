CoD.MissionRecordVault_Operations = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Operations.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Operations )
	self.id = "MissionRecordVault_Operations"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 468 )
	self:setTopBottom( true, false, 0, 235 )
	
	local EngagementBackground = LUI.UIImage.new()
	EngagementBackground:setLeftRight( true, false, 0, 468 )
	EngagementBackground:setTopBottom( false, false, -117.5, 117.5 )
	EngagementBackground:setRGB( 0.36, 0.36, 0.36 )
	EngagementBackground:setAlpha( 0.5 )
	EngagementBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( EngagementBackground )
	self.EngagementBackground = EngagementBackground
	
	local backgroundImage = LUI.UIImage.new()
	backgroundImage:setLeftRight( true, false, 0, 468 )
	backgroundImage:setTopBottom( false, false, -79.5, 117.5 )
	backgroundImage:setRGB( 1, 1, 1 )
	backgroundImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	backgroundImage:linkToElementModel( self, "operationsBackground", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			backgroundImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( backgroundImage )
	self.backgroundImage = backgroundImage
	
	local EngagementSubBG = LUI.UIImage.new()
	EngagementSubBG:setLeftRight( true, false, 8, 434.5 )
	EngagementSubBG:setTopBottom( false, false, -14.5, 109.5 )
	EngagementSubBG:setRGB( 0, 0.35, 0.62 )
	EngagementSubBG:setAlpha( 0.4 )
	EngagementSubBG:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( EngagementSubBG )
	self.EngagementSubBG = EngagementSubBG
	
	local EngageTitle = LUI.UIText.new()
	EngageTitle:setLeftRight( true, false, 14, 456.5 )
	EngageTitle:setTopBottom( false, false, -109.5, -84.5 )
	EngageTitle:setRGB( 1, 1, 1 )
	EngageTitle:setText( Engine.Localize( "CPUI_AREA_OF_OPERATIONS_TITLE" ) )
	EngageTitle:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	EngageTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageTitle )
	self.EngageTitle = EngageTitle
	
	local EngageDesc = LUI.UIText.new()
	EngageDesc:setLeftRight( true, false, 14, 428.5 )
	EngageDesc:setTopBottom( false, false, -9.5, 9.5 )
	EngageDesc:setRGB( 1, 1, 1 )
	EngageDesc:setText( Engine.Localize( "CPUI_AREA_OF_OPERATIONS_DESC" ) )
	EngageDesc:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	EngageDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EngageDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageDesc )
	self.EngageDesc = EngageDesc
	
	local EngageClose = LUI.UIText.new()
	EngageClose:setLeftRight( true, false, 19, 132 )
	EngageClose:setTopBottom( false, false, 30.5, 49.5 )
	EngageClose:setRGB( 1, 1, 1 )
	EngageClose:setText( Engine.Localize( "CPUI_ENGAGEMENT_CLOSE" ) )
	EngageClose:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	EngageClose:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	EngageClose:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageClose )
	self.EngageClose = EngageClose
	
	local EngageMid = LUI.UIText.new()
	EngageMid:setLeftRight( true, false, 19, 132 )
	EngageMid:setTopBottom( false, false, 57.5, 76.5 )
	EngageMid:setRGB( 1, 1, 1 )
	EngageMid:setText( Engine.Localize( "CPUI_ENGAGEMENT_MEDIUM" ) )
	EngageMid:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	EngageMid:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	EngageMid:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageMid )
	self.EngageMid = EngageMid
	
	local EngageLong = LUI.UIText.new()
	EngageLong:setLeftRight( true, false, 19, 132 )
	EngageLong:setTopBottom( false, false, 84.5, 103.5 )
	EngageLong:setRGB( 1, 1, 1 )
	EngageLong:setText( Engine.Localize( "CPUI_ENGAGEMENT_LONG" ) )
	EngageLong:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	EngageLong:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	EngageLong:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EngageLong )
	self.EngageLong = EngageLong
	
	local EngageCloseBox = LUI.UIImage.new()
	EngageCloseBox:setLeftRight( true, false, 277, 401 )
	EngageCloseBox:setTopBottom( false, false, 29.5, 50.5 )
	EngageCloseBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	EngageCloseBox:setShaderVector( 1, 0, 0, 0, 0 )
	EngageCloseBox:setShaderVector( 2, 1, 0, 0, 0 )
	EngageCloseBox:setShaderVector( 3, 0, 0, 0, 0 )
	EngageCloseBox:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "engageClose", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EngageCloseBox:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	EngageCloseBox:linkToElementModel( self, "engageClose", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EngageCloseBox:setRGB( MissionRecordVault_EngageRangeColor( modelValue ) )
		end
	end )
	self:addElement( EngageCloseBox )
	self.EngageCloseBox = EngageCloseBox
	
	local EngageMidBox = LUI.UIImage.new()
	EngageMidBox:setLeftRight( true, false, 277, 401 )
	EngageMidBox:setTopBottom( false, false, 56.5, 77.5 )
	EngageMidBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	EngageMidBox:setShaderVector( 1, 0, 0, 0, 0 )
	EngageMidBox:setShaderVector( 2, 1, 0, 0, 0 )
	EngageMidBox:setShaderVector( 3, 0, 0, 0, 0 )
	EngageMidBox:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "engageMedium", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EngageMidBox:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	EngageMidBox:linkToElementModel( self, "engageMedium", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EngageMidBox:setRGB( MissionRecordVault_EngageRangeColor( modelValue ) )
		end
	end )
	self:addElement( EngageMidBox )
	self.EngageMidBox = EngageMidBox
	
	local EngageLongBox = LUI.UIImage.new()
	EngageLongBox:setLeftRight( true, false, 277, 401 )
	EngageLongBox:setTopBottom( false, false, 82.5, 104.5 )
	EngageLongBox:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	EngageLongBox:setShaderVector( 1, 0, 0, 0, 0 )
	EngageLongBox:setShaderVector( 2, 1, 0, 0, 0 )
	EngageLongBox:setShaderVector( 3, 0, 0, 0, 0 )
	EngageLongBox:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "engageLong", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EngageLongBox:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	EngageLongBox:linkToElementModel( self, "engageLong", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EngageLongBox:setRGB( MissionRecordVault_EngageRangeColor( modelValue ) )
		end
	end )
	self:addElement( EngageLongBox )
	self.EngageLongBox = EngageLongBox
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 277, 153 )
	Image0:setTopBottom( false, false, 29.5, 50.5 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Image0:setShaderVector( 1, 0, 0, 0, 0 )
	Image0:setShaderVector( 2, 1, 0, 0, 0 )
	Image0:setShaderVector( 3, 0, 0, 0, 0 )
	Image0:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "engageClose", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image0:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Image0:linkToElementModel( self, "engageClose", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image0:setRGB( MissionRecordVault_EngageRangeColor( modelValue ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 276, 153 )
	Image1:setTopBottom( false, false, 56.5, 77.5 )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Image1:setShaderVector( 1, 0, 0, 0, 0 )
	Image1:setShaderVector( 2, 1, 0, 0, 0 )
	Image1:setShaderVector( 3, 0, 0, 0, 0 )
	Image1:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "engageMedium", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image1:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Image1:linkToElementModel( self, "engageMedium", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image1:setRGB( MissionRecordVault_EngageRangeColor( modelValue ) )
		end
	end )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 277, 153 )
	Image2:setTopBottom( false, false, 82.5, 104.5 )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Image2:setShaderVector( 1, 0, 0, 0, 0 )
	Image2:setShaderVector( 2, 1, 0, 0, 0 )
	Image2:setShaderVector( 3, 0, 0, 0, 0 )
	Image2:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "engageLong", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image2:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	Image2:linkToElementModel( self, "engageLong", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image2:setRGB( MissionRecordVault_EngageRangeColor( modelValue ) )
		end
	end )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local operationsLine = LUI.UIImage.new()
	operationsLine:setLeftRight( true, false, 276, 278 )
	operationsLine:setTopBottom( false, false, 25.5, 107.5 )
	operationsLine:setRGB( 1, 0.97, 0.67 )
	operationsLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( operationsLine )
	self.operationsLine = operationsLine
	
	self.close = function ( self )
		self.backgroundImage:close()
		self.EngageCloseBox:close()
		self.EngageMidBox:close()
		self.EngageLongBox:close()
		self.Image0:close()
		self.Image1:close()
		self.Image2:close()
		CoD.MissionRecordVault_Operations.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

