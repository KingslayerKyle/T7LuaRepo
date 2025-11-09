require( "ui.uieditor.widgets.CAC.WeaponMeterBacking" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingB" )
require( "ui.uieditor.widgets.CAC.cac_WpnLvlMeter" )
require( "ui.uieditor.widgets.CAC.cac_LargePrestigeStars" )

CoD.cac_WpnLvl = InheritFrom( LUI.UIElement )
CoD.cac_WpnLvl.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_WpnLvl )
	self.id = "cac_WpnLvl"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 415 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local WeaponMeterBacking = CoD.WeaponMeterBacking.new( menu, controller )
	WeaponMeterBacking:setLeftRight( true, false, 173, 339 )
	WeaponMeterBacking:setTopBottom( true, false, 9, 31 )
	self:addElement( WeaponMeterBacking )
	self.WeaponMeterBacking = WeaponMeterBacking
	
	local levelBoxBg = CoD.FE_TitleNumBrdr.new( menu, controller )
	levelBoxBg:setLeftRight( true, true, 0, -275 )
	levelBoxBg:setTopBottom( false, false, -11, 11 )
	self:addElement( levelBoxBg )
	self.levelBoxBg = levelBoxBg
	
	local levelLabel = CoD.FE_LabelSubHeadingB.new( menu, controller )
	levelLabel:setLeftRight( true, false, 6, 138 )
	levelLabel:setTopBottom( true, false, 10.5, 29.5 )
	levelLabel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	levelLabel:setShaderVector( 0, 0.05, 0, 0, 0 )
	levelLabel:setShaderVector( 1, 0, 0, 0, 0 )
	levelLabel:setShaderVector( 2, 0, 0, 0, 0 )
	levelLabel:setShaderVector( 3, 0, 0, 0, 0 )
	levelLabel:setShaderVector( 4, 0, 0, 0, 0 )
	levelLabel.Label1:setRGB( 0.71, 0.76, 0.77 )
	levelLabel.Label1:setText( Engine.Localize( "MPUI_WEAPON_LEVEL_CAPS" ) )
	levelLabel.Label1:setTTF( "fonts/escom.ttf" )
	levelLabel.Label1:setLetterSpacing( 3.6 )
	self:addElement( levelLabel )
	self.levelLabel = levelLabel
	
	local levelTextBg = LUI.UIImage.new()
	levelTextBg:setLeftRight( true, false, 142, 174 )
	levelTextBg:setTopBottom( true, false, 4, 36 )
	levelTextBg:setAlpha( 0 )
	levelTextBg:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterside" ) )
	levelTextBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( levelTextBg )
	self.levelTextBg = levelTextBg
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( false, false, -62.5, -36.5 )
	bg:setTopBottom( false, true, -31, -9 )
	bg:setAlpha( 0.25 )
	self:addElement( bg )
	self.bg = bg
	
	local bg0 = LUI.UIImage.new()
	bg0:setLeftRight( false, false, 132.5, 158.5 )
	bg0:setTopBottom( false, true, -31, -9 )
	bg0:setAlpha( 0.25 )
	self:addElement( bg0 )
	self.bg0 = bg0
	
	local currentLevelBacking = LUI.UITightText.new()
	currentLevelBacking:setLeftRight( false, false, -56.5, -42.5 )
	currentLevelBacking:setTopBottom( false, true, -30, -10 )
	currentLevelBacking:setText( Engine.Localize( "12" ) )
	currentLevelBacking:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( currentLevelBacking )
	self.currentLevelBacking = currentLevelBacking
	
	local currentLevel = LUI.UIText.new()
	currentLevel:setLeftRight( true, false, 127.5, 188.5 )
	currentLevel:setTopBottom( true, false, 10, 30 )
	currentLevel:setText( Engine.Localize( "12" ) )
	currentLevel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	currentLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	currentLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentLevel )
	self.currentLevel = currentLevel
	
	local topRightDots = LUI.UIImage.new()
	topRightDots:setLeftRight( true, false, 379, 415 )
	topRightDots:setTopBottom( true, false, 4, 8 )
	topRightDots:setAlpha( 0.5 )
	topRightDots:setYRot( -180 )
	topRightDots:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	topRightDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( topRightDots )
	self.topRightDots = topRightDots
	
	local bottomRightDots = LUI.UIImage.new()
	bottomRightDots:setLeftRight( true, false, 379, 415 )
	bottomRightDots:setTopBottom( true, false, 35, 39 )
	bottomRightDots:setAlpha( 0.5 )
	bottomRightDots:setYRot( -180 )
	bottomRightDots:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	bottomRightDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bottomRightDots )
	self.bottomRightDots = bottomRightDots
	
	local rightBox = LUI.UIImage.new()
	rightBox:setLeftRight( true, false, 197, 373 )
	rightBox:setTopBottom( true, false, 0, 40 )
	rightBox:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterframe" ) )
	rightBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( rightBox )
	self.rightBox = rightBox
	
	local cacWpnLvlMeter0 = CoD.cac_WpnLvlMeter.new( menu, controller )
	cacWpnLvlMeter0:setLeftRight( true, false, 170, 339 )
	cacWpnLvlMeter0:setTopBottom( true, false, 4, 36 )
	cacWpnLvlMeter0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	cacWpnLvlMeter0.Meter:setShaderVector( 0, 0.65, 0, 0, 0 )
	cacWpnLvlMeter0.Meter2XP:setShaderVector( 0, 0.65, 0, 0, 0 )
	self:addElement( cacWpnLvlMeter0 )
	self.cacWpnLvlMeter0 = cacWpnLvlMeter0
	
	local weaponLevel = LUI.UIText.new()
	weaponLevel:setLeftRight( false, false, -124.5, -88.5 )
	weaponLevel:setTopBottom( false, true, -30, -10 )
	weaponLevel:setRGB( 0, 0, 0 )
	weaponLevel:setAlpha( 0 )
	weaponLevel:setText( Engine.Localize( "MPUI_MAX_CAPS" ) )
	weaponLevel:setTTF( "fonts/default.ttf" )
	weaponLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponLevel )
	self.weaponLevel = weaponLevel
	
	local levelTextBg0 = LUI.UIImage.new()
	levelTextBg0:setLeftRight( true, false, 337, 369 )
	levelTextBg0:setTopBottom( true, false, 4, 36 )
	levelTextBg0:setAlpha( 0 )
	levelTextBg0:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterside" ) )
	levelTextBg0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( levelTextBg0 )
	self.levelTextBg0 = levelTextBg0
	
	local nextLevel = LUI.UIText.new()
	nextLevel:setLeftRight( true, false, 322.81, 383.81 )
	nextLevel:setTopBottom( true, false, 10, 30 )
	nextLevel:setText( Engine.Localize( "13" ) )
	nextLevel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nextLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	nextLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( nextLevel )
	self.nextLevel = nextLevel
	
	local cacLargePrestigeStars0 = CoD.cac_LargePrestigeStars.new( menu, controller )
	cacLargePrestigeStars0:setLeftRight( true, false, 373, 389 )
	cacLargePrestigeStars0:setTopBottom( true, false, 4, 36 )
	cacLargePrestigeStars0:setScale( 0.8 )
	cacLargePrestigeStars0:linkToElementModel( self, nil, false, function ( model )
		cacLargePrestigeStars0:setModel( model, controller )
	end )
	self:addElement( cacLargePrestigeStars0 )
	self.cacLargePrestigeStars0 = cacLargePrestigeStars0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				WeaponMeterBacking:completeAnimation()
				self.WeaponMeterBacking:setAlpha( 0 )
				self.clipFinished( WeaponMeterBacking, {} )
				levelBoxBg:completeAnimation()
				self.levelBoxBg:setAlpha( 0 )
				self.clipFinished( levelBoxBg, {} )
				levelLabel:completeAnimation()
				self.levelLabel:setAlpha( 0 )
				self.clipFinished( levelLabel, {} )
				levelTextBg:completeAnimation()
				self.levelTextBg:setAlpha( 0 )
				self.clipFinished( levelTextBg, {} )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				bg0:completeAnimation()
				self.bg0:setAlpha( 0 )
				self.clipFinished( bg0, {} )
				currentLevelBacking:completeAnimation()
				self.currentLevelBacking:setAlpha( 0 )
				self.clipFinished( currentLevelBacking, {} )
				currentLevel:completeAnimation()
				self.currentLevel:setAlpha( 0 )
				self.clipFinished( currentLevel, {} )
				topRightDots:completeAnimation()
				self.topRightDots:setAlpha( 0 )
				self.clipFinished( topRightDots, {} )
				bottomRightDots:completeAnimation()
				self.bottomRightDots:setAlpha( 0 )
				self.clipFinished( bottomRightDots, {} )
				rightBox:completeAnimation()
				self.rightBox:setAlpha( 0 )
				self.clipFinished( rightBox, {} )
				cacWpnLvlMeter0:completeAnimation()
				self.cacWpnLvlMeter0:setAlpha( 0 )
				self.clipFinished( cacWpnLvlMeter0, {} )
				weaponLevel:completeAnimation()
				self.weaponLevel:setAlpha( 0 )
				self.clipFinished( weaponLevel, {} )
				levelTextBg0:completeAnimation()
				self.levelTextBg0:setAlpha( 0 )
				self.clipFinished( levelTextBg0, {} )
				nextLevel:completeAnimation()
				self.nextLevel:setAlpha( 0 )
				self.clipFinished( nextLevel, {} )
				cacLargePrestigeStars0:completeAnimation()
				self.cacLargePrestigeStars0:setAlpha( 0 )
				self.clipFinished( cacLargePrestigeStars0, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 10 )
				local levelBoxBgFrame2 = function ( levelBoxBg, event )
					local levelBoxBgFrame3 = function ( levelBoxBg, event )
						if not event.interrupted then
							levelBoxBg:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						levelBoxBg:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( levelBoxBg, event )
						else
							levelBoxBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						levelBoxBgFrame3( levelBoxBg, event )
						return 
					else
						levelBoxBg:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						levelBoxBg:registerEventHandler( "transition_complete_keyframe", levelBoxBgFrame3 )
					end
				end
				
				levelBoxBg:completeAnimation()
				self.levelBoxBg:setAlpha( 0 )
				levelBoxBgFrame2( levelBoxBg, {} )
				local levelLabelFrame2 = function ( levelLabel, event )
					local levelLabelFrame3 = function ( levelLabel, event )
						if not event.interrupted then
							levelLabel:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						levelLabel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( levelLabel, event )
						else
							levelLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						levelLabelFrame3( levelLabel, event )
						return 
					else
						levelLabel:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						levelLabel:registerEventHandler( "transition_complete_keyframe", levelLabelFrame3 )
					end
				end
				
				levelLabel:completeAnimation()
				self.levelLabel:setAlpha( 0 )
				levelLabelFrame2( levelLabel, {} )
				local levelTextBgFrame2 = function ( levelTextBg, event )
					if not event.interrupted then
						levelTextBg:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
					end
					levelTextBg:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( levelTextBg, event )
					else
						levelTextBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				levelTextBg:completeAnimation()
				self.levelTextBg:setAlpha( 0 )
				levelTextBgFrame2( levelTextBg, {} )
				local currentLevelBackingFrame2 = function ( currentLevelBacking, event )
					local currentLevelBackingFrame3 = function ( currentLevelBacking, event )
						if not event.interrupted then
							currentLevelBacking:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						currentLevelBacking:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( currentLevelBacking, event )
						else
							currentLevelBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						currentLevelBackingFrame3( currentLevelBacking, event )
						return 
					else
						currentLevelBacking:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						currentLevelBacking:registerEventHandler( "transition_complete_keyframe", currentLevelBackingFrame3 )
					end
				end
				
				currentLevelBacking:completeAnimation()
				self.currentLevelBacking:setAlpha( 0 )
				currentLevelBackingFrame2( currentLevelBacking, {} )
				local currentLevelFrame2 = function ( currentLevel, event )
					local currentLevelFrame3 = function ( currentLevel, event )
						if not event.interrupted then
							currentLevel:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Bounce )
						end
						currentLevel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( currentLevel, event )
						else
							currentLevel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						currentLevelFrame3( currentLevel, event )
						return 
					else
						currentLevel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						currentLevel:registerEventHandler( "transition_complete_keyframe", currentLevelFrame3 )
					end
				end
				
				currentLevel:completeAnimation()
				self.currentLevel:setAlpha( 0 )
				currentLevelFrame2( currentLevel, {} )
				local topRightDotsFrame2 = function ( topRightDots, event )
					if not event.interrupted then
						topRightDots:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
					end
					topRightDots:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( topRightDots, event )
					else
						topRightDots:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				topRightDots:completeAnimation()
				self.topRightDots:setAlpha( 0 )
				topRightDotsFrame2( topRightDots, {} )
				local bottomRightDotsFrame2 = function ( bottomRightDots, event )
					local bottomRightDotsFrame3 = function ( bottomRightDots, event )
						if not event.interrupted then
							bottomRightDots:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Bounce )
						end
						bottomRightDots:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( bottomRightDots, event )
						else
							bottomRightDots:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bottomRightDotsFrame3( bottomRightDots, event )
						return 
					else
						bottomRightDots:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						bottomRightDots:registerEventHandler( "transition_complete_keyframe", bottomRightDotsFrame3 )
					end
				end
				
				bottomRightDots:completeAnimation()
				self.bottomRightDots:setAlpha( 0 )
				bottomRightDotsFrame2( bottomRightDots, {} )
				local rightBoxFrame2 = function ( rightBox, event )
					local rightBoxFrame3 = function ( rightBox, event )
						if not event.interrupted then
							rightBox:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						rightBox:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( rightBox, event )
						else
							rightBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rightBoxFrame3( rightBox, event )
						return 
					else
						rightBox:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						rightBox:registerEventHandler( "transition_complete_keyframe", rightBoxFrame3 )
					end
				end
				
				rightBox:completeAnimation()
				self.rightBox:setAlpha( 0 )
				rightBoxFrame2( rightBox, {} )
				local cacWpnLvlMeter0Frame2 = function ( cacWpnLvlMeter0, event )
					local cacWpnLvlMeter0Frame3 = function ( cacWpnLvlMeter0, event )
						if not event.interrupted then
							cacWpnLvlMeter0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						cacWpnLvlMeter0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( cacWpnLvlMeter0, event )
						else
							cacWpnLvlMeter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						cacWpnLvlMeter0Frame3( cacWpnLvlMeter0, event )
						return 
					else
						cacWpnLvlMeter0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						cacWpnLvlMeter0:registerEventHandler( "transition_complete_keyframe", cacWpnLvlMeter0Frame3 )
					end
				end
				
				cacWpnLvlMeter0:completeAnimation()
				self.cacWpnLvlMeter0:setAlpha( 0 )
				cacWpnLvlMeter0Frame2( cacWpnLvlMeter0, {} )
				local nextLevelFrame2 = function ( nextLevel, event )
					local nextLevelFrame3 = function ( nextLevel, event )
						if not event.interrupted then
							nextLevel:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						nextLevel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( nextLevel, event )
						else
							nextLevel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						nextLevelFrame3( nextLevel, event )
						return 
					else
						nextLevel:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						nextLevel:registerEventHandler( "transition_complete_keyframe", nextLevelFrame3 )
					end
				end
				
				nextLevel:completeAnimation()
				self.nextLevel:setAlpha( 0 )
				nextLevelFrame2( nextLevel, {} )
			end
		},
		DisplayLevel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				WeaponMeterBacking:completeAnimation()
				self.WeaponMeterBacking:setAlpha( 1 )
				self.clipFinished( WeaponMeterBacking, {} )
				levelBoxBg:completeAnimation()
				self.levelBoxBg:setAlpha( 1 )
				self.clipFinished( levelBoxBg, {} )
				levelLabel:completeAnimation()
				self.levelLabel:setAlpha( 1 )
				self.clipFinished( levelLabel, {} )
				levelTextBg:completeAnimation()
				self.levelTextBg:setAlpha( 0 )
				self.clipFinished( levelTextBg, {} )
				bg:completeAnimation()
				self.bg:setAlpha( 0.25 )
				self.clipFinished( bg, {} )
				bg0:completeAnimation()
				self.bg0:setAlpha( 0.25 )
				self.clipFinished( bg0, {} )
				currentLevelBacking:completeAnimation()
				self.currentLevelBacking:setAlpha( 1 )
				self.clipFinished( currentLevelBacking, {} )
				currentLevel:completeAnimation()
				self.currentLevel:setLeftRight( true, false, 127.5, 188.5 )
				self.currentLevel:setTopBottom( true, false, 10, 30 )
				self.currentLevel:setAlpha( 1 )
				self.clipFinished( currentLevel, {} )
				topRightDots:completeAnimation()
				self.topRightDots:setAlpha( 0.5 )
				self.clipFinished( topRightDots, {} )
				bottomRightDots:completeAnimation()
				self.bottomRightDots:setAlpha( 0.5 )
				self.clipFinished( bottomRightDots, {} )
				rightBox:completeAnimation()
				self.rightBox:setAlpha( 1 )
				self.clipFinished( rightBox, {} )
				cacWpnLvlMeter0:completeAnimation()
				self.cacWpnLvlMeter0:setAlpha( 1 )
				self.clipFinished( cacWpnLvlMeter0, {} )
				weaponLevel:completeAnimation()
				self.weaponLevel:setAlpha( 0 )
				self.clipFinished( weaponLevel, {} )
				levelTextBg0:completeAnimation()
				self.levelTextBg0:setAlpha( 0 )
				self.clipFinished( levelTextBg0, {} )
				nextLevel:completeAnimation()
				self.nextLevel:setAlpha( 1 )
				self.clipFinished( nextLevel, {} )
				cacLargePrestigeStars0:completeAnimation()
				self.cacLargePrestigeStars0:setLeftRight( true, false, 373, 389 )
				self.cacLargePrestigeStars0:setTopBottom( true, false, 4, 36 )
				self.cacLargePrestigeStars0:setAlpha( 1 )
				self.clipFinished( cacLargePrestigeStars0, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 10 )
				local levelBoxBgFrame2 = function ( levelBoxBg, event )
					local levelBoxBgFrame3 = function ( levelBoxBg, event )
						if not event.interrupted then
							levelBoxBg:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						levelBoxBg:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( levelBoxBg, event )
						else
							levelBoxBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						levelBoxBgFrame3( levelBoxBg, event )
						return 
					else
						levelBoxBg:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						levelBoxBg:registerEventHandler( "transition_complete_keyframe", levelBoxBgFrame3 )
					end
				end
				
				levelBoxBg:completeAnimation()
				self.levelBoxBg:setAlpha( 0 )
				levelBoxBgFrame2( levelBoxBg, {} )
				local levelLabelFrame2 = function ( levelLabel, event )
					local levelLabelFrame3 = function ( levelLabel, event )
						if not event.interrupted then
							levelLabel:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						levelLabel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( levelLabel, event )
						else
							levelLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						levelLabelFrame3( levelLabel, event )
						return 
					else
						levelLabel:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						levelLabel:registerEventHandler( "transition_complete_keyframe", levelLabelFrame3 )
					end
				end
				
				levelLabel:completeAnimation()
				self.levelLabel:setAlpha( 0 )
				levelLabelFrame2( levelLabel, {} )
				local levelTextBgFrame2 = function ( levelTextBg, event )
					if not event.interrupted then
						levelTextBg:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
					end
					levelTextBg:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( levelTextBg, event )
					else
						levelTextBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				levelTextBg:completeAnimation()
				self.levelTextBg:setAlpha( 0 )
				levelTextBgFrame2( levelTextBg, {} )
				local currentLevelBackingFrame2 = function ( currentLevelBacking, event )
					local currentLevelBackingFrame3 = function ( currentLevelBacking, event )
						if not event.interrupted then
							currentLevelBacking:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						currentLevelBacking:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( currentLevelBacking, event )
						else
							currentLevelBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						currentLevelBackingFrame3( currentLevelBacking, event )
						return 
					else
						currentLevelBacking:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						currentLevelBacking:registerEventHandler( "transition_complete_keyframe", currentLevelBackingFrame3 )
					end
				end
				
				currentLevelBacking:completeAnimation()
				self.currentLevelBacking:setAlpha( 0 )
				currentLevelBackingFrame2( currentLevelBacking, {} )
				local currentLevelFrame2 = function ( currentLevel, event )
					local currentLevelFrame3 = function ( currentLevel, event )
						if not event.interrupted then
							currentLevel:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Bounce )
						end
						currentLevel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( currentLevel, event )
						else
							currentLevel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						currentLevelFrame3( currentLevel, event )
						return 
					else
						currentLevel:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						currentLevel:registerEventHandler( "transition_complete_keyframe", currentLevelFrame3 )
					end
				end
				
				currentLevel:completeAnimation()
				self.currentLevel:setAlpha( 0 )
				currentLevelFrame2( currentLevel, {} )
				local topRightDotsFrame2 = function ( topRightDots, event )
					if not event.interrupted then
						topRightDots:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
					end
					topRightDots:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( topRightDots, event )
					else
						topRightDots:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				topRightDots:completeAnimation()
				self.topRightDots:setAlpha( 0 )
				topRightDotsFrame2( topRightDots, {} )
				local bottomRightDotsFrame2 = function ( bottomRightDots, event )
					local bottomRightDotsFrame3 = function ( bottomRightDots, event )
						if not event.interrupted then
							bottomRightDots:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Bounce )
						end
						bottomRightDots:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( bottomRightDots, event )
						else
							bottomRightDots:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bottomRightDotsFrame3( bottomRightDots, event )
						return 
					else
						bottomRightDots:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						bottomRightDots:registerEventHandler( "transition_complete_keyframe", bottomRightDotsFrame3 )
					end
				end
				
				bottomRightDots:completeAnimation()
				self.bottomRightDots:setAlpha( 0 )
				bottomRightDotsFrame2( bottomRightDots, {} )
				local rightBoxFrame2 = function ( rightBox, event )
					local rightBoxFrame3 = function ( rightBox, event )
						if not event.interrupted then
							rightBox:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						rightBox:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( rightBox, event )
						else
							rightBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rightBoxFrame3( rightBox, event )
						return 
					else
						rightBox:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						rightBox:registerEventHandler( "transition_complete_keyframe", rightBoxFrame3 )
					end
				end
				
				rightBox:completeAnimation()
				self.rightBox:setAlpha( 0 )
				rightBoxFrame2( rightBox, {} )
				local cacWpnLvlMeter0Frame2 = function ( cacWpnLvlMeter0, event )
					local cacWpnLvlMeter0Frame3 = function ( cacWpnLvlMeter0, event )
						if not event.interrupted then
							cacWpnLvlMeter0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						cacWpnLvlMeter0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( cacWpnLvlMeter0, event )
						else
							cacWpnLvlMeter0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						cacWpnLvlMeter0Frame3( cacWpnLvlMeter0, event )
						return 
					else
						cacWpnLvlMeter0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						cacWpnLvlMeter0:registerEventHandler( "transition_complete_keyframe", cacWpnLvlMeter0Frame3 )
					end
				end
				
				cacWpnLvlMeter0:completeAnimation()
				self.cacWpnLvlMeter0:setAlpha( 0 )
				cacWpnLvlMeter0Frame2( cacWpnLvlMeter0, {} )
				local nextLevelFrame2 = function ( nextLevel, event )
					local nextLevelFrame3 = function ( nextLevel, event )
						if not event.interrupted then
							nextLevel:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						nextLevel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( nextLevel, event )
						else
							nextLevel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						nextLevelFrame3( nextLevel, event )
						return 
					else
						nextLevel:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						nextLevel:registerEventHandler( "transition_complete_keyframe", nextLevelFrame3 )
					end
				end
				
				nextLevel:completeAnimation()
				self.nextLevel:setAlpha( 0 )
				nextLevelFrame2( nextLevel, {} )
			end
		},
		MaxLevel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				WeaponMeterBacking:completeAnimation()
				self.WeaponMeterBacking:setAlpha( 0 )
				self.clipFinished( WeaponMeterBacking, {} )
				levelBoxBg:completeAnimation()
				self.levelBoxBg:setAlpha( 1 )
				self.clipFinished( levelBoxBg, {} )
				levelLabel:completeAnimation()
				self.levelLabel:setAlpha( 1 )
				self.clipFinished( levelLabel, {} )
				levelTextBg:completeAnimation()
				self.levelTextBg:setLeftRight( true, false, 142, 174 )
				self.levelTextBg:setTopBottom( true, false, 4, 36 )
				self.levelTextBg:setAlpha( 1 )
				self.clipFinished( levelTextBg, {} )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				bg0:completeAnimation()
				self.bg0:setAlpha( 0 )
				self.clipFinished( bg0, {} )
				currentLevelBacking:completeAnimation()
				self.currentLevelBacking:setAlpha( 0 )
				self.clipFinished( currentLevelBacking, {} )
				currentLevel:completeAnimation()
				self.currentLevel:setAlpha( 0 )
				self.clipFinished( currentLevel, {} )
				topRightDots:completeAnimation()
				self.topRightDots:setAlpha( 0 )
				self.clipFinished( topRightDots, {} )
				bottomRightDots:completeAnimation()
				self.bottomRightDots:setAlpha( 0 )
				self.clipFinished( bottomRightDots, {} )
				rightBox:completeAnimation()
				self.rightBox:setAlpha( 0 )
				self.clipFinished( rightBox, {} )
				cacWpnLvlMeter0:completeAnimation()
				self.cacWpnLvlMeter0:setAlpha( 0 )
				self.clipFinished( cacWpnLvlMeter0, {} )
				weaponLevel:completeAnimation()
				self.weaponLevel:setLeftRight( false, false, -67.5, -31.5 )
				self.weaponLevel:setTopBottom( false, true, -30, -10 )
				self.weaponLevel:setAlpha( 1 )
				self.weaponLevel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
				self.weaponLevel:setShaderVector( 0, 0.02, 0, 0, 0 )
				self.weaponLevel:setShaderVector( 1, 0, 0, 0, 0 )
				self.weaponLevel:setShaderVector( 2, 1, 0, 0, 0 )
				self.weaponLevel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( weaponLevel, {} )
				levelTextBg0:completeAnimation()
				self.levelTextBg0:setAlpha( 0 )
				self.clipFinished( levelTextBg0, {} )
				nextLevel:completeAnimation()
				self.nextLevel:setAlpha( 0 )
				self.clipFinished( nextLevel, {} )
				cacLargePrestigeStars0:completeAnimation()
				self.cacLargePrestigeStars0:setLeftRight( true, false, 173, 189 )
				self.cacLargePrestigeStars0:setTopBottom( true, false, 4, 36 )
				self.cacLargePrestigeStars0:setAlpha( 1 )
				self.clipFinished( cacLargePrestigeStars0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DisplayLevel",
			condition = function ( menu, element, event )
				local f44_local0 = IsCurrentMenuWeaponType( menu )
				if f44_local0 then
					f44_local0 = IsCACGunLevelExists( self, element, controller )
					if f44_local0 then
						f44_local0 = not IsCACGunLevelMax( self, element, controller )
					end
				end
				return f44_local0
			end
		},
		{
			stateName = "MaxLevel",
			condition = function ( menu, element, event )
				local f45_local0 = IsCurrentMenuWeaponType( menu )
				if f45_local0 then
					f45_local0 = IsCACGunLevelExists( self, element, controller )
					if f45_local0 then
						f45_local0 = IsCACGunLevelMax( self, element, controller )
					end
				end
				return f45_local0
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponMeterBacking:close()
		element.levelBoxBg:close()
		element.levelLabel:close()
		element.cacWpnLvlMeter0:close()
		element.cacLargePrestigeStars0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

