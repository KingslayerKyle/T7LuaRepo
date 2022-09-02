-- b6137fe7cf9cc053953e6a9fccf0b46d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_FaceScannerFoundBox" )
require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_FaceScanner_Flipbook" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_dotblinkwidget" )
require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_FaceScanner_LoadingLines" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_DniWidget" )
require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_FaceScanner_CircleDots" )
require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_FaceScannerCircleDash" )
require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_FaceScannerBlurLines" )
require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_FaceScannerFailedBox" )
require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_FaceScannerDots" )

CoD.CP_Prologue_FaceScannerWidget = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_FaceScannerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_FaceScannerWidget )
	self.id = "CP_Prologue_FaceScannerWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 279 )
	self:setTopBottom( true, false, 0, 324 )
	self.anyChildUsesUpdateState = true
	
	local CPPrologueFaceScannerFoundBox = CoD.CP_Prologue_FaceScannerFoundBox.new( menu, controller )
	CPPrologueFaceScannerFoundBox:setLeftRight( true, false, 44, 234.5 )
	CPPrologueFaceScannerFoundBox:setTopBottom( true, false, 63, 301 )
	CPPrologueFaceScannerFoundBox:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerFoundBox )
	self.CPPrologueFaceScannerFoundBox = CPPrologueFaceScannerFoundBox
	
	local CPPrologueFaceScannerFlipbook = CoD.CP_Prologue_FaceScanner_Flipbook.new( menu, controller )
	CPPrologueFaceScannerFlipbook:setLeftRight( true, false, 43.5, 235.5 )
	CPPrologueFaceScannerFlipbook:setTopBottom( true, false, 62, 302 )
	CPPrologueFaceScannerFlipbook.PrologueFlipbok:setShaderVector( 1, 6, 0, 0, 0 )
	self:addElement( CPPrologueFaceScannerFlipbook )
	self.CPPrologueFaceScannerFlipbook = CPPrologueFaceScannerFlipbook
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame0:setLeftRight( true, false, 43.5, 235.5 )
	FEFeaturedFrame0:setTopBottom( true, false, 62, 302 )
	FEFeaturedFrame0:setAlpha( 0.3 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 17.5, 45.5 )
	Image10:setTopBottom( false, false, 138, 142 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 232.5, 260.5 )
	Image0:setTopBottom( false, false, 138, 142 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 232.5, 260.5 )
	Image2:setTopBottom( false, false, -101, -97 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, false, 43.5, 235.5 )
	TitleBg:setTopBottom( true, false, 38, 61 )
	TitleBg:setRGB( 0, 0.3, 0.47 )
	TitleBg:setAlpha( 0.4 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 43.5, 235.5 )
	Image3:setTopBottom( true, false, 14, 37 )
	Image3:setRGB( 0, 0, 0 )
	Image3:setAlpha( 0.4 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 102, 181 )
	Title:setTopBottom( true, false, 17, 36 )
	Title:setText( Engine.Localize( "MPUI_BLACKHAT_SCANNING" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setLetterSpacing( 0.5 )
	self:addElement( Title )
	self.Title = Title
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( false, false, -80.5, 80 )
	Label0:setTopBottom( false, false, -121, -104 )
	Label0:setText( Engine.Localize( "ANALYZING BIOMETRICS" ) )
	Label0:setTTF( "fonts/escom.ttf" )
	Label0:setLetterSpacing( 0.5 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 17.5, 45.5 )
	Image4:setTopBottom( false, false, -101, -97 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 232.5, 260.5 )
	Image5:setTopBottom( false, false, -149, -145 )
	Image5:setZRot( 180 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 17.5, 45.5 )
	Image6:setTopBottom( false, false, -149, -145 )
	Image6:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local CenterDotL = CoD.outofbounds_dotblinkwidget.new( menu, controller )
	CenterDotL:setLeftRight( false, false, -99.5, -91.5 )
	CenterDotL:setTopBottom( false, false, -103, -95 )
	CenterDotL:setScale( 0.7 )
	self:addElement( CenterDotL )
	self.CenterDotL = CenterDotL
	
	local outofboundsdotblinkwidget0 = CoD.outofbounds_dotblinkwidget.new( menu, controller )
	outofboundsdotblinkwidget0:setLeftRight( false, false, 92, 100 )
	outofboundsdotblinkwidget0:setTopBottom( false, false, -103, -95 )
	outofboundsdotblinkwidget0:setScale( 0.7 )
	self:addElement( outofboundsdotblinkwidget0 )
	self.outofboundsdotblinkwidget0 = outofboundsdotblinkwidget0
	
	local outofboundsdotblinkwidget1 = CoD.outofbounds_dotblinkwidget.new( menu, controller )
	outofboundsdotblinkwidget1:setLeftRight( false, false, -100.5, -92.5 )
	outofboundsdotblinkwidget1:setTopBottom( false, false, 136, 144 )
	outofboundsdotblinkwidget1:setScale( 0.7 )
	self:addElement( outofboundsdotblinkwidget1 )
	self.outofboundsdotblinkwidget1 = outofboundsdotblinkwidget1
	
	local outofboundsdotblinkwidget2 = CoD.outofbounds_dotblinkwidget.new( menu, controller )
	outofboundsdotblinkwidget2:setLeftRight( false, false, 91, 99 )
	outofboundsdotblinkwidget2:setTopBottom( false, false, 136, 144 )
	outofboundsdotblinkwidget2:setScale( 0.7 )
	self:addElement( outofboundsdotblinkwidget2 )
	self.outofboundsdotblinkwidget2 = outofboundsdotblinkwidget2
	
	local CPPrologueFaceScannerLoadingLines = CoD.CP_Prologue_FaceScanner_LoadingLines.new( menu, controller )
	CPPrologueFaceScannerLoadingLines:setLeftRight( true, false, 45.5, 232 )
	CPPrologueFaceScannerLoadingLines:setTopBottom( true, false, 301, 316 )
	self:addElement( CPPrologueFaceScannerLoadingLines )
	self.CPPrologueFaceScannerLoadingLines = CPPrologueFaceScannerLoadingLines
	
	local DNImod = CoD.DniWipe_DniWidget.new( menu, controller )
	DNImod:setLeftRight( true, false, 113.5, 165.5 )
	DNImod:setTopBottom( true, false, 254.5, 311.5 )
	DNImod:setScale( 0.8 )
	self:addElement( DNImod )
	self.DNImod = DNImod
	
	local CPPrologueFaceScannerCircleDots = CoD.CP_Prologue_FaceScanner_CircleDots.new( menu, controller )
	CPPrologueFaceScannerCircleDots:setLeftRight( true, false, 36.63, 242 )
	CPPrologueFaceScannerCircleDots:setTopBottom( true, false, 60.56, 265.94 )
	CPPrologueFaceScannerCircleDots:setAlpha( 0.6 )
	self:addElement( CPPrologueFaceScannerCircleDots )
	self.CPPrologueFaceScannerCircleDots = CPPrologueFaceScannerCircleDots
	
	local CPPrologueFaceScannerCircleDash = CoD.CP_Prologue_FaceScannerCircleDash.new( menu, controller )
	CPPrologueFaceScannerCircleDash:setLeftRight( true, false, 78.13, 205.37 )
	CPPrologueFaceScannerCircleDash:setTopBottom( true, false, 99.63, 226.87 )
	CPPrologueFaceScannerCircleDash:setAlpha( 0.52 )
	CPPrologueFaceScannerCircleDash:setScale( 2 )
	self:addElement( CPPrologueFaceScannerCircleDash )
	self.CPPrologueFaceScannerCircleDash = CPPrologueFaceScannerCircleDash
	
	local CPPrologueFaceScannerBlurLines = CoD.CP_Prologue_FaceScannerBlurLines.new( menu, controller )
	CPPrologueFaceScannerBlurLines:setLeftRight( true, false, -41.66, 319.34 )
	CPPrologueFaceScannerBlurLines:setTopBottom( true, false, -16.91, 344.09 )
	self:addElement( CPPrologueFaceScannerBlurLines )
	self.CPPrologueFaceScannerBlurLines = CPPrologueFaceScannerBlurLines
	
	local CPPrologueFaceScannerFailedBox = CoD.CP_Prologue_FaceScannerFailedBox.new( menu, controller )
	CPPrologueFaceScannerFailedBox:setLeftRight( true, false, 44, 234.5 )
	CPPrologueFaceScannerFailedBox:setTopBottom( true, false, 63, 301 )
	CPPrologueFaceScannerFailedBox:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerFailedBox )
	self.CPPrologueFaceScannerFailedBox = CPPrologueFaceScannerFailedBox
	
	local FailedBox = LUI.UIImage.new()
	FailedBox:setLeftRight( true, false, 48, 230.5 )
	FailedBox:setTopBottom( true, false, 148.59, 174.59 )
	FailedBox:setRGB( 0, 0, 0 )
	FailedBox:setAlpha( 0 )
	self:addElement( FailedBox )
	self.FailedBox = FailedBox
	
	local FailedText = LUI.UITightText.new()
	FailedText:setLeftRight( true, false, 107, 169.5 )
	FailedText:setTopBottom( true, false, 147.96, 173.5 )
	FailedText:setAlpha( 0 )
	FailedText:setText( Engine.Localize( "FAILED" ) )
	FailedText:setTTF( "fonts/escom.ttf" )
	FailedText:setLetterSpacing( 0.5 )
	self:addElement( FailedText )
	self.FailedText = FailedText
	
	local CenterlineTop = LUI.UIImage.new()
	CenterlineTop:setLeftRight( false, false, -95.5, 95 )
	CenterlineTop:setTopBottom( false, false, -4.41, -7.41 )
	CenterlineTop:setAlpha( 0 )
	CenterlineTop:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	CenterlineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterlineTop )
	self.CenterlineTop = CenterlineTop
	
	local CPPrologueFaceScannerDots = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots:setLeftRight( true, false, 173, 181 )
	CPPrologueFaceScannerDots:setTopBottom( true, false, 136.96, 144.96 )
	CPPrologueFaceScannerDots:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots )
	self.CPPrologueFaceScannerDots = CPPrologueFaceScannerDots
	
	local CPPrologueFaceScannerDots0 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots0:setLeftRight( true, false, 169.5, 177.5 )
	CPPrologueFaceScannerDots0:setTopBottom( true, false, 112.96, 120.96 )
	CPPrologueFaceScannerDots0:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots0 )
	self.CPPrologueFaceScannerDots0 = CPPrologueFaceScannerDots0
	
	local CPPrologueFaceScannerDots1 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots1:setLeftRight( true, false, 143.5, 151.5 )
	CPPrologueFaceScannerDots1:setTopBottom( true, false, 99.63, 107.63 )
	CPPrologueFaceScannerDots1:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots1 )
	self.CPPrologueFaceScannerDots1 = CPPrologueFaceScannerDots1
	
	local CPPrologueFaceScannerDots2 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots2:setLeftRight( true, false, 141.75, 149.75 )
	CPPrologueFaceScannerDots2:setTopBottom( true, false, 144.59, 152.59 )
	CPPrologueFaceScannerDots2:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots2 )
	self.CPPrologueFaceScannerDots2 = CPPrologueFaceScannerDots2
	
	local CPPrologueFaceScannerDots3 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots3:setLeftRight( true, false, 141.75, 149.75 )
	CPPrologueFaceScannerDots3:setTopBottom( true, false, 120.96, 128.96 )
	CPPrologueFaceScannerDots3:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots3 )
	self.CPPrologueFaceScannerDots3 = CPPrologueFaceScannerDots3
	
	local CPPrologueFaceScannerDots4 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots4:setLeftRight( true, false, 141.75, 149.75 )
	CPPrologueFaceScannerDots4:setTopBottom( true, false, 229.59, 237.59 )
	CPPrologueFaceScannerDots4:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots4 )
	self.CPPrologueFaceScannerDots4 = CPPrologueFaceScannerDots4
	
	local CPPrologueFaceScannerDots5 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots5:setLeftRight( true, false, 177, 185 )
	CPPrologueFaceScannerDots5:setTopBottom( true, false, 200.59, 208.59 )
	CPPrologueFaceScannerDots5:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots5 )
	self.CPPrologueFaceScannerDots5 = CPPrologueFaceScannerDots5
	
	local CPPrologueFaceScannerDots6 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots6:setLeftRight( true, false, 141.75, 149.75 )
	CPPrologueFaceScannerDots6:setTopBottom( true, false, 229.59, 237.59 )
	CPPrologueFaceScannerDots6:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots6 )
	self.CPPrologueFaceScannerDots6 = CPPrologueFaceScannerDots6
	
	local CPPrologueFaceScannerDots7 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots7:setLeftRight( true, false, 141.75, 149.75 )
	CPPrologueFaceScannerDots7:setTopBottom( true, false, 170.59, 178.59 )
	CPPrologueFaceScannerDots7:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots7 )
	self.CPPrologueFaceScannerDots7 = CPPrologueFaceScannerDots7
	
	local CPPrologueFaceScannerDots8 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots8:setLeftRight( true, false, 157.5, 165.5 )
	CPPrologueFaceScannerDots8:setTopBottom( true, false, 166.59, 174.59 )
	CPPrologueFaceScannerDots8:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots8 )
	self.CPPrologueFaceScannerDots8 = CPPrologueFaceScannerDots8
	
	local CPPrologueFaceScannerDots9 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots9:setLeftRight( true, false, 173, 181 )
	CPPrologueFaceScannerDots9:setTopBottom( true, false, 158.59, 166.59 )
	CPPrologueFaceScannerDots9:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots9 )
	self.CPPrologueFaceScannerDots9 = CPPrologueFaceScannerDots9
	
	local CPPrologueFaceScannerDots10 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots10:setLeftRight( true, false, 165, 173 )
	CPPrologueFaceScannerDots10:setTopBottom( true, false, 218.87, 226.87 )
	CPPrologueFaceScannerDots10:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots10 )
	self.CPPrologueFaceScannerDots10 = CPPrologueFaceScannerDots10
	
	local CPPrologueFaceScannerDots11 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots11:setLeftRight( true, false, 161.5, 169.5 )
	CPPrologueFaceScannerDots11:setTopBottom( true, false, 140.96, 148.96 )
	CPPrologueFaceScannerDots11:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots11 )
	self.CPPrologueFaceScannerDots11 = CPPrologueFaceScannerDots11
	
	local CPPrologueFaceScannerDots12 = CoD.CP_Prologue_FaceScannerDots.new( menu, controller )
	CPPrologueFaceScannerDots12:setLeftRight( true, false, 147.5, 155.5 )
	CPPrologueFaceScannerDots12:setTopBottom( true, false, 143.96, 151.96 )
	CPPrologueFaceScannerDots12:setAlpha( 0 )
	self:addElement( CPPrologueFaceScannerDots12 )
	self.CPPrologueFaceScannerDots12 = CPPrologueFaceScannerDots12
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Scanning = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				CPPrologueFaceScannerFlipbook:completeAnimation()

				CPPrologueFaceScannerFlipbook.PrologueFlipbok:completeAnimation()
				self.CPPrologueFaceScannerFlipbook:setLeftRight( true, false, 43.5, 235.5 )
				self.CPPrologueFaceScannerFlipbook:setTopBottom( true, false, 62, 302 )
				self.CPPrologueFaceScannerFlipbook:setAlpha( 1 )
				self.CPPrologueFaceScannerFlipbook.PrologueFlipbok:setShaderVector( 1, 6, 0, 0, 0 )
				self.clipFinished( CPPrologueFaceScannerFlipbook, {} )

				TitleBg:completeAnimation()
				self.TitleBg:setLeftRight( true, false, 43.5, 235.5 )
				self.TitleBg:setTopBottom( true, false, 38, 61 )
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )

				Image3:completeAnimation()
				self.Image3:setLeftRight( true, false, 43.5, 235.5 )
				self.Image3:setTopBottom( true, false, 14, 37 )
				self.Image3:setRGB( 0, 0, 0 )
				self.Image3:setAlpha( 0.4 )
				self.clipFinished( Image3, {} )

				Title:completeAnimation()
				self.Title:setLeftRight( true, false, 102, 181 )
				self.Title:setTopBottom( true, false, 17, 36 )
				self.Title:setAlpha( 1 )
				self.Title:setText( Engine.Localize( "MPUI_BLACKHAT_SCANNING" ) )
				self.clipFinished( Title, {} )

				Label0:completeAnimation()
				self.Label0:setText( Engine.Localize( "MENU_CP_PROLOGUE_ANALYZING" ) )
				self.clipFinished( Label0, {} )

				CPPrologueFaceScannerCircleDots:completeAnimation()
				self.CPPrologueFaceScannerCircleDots:setLeftRight( true, false, 36.63, 242 )
				self.CPPrologueFaceScannerCircleDots:setTopBottom( true, false, 60.56, 265.94 )
				self.CPPrologueFaceScannerCircleDots:setAlpha( 0.6 )
				self.clipFinished( CPPrologueFaceScannerCircleDots, {} )

				CPPrologueFaceScannerCircleDash:completeAnimation()
				self.CPPrologueFaceScannerCircleDash:setLeftRight( true, false, 78.13, 205.37 )
				self.CPPrologueFaceScannerCircleDash:setTopBottom( true, false, 99.63, 226.87 )
				self.CPPrologueFaceScannerCircleDash:setAlpha( 0.5 )
				self.CPPrologueFaceScannerCircleDash:setScale( 2 )
				self.clipFinished( CPPrologueFaceScannerCircleDash, {} )

				CPPrologueFaceScannerBlurLines:completeAnimation()
				self.CPPrologueFaceScannerBlurLines:setLeftRight( true, false, -41.66, 319.34 )
				self.CPPrologueFaceScannerBlurLines:setTopBottom( true, false, -16.91, 344.09 )
				self.CPPrologueFaceScannerBlurLines:setAlpha( 1 )
				self.clipFinished( CPPrologueFaceScannerBlurLines, {} )

				CPPrologueFaceScannerFailedBox:completeAnimation()
				self.CPPrologueFaceScannerFailedBox:setAlpha( 0 )
				self.clipFinished( CPPrologueFaceScannerFailedBox, {} )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )

				CPPrologueFaceScannerFoundBox:completeAnimation()
				self.CPPrologueFaceScannerFoundBox:setLeftRight( true, false, 44, 234.5 )
				self.CPPrologueFaceScannerFoundBox:setTopBottom( true, false, 63, 301 )
				self.CPPrologueFaceScannerFoundBox:setAlpha( 1 )
				self.clipFinished( CPPrologueFaceScannerFoundBox, {} )

				CPPrologueFaceScannerFlipbook:completeAnimation()

				CPPrologueFaceScannerFlipbook.PrologueFlipbok:completeAnimation()
				self.CPPrologueFaceScannerFlipbook.PrologueFlipbok:setShaderVector( 1, 0, 0, 0, 0 )
				self.clipFinished( CPPrologueFaceScannerFlipbook, {} )

				Image3:completeAnimation()
				self.Image3:setLeftRight( true, false, 43.5, 235.5 )
				self.Image3:setTopBottom( true, false, 14, 37 )
				self.Image3:setAlpha( 0.4 )
				self.clipFinished( Image3, {} )

				Title:completeAnimation()
				self.Title:setLeftRight( true, false, 90.5, 169.5 )
				self.Title:setTopBottom( true, false, 17, 36 )
				self.Title:setText( Engine.Localize( "MENU_CP_PROLOGUE_FOUND" ) )
				self.clipFinished( Title, {} )

				Label0:completeAnimation()
				self.Label0:setText( Engine.Localize( "MENU_CP_PROLOGUE_ANALYZING" ) )
				self.clipFinished( Label0, {} )

				CPPrologueFaceScannerCircleDash:completeAnimation()
				self.CPPrologueFaceScannerCircleDash:setAlpha( 0 )
				self.clipFinished( CPPrologueFaceScannerCircleDash, {} )

				CPPrologueFaceScannerFailedBox:completeAnimation()
				self.CPPrologueFaceScannerFailedBox:setAlpha( 0 )
				self.clipFinished( CPPrologueFaceScannerFailedBox, {} )
				local CenterlineTopFrame2 = function ( CenterlineTop, event )
					local CenterlineTopFrame3 = function ( CenterlineTop, event )
						local CenterlineTopFrame4 = function ( CenterlineTop, event )
							local CenterlineTopFrame5 = function ( CenterlineTop, event )
								local CenterlineTopFrame6 = function ( CenterlineTop, event )
									local CenterlineTopFrame7 = function ( CenterlineTop, event )
										local CenterlineTopFrame8 = function ( CenterlineTop, event )
											local CenterlineTopFrame9 = function ( CenterlineTop, event )
												local CenterlineTopFrame10 = function ( CenterlineTop, event )
													local CenterlineTopFrame11 = function ( CenterlineTop, event )
														local CenterlineTopFrame12 = function ( CenterlineTop, event )
															local CenterlineTopFrame13 = function ( CenterlineTop, event )
																local CenterlineTopFrame14 = function ( CenterlineTop, event )
																	if not event.interrupted then
																		CenterlineTop:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																	end
																	CenterlineTop:setLeftRight( false, false, -95.5, 95 )
																	CenterlineTop:setTopBottom( false, false, -74.41, -77.41 )
																	CenterlineTop:setAlpha( 0 )
																	if event.interrupted then
																		self.clipFinished( CenterlineTop, event )
																	else
																		CenterlineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	CenterlineTopFrame14( CenterlineTop, event )
																	return 
																else
																	CenterlineTop:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
																	CenterlineTop:setTopBottom( false, false, -74.41, -77.41 )
																	CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame14 )
																end
															end
															
															if event.interrupted then
																CenterlineTopFrame13( CenterlineTop, event )
																return 
															else
																CenterlineTop:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																CenterlineTop:setTopBottom( false, false, 124, 121 )
																CenterlineTop:setAlpha( 0.52 )
																CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame13 )
															end
														end
														
														if event.interrupted then
															CenterlineTopFrame12( CenterlineTop, event )
															return 
														else
															CenterlineTop:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															CenterlineTop:setTopBottom( false, false, 49.33, 46.33 )
															CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame12 )
														end
													end
													
													if event.interrupted then
														CenterlineTopFrame11( CenterlineTop, event )
														return 
													else
														CenterlineTop:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														CenterlineTop:setTopBottom( false, false, 43.59, 40.59 )
														CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame11 )
													end
												end
												
												if event.interrupted then
													CenterlineTopFrame10( CenterlineTop, event )
													return 
												else
													CenterlineTop:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
													CenterlineTop:setTopBottom( false, false, 48.59, 45.59 )
													CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame10 )
												end
											end
											
											if event.interrupted then
												CenterlineTopFrame9( CenterlineTop, event )
												return 
											else
												CenterlineTop:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
												CenterlineTop:setTopBottom( false, false, -30.41, -33.41 )
												CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame9 )
											end
										end
										
										if event.interrupted then
											CenterlineTopFrame8( CenterlineTop, event )
											return 
										else
											CenterlineTop:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
											CenterlineTop:setTopBottom( false, false, 4.59, 1.59 )
											CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame8 )
										end
									end
									
									if event.interrupted then
										CenterlineTopFrame7( CenterlineTop, event )
										return 
									else
										CenterlineTop:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
										CenterlineTop:setTopBottom( false, false, 15.59, 12.59 )
										CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame7 )
									end
								end
								
								if event.interrupted then
									CenterlineTopFrame6( CenterlineTop, event )
									return 
								else
									CenterlineTop:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									CenterlineTop:setTopBottom( false, false, -42.41, -45.41 )
									CenterlineTop:setAlpha( 0.6 )
									CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame6 )
								end
							end
							
							if event.interrupted then
								CenterlineTopFrame5( CenterlineTop, event )
								return 
							else
								CenterlineTop:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								CenterlineTop:setTopBottom( false, false, -36.41, -39.41 )
								CenterlineTop:setAlpha( 0.19 )
								CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame5 )
							end
						end
						
						if event.interrupted then
							CenterlineTopFrame4( CenterlineTop, event )
							return 
						else
							CenterlineTop:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							CenterlineTop:setTopBottom( false, false, -33.41, -36.41 )
							CenterlineTop:setAlpha( 0.22 )
							CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame4 )
						end
					end
					
					if event.interrupted then
						CenterlineTopFrame3( CenterlineTop, event )
						return 
					else
						CenterlineTop:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						CenterlineTop:setTopBottom( false, false, -45.13, -48.13 )
						CenterlineTop:setAlpha( 0.27 )
						CenterlineTop:registerEventHandler( "transition_complete_keyframe", CenterlineTopFrame3 )
					end
				end
				
				CenterlineTop:completeAnimation()
				self.CenterlineTop:setLeftRight( false, false, -95.5, 95 )
				self.CenterlineTop:setTopBottom( false, false, -74.41, -77.41 )
				self.CenterlineTop:setAlpha( 0 )
				CenterlineTopFrame2( CenterlineTop, {} )
				local CPPrologueFaceScannerDotsFrame2 = function ( CPPrologueFaceScannerDots, event )
					local CPPrologueFaceScannerDotsFrame3 = function ( CPPrologueFaceScannerDots, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots:setLeftRight( true, false, 178, 186 )
						CPPrologueFaceScannerDots:setTopBottom( true, false, 137.96, 145.96 )
						CPPrologueFaceScannerDots:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots, event )
						else
							CPPrologueFaceScannerDots:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDotsFrame3( CPPrologueFaceScannerDots, event )
						return 
					else
						CPPrologueFaceScannerDots:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDotsFrame3 )
					end
				end
				
				CPPrologueFaceScannerDots:completeAnimation()
				self.CPPrologueFaceScannerDots:setLeftRight( true, false, 178, 186 )
				self.CPPrologueFaceScannerDots:setTopBottom( true, false, 137.96, 145.96 )
				self.CPPrologueFaceScannerDots:setAlpha( 1 )
				CPPrologueFaceScannerDotsFrame2( CPPrologueFaceScannerDots, {} )
				local CPPrologueFaceScannerDots0Frame2 = function ( CPPrologueFaceScannerDots0, event )
					local CPPrologueFaceScannerDots0Frame3 = function ( CPPrologueFaceScannerDots0, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots0:setLeftRight( true, false, 167.5, 175.5 )
						CPPrologueFaceScannerDots0:setTopBottom( true, false, 109.96, 117.96 )
						CPPrologueFaceScannerDots0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots0, event )
						else
							CPPrologueFaceScannerDots0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots0Frame3( CPPrologueFaceScannerDots0, event )
						return 
					else
						CPPrologueFaceScannerDots0:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots0:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots0Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots0:completeAnimation()
				self.CPPrologueFaceScannerDots0:setLeftRight( true, false, 167.5, 175.5 )
				self.CPPrologueFaceScannerDots0:setTopBottom( true, false, 109.96, 117.96 )
				self.CPPrologueFaceScannerDots0:setAlpha( 1 )
				CPPrologueFaceScannerDots0Frame2( CPPrologueFaceScannerDots0, {} )
				local CPPrologueFaceScannerDots1Frame2 = function ( CPPrologueFaceScannerDots1, event )
					local CPPrologueFaceScannerDots1Frame3 = function ( CPPrologueFaceScannerDots1, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots1:setLeftRight( true, false, 141.75, 149.75 )
						CPPrologueFaceScannerDots1:setTopBottom( true, false, 99.63, 107.63 )
						CPPrologueFaceScannerDots1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots1, event )
						else
							CPPrologueFaceScannerDots1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots1Frame3( CPPrologueFaceScannerDots1, event )
						return 
					else
						CPPrologueFaceScannerDots1:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots1:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots1Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots1:completeAnimation()
				self.CPPrologueFaceScannerDots1:setLeftRight( true, false, 141.75, 149.75 )
				self.CPPrologueFaceScannerDots1:setTopBottom( true, false, 99.63, 107.63 )
				self.CPPrologueFaceScannerDots1:setAlpha( 1 )
				CPPrologueFaceScannerDots1Frame2( CPPrologueFaceScannerDots1, {} )
				local CPPrologueFaceScannerDots2Frame2 = function ( CPPrologueFaceScannerDots2, event )
					local CPPrologueFaceScannerDots2Frame3 = function ( CPPrologueFaceScannerDots2, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots2:setLeftRight( true, false, 141.75, 149.75 )
						CPPrologueFaceScannerDots2:setTopBottom( true, false, 138.59, 146.59 )
						CPPrologueFaceScannerDots2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots2, event )
						else
							CPPrologueFaceScannerDots2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots2Frame3( CPPrologueFaceScannerDots2, event )
						return 
					else
						CPPrologueFaceScannerDots2:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots2:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots2Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots2:completeAnimation()
				self.CPPrologueFaceScannerDots2:setLeftRight( true, false, 141.75, 149.75 )
				self.CPPrologueFaceScannerDots2:setTopBottom( true, false, 138.59, 146.59 )
				self.CPPrologueFaceScannerDots2:setAlpha( 1 )
				CPPrologueFaceScannerDots2Frame2( CPPrologueFaceScannerDots2, {} )
				local CPPrologueFaceScannerDots3Frame2 = function ( CPPrologueFaceScannerDots3, event )
					local CPPrologueFaceScannerDots3Frame3 = function ( CPPrologueFaceScannerDots3, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots3:setLeftRight( true, false, 141.75, 149.75 )
						CPPrologueFaceScannerDots3:setTopBottom( true, false, 120.96, 128.96 )
						CPPrologueFaceScannerDots3:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots3, event )
						else
							CPPrologueFaceScannerDots3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots3Frame3( CPPrologueFaceScannerDots3, event )
						return 
					else
						CPPrologueFaceScannerDots3:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots3:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots3Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots3:completeAnimation()
				self.CPPrologueFaceScannerDots3:setLeftRight( true, false, 141.75, 149.75 )
				self.CPPrologueFaceScannerDots3:setTopBottom( true, false, 120.96, 128.96 )
				self.CPPrologueFaceScannerDots3:setAlpha( 1 )
				CPPrologueFaceScannerDots3Frame2( CPPrologueFaceScannerDots3, {} )
				local CPPrologueFaceScannerDots4Frame2 = function ( CPPrologueFaceScannerDots4, event )
					local CPPrologueFaceScannerDots4Frame3 = function ( CPPrologueFaceScannerDots4, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots4:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots4:setLeftRight( true, false, 141.75, 149.75 )
						CPPrologueFaceScannerDots4:setTopBottom( true, false, 229.59, 237.59 )
						CPPrologueFaceScannerDots4:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots4, event )
						else
							CPPrologueFaceScannerDots4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots4Frame3( CPPrologueFaceScannerDots4, event )
						return 
					else
						CPPrologueFaceScannerDots4:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots4:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots4Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots4:completeAnimation()
				self.CPPrologueFaceScannerDots4:setLeftRight( true, false, 141.75, 149.75 )
				self.CPPrologueFaceScannerDots4:setTopBottom( true, false, 229.59, 237.59 )
				self.CPPrologueFaceScannerDots4:setAlpha( 1 )
				CPPrologueFaceScannerDots4Frame2( CPPrologueFaceScannerDots4, {} )
				local CPPrologueFaceScannerDots5Frame2 = function ( CPPrologueFaceScannerDots5, event )
					local CPPrologueFaceScannerDots5Frame3 = function ( CPPrologueFaceScannerDots5, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots5:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots5:setLeftRight( true, false, 175.5, 183.5 )
						CPPrologueFaceScannerDots5:setTopBottom( true, false, 199.59, 207.59 )
						CPPrologueFaceScannerDots5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots5, event )
						else
							CPPrologueFaceScannerDots5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots5Frame3( CPPrologueFaceScannerDots5, event )
						return 
					else
						CPPrologueFaceScannerDots5:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots5:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots5Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots5:completeAnimation()
				self.CPPrologueFaceScannerDots5:setLeftRight( true, false, 175.5, 183.5 )
				self.CPPrologueFaceScannerDots5:setTopBottom( true, false, 199.59, 207.59 )
				self.CPPrologueFaceScannerDots5:setAlpha( 1 )
				CPPrologueFaceScannerDots5Frame2( CPPrologueFaceScannerDots5, {} )
				local CPPrologueFaceScannerDots6Frame2 = function ( CPPrologueFaceScannerDots6, event )
					local CPPrologueFaceScannerDots6Frame3 = function ( CPPrologueFaceScannerDots6, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots6:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots6:setLeftRight( true, false, 141.75, 149.75 )
						CPPrologueFaceScannerDots6:setTopBottom( true, false, 229.59, 237.59 )
						CPPrologueFaceScannerDots6:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots6, event )
						else
							CPPrologueFaceScannerDots6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots6Frame3( CPPrologueFaceScannerDots6, event )
						return 
					else
						CPPrologueFaceScannerDots6:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots6:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots6Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots6:completeAnimation()
				self.CPPrologueFaceScannerDots6:setLeftRight( true, false, 141.75, 149.75 )
				self.CPPrologueFaceScannerDots6:setTopBottom( true, false, 229.59, 237.59 )
				self.CPPrologueFaceScannerDots6:setAlpha( 1 )
				CPPrologueFaceScannerDots6Frame2( CPPrologueFaceScannerDots6, {} )
				local CPPrologueFaceScannerDots7Frame2 = function ( CPPrologueFaceScannerDots7, event )
					local CPPrologueFaceScannerDots7Frame3 = function ( CPPrologueFaceScannerDots7, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots7:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots7:setLeftRight( true, false, 141.75, 149.75 )
						CPPrologueFaceScannerDots7:setTopBottom( true, false, 170.59, 178.59 )
						CPPrologueFaceScannerDots7:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots7, event )
						else
							CPPrologueFaceScannerDots7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots7Frame3( CPPrologueFaceScannerDots7, event )
						return 
					else
						CPPrologueFaceScannerDots7:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots7:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots7Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots7:completeAnimation()
				self.CPPrologueFaceScannerDots7:setLeftRight( true, false, 141.75, 149.75 )
				self.CPPrologueFaceScannerDots7:setTopBottom( true, false, 170.59, 178.59 )
				self.CPPrologueFaceScannerDots7:setAlpha( 1 )
				CPPrologueFaceScannerDots7Frame2( CPPrologueFaceScannerDots7, {} )
				local CPPrologueFaceScannerDots8Frame2 = function ( CPPrologueFaceScannerDots8, event )
					local CPPrologueFaceScannerDots8Frame3 = function ( CPPrologueFaceScannerDots8, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots8:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots8:setLeftRight( true, false, 157.5, 165.5 )
						CPPrologueFaceScannerDots8:setTopBottom( true, false, 166.59, 174.59 )
						CPPrologueFaceScannerDots8:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots8, event )
						else
							CPPrologueFaceScannerDots8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots8Frame3( CPPrologueFaceScannerDots8, event )
						return 
					else
						CPPrologueFaceScannerDots8:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots8:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots8Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots8:completeAnimation()
				self.CPPrologueFaceScannerDots8:setLeftRight( true, false, 157.5, 165.5 )
				self.CPPrologueFaceScannerDots8:setTopBottom( true, false, 166.59, 174.59 )
				self.CPPrologueFaceScannerDots8:setAlpha( 1 )
				CPPrologueFaceScannerDots8Frame2( CPPrologueFaceScannerDots8, {} )
				local CPPrologueFaceScannerDots9Frame2 = function ( CPPrologueFaceScannerDots9, event )
					local CPPrologueFaceScannerDots9Frame3 = function ( CPPrologueFaceScannerDots9, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots9:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots9:setLeftRight( true, false, 173, 181 )
						CPPrologueFaceScannerDots9:setTopBottom( true, false, 158.59, 166.59 )
						CPPrologueFaceScannerDots9:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots9, event )
						else
							CPPrologueFaceScannerDots9:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots9Frame3( CPPrologueFaceScannerDots9, event )
						return 
					else
						CPPrologueFaceScannerDots9:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots9:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots9Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots9:completeAnimation()
				self.CPPrologueFaceScannerDots9:setLeftRight( true, false, 173, 181 )
				self.CPPrologueFaceScannerDots9:setTopBottom( true, false, 158.59, 166.59 )
				self.CPPrologueFaceScannerDots9:setAlpha( 1 )
				CPPrologueFaceScannerDots9Frame2( CPPrologueFaceScannerDots9, {} )
				local CPPrologueFaceScannerDots10Frame2 = function ( CPPrologueFaceScannerDots10, event )
					local CPPrologueFaceScannerDots10Frame3 = function ( CPPrologueFaceScannerDots10, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots10:setLeftRight( true, false, 165, 173 )
						CPPrologueFaceScannerDots10:setTopBottom( true, false, 218.87, 226.87 )
						CPPrologueFaceScannerDots10:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots10, event )
						else
							CPPrologueFaceScannerDots10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots10Frame3( CPPrologueFaceScannerDots10, event )
						return 
					else
						CPPrologueFaceScannerDots10:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots10:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots10Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots10:completeAnimation()
				self.CPPrologueFaceScannerDots10:setLeftRight( true, false, 165, 173 )
				self.CPPrologueFaceScannerDots10:setTopBottom( true, false, 218.87, 226.87 )
				self.CPPrologueFaceScannerDots10:setAlpha( 1 )
				CPPrologueFaceScannerDots10Frame2( CPPrologueFaceScannerDots10, {} )
				local CPPrologueFaceScannerDots11Frame2 = function ( CPPrologueFaceScannerDots11, event )
					local CPPrologueFaceScannerDots11Frame3 = function ( CPPrologueFaceScannerDots11, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots11:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots11:setLeftRight( true, false, 161.5, 169.5 )
						CPPrologueFaceScannerDots11:setTopBottom( true, false, 140.96, 148.96 )
						CPPrologueFaceScannerDots11:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots11, event )
						else
							CPPrologueFaceScannerDots11:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots11Frame3( CPPrologueFaceScannerDots11, event )
						return 
					else
						CPPrologueFaceScannerDots11:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots11:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots11Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots11:completeAnimation()
				self.CPPrologueFaceScannerDots11:setLeftRight( true, false, 161.5, 169.5 )
				self.CPPrologueFaceScannerDots11:setTopBottom( true, false, 140.96, 148.96 )
				self.CPPrologueFaceScannerDots11:setAlpha( 1 )
				CPPrologueFaceScannerDots11Frame2( CPPrologueFaceScannerDots11, {} )
				local CPPrologueFaceScannerDots12Frame2 = function ( CPPrologueFaceScannerDots12, event )
					local CPPrologueFaceScannerDots12Frame3 = function ( CPPrologueFaceScannerDots12, event )
						if not event.interrupted then
							CPPrologueFaceScannerDots12:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CPPrologueFaceScannerDots12:setLeftRight( true, false, 147.5, 155.5 )
						CPPrologueFaceScannerDots12:setTopBottom( true, false, 143.96, 151.96 )
						CPPrologueFaceScannerDots12:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CPPrologueFaceScannerDots12, event )
						else
							CPPrologueFaceScannerDots12:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CPPrologueFaceScannerDots12Frame3( CPPrologueFaceScannerDots12, event )
						return 
					else
						CPPrologueFaceScannerDots12:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
						CPPrologueFaceScannerDots12:registerEventHandler( "transition_complete_keyframe", CPPrologueFaceScannerDots12Frame3 )
					end
				end
				
				CPPrologueFaceScannerDots12:completeAnimation()
				self.CPPrologueFaceScannerDots12:setLeftRight( true, false, 147.5, 155.5 )
				self.CPPrologueFaceScannerDots12:setTopBottom( true, false, 143.96, 151.96 )
				self.CPPrologueFaceScannerDots12:setAlpha( 1 )
				CPPrologueFaceScannerDots12Frame2( CPPrologueFaceScannerDots12, {} )
			end
		},
		Failed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				CPPrologueFaceScannerFlipbook:completeAnimation()
				self.CPPrologueFaceScannerFlipbook:setAlpha( 0 )
				self.clipFinished( CPPrologueFaceScannerFlipbook, {} )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )

				Image3:completeAnimation()
				self.Image3:setRGB( 1, 0, 0 )
				self.Image3:setAlpha( 0 )
				self.clipFinished( Image3, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.Title:setText( Engine.Localize( "NO MATCHES FOUND" ) )
				self.clipFinished( Title, {} )

				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )

				Image5:completeAnimation()
				self.Image5:setAlpha( 0 )
				self.clipFinished( Image5, {} )

				Image6:completeAnimation()
				self.Image6:setAlpha( 0 )
				self.clipFinished( Image6, {} )

				DNImod:completeAnimation()
				self.DNImod:setAlpha( 1 )
				self.clipFinished( DNImod, {} )

				CPPrologueFaceScannerCircleDots:completeAnimation()
				self.CPPrologueFaceScannerCircleDots:setAlpha( 0 )
				self.clipFinished( CPPrologueFaceScannerCircleDots, {} )

				CPPrologueFaceScannerCircleDash:completeAnimation()
				self.CPPrologueFaceScannerCircleDash:setAlpha( 0 )
				self.clipFinished( CPPrologueFaceScannerCircleDash, {} )

				CPPrologueFaceScannerFailedBox:completeAnimation()
				self.CPPrologueFaceScannerFailedBox:setLeftRight( true, false, 44, 234.5 )
				self.CPPrologueFaceScannerFailedBox:setTopBottom( true, false, 63, 301 )
				self.CPPrologueFaceScannerFailedBox:setAlpha( 1 )
				self.clipFinished( CPPrologueFaceScannerFailedBox, {} )

				FailedBox:completeAnimation()
				self.FailedBox:setAlpha( 0.25 )
				self.clipFinished( FailedBox, {} )

				FailedText:completeAnimation()
				self.FailedText:setLeftRight( true, false, 107, 169.5 )
				self.FailedText:setTopBottom( true, false, 147.96, 173.5 )
				self.FailedText:setAlpha( 1 )
				self.FailedText:setText( Engine.Localize( "MENU_RTS_FAILED_CAPS" ) )
				self.clipFinished( FailedText, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPPrologueFaceScannerFoundBox:close()
		element.CPPrologueFaceScannerFlipbook:close()
		element.FEFeaturedFrame0:close()
		element.CenterDotL:close()
		element.outofboundsdotblinkwidget0:close()
		element.outofboundsdotblinkwidget1:close()
		element.outofboundsdotblinkwidget2:close()
		element.CPPrologueFaceScannerLoadingLines:close()
		element.DNImod:close()
		element.CPPrologueFaceScannerCircleDots:close()
		element.CPPrologueFaceScannerCircleDash:close()
		element.CPPrologueFaceScannerBlurLines:close()
		element.CPPrologueFaceScannerFailedBox:close()
		element.CPPrologueFaceScannerDots:close()
		element.CPPrologueFaceScannerDots0:close()
		element.CPPrologueFaceScannerDots1:close()
		element.CPPrologueFaceScannerDots2:close()
		element.CPPrologueFaceScannerDots3:close()
		element.CPPrologueFaceScannerDots4:close()
		element.CPPrologueFaceScannerDots5:close()
		element.CPPrologueFaceScannerDots6:close()
		element.CPPrologueFaceScannerDots7:close()
		element.CPPrologueFaceScannerDots8:close()
		element.CPPrologueFaceScannerDots9:close()
		element.CPPrologueFaceScannerDots10:close()
		element.CPPrologueFaceScannerDots11:close()
		element.CPPrologueFaceScannerDots12:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

