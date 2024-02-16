-- 47c7aeebfd944f1da623dab4de1f9f71
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_sidebar" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )

CoD.EmpRebootElectromagneticWidget = InheritFrom( LUI.UIElement )
CoD.EmpRebootElectromagneticWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.EmpRebootElectromagneticWidget )
	self.id = "EmpRebootElectromagneticWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 751 )
	self:setTopBottom( true, false, 0, 49 )
	self.anyChildUsesUpdateState = true
	
	local CenterBox = LUI.UIImage.new()
	CenterBox:setLeftRight( false, false, -214.08, 213.67 )
	CenterBox:setTopBottom( false, false, -24.54, 24.54 )
	CenterBox:setRGB( 0.73, 0, 0 )
	CenterBox:setImage( RegisterImage( "uie_t7_hud_outofbounds_centerbox" ) )
	CenterBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterBox )
	self.CenterBox = CenterBox
	
	local CenterBox0 = LUI.UIImage.new()
	CenterBox0:setLeftRight( false, false, -214.08, 213.67 )
	CenterBox0:setTopBottom( false, false, -24.54, 24.54 )
	CenterBox0:setRGB( 0.73, 0, 0 )
	CenterBox0:setZoom( -20 )
	CenterBox0:setImage( RegisterImage( "uie_t7_hud_outofbounds_centerbox" ) )
	CenterBox0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterBox0 )
	self.CenterBox0 = CenterBox0
	
	local TextBoxWarningText2 = LUI.UIText.new()
	TextBoxWarningText2:setLeftRight( false, false, -233.7, 234.91 )
	TextBoxWarningText2:setTopBottom( false, false, -9.87, 11.87 )
	TextBoxWarningText2:setText( Engine.Localize( "MP_HUD_EMP" ) )
	TextBoxWarningText2:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextBoxWarningText2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBoxWarningText2:setShaderVector( 0, 0.1, 0, 0, 0 )
	TextBoxWarningText2:setShaderVector( 1, 0, 0, 0, 0 )
	TextBoxWarningText2:setShaderVector( 2, 1, 0, 0, 0 )
	TextBoxWarningText2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	TextBoxWarningText2:setLetterSpacing( 1 )
	TextBoxWarningText2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBoxWarningText2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBoxWarningText2 )
	self.TextBoxWarningText2 = TextBoxWarningText2
	
	local outofboundssidebar = CoD.outofbounds_sidebar.new( menu, controller )
	outofboundssidebar:setLeftRight( false, false, 112.38, 375.62 )
	outofboundssidebar:setTopBottom( false, false, -15.41, 15.41 )
	outofboundssidebar:setScale( 0.3 )
	self:addElement( outofboundssidebar )
	self.outofboundssidebar = outofboundssidebar
	
	local outofboundssidebar0 = CoD.outofbounds_sidebar.new( menu, controller )
	outofboundssidebar0:setLeftRight( false, false, -375.62, -112.38 )
	outofboundssidebar0:setTopBottom( false, false, -15.41, 15.41 )
	outofboundssidebar0:setScale( 0.3 )
	self:addElement( outofboundssidebar0 )
	self.outofboundssidebar0 = outofboundssidebar0
	
	local AbilityWheelPixel30 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel30:setLeftRight( false, false, 194.09, 202.09 )
	AbilityWheelPixel30:setTopBottom( false, false, -19.41, -11.41 )
	AbilityWheelPixel30.Image20:setAlpha( 0.7 )
	AbilityWheelPixel30.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel30 )
	self.AbilityWheelPixel30 = AbilityWheelPixel30
	
	local AbilityWheelPixel0 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel0:setLeftRight( false, false, 194.09, 202.09 )
	AbilityWheelPixel0:setTopBottom( false, false, 11.41, 19.41 )
	AbilityWheelPixel0.Image20:setAlpha( 0.7 )
	AbilityWheelPixel0.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel0 )
	self.AbilityWheelPixel0 = AbilityWheelPixel0
	
	local AbilityWheelPixel1 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel1:setLeftRight( false, false, -211.91, -203.91 )
	AbilityWheelPixel1:setTopBottom( false, false, -19.41, -11.41 )
	AbilityWheelPixel1.Image20:setAlpha( 0.7 )
	AbilityWheelPixel1.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel1 )
	self.AbilityWheelPixel1 = AbilityWheelPixel1
	
	local AbilityWheelPixel2 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel2:setLeftRight( false, false, -211.91, -203.91 )
	AbilityWheelPixel2:setTopBottom( false, false, 11.41, 19.41 )
	AbilityWheelPixel2.Image20:setAlpha( 0.7 )
	AbilityWheelPixel2.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel2 )
	self.AbilityWheelPixel2 = AbilityWheelPixel2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local CenterBoxFrame2 = function ( CenterBox, event )
					local CenterBoxFrame3 = function ( CenterBox, event )
						if not event.interrupted then
							CenterBox:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						CenterBox:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CenterBox, event )
						else
							CenterBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CenterBoxFrame3( CenterBox, event )
						return 
					else
						CenterBox:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						CenterBox:setAlpha( 0.9 )
						CenterBox:registerEventHandler( "transition_complete_keyframe", CenterBoxFrame3 )
					end
				end
				
				CenterBox:completeAnimation()
				self.CenterBox:setAlpha( 1 )
				CenterBoxFrame2( CenterBox, {} )
				local CenterBox0Frame2 = function ( CenterBox0, event )
					if not event.interrupted then
						CenterBox0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					CenterBox0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CenterBox0, event )
					else
						CenterBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterBox0:completeAnimation()
				self.CenterBox0:setAlpha( 1 )
				CenterBox0Frame2( CenterBox0, {} )
				local TextBoxWarningText2Frame2 = function ( TextBoxWarningText2, event )
					local TextBoxWarningText2Frame3 = function ( TextBoxWarningText2, event )
						if not event.interrupted then
							TextBoxWarningText2:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						TextBoxWarningText2:setAlpha( 0.95 )
						if event.interrupted then
							self.clipFinished( TextBoxWarningText2, event )
						else
							TextBoxWarningText2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TextBoxWarningText2Frame3( TextBoxWarningText2, event )
						return 
					else
						TextBoxWarningText2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						TextBoxWarningText2:setAlpha( 0.77 )
						TextBoxWarningText2:registerEventHandler( "transition_complete_keyframe", TextBoxWarningText2Frame3 )
					end
				end
				
				TextBoxWarningText2:completeAnimation()
				self.TextBoxWarningText2:setAlpha( 1 )
				TextBoxWarningText2Frame2( TextBoxWarningText2, {} )
				local AbilityWheelPixel30Frame2 = function ( AbilityWheelPixel30, event )
					if not event.interrupted then
						AbilityWheelPixel30:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel30:setLeftRight( false, false, 276.09, 284.09 )
					AbilityWheelPixel30:setTopBottom( false, false, -19.41, -11.41 )
					AbilityWheelPixel30:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel30, event )
					else
						AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel30:completeAnimation()
				self.AbilityWheelPixel30:setLeftRight( false, false, 194.09, 202.09 )
				self.AbilityWheelPixel30:setTopBottom( false, false, -19.41, -11.41 )
				self.AbilityWheelPixel30:setAlpha( 1 )
				AbilityWheelPixel30Frame2( AbilityWheelPixel30, {} )
				local AbilityWheelPixel0Frame2 = function ( AbilityWheelPixel0, event )
					if not event.interrupted then
						AbilityWheelPixel0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel0:setLeftRight( false, false, 276.09, 284.09 )
					AbilityWheelPixel0:setTopBottom( false, false, 11.41, 19.41 )
					AbilityWheelPixel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel0, event )
					else
						AbilityWheelPixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel0:completeAnimation()
				self.AbilityWheelPixel0:setLeftRight( false, false, 194.09, 202.09 )
				self.AbilityWheelPixel0:setTopBottom( false, false, 11.41, 19.41 )
				self.AbilityWheelPixel0:setAlpha( 1 )
				AbilityWheelPixel0Frame2( AbilityWheelPixel0, {} )
				local AbilityWheelPixel1Frame2 = function ( AbilityWheelPixel1, event )
					if not event.interrupted then
						AbilityWheelPixel1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel1:setLeftRight( false, false, -282.91, -274.91 )
					AbilityWheelPixel1:setTopBottom( false, false, -19.41, -11.41 )
					AbilityWheelPixel1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel1, event )
					else
						AbilityWheelPixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel1:completeAnimation()
				self.AbilityWheelPixel1:setLeftRight( false, false, -211.91, -201.91 )
				self.AbilityWheelPixel1:setTopBottom( false, false, -19.41, -11.41 )
				self.AbilityWheelPixel1:setAlpha( 1 )
				AbilityWheelPixel1Frame2( AbilityWheelPixel1, {} )
				local AbilityWheelPixel2Frame2 = function ( AbilityWheelPixel2, event )
					if not event.interrupted then
						AbilityWheelPixel2:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel2:setLeftRight( false, false, -282.91, -274.91 )
					AbilityWheelPixel2:setTopBottom( false, false, 11.41, 19.41 )
					AbilityWheelPixel2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel2, event )
					else
						AbilityWheelPixel2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel2:completeAnimation()
				self.AbilityWheelPixel2:setLeftRight( false, false, -211.91, -201.91 )
				self.AbilityWheelPixel2:setTopBottom( false, false, 11.41, 19.41 )
				self.AbilityWheelPixel2:setAlpha( 1 )
				AbilityWheelPixel2Frame2( AbilityWheelPixel2, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.outofboundssidebar:close()
		element.outofboundssidebar0:close()
		element.AbilityWheelPixel30:close()
		element.AbilityWheelPixel0:close()
		element.AbilityWheelPixel1:close()
		element.AbilityWheelPixel2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
