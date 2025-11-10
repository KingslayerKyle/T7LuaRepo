require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityFill" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityForeStroke" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityIcon" )

CoD.AmmoWidget_HeroAbilityIconContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityIconContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityIconContainer )
	self.id = "AmmoWidget_HeroAbilityIconContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local Fill = CoD.AmmoWidget_AbilityFill.new( menu, controller )
	Fill:setLeftRight( true, true, 0.33, -1 )
	Fill:setTopBottom( true, true, 0, 0.33 )
	Fill:setRGB( 0.4, 0.31, 0 )
	Fill:setAlpha( 0.4 )
	Fill:setZoom( 5 )
	Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Fill:setShaderVector( 0, 0.2, 0, 0, 0 )
	Fill:setShaderVector( 1, 0, 0, 0, 0 )
	Fill:setShaderVector( 2, 0, 0, 0, 0 )
	Fill:setShaderVector( 3, 0, 0, 0, 0 )
	Fill:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local ForeStroke = CoD.AmmoWidget_AbilityForeStroke.new( menu, controller )
	ForeStroke:setLeftRight( true, true, 3.01, -3.68 )
	ForeStroke:setTopBottom( true, true, 4, -3.67 )
	ForeStroke:setZoom( -8 )
	self:addElement( ForeStroke )
	self.ForeStroke = ForeStroke
	
	local AbilityIconGold = CoD.AmmoWidget_HeroAbilityIcon.new( menu, controller )
	AbilityIconGold:setLeftRight( false, false, -31.17, 31.5 )
	AbilityIconGold:setTopBottom( false, false, -30.5, 32.17 )
	AbilityIconGold:setRGB( 1, 0.77, 0 )
	AbilityIconGold:setAlpha( 0.3 )
	AbilityIconGold:setZoom( -18 )
	self:addElement( AbilityIconGold )
	self.AbilityIconGold = AbilityIconGold
	
	local AbilityIconSolid = CoD.AmmoWidget_HeroAbilityIcon.new( menu, controller )
	AbilityIconSolid:setLeftRight( false, false, -31.17, 31.5 )
	AbilityIconSolid:setTopBottom( false, false, -30.5, 32.17 )
	AbilityIconSolid:setRGB( 0, 0, 0 )
	AbilityIconSolid:setAlpha( 0.1 )
	AbilityIconSolid:setZoom( 14.5 )
	AbilityIconSolid:setScale( 1.1 )
	self:addElement( AbilityIconSolid )
	self.AbilityIconSolid = AbilityIconSolid
	
	local AbilityIcon = CoD.AmmoWidget_HeroAbilityIcon.new( menu, controller )
	AbilityIcon:setLeftRight( false, false, -31.17, 31.5 )
	AbilityIcon:setTopBottom( false, false, -30.5, 32.17 )
	AbilityIcon:setZoom( 15 )
	AbilityIcon:setScale( 1.2 )
	AbilityIcon:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	AbilityIcon:setShaderVector( 0, 0.05, 0.5, 0, 0 )
	AbilityIcon:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityIcon:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityIcon:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityIcon:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( AbilityIcon )
	self.AbilityIcon = AbilityIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.clipFinished( Fill, {} )
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 0 )
				self.clipFinished( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.clipFinished( AbilityIconGold, {} )
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0 )
				self.clipFinished( AbilityIconSolid, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0 )
				self.clipFinished( AbilityIcon, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Fill:setRGB( 1, 0.77, 0 )
					Fill:setAlpha( 0.3 )
					Fill:setZoom( 5 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 0, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 0.77, 0 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( 5 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -8 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0 )
				self.ForeStroke:setZoom( -8 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconGold:setAlpha( 0.3 )
					AbilityIconGold:setZoom( -18 )
					if event.interrupted then
						self.clipFinished( AbilityIconGold, event )
					else
						AbilityIconGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.AbilityIconGold:setZoom( 0 )
				AbilityIconGoldFrame2( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconSolid:setRGB( 0, 0, 0 )
					AbilityIconSolid:setAlpha( 0.1 )
					AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setRGB( 0, 0, 0 )
				self.AbilityIconSolid:setAlpha( 0 )
				self.AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0 )
				self.AbilityIcon:setZoom( 15 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Fill:setRGB( 1, 1, 1 )
					Fill:setAlpha( 0 )
					Fill:setZoom( -10 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0 )
				self.ForeStroke:setZoom( -5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.AbilityIconGold:setZoom( 0 )
				self.clipFinished( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconSolid:setAlpha( 0.05 )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0 )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0 )
				self.AbilityIcon:setZoom( 5 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Fill:setRGB( 1, 1, 1 )
					Fill:setAlpha( 0 )
					Fill:setZoom( -8 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -8 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( 5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0 )
				self.ForeStroke:setZoom( 5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconGold:setAlpha( 0.1 )
					AbilityIconGold:setZoom( -49 )
					if event.interrupted then
						self.clipFinished( AbilityIconGold, event )
					else
						AbilityIconGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.AbilityIconGold:setZoom( 0 )
				AbilityIconGoldFrame2( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconSolid:setAlpha( 0.1 )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0 )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0 )
				self.AbilityIcon:setZoom( 10 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 0.77, 0 )
				self.Fill:setAlpha( 0.3 )
				self.Fill:setZoom( 5 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fill, {} )
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setRGB( 1, 0.77, 0 )
				self.AbilityIconGold:setAlpha( 0.3 )
				self.AbilityIconGold:setZoom( -18 )
				self.AbilityIconGold:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( AbilityIconGold, {} )
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setRGB( 0, 0, 0 )
				self.AbilityIconSolid:setAlpha( 0.1 )
				self.AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( AbilityIconSolid, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 15 )
				self.clipFinished( AbilityIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Fill:setRGB( 1, 0.77, 0 )
					Fill:setAlpha( 0 )
					Fill:setZoom( 5 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 0, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 0.77, 0 )
				self.Fill:setAlpha( 0.3 )
				self.Fill:setZoom( 5 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 0 )
					ForeStroke:setZoom( -8 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					AbilityIconGold:setAlpha( 0 )
					AbilityIconGold:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( AbilityIconGold, event )
					else
						AbilityIconGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0.3 )
				self.AbilityIconGold:setZoom( -18 )
				AbilityIconGoldFrame2( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIconSolid:setRGB( 0, 0, 0 )
					AbilityIconSolid:setAlpha( 0 )
					AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setRGB( 0, 0, 0 )
				self.AbilityIconSolid:setAlpha( 0.1 )
				self.AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0 )
					AbilityIcon:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 15 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Fill:setRGB( 1, 1, 1 )
					Fill:setAlpha( 0 )
					Fill:setZoom( -10 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 0.77, 0 )
				self.Fill:setAlpha( 0.3 )
				self.Fill:setZoom( 5 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 0.4 )
					ForeStroke:setZoom( -5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0.6 )
				self.ForeStroke:setZoom( -8 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					AbilityIconGold:setAlpha( 0 )
					AbilityIconGold:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( AbilityIconGold, event )
					else
						AbilityIconGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0.3 )
				self.AbilityIconGold:setZoom( -18 )
				AbilityIconGoldFrame2( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIconSolid:setRGB( 0, 0, 0 )
					AbilityIconSolid:setAlpha( 0.05 )
					AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setRGB( 0, 0, 0 )
				self.AbilityIconSolid:setAlpha( 0.1 )
				self.AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.9 )
					AbilityIcon:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 15 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Fill:setRGB( 1, 1, 1 )
					Fill:setAlpha( 0 )
					Fill:setZoom( -8 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 0.77, 0 )
				self.Fill:setAlpha( 0.3 )
				self.Fill:setZoom( 5 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 0.5 )
					ForeStroke:setZoom( 5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconGold:setAlpha( 0.1 )
					AbilityIconGold:setZoom( -49 )
					if event.interrupted then
						self.clipFinished( AbilityIconGold, event )
					else
						AbilityIconGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0.3 )
				self.AbilityIconGold:setZoom( -18 )
				AbilityIconGoldFrame2( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIconSolid:setRGB( 0, 0, 0 )
					AbilityIconSolid:setAlpha( 0.1 )
					AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setRGB( 0, 0, 0 )
				self.AbilityIconSolid:setAlpha( 0.1 )
				self.AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.9 )
					AbilityIcon:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 15 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fill, {} )
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0.5 )
				self.ForeStroke:setZoom( -5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.AbilityIconGold:setZoom( 0 )
				self.clipFinished( AbilityIconGold, {} )
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0.05 )
				self.clipFinished( AbilityIconSolid, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.9 )
				self.AbilityIcon:setZoom( 5 )
				self.clipFinished( AbilityIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Fill:setRGB( 1, 1, 1 )
					Fill:setAlpha( 0 )
					Fill:setZoom( -10 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 0 )
					ForeStroke:setZoom( -5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.AbilityIconGold:setZoom( 0 )
				self.clipFinished( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIconSolid:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0.05 )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0 )
					AbilityIcon:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.9 )
				self.AbilityIcon:setZoom( 5 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Fill:setRGB( 1, 0.77, 0 )
					Fill:setAlpha( 0.3 )
					Fill:setZoom( 5 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 0, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -8 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0.5 )
				self.ForeStroke:setZoom( -5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconGold:setAlpha( 0.3 )
					AbilityIconGold:setZoom( -18 )
					if event.interrupted then
						self.clipFinished( AbilityIconGold, event )
					else
						AbilityIconGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.AbilityIconGold:setZoom( 0 )
				AbilityIconGoldFrame2( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconSolid:setRGB( 0, 0, 0 )
					AbilityIconSolid:setAlpha( 0.1 )
					AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setRGB( 0, 0, 0 )
				self.AbilityIconSolid:setAlpha( 0.05 )
				self.AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.9 )
				self.AbilityIcon:setZoom( 5 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Fill:setRGB( 1, 1, 1 )
					Fill:setAlpha( 0 )
					Fill:setZoom( -8 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( 5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0.5 )
				self.ForeStroke:setZoom( -5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconGold:setAlpha( 0.1 )
					AbilityIconGold:setZoom( -49 )
					if event.interrupted then
						self.clipFinished( AbilityIconGold, event )
					else
						AbilityIconGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.AbilityIconGold:setZoom( 0 )
				AbilityIconGoldFrame2( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIconSolid:setAlpha( 0.1 )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0.05 )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.9 )
				self.AbilityIcon:setZoom( 5 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -8 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( Fill, {} )
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( 5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0.1 )
				self.AbilityIconGold:setZoom( -49 )
				self.clipFinished( AbilityIconGold, {} )
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0.1 )
				self.clipFinished( AbilityIconSolid, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 10 )
				self.clipFinished( AbilityIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Fill:setRGB( 1, 1, 1 )
					Fill:setAlpha( 0 )
					Fill:setZoom( -8 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -8 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 0 )
					ForeStroke:setZoom( 5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( 5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconGold:setAlpha( 0 )
					AbilityIconGold:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( AbilityIconGold, event )
					else
						AbilityIconGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0.1 )
				self.AbilityIconGold:setZoom( -49 )
				AbilityIconGoldFrame2( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIconSolid:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0.1 )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0 )
					AbilityIcon:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 10 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Fill:setRGB( 1, 0.77, 0 )
					Fill:setAlpha( 0.3 )
					Fill:setZoom( 5 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 0, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -8 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -8 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0.5 )
				self.ForeStroke:setZoom( 5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconGold:setAlpha( 0.3 )
					AbilityIconGold:setZoom( -18 )
					if event.interrupted then
						self.clipFinished( AbilityIconGold, event )
					else
						AbilityIconGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0.1 )
				self.AbilityIconGold:setZoom( -49 )
				AbilityIconGoldFrame2( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconSolid:setRGB( 0, 0, 0 )
					AbilityIconSolid:setAlpha( 0.1 )
					AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setRGB( 0, 0, 0 )
				self.AbilityIconSolid:setAlpha( 0.1 )
				self.AbilityIconSolid:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.9 )
				self.AbilityIcon:setZoom( 10 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 5 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Fill:setRGB( 1, 1, 1 )
					Fill:setAlpha( 0 )
					Fill:setZoom( -10 )
					Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
					Fill:setShaderVector( 1, 0, 0, 0, 0 )
					Fill:setShaderVector( 2, 0, 0, 0, 0 )
					Fill:setShaderVector( 3, 0, 0, 0, 0 )
					Fill:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -8 )
				self.Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 4, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setRGB( 1, 1, 1 )
					ForeStroke:setAlpha( 0.5 )
					ForeStroke:setZoom( -5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( 5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityIconGold:setAlpha( 0 )
					AbilityIconGold:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( AbilityIconGold, event )
					else
						AbilityIconGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0.1 )
				self.AbilityIconGold:setZoom( -49 )
				AbilityIconGoldFrame2( AbilityIconGold, {} )
				local AbilityIconSolidFrame2 = function ( AbilityIconSolid, event )
					if not event.interrupted then
						AbilityIconSolid:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIconSolid:setAlpha( 0.05 )
					if event.interrupted then
						self.clipFinished( AbilityIconSolid, event )
					else
						AbilityIconSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0.1 )
				AbilityIconSolidFrame2( AbilityIconSolid, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.9 )
					AbilityIcon:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 10 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f76_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f76_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f76_local0 then
						f76_local0 = IsHeroAbilityGadget( controller )
					end
				else
					f76_local0 = false
				end
				return f76_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				local f77_local0 = IsSpecialGadgetAvailable( controller )
				if f77_local0 then
					if not IsHeroWeaponOrGadgetInUse( menu, controller ) then
						f77_local0 = IsHeroAbilityGadget( controller )
					else
						f77_local0 = false
					end
				end
				return f77_local0
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller ) and IsHeroAbilityGadget( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Fill:close()
		element.ForeStroke:close()
		element.AbilityIconGold:close()
		element.AbilityIconSolid:close()
		element.AbilityIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

