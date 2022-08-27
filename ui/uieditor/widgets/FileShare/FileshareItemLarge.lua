-- a095a766fc0600cf9525b5e5e343c533
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false ), "isNormalSize", false )
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
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 350 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 350 )
	BG:setTopBottom( true, false, 0, 290 )
	BG:setRGB( 0.4, 0.4, 0.4 )
	BG:setAlpha( 0 )
	self:addElement( BG )
	self.BG = BG
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, false, -2, 352 )
	BoxButtonLrgIdle:setTopBottom( true, false, -2, 324.5 )
	BoxButtonLrgIdle:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( true, false, 0, 350 )
	WCFileshareIconExtraCamRender:setTopBottom( false, true, -350, -60 )
	WCFileshareIconExtraCamRender:linkToElementModel( self, "fileId", true, function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, fileId ) )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local ImageViewer = LUI.UIElement.new()
	ImageViewer:setLeftRight( true, false, 0, 350 )
	ImageViewer:setTopBottom( false, true, -350, -153.13 )
	ImageViewer:setAlpha( 0 )
	ImageViewer:linkToElementModel( self, "fileId", true, function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			ImageViewer:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", fileId ) )
		end
	end )
	self:addElement( ImageViewer )
	self.ImageViewer = ImageViewer
	
	local WeaponName = LUI.UITightText.new()
	WeaponName:setLeftRight( true, false, 2.5, 350 )
	WeaponName:setTopBottom( true, false, 325, 350 )
	WeaponName:setTTF( "fonts/default.ttf" )
	WeaponName:linkToElementModel( self, "weaponName", true, function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			WeaponName:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local FileCreateTime = LUI.UITightText.new()
	FileCreateTime:setLeftRight( true, false, 2.5, 350 )
	FileCreateTime:setTopBottom( true, false, 325, 350 )
	FileCreateTime:setTTF( "fonts/default.ttf" )
	FileCreateTime:linkToElementModel( self, "fileCreateTime", true, function ( model )
		local fileCreateTime = Engine.GetModelValue( model )
		if fileCreateTime then
			FileCreateTime:setText( Engine.Localize( fileCreateTime ) )
		end
	end )
	self:addElement( FileCreateTime )
	self.FileCreateTime = FileCreateTime
	
	local ItemNameBg = LUI.UIImage.new()
	ItemNameBg:setLeftRight( true, false, 0, 350 )
	ItemNameBg:setTopBottom( true, false, 290, 322 )
	ItemNameBg:setAlpha( 0.8 )
	self:addElement( ItemNameBg )
	self.ItemNameBg = ItemNameBg
	
	local ItemName = LUI.UITightText.new()
	ItemName:setLeftRight( true, false, 2.5, 350 )
	ItemName:setTopBottom( true, false, 292, 322 )
	ItemName:setRGB( 0, 0, 0 )
	ItemName:setTTF( "fonts/default.ttf" )
	ItemName:linkToElementModel( self, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			ItemName:setText( fileName )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local GameTypeImage = LUI.UIImage.new()
	GameTypeImage:setLeftRight( false, false, -135, 135 )
	GameTypeImage:setTopBottom( false, false, -170, 100 )
	GameTypeImage:setAlpha( 0 )
	self:addElement( GameTypeImage )
	self.GameTypeImage = GameTypeImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, false, -2.5, 352 )
	StartMenuframenoBG0:setTopBottom( true, false, -1, 352 )
	StartMenuframenoBG0:setAlpha( 0.85 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.GameTypeImage:linkToElementModel( self, "gameTypeImage", true, function ( model )
		local gameTypeImage = Engine.GetModelValue( model )
		if gameTypeImage then
			GameTypeImage:setImage( RegisterImage( gameTypeImage ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BG:completeAnimation()
				self.BG:setLeftRight( true, false, 0, 350 )
				self.BG:setTopBottom( true, false, 0, 290 )
				self.clipFinished( BG, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( true, false, -2, 352 )
				self.BoxButtonLrgIdle:setTopBottom( true, false, -2, 324.5 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				WCFileshareIconExtraCamRender:completeAnimation()
				self.WCFileshareIconExtraCamRender:setLeftRight( true, false, 0, 350 )
				self.WCFileshareIconExtraCamRender:setTopBottom( false, true, -350, -60 )
				self.WCFileshareIconExtraCamRender:setAlpha( 1 )
				self.clipFinished( WCFileshareIconExtraCamRender, {} )
				ImageViewer:completeAnimation()
				self.ImageViewer:setAlpha( 0 )
				self.clipFinished( ImageViewer, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setLeftRight( true, false, 2.5, 350 )
				self.WeaponName:setTopBottom( true, false, 325, 350 )
				self.WeaponName:setAlpha( 1 )
				self.clipFinished( WeaponName, {} )
				FileCreateTime:completeAnimation()
				self.FileCreateTime:setLeftRight( true, false, 2.5, 350 )
				self.FileCreateTime:setTopBottom( true, false, 325, 350 )
				self.FileCreateTime:setAlpha( 0 )
				self.clipFinished( FileCreateTime, {} )
				ItemNameBg:completeAnimation()
				self.ItemNameBg:setLeftRight( true, false, 0, 350 )
				self.ItemNameBg:setTopBottom( true, false, 290, 322 )
				self.clipFinished( ItemNameBg, {} )
				ItemName:completeAnimation()
				self.ItemName:setLeftRight( true, false, 2.5, 350 )
				self.ItemName:setTopBottom( true, false, 292, 322 )
				self.clipFinished( ItemName, {} )
				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 0 )
				self.clipFinished( GameTypeImage, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, -2.5, 352 )
				self.StartMenuframenoBG0:setTopBottom( true, false, -1, 352 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		},
		ScreenShot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BG:completeAnimation()
				self.BG:setLeftRight( true, false, 0, 350 )
				self.BG:setTopBottom( true, false, 0, 290 )
				self.clipFinished( BG, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( true, false, -2, 352 )
				self.BoxButtonLrgIdle:setTopBottom( true, false, -2, 228.88 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				WCFileshareIconExtraCamRender:completeAnimation()
				self.WCFileshareIconExtraCamRender:setLeftRight( true, false, 0, 350 )
				self.WCFileshareIconExtraCamRender:setTopBottom( false, true, -350, -60 )
				self.WCFileshareIconExtraCamRender:setAlpha( 0 )
				self.clipFinished( WCFileshareIconExtraCamRender, {} )
				ImageViewer:completeAnimation()
				self.ImageViewer:setAlpha( 1 )
				self.clipFinished( ImageViewer, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setLeftRight( true, false, 2.5, 350 )
				self.WeaponName:setTopBottom( true, false, 325, 350 )
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( WeaponName, {} )
				FileCreateTime:completeAnimation()
				self.FileCreateTime:setLeftRight( true, false, 2.5, 350 )
				self.FileCreateTime:setTopBottom( true, false, 231.88, 256.88 )
				self.FileCreateTime:setAlpha( 1 )
				self.clipFinished( FileCreateTime, {} )
				ItemNameBg:completeAnimation()
				self.ItemNameBg:setLeftRight( true, false, 0, 350 )
				self.ItemNameBg:setTopBottom( true, false, 196.88, 228.88 )
				self.clipFinished( ItemNameBg, {} )
				ItemName:completeAnimation()
				self.ItemName:setLeftRight( true, false, 2.5, 350 )
				self.ItemName:setTopBottom( true, false, 198.88, 228.88 )
				self.clipFinished( ItemName, {} )
				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 0 )
				self.clipFinished( GameTypeImage, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, true, -2.5, 2 )
				self.StartMenuframenoBG0:setTopBottom( true, true, -1, -88 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		},
		GameType = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BG:completeAnimation()
				self.BG:setLeftRight( true, false, 0, 350 )
				self.BG:setTopBottom( true, false, 0, 290 )
				self.clipFinished( BG, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( true, false, -2, 352 )
				self.BoxButtonLrgIdle:setTopBottom( true, false, -2, 324.5 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				WCFileshareIconExtraCamRender:completeAnimation()
				self.WCFileshareIconExtraCamRender:setLeftRight( true, false, 0, 350 )
				self.WCFileshareIconExtraCamRender:setTopBottom( false, true, -350, -60 )
				self.WCFileshareIconExtraCamRender:setAlpha( 0 )
				self.clipFinished( WCFileshareIconExtraCamRender, {} )
				ImageViewer:completeAnimation()
				self.ImageViewer:setAlpha( 0 )
				self.clipFinished( ImageViewer, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setLeftRight( true, false, 2.5, 350 )
				self.WeaponName:setTopBottom( true, false, 325, 350 )
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( WeaponName, {} )
				FileCreateTime:completeAnimation()
				self.FileCreateTime:setLeftRight( true, false, 2.5, 350 )
				self.FileCreateTime:setTopBottom( true, false, 325, 350 )
				self.FileCreateTime:setAlpha( 1 )
				self.clipFinished( FileCreateTime, {} )
				ItemNameBg:completeAnimation()
				self.ItemNameBg:setLeftRight( true, false, 0, 350 )
				self.ItemNameBg:setTopBottom( true, false, 290, 322 )
				self.clipFinished( ItemNameBg, {} )
				ItemName:completeAnimation()
				self.ItemName:setLeftRight( true, false, 2.5, 350 )
				self.ItemName:setTopBottom( true, false, 292, 322 )
				self.clipFinished( ItemName, {} )
				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 1 )
				self.clipFinished( GameTypeImage, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, false, -2.5, 352 )
				self.StartMenuframenoBG0:setTopBottom( true, false, -1, 352 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		},
		Short = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BG:completeAnimation()
				self.BG:setLeftRight( true, false, 0, 350 )
				self.BG:setTopBottom( true, false, 0, 215 )
				self.clipFinished( BG, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( true, false, -2, 352 )
				self.BoxButtonLrgIdle:setTopBottom( true, false, -2, 247 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				WCFileshareIconExtraCamRender:completeAnimation()
				self.WCFileshareIconExtraCamRender:setLeftRight( true, false, 0, 350 )
				self.WCFileshareIconExtraCamRender:setTopBottom( false, true, -350, -135 )
				self.WCFileshareIconExtraCamRender:setAlpha( 1 )
				self.clipFinished( WCFileshareIconExtraCamRender, {} )
				ImageViewer:completeAnimation()
				self.ImageViewer:setAlpha( 0 )
				self.clipFinished( ImageViewer, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( WeaponName, {} )
				FileCreateTime:completeAnimation()
				self.FileCreateTime:setLeftRight( true, false, 2.5, 350 )
				self.FileCreateTime:setTopBottom( true, false, 325, 350 )
				self.FileCreateTime:setAlpha( 0 )
				self.clipFinished( FileCreateTime, {} )
				ItemNameBg:completeAnimation()
				self.ItemNameBg:setLeftRight( true, false, 0, 350 )
				self.ItemNameBg:setTopBottom( true, false, 215, 247 )
				self.clipFinished( ItemNameBg, {} )
				ItemName:completeAnimation()
				self.ItemName:setLeftRight( true, false, 2.5, 350 )
				self.ItemName:setTopBottom( true, false, 217, 247 )
				self.clipFinished( ItemName, {} )
				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 0 )
				self.clipFinished( GameTypeImage, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, true, -2.5, 2 )
				self.StartMenuframenoBG0:setTopBottom( true, true, -1, -101 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end
		},
		Clip = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BG:completeAnimation()
				self.BG:setLeftRight( true, false, 0, 350 )
				self.BG:setTopBottom( true, false, 0, 290 )
				self.clipFinished( BG, {} )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setLeftRight( true, false, -2, 352 )
				self.BoxButtonLrgIdle:setTopBottom( true, false, -2, 228.88 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				WCFileshareIconExtraCamRender:completeAnimation()
				self.WCFileshareIconExtraCamRender:setLeftRight( true, false, 0, 350 )
				self.WCFileshareIconExtraCamRender:setTopBottom( false, true, -350, -60 )
				self.WCFileshareIconExtraCamRender:setAlpha( 0 )
				self.clipFinished( WCFileshareIconExtraCamRender, {} )
				ImageViewer:completeAnimation()
				self.ImageViewer:setAlpha( 1 )
				self.clipFinished( ImageViewer, {} )
				WeaponName:completeAnimation()
				self.WeaponName:setLeftRight( true, false, 2.5, 350 )
				self.WeaponName:setTopBottom( true, false, 325, 350 )
				self.WeaponName:setAlpha( 0 )
				self.clipFinished( WeaponName, {} )
				FileCreateTime:completeAnimation()
				self.FileCreateTime:setLeftRight( true, false, 2.5, 350 )
				self.FileCreateTime:setTopBottom( true, false, 231.88, 256.88 )
				self.FileCreateTime:setAlpha( 1 )
				self.clipFinished( FileCreateTime, {} )
				ItemNameBg:completeAnimation()
				self.ItemNameBg:setLeftRight( true, false, 0, 350 )
				self.ItemNameBg:setTopBottom( true, false, 196.88, 228.88 )
				self.clipFinished( ItemNameBg, {} )
				ItemName:completeAnimation()
				self.ItemName:setLeftRight( true, false, 2.5, 350 )
				self.ItemName:setTopBottom( true, false, 198.88, 228.88 )
				self.clipFinished( ItemName, {} )
				GameTypeImage:completeAnimation()
				self.GameTypeImage:setAlpha( 0 )
				self.clipFinished( GameTypeImage, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, true, -2.5, 2 )
				self.StartMenuframenoBG0:setTopBottom( true, true, -1, -88 )
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
			stateName = "Clip",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "fileshareRoot.currentCategory", "clip" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgIdle:close()
		element.StartMenuframenoBG0:close()
		element.WCFileshareIconExtraCamRender:close()
		element.ImageViewer:close()
		element.WeaponName:close()
		element.FileCreateTime:close()
		element.ItemName:close()
		element.GameTypeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

