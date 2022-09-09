-- 83b2813d529dea1af5f1a9e1634416bd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.PC.ChooseCharacter.ChooseCharacter_CardClickButton" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
	f1_arg0.Keyshortcut.m_button = Enum.LUIButton.LUI_KEY_XBX_PSSQUARE
	f1_arg0.Keyshortcut.keyshortcut:setText( Engine.Localize( "[^3P^7]" ) )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
	if Engine.OwnSeasonPass( controller ) then
		self.TextPurchaseDLC1:setText( Engine.Localize( "MENU_ACTIVATE_DLC", CoD.DLCNames[CoD.DLCBits.CONTENT_DLC1] ) )
		self.TextPurchaseDLC2:setText( Engine.Localize( "MENU_ACTIVATE_DLC", CoD.DLCNames[CoD.DLCBits.CONTENT_DLC2] ) )
		self.TextPurchaseDLC3:setText( Engine.Localize( "MENU_ACTIVATE_DLC", CoD.DLCNames[CoD.DLCBits.CONTENT_DLC3] ) )
	end
end

CoD.PlaylistDLC1CRM = InheritFrom( LUI.UIElement )
CoD.PlaylistDLC1CRM.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.PlaylistDLC1CRM )
	self.id = "PlaylistDLC1CRM"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 450 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 450 )
	BG:setTopBottom( true, false, 0, 128.57 )
	BG:setImage( RegisterImage( "uie_t7_crm_dlc1_playlist" ) )
	self:addElement( BG )
	self.BG = BG
	
	local TitleDLC1 = LUI.UIImage.new()
	TitleDLC1:setLeftRight( true, false, 36.62, 241.43 )
	TitleDLC1:setTopBottom( true, false, 19.22, 61.89 )
	TitleDLC1:setAlpha( 0 )
	TitleDLC1:setImage( RegisterImage( "uie_t7_crm_dlc1_playlist_title" ) )
	self:addElement( TitleDLC1 )
	self.TitleDLC1 = TitleDLC1
	
	local TitleDLC2 = LUI.UIImage.new()
	TitleDLC2:setLeftRight( true, false, 36.62, 241.43 )
	TitleDLC2:setTopBottom( true, false, 19.22, 61.89 )
	TitleDLC2:setAlpha( 0 )
	TitleDLC2:setImage( RegisterImage( "uie_t7_crm_dlc2_playlist_title" ) )
	self:addElement( TitleDLC2 )
	self.TitleDLC2 = TitleDLC2
	
	local TitleDLC3 = LUI.UIImage.new()
	TitleDLC3:setLeftRight( true, false, 36.62, 324.62 )
	TitleDLC3:setTopBottom( true, false, 19.22, 61.89 )
	TitleDLC3:setAlpha( 0 )
	TitleDLC3:setImage( RegisterImage( "uie_t7_crm_dlc3_playlist_title" ) )
	self:addElement( TitleDLC3 )
	self.TitleDLC3 = TitleDLC3
	
	local TitleDLC4 = LUI.UIImage.new()
	TitleDLC4:setLeftRight( true, false, 36.62, 324.62 )
	TitleDLC4:setTopBottom( true, false, 19.22, 79.22 )
	TitleDLC4:setImage( RegisterImage( "uie_t7_crm_dlc4_playlist_title" ) )
	self:addElement( TitleDLC4 )
	self.TitleDLC4 = TitleDLC4
	
	local DownloadIcon = LUI.UIImage.new()
	DownloadIcon:setLeftRight( true, false, 16.51, 61.85 )
	DownloadIcon:setTopBottom( true, false, 17.55, 62.89 )
	DownloadIcon:setImage( RegisterImage( "uie_t7_icon_contextual_purchase" ) )
	self:addElement( DownloadIcon )
	self.DownloadIcon = DownloadIcon
	
	local ActionImage = LUI.UIImage.new()
	ActionImage:setLeftRight( true, false, 31.18, 55.18 )
	ActionImage:setTopBottom( false, true, -34, -10 )
	ActionImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			ActionImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( ActionImage )
	self.ActionImage = ActionImage
	
	local TextPurchaseDLC1 = LUI.UIText.new()
	TextPurchaseDLC1:setLeftRight( true, false, 64.67, 264.67 )
	TextPurchaseDLC1:setTopBottom( true, false, 98, 118 )
	TextPurchaseDLC1:setAlpha( 0 )
	TextPurchaseDLC1:setText( Engine.Localize( "MENU_PURCHASE_DLC1" ) )
	TextPurchaseDLC1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextPurchaseDLC1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextPurchaseDLC1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextPurchaseDLC1 )
	self.TextPurchaseDLC1 = TextPurchaseDLC1
	
	local TextPurchaseDLC2 = LUI.UIText.new()
	TextPurchaseDLC2:setLeftRight( true, false, 64.67, 264.67 )
	TextPurchaseDLC2:setTopBottom( true, false, 98, 118 )
	TextPurchaseDLC2:setAlpha( 0 )
	TextPurchaseDLC2:setText( Engine.Localize( "MENU_PURCHASE_DLC2" ) )
	TextPurchaseDLC2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextPurchaseDLC2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextPurchaseDLC2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextPurchaseDLC2 )
	self.TextPurchaseDLC2 = TextPurchaseDLC2
	
	local TextPurchaseDLC3 = LUI.UIText.new()
	TextPurchaseDLC3:setLeftRight( true, false, 64.67, 264.67 )
	TextPurchaseDLC3:setTopBottom( true, false, 98, 118 )
	TextPurchaseDLC3:setAlpha( 0 )
	TextPurchaseDLC3:setText( Engine.Localize( "MENU_PURCHASE_SEASON_PASS" ) )
	TextPurchaseDLC3:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextPurchaseDLC3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextPurchaseDLC3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextPurchaseDLC3 )
	self.TextPurchaseDLC3 = TextPurchaseDLC3
	
	local TextPurchaseDLC4 = LUI.UIText.new()
	TextPurchaseDLC4:setLeftRight( true, false, 64.67, 264.67 )
	TextPurchaseDLC4:setTopBottom( true, false, 98, 118 )
	TextPurchaseDLC4:setText( Engine.Localize( "MENU_PURCHASE_DLC4" ) )
	TextPurchaseDLC4:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextPurchaseDLC4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextPurchaseDLC4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextPurchaseDLC4 )
	self.TextPurchaseDLC4 = TextPurchaseDLC4
	
	local TextIncludes4New = LUI.UIText.new()
	TextIncludes4New:setLeftRight( true, false, 64.67, 264.67 )
	TextIncludes4New:setTopBottom( true, false, 75.5, 95.5 )
	TextIncludes4New:setRGB( 1, 0.42, 0 )
	TextIncludes4New:setText( Engine.Localize( "MENU_PURCHASE_DLC1_DESCRIPTION" ) )
	TextIncludes4New:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextIncludes4New:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextIncludes4New:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextIncludes4New )
	self.TextIncludes4New = TextIncludes4New
	
	local f3_local13 = nil
	if IsPC() then
		f3_local13 = CoD.ChooseCharacter_CardClickButton.new( menu, controller )
	else
		f3_local13 = LUI.UIElement.createFake()
	end
	f3_local13:setLeftRight( true, false, 32, 242 )
	f3_local13:setTopBottom( true, false, 95, 120 )
	f3_local13:setAlpha( 0 )
	f3_local13.label:setText( Engine.Localize( "MENU_PURCHASE_SEASON_PASS" ) )
	f3_local13.keyshortcut:setText( Engine.Localize( "[^3P^7]" ) )
	if IsPC() then
		self:addElement( f3_local13 )
	end
	self.Keyshortcut = f3_local13
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )

				TitleDLC1:completeAnimation()
				self.TitleDLC1:setAlpha( 0 )
				self.clipFinished( TitleDLC1, {} )

				TitleDLC2:completeAnimation()
				self.TitleDLC2:setAlpha( 0 )
				self.clipFinished( TitleDLC2, {} )

				TitleDLC3:completeAnimation()
				self.TitleDLC3:setAlpha( 0 )
				self.clipFinished( TitleDLC3, {} )

				TitleDLC4:completeAnimation()
				self.TitleDLC4:setAlpha( 0 )
				self.clipFinished( TitleDLC4, {} )

				DownloadIcon:completeAnimation()
				self.DownloadIcon:setAlpha( 0 )
				self.clipFinished( DownloadIcon, {} )

				ActionImage:completeAnimation()
				self.ActionImage:setAlpha( 0 )
				self.clipFinished( ActionImage, {} )

				TextPurchaseDLC1:completeAnimation()
				self.TextPurchaseDLC1:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC1, {} )

				TextPurchaseDLC2:completeAnimation()
				self.TextPurchaseDLC2:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC2, {} )

				TextPurchaseDLC3:completeAnimation()
				self.TextPurchaseDLC3:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC3, {} )

				TextPurchaseDLC4:completeAnimation()
				self.TextPurchaseDLC4:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC4, {} )

				TextIncludes4New:completeAnimation()
				self.TextIncludes4New:setAlpha( 0 )
				self.clipFinished( TextIncludes4New, {} )
			end
		},
		dlc4_pc = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				BG:completeAnimation()
				self.BG:setAlpha( 1 )
				self.clipFinished( BG, {} )

				TitleDLC1:completeAnimation()
				self.TitleDLC1:setAlpha( 0 )
				self.clipFinished( TitleDLC1, {} )

				TitleDLC2:completeAnimation()
				self.TitleDLC2:setAlpha( 0 )
				self.clipFinished( TitleDLC2, {} )

				TitleDLC3:completeAnimation()
				self.TitleDLC3:setAlpha( 0 )
				self.clipFinished( TitleDLC3, {} )

				TitleDLC4:completeAnimation()
				self.TitleDLC4:setAlpha( 1 )
				self.clipFinished( TitleDLC4, {} )

				DownloadIcon:completeAnimation()
				self.DownloadIcon:setAlpha( 1 )
				self.clipFinished( DownloadIcon, {} )

				ActionImage:completeAnimation()
				self.ActionImage:setAlpha( 0 )
				self.clipFinished( ActionImage, {} )

				TextPurchaseDLC1:completeAnimation()
				self.TextPurchaseDLC1:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC1, {} )

				TextPurchaseDLC2:completeAnimation()
				self.TextPurchaseDLC2:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC2, {} )

				TextPurchaseDLC3:completeAnimation()
				self.TextPurchaseDLC3:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC3, {} )

				TextPurchaseDLC4:completeAnimation()
				self.TextPurchaseDLC4:setAlpha( 0 )
				self.TextPurchaseDLC4:setText( Engine.Localize( "MENU_PURCHASE_SEASON_PASS" ) )
				self.clipFinished( TextPurchaseDLC4, {} )

				TextIncludes4New:completeAnimation()
				self.TextIncludes4New:setAlpha( 1 )
				self.clipFinished( TextIncludes4New, {} )

				f3_local13:completeAnimation()

				f3_local13.label:completeAnimation()
				self.Keyshortcut:setAlpha( 1 )
				self.Keyshortcut.label:setText( Engine.Localize( "MENU_PURCHASE_SEASON_PASS" ) )
				self.clipFinished( f3_local13, {} )
			end
		},
		dlc4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				BG:completeAnimation()
				self.BG:setAlpha( 1 )
				self.clipFinished( BG, {} )

				TitleDLC1:completeAnimation()
				self.TitleDLC1:setAlpha( 0 )
				self.clipFinished( TitleDLC1, {} )

				TitleDLC2:completeAnimation()
				self.TitleDLC2:setAlpha( 0 )
				self.clipFinished( TitleDLC2, {} )

				TitleDLC3:completeAnimation()
				self.TitleDLC3:setAlpha( 0 )
				self.clipFinished( TitleDLC3, {} )

				TitleDLC4:completeAnimation()
				self.TitleDLC4:setLeftRight( true, false, 38.62, 243.43 )
				self.TitleDLC4:setTopBottom( true, false, 19.22, 61.89 )
				self.TitleDLC4:setAlpha( 1 )
				self.TitleDLC4:setImage( RegisterImage( "uie_t7_crm_dlc4_playlist_title" ) )
				self.clipFinished( TitleDLC4, {} )

				DownloadIcon:completeAnimation()
				self.DownloadIcon:setAlpha( 1 )
				self.clipFinished( DownloadIcon, {} )

				ActionImage:completeAnimation()
				self.ActionImage:setAlpha( 1 )
				self.clipFinished( ActionImage, {} )

				TextPurchaseDLC1:completeAnimation()
				self.TextPurchaseDLC1:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC1, {} )

				TextPurchaseDLC2:completeAnimation()
				self.TextPurchaseDLC2:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC2, {} )

				TextPurchaseDLC3:completeAnimation()
				self.TextPurchaseDLC3:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC3, {} )

				TextPurchaseDLC4:completeAnimation()
				self.TextPurchaseDLC4:setAlpha( 1 )
				self.TextPurchaseDLC4:setText( Engine.Localize( "MENU_PURCHASE_DLC4" ) )
				self.clipFinished( TextPurchaseDLC4, {} )

				TextIncludes4New:completeAnimation()
				self.TextIncludes4New:setAlpha( 1 )
				self.clipFinished( TextIncludes4New, {} )

				f3_local13:completeAnimation()
				self.Keyshortcut:setAlpha( 0 )
				self.clipFinished( f3_local13, {} )
			end
		},
		dlc3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BG:completeAnimation()
				self.BG:setAlpha( 1 )
				self.clipFinished( BG, {} )

				TitleDLC1:completeAnimation()
				self.TitleDLC1:setAlpha( 0 )
				self.clipFinished( TitleDLC1, {} )

				TitleDLC2:completeAnimation()
				self.TitleDLC2:setAlpha( 0 )
				self.clipFinished( TitleDLC2, {} )

				TitleDLC3:completeAnimation()
				self.TitleDLC3:setAlpha( 1 )
				self.clipFinished( TitleDLC3, {} )

				TitleDLC4:completeAnimation()
				self.TitleDLC4:setAlpha( 0 )
				self.clipFinished( TitleDLC4, {} )

				DownloadIcon:completeAnimation()
				self.DownloadIcon:setAlpha( 1 )
				self.clipFinished( DownloadIcon, {} )

				ActionImage:completeAnimation()
				self.ActionImage:setAlpha( 1 )
				self.clipFinished( ActionImage, {} )

				TextPurchaseDLC1:completeAnimation()
				self.TextPurchaseDLC1:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC1, {} )

				TextPurchaseDLC2:completeAnimation()
				self.TextPurchaseDLC2:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC2, {} )

				TextPurchaseDLC3:completeAnimation()
				self.TextPurchaseDLC3:setAlpha( 1 )
				self.clipFinished( TextPurchaseDLC3, {} )

				TextPurchaseDLC4:completeAnimation()
				self.TextPurchaseDLC4:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC4, {} )

				TextIncludes4New:completeAnimation()
				self.TextIncludes4New:setAlpha( 1 )
				self.clipFinished( TextIncludes4New, {} )
			end
		},
		dlc2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BG:completeAnimation()
				self.BG:setAlpha( 1 )
				self.clipFinished( BG, {} )

				TitleDLC1:completeAnimation()
				self.TitleDLC1:setLeftRight( true, false, 36.62, 241.43 )
				self.TitleDLC1:setTopBottom( true, false, 19.22, 61.89 )
				self.TitleDLC1:setAlpha( 0 )
				self.clipFinished( TitleDLC1, {} )

				TitleDLC2:completeAnimation()
				self.TitleDLC2:setLeftRight( true, false, 36.62, 241.43 )
				self.TitleDLC2:setTopBottom( true, false, 19.22, 61.89 )
				self.TitleDLC2:setAlpha( 1 )
				self.TitleDLC2:setImage( RegisterImage( "uie_t7_crm_dlc2_playlist_title" ) )
				self.clipFinished( TitleDLC2, {} )

				TitleDLC3:completeAnimation()
				self.TitleDLC3:setAlpha( 0 )
				self.clipFinished( TitleDLC3, {} )

				TitleDLC4:completeAnimation()
				self.TitleDLC4:setAlpha( 0 )
				self.clipFinished( TitleDLC4, {} )

				DownloadIcon:completeAnimation()
				self.DownloadIcon:setAlpha( 1 )
				self.clipFinished( DownloadIcon, {} )

				ActionImage:completeAnimation()
				self.ActionImage:setAlpha( 1 )
				self.clipFinished( ActionImage, {} )

				TextPurchaseDLC1:completeAnimation()
				self.TextPurchaseDLC1:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC1, {} )

				TextPurchaseDLC2:completeAnimation()
				self.TextPurchaseDLC2:setAlpha( 1 )
				self.clipFinished( TextPurchaseDLC2, {} )

				TextPurchaseDLC3:completeAnimation()
				self.TextPurchaseDLC3:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC3, {} )

				TextPurchaseDLC4:completeAnimation()
				self.TextPurchaseDLC4:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC4, {} )

				TextIncludes4New:completeAnimation()
				self.TextIncludes4New:setAlpha( 1 )
				self.clipFinished( TextIncludes4New, {} )
			end
		},
		dlc1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BG:completeAnimation()
				self.BG:setAlpha( 1 )
				self.clipFinished( BG, {} )

				TitleDLC1:completeAnimation()
				self.TitleDLC1:setAlpha( 1 )
				self.clipFinished( TitleDLC1, {} )

				TitleDLC2:completeAnimation()
				self.TitleDLC2:setAlpha( 0 )
				self.clipFinished( TitleDLC2, {} )

				TitleDLC3:completeAnimation()
				self.TitleDLC3:setAlpha( 0 )
				self.clipFinished( TitleDLC3, {} )

				TitleDLC4:completeAnimation()
				self.TitleDLC4:setAlpha( 0 )
				self.clipFinished( TitleDLC4, {} )

				DownloadIcon:completeAnimation()
				self.DownloadIcon:setAlpha( 1 )
				self.clipFinished( DownloadIcon, {} )

				ActionImage:completeAnimation()
				self.ActionImage:setAlpha( 1 )
				self.clipFinished( ActionImage, {} )

				TextPurchaseDLC1:completeAnimation()
				self.TextPurchaseDLC1:setAlpha( 1 )
				self.clipFinished( TextPurchaseDLC1, {} )

				TextPurchaseDLC2:completeAnimation()
				self.TextPurchaseDLC2:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC2, {} )

				TextPurchaseDLC3:completeAnimation()
				self.TextPurchaseDLC3:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC3, {} )

				TextPurchaseDLC4:completeAnimation()
				self.TextPurchaseDLC4:setAlpha( 0 )
				self.clipFinished( TextPurchaseDLC4, {} )

				TextIncludes4New:completeAnimation()
				self.TextIncludes4New:setAlpha( 1 )
				self.clipFinished( TextIncludes4New, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Keyshortcut:close()
		element.ActionImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
