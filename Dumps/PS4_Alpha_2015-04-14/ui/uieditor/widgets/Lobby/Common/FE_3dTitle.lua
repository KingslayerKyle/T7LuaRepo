require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleNumber" )

CoD.FE_3dTitle = InheritFrom( LUI.UIElement )
CoD.FE_3dTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_3dTitle )
	self.id = "FE_3dTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 449 )
	self:setTopBottom( true, false, 0, 51 )
	self.anyChildUsesUpdateState = true
	
	local FETitleLineL = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineL:setLeftRight( true, true, 1, -31 )
	FETitleLineL:setTopBottom( false, false, 23, 27 )
	FETitleLineL:setRGB( 1, 1, 1 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local TextBox1 = CoD.FE_3dTitleInternal.new( menu, controller )
	TextBox1:setLeftRight( true, false, -7.38, 603 )
	TextBox1:setTopBottom( true, false, 0, 51 )
	TextBox1:setRGB( 1, 1, 1 )
	TextBox1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox1:setShaderVector( 0, 0.07, 0, 0, 0 )
	TextBox1:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox1.Label0:setText( Engine.Localize( "MULTIPLAYER" ) )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local FETitleLineU = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineU:setLeftRight( true, true, 1, -31 )
	FETitleLineU:setTopBottom( false, false, -25, -21 )
	FETitleLineU:setRGB( 1, 1, 1 )
	self:addElement( FETitleLineU )
	self.FETitleLineU = FETitleLineU
	
	local MPMainSubHeadingContainer0 = CoD.FE_3dTitleNumber.new( menu, controller )
	MPMainSubHeadingContainer0:setLeftRight( true, false, 0, 376 )
	MPMainSubHeadingContainer0:setTopBottom( true, false, 51, 80 )
	MPMainSubHeadingContainer0:setRGB( 1, 1, 1 )
	MPMainSubHeadingContainer0.FELabelSubHeadingA0.Label0:setRGB( 0.58, 0.64, 0.65 )
	MPMainSubHeadingContainer0.FELabelSubHeadingA0.Label0:setText( Engine.Localize( "48,151" ) )
	MPMainSubHeadingContainer0.FELabelSubHeadingA0.Label0:setTTF( "fonts/Entovo.ttf" )
	MPMainSubHeadingContainer0.FE3dTitleNumberGames0.FELabelSubHeadingB0.Label1:setRGB( 0.58, 0.64, 0.65 )
	MPMainSubHeadingContainer0.FE3dTitleNumberGames0.FELabelSubHeadingB0.Label1:setText( Engine.Localize( "MENU_ONLINE_CAPS" ) )
	MPMainSubHeadingContainer0.FE3dTitleNumberGames0.FELabelSubHeadingB0.Label1:setTTF( "fonts/Entovo.ttf" )
	self:addElement( MPMainSubHeadingContainer0 )
	self.MPMainSubHeadingContainer0 = MPMainSubHeadingContainer0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				FETitleLineL:completeAnimation()
				self.FETitleLineL:setRGB( 1, 1, 1 )
				self.clipFinished( FETitleLineL, {} )
				TextBox1:completeAnimation()
				self.TextBox1:setRGB( 1, 1, 1 )
				self.clipFinished( TextBox1, {} )
				FETitleLineU:completeAnimation()
				self.FETitleLineU:setRGB( 1, 1, 1 )
				self.clipFinished( FETitleLineU, {} )
				MPMainSubHeadingContainer0:completeAnimation()
				self.MPMainSubHeadingContainer0:setRGB( 1, 1, 1 )
				self.clipFinished( MPMainSubHeadingContainer0, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )
				local FETitleLineLFrame2 = function ( FETitleLineL, event )
					local FETitleLineLFrame3 = function ( FETitleLineL, event )
						if not event.interrupted then
							FETitleLineL:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						end
						FETitleLineL:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( FETitleLineL, event )
						else
							FETitleLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FETitleLineLFrame3( FETitleLineL, event )
						return 
					else
						FETitleLineL:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
						FETitleLineL:registerEventHandler( "transition_complete_keyframe", FETitleLineLFrame3 )
					end
				end
				
				FETitleLineL:completeAnimation()
				self.FETitleLineL:setRGB( 0, 0, 0 )
				FETitleLineLFrame2( FETitleLineL, {} )
				local TextBox1Frame2 = function ( TextBox1, event )
					local TextBox1Frame3 = function ( TextBox1, event )
						if not event.interrupted then
							TextBox1:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
						end
						TextBox1:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( TextBox1, event )
						else
							TextBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TextBox1Frame3( TextBox1, event )
						return 
					else
						TextBox1:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame3 )
					end
				end
				
				TextBox1:completeAnimation()
				self.TextBox1:setRGB( 0, 0, 0 )
				TextBox1Frame2( TextBox1, {} )
				local FETitleLineUFrame2 = function ( FETitleLineU, event )
					local FETitleLineUFrame3 = function ( FETitleLineU, event )
						if not event.interrupted then
							FETitleLineU:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						end
						FETitleLineU:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( FETitleLineU, event )
						else
							FETitleLineU:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FETitleLineUFrame3( FETitleLineU, event )
						return 
					else
						FETitleLineU:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						FETitleLineU:registerEventHandler( "transition_complete_keyframe", FETitleLineUFrame3 )
					end
				end
				
				FETitleLineU:completeAnimation()
				self.FETitleLineU:setRGB( 0, 0, 0 )
				FETitleLineUFrame2( FETitleLineU, {} )
				local MPMainSubHeadingContainer0Frame2 = function ( MPMainSubHeadingContainer0, event )
					local MPMainSubHeadingContainer0Frame3 = function ( MPMainSubHeadingContainer0, event )
						if not event.interrupted then
							MPMainSubHeadingContainer0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						MPMainSubHeadingContainer0:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( MPMainSubHeadingContainer0, event )
						else
							MPMainSubHeadingContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MPMainSubHeadingContainer0Frame3( MPMainSubHeadingContainer0, event )
						return 
					else
						MPMainSubHeadingContainer0:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
						MPMainSubHeadingContainer0:registerEventHandler( "transition_complete_keyframe", MPMainSubHeadingContainer0Frame3 )
					end
				end
				
				MPMainSubHeadingContainer0:completeAnimation()
				self.MPMainSubHeadingContainer0:setRGB( 0, 0, 0 )
				MPMainSubHeadingContainer0Frame2( MPMainSubHeadingContainer0, {} )
			end
		}
	}
	self.close = function ( self )
		self.FETitleLineL:close()
		self.TextBox1:close()
		self.FETitleLineU:close()
		self.MPMainSubHeadingContainer0:close()
		CoD.FE_3dTitle.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

