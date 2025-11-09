require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ProfileSnapshot_Preview" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OnlineOnly" )
require( "ui.uieditor.widgets.CAC.cac_FocusBarContainer" )

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
	self:setLeftRight( true, false, 0, 370 )
	self:setTopBottom( true, false, 0, 329 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 3, -3 )
	BlackBox:setTopBottom( true, true, 2, -4 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.05 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local StartMenuProfileSnapshotPreview = CoD.StartMenu_ProfileSnapshot_Preview.new( menu, controller )
	StartMenuProfileSnapshotPreview:setLeftRight( true, true, 2, -1 )
	StartMenuProfileSnapshotPreview:setTopBottom( true, true, 2, -1.5 )
	self:addElement( StartMenuProfileSnapshotPreview )
	self.StartMenuProfileSnapshotPreview = StartMenuProfileSnapshotPreview
	
	local BoxButtonLrgInactiveDiag0 = LUI.UIImage.new()
	BoxButtonLrgInactiveDiag0:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag0:setTopBottom( true, true, -1, 1 )
	BoxButtonLrgInactiveDiag0:setAlpha( 0 )
	BoxButtonLrgInactiveDiag0:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivediagfull" ) )
	BoxButtonLrgInactiveDiag0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactiveDiag0:setShaderVector( 0, 0.06, 0.07, 0, 0 )
	BoxButtonLrgInactiveDiag0:setupNineSliceShader( 24, 24 )
	self:addElement( BoxButtonLrgInactiveDiag0 )
	self.BoxButtonLrgInactiveDiag0 = BoxButtonLrgInactiveDiag0
	
	local StartMenuOnlineOnly = CoD.StartMenu_OnlineOnly.new( menu, controller )
	StartMenuOnlineOnly:setLeftRight( false, false, -48, 47 )
	StartMenuOnlineOnly:setTopBottom( false, false, -16.47, 11.53 )
	StartMenuOnlineOnly:setAlpha( 0 )
	StartMenuOnlineOnly:setScale( 0.9 )
	StartMenuOnlineOnly.TextBox0:setText( LocalizeToUpperString( "MENU_COMING_SOON" ) )
	self:addElement( StartMenuOnlineOnly )
	self.StartMenuOnlineOnly = StartMenuOnlineOnly
	
	local FocusWhiteT = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteT:setLeftRight( true, true, -2, 2 )
	FocusWhiteT:setTopBottom( true, false, -2, 0 )
	FocusWhiteT:setZoom( 1 )
	self:addElement( FocusWhiteT )
	self.FocusWhiteT = FocusWhiteT
	
	local FocusWhiteB = CoD.cac_FocusBarContainer.new( menu, controller )
	FocusWhiteB:setLeftRight( true, true, -2, 2 )
	FocusWhiteB:setTopBottom( false, true, 0, 4 )
	FocusWhiteB:setZoom( 1 )
	self:addElement( FocusWhiteB )
	self.FocusWhiteB = FocusWhiteB
	
	local TopFocusBar = CoD.FE_FocusBarContainer.new( menu, controller )
	TopFocusBar:setLeftRight( true, true, -2, 2 )
	TopFocusBar:setTopBottom( true, false, -1, 3 )
	self:addElement( TopFocusBar )
	self.TopFocusBar = TopFocusBar
	
	local BottomFocusBar = CoD.FE_FocusBarContainer.new( menu, controller )
	BottomFocusBar:setLeftRight( true, true, -2, 2 )
	BottomFocusBar:setTopBottom( false, true, -3, 1 )
	self:addElement( BottomFocusBar )
	self.BottomFocusBar = BottomFocusBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setRGB( 0, 0, 0 )
				self.BlackBox:setAlpha( 0.05 )
				self.clipFinished( BlackBox, {} )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				self.clipFinished( FocusWhiteT, {} )
				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				self.clipFinished( FocusWhiteB, {} )
				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 0 )
				self.clipFinished( TopFocusBar, {} )
				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 0 )
				self.clipFinished( BottomFocusBar, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 10 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setRGB( 1, 1, 1 )
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
				FocusWhiteT:completeAnimation()
				self.FocusWhiteT:setAlpha( 0 )
				self.clipFinished( FocusWhiteT, {} )
				FocusWhiteB:completeAnimation()
				self.FocusWhiteB:setAlpha( 0 )
				self.clipFinished( FocusWhiteB, {} )
				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 1 )
				self.clipFinished( TopFocusBar, {} )
				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 1 )
				self.clipFinished( BottomFocusBar, {} )
			end
		}
	}
	StartMenuOnlineOnly.id = "StartMenuOnlineOnly"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.StartMenuOnlineOnly:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactive:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.StartMenuProfileSnapshotPreview:close()
		element.StartMenuOnlineOnly:close()
		element.FocusWhiteT:close()
		element.FocusWhiteB:close()
		element.TopFocusBar:close()
		element.BottomFocusBar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

