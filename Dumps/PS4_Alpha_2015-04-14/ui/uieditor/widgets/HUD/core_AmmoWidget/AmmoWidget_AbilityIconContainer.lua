require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityAftStroke" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityFill" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityForeStroke" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_Dash" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityIcon" )

CoD.AmmoWidget_AbilityIconContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityIconContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityIconContainer )
	self.id = "AmmoWidget_AbilityIconContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 57 )
	self.anyChildUsesUpdateState = true
	
	local AbilityAftStroke = CoD.AmmoWidget_AbilityAftStroke.new( menu, controller )
	AbilityAftStroke:setLeftRight( true, true, 0.33, 0 )
	AbilityAftStroke:setTopBottom( true, true, 0, 0.33 )
	AbilityAftStroke:setRGB( 1, 1, 1 )
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
	Fill:setLeftRight( true, false, 0.33, 47 )
	Fill:setTopBottom( true, false, 0, 57.33 )
	Fill:setRGB( 1, 1, 1 )
	Fill:setAlpha( 0.6 )
	Fill:setZoom( 5 )
	Fill:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Fill:setShaderVector( 0, 0.2, 1, 0, 0 )
	Fill:setShaderVector( 1, 0, 0, 0, 0 )
	Fill:setShaderVector( 2, 0, 0, 0, 0 )
	Fill:setShaderVector( 3, 0, 0, 0, 0 )
	Fill:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Fill )
	self.Fill = Fill
	
	local ForeStroke = CoD.AmmoWidget_AbilityForeStroke.new( menu, controller )
	ForeStroke:setLeftRight( true, false, 0, 48 )
	ForeStroke:setTopBottom( true, false, 0, 57 )
	ForeStroke:setRGB( 1, 1, 1 )
	ForeStroke:setZoom( -8 )
	ForeStroke:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ForeStroke:setShaderVector( 0, 0.2, 1, 0, 0 )
	ForeStroke:setShaderVector( 1, 0, 0, 0, 0 )
	ForeStroke:setShaderVector( 2, 0, 0, 0, 0 )
	ForeStroke:setShaderVector( 3, 0, 0, 0, 0 )
	ForeStroke:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ForeStroke )
	self.ForeStroke = ForeStroke
	
	local Dash1 = CoD.AmmoWidget_Dash.new( menu, controller )
	Dash1:setLeftRight( true, false, 38, 42 )
	Dash1:setTopBottom( true, false, 44, 54.67 )
	Dash1:setRGB( 1, 1, 1 )
	Dash1:setYRot( 180 )
	Dash1:setZRot( -30 )
	Dash1:setZoom( 8 )
	Dash1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dash1:setShaderVector( 0, 0.2, 0, 0, 0 )
	Dash1:setShaderVector( 1, 0, 0, 0, 0 )
	Dash1:setShaderVector( 2, 0, 0, 0, 0 )
	Dash1:setShaderVector( 3, 0, 0, 0, 0 )
	Dash1:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dash1 )
	self.Dash1 = Dash1
	
	local Dash2 = CoD.AmmoWidget_Dash.new( menu, controller )
	Dash2:setLeftRight( true, false, 38, 42 )
	Dash2:setTopBottom( true, false, 3, 13.67 )
	Dash2:setRGB( 1, 1, 1 )
	Dash2:setYRot( 180 )
	Dash2:setZRot( 30 )
	Dash2:setZoom( 8 )
	Dash2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dash2:setShaderVector( 0, 0.2, 0, 0, 0 )
	Dash2:setShaderVector( 1, 0, 0, 0, 0 )
	Dash2:setShaderVector( 2, 0, 0, 0, 0 )
	Dash2:setShaderVector( 3, 0, 0, 0, 0 )
	Dash2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dash2 )
	self.Dash2 = Dash2
	
	local Dash3 = CoD.AmmoWidget_Dash.new( menu, controller )
	Dash3:setLeftRight( true, false, 4, 8 )
	Dash3:setTopBottom( true, false, 44, 54.67 )
	Dash3:setRGB( 1, 1, 1 )
	Dash3:setZRot( -30 )
	Dash3:setZoom( 8 )
	Dash3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dash3:setShaderVector( 0, 0.2, 0, 0, 0 )
	Dash3:setShaderVector( 1, 0, 0, 0, 0 )
	Dash3:setShaderVector( 2, 0, 0, 0, 0 )
	Dash3:setShaderVector( 3, 0, 0, 0, 0 )
	Dash3:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dash3 )
	self.Dash3 = Dash3
	
	local Dash4 = CoD.AmmoWidget_Dash.new( menu, controller )
	Dash4:setLeftRight( true, false, 4, 8 )
	Dash4:setTopBottom( true, false, 3, 13.67 )
	Dash4:setRGB( 1, 1, 1 )
	Dash4:setZRot( 30 )
	Dash4:setZoom( 8 )
	Dash4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dash4:setShaderVector( 0, 0.2, 0, 0, 0 )
	Dash4:setShaderVector( 1, 0, 0, 0, 0 )
	Dash4:setShaderVector( 2, 0, 0, 0, 0 )
	Dash4:setShaderVector( 3, 0, 0, 0, 0 )
	Dash4:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dash4 )
	self.Dash4 = Dash4
	
	local AbilityIcon = CoD.AmmoWidget_AbilityIcon.new( menu, controller )
	AbilityIcon:setLeftRight( true, false, 5, 42 )
	AbilityIcon:setTopBottom( true, false, 10, 47 )
	AbilityIcon:setRGB( 1, 1, 1 )
	AbilityIcon:setZoom( 15 )
	self:addElement( AbilityIcon )
	self.AbilityIcon = AbilityIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.6 )
				self.Fill:setZoom( 5 )
				self.clipFinished( Fill, {} )
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				self.clipFinished( ForeStroke, {} )
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( true, false, 38, 42 )
				self.Dash1:setTopBottom( true, false, 44, 54.67 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( -30 )
				self.clipFinished( Dash1, {} )
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( true, false, 38, 42 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 30 )
				self.clipFinished( Dash2, {} )
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( true, false, 44, 54.67 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( -30 )
				self.clipFinished( Dash3, {} )
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( 30 )
				self.clipFinished( Dash4, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 15 )
				self.clipFinished( AbilityIcon, {} )
				self.nextClip = "DefaultClip"
			end,
			Charge = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.2 )
					Fill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.6 )
				self.Fill:setZoom( 5 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				ForeStrokeFrame2( ForeStroke, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 349, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 24, 34.67 )
					Dash1:setAlpha( 0.7 )
					Dash1:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
				Dash1:setLeftRight( true, false, 38, 42 )
				Dash1:setTopBottom( true, false, 44, 54.67 )
				Dash1:setAlpha( 1 )
				Dash1:setZRot( -30 )
				Dash1:registerEventHandler( "transition_complete_keyframe", Dash1Frame2 )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 349, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 39, 43 )
					Dash2:setTopBottom( true, false, 23, 33.67 )
					Dash2:setAlpha( 0.7 )
					Dash2:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( true, false, 38, 42 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 30 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 349, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 5, 9 )
					Dash3:setTopBottom( true, false, 24, 34.67 )
					Dash3:setAlpha( 0.7 )
					Dash3:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( true, false, 44, 54.67 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( -30 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 349, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 23, 33.67 )
					Dash4:setAlpha( 0.7 )
					Dash4:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
				Dash4:setLeftRight( true, false, 4, 8 )
				Dash4:setTopBottom( true, false, 3, 13.67 )
				Dash4:setAlpha( 1 )
				Dash4:setZRot( 30 )
				Dash4:registerEventHandler( "transition_complete_keyframe", Dash4Frame2 )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 560, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 0.5 )
					AbilityIcon:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				AbilityIcon:setLeftRight( true, false, 5, 42 )
				AbilityIcon:setTopBottom( true, false, 10, 47 )
				AbilityIcon:setAlpha( 1 )
				AbilityIcon:setZoom( 15 )
				AbilityIcon:registerEventHandler( "transition_complete_keyframe", AbilityIconFrame2 )
			end,
			InUse = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.4 )
					Fill:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.6 )
				self.Fill:setZoom( 5 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				ForeStrokeFrame2( ForeStroke, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 379, false, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 44, 54.67 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				Dash1:setLeftRight( true, false, 38, 42 )
				Dash1:setTopBottom( true, false, 44, 54.67 )
				Dash1:setAlpha( 1 )
				Dash1:setZRot( -30 )
				Dash1:registerEventHandler( "transition_complete_keyframe", Dash1Frame2 )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 379, false, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 38, 42 )
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
				self.Dash2:setLeftRight( true, false, 38, 42 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 30 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 379, false, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( true, false, 44, 54.67 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				Dash3:setLeftRight( true, false, 4, 8 )
				Dash3:setTopBottom( true, false, 44, 54.67 )
				Dash3:setAlpha( 1 )
				Dash3:setZRot( -30 )
				Dash3:registerEventHandler( "transition_complete_keyframe", Dash3Frame2 )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 379, false, true, CoD.TweenType.Back )
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
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 0.8 )
					AbilityIcon:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 15 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
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
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0 )
					Fill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.6 )
				self.Fill:setZoom( 5 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 0.5 )
					ForeStroke:setZoom( -5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -8 )
				ForeStrokeFrame2( ForeStroke, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 389, true, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 24, 34.67 )
					Dash1:setAlpha( 0.7 )
					Dash1:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
				Dash1:setLeftRight( true, false, 38, 42 )
				Dash1:setTopBottom( true, false, 44, 54.67 )
				Dash1:setAlpha( 1 )
				Dash1:setZRot( -30 )
				Dash1:registerEventHandler( "transition_complete_keyframe", Dash1Frame2 )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 389, true, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 39, 43 )
					Dash2:setTopBottom( true, false, 23, 33.67 )
					Dash2:setAlpha( 0.7 )
					Dash2:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( true, false, 38, 42 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 30 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 389, true, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 5, 9 )
					Dash3:setTopBottom( true, false, 24, 34.67 )
					Dash3:setAlpha( 0.7 )
					Dash3:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( true, false, 44, 54.67 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( -30 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 389, true, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 23, 33.67 )
					Dash4:setAlpha( 0.7 )
					Dash4:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
				Dash4:setLeftRight( true, false, 4, 8 )
				Dash4:setTopBottom( true, false, 3, 13.67 )
				Dash4:setAlpha( 1 )
				Dash4:setZRot( 30 )
				Dash4:registerEventHandler( "transition_complete_keyframe", Dash4Frame2 )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, true, true, CoD.TweenType.Back )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 0 )
					AbilityIcon:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 1 )
				self.AbilityIcon:setZoom( 15 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.2 )
				self.Fill:setZoom( -10 )
				self.clipFinished( Fill, {} )
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -5 )
				self.clipFinished( ForeStroke, {} )
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( true, false, 38, 42 )
				self.Dash1:setTopBottom( true, false, 24, 34.67 )
				self.Dash1:setAlpha( 0.7 )
				self.Dash1:setZRot( 90 )
				self.clipFinished( Dash1, {} )
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( true, false, 39, 43 )
				self.Dash2:setTopBottom( true, false, 23, 33.67 )
				self.Dash2:setAlpha( 0.7 )
				self.Dash2:setZRot( -90 )
				self.clipFinished( Dash2, {} )
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 5, 9 )
				self.Dash3:setTopBottom( true, false, 24, 34.67 )
				self.Dash3:setAlpha( 0.7 )
				self.Dash3:setZRot( 90 )
				self.clipFinished( Dash3, {} )
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 23, 33.67 )
				self.Dash4:setAlpha( 0.7 )
				self.Dash4:setZRot( -90 )
				self.clipFinished( Dash4, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.5 )
				self.AbilityIcon:setZoom( 5 )
				self.clipFinished( AbilityIcon, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.6 )
					Fill:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.2 )
				self.Fill:setZoom( -10 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 389, false, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 44, 54.67 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( true, false, 38, 42 )
				self.Dash1:setTopBottom( true, false, 24, 34.67 )
				self.Dash1:setAlpha( 0.7 )
				self.Dash1:setZRot( 90 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 389, false, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 38, 42 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				Dash2:setLeftRight( true, false, 39, 43 )
				Dash2:setTopBottom( true, false, 23, 33.67 )
				Dash2:setAlpha( 0.7 )
				Dash2:setZRot( -90 )
				Dash2:registerEventHandler( "transition_complete_keyframe", Dash2Frame2 )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 389, false, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( true, false, 44, 54.67 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				Dash3:setLeftRight( true, false, 5, 9 )
				Dash3:setTopBottom( true, false, 24, 34.67 )
				Dash3:setAlpha( 0.7 )
				Dash3:setZRot( 90 )
				Dash3:registerEventHandler( "transition_complete_keyframe", Dash3Frame2 )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 389, false, true, CoD.TweenType.Back )
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
				
				Dash4:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				Dash4:setLeftRight( true, false, 4, 8 )
				Dash4:setTopBottom( true, false, 23, 33.67 )
				Dash4:setAlpha( 0.7 )
				Dash4:setZRot( -90 )
				Dash4:registerEventHandler( "transition_complete_keyframe", Dash4Frame2 )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 0.5 )
				self.AbilityIcon:setZoom( 5 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.4 )
					Fill:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.2 )
				self.Fill:setZoom( -10 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( -5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 370, false, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 44, 54.67 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( true, false, 38, 42 )
				self.Dash1:setTopBottom( true, false, 24, 34.67 )
				self.Dash1:setAlpha( 0.7 )
				self.Dash1:setZRot( 90 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 370, false, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 38, 42 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				Dash2:setLeftRight( true, false, 39, 43 )
				Dash2:setTopBottom( true, false, 23, 33.67 )
				Dash2:setAlpha( 0.7 )
				Dash2:setZRot( -90 )
				Dash2:registerEventHandler( "transition_complete_keyframe", Dash2Frame2 )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 370, false, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( true, false, 44, 54.67 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
				Dash3:setLeftRight( true, false, 5, 9 )
				Dash3:setTopBottom( true, false, 24, 34.67 )
				Dash3:setAlpha( 0.7 )
				Dash3:setZRot( 90 )
				Dash3:registerEventHandler( "transition_complete_keyframe", Dash3Frame2 )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 370, false, true, CoD.TweenType.Back )
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
				
				Dash4:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
				Dash4:setLeftRight( true, false, 4, 8 )
				Dash4:setTopBottom( true, false, 23, 33.67 )
				Dash4:setAlpha( 0.7 )
				Dash4:setZRot( -90 )
				Dash4:registerEventHandler( "transition_complete_keyframe", Dash4Frame2 )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.8 )
					AbilityIcon:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.5 )
				self.AbilityIcon:setZoom( 5 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 0.5 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				AbilityAftStroke:setAlpha( 1 )
				AbilityAftStroke:setZoom( -15 )
				AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", AbilityAftStrokeFrame2 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 460, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0 )
					Fill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				Fill:setAlpha( 0.2 )
				Fill:setZoom( -10 )
				Fill:registerEventHandler( "transition_complete_keyframe", FillFrame2 )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 0.5 )
					ForeStroke:setZoom( -5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
				ForeStroke:setAlpha( 1 )
				ForeStroke:setZoom( -5 )
				ForeStroke:registerEventHandler( "transition_complete_keyframe", ForeStrokeFrame2 )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 24, 34.67 )
					Dash1:setAlpha( 0.7 )
					Dash1:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( true, false, 38, 42 )
				self.Dash1:setTopBottom( true, false, 24, 34.67 )
				self.Dash1:setAlpha( 0.7 )
				self.Dash1:setZRot( 90 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 39, 43 )
					Dash2:setTopBottom( true, false, 23, 33.67 )
					Dash2:setAlpha( 0.7 )
					Dash2:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( true, false, 39, 43 )
				self.Dash2:setTopBottom( true, false, 23, 33.67 )
				self.Dash2:setAlpha( 0.7 )
				self.Dash2:setZRot( -90 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 5, 9 )
					Dash3:setTopBottom( true, false, 24, 34.67 )
					Dash3:setAlpha( 0.7 )
					Dash3:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 5, 9 )
				self.Dash3:setTopBottom( true, false, 24, 34.67 )
				self.Dash3:setAlpha( 0.7 )
				self.Dash3:setZRot( 90 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 23, 33.67 )
					Dash4:setAlpha( 0.7 )
					Dash4:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 23, 33.67 )
				self.Dash4:setAlpha( 0.7 )
				self.Dash4:setZRot( -90 )
				Dash4Frame2( Dash4, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 540, false, true, CoD.TweenType.Back )
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
				self.AbilityIcon:setAlpha( 0.5 )
				self.AbilityIcon:setZoom( 5 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.4 )
				self.Fill:setZoom( -8 )
				self.clipFinished( Fill, {} )
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( 5 )
				self.clipFinished( ForeStroke, {} )
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( true, false, 38, 42 )
				self.Dash1:setTopBottom( true, false, 44, 54.67 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( 0 )
				self.clipFinished( Dash1, {} )
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( true, false, 38, 42 )
				self.Dash2:setTopBottom( true, false, 3, 13.67 )
				self.Dash2:setAlpha( 1 )
				self.Dash2:setZRot( 0 )
				self.clipFinished( Dash2, {} )
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 4, 8 )
				self.Dash3:setTopBottom( true, false, 44, 54.67 )
				self.Dash3:setAlpha( 1 )
				self.Dash3:setZRot( 0 )
				self.clipFinished( Dash3, {} )
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 3, 13.67 )
				self.Dash4:setAlpha( 1 )
				self.Dash4:setZRot( 0 )
				self.clipFinished( Dash4, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.8 )
				self.AbilityIcon:setZoom( 10 )
				self.clipFinished( AbilityIcon, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.6 )
					Fill:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.4 )
				self.Fill:setZoom( -8 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( 5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 419, false, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 44, 54.67 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				Dash1:setLeftRight( true, false, 38, 42 )
				Dash1:setTopBottom( true, false, 44, 54.67 )
				Dash1:setAlpha( 1 )
				Dash1:setZRot( 0 )
				Dash1:registerEventHandler( "transition_complete_keyframe", Dash1Frame2 )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 420, false, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 38, 42 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				Dash2:setLeftRight( true, false, 38, 42 )
				Dash2:setTopBottom( true, false, 3, 13.67 )
				Dash2:setAlpha( 1 )
				Dash2:setZRot( 0 )
				Dash2:registerEventHandler( "transition_complete_keyframe", Dash2Frame2 )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 420, false, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( true, false, 44, 54.67 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				Dash3:setLeftRight( true, false, 4, 8 )
				Dash3:setTopBottom( true, false, 44, 54.67 )
				Dash3:setAlpha( 1 )
				Dash3:setZRot( 0 )
				Dash3:registerEventHandler( "transition_complete_keyframe", Dash3Frame2 )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 419, false, true, CoD.TweenType.Back )
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
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 0.8 )
				self.AbilityIcon:setZoom( 10 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.2 )
					Fill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0.4 )
				self.Fill:setZoom( -8 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 1 )
				self.ForeStroke:setZoom( 5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 24, 34.67 )
					Dash1:setAlpha( 0.7 )
					Dash1:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				Dash1:setLeftRight( true, false, 38, 42 )
				Dash1:setTopBottom( true, false, 44, 54.67 )
				Dash1:setAlpha( 1 )
				Dash1:setZRot( 0 )
				Dash1:registerEventHandler( "transition_complete_keyframe", Dash1Frame2 )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 39, 43 )
					Dash2:setTopBottom( true, false, 23, 33.67 )
					Dash2:setAlpha( 0.7 )
					Dash2:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				Dash2:setLeftRight( true, false, 38, 42 )
				Dash2:setTopBottom( true, false, 3, 13.67 )
				Dash2:setAlpha( 1 )
				Dash2:setZRot( 0 )
				Dash2:registerEventHandler( "transition_complete_keyframe", Dash2Frame2 )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 5, 9 )
					Dash3:setTopBottom( true, false, 24, 34.67 )
					Dash3:setAlpha( 0.7 )
					Dash3:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				Dash3:setLeftRight( true, false, 4, 8 )
				Dash3:setTopBottom( true, false, 44, 54.67 )
				Dash3:setAlpha( 1 )
				Dash3:setZRot( 0 )
				Dash3:registerEventHandler( "transition_complete_keyframe", Dash3Frame2 )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 23, 33.67 )
					Dash4:setAlpha( 0.7 )
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
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.5 )
					AbilityIcon:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0.8 )
				self.AbilityIcon:setZoom( 10 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			NoGadget = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
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
				self.AbilityAftStroke:setAlpha( 1 )
				self.AbilityAftStroke:setZoom( -15 )
				AbilityAftStrokeFrame2( AbilityAftStroke, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0 )
					Fill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				Fill:setAlpha( 0.4 )
				Fill:setZoom( -8 )
				Fill:registerEventHandler( "transition_complete_keyframe", FillFrame2 )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 0.5 )
					ForeStroke:setZoom( -5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				ForeStroke:setAlpha( 1 )
				ForeStroke:setZoom( 5 )
				ForeStroke:registerEventHandler( "transition_complete_keyframe", ForeStrokeFrame2 )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 409, false, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 24, 34.67 )
					Dash1:setAlpha( 0.7 )
					Dash1:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( true, false, 38, 42 )
				self.Dash1:setTopBottom( true, false, 44, 54.67 )
				self.Dash1:setAlpha( 1 )
				self.Dash1:setZRot( 0 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 409, false, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 39, 43 )
					Dash2:setTopBottom( true, false, 23, 33.67 )
					Dash2:setAlpha( 0.7 )
					Dash2:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				Dash2:setLeftRight( true, false, 38, 42 )
				Dash2:setTopBottom( true, false, 3, 13.67 )
				Dash2:setAlpha( 1 )
				Dash2:setZRot( 0 )
				Dash2:registerEventHandler( "transition_complete_keyframe", Dash2Frame2 )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 5, 9 )
					Dash3:setTopBottom( true, false, 24, 34.67 )
					Dash3:setAlpha( 0.7 )
					Dash3:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				Dash3:setLeftRight( true, false, 4, 8 )
				Dash3:setTopBottom( true, false, 44, 54.67 )
				Dash3:setAlpha( 1 )
				Dash3:setZRot( 0 )
				Dash3:registerEventHandler( "transition_complete_keyframe", Dash3Frame2 )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 23, 33.67 )
					Dash4:setAlpha( 0.7 )
					Dash4:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				Dash4:setLeftRight( true, false, 4, 8 )
				Dash4:setTopBottom( true, false, 3, 13.67 )
				Dash4:setAlpha( 1 )
				Dash4:setZRot( 0 )
				Dash4:registerEventHandler( "transition_complete_keyframe", Dash4Frame2 )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 469, false, true, CoD.TweenType.Back )
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
				self.AbilityIcon:setAlpha( 0.8 )
				self.AbilityIcon:setZoom( 10 )
				AbilityIconFrame2( AbilityIcon, {} )
			end
		},
		NoGadget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				AbilityAftStroke:completeAnimation()
				self.AbilityAftStroke:setAlpha( 0.5 )
				self.AbilityAftStroke:setZoom( -15 )
				self.clipFinished( AbilityAftStroke, {} )
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				self.clipFinished( Fill, {} )
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 0.5 )
				self.ForeStroke:setZoom( -5 )
				self.clipFinished( ForeStroke, {} )
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( true, false, 38, 42 )
				self.Dash1:setTopBottom( true, false, 24, 34.67 )
				self.Dash1:setAlpha( 0.7 )
				self.Dash1:setZRot( 90 )
				self.clipFinished( Dash1, {} )
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( true, false, 39, 43 )
				self.Dash2:setTopBottom( true, false, 23, 33.67 )
				self.Dash2:setAlpha( 0.7 )
				self.Dash2:setZRot( -90 )
				self.clipFinished( Dash2, {} )
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 5, 9 )
				self.Dash3:setTopBottom( true, false, 24, 34.67 )
				self.Dash3:setAlpha( 0.7 )
				self.Dash3:setZRot( 90 )
				self.clipFinished( Dash3, {} )
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 23, 33.67 )
				self.Dash4:setAlpha( 0.7 )
				self.Dash4:setZRot( -90 )
				self.clipFinished( Dash4, {} )
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setAlpha( 0 )
				self.AbilityIcon:setZoom( 5 )
				self.clipFinished( AbilityIcon, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
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
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.6 )
					Fill:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 0.5 )
				self.ForeStroke:setZoom( -5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 44, 54.67 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				Dash1:setLeftRight( true, false, 38, 42 )
				Dash1:setTopBottom( true, false, 24, 34.67 )
				Dash1:setAlpha( 0.7 )
				Dash1:setZRot( 90 )
				Dash1:registerEventHandler( "transition_complete_keyframe", Dash1Frame2 )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 629, false, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 38, 42 )
					Dash2:setTopBottom( true, false, 3, 13.67 )
					Dash2:setAlpha( 1 )
					Dash2:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				Dash2:setLeftRight( true, false, 39, 43 )
				Dash2:setTopBottom( true, false, 23, 33.67 )
				Dash2:setAlpha( 0.7 )
				Dash2:setZRot( -90 )
				Dash2:registerEventHandler( "transition_complete_keyframe", Dash2Frame2 )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 540, false, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( true, false, 44, 54.67 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				Dash3:setLeftRight( true, false, 5, 9 )
				Dash3:setTopBottom( true, false, 24, 34.67 )
				Dash3:setAlpha( 0.7 )
				Dash3:setZRot( 90 )
				Dash3:registerEventHandler( "transition_complete_keyframe", Dash3Frame2 )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 610, false, true, CoD.TweenType.Back )
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
				self.Dash4:setTopBottom( true, false, 23, 33.67 )
				self.Dash4:setAlpha( 0.7 )
				self.Dash4:setZRot( -90 )
				Dash4Frame2( Dash4, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
					end
					AbilityIcon:setLeftRight( true, false, 5, 42 )
					AbilityIcon:setTopBottom( true, false, 10, 47 )
					AbilityIcon:setAlpha( 1 )
					AbilityIcon:setZoom( 15 )
					if event.interrupted then
						self.clipFinished( AbilityIcon, event )
					else
						AbilityIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityIcon:completeAnimation()
				self.AbilityIcon:setLeftRight( true, false, 5, 42 )
				self.AbilityIcon:setTopBottom( true, false, 10, 47 )
				self.AbilityIcon:setAlpha( 0 )
				self.AbilityIcon:setZoom( 5 )
				AbilityIconFrame2( AbilityIcon, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 749, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
					AbilityAftStroke:setZoom( -15 )
					if event.interrupted then
						self.clipFinished( AbilityAftStroke, event )
					else
						AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityAftStroke:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				AbilityAftStroke:setAlpha( 0.5 )
				AbilityAftStroke:setZoom( -15 )
				AbilityAftStroke:registerEventHandler( "transition_complete_keyframe", AbilityAftStrokeFrame2 )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.2 )
					Fill:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				Fill:setAlpha( 0 )
				Fill:setZoom( -10 )
				Fill:registerEventHandler( "transition_complete_keyframe", FillFrame2 )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( -5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				ForeStroke:setAlpha( 0.5 )
				ForeStroke:setZoom( -5 )
				ForeStroke:registerEventHandler( "transition_complete_keyframe", ForeStrokeFrame2 )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 24, 34.67 )
					Dash1:setAlpha( 0.7 )
					Dash1:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( true, false, 38, 42 )
				self.Dash1:setTopBottom( true, false, 24, 34.67 )
				self.Dash1:setAlpha( 0.7 )
				self.Dash1:setZRot( 90 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 39, 43 )
					Dash2:setTopBottom( true, false, 23, 33.67 )
					Dash2:setAlpha( 0.7 )
					Dash2:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash2, event )
					else
						Dash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash2:completeAnimation()
				self.Dash2:setLeftRight( true, false, 39, 43 )
				self.Dash2:setTopBottom( true, false, 23, 33.67 )
				self.Dash2:setAlpha( 0.7 )
				self.Dash2:setZRot( -90 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 5, 9 )
					Dash3:setTopBottom( true, false, 24, 34.67 )
					Dash3:setAlpha( 0.7 )
					Dash3:setZRot( 90 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 5, 9 )
				self.Dash3:setTopBottom( true, false, 24, 34.67 )
				self.Dash3:setAlpha( 0.7 )
				self.Dash3:setZRot( 90 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Dash4:setLeftRight( true, false, 4, 8 )
					Dash4:setTopBottom( true, false, 23, 33.67 )
					Dash4:setAlpha( 0.7 )
					Dash4:setZRot( -90 )
					if event.interrupted then
						self.clipFinished( Dash4, event )
					else
						Dash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash4:completeAnimation()
				self.Dash4:setLeftRight( true, false, 4, 8 )
				self.Dash4:setTopBottom( true, false, 23, 33.67 )
				self.Dash4:setAlpha( 0.7 )
				self.Dash4:setZRot( -90 )
				Dash4Frame2( Dash4, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 370, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.5 )
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
				self:setupElementClipCounter( 8 )
				local AbilityAftStrokeFrame2 = function ( AbilityAftStroke, event )
					if not event.interrupted then
						AbilityAftStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityAftStroke:setAlpha( 1 )
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
						Fill:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					Fill:setAlpha( 0.4 )
					Fill:setZoom( -8 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.Fill:setZoom( -10 )
				FillFrame2( Fill, {} )
				local ForeStrokeFrame2 = function ( ForeStroke, event )
					if not event.interrupted then
						ForeStroke:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					ForeStroke:setAlpha( 1 )
					ForeStroke:setZoom( 5 )
					if event.interrupted then
						self.clipFinished( ForeStroke, event )
					else
						ForeStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ForeStroke:completeAnimation()
				self.ForeStroke:setAlpha( 0.5 )
				self.ForeStroke:setZoom( -5 )
				ForeStrokeFrame2( ForeStroke, {} )
				local Dash1Frame2 = function ( Dash1, event )
					if not event.interrupted then
						Dash1:beginAnimation( "keyframe", 389, false, true, CoD.TweenType.Back )
					end
					Dash1:setLeftRight( true, false, 38, 42 )
					Dash1:setTopBottom( true, false, 44, 54.67 )
					Dash1:setAlpha( 1 )
					Dash1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash1, event )
					else
						Dash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash1:completeAnimation()
				self.Dash1:setLeftRight( true, false, 38, 42 )
				self.Dash1:setTopBottom( true, false, 24, 34.67 )
				self.Dash1:setAlpha( 0.7 )
				self.Dash1:setZRot( 90 )
				Dash1Frame2( Dash1, {} )
				local Dash2Frame2 = function ( Dash2, event )
					if not event.interrupted then
						Dash2:beginAnimation( "keyframe", 389, false, true, CoD.TweenType.Back )
					end
					Dash2:setLeftRight( true, false, 38, 42 )
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
				self.Dash2:setLeftRight( true, false, 39, 43 )
				self.Dash2:setTopBottom( true, false, 23, 33.67 )
				self.Dash2:setAlpha( 0.7 )
				self.Dash2:setZRot( -90 )
				Dash2Frame2( Dash2, {} )
				local Dash3Frame2 = function ( Dash3, event )
					if not event.interrupted then
						Dash3:beginAnimation( "keyframe", 389, false, true, CoD.TweenType.Back )
					end
					Dash3:setLeftRight( true, false, 4, 8 )
					Dash3:setTopBottom( true, false, 44, 54.67 )
					Dash3:setAlpha( 1 )
					Dash3:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( Dash3, event )
					else
						Dash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Dash3:completeAnimation()
				self.Dash3:setLeftRight( true, false, 5, 9 )
				self.Dash3:setTopBottom( true, false, 24, 34.67 )
				self.Dash3:setAlpha( 0.7 )
				self.Dash3:setZRot( 90 )
				Dash3Frame2( Dash3, {} )
				local Dash4Frame2 = function ( Dash4, event )
					if not event.interrupted then
						Dash4:beginAnimation( "keyframe", 389, false, true, CoD.TweenType.Back )
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
				self.Dash4:setTopBottom( true, false, 23, 33.67 )
				self.Dash4:setAlpha( 0.7 )
				self.Dash4:setZRot( -90 )
				Dash4Frame2( Dash4, {} )
				local AbilityIconFrame2 = function ( AbilityIcon, event )
					if not event.interrupted then
						AbilityIcon:beginAnimation( "keyframe", 750, false, true, CoD.TweenType.Back )
					end
					AbilityIcon:setAlpha( 0.8 )
					AbilityIcon:setZoom( 10 )
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
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f115_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f115_local0 = IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
					if f115_local0 then
						f115_local0 = not WasHeroWeaponGadgetActivated( menu )
					end
				else
					f115_local0 = false
				end
				return f115_local0
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsSpecialGadgetAvailable( controller ) and not IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		},
		{
			stateName = "NoGadget",
			condition = function ( menu, element, event )
				return not IsSpecialGadgetAvailable( controller )
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
	self.close = function ( self )
		self.AbilityAftStroke:close()
		self.Fill:close()
		self.ForeStroke:close()
		self.Dash1:close()
		self.Dash2:close()
		self.Dash3:close()
		self.Dash4:close()
		self.AbilityIcon:close()
		CoD.AmmoWidget_AbilityIconContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

