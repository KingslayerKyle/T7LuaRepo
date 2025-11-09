require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingB" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CAC.cac_WpnLvlMeter" )

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
	
	local FELabelSubHeadingB0 = CoD.FE_LabelSubHeadingB.new( menu, controller )
	FELabelSubHeadingB0:setLeftRight( true, false, 6, 90 )
	FELabelSubHeadingB0:setTopBottom( true, false, 12.5, 31.5 )
	FELabelSubHeadingB0:setRGB( 1, 1, 1 )
	FELabelSubHeadingB0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FELabelSubHeadingB0:setShaderVector( 0, 0.05, 0, 0, 0 )
	FELabelSubHeadingB0:setShaderVector( 1, 0, 0, 0, 0 )
	FELabelSubHeadingB0:setShaderVector( 2, 0, 0, 0, 0 )
	FELabelSubHeadingB0:setShaderVector( 3, 0, 0, 0, 0 )
	FELabelSubHeadingB0:setShaderVector( 4, 0, 0, 0, 0 )
	FELabelSubHeadingB0.Label1:setRGB( 0.71, 0.76, 0.77 )
	FELabelSubHeadingB0.Label1:setText( Engine.Localize( "LEVEL" ) )
	FELabelSubHeadingB0.Label1:setTTF( "fonts/Entovo.ttf" )
	FELabelSubHeadingB0.Label1:setLetterSpacing( 3.6 )
	self:addElement( FELabelSubHeadingB0 )
	self.FELabelSubHeadingB0 = FELabelSubHeadingB0
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, -340 )
	FETitleNumBrdr0:setTopBottom( false, false, -11, 11 )
	FETitleNumBrdr0:setRGB( 1, 1, 1 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 79, 111 )
	Image2:setTopBottom( true, false, 4, 36 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterside" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local accuracyLabel0 = LUI.UITightText.new()
	accuracyLabel0:setLeftRight( false, false, -119.5, -105.5 )
	accuracyLabel0:setTopBottom( false, true, -30, -10 )
	accuracyLabel0:setRGB( 0, 0, 0 )
	accuracyLabel0:setText( Engine.Localize( "12" ) )
	accuracyLabel0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( accuracyLabel0 )
	self.accuracyLabel0 = accuracyLabel0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 315.81, 376.81 )
	TextBox0:setTopBottom( true, false, 10, 30 )
	TextBox0:setRGB( 0.58, 0.64, 0.65 )
	TextBox0:setText( Engine.Localize( "13" ) )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox0:setShaderVector( 0, 0.05, 0, 0, 0 )
	TextBox0:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox00 = LUI.UIText.new()
	TextBox00:setLeftRight( true, false, 64.5, 125.5 )
	TextBox00:setTopBottom( true, false, 10, 30 )
	TextBox00:setRGB( 0, 0, 0 )
	TextBox00:setText( Engine.Localize( "12" ) )
	TextBox00:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox00 )
	self.TextBox00 = TextBox00
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( true, false, 379, 415 )
	Image100:setTopBottom( true, false, 4, 8 )
	Image100:setRGB( 1, 1, 1 )
	Image100:setAlpha( 0.5 )
	Image100:setYRot( -180 )
	Image100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local Image1000 = LUI.UIImage.new()
	Image1000:setLeftRight( true, false, 379, 415 )
	Image1000:setTopBottom( true, false, 35, 39 )
	Image1000:setRGB( 1, 1, 1 )
	Image1000:setAlpha( 0.5 )
	Image1000:setYRot( -180 )
	Image1000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1000 )
	self.Image1000 = Image1000
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 187, 363 )
	Image4:setTopBottom( true, false, 0, 40 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_weaponmeterframe" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local cacWpnLvlMeter0 = CoD.cac_WpnLvlMeter.new( menu, controller )
	cacWpnLvlMeter0:setLeftRight( true, false, 106, 338 )
	cacWpnLvlMeter0:setTopBottom( true, false, 4, 36 )
	cacWpnLvlMeter0:setRGB( 1, 1, 1 )
	cacWpnLvlMeter0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( cacWpnLvlMeter0 )
	self.cacWpnLvlMeter0 = cacWpnLvlMeter0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				FELabelSubHeadingB0:completeAnimation()
				self.FELabelSubHeadingB0:setAlpha( 1 )
				self.clipFinished( FELabelSubHeadingB0, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 1 )
				self.clipFinished( FETitleNumBrdr0, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 1 )
				self.clipFinished( Image2, {} )
				accuracyLabel0:completeAnimation()
				self.accuracyLabel0:setAlpha( 1 )
				self.clipFinished( accuracyLabel0, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )
				TextBox00:completeAnimation()
				self.TextBox00:setAlpha( 1 )
				self.clipFinished( TextBox00, {} )
				Image100:completeAnimation()
				self.Image100:setAlpha( 0.5 )
				self.clipFinished( Image100, {} )
				Image1000:completeAnimation()
				self.Image1000:setAlpha( 0.5 )
				self.clipFinished( Image1000, {} )
				Image4:completeAnimation()
				self.Image4:setAlpha( 1 )
				self.clipFinished( Image4, {} )
				cacWpnLvlMeter0:completeAnimation()
				self.cacWpnLvlMeter0:setAlpha( 1 )
				self.clipFinished( cacWpnLvlMeter0, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 10 )
				local FELabelSubHeadingB0Frame2 = function ( FELabelSubHeadingB0, event )
					local FELabelSubHeadingB0Frame3 = function ( FELabelSubHeadingB0, event )
						if not event.interrupted then
							FELabelSubHeadingB0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						FELabelSubHeadingB0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FELabelSubHeadingB0, event )
						else
							FELabelSubHeadingB0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FELabelSubHeadingB0Frame3( FELabelSubHeadingB0, event )
						return 
					else
						FELabelSubHeadingB0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						FELabelSubHeadingB0:registerEventHandler( "transition_complete_keyframe", FELabelSubHeadingB0Frame3 )
					end
				end
				
				FELabelSubHeadingB0:completeAnimation()
				self.FELabelSubHeadingB0:setAlpha( 0 )
				FELabelSubHeadingB0Frame2( FELabelSubHeadingB0, {} )
				local FETitleNumBrdr0Frame2 = function ( FETitleNumBrdr0, event )
					local FETitleNumBrdr0Frame3 = function ( FETitleNumBrdr0, event )
						if not event.interrupted then
							FETitleNumBrdr0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						FETitleNumBrdr0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FETitleNumBrdr0, event )
						else
							FETitleNumBrdr0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FETitleNumBrdr0Frame3( FETitleNumBrdr0, event )
						return 
					else
						FETitleNumBrdr0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						FETitleNumBrdr0:registerEventHandler( "transition_complete_keyframe", FETitleNumBrdr0Frame3 )
					end
				end
				
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				FETitleNumBrdr0Frame2( FETitleNumBrdr0, {} )
				local Image2Frame2 = function ( Image2, event )
					if not event.interrupted then
						Image2:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
					end
					Image2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image2, event )
					else
						Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
				local accuracyLabel0Frame2 = function ( accuracyLabel0, event )
					local accuracyLabel0Frame3 = function ( accuracyLabel0, event )
						if not event.interrupted then
							accuracyLabel0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						accuracyLabel0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( accuracyLabel0, event )
						else
							accuracyLabel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						accuracyLabel0Frame3( accuracyLabel0, event )
						return 
					else
						accuracyLabel0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						accuracyLabel0:registerEventHandler( "transition_complete_keyframe", accuracyLabel0Frame3 )
					end
				end
				
				accuracyLabel0:completeAnimation()
				self.accuracyLabel0:setAlpha( 0 )
				accuracyLabel0Frame2( accuracyLabel0, {} )
				local TextBox0Frame2 = function ( TextBox0, event )
					local TextBox0Frame3 = function ( TextBox0, event )
						if not event.interrupted then
							TextBox0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						TextBox0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( TextBox0, event )
						else
							TextBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TextBox0Frame3( TextBox0, event )
						return 
					else
						TextBox0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame3 )
					end
				end
				
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				TextBox0Frame2( TextBox0, {} )
				local TextBox00Frame2 = function ( TextBox00, event )
					local TextBox00Frame3 = function ( TextBox00, event )
						if not event.interrupted then
							TextBox00:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Bounce )
						end
						TextBox00:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( TextBox00, event )
						else
							TextBox00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TextBox00Frame3( TextBox00, event )
						return 
					else
						TextBox00:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						TextBox00:registerEventHandler( "transition_complete_keyframe", TextBox00Frame3 )
					end
				end
				
				TextBox00:completeAnimation()
				self.TextBox00:setAlpha( 0 )
				TextBox00Frame2( TextBox00, {} )
				local Image100Frame2 = function ( Image100, event )
					if not event.interrupted then
						Image100:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
					end
					Image100:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( Image100, event )
					else
						Image100:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image100:completeAnimation()
				self.Image100:setAlpha( 0 )
				Image100Frame2( Image100, {} )
				local Image1000Frame2 = function ( Image1000, event )
					local Image1000Frame3 = function ( Image1000, event )
						if not event.interrupted then
							Image1000:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Bounce )
						end
						Image1000:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( Image1000, event )
						else
							Image1000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1000Frame3( Image1000, event )
						return 
					else
						Image1000:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Image1000:registerEventHandler( "transition_complete_keyframe", Image1000Frame3 )
					end
				end
				
				Image1000:completeAnimation()
				self.Image1000:setAlpha( 0 )
				Image1000Frame2( Image1000, {} )
				local Image4Frame2 = function ( Image4, event )
					local Image4Frame3 = function ( Image4, event )
						if not event.interrupted then
							Image4:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						Image4:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image4, event )
						else
							Image4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image4Frame3( Image4, event )
						return 
					else
						Image4:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame3 )
					end
				end
				
				Image4:completeAnimation()
				self.Image4:setAlpha( 0 )
				Image4Frame2( Image4, {} )
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
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				FELabelSubHeadingB0:completeAnimation()
				self.FELabelSubHeadingB0:setAlpha( 0 )
				self.clipFinished( FELabelSubHeadingB0, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )
				accuracyLabel0:completeAnimation()
				self.accuracyLabel0:setAlpha( 0 )
				self.clipFinished( accuracyLabel0, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				TextBox00:completeAnimation()
				self.TextBox00:setAlpha( 0 )
				self.clipFinished( TextBox00, {} )
				Image100:completeAnimation()
				self.Image100:setAlpha( 0 )
				self.clipFinished( Image100, {} )
				Image1000:completeAnimation()
				self.Image1000:setAlpha( 0 )
				self.clipFinished( Image1000, {} )
				Image4:completeAnimation()
				self.Image4:setAlpha( 0 )
				self.clipFinished( Image4, {} )
				cacWpnLvlMeter0:completeAnimation()
				self.cacWpnLvlMeter0:setAlpha( 0 )
				self.clipFinished( cacWpnLvlMeter0, {} )
			end
		}
	}
	self.close = function ( self )
		self.FELabelSubHeadingB0:close()
		self.FETitleNumBrdr0:close()
		self.cacWpnLvlMeter0:close()
		CoD.cac_WpnLvl.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

