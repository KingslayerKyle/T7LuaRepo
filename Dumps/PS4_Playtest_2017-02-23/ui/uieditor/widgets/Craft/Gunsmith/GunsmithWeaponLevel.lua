require( "ui.uieditor.widgets.CAC.cac_WpnLvlMeter" )
require( "ui.uieditor.widgets.CAC.WeaponMeterBacking" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingB" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.GunsmithWeaponLevel = InheritFrom( LUI.UIElement )
CoD.GunsmithWeaponLevel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithWeaponLevel )
	self.id = "GunsmithWeaponLevel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 622 )
	self:setTopBottom( 0, 0, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local WeaponMeterBacking = CoD.WeaponMeterBacking.new( menu, controller )
	WeaponMeterBacking:setLeftRight( 0, 0, 319, 568 )
	WeaponMeterBacking:setTopBottom( 0, 0, 13.5, 46.5 )
	self:addElement( WeaponMeterBacking )
	self.WeaponMeterBacking = WeaponMeterBacking
	
	local levelBoxBg = CoD.FE_TitleNumBrdr.new( menu, controller )
	levelBoxBg:setLeftRight( 0, 1, 60, -352 )
	levelBoxBg:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	self:addElement( levelBoxBg )
	self.levelBoxBg = levelBoxBg
	
	local levelLabel = CoD.FE_LabelSubHeadingB.new( menu, controller )
	levelLabel:setLeftRight( 0, 0, 69, 267 )
	levelLabel:setTopBottom( 0, 0, 16, 44 )
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
	levelTextBg:setLeftRight( 0, 0, 273, 321 )
	levelTextBg:setTopBottom( 0, 0, 6, 54 )
	levelTextBg:setAlpha( 0 )
	levelTextBg:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterside" ) )
	levelTextBg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( levelTextBg )
	self.levelTextBg = levelTextBg
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0.5, 0.5, -34, 5 )
	bg:setTopBottom( 1, 1, -47, -14 )
	bg:setAlpha( 0.25 )
	self:addElement( bg )
	self.bg = bg
	
	local bg0 = LUI.UIImage.new()
	bg0:setLeftRight( 0.5, 0.5, 259, 298 )
	bg0:setTopBottom( 1, 1, -47, -14 )
	bg0:setAlpha( 0.25 )
	self:addElement( bg0 )
	self.bg0 = bg0
	
	local currentLevelBacking = LUI.UITightText.new()
	currentLevelBacking:setLeftRight( 0.5, 0.5, -25, -4 )
	currentLevelBacking:setTopBottom( 1, 1, -45, -15 )
	currentLevelBacking:setText( Engine.Localize( "12" ) )
	currentLevelBacking:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( currentLevelBacking )
	self.currentLevelBacking = currentLevelBacking
	
	local currentLevel = LUI.UIText.new()
	currentLevel:setLeftRight( 0, 0, 251, 343 )
	currentLevel:setTopBottom( 0, 0, 15, 45 )
	currentLevel:setText( Engine.Localize( "12" ) )
	currentLevel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	currentLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	currentLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentLevel )
	self.currentLevel = currentLevel
	
	local rightBox = LUI.UIImage.new()
	rightBox:setLeftRight( 0, 0, 356, 620 )
	rightBox:setTopBottom( 0, 0, 0, 60 )
	rightBox:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterframe" ) )
	rightBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( rightBox )
	self.rightBox = rightBox
	
	local cacWpnLvlMeter0 = CoD.cac_WpnLvlMeter.new( menu, controller )
	cacWpnLvlMeter0:setLeftRight( 0, 0, 315, 569 )
	cacWpnLvlMeter0:setTopBottom( 0, 0, 6, 54 )
	cacWpnLvlMeter0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	cacWpnLvlMeter0.Meter:setShaderVector( 0, 0.65, 0, 0, 0 )
	cacWpnLvlMeter0.Meter2XP:setShaderVector( 0, 0.65, 0, 0, 0 )
	self:addElement( cacWpnLvlMeter0 )
	self.cacWpnLvlMeter0 = cacWpnLvlMeter0
	
	local weaponLevel = LUI.UIText.new()
	weaponLevel:setLeftRight( 0.5, 0.5, -127, -73 )
	weaponLevel:setTopBottom( 1, 1, -45, -15 )
	weaponLevel:setRGB( 0, 0, 0 )
	weaponLevel:setAlpha( 0 )
	weaponLevel:setText( Engine.Localize( "MPUI_MAX_CAPS" ) )
	weaponLevel:setTTF( "fonts/default.ttf" )
	weaponLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponLevel )
	self.weaponLevel = weaponLevel
	
	local levelTextBg0 = LUI.UIImage.new()
	levelTextBg0:setLeftRight( 0, 0, 566, 614 )
	levelTextBg0:setTopBottom( 0, 0, 6, 54 )
	levelTextBg0:setAlpha( 0 )
	levelTextBg0:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterside" ) )
	levelTextBg0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( levelTextBg0 )
	self.levelTextBg0 = levelTextBg0
	
	local nextLevel = LUI.UIText.new()
	nextLevel:setLeftRight( 0, 0, 544, 636 )
	nextLevel:setTopBottom( 0, 0, 15, 45 )
	nextLevel:setText( Engine.Localize( "13" ) )
	nextLevel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nextLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	nextLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( nextLevel )
	self.nextLevel = nextLevel
	
	self.resetProperties = function ()
		levelLabel:completeAnimation()
		levelBoxBg:completeAnimation()
		currentLevelBacking:completeAnimation()
		nextLevel:completeAnimation()
		currentLevel:completeAnimation()
		rightBox:completeAnimation()
		cacWpnLvlMeter0:completeAnimation()
		bg:completeAnimation()
		WeaponMeterBacking:completeAnimation()
		bg0:completeAnimation()
		levelTextBg:completeAnimation()
		weaponLevel:completeAnimation()
		levelLabel:setAlpha( 1 )
		levelBoxBg:setAlpha( 1 )
		currentLevelBacking:setAlpha( 1 )
		nextLevel:setAlpha( 1 )
		currentLevel:setAlpha( 1 )
		rightBox:setAlpha( 1 )
		cacWpnLvlMeter0:setAlpha( 1 )
		bg:setAlpha( 0.25 )
		WeaponMeterBacking:setAlpha( 1 )
		bg0:setAlpha( 0.25 )
		levelTextBg:setLeftRight( 0, 0, 273, 321 )
		levelTextBg:setTopBottom( 0, 0, 6, 54 )
		levelTextBg:setAlpha( 0 )
		weaponLevel:setLeftRight( 0.5, 0.5, -127, -73 )
		weaponLevel:setTopBottom( 1, 1, -45, -15 )
		weaponLevel:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				WeaponMeterBacking:completeAnimation()
				self.WeaponMeterBacking:setAlpha( 0 )
				self.clipFinished( WeaponMeterBacking, {} )
				levelBoxBg:completeAnimation()
				self.levelBoxBg:setAlpha( 0 )
				self.clipFinished( levelBoxBg, {} )
				levelLabel:completeAnimation()
				self.levelLabel:setAlpha( 0 )
				self.clipFinished( levelLabel, {} )
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
				rightBox:completeAnimation()
				self.rightBox:setAlpha( 0 )
				self.clipFinished( rightBox, {} )
				cacWpnLvlMeter0:completeAnimation()
				self.cacWpnLvlMeter0:setAlpha( 0 )
				self.clipFinished( cacWpnLvlMeter0, {} )
				nextLevel:completeAnimation()
				self.nextLevel:setAlpha( 0 )
				self.clipFinished( nextLevel, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
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
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				WeaponMeterBacking:completeAnimation()
				self.WeaponMeterBacking:setAlpha( 0 )
				self.clipFinished( WeaponMeterBacking, {} )
				levelTextBg:completeAnimation()
				self.levelTextBg:setLeftRight( 0, 0, 272, 320 )
				self.levelTextBg:setTopBottom( 0, 0, 6, 54 )
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
				rightBox:completeAnimation()
				self.rightBox:setAlpha( 0 )
				self.clipFinished( rightBox, {} )
				cacWpnLvlMeter0:completeAnimation()
				self.cacWpnLvlMeter0:setAlpha( 0 )
				self.clipFinished( cacWpnLvlMeter0, {} )
				weaponLevel:completeAnimation()
				self.weaponLevel:setLeftRight( 0.5, 0.5, -43, 11 )
				self.weaponLevel:setTopBottom( 1, 1, -45, -15 )
				self.weaponLevel:setAlpha( 1 )
				self.clipFinished( weaponLevel, {} )
				nextLevel:completeAnimation()
				self.nextLevel:setAlpha( 0 )
				self.clipFinished( nextLevel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DisplayLevel",
			condition = function ( menu, element, event )
				return Gunsmith_IsSnapshotGunLevelExists( self, element, controller ) and not Gunsmith_IsSnapshotWeaponLevelMax( self, element, controller )
			end
		},
		{
			stateName = "MaxLevel",
			condition = function ( menu, element, event )
				return Gunsmith_IsSnapshotGunLevelExists( self, element, controller ) and Gunsmith_IsSnapshotWeaponLevelMax( self, element, controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.WeaponMeterBacking:close()
		self.levelBoxBg:close()
		self.levelLabel:close()
		self.cacWpnLvlMeter0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

