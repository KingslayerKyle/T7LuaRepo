CoD.MissionRecordVault_ReplayMissionMapInfo = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_ReplayMissionMapInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_ReplayMissionMapInfo )
	self.id = "MissionRecordVault_ReplayMissionMapInfo"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 765 )
	self:setTopBottom( true, false, 0, 534 )
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 0, 329 )
	Description:setTopBottom( true, false, 411.6, 436.6 )
	Description:setRGB( 1, 1, 1 )
	Description:setTTF( "fonts/default.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:linkToElementModel( self, "mapDescription", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local BriefingHeading = LUI.UITightText.new()
	BriefingHeading:setLeftRight( true, false, 0, 184 )
	BriefingHeading:setTopBottom( true, false, 386.71, 411.71 )
	BriefingHeading:setRGB( 1, 1, 1 )
	BriefingHeading:setText( Engine.Localize( "MENU_MISSION_BRIEFING_CAPS" ) )
	BriefingHeading:setTTF( "fonts/default.ttf" )
	self:addElement( BriefingHeading )
	self.BriefingHeading = BriefingHeading
	
	local MapPreviewImage = LUI.UIImage.new()
	MapPreviewImage:setLeftRight( true, true, 0, 0 )
	MapPreviewImage:setTopBottom( true, false, 0, 309 )
	MapPreviewImage:setRGB( 1, 1, 1 )
	MapPreviewImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	MapPreviewImage:linkToElementModel( self, "previewImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapPreviewImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( MapPreviewImage )
	self.MapPreviewImage = MapPreviewImage
	
	local MapLocationBacking = LUI.UIImage.new()
	MapLocationBacking:setLeftRight( true, true, 0, 0 )
	MapLocationBacking:setTopBottom( true, false, 309, 375 )
	MapLocationBacking:setRGB( 0.16, 0.16, 0.16 )
	MapLocationBacking:setAlpha( 0.7 )
	MapLocationBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( MapLocationBacking )
	self.MapLocationBacking = MapLocationBacking
	
	local MapLocation = LUI.UITightText.new()
	MapLocation:setLeftRight( true, false, 10, 775 )
	MapLocation:setTopBottom( true, false, 347, 371 )
	MapLocation:setRGB( 1, 1, 1 )
	MapLocation:setTTF( "fonts/default.ttf" )
	MapLocation:linkToElementModel( self, "mapLocation", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapLocation:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MapLocation )
	self.MapLocation = MapLocation
	
	local MapName = LUI.UITightText.new()
	MapName:setLeftRight( true, false, 7, 755 )
	MapName:setTopBottom( true, false, 309, 353 )
	MapName:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	MapName:setTTF( "fonts/default.ttf" )
	MapName:setLetterSpacing( -1.5 )
	MapName:linkToElementModel( self, "mapNameCaps", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	local missionRecordRowBG = LUI.UIImage.new()
	missionRecordRowBG:setLeftRight( true, true, 0, 0 )
	missionRecordRowBG:setTopBottom( true, false, 284, 309 )
	missionRecordRowBG:setRGB( 0.16, 0.16, 0.16 )
	missionRecordRowBG:setAlpha( 0.7 )
	missionRecordRowBG:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( missionRecordRowBG )
	self.missionRecordRowBG = missionRecordRowBG
	
	local NonDestructiveMessage = LUI.UIText.new()
	NonDestructiveMessage:setLeftRight( true, true, 30, 0 )
	NonDestructiveMessage:setTopBottom( true, false, 284, 306 )
	NonDestructiveMessage:setRGB( 1, 1, 1 )
	NonDestructiveMessage:setText( Engine.Localize( "MENU_REPLAYING_MISSION_NOTICE" ) )
	NonDestructiveMessage:setTTF( "fonts/agencyr.ttf" )
	NonDestructiveMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	NonDestructiveMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NonDestructiveMessage )
	self.NonDestructiveMessage = NonDestructiveMessage
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 329, 513 )
	Label0:setTopBottom( true, false, 386.71, 411.71 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setText( Engine.Localize( "MENU_MISSION_PERFORMANCE_RECORD" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 329, 585 )
	Image1:setTopBottom( true, false, 415.71, 437.71 )
	Image1:setRGB( 0.75, 0.75, 0.75 )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 329, 585 )
	Image2:setTopBottom( true, false, 437.71, 516.71 )
	Image2:setRGB( 0.37, 0.37, 0.37 )
	Image2:setAlpha( 0.6 )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 338, 446 )
	Image3:setTopBottom( true, false, 465.71, 507.71 )
	Image3:setRGB( 0, 0, 0 )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local TextBox3 = LUI.UIText.new()
	TextBox3:setLeftRight( true, false, 330, 585 )
	TextBox3:setTopBottom( true, false, 415.71, 437.71 )
	TextBox3:setRGB( 0, 0, 0 )
	TextBox3:setText( Engine.Localize( "MPUI_PERSONAL_BESTS_CAPS" ) )
	TextBox3:setTTF( "fonts/default.ttf" )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox3 )
	self.TextBox3 = TextBox3
	
	local TextBox4 = LUI.UIText.new()
	TextBox4:setLeftRight( true, false, 335, 450 )
	TextBox4:setTopBottom( true, false, 470.21, 503.21 )
	TextBox4:setRGB( 1, 1, 1 )
	TextBox4:setText( Engine.Localize( "--" ) )
	TextBox4:setTTF( "fonts/default.ttf" )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4 )
	self.TextBox4 = TextBox4
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 467, 575 )
	Image4:setTopBottom( true, false, 465.71, 507.71 )
	Image4:setRGB( 0, 0, 0 )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 464, 579 )
	TextBox0:setTopBottom( true, false, 470.21, 503.21 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setText( Engine.Localize( "--" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 330, 457.5 )
	TextBox2:setTopBottom( true, false, 443.71, 465.71 )
	TextBox2:setRGB( 1, 1, 1 )
	TextBox2:setText( Engine.Localize( "MENU_TIME" ) )
	TextBox2:setTTF( "fonts/agencyr.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local TextBox5 = LUI.UIText.new()
	TextBox5:setLeftRight( true, false, 457, 584.5 )
	TextBox5:setTopBottom( true, false, 443.71, 465.71 )
	TextBox5:setRGB( 1, 1, 1 )
	TextBox5:setText( Engine.Localize( "MENU_INDIVIDUAL_SCORE" ) )
	TextBox5:setTTF( "fonts/agencyr.ttf" )
	TextBox5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox5 )
	self.TextBox5 = TextBox5
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 592, 765.5 )
	Image5:setTopBottom( true, false, 415.71, 437.71 )
	Image5:setRGB( 0.75, 0.75, 0.75 )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 592, 765.5 )
	Image6:setTopBottom( true, false, 437.71, 516.71 )
	Image6:setRGB( 0.37, 0.37, 0.37 )
	Image6:setAlpha( 0.6 )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, false, 621, 733.5 )
	Image7:setTopBottom( true, false, 465.71, 507.71 )
	Image7:setRGB( 0, 0, 0 )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local TextBox6 = LUI.UIText.new()
	TextBox6:setLeftRight( true, false, 593, 765.5 )
	TextBox6:setTopBottom( true, false, 415.71, 437.71 )
	TextBox6:setRGB( 0, 0, 0 )
	TextBox6:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	TextBox6:setTTF( "fonts/default.ttf" )
	TextBox6:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox6:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox6 )
	self.TextBox6 = TextBox6
	
	local TextBox7 = LUI.UIText.new()
	TextBox7:setLeftRight( true, false, 621, 733.5 )
	TextBox7:setTopBottom( true, false, 473.71, 499.71 )
	TextBox7:setRGB( 1, 1, 1 )
	TextBox7:setText( Engine.Localize( "$(collectiblesFound) of $(collectiblesTotal)" ) )
	TextBox7:setTTF( "fonts/default.ttf" )
	TextBox7:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox7:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox7 )
	self.TextBox7 = TextBox7
	
	local TextBox9 = LUI.UIText.new()
	TextBox9:setLeftRight( true, false, 593, 765 )
	TextBox9:setTopBottom( true, false, 443.71, 465.71 )
	TextBox9:setRGB( 1, 1, 1 )
	TextBox9:setText( Engine.Localize( "MENU_FOUND" ) )
	TextBox9:setTTF( "fonts/agencyr.ttf" )
	TextBox9:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox9:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox9 )
	self.TextBox9 = TextBox9
	
	local WarningTriangle = LUI.UIImage.new()
	WarningTriangle:setLeftRight( true, false, 3, 27 )
	WarningTriangle:setTopBottom( true, false, 284, 308 )
	WarningTriangle:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	WarningTriangle:setImage( RegisterImage( "uie_warning_triangle" ) )
	WarningTriangle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( WarningTriangle )
	self.WarningTriangle = WarningTriangle
	
	self.close = function ( self )
		self.Description:close()
		self.MapPreviewImage:close()
		self.MapLocation:close()
		self.MapName:close()
		CoD.MissionRecordVault_ReplayMissionMapInfo.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

