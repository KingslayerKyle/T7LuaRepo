-- 19a80910f670f2d2c0222ae6424851a1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.CAC.cac_lock" )

CoD.WeaponDesignerItem = InheritFrom( LUI.UIElement )
CoD.WeaponDesignerItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WeaponDesignerItem )
	self.id = "WeaponDesignerItem"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 1024 )
	self:setTopBottom( true, false, 0, 252 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BGImage = LUI.UIImage.new()
	BGImage:setLeftRight( true, true, 0, 0 )
	BGImage:setTopBottom( true, true, 0, 0 )
	BGImage:setImage( RegisterImage( "uie_img_t7_menu_startmenu_identity_gunsmith" ) )
	self:addElement( BGImage )
	self.BGImage = BGImage
	
	local fadedOverlay = LUI.UIImage.new()
	fadedOverlay:setLeftRight( true, true, 0, 0 )
	fadedOverlay:setTopBottom( true, true, 0, 0 )
	fadedOverlay:setRGB( 0, 0, 0 )
	fadedOverlay:setAlpha( 0.55 )
	self:addElement( fadedOverlay )
	self.fadedOverlay = fadedOverlay
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local buttonTitle = LUI.UIText.new()
	buttonTitle:setLeftRight( true, false, 14, 1016 )
	buttonTitle:setTopBottom( false, true, -51, -29 )
	buttonTitle:setText( Engine.Localize( "MENU_GUNSMITH_CAPS" ) )
	buttonTitle:setTTF( "fonts/escom.ttf" )
	buttonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	buttonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( buttonTitle )
	self.buttonTitle = buttonTitle
	
	local TopFocusBar = CoD.FE_FocusBarContainer.new( menu, controller )
	TopFocusBar:setLeftRight( true, true, 0, 0 )
	TopFocusBar:setTopBottom( true, false, -1, 3 )
	self:addElement( TopFocusBar )
	self.TopFocusBar = TopFocusBar
	
	local BottomFocusBar = CoD.FE_FocusBarContainer.new( menu, controller )
	BottomFocusBar:setLeftRight( true, true, 0, 0 )
	BottomFocusBar:setTopBottom( false, true, -3, 1 )
	self:addElement( BottomFocusBar )
	self.BottomFocusBar = BottomFocusBar
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 7, 1016 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -29, -3 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_GUNSMITH_DESC" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -16, 16 )
	lockedIcon:setTopBottom( true, false, 107.5, 139.5 )
	lockedIcon:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				fadedOverlay:completeAnimation()
				self.fadedOverlay:setAlpha( 0 )
				self.clipFinished( fadedOverlay, {} )

				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 0 )
				self.clipFinished( TopFocusBar, {} )

				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 0 )
				self.clipFinished( BottomFocusBar, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				fadedOverlay:completeAnimation()
				self.fadedOverlay:setAlpha( 0 )
				self.clipFinished( fadedOverlay, {} )

				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 1 )
				self.clipFinished( TopFocusBar, {} )

				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 1 )
				self.clipFinished( BottomFocusBar, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				fadedOverlay:completeAnimation()
				self.fadedOverlay:setAlpha( 0.55 )
				self.clipFinished( fadedOverlay, {} )

				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 0 )
				self.clipFinished( TopFocusBar, {} )

				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 0 )
				self.clipFinished( BottomFocusBar, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				fadedOverlay:completeAnimation()
				self.fadedOverlay:setAlpha( 0.55 )
				self.clipFinished( fadedOverlay, {} )

				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 1 )
				self.clipFinished( TopFocusBar, {} )

				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 1 )
				self.clipFinished( BottomFocusBar, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		OnlineOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				fadedOverlay:completeAnimation()
				self.fadedOverlay:setAlpha( 0.55 )
				self.clipFinished( fadedOverlay, {} )

				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 0 )
				self.clipFinished( TopFocusBar, {} )

				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 0 )
				self.clipFinished( BottomFocusBar, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				fadedOverlay:completeAnimation()
				self.fadedOverlay:setAlpha( 0.55 )
				self.clipFinished( fadedOverlay, {} )

				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 1 )
				self.clipFinished( TopFocusBar, {} )

				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 1 )
				self.clipFinished( BottomFocusBar, {} )

				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.TopFocusBar:close()
		element.BottomFocusBar:close()
		element.StartMenuIdentitySubTitle0:close()
		element.lockedIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
