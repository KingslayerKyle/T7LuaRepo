-- 9aa02a46d6d9b66b973ecf59b99c8a6d
-- This hash is used for caching, delete to decompile the file again

CoD.codcaster_ScoreLogoWidget = InheritFrom( LUI.UIElement )
CoD.codcaster_ScoreLogoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.codcaster_ScoreLogoWidget )
	self.id = "codcaster_ScoreLogoWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 210 )
	self:setTopBottom( true, false, 0, 67 )
	
	local GlowWhiteOver = LUI.UIImage.new()
	GlowWhiteOver:setLeftRight( true, false, -8, 131.5 )
	GlowWhiteOver:setTopBottom( true, false, -129.98, 178.98 )
	GlowWhiteOver:setAlpha( 0.57 )
	GlowWhiteOver:setZRot( -90 )
	GlowWhiteOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowWhiteOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowWhiteOver )
	self.GlowWhiteOver = GlowWhiteOver
	
	local teamcolor = LUI.UIImage.new()
	teamcolor:setLeftRight( false, false, -105, 105 )
	teamcolor:setTopBottom( true, false, 0, 65 )
	teamcolor:setImage( RegisterImage( "uie_t7_codcaster_colorback" ) )
	self:addElement( teamcolor )
	self.teamcolor = teamcolor
	
	local logobacking = LUI.UIImage.new()
	logobacking:setLeftRight( true, false, 71, 182 )
	logobacking:setTopBottom( true, false, 2, 67 )
	logobacking:setImage( RegisterImage( "uie_t7_codcaster_logobottom" ) )
	self:addElement( logobacking )
	self.logobacking = logobacking
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 92, 171 )
	emblem:setTopBottom( true, false, 5, 63 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, false, 75, 181 )
	logo:setTopBottom( true, false, 4.97, 63.53 )
	logo:setImage( RegisterImage( "uie_t7_codcaster_faction2" ) )
	self:addElement( logo )
	self.logo = logo
	
	local logotopRight = LUI.UIImage.new()
	logotopRight:setLeftRight( true, false, 72, 187 )
	logotopRight:setTopBottom( true, false, 2, 67 )
	logotopRight:setImage( RegisterImage( "uie_t7_codcaster_logotop" ) )
	self:addElement( logotopRight )
	self.logotopRight = logotopRight
	
	local numberbacking = LUI.UIImage.new()
	numberbacking:setLeftRight( true, false, 1, 92 )
	numberbacking:setTopBottom( true, false, 1, 67 )
	numberbacking:setImage( RegisterImage( "uie_t7_codcaster_numberbacking" ) )
	self:addElement( numberbacking )
	self.numberbacking = numberbacking
	
	local teamiconbg = LUI.UIImage.new()
	teamiconbg:setLeftRight( false, false, 61, 85 )
	teamiconbg:setTopBottom( true, false, 1.5, 66.5 )
	teamiconbg:setImage( RegisterImage( "uie_t7_codcaster_blackbar" ) )
	self:addElement( teamiconbg )
	self.teamiconbg = teamiconbg
	
	local testElementFull = LUI.UIImage.new()
	testElementFull:setLeftRight( true, false, -26.5, 216.5 )
	testElementFull:setTopBottom( true, false, -14, 67 )
	testElementFull:setAlpha( 0.5 )
	testElementFull:setYRot( 180 )
	testElementFull:setImage( RegisterImage( "uie_t7_codcaster_teamcolorbar1full" ) )
	self:addElement( testElementFull )
	self.testElementFull = testElementFull
	
	local testElement = LUI.UIImage.new()
	testElement:setLeftRight( true, false, -26.5, 216.5 )
	testElement:setTopBottom( true, false, -14, 67 )
	testElement:setAlpha( 0.7 )
	testElement:setYRot( 180 )
	testElement:setImage( RegisterImage( "uie_t7_codcaster_teamcolorbar1" ) )
	self:addElement( testElement )
	self.testElement = testElement
	
	local testElement0Full = LUI.UIImage.new()
	testElement0Full:setLeftRight( true, false, 26.5, 220 )
	testElement0Full:setTopBottom( true, false, -36, -11.81 )
	testElement0Full:setAlpha( 0.5 )
	testElement0Full:setYRot( 180 )
	testElement0Full:setImage( RegisterImage( "uie_t7_codcaster_teamcolorbar2full" ) )
	self:addElement( testElement0Full )
	self.testElement0Full = testElement0Full
	
	local testElement0 = LUI.UIImage.new()
	testElement0:setLeftRight( true, false, 26.5, 220 )
	testElement0:setTopBottom( true, false, -36, -11.81 )
	testElement0:setAlpha( 0.7 )
	testElement0:setYRot( 180 )
	testElement0:setImage( RegisterImage( "uie_t7_codcaster_teamcolorbar2" ) )
	self:addElement( testElement0 )
	self.testElement0 = testElement0
	
	local FlashElement = LUI.UIImage.new()
	FlashElement:setLeftRight( true, false, -26.5, 216.5 )
	FlashElement:setTopBottom( true, false, -14, 67 )
	FlashElement:setAlpha( 0.5 )
	FlashElement:setYRot( 180 )
	FlashElement:setImage( RegisterImage( "uie_t7_codcaster_teamcolorbar1" ) )
	self:addElement( FlashElement )
	self.FlashElement = FlashElement
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, -18.5, 5.5 )
	Arrow:setTopBottom( true, false, 3, 51 )
	Arrow:setAlpha( 0.8 )
	Arrow:setImage( RegisterImage( "uie_t7_codcaster_teamarrow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setAlpha( 0 )
				self.clipFinished( GlowWhiteOver, {} )

				teamcolor:completeAnimation()
				self.teamcolor:setAlpha( 1 )
				self.clipFinished( teamcolor, {} )

				emblem:completeAnimation()
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )

				logo:completeAnimation()
				self.logo:setAlpha( 1 )
				self.logo:setScale( 1 )
				self.clipFinished( logo, {} )

				testElementFull:completeAnimation()
				self.testElementFull:setAlpha( 0 )
				self.clipFinished( testElementFull, {} )

				testElement:completeAnimation()
				self.testElement:setAlpha( 0 )
				self.clipFinished( testElement, {} )

				testElement0Full:completeAnimation()
				self.testElement0Full:setAlpha( 0 )
				self.clipFinished( testElement0Full, {} )

				testElement0:completeAnimation()
				self.testElement0:setAlpha( 0 )
				self.clipFinished( testElement0, {} )

				FlashElement:completeAnimation()
				self.FlashElement:setAlpha( 0 )
				self.clipFinished( FlashElement, {} )

				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.Arrow:setScale( 1 )
				self.clipFinished( Arrow, {} )
			end
		},
		NonTeamBased = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setAlpha( 0 )
				self.clipFinished( GlowWhiteOver, {} )

				teamcolor:completeAnimation()
				self.teamcolor:setRGB( 1, 1, 1 )
				self.teamcolor:setAlpha( 1 )
				self.clipFinished( teamcolor, {} )

				emblem:completeAnimation()
				self.emblem:setAlpha( 1 )
				self.clipFinished( emblem, {} )

				logo:completeAnimation()
				self.logo:setAlpha( 0 )
				self.clipFinished( logo, {} )

				testElementFull:completeAnimation()
				self.testElementFull:setAlpha( 0 )
				self.clipFinished( testElementFull, {} )

				testElement:completeAnimation()
				self.testElement:setAlpha( 0 )
				self.clipFinished( testElement, {} )

				testElement0Full:completeAnimation()
				self.testElement0Full:setAlpha( 0 )
				self.clipFinished( testElement0Full, {} )

				testElement0:completeAnimation()
				self.testElement0:setAlpha( 0 )
				self.clipFinished( testElement0, {} )

				FlashElement:completeAnimation()
				self.FlashElement:setAlpha( 0 )
				self.clipFinished( FlashElement, {} )

				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
			end
		},
		SpectatingThisTeam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				local GlowWhiteOverFrame2 = function ( GlowWhiteOver, event )
					local GlowWhiteOverFrame3 = function ( GlowWhiteOver, event )
						if not event.interrupted then
							GlowWhiteOver:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
						end
						GlowWhiteOver:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GlowWhiteOver, event )
						else
							GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowWhiteOverFrame3( GlowWhiteOver, event )
						return 
					else
						GlowWhiteOver:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						GlowWhiteOver:setAlpha( 0.9 )
						GlowWhiteOver:registerEventHandler( "transition_complete_keyframe", GlowWhiteOverFrame3 )
					end
				end
				
				GlowWhiteOver:completeAnimation()
				self.GlowWhiteOver:setAlpha( 0 )
				GlowWhiteOverFrame2( GlowWhiteOver, {} )

				teamcolor:completeAnimation()
				self.teamcolor:setAlpha( 1 )
				self.clipFinished( teamcolor, {} )

				emblem:completeAnimation()
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )
				local logoFrame2 = function ( logo, event )
					if not event.interrupted then
						logo:beginAnimation( "keyframe", 289, true, false, CoD.TweenType.Back )
					end
					logo:setAlpha( 1 )
					logo:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( logo, event )
					else
						logo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				logo:completeAnimation()
				self.logo:setAlpha( 1 )
				self.logo:setScale( 1 )
				logoFrame2( logo, {} )
				local testElementFullFrame2 = function ( testElementFull, event )
					if not event.interrupted then
						testElementFull:beginAnimation( "keyframe", 289, true, false, CoD.TweenType.Back )
					end
					testElementFull:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( testElementFull, event )
					else
						testElementFull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				testElementFull:completeAnimation()
				self.testElementFull:setAlpha( 0 )
				testElementFullFrame2( testElementFull, {} )
				local testElementFrame2 = function ( testElement, event )
					if not event.interrupted then
						testElement:beginAnimation( "keyframe", 289, true, false, CoD.TweenType.Back )
					end
					testElement:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( testElement, event )
					else
						testElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				testElement:completeAnimation()
				self.testElement:setAlpha( 0 )
				testElementFrame2( testElement, {} )
				local testElement0FullFrame2 = function ( testElement0Full, event )
					if not event.interrupted then
						testElement0Full:beginAnimation( "keyframe", 289, true, false, CoD.TweenType.Back )
					end
					testElement0Full:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( testElement0Full, event )
					else
						testElement0Full:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				testElement0Full:completeAnimation()
				self.testElement0Full:setAlpha( 0 )
				testElement0FullFrame2( testElement0Full, {} )
				local testElement0Frame2 = function ( testElement0, event )
					if not event.interrupted then
						testElement0:beginAnimation( "keyframe", 289, true, false, CoD.TweenType.Back )
					end
					testElement0:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( testElement0, event )
					else
						testElement0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				testElement0:completeAnimation()
				self.testElement0:setAlpha( 0 )
				testElement0Frame2( testElement0, {} )
				local FlashElementFrame2 = function ( FlashElement, event )
					local FlashElementFrame3 = function ( FlashElement, event )
						if not event.interrupted then
							FlashElement:beginAnimation( "keyframe", 710, false, false, CoD.TweenType.Linear )
						end
						FlashElement:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FlashElement, event )
						else
							FlashElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FlashElementFrame3( FlashElement, event )
						return 
					else
						FlashElement:beginAnimation( "keyframe", 289, true, false, CoD.TweenType.Back )
						FlashElement:setAlpha( 0.35 )
						FlashElement:registerEventHandler( "transition_complete_keyframe", FlashElementFrame3 )
					end
				end
				
				FlashElement:completeAnimation()
				self.FlashElement:setAlpha( 0 )
				FlashElementFrame2( FlashElement, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 289, true, false, CoD.TweenType.Back )
					end
					Arrow:setAlpha( 1 )
					Arrow:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.Arrow:setScale( 0.5 )
				ArrowFrame2( Arrow, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NonTeamBased",
			condition = function ( menu, element, event )
				return not IsGametypeTeambased()
			end
		},
		{
			stateName = "SpectatingThisTeam",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

