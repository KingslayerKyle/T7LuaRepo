require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityAftStroke" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityFill" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityForeStroke" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_HeroAbilityIcon" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_Dash" )

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
	
	local AbilityAftStroke = CoD.AmmoWidget_AbilityAftStroke.new( menu, controller )
	AbilityAftStroke:setLeftRight( true, true, 0.33, 0 )
	AbilityAftStroke:setTopBottom( true, true, 0, 0.33 )
	AbilityAftStroke:setRGB( 1, 1, 1 )
	AbilityAftStroke:setAlpha( 0.5 )
	AbilityAftStroke:setZoom( -15 )
	AbilityAftStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityAftStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
	AbilityAftStroke:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityAftStroke:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityAftStroke:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityAftStroke:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( AbilityAftStroke )
	self.AbilityAftStroke = AbilityAftStroke
	
	local Fill = CoD.AmmoWidget_AbilityFill.new( menu, controller )
	Fill:setLeftRight( true, true, 0.33, -1 )
	Fill:setTopBottom( true, true, 0, 0.33 )
	Fill:setRGB( 1, 0.77, 0 )
	Fill:setAlpha( 0.3 )
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
	ForeStroke:setRGB( 1, 0.77, 0 )
	ForeStroke:setAlpha( 0.6 )
	ForeStroke:setZoom( -8 )
	ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ForeStroke:setShaderVector( 0, 0.2, 0, 0, 0 )
	ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
	ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
	ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
	ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
	
	local Dash1 = CoD.AmmoWidgetMP_Dash.new( menu, controller )
	Dash1:setLeftRight( false, true, -10, -6 )
	Dash1:setTopBottom( false, true, -13, -2.33 )
	Dash1:setRGB( 1, 1, 1 )
	Dash1:setYRot( 180 )
	Dash1:setZRot( -30 )
	Dash1:setZoom( 8 )
	Dash1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dash1:setShaderVector( 0, 0, 0, 0, 0 )
	Dash1:setShaderVector( 1, 0, 0, 0, 0 )
	Dash1:setShaderVector( 2, 0, 0, 0, 0 )
	Dash1:setShaderVector( 3, 0, 0, 0, 0 )
	Dash1:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dash1 )
	self.Dash1 = Dash1
	
	local Dash2 = CoD.AmmoWidgetMP_Dash.new( menu, controller )
	Dash2:setLeftRight( false, true, -10, -6 )
	Dash2:setTopBottom( true, false, 3, 13.67 )
	Dash2:setRGB( 1, 1, 1 )
	Dash2:setYRot( 180 )
	Dash2:setZRot( 30 )
	Dash2:setZoom( 8 )
	Dash2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dash2:setShaderVector( 0, 0, 0, 0, 0 )
	Dash2:setShaderVector( 1, 0, 0, 0, 0 )
	Dash2:setShaderVector( 2, 0, 0, 0, 0 )
	Dash2:setShaderVector( 3, 0, 0, 0, 0 )
	Dash2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dash2 )
	self.Dash2 = Dash2
	
	local Dash3 = CoD.AmmoWidgetMP_Dash.new( menu, controller )
	Dash3:setLeftRight( true, false, 4, 8 )
	Dash3:setTopBottom( false, true, -13, -2.33 )
	Dash3:setRGB( 1, 1, 1 )
	Dash3:setZRot( -30 )
	Dash3:setZoom( 8 )
	Dash3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dash3:setShaderVector( 0, 0, 0, 0, 0 )
	Dash3:setShaderVector( 1, 0, 0, 0, 0 )
	Dash3:setShaderVector( 2, 0, 0, 0, 0 )
	Dash3:setShaderVector( 3, 0, 0, 0, 0 )
	Dash3:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dash3 )
	self.Dash3 = Dash3
	
	local Dash4 = CoD.AmmoWidgetMP_Dash.new( menu, controller )
	Dash4:setLeftRight( true, false, 4, 8 )
	Dash4:setTopBottom( true, false, 3, 13.67 )
	Dash4:setRGB( 1, 1, 1 )
	Dash4:setZRot( 30 )
	Dash4:setZoom( 8 )
	Dash4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dash4:setShaderVector( 0, 0, 0, 0, 0 )
	Dash4:setShaderVector( 1, 0, 0, 0, 0 )
	Dash4:setShaderVector( 2, 0, 0, 0, 0 )
	Dash4:setShaderVector( 3, 0, 0, 0, 0 )
	Dash4:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dash4 )
	self.Dash4 = Dash4
	
	local AbilityIconSolid = CoD.AmmoWidget_HeroAbilityIcon.new( menu, controller )
	AbilityIconSolid:setLeftRight( false, false, -31.17, 31.5 )
	AbilityIconSolid:setTopBottom( false, false, -30.5, 32.17 )
	AbilityIconSolid:setRGB( 0, 0, 0 )
	AbilityIconSolid:setAlpha( 0.1 )
	AbilityIconSolid:setZoom( 14.5 )
	self:addElement( AbilityIconSolid )
	self.AbilityIconSolid = AbilityIconSolid
	
	local AbilityIcon = CoD.AmmoWidget_HeroAbilityIcon.new( menu, controller )
	AbilityIcon:setLeftRight( false, false, -31.17, 31.5 )
	AbilityIcon:setTopBottom( false, false, -30.5, 32.17 )
	AbilityIcon:setRGB( 1, 1, 1 )
	AbilityIcon:setZoom( 15 )
	AbilityIcon:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityIcon:setShaderVector( 0, 0.05, 1, 0, 0 )
	AbilityIcon:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityIcon:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityIcon:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityIcon:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( AbilityIcon )
	self.AbilityIcon = AbilityIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.clipFinished( AbilityAftStroke, {} )
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.clipFinished( Fill, {} )
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 0 )
				self.clipFinished( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.clipFinished( AbilityIconGold, {} )
				Dash1:completeAnimation()
				self.Dash1:setAlpha( 0 )
				self.clipFinished( Dash1, {} )
				Dash2:completeAnimation()
				self.Dash2:setAlpha( 0 )
				self.clipFinished( Dash2, {} )
				Dash3:completeAnimation()
				self.Dash3:setAlpha( 0 )
				self.clipFinished( Dash3, {} )
				Dash4:completeAnimation()
				self.Dash4:setAlpha( 0 )
				self.clipFinished( Dash4, {} )
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0 )
				self.clipFinished( AbilityIconSolid, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0 )
				self.clipFinished( AbilityIcon, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0.5 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setRGB( 1, 0.77, 0 )
					ForeStroke:setAlpha( 0.6 )
					ForeStroke:setZoom( -8 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 0, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 0.77, 0 )
				self.ForeStroke:setAlpha( 0 )
				self.ForeStroke:setZoom( -8 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash1:setLeftRight( false, true, -10, -6 )
					Dash1:setTopBottom( false, true, -13, -2.33 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -10, -6 )
				self.Dash1:setTopBottom( false, true, -13, -2.33 )
				self.Dash1:setAlpha( 0 )
				self.Dash1:setZRot( -30 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash2:setLeftRight( false, true, -10, -6 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -10, -6 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 0 )
				self.Dash2:setZRot( 30 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( false, true, -13, -2.33 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( false, true, -13, -2.33 )
				self.Dash3:setAlpha( 0 )
				self.Dash3:setZRot( -30 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 3, 13.67 )
					Dash4:setAlpha( 1 )
					Dash4:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 0 )
				self.Dash4:setZRot( 30 )
				Dash4Frame2( Dash4, {} )
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
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setAlpha( 0.4 )
					ForeStroke:setZoom( -5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
				ForeStrokeFrame2( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.AbilityIconGold:setZoom( 0 )
				self.clipFinished( AbilityIconGold, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash1:setLeftRight( false, true, -1, 3 )
					Dash1:setTopBottom( false, true, -36, -25.33 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -2, 2 )
				self.Dash1:setTopBottom( false, true, -36.34, -25.67 )
				self.Dash1:setAlpha( 0 )
				self.Dash1:setZRot( 90 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash2:setLeftRight( false, true, -1, 3 )
					Dash2:setTopBottom( true, false, 26, 36.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -1, 3 )
				self.Dash2:setTopBottom( true, false, 26, 36.67 )
				self.Dash2:setAlpha( 0 )
				self.Dash2:setZRot( -90 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash3:setLeftRight( true, false, -2, 2 )
					Dash3:setTopBottom( false, true, -36, -25.33 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, -2, 2 )
				self.Dash3:setTopBottom( false, true, -36, -25.33 )
				self.Dash3:setAlpha( 0 )
				self.Dash3:setZRot( 90 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash4:setLeftRight( true, false, -2, 2 )
					Dash4:setTopBottom( true, false, 26, 36.67 )
					Dash4:setAlpha( 1 )
					Dash4:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, -2, 2 )
				self.Dash4:setTopBottom( true, false, 26, 36.67 )
				self.Dash4:setAlpha( 0 )
				self.Dash4:setZRot( -90 )
				Dash4Frame2( Dash4, {} )
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
					AbilityIcon:setAlpha( 0.9 )
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
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setAlpha( 0 )
					ForeStroke:setZoom( 5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
				ForeStrokeFrame2( ForeStroke, {} )
				local AbilityIconGoldFrame2 = function ( AbilityIconGold, event )
					if not event.interrupted then
						AbilityIconGold:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
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
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash1:setLeftRight( false, true, -10, -6 )
					Dash1:setTopBottom( false, true, -13, -2.33 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -10, -6 )
				self.Dash1:setTopBottom( false, true, -13, -2.33 )
				self.Dash1:setAlpha( 0 )
				self.Dash1:setZRot( 0 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash2:setLeftRight( false, true, -10, -6 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -10, -6 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 0 )
				self.Dash2:setZRot( 0 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( false, true, -13, -2.33 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( false, true, -13, -2.33 )
				self.Dash3:setAlpha( 0 )
				self.Dash3:setZRot( 0 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 3, 13.67 )
					Dash4:setAlpha( 1 )
					Dash4:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 0 )
				self.Dash4:setZRot( 0 )
				Dash4Frame2( Dash4, {} )
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
				self:setupElementClipCounter( 10 )
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0.5 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )
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
				self.ForeStroke:setRGB( 1, 0.77, 0 )
				self.ForeStroke:setAlpha( 0.6 )
				self.ForeStroke:setZoom( -8 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setRGB( 1, 0.77, 0 )
				self.AbilityIconGold:setAlpha( 0.3 )
				self.AbilityIconGold:setZoom( -18 )
				self.AbilityIconGold:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( AbilityIconGold, {} )
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -10, -6 )
				self.Dash1:setTopBottom( false, true, -13, -2.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( -30 )
				self.clipFinished( Dash1, {} )
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -10, -6 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 30 )
				self.clipFinished( Dash2, {} )
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( false, true, -13, -2.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( -30 )
				self.clipFinished( Dash3, {} )
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( 30 )
				self.clipFinished( Dash4, {} )
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
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0.5 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setRGB( 1, 0.77, 0 )
					ForeStroke:setAlpha( 0 )
					ForeStroke:setZoom( -8 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 0, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 0.77, 0 )
				self.ForeStroke:setAlpha( 0.6 )
				self.ForeStroke:setZoom( -8 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( false, true, -10, -6 )
					Dash1:setTopBottom( false, true, -13, -2.33 )
					Dash1:setAlpha( 0 )
					Dash1:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -10, -6 )
				self.Dash1:setTopBottom( false, true, -13, -2.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( -30 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( false, true, -10, -6 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 0 )
					Dash2:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -10, -6 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 30 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( false, true, -13, -2.33 )
					Dash3:setAlpha( 0 )
					Dash3:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( false, true, -13, -2.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( -30 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 3, 13.67 )
					Dash4:setAlpha( 0 )
					Dash4:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( 30 )
				Dash4Frame2( Dash4, {} )
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
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0.5 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 0.77, 0 )
				self.ForeStroke:setAlpha( 0.6 )
				self.ForeStroke:setZoom( -8 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( false, true, -1, 3 )
					Dash1:setTopBottom( false, true, -36, -25.33 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -10, -6 )
				self.Dash1:setTopBottom( false, true, -13, -2.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( -30 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( false, true, -1, 3 )
					Dash2:setTopBottom( true, false, 26, 36.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -10, -6 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 30 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, -2, 2 )
					Dash3:setTopBottom( false, true, -36, -25.33 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( false, true, -13, -2.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( -30 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, -2, 2 )
					Dash4:setTopBottom( true, false, 26, 36.67 )
					Dash4:setAlpha( 1 )
					Dash4:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( 30 )
				Dash4Frame2( Dash4, {} )
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
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0.5 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setAlpha( 0 )
					ForeStroke:setZoom( 5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 0.77, 0 )
				self.ForeStroke:setAlpha( 0.6 )
				self.ForeStroke:setZoom( -8 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( false, true, -10, -6 )
					Dash1:setTopBottom( false, true, -13, -2.33 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -10, -6 )
				self.Dash1:setTopBottom( false, true, -13, -2.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( -30 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( false, true, -10, -6 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -10, -6 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 30 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( false, true, -13, -2.33 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( false, true, -13, -2.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( -30 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 3, 13.67 )
					Dash4:setAlpha( 1 )
					Dash4:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( 30 )
				Dash4Frame2( Dash4, {} )
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
					AbilityIcon:setAlpha( 1 )
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
				self:setupElementClipCounter( 10 )
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )
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
				self.ForeStroke:setAlpha( 0.4 )
				self.ForeStroke:setZoom( -5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.AbilityIconGold:setZoom( 0 )
				self.clipFinished( AbilityIconGold, {} )
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -1, 3 )
				self.Dash1:setTopBottom( false, true, -36, -25.33 )
				self.Dash1:setAlpha( 0.7 )
				self.Dash1:setZRot( 90 )
				self.clipFinished( Dash1, {} )
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -1, 3 )
				self.Dash2:setTopBottom( true, false, 26, 36.67 )
				self.Dash2:setAlpha( 0.7 )
				self.Dash2:setZRot( -90 )
				self.clipFinished( Dash2, {} )
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, -2, 2 )
				self.Dash3:setTopBottom( false, true, -36, -25.33 )
				self.Dash3:setAlpha( 0.7 )
				self.Dash3:setZRot( 90 )
				self.clipFinished( Dash3, {} )
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, -2, 2 )
				self.Dash4:setTopBottom( true, false, 26, 36.67 )
				self.Dash4:setAlpha( 0.7 )
				self.Dash4:setZRot( -90 )
				self.clipFinished( Dash4, {} )
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0.05 )
				self.clipFinished( AbilityIconSolid, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.9 )
				self.AbilityIcon:setZoom( 5 )
				self.clipFinished( AbilityIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0.4 )
				self.ForeStroke:setZoom( -5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
				ForeStrokeFrame2( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0 )
				self.AbilityIconGold:setZoom( 0 )
				self.clipFinished( AbilityIconGold, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( false, true, -2, 2 )
					Dash1:setTopBottom( false, true, -36, -25.33 )
					Dash1:setAlpha( 0 )
					Dash1:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -2, 2 )
				self.Dash1:setTopBottom( false, true, -36, -25.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( 90 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( false, true, -1, 3 )
					Dash2:setTopBottom( true, false, 26, 36.67 )
					Dash2:setAlpha( 0 )
					Dash2:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -1, 3 )
				self.Dash2:setTopBottom( true, false, 26, 36.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( -90 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, -2, 2 )
					Dash3:setTopBottom( false, true, -36, -25.33 )
					Dash3:setAlpha( 0 )
					Dash3:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, -2, 2 )
				self.Dash3:setTopBottom( false, true, -36, -25.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( 90 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, -2, 2 )
					Dash4:setTopBottom( true, false, 26, 36.67 )
					Dash4:setAlpha( 0 )
					Dash4:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, -2, 2 )
				self.Dash4:setTopBottom( true, false, 26, 36.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( -90 )
				Dash4Frame2( Dash4, {} )
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
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0.5 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setRGB( 1, 0.77, 0 )
					ForeStroke:setAlpha( 0.6 )
					ForeStroke:setZoom( -8 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 0, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0.4 )
				self.ForeStroke:setZoom( -5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( false, true, -10, -6 )
					Dash1:setTopBottom( false, true, -13, -2.33 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -1, 3 )
				self.Dash1:setTopBottom( false, true, -36, -25.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( 90 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( false, true, -10, -6 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -1, 3 )
				self.Dash2:setTopBottom( true, false, 26, 36.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( -90 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( false, true, -13, -2.33 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, -2, 2 )
				self.Dash3:setTopBottom( false, true, -36, -25.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( 90 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 3, 13.67 )
					Dash4:setAlpha( 1 )
					Dash4:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, -2, 2 )
				self.Dash4:setTopBottom( true, false, 26, 36.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( -90 )
				Dash4Frame2( Dash4, {} )
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
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setAlpha( 0 )
					ForeStroke:setZoom( 5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setRGB( 1, 1, 1 )
				self.ForeStroke:setAlpha( 0.4 )
				self.ForeStroke:setZoom( -5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( false, true, -10, -6 )
					Dash1:setTopBottom( false, true, -13, -2.33 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -1, 3 )
				self.Dash1:setTopBottom( false, true, -36, -25.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( 90 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( false, true, -10, -6 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -1, 3 )
				self.Dash2:setTopBottom( true, false, 26, 36.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( -90 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( false, true, -13, -2.33 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, -2, 2 )
				self.Dash3:setTopBottom( false, true, -36, -25.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( 90 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 3, 13.67 )
					Dash4:setAlpha( 1 )
					Dash4:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, -2, 2 )
				self.Dash4:setTopBottom( true, false, 26, 36.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( -90 )
				Dash4Frame2( Dash4, {} )
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
				self:setupElementClipCounter( 10 )
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )
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
				self.ForeStroke:setAlpha( 0 )
				self.ForeStroke:setZoom( 5 )
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( ForeStroke, {} )
				AbilityIconGold:completeAnimation()
				self.AbilityIconGold:setAlpha( 0.1 )
				self.AbilityIconGold:setZoom( -49 )
				self.clipFinished( AbilityIconGold, {} )
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -10, -6 )
				self.Dash1:setTopBottom( false, true, -13, -2.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( 0 )
				self.clipFinished( Dash1, {} )
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -10, -6 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 0 )
				self.clipFinished( Dash2, {} )
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( false, true, -13, -2.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( 0 )
				self.clipFinished( Dash3, {} )
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( 0 )
				self.clipFinished( Dash4, {} )
				AbilityIconSolid:completeAnimation()
				self.AbilityIconSolid:setAlpha( 0.1 )
				self.clipFinished( AbilityIconSolid, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 10 )
				self.clipFinished( AbilityIcon, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( false, true, -10, -6 )
					Dash1:setTopBottom( false, true, -13, -2.33 )
					Dash1:setAlpha( 0 )
					Dash1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -10, -6 )
				self.Dash1:setTopBottom( false, true, -13, -2.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( 0 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( false, true, -10, -6 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 0 )
					Dash2:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -10, -6 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 0 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( false, true, -13, -2.33 )
					Dash3:setAlpha( 0 )
					Dash3:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( false, true, -13, -2.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( 0 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 3, 13.67 )
					Dash4:setAlpha( 0 )
					Dash4:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( 0 )
				Dash4Frame2( Dash4, {} )
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
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0.5 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setRGB( 1, 0.77, 0 )
					ForeStroke:setAlpha( 0.6 )
					ForeStroke:setZoom( -8 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 0, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( false, true, -10, -6 )
					Dash1:setTopBottom( false, true, -13, -2.33 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -10, -6 )
				self.Dash1:setTopBottom( false, true, -13, -2.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( 0 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( false, true, -10, -6 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -10, -6 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 0 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( false, true, -13, -2.33 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( false, true, -13, -2.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( 0 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 3, 13.67 )
					Dash4:setAlpha( 1 )
					Dash4:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( 0 )
				Dash4Frame2( Dash4, {} )
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
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 10 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 10 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
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
					ForeStroke:setAlpha( 0.4 )
					ForeStroke:setZoom( -5 )
					ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
					ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
					ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
					ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				self.ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
				self.ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
				self.ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
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
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( false, true, -1, 3 )
					Dash1:setTopBottom( false, true, -36, -25.33 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( false, true, -10, -6 )
				self.Dash1:setTopBottom( false, true, -13, -2.33 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( 0 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( false, true, -1, 3 )
					Dash2:setTopBottom( true, false, 26, 36.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( false, true, -10, -6 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 0 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, -2, 2 )
					Dash3:setTopBottom( false, true, -36, -25.33 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( false, true, -13, -2.33 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( 0 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, -2, 2 )
					Dash4:setTopBottom( true, false, 26, 36.67 )
					Dash4:setAlpha( 1 )
					Dash4:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( 0 )
				Dash4Frame2( Dash4, {} )
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
				local f136_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f136_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f136_local0 then
						f136_local0 = IsHeroAbilityGadget( controller )
					end
				else
					f136_local0 = false
				end
				return f136_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				local f137_local0 = IsSpecialGadgetAvailable( controller )
				if f137_local0 then
					if not IsHeroWeaponOrGadgetInUse( menu, controller ) then
						f137_local0 = IsHeroAbilityGadget( controller )
					else
						f137_local0 = false
					end
				end
				return f137_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
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
	self.close = function ( self )
		self.AbilityAftStroke:close()
		self.Fill:close()
		self.ForeStroke:close()
		self.AbilityIconGold:close()
		self.Dash1:close()
		self.Dash2:close()
		self.Dash3:close()
		self.Dash4:close()
		self.AbilityIconSolid:close()
		self.AbilityIcon:close()
		CoD.AmmoWidget_HeroAbilityIconContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

