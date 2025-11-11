require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_FocusBarContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ImageContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OnlineOnly" )

CoD.Primary_Profile_Snapshot = InheritFrom( LUI.UIElement )
CoD.Primary_Profile_Snapshot.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Primary_Profile_Snapshot )
	self.id = "Primary_Profile_Snapshot"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 555 )
	self:setTopBottom( 0, 0, 0, 493 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( 0, 1, 4, -4 )
	BlackBox:setTopBottom( 0, 1, 2, -6 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.05 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local ImageContainer = CoD.StartMenu_ImageContainer.new( menu, controller )
	ImageContainer:setLeftRight( 0, 1, 3, -1 )
	ImageContainer:setTopBottom( 0, 1, 2, -4 )
	self:addElement( ImageContainer )
	self.ImageContainer = ImageContainer
	
	local BoxButtonLrgInactiveDiag0 = LUI.UIImage.new()
	BoxButtonLrgInactiveDiag0:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag0:setTopBottom( 0, 1, -2, 2 )
	BoxButtonLrgInactiveDiag0:setAlpha( 0 )
	BoxButtonLrgInactiveDiag0:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediagfull" ) )
	BoxButtonLrgInactiveDiag0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactiveDiag0:setShaderVector( 0, 0, 0, 0, 0 )
	BoxButtonLrgInactiveDiag0:setupNineSliceShader( 36, 36 )
	self:addElement( BoxButtonLrgInactiveDiag0 )
	self.BoxButtonLrgInactiveDiag0 = BoxButtonLrgInactiveDiag0
	
	local StartMenuOnlineOnly = CoD.StartMenu_OnlineOnly.new( menu, controller )
	StartMenuOnlineOnly:setLeftRight( 0.5, 0.5, -72, 70 )
	StartMenuOnlineOnly:setTopBottom( 0.5, 0.5, -25, 17 )
	StartMenuOnlineOnly:setScale( 0.9 )
	StartMenuOnlineOnly.TextBox0:setText( LocalizeToUpperString( "MENU_COMING_SOON" ) )
	self:addElement( StartMenuOnlineOnly )
	self.StartMenuOnlineOnly = StartMenuOnlineOnly
	
	local FocusWhiteT = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteT:setLeftRight( 0, 1, -3, 3 )
	FocusWhiteT:setTopBottom( 0, 0, -3, 0 )
	FocusWhiteT:setZoom( 1 )
	self:addElement( FocusWhiteT )
	self.FocusWhiteT = FocusWhiteT
	
	local FocusWhiteB = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteB:setLeftRight( 0, 1, -3, 3 )
	FocusWhiteB:setTopBottom( 1, 1, 0, 6 )
	FocusWhiteB:setZoom( 1 )
	self:addElement( FocusWhiteB )
	self.FocusWhiteB = FocusWhiteB
	
	self.resetProperties = function ()
		FocusWhiteB:completeAnimation()
		FocusWhiteT:completeAnimation()
		BlackBox:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		BoxButtonLrgInactiveDiag0:completeAnimation()
		FocusWhiteB:setAlpha( 1 )
		FocusWhiteT:setAlpha( 1 )
		BlackBox:setRGB( 0, 0, 0 )
		BlackBox:setAlpha( 0.05 )
		BoxButtonLrgInactive:setAlpha( 0.4 )
		BoxButtonLrgInactiveDiag0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				self.clipFinished( FocusWhiteT, {} )
				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				self.clipFinished( FocusWhiteB, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setRGB( 1, 1, 1 )
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
			end
		}
	}
	StartMenuOnlineOnly.id = "StartMenuOnlineOnly"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgInactive:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.ImageContainer:close()
		self.StartMenuOnlineOnly:close()
		self.FocusWhiteT:close()
		self.FocusWhiteB:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

