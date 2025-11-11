require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	Engine.CreateModel( rootModel, "isNormalSize", false )
end

CoD.FileshareItemLarge = InheritFrom( LUI.UIElement )
CoD.FileshareItemLarge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareItemLarge )
	self.id = "FileshareItemLarge"
	self.soundSet = "Paintshop"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 525 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 525 )
	BG:setTopBottom( 0, 0, 0, 435 )
	BG:setRGB( 0.4, 0.4, 0.4 )
	BG:setAlpha( 0 )
	self:addElement( BG )
	self.BG = BG
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 0, -3, 528 )
	BoxButtonLrgIdle:setTopBottom( 0, 0, -3, 487 )
	BoxButtonLrgIdle:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( 0, 0, 0, 525 )
	WCFileshareIconExtraCamRender:setTopBottom( 1, 1, -525, -90 )
	WCFileshareIconExtraCamRender:linkToElementModel( self, "fileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, modelValue ) )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local ImageViewer = LUI.UIElement.new()
	ImageViewer:setLeftRight( 0, 0, 0, 525 )
	ImageViewer:setTopBottom( 1, 1, -525, -230 )
	ImageViewer:setAlpha( 0 )
	ImageViewer:linkToElementModel( self, "fileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageViewer:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", modelValue ) )
		end
	end )
	self:addElement( ImageViewer )
	self.ImageViewer = ImageViewer
	
	local WeaponName = LUI.UITightText.new()
	WeaponName:setLeftRight( 0, 0, 4, 525 )
	WeaponName:setTopBottom( 0, 0, 487, 525 )
	WeaponName:setTTF( "fonts/default.ttf" )
	WeaponName:linkToElementModel( self, "weaponName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local FileCreateTime = LUI.UITightText.new()
	FileCreateTime:setLeftRight( 0, 0, 4, 525 )
	FileCreateTime:setTopBottom( 0, 0, 487, 525 )
	FileCreateTime:setTTF( "fonts/default.ttf" )
	FileCreateTime:linkToElementModel( self, "fileCreateTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileCreateTime:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FileCreateTime )
	self.FileCreateTime = FileCreateTime
	
	local ItemNameBg = LUI.UIImage.new()
	ItemNameBg:setLeftRight( 0, 0, 0, 525 )
	ItemNameBg:setTopBottom( 0, 0, 435, 483 )
	ItemNameBg:setAlpha( 0.8 )
	self:addElement( ItemNameBg )
	self.ItemNameBg = ItemNameBg
	
	local ItemName = LUI.UITightText.new()
	ItemName:setLeftRight( 0, 0, 4, 525 )
	ItemName:setTopBottom( 0, 0, 438, 483 )
	ItemName:setRGB( 0, 0, 0 )
	ItemName:setTTF( "fonts/default.ttf" )
	ItemName:linkToElementModel( self, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ItemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( 0.5, 0.5, -202.5, 202.5 )
	GameTypeImage:setTopBottom( 0.5, 0.5, -255, 150 )
	GameTypeImage:setAlpha( 0 )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 0, -4, 528 )
	StartMenuframenoBG0:setTopBottom( 0, 0, -2, 528 )
	StartMenuframenoBG0:setAlpha( 0.85 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.GameTypeImage:linkToElementModel( self, "gameTypeImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		FileCreateTime:completeAnimation()
		ItemNameBg:completeAnimation()
		WeaponName:completeAnimation()
		WCFileshareIconExtraCamRender:completeAnimation()
		ItemName:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		ImageViewer:completeAnimation()
		StartMenuframenoBG0:completeAnimation()
		GameTypeImage:completeAnimation()
		BG:completeAnimation()
		FileCreateTime:setLeftRight( 0, 0, 4, 525 )
		FileCreateTime:setTopBottom( 0, 0, 487, 525 )
		FileCreateTime:setAlpha( 1 )
		ItemNameBg:setLeftRight( 0, 0, 0, 525 )
		ItemNameBg:setTopBottom( 0, 0, 435, 483 )
		WeaponName:setAlpha( 1 )
		WCFileshareIconExtraCamRender:setLeftRight( 0, 0, 0, 525 )
		WCFileshareIconExtraCamRender:setTopBottom( 1, 1, -525, -90 )
		WCFileshareIconExtraCamRender:setAlpha( 1 )
		ItemName:setLeftRight( 0, 0, 4, 525 )
		ItemName:setTopBottom( 0, 0, 438, 483 )
		BoxButtonLrgIdle:setLeftRight( 0, 0, -3, 528 )
		BoxButtonLrgIdle:setTopBottom( 0, 0, -3, 487 )
		ImageViewer:setAlpha( 0 )
		StartMenuframenoBG0:setLeftRight( 0, 0, -4, 528 )
		StartMenuframenoBG0:setTopBottom( 0, 0, -2, 528 )
		GameTypeImage:setAlpha( 0 )
		BG:setLeftRight( 0, 0, 0, 525 )
		BG:setTopBottom( 0, 0, 0, 435 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FileCreateTime:completeAnimation()
				self.FileCreateTime:setAlpha( 0 )
				self.clipFinished( FileCreateTime, {} )
			end
		},
		ScreenShot = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( 0, 0, -3, 528 )
				self.BoxButtonLrgIdle:setTopBottom( 0, 0, -3, 343 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				WCFileshareIconExtraCamRender:completeAnimation()
				self.WCFileshareIconExtraCamRender:setAlpha( 0 )
				self.clipFinished( WCFileshareIconExtraCamRender, {} )
				ImageViewer:completeAnimation()
				self.ImageViewer:setAlpha( 1 )
				self.clipFinished( ImageViewer, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( WeaponName, {} )
				FileCreateTime:completeAnimation()
				self.FileCreateTime:setLeftRight( 0, 0, 4, 525 )
				self.FileCreateTime:setTopBottom( 0, 0, 348, 386 )
				self.clipFinished( FileCreateTime, {} )
				ItemNameBg:completeAnimation()
				self.ItemNameBg:setLeftRight( 0, 0, 0, 525 )
				self.ItemNameBg:setTopBottom( 0, 0, 295, 343 )
				self.clipFinished( ItemNameBg, {} )
				ItemName:completeAnimation()
				self.ItemName:setLeftRight( 0, 0, 4, 525 )
				self.ItemName:setTopBottom( 0, 0, 298, 343 )
				self.clipFinished( ItemName, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( 0, 1, -3, 3 )
				self.StartMenuframenoBG0:setTopBottom( 0, 1, -2, -132 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		},
		GameType = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				WCFileshareIconExtraCamRender:completeAnimation()
				self.WCFileshareIconExtraCamRender:setAlpha( 0 )
				self.clipFinished( WCFileshareIconExtraCamRender, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( WeaponName, {} )
				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 1 )
				self.clipFinished( GameTypeImage, {} )
			end
		},
		Short = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				BG:completeAnimation()
				self.BG:setLeftRight( 0, 0, 0, 525 )
				self.BG:setTopBottom( 0, 0, 0.5, 322.5 )
				self.clipFinished( BG, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( 0, 0, -3, 528 )
				self.BoxButtonLrgIdle:setTopBottom( 0, 0, -3, 371 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				WCFileshareIconExtraCamRender:completeAnimation()
				self.WCFileshareIconExtraCamRender:setLeftRight( 0, 0, 0, 525 )
				self.WCFileshareIconExtraCamRender:setTopBottom( 1, 1, -524.5, -202.5 )
				self.clipFinished( WCFileshareIconExtraCamRender, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( WeaponName, {} )
				FileCreateTime:completeAnimation()
				self.FileCreateTime:setAlpha( 0 )
				self.clipFinished( FileCreateTime, {} )
				ItemNameBg:completeAnimation()
				self.ItemNameBg:setLeftRight( 0, 0, 0, 525 )
				self.ItemNameBg:setTopBottom( 0, 0, 322, 370 )
				self.clipFinished( ItemNameBg, {} )
				ItemName:completeAnimation()
				self.ItemName:setLeftRight( 0, 0, 4, 525 )
				self.ItemName:setTopBottom( 0, 0, 325, 370 )
				self.clipFinished( ItemName, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( 0, 1, -3, 3 )
				self.StartMenuframenoBG0:setTopBottom( 0, 1, -1, -151 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ScreenShot",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "screenshot" )
			end
		},
		{
			stateName = "GameType",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "customgame" )
			end
		},
		{
			stateName = "Short",
			condition = function ( menu, element, event )
				return not FileshareShowNormalSizeIcons( element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.currentCategory" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.currentCategory"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isNormalSize" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isNormalSize"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgIdle:close()
		self.StartMenuframenoBG0:close()
		self.WCFileshareIconExtraCamRender:close()
		self.ImageViewer:close()
		self.WeaponName:close()
		self.FileCreateTime:close()
		self.ItemName:close()
		self.GameTypeImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

