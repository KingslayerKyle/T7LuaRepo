-- 1a130442e3f372c162d0af791dd8f6ec
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )

CoD.ZMLobbyEEWidget = InheritFrom( LUI.UIElement )
CoD.ZMLobbyEEWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZMLobbyEEWidget )
	self.id = "ZMLobbyEEWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 60 )
	
	local BackingHexaWhite = LUI.UIImage.new()
	BackingHexaWhite:setLeftRight( true, true, -1, 3 )
	BackingHexaWhite:setTopBottom( true, true, -2, 2 )
	BackingHexaWhite:setAlpha( 0 )
	BackingHexaWhite:setImage( RegisterImage( "uie_t7_icon_inventory_worm_egg_container" ) )
	self:addElement( BackingHexaWhite )
	self.BackingHexaWhite = BackingHexaWhite
	
	local BackingHexa = LUI.UIImage.new()
	BackingHexa:setLeftRight( true, true, -1, 3 )
	BackingHexa:setTopBottom( true, true, -2, 2 )
	BackingHexa:setImage( RegisterImage( "uie_t7_icon_inventory_worm_egg_container_black" ) )
	self:addElement( BackingHexa )
	self.BackingHexa = BackingHexa
	
	local BackingDark = LUI.UIImage.new()
	BackingDark:setLeftRight( true, true, 7, -7 )
	BackingDark:setTopBottom( true, true, 0, -10 )
	BackingDark:setRGB( 0.33, 0.33, 0.33 )
	BackingDark:setAlpha( 0 )
	self:addElement( BackingDark )
	self.BackingDark = BackingDark
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 8.63, -8.63 )
	Image0:setTopBottom( true, true, 1.5, -11.5 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_icon_inventory_black_pattern" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local BoxButtonLrgInactive = LUI.UIImage.new()
	BoxButtonLrgInactive:setLeftRight( true, true, 7, -7 )
	BoxButtonLrgInactive:setTopBottom( true, true, 0, -10 )
	BoxButtonLrgInactive:setAlpha( 0 )
	BoxButtonLrgInactive:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrginactivefull" ) )
	BoxButtonLrgInactive:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgInactive:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = LUI.UIImage.new()
	BoxButtonLrgIdle:setLeftRight( true, true, 6, -6 )
	BoxButtonLrgIdle:setTopBottom( true, true, 0, -10 )
	BoxButtonLrgIdle:setAlpha( 0 )
	BoxButtonLrgIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgidlefull" ) )
	BoxButtonLrgIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	BoxButtonLrgIdle:setShaderVector( 0, 0.12, 0.12, 0, 0 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local HexagonePatterns = LUI.UIImage.new()
	HexagonePatterns:setLeftRight( true, true, 6.5, -2.5 )
	HexagonePatterns:setTopBottom( true, true, 1, -1.41 )
	HexagonePatterns:setAlpha( 0.28 )
	HexagonePatterns:setImage( RegisterImage( "uie_img_t7_hud_widget_prematch_numbersback" ) )
	self:addElement( HexagonePatterns )
	self.HexagonePatterns = HexagonePatterns
	
	local gatewormVisible = LUI.UIImage.new()
	gatewormVisible:setLeftRight( true, true, 6, -6 )
	gatewormVisible:setTopBottom( true, true, 2, -10 )
	gatewormVisible:setAlpha( 0 )
	gatewormVisible:setScale( 0.9 )
	gatewormVisible:setImage( RegisterImage( "uie_t7_icon_inventory_worm_disabled" ) )
	self:addElement( gatewormVisible )
	self.gatewormVisible = gatewormVisible
	
	local gatewormComplete = LUI.UIImage.new()
	gatewormComplete:setLeftRight( true, true, 6, -6 )
	gatewormComplete:setTopBottom( true, true, 2, -10 )
	gatewormComplete:setAlpha( 0 )
	gatewormComplete:setScale( 0.9 )
	gatewormComplete:setImage( RegisterImage( "uie_t7_icon_inventory_worm_new" ) )
	self:addElement( gatewormComplete )
	self.gatewormComplete = gatewormComplete
	
	local gatewormComplete0 = LUI.UIImage.new()
	gatewormComplete0:setLeftRight( true, true, 6, -6 )
	gatewormComplete0:setTopBottom( true, true, 1, -11 )
	gatewormComplete0:setAlpha( 0 )
	gatewormComplete0:setScale( 0.95 )
	gatewormComplete0:setImage( RegisterImage( "uie_t7_icon_inventory_worm_new" ) )
	gatewormComplete0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( gatewormComplete0 )
	self.gatewormComplete0 = gatewormComplete0
	
	local summoningKeyVisible = LUI.UIImage.new()
	summoningKeyVisible:setLeftRight( true, true, 6, -6 )
	summoningKeyVisible:setTopBottom( true, true, 4, -8 )
	summoningKeyVisible:setAlpha( 0 )
	summoningKeyVisible:setImage( RegisterImage( "uie_t7_icon_inventory_key_disabled" ) )
	self:addElement( summoningKeyVisible )
	self.summoningKeyVisible = summoningKeyVisible
	
	local summoningKeyComplete = LUI.UIImage.new()
	summoningKeyComplete:setLeftRight( true, true, 6, -6 )
	summoningKeyComplete:setTopBottom( true, true, 4, -8 )
	summoningKeyComplete:setAlpha( 0 )
	summoningKeyComplete:setImage( RegisterImage( "uie_t7_icon_inventory_key_new" ) )
	self:addElement( summoningKeyComplete )
	self.summoningKeyComplete = summoningKeyComplete
	
	local summoningKeyAllComplete = LUI.UIImage.new()
	summoningKeyAllComplete:setLeftRight( true, true, 6, -6 )
	summoningKeyAllComplete:setTopBottom( true, true, 4, -8 )
	summoningKeyAllComplete:setAlpha( 0 )
	summoningKeyAllComplete:setImage( RegisterImage( "uie_t7_icon_inventory_key_inuse" ) )
	self:addElement( summoningKeyAllComplete )
	self.summoningKeyAllComplete = summoningKeyAllComplete
	
	local gatewormAllComplete = LUI.UIImage.new()
	gatewormAllComplete:setLeftRight( true, true, 6, -6 )
	gatewormAllComplete:setTopBottom( true, true, 2, -10 )
	gatewormAllComplete:setAlpha( 0 )
	gatewormAllComplete:setScale( 0.9 )
	gatewormAllComplete:setImage( RegisterImage( "uie_t7_icon_inventory_worm_inuse" ) )
	self:addElement( gatewormAllComplete )
	self.gatewormAllComplete = gatewormAllComplete
	
	local gatewormAllComplete0 = LUI.UIImage.new()
	gatewormAllComplete0:setLeftRight( true, true, 6, -6 )
	gatewormAllComplete0:setTopBottom( true, true, 1, -11 )
	gatewormAllComplete0:setAlpha( 0 )
	gatewormAllComplete0:setScale( 0.9 )
	gatewormAllComplete0:setImage( RegisterImage( "uie_t7_icon_inventory_worm_inuse" ) )
	gatewormAllComplete0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( gatewormAllComplete0 )
	self.gatewormAllComplete0 = gatewormAllComplete0
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, true, 54, -54 )
	VSpanel:setTopBottom( true, true, 53.6, -6 )
	VSpanel:setRGB( 0.5, 0.5, 0.5 )
	VSpanel:setAlpha( 0 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local FEFeaturedFrame0 = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame0:setLeftRight( true, true, 7, -7 )
	FEFeaturedFrame0:setTopBottom( true, true, 0, -10 )
	FEFeaturedFrame0:setAlpha( 0 )
	self:addElement( FEFeaturedFrame0 )
	self.FEFeaturedFrame0 = FEFeaturedFrame0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				BackingHexaWhite:completeAnimation()
				self.BackingHexaWhite:setAlpha( 0 )
				self.clipFinished( BackingHexaWhite, {} )

				BackingHexa:completeAnimation()
				self.BackingHexa:setAlpha( 0 )
				self.clipFinished( BackingHexa, {} )

				BackingDark:completeAnimation()
				self.BackingDark:setAlpha( 0 )
				self.clipFinished( BackingDark, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				HexagonePatterns:completeAnimation()
				self.HexagonePatterns:setAlpha( 0 )
				self.clipFinished( HexagonePatterns, {} )

				gatewormVisible:completeAnimation()
				self.gatewormVisible:setAlpha( 0 )
				self.clipFinished( gatewormVisible, {} )

				gatewormComplete:completeAnimation()
				self.gatewormComplete:setAlpha( 0 )
				self.clipFinished( gatewormComplete, {} )

				summoningKeyVisible:completeAnimation()
				self.summoningKeyVisible:setAlpha( 0 )
				self.clipFinished( summoningKeyVisible, {} )

				summoningKeyComplete:completeAnimation()
				self.summoningKeyComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyComplete, {} )

				summoningKeyAllComplete:completeAnimation()
				self.summoningKeyAllComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyAllComplete, {} )

				gatewormAllComplete:completeAnimation()
				self.gatewormAllComplete:setAlpha( 0 )
				self.clipFinished( gatewormAllComplete, {} )

				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )
			end
		},
		AllCompleteSummoningKey = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				BackingHexaWhite:completeAnimation()
				self.BackingHexaWhite:setRGB( 0.05, 1, 0.63 )
				self.BackingHexaWhite:setAlpha( 1 )
				self.clipFinished( BackingHexaWhite, {} )

				BackingHexa:completeAnimation()
				self.BackingHexa:setAlpha( 0 )
				self.clipFinished( BackingHexa, {} )

				BackingDark:completeAnimation()
				self.BackingDark:setAlpha( 0 )
				self.clipFinished( BackingDark, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				gatewormVisible:completeAnimation()
				self.gatewormVisible:setAlpha( 0 )
				self.clipFinished( gatewormVisible, {} )

				gatewormComplete:completeAnimation()
				self.gatewormComplete:setAlpha( 0 )
				self.clipFinished( gatewormComplete, {} )

				gatewormComplete0:completeAnimation()
				self.gatewormComplete0:setAlpha( 0 )
				self.clipFinished( gatewormComplete0, {} )

				summoningKeyVisible:completeAnimation()
				self.summoningKeyVisible:setAlpha( 0 )
				self.clipFinished( summoningKeyVisible, {} )

				summoningKeyComplete:completeAnimation()
				self.summoningKeyComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyComplete, {} )

				summoningKeyAllComplete:completeAnimation()
				self.summoningKeyAllComplete:setAlpha( 1 )
				self.clipFinished( summoningKeyAllComplete, {} )

				gatewormAllComplete:completeAnimation()
				self.gatewormAllComplete:setAlpha( 0 )
				self.clipFinished( gatewormAllComplete, {} )

				gatewormAllComplete0:completeAnimation()
				self.gatewormAllComplete0:setAlpha( 0 )
				self.clipFinished( gatewormAllComplete0, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setRGB( 0, 1, 0.03 )
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )
			end
		},
		AllCompleteGateworm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				BackingHexaWhite:completeAnimation()
				self.BackingHexaWhite:setRGB( 0.05, 1, 0.63 )
				self.BackingHexaWhite:setAlpha( 1 )
				self.clipFinished( BackingHexaWhite, {} )

				BackingHexa:completeAnimation()
				self.BackingHexa:setAlpha( 0 )
				self.clipFinished( BackingHexa, {} )

				BackingDark:completeAnimation()
				self.BackingDark:setAlpha( 0 )
				self.clipFinished( BackingDark, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				gatewormVisible:completeAnimation()
				self.gatewormVisible:setAlpha( 0 )
				self.clipFinished( gatewormVisible, {} )

				gatewormComplete:completeAnimation()
				self.gatewormComplete:setAlpha( 0 )
				self.clipFinished( gatewormComplete, {} )

				gatewormComplete0:completeAnimation()
				self.gatewormComplete0:setAlpha( 0 )
				self.clipFinished( gatewormComplete0, {} )

				summoningKeyVisible:completeAnimation()
				self.summoningKeyVisible:setAlpha( 0 )
				self.clipFinished( summoningKeyVisible, {} )

				summoningKeyComplete:completeAnimation()
				self.summoningKeyComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyComplete, {} )

				summoningKeyAllComplete:completeAnimation()
				self.summoningKeyAllComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyAllComplete, {} )

				gatewormAllComplete:completeAnimation()
				self.gatewormAllComplete:setAlpha( 1 )
				self.gatewormAllComplete:setScale( 0.95 )
				self.clipFinished( gatewormAllComplete, {} )

				gatewormAllComplete0:completeAnimation()
				self.gatewormAllComplete0:setAlpha( 0.1 )
				self.gatewormAllComplete0:setScale( 0.9 )
				self.gatewormAllComplete0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( gatewormAllComplete0, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setRGB( 0.11, 1, 0 )
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )
			end
		},
		VisibleGateworm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )

				BackingHexaWhite:completeAnimation()
				self.BackingHexaWhite:setAlpha( 0 )
				self.clipFinished( BackingHexaWhite, {} )

				BackingHexa:completeAnimation()
				self.BackingHexa:setAlpha( 1 )
				self.BackingHexa:setImage( RegisterImage( "uie_t7_icon_inventory_worm_egg_container_black" ) )
				self.clipFinished( BackingHexa, {} )

				BackingDark:completeAnimation()
				self.BackingDark:setAlpha( 0 )
				self.clipFinished( BackingDark, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setRGB( 1, 1, 1 )
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				HexagonePatterns:completeAnimation()
				self.HexagonePatterns:setAlpha( 0.28 )
				self.clipFinished( HexagonePatterns, {} )

				gatewormVisible:completeAnimation()
				self.gatewormVisible:setRGB( 0.07, 0.04, 0.04 )
				self.gatewormVisible:setAlpha( 1 )
				self.gatewormVisible:setZRot( 0 )
				self.gatewormVisible:setImage( RegisterImage( "uie_t7_icon_inventory_worm_disabled" ) )
				self.clipFinished( gatewormVisible, {} )

				gatewormComplete:completeAnimation()
				self.gatewormComplete:setAlpha( 0 )
				self.clipFinished( gatewormComplete, {} )

				gatewormComplete0:completeAnimation()
				self.gatewormComplete0:setAlpha( 0 )
				self.clipFinished( gatewormComplete0, {} )

				summoningKeyVisible:completeAnimation()
				self.summoningKeyVisible:setAlpha( 0 )
				self.summoningKeyVisible:setImage( RegisterImage( "uie_t7_icon_inventory_worm_disabled" ) )
				self.clipFinished( summoningKeyVisible, {} )

				summoningKeyComplete:completeAnimation()
				self.summoningKeyComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyComplete, {} )

				summoningKeyAllComplete:completeAnimation()
				self.summoningKeyAllComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyAllComplete, {} )

				gatewormAllComplete:completeAnimation()
				self.gatewormAllComplete:setAlpha( 0 )
				self.clipFinished( gatewormAllComplete, {} )

				gatewormAllComplete0:completeAnimation()
				self.gatewormAllComplete0:setAlpha( 0 )
				self.clipFinished( gatewormAllComplete0, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )
			end
		},
		CompleteGateworm = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				BackingHexaWhite:completeAnimation()
				self.BackingHexaWhite:setRGB( 0, 1, 0 )
				self.BackingHexaWhite:setAlpha( 1 )
				self.clipFinished( BackingHexaWhite, {} )

				BackingHexa:completeAnimation()
				self.BackingHexa:setRGB( 0.38, 0.97, 0 )
				self.BackingHexa:setAlpha( 0 )
				self.clipFinished( BackingHexa, {} )

				BackingDark:completeAnimation()
				self.BackingDark:setAlpha( 0 )
				self.clipFinished( BackingDark, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				gatewormVisible:completeAnimation()
				self.gatewormVisible:setAlpha( 0 )
				self.clipFinished( gatewormVisible, {} )

				gatewormComplete:completeAnimation()
				self.gatewormComplete:setRGB( 1, 1, 1 )
				self.gatewormComplete:setAlpha( 1 )
				self.gatewormComplete:setScale( 0.95 )
				self.gatewormComplete:setImage( RegisterImage( "uie_t7_icon_inventory_worm_new" ) )
				self.clipFinished( gatewormComplete, {} )

				gatewormComplete0:completeAnimation()
				self.gatewormComplete0:setAlpha( 0 )
				self.gatewormComplete0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( gatewormComplete0, {} )

				summoningKeyVisible:completeAnimation()
				self.summoningKeyVisible:setAlpha( 0 )
				self.clipFinished( summoningKeyVisible, {} )

				summoningKeyComplete:completeAnimation()
				self.summoningKeyComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyComplete, {} )

				summoningKeyAllComplete:completeAnimation()
				self.summoningKeyAllComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyAllComplete, {} )

				gatewormAllComplete:completeAnimation()
				self.gatewormAllComplete:setAlpha( 0 )
				self.clipFinished( gatewormAllComplete, {} )

				gatewormAllComplete0:completeAnimation()
				self.gatewormAllComplete0:setAlpha( 0 )
				self.clipFinished( gatewormAllComplete0, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setRGB( 0.11, 1, 0 )
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )
			end
		},
		VisibleSummoningKey = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				BackingHexaWhite:completeAnimation()
				self.BackingHexaWhite:setAlpha( 0 )
				self.clipFinished( BackingHexaWhite, {} )

				BackingHexa:completeAnimation()
				self.BackingHexa:setAlpha( 1 )
				self.clipFinished( BackingHexa, {} )

				BackingDark:completeAnimation()
				self.BackingDark:setAlpha( 0 )
				self.clipFinished( BackingDark, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				gatewormVisible:completeAnimation()
				self.gatewormVisible:setAlpha( 0 )
				self.clipFinished( gatewormVisible, {} )

				gatewormComplete:completeAnimation()
				self.gatewormComplete:setAlpha( 0 )
				self.clipFinished( gatewormComplete, {} )

				gatewormComplete0:completeAnimation()
				self.gatewormComplete0:setAlpha( 0 )
				self.clipFinished( gatewormComplete0, {} )

				summoningKeyVisible:completeAnimation()
				self.summoningKeyVisible:setRGB( 0, 0, 0 )
				self.summoningKeyVisible:setAlpha( 1 )
				self.summoningKeyVisible:setScale( 0.9 )
				self.clipFinished( summoningKeyVisible, {} )

				summoningKeyComplete:completeAnimation()
				self.summoningKeyComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyComplete, {} )

				summoningKeyAllComplete:completeAnimation()
				self.summoningKeyAllComplete:setAlpha( 0 )
				self.clipFinished( summoningKeyAllComplete, {} )

				gatewormAllComplete:completeAnimation()
				self.gatewormAllComplete:setAlpha( 0 )
				self.clipFinished( gatewormAllComplete, {} )

				gatewormAllComplete0:completeAnimation()
				self.gatewormAllComplete0:setAlpha( 0 )
				self.clipFinished( gatewormAllComplete0, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )
			end
		},
		CompleteSummoningKey = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )

				BackingHexaWhite:completeAnimation()
				self.BackingHexaWhite:setRGB( 0, 1, 0.02 )
				self.BackingHexaWhite:setAlpha( 1 )
				self.clipFinished( BackingHexaWhite, {} )

				BackingHexa:completeAnimation()
				self.BackingHexa:setAlpha( 0 )
				self.clipFinished( BackingHexa, {} )

				BackingDark:completeAnimation()
				self.BackingDark:setAlpha( 0 )
				self.clipFinished( BackingDark, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				gatewormVisible:completeAnimation()
				self.gatewormVisible:setAlpha( 0 )
				self.clipFinished( gatewormVisible, {} )

				gatewormComplete:completeAnimation()
				self.gatewormComplete:setAlpha( 0 )
				self.clipFinished( gatewormComplete, {} )

				gatewormComplete0:completeAnimation()
				self.gatewormComplete0:setAlpha( 0 )
				self.clipFinished( gatewormComplete0, {} )

				summoningKeyVisible:completeAnimation()
				self.summoningKeyVisible:setAlpha( 0 )
				self.clipFinished( summoningKeyVisible, {} )

				summoningKeyComplete:completeAnimation()
				self.summoningKeyComplete:setAlpha( 1 )
				self.clipFinished( summoningKeyComplete, {} )

				gatewormAllComplete0:completeAnimation()
				self.gatewormAllComplete0:setAlpha( 0 )
				self.clipFinished( gatewormAllComplete0, {} )

				FEFeaturedFrame0:completeAnimation()
				self.FEFeaturedFrame0:setRGB( 0.11, 1, 0 )
				self.FEFeaturedFrame0:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "AllCompleteSummoningKey",
			condition = function ( menu, element, event )
				local f9_local0 = IsZombies()
				if f9_local0 then
					f9_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f9_local0 then
						f9_local0 = IsSelfModelValueTrue( element, controller, "completed" )
						if f9_local0 then
							f9_local0 = IsGlobalModelValueTrue( element, controller, "eeGateworm.allComplete" )
							if f9_local0 then
								f9_local0 = IsSelfModelValueEqualTo( element, controller, "mapRef", "ZM_ZOD" )
								if f9_local0 then
									f9_local0 = IsSelfModelValueTrue( element, controller, "showingAll" )
								end
							end
						end
					end
				end
				return f9_local0
			end
		},
		{
			stateName = "AllCompleteGateworm",
			condition = function ( menu, element, event )
				local f10_local0 = IsZombies()
				if f10_local0 then
					f10_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f10_local0 then
						f10_local0 = IsSelfModelValueTrue( element, controller, "completed" )
						if f10_local0 then
							f10_local0 = IsGlobalModelValueTrue( element, controller, "eeGateworm.allComplete" )
							if f10_local0 then
								f10_local0 = IsSelfModelValueTrue( element, controller, "showingAll" )
							end
						end
					end
				end
				return f10_local0
			end
		},
		{
			stateName = "VisibleGateworm",
			condition = function ( menu, element, event )
				local f11_local0 = IsZombies()
				if f11_local0 then
					f11_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f11_local0 then
						if not IsSelfModelValueTrue( element, controller, "completed" ) then
							f11_local0 = not IsSelfModelValueEqualTo( element, controller, "mapRef", "ZM_ZOD" )
						else
							f11_local0 = false
						end
					end
				end
				return f11_local0
			end
		},
		{
			stateName = "CompleteGateworm",
			condition = function ( menu, element, event )
				local f12_local0 = IsZombies()
				if f12_local0 then
					f12_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f12_local0 then
						f12_local0 = IsSelfModelValueTrue( element, controller, "completed" )
						if f12_local0 then
							f12_local0 = not IsSelfModelValueEqualTo( element, controller, "mapRef", "ZM_ZOD" )
						end
					end
				end
				return f12_local0
			end
		},
		{
			stateName = "VisibleSummoningKey",
			condition = function ( menu, element, event )
				local f13_local0 = IsZombies()
				if f13_local0 then
					f13_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f13_local0 then
						f13_local0 = not IsSelfModelValueTrue( element, controller, "completed" )
					end
				end
				return f13_local0
			end
		},
		{
			stateName = "CompleteSummoningKey",
			condition = function ( menu, element, event )
				local f14_local0 = IsZombies()
				if f14_local0 then
					f14_local0 = IsSelfModelValueTrue( element, controller, "visible" )
					if f14_local0 then
						f14_local0 = IsSelfModelValueTrue( element, controller, "completed" )
					end
				end
				return f14_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:linkToElementModel( self, "visible", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "visible"
		} )
	end )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "eeGateworm.allComplete" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "eeGateworm.allComplete"
		} )
	end )
	self:linkToElementModel( self, "mapRef", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "mapRef"
		} )
	end )
	self:linkToElementModel( self, "showingAll", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showingAll"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VSpanel:close()
		element.FEFeaturedFrame0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
