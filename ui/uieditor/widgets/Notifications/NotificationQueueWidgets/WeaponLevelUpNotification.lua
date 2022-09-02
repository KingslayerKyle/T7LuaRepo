-- cd000f8fdd8defffdb9d666e79073b97
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.WeaponLevelUp.WeaponLevelUpNotification_FooterLabel02" )
require( "ui.uieditor.widgets.Notifications.WeaponLevelUp.WeaponLevelUpNotification_FooterLabel01" )
require( "ui.uieditor.widgets.Notifications.WeaponLevelUp.WeaponLevelUpNotification_TopBacking" )
require( "ui.uieditor.widgets.Notifications.WeaponLevelUp.WeaponLevelUpNotification_Bottom" )
require( "ui.uieditor.widgets.Notifications.WeaponLevelUp.WeaponLevelUpNotification_LineFade" )

CoD.WeaponLevelUpNotification = InheritFrom( LUI.UIElement )
CoD.WeaponLevelUpNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WeaponLevelUpNotification )
	self.id = "WeaponLevelUpNotification"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 220 )
	self.anyChildUsesUpdateState = true
	
	local levelUpSound = LUI.UIElement.new()
	levelUpSound:setLeftRight( true, false, -48, 0 )
	levelUpSound:setTopBottom( true, false, 0, 48 )
	self:addElement( levelUpSound )
	self.levelUpSound = levelUpSound
	
	local WeaponLevelUpNotificationFooterLabel02 = CoD.WeaponLevelUpNotification_FooterLabel02.new( menu, controller )
	WeaponLevelUpNotificationFooterLabel02:setLeftRight( false, false, -129, 129 )
	WeaponLevelUpNotificationFooterLabel02:setTopBottom( true, false, 167, 199 )
	self:addElement( WeaponLevelUpNotificationFooterLabel02 )
	self.WeaponLevelUpNotificationFooterLabel02 = WeaponLevelUpNotificationFooterLabel02
	
	local WeaponLevelUpNotificationFooterLabel01 = CoD.WeaponLevelUpNotification_FooterLabel01.new( menu, controller )
	WeaponLevelUpNotificationFooterLabel01:setLeftRight( false, false, -64, 64 )
	WeaponLevelUpNotificationFooterLabel01:setTopBottom( true, false, 167, 199 )
	self:addElement( WeaponLevelUpNotificationFooterLabel01 )
	self.WeaponLevelUpNotificationFooterLabel01 = WeaponLevelUpNotificationFooterLabel01
	
	local WeaponLevelUpNotificationTopBacking = CoD.WeaponLevelUpNotification_TopBacking.new( menu, controller )
	WeaponLevelUpNotificationTopBacking:setLeftRight( true, false, 0, 408 )
	WeaponLevelUpNotificationTopBacking:setTopBottom( true, false, 0, 80 )
	self:addElement( WeaponLevelUpNotificationTopBacking )
	self.WeaponLevelUpNotificationTopBacking = WeaponLevelUpNotificationTopBacking
	
	local WeaponLevelUpNotificationBottom = CoD.WeaponLevelUpNotification_Bottom.new( menu, controller )
	WeaponLevelUpNotificationBottom:setLeftRight( true, false, 0, 408 )
	WeaponLevelUpNotificationBottom:setTopBottom( true, false, 7, 167 )
	self:addElement( WeaponLevelUpNotificationBottom )
	self.WeaponLevelUpNotificationBottom = WeaponLevelUpNotificationBottom
	
	local WeaponLevelUpNotificationLineFade = CoD.WeaponLevelUpNotification_LineFade.new( menu, controller )
	WeaponLevelUpNotificationLineFade:setLeftRight( false, false, -200, 200 )
	WeaponLevelUpNotificationLineFade:setTopBottom( true, false, 130, 131 )
	WeaponLevelUpNotificationLineFade:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( WeaponLevelUpNotificationLineFade )
	self.WeaponLevelUpNotificationLineFade = WeaponLevelUpNotificationLineFade
	
	local WeaponG = LUI.UIImage.new()
	WeaponG:setLeftRight( false, false, -121.83, 121.83 )
	WeaponG:setTopBottom( true, false, 34, 136 )
	WeaponG:setRGB( 0, 0.27, 0.01 )
	WeaponG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	WeaponG:setShaderVector( 0, 2, 0, 0, 0 )
	WeaponG:setShaderVector( 1, 1, 0, 0, 0 )
	WeaponG:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( WeaponG )
	self.WeaponG = WeaponG
	
	local WeaponR = LUI.UIImage.new()
	WeaponR:setLeftRight( false, false, -121.83, 121.83 )
	WeaponR:setTopBottom( true, false, 34, 136 )
	WeaponR:setRGB( 0.55, 0.09, 0.09 )
	WeaponR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	WeaponR:setShaderVector( 0, 2, 0, 0, 0 )
	WeaponR:setShaderVector( 1, 1, 0, 0, 0 )
	WeaponR:setShaderVector( 2, 0.02, 0, 0, 0 )
	self:addElement( WeaponR )
	self.WeaponR = WeaponR
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( false, false, -60, 60 )
	highlight:setTopBottom( true, false, 24, 142 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local Weapon = LUI.UIImage.new()
	Weapon:setLeftRight( false, false, -117.58, 117.58 )
	Weapon:setTopBottom( true, false, 34, 136 )
	self:addElement( Weapon )
	self.Weapon = Weapon
	
	self.WeaponLevelUpNotificationFooterLabel02:linkToElementModel( self, "subtitle", true, function ( model )
		local subtitle = Engine.GetModelValue( model )
		if subtitle then
			WeaponLevelUpNotificationFooterLabel02.SubText:setText( Engine.Localize( subtitle ) )
		end
	end )
	self.WeaponLevelUpNotificationFooterLabel01:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			WeaponLevelUpNotificationFooterLabel01.WeaponLevelUpNotificationFooterBacking:setRGB( color )
		end
	end )
	self.WeaponLevelUpNotificationFooterLabel01:linkToElementModel( self, "subtitle", true, function ( model )
		local subtitle = Engine.GetModelValue( model )
		if subtitle then
			WeaponLevelUpNotificationFooterLabel01.SubText:setText( Engine.Localize( subtitle ) )
		end
	end )
	self.WeaponLevelUpNotificationBottom:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			WeaponLevelUpNotificationBottom.WeaponLevelUpNotificationTitle.Text:setText( Engine.Localize( title ) )
		end
	end )
	self.WeaponG:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			WeaponG:setImage( RegisterImage( icon ) )
		end
	end )
	self.WeaponR:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			WeaponR:setImage( RegisterImage( icon ) )
		end
	end )
	self.highlight:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			highlight:setRGB( color )
		end
	end )
	self.Weapon:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			Weapon:setImage( RegisterImage( icon ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				levelUpSound:completeAnimation()
				self.levelUpSound:playSound( "weapon_level_up", controller )
				self.clipFinished( levelUpSound, {} )
				local WeaponLevelUpNotificationFooterLabel02Frame2 = function ( WeaponLevelUpNotificationFooterLabel02, event )
					local WeaponLevelUpNotificationFooterLabel02Frame3 = function ( WeaponLevelUpNotificationFooterLabel02, event )
						if not event.interrupted then
							WeaponLevelUpNotificationFooterLabel02:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Linear )
						end
						WeaponLevelUpNotificationFooterLabel02:setLeftRight( false, false, -129, 129 )
						WeaponLevelUpNotificationFooterLabel02:setTopBottom( true, false, 167, 199 )
						WeaponLevelUpNotificationFooterLabel02:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( WeaponLevelUpNotificationFooterLabel02, event )
						else
							WeaponLevelUpNotificationFooterLabel02:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WeaponLevelUpNotificationFooterLabel02Frame3( WeaponLevelUpNotificationFooterLabel02, event )
						return 
					else
						WeaponLevelUpNotificationFooterLabel02:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						WeaponLevelUpNotificationFooterLabel02:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationFooterLabel02Frame3 )
					end
				end
				
				WeaponLevelUpNotificationFooterLabel02:completeAnimation()
				self.WeaponLevelUpNotificationFooterLabel02:setLeftRight( false, false, -81, 81 )
				self.WeaponLevelUpNotificationFooterLabel02:setTopBottom( true, false, 167, 199 )
				self.WeaponLevelUpNotificationFooterLabel02:setAlpha( 0 )
				WeaponLevelUpNotificationFooterLabel02Frame2( WeaponLevelUpNotificationFooterLabel02, {} )
				local WeaponLevelUpNotificationFooterLabel01Frame2 = function ( WeaponLevelUpNotificationFooterLabel01, event )
					local WeaponLevelUpNotificationFooterLabel01Frame3 = function ( WeaponLevelUpNotificationFooterLabel01, event )
						local WeaponLevelUpNotificationFooterLabel01Frame4 = function ( WeaponLevelUpNotificationFooterLabel01, event )
							local WeaponLevelUpNotificationFooterLabel01Frame5 = function ( WeaponLevelUpNotificationFooterLabel01, event )
								if not event.interrupted then
									WeaponLevelUpNotificationFooterLabel01:beginAnimation( "keyframe", 29, false, true, CoD.TweenType.Bounce )
								end
								WeaponLevelUpNotificationFooterLabel01:setLeftRight( false, false, -64, 64 )
								WeaponLevelUpNotificationFooterLabel01:setTopBottom( true, false, 167, 199 )
								WeaponLevelUpNotificationFooterLabel01:setAlpha( 1 )
								WeaponLevelUpNotificationFooterLabel01:setScale( 1 )
								if event.interrupted then
									self.clipFinished( WeaponLevelUpNotificationFooterLabel01, event )
								else
									WeaponLevelUpNotificationFooterLabel01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								WeaponLevelUpNotificationFooterLabel01Frame5( WeaponLevelUpNotificationFooterLabel01, event )
								return 
							else
								WeaponLevelUpNotificationFooterLabel01:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Bounce )
								WeaponLevelUpNotificationFooterLabel01:setAlpha( 0 )
								WeaponLevelUpNotificationFooterLabel01:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationFooterLabel01Frame5 )
							end
						end
						
						if event.interrupted then
							WeaponLevelUpNotificationFooterLabel01Frame4( WeaponLevelUpNotificationFooterLabel01, event )
							return 
						else
							WeaponLevelUpNotificationFooterLabel01:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Bounce )
							WeaponLevelUpNotificationFooterLabel01:setAlpha( 1 )
							WeaponLevelUpNotificationFooterLabel01:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationFooterLabel01Frame4 )
						end
					end
					
					if event.interrupted then
						WeaponLevelUpNotificationFooterLabel01Frame3( WeaponLevelUpNotificationFooterLabel01, event )
						return 
					else
						WeaponLevelUpNotificationFooterLabel01:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						WeaponLevelUpNotificationFooterLabel01:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationFooterLabel01Frame3 )
					end
				end
				
				WeaponLevelUpNotificationFooterLabel01:completeAnimation()
				self.WeaponLevelUpNotificationFooterLabel01:setLeftRight( false, false, -64, 64 )
				self.WeaponLevelUpNotificationFooterLabel01:setTopBottom( true, false, 167, 199 )
				self.WeaponLevelUpNotificationFooterLabel01:setAlpha( 0 )
				self.WeaponLevelUpNotificationFooterLabel01:setScale( 1 )
				WeaponLevelUpNotificationFooterLabel01Frame2( WeaponLevelUpNotificationFooterLabel01, {} )
				local WeaponLevelUpNotificationTopBackingFrame2 = function ( WeaponLevelUpNotificationTopBacking, event )
					local WeaponLevelUpNotificationTopBackingFrame3 = function ( WeaponLevelUpNotificationTopBacking, event )
						local WeaponLevelUpNotificationTopBackingFrame4 = function ( WeaponLevelUpNotificationTopBacking, event )
							if not event.interrupted then
								WeaponLevelUpNotificationTopBacking:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							end
							WeaponLevelUpNotificationTopBacking:setLeftRight( true, false, 0, 408 )
							WeaponLevelUpNotificationTopBacking:setTopBottom( true, false, 0, 80 )
							WeaponLevelUpNotificationTopBacking:setAlpha( 1 )
							WeaponLevelUpNotificationTopBacking:setScale( 1 )
							if event.interrupted then
								self.clipFinished( WeaponLevelUpNotificationTopBacking, event )
							else
								WeaponLevelUpNotificationTopBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							WeaponLevelUpNotificationTopBackingFrame4( WeaponLevelUpNotificationTopBacking, event )
							return 
						else
							WeaponLevelUpNotificationTopBacking:beginAnimation( "keyframe", 129, false, true, CoD.TweenType.Linear )
							WeaponLevelUpNotificationTopBacking:setTopBottom( true, false, 5, 85 )
							WeaponLevelUpNotificationTopBacking:setScale( 0.8 )
							WeaponLevelUpNotificationTopBacking:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationTopBackingFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponLevelUpNotificationTopBackingFrame3( WeaponLevelUpNotificationTopBacking, event )
						return 
					else
						WeaponLevelUpNotificationTopBacking:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						WeaponLevelUpNotificationTopBacking:setTopBottom( true, false, -41.04, 38.96 )
						WeaponLevelUpNotificationTopBacking:setAlpha( 1 )
						WeaponLevelUpNotificationTopBacking:setScale( 1.45 )
						WeaponLevelUpNotificationTopBacking:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationTopBackingFrame3 )
					end
				end
				
				WeaponLevelUpNotificationTopBacking:completeAnimation()
				self.WeaponLevelUpNotificationTopBacking:setLeftRight( true, false, 0, 408 )
				self.WeaponLevelUpNotificationTopBacking:setTopBottom( true, false, -80, 0 )
				self.WeaponLevelUpNotificationTopBacking:setAlpha( 0 )
				self.WeaponLevelUpNotificationTopBacking:setScale( 2 )
				WeaponLevelUpNotificationTopBackingFrame2( WeaponLevelUpNotificationTopBacking, {} )
				local WeaponLevelUpNotificationBottomFrame2 = function ( WeaponLevelUpNotificationBottom, event )
					local WeaponLevelUpNotificationBottomFrame3 = function ( WeaponLevelUpNotificationBottom, event )
						local WeaponLevelUpNotificationBottomFrame4 = function ( WeaponLevelUpNotificationBottom, event )
							if not event.interrupted then
								WeaponLevelUpNotificationBottom:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
							end
							WeaponLevelUpNotificationBottom:setLeftRight( true, false, 0, 408 )
							WeaponLevelUpNotificationBottom:setTopBottom( true, false, 7, 167 )
							WeaponLevelUpNotificationBottom:setAlpha( 1 )
							WeaponLevelUpNotificationBottom:setScale( 1 )
							if event.interrupted then
								self.clipFinished( WeaponLevelUpNotificationBottom, event )
							else
								WeaponLevelUpNotificationBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							WeaponLevelUpNotificationBottomFrame4( WeaponLevelUpNotificationBottom, event )
							return 
						else
							WeaponLevelUpNotificationBottom:beginAnimation( "keyframe", 129, false, true, CoD.TweenType.Linear )
							WeaponLevelUpNotificationBottom:setTopBottom( true, false, 7, 167 )
							WeaponLevelUpNotificationBottom:setScale( 0.8 )
							WeaponLevelUpNotificationBottom:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationBottomFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponLevelUpNotificationBottomFrame3( WeaponLevelUpNotificationBottom, event )
						return 
					else
						WeaponLevelUpNotificationBottom:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						WeaponLevelUpNotificationBottom:setTopBottom( true, false, 35.71, 195.71 )
						WeaponLevelUpNotificationBottom:setAlpha( 1 )
						WeaponLevelUpNotificationBottom:setScale( 1.45 )
						WeaponLevelUpNotificationBottom:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationBottomFrame3 )
					end
				end
				
				WeaponLevelUpNotificationBottom:completeAnimation()
				self.WeaponLevelUpNotificationBottom:setLeftRight( true, false, 0, 408 )
				self.WeaponLevelUpNotificationBottom:setTopBottom( true, false, 60, 220 )
				self.WeaponLevelUpNotificationBottom:setAlpha( 0 )
				self.WeaponLevelUpNotificationBottom:setScale( 2 )
				WeaponLevelUpNotificationBottomFrame2( WeaponLevelUpNotificationBottom, {} )
				local WeaponLevelUpNotificationLineFadeFrame2 = function ( WeaponLevelUpNotificationLineFade, event )
					local WeaponLevelUpNotificationLineFadeFrame3 = function ( WeaponLevelUpNotificationLineFade, event )
						local WeaponLevelUpNotificationLineFadeFrame4 = function ( WeaponLevelUpNotificationLineFade, event )
							if not event.interrupted then
								WeaponLevelUpNotificationLineFade:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Linear )
							end
							WeaponLevelUpNotificationLineFade:setLeftRight( false, false, -200, 200 )
							WeaponLevelUpNotificationLineFade:setTopBottom( true, false, 130, 131 )
							WeaponLevelUpNotificationLineFade:setAlpha( 1 )
							WeaponLevelUpNotificationLineFade:setScale( 1 )
							if event.interrupted then
								self.clipFinished( WeaponLevelUpNotificationLineFade, event )
							else
								WeaponLevelUpNotificationLineFade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							WeaponLevelUpNotificationLineFadeFrame4( WeaponLevelUpNotificationLineFade, event )
							return 
						else
							WeaponLevelUpNotificationLineFade:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Linear )
							WeaponLevelUpNotificationLineFade:setTopBottom( true, false, 125.51, 126.51 )
							WeaponLevelUpNotificationLineFade:setAlpha( 0.75 )
							WeaponLevelUpNotificationLineFade:setScale( 1.5 )
							WeaponLevelUpNotificationLineFade:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationLineFadeFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponLevelUpNotificationLineFadeFrame3( WeaponLevelUpNotificationLineFade, event )
						return 
					else
						WeaponLevelUpNotificationLineFade:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
						WeaponLevelUpNotificationLineFade:setTopBottom( true, false, 142, 143 )
						WeaponLevelUpNotificationLineFade:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationLineFadeFrame3 )
					end
				end
				
				WeaponLevelUpNotificationLineFade:completeAnimation()
				self.WeaponLevelUpNotificationLineFade:setLeftRight( false, false, -200, 200 )
				self.WeaponLevelUpNotificationLineFade:setTopBottom( true, false, 167, 168 )
				self.WeaponLevelUpNotificationLineFade:setAlpha( 0 )
				self.WeaponLevelUpNotificationLineFade:setScale( 3 )
				WeaponLevelUpNotificationLineFadeFrame2( WeaponLevelUpNotificationLineFade, {} )
				local WeaponGFrame2 = function ( WeaponG, event )
					local WeaponGFrame3 = function ( WeaponG, event )
						local WeaponGFrame4 = function ( WeaponG, event )
							local WeaponGFrame5 = function ( WeaponG, event )
								local WeaponGFrame6 = function ( WeaponG, event )
									if not event.interrupted then
										WeaponG:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
									end
									WeaponG:setLeftRight( false, false, -121.83, 121.83 )
									WeaponG:setTopBottom( true, false, 34, 136 )
									WeaponG:setAlpha( 0 )
									WeaponG:setScale( 1 )
									if event.interrupted then
										self.clipFinished( WeaponG, event )
									else
										WeaponG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									WeaponGFrame6( WeaponG, event )
									return 
								else
									WeaponG:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
									WeaponG:setScale( 0.8 )
									WeaponG:registerEventHandler( "transition_complete_keyframe", WeaponGFrame6 )
								end
							end
							
							if event.interrupted then
								WeaponGFrame5( WeaponG, event )
								return 
							else
								WeaponG:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
								WeaponG:setLeftRight( false, false, -121.83, 121.83 )
								WeaponG:setScale( 1 )
								WeaponG:registerEventHandler( "transition_complete_keyframe", WeaponGFrame5 )
							end
						end
						
						if event.interrupted then
							WeaponGFrame4( WeaponG, event )
							return 
						else
							WeaponG:beginAnimation( "keyframe", 79, false, true, CoD.TweenType.Linear )
							WeaponG:setLeftRight( false, false, -31.83, 211.83 )
							WeaponG:setAlpha( 1 )
							WeaponG:setScale( 2.06 )
							WeaponG:registerEventHandler( "transition_complete_keyframe", WeaponGFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponGFrame3( WeaponG, event )
						return 
					else
						WeaponG:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						WeaponG:setLeftRight( false, false, 48.17, 291.83 )
						WeaponG:registerEventHandler( "transition_complete_keyframe", WeaponGFrame3 )
					end
				end
				
				WeaponG:completeAnimation()
				self.WeaponG:setLeftRight( false, false, 18.17, 261.83 )
				self.WeaponG:setTopBottom( true, false, 34, 136 )
				self.WeaponG:setAlpha( 0 )
				self.WeaponG:setScale( 3 )
				WeaponGFrame2( WeaponG, {} )
				local WeaponRFrame2 = function ( WeaponR, event )
					local WeaponRFrame3 = function ( WeaponR, event )
						local WeaponRFrame4 = function ( WeaponR, event )
							local WeaponRFrame5 = function ( WeaponR, event )
								local WeaponRFrame6 = function ( WeaponR, event )
									if not event.interrupted then
										WeaponR:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
									end
									WeaponR:setLeftRight( false, false, -121.83, 121.83 )
									WeaponR:setTopBottom( true, false, 34, 136 )
									WeaponR:setAlpha( 0 )
									WeaponR:setScale( 1 )
									if event.interrupted then
										self.clipFinished( WeaponR, event )
									else
										WeaponR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									WeaponRFrame6( WeaponR, event )
									return 
								else
									WeaponR:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
									WeaponR:setAlpha( 0 )
									WeaponR:setScale( 0.8 )
									WeaponR:registerEventHandler( "transition_complete_keyframe", WeaponRFrame6 )
								end
							end
							
							if event.interrupted then
								WeaponRFrame5( WeaponR, event )
								return 
							else
								WeaponR:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
								WeaponR:setLeftRight( false, false, -121.83, 121.83 )
								WeaponR:setAlpha( 0.22 )
								WeaponR:setScale( 1 )
								WeaponR:registerEventHandler( "transition_complete_keyframe", WeaponRFrame5 )
							end
						end
						
						if event.interrupted then
							WeaponRFrame4( WeaponR, event )
							return 
						else
							WeaponR:beginAnimation( "keyframe", 79, false, true, CoD.TweenType.Linear )
							WeaponR:setLeftRight( false, false, -212.89, 30.77 )
							WeaponR:setAlpha( 1 )
							WeaponR:setScale( 2.06 )
							WeaponR:registerEventHandler( "transition_complete_keyframe", WeaponRFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponRFrame3( WeaponR, event )
						return 
					else
						WeaponR:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						WeaponR:setLeftRight( false, false, -293.83, -50.17 )
						WeaponR:registerEventHandler( "transition_complete_keyframe", WeaponRFrame3 )
					end
				end
				
				WeaponR:completeAnimation()
				self.WeaponR:setLeftRight( false, false, -263.83, -20.17 )
				self.WeaponR:setTopBottom( true, false, 34, 136 )
				self.WeaponR:setAlpha( 0 )
				self.WeaponR:setScale( 3 )
				WeaponRFrame2( WeaponR, {} )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						local highlightFrame4 = function ( highlight, event )
							local highlightFrame5 = function ( highlight, event )
								local highlightFrame6 = function ( highlight, event )
									if not event.interrupted then
										highlight:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Linear )
									end
									highlight:setLeftRight( false, false, -149, 149 )
									highlight:setTopBottom( true, false, 24, 142 )
									highlight:setAlpha( 0.2 )
									highlight:setZRot( 360 )
									highlight:setScale( 1.5 )
									if event.interrupted then
										self.clipFinished( highlight, event )
									else
										highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									highlightFrame6( highlight, event )
									return 
								else
									highlight:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
									highlight:setAlpha( 1 )
									highlight:setZRot( 325.62 )
									highlight:setScale( 1 )
									highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame6 )
								end
							end
							
							if event.interrupted then
								highlightFrame5( highlight, event )
								return 
							else
								highlight:beginAnimation( "keyframe", 50, false, true, CoD.TweenType.Linear )
								highlight:setAlpha( 0.78 )
								highlight:setZRot( 208.16 )
								highlight:setScale( 3 )
								highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame5 )
							end
						end
						
						if event.interrupted then
							highlightFrame4( highlight, event )
							return 
						else
							highlight:beginAnimation( "keyframe", 60, false, true, CoD.TweenType.Linear )
							highlight:setAlpha( 0.38 )
							highlight:setZRot( 108 )
							highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame4 )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setLeftRight( false, false, -60, 60 )
				self.highlight:setTopBottom( true, false, 24, 142 )
				self.highlight:setAlpha( 0 )
				self.highlight:setZRot( 0 )
				self.highlight:setScale( 1 )
				highlightFrame2( highlight, {} )
				local WeaponFrame2 = function ( Weapon, event )
					local WeaponFrame3 = function ( Weapon, event )
						local WeaponFrame4 = function ( Weapon, event )
							local WeaponFrame5 = function ( Weapon, event )
								if not event.interrupted then
									Weapon:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
								end
								Weapon:setLeftRight( false, false, -121.83, 121.83 )
								Weapon:setTopBottom( true, false, 34, 136 )
								Weapon:setAlpha( 1 )
								Weapon:setScale( 1 )
								if event.interrupted then
									self.clipFinished( Weapon, event )
								else
									Weapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								WeaponFrame5( Weapon, event )
								return 
							else
								Weapon:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
								Weapon:setAlpha( 1 )
								Weapon:setScale( 1.8 )
								Weapon:registerEventHandler( "transition_complete_keyframe", WeaponFrame5 )
							end
						end
						
						if event.interrupted then
							WeaponFrame4( Weapon, event )
							return 
						else
							Weapon:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Linear )
							Weapon:setAlpha( 0.5 )
							Weapon:setScale( 1.41 )
							Weapon:registerEventHandler( "transition_complete_keyframe", WeaponFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponFrame3( Weapon, event )
						return 
					else
						Weapon:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						Weapon:setScale( 0.8 )
						Weapon:registerEventHandler( "transition_complete_keyframe", WeaponFrame3 )
					end
				end
				
				Weapon:completeAnimation()
				self.Weapon:setLeftRight( false, false, -121.83, 121.83 )
				self.Weapon:setTopBottom( true, false, 34, 136 )
				self.Weapon:setAlpha( 0 )
				self.Weapon:setScale( 0.1 )
				WeaponFrame2( Weapon, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 9 )

				local WeaponLevelUpNotificationFooterLabel02Frame2 = function ( WeaponLevelUpNotificationFooterLabel02, event )
					local WeaponLevelUpNotificationFooterLabel02Frame3 = function ( WeaponLevelUpNotificationFooterLabel02, event )
						local WeaponLevelUpNotificationFooterLabel02Frame4 = function ( WeaponLevelUpNotificationFooterLabel02, event )
							local WeaponLevelUpNotificationFooterLabel02Frame5 = function ( WeaponLevelUpNotificationFooterLabel02, event )
								if not event.interrupted then
									WeaponLevelUpNotificationFooterLabel02:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								end
								WeaponLevelUpNotificationFooterLabel02:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( WeaponLevelUpNotificationFooterLabel02, event )
								else
									WeaponLevelUpNotificationFooterLabel02:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								WeaponLevelUpNotificationFooterLabel02Frame5( WeaponLevelUpNotificationFooterLabel02, event )
								return 
							else
								WeaponLevelUpNotificationFooterLabel02:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								WeaponLevelUpNotificationFooterLabel02:setAlpha( 1 )
								WeaponLevelUpNotificationFooterLabel02:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationFooterLabel02Frame5 )
							end
						end
						
						if event.interrupted then
							WeaponLevelUpNotificationFooterLabel02Frame4( WeaponLevelUpNotificationFooterLabel02, event )
							return 
						else
							WeaponLevelUpNotificationFooterLabel02:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							WeaponLevelUpNotificationFooterLabel02:setAlpha( 0 )
							WeaponLevelUpNotificationFooterLabel02:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationFooterLabel02Frame4 )
						end
					end
					
					if event.interrupted then
						WeaponLevelUpNotificationFooterLabel02Frame3( WeaponLevelUpNotificationFooterLabel02, event )
						return 
					else
						WeaponLevelUpNotificationFooterLabel02:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						WeaponLevelUpNotificationFooterLabel02:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationFooterLabel02Frame3 )
					end
				end
				
				WeaponLevelUpNotificationFooterLabel02:completeAnimation()
				self.WeaponLevelUpNotificationFooterLabel02:setAlpha( 1 )
				WeaponLevelUpNotificationFooterLabel02Frame2( WeaponLevelUpNotificationFooterLabel02, {} )
				local WeaponLevelUpNotificationFooterLabel01Frame2 = function ( WeaponLevelUpNotificationFooterLabel01, event )
					local WeaponLevelUpNotificationFooterLabel01Frame3 = function ( WeaponLevelUpNotificationFooterLabel01, event )
						local WeaponLevelUpNotificationFooterLabel01Frame4 = function ( WeaponLevelUpNotificationFooterLabel01, event )
							local WeaponLevelUpNotificationFooterLabel01Frame5 = function ( WeaponLevelUpNotificationFooterLabel01, event )
								if not event.interrupted then
									WeaponLevelUpNotificationFooterLabel01:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								end
								WeaponLevelUpNotificationFooterLabel01:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( WeaponLevelUpNotificationFooterLabel01, event )
								else
									WeaponLevelUpNotificationFooterLabel01:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								WeaponLevelUpNotificationFooterLabel01Frame5( WeaponLevelUpNotificationFooterLabel01, event )
								return 
							else
								WeaponLevelUpNotificationFooterLabel01:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								WeaponLevelUpNotificationFooterLabel01:setAlpha( 1 )
								WeaponLevelUpNotificationFooterLabel01:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationFooterLabel01Frame5 )
							end
						end
						
						if event.interrupted then
							WeaponLevelUpNotificationFooterLabel01Frame4( WeaponLevelUpNotificationFooterLabel01, event )
							return 
						else
							WeaponLevelUpNotificationFooterLabel01:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							WeaponLevelUpNotificationFooterLabel01:setAlpha( 0 )
							WeaponLevelUpNotificationFooterLabel01:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationFooterLabel01Frame4 )
						end
					end
					
					if event.interrupted then
						WeaponLevelUpNotificationFooterLabel01Frame3( WeaponLevelUpNotificationFooterLabel01, event )
						return 
					else
						WeaponLevelUpNotificationFooterLabel01:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						WeaponLevelUpNotificationFooterLabel01:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationFooterLabel01Frame3 )
					end
				end
				
				WeaponLevelUpNotificationFooterLabel01:completeAnimation()
				self.WeaponLevelUpNotificationFooterLabel01:setAlpha( 1 )
				WeaponLevelUpNotificationFooterLabel01Frame2( WeaponLevelUpNotificationFooterLabel01, {} )
				local WeaponLevelUpNotificationTopBackingFrame2 = function ( WeaponLevelUpNotificationTopBacking, event )
					local WeaponLevelUpNotificationTopBackingFrame3 = function ( WeaponLevelUpNotificationTopBacking, event )
						local WeaponLevelUpNotificationTopBackingFrame4 = function ( WeaponLevelUpNotificationTopBacking, event )
							local WeaponLevelUpNotificationTopBackingFrame5 = function ( WeaponLevelUpNotificationTopBacking, event )
								if not event.interrupted then
									WeaponLevelUpNotificationTopBacking:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								end
								WeaponLevelUpNotificationTopBacking:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( WeaponLevelUpNotificationTopBacking, event )
								else
									WeaponLevelUpNotificationTopBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								WeaponLevelUpNotificationTopBackingFrame5( WeaponLevelUpNotificationTopBacking, event )
								return 
							else
								WeaponLevelUpNotificationTopBacking:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								WeaponLevelUpNotificationTopBacking:setAlpha( 1 )
								WeaponLevelUpNotificationTopBacking:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationTopBackingFrame5 )
							end
						end
						
						if event.interrupted then
							WeaponLevelUpNotificationTopBackingFrame4( WeaponLevelUpNotificationTopBacking, event )
							return 
						else
							WeaponLevelUpNotificationTopBacking:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							WeaponLevelUpNotificationTopBacking:setAlpha( 0 )
							WeaponLevelUpNotificationTopBacking:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationTopBackingFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponLevelUpNotificationTopBackingFrame3( WeaponLevelUpNotificationTopBacking, event )
						return 
					else
						WeaponLevelUpNotificationTopBacking:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						WeaponLevelUpNotificationTopBacking:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationTopBackingFrame3 )
					end
				end
				
				WeaponLevelUpNotificationTopBacking:completeAnimation()
				self.WeaponLevelUpNotificationTopBacking:setAlpha( 1 )
				WeaponLevelUpNotificationTopBackingFrame2( WeaponLevelUpNotificationTopBacking, {} )
				local WeaponLevelUpNotificationBottomFrame2 = function ( WeaponLevelUpNotificationBottom, event )
					local WeaponLevelUpNotificationBottomFrame3 = function ( WeaponLevelUpNotificationBottom, event )
						local WeaponLevelUpNotificationBottomFrame4 = function ( WeaponLevelUpNotificationBottom, event )
							local WeaponLevelUpNotificationBottomFrame5 = function ( WeaponLevelUpNotificationBottom, event )
								if not event.interrupted then
									WeaponLevelUpNotificationBottom:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								end
								WeaponLevelUpNotificationBottom:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( WeaponLevelUpNotificationBottom, event )
								else
									WeaponLevelUpNotificationBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								WeaponLevelUpNotificationBottomFrame5( WeaponLevelUpNotificationBottom, event )
								return 
							else
								WeaponLevelUpNotificationBottom:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								WeaponLevelUpNotificationBottom:setAlpha( 1 )
								WeaponLevelUpNotificationBottom:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationBottomFrame5 )
							end
						end
						
						if event.interrupted then
							WeaponLevelUpNotificationBottomFrame4( WeaponLevelUpNotificationBottom, event )
							return 
						else
							WeaponLevelUpNotificationBottom:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							WeaponLevelUpNotificationBottom:setAlpha( 0 )
							WeaponLevelUpNotificationBottom:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationBottomFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponLevelUpNotificationBottomFrame3( WeaponLevelUpNotificationBottom, event )
						return 
					else
						WeaponLevelUpNotificationBottom:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						WeaponLevelUpNotificationBottom:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationBottomFrame3 )
					end
				end
				
				WeaponLevelUpNotificationBottom:completeAnimation()
				self.WeaponLevelUpNotificationBottom:setAlpha( 1 )
				WeaponLevelUpNotificationBottomFrame2( WeaponLevelUpNotificationBottom, {} )
				local WeaponLevelUpNotificationLineFadeFrame2 = function ( WeaponLevelUpNotificationLineFade, event )
					local WeaponLevelUpNotificationLineFadeFrame3 = function ( WeaponLevelUpNotificationLineFade, event )
						local WeaponLevelUpNotificationLineFadeFrame4 = function ( WeaponLevelUpNotificationLineFade, event )
							local WeaponLevelUpNotificationLineFadeFrame5 = function ( WeaponLevelUpNotificationLineFade, event )
								if not event.interrupted then
									WeaponLevelUpNotificationLineFade:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
								end
								WeaponLevelUpNotificationLineFade:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( WeaponLevelUpNotificationLineFade, event )
								else
									WeaponLevelUpNotificationLineFade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								WeaponLevelUpNotificationLineFadeFrame5( WeaponLevelUpNotificationLineFade, event )
								return 
							else
								WeaponLevelUpNotificationLineFade:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
								WeaponLevelUpNotificationLineFade:setAlpha( 1 )
								WeaponLevelUpNotificationLineFade:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationLineFadeFrame5 )
							end
						end
						
						if event.interrupted then
							WeaponLevelUpNotificationLineFadeFrame4( WeaponLevelUpNotificationLineFade, event )
							return 
						else
							WeaponLevelUpNotificationLineFade:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Bounce )
							WeaponLevelUpNotificationLineFade:setAlpha( 0 )
							WeaponLevelUpNotificationLineFade:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationLineFadeFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponLevelUpNotificationLineFadeFrame3( WeaponLevelUpNotificationLineFade, event )
						return 
					else
						WeaponLevelUpNotificationLineFade:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						WeaponLevelUpNotificationLineFade:registerEventHandler( "transition_complete_keyframe", WeaponLevelUpNotificationLineFadeFrame3 )
					end
				end
				
				WeaponLevelUpNotificationLineFade:completeAnimation()
				self.WeaponLevelUpNotificationLineFade:setAlpha( 1 )
				WeaponLevelUpNotificationLineFadeFrame2( WeaponLevelUpNotificationLineFade, {} )

				WeaponG:completeAnimation()
				self.WeaponG:setAlpha( 0 )
				self.clipFinished( WeaponG, {} )

				WeaponR:completeAnimation()
				self.WeaponR:setAlpha( 0 )
				self.clipFinished( WeaponR, {} )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						local highlightFrame4 = function ( highlight, event )
							if not event.interrupted then
								highlight:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							end
							highlight:setLeftRight( false, false, -149, 149 )
							highlight:setTopBottom( true, false, 24, 142 )
							highlight:setAlpha( 0 )
							highlight:setScale( 1.5 )
							if event.interrupted then
								self.clipFinished( highlight, event )
							else
								highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							highlightFrame4( highlight, event )
							return 
						else
							highlight:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							highlight:setAlpha( 1 )
							highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame4 )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						highlight:setAlpha( 0 )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setLeftRight( false, false, -149, 149 )
				self.highlight:setTopBottom( true, false, 24, 142 )
				self.highlight:setAlpha( 0.2 )
				self.highlight:setScale( 1.5 )
				highlightFrame2( highlight, {} )
				local WeaponFrame2 = function ( Weapon, event )
					local WeaponFrame3 = function ( Weapon, event )
						local WeaponFrame4 = function ( Weapon, event )
							if not event.interrupted then
								Weapon:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							end
							Weapon:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Weapon, event )
							else
								Weapon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							WeaponFrame4( Weapon, event )
							return 
						else
							Weapon:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
							Weapon:setAlpha( 1 )
							Weapon:registerEventHandler( "transition_complete_keyframe", WeaponFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponFrame3( Weapon, event )
						return 
					else
						Weapon:beginAnimation( "keyframe", 39, false, true, CoD.TweenType.Bounce )
						Weapon:setAlpha( 0 )
						Weapon:registerEventHandler( "transition_complete_keyframe", WeaponFrame3 )
					end
				end
				
				Weapon:completeAnimation()
				self.Weapon:setAlpha( 1 )
				WeaponFrame2( Weapon, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponLevelUpNotificationFooterLabel02:close()
		element.WeaponLevelUpNotificationFooterLabel01:close()
		element.WeaponLevelUpNotificationTopBacking:close()
		element.WeaponLevelUpNotificationBottom:close()
		element.WeaponLevelUpNotificationLineFade:close()
		element.WeaponG:close()
		element.WeaponR:close()
		element.highlight:close()
		element.Weapon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

