require( "ui.uieditor.widgets.Reticles.MP.RipperLockLineWidget" )
require( "ui.uieditor.widgets.Reticles.MP.RipperLockArrowWidget" )

CoD.RipperLockReticle = InheritFrom( LUI.UIElement )
CoD.RipperLockReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RipperLockReticle )
	self.id = "RipperLockReticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 180 )
	
	local GlowLarge = LUI.UIImage.new()
	GlowLarge:setLeftRight( true, false, -18, 198 )
	GlowLarge:setTopBottom( true, false, -18, 198 )
	GlowLarge:setRGB( 1, 0, 0 )
	GlowLarge:setAlpha( 0.77 )
	GlowLarge:setImage( RegisterImage( "uie_ripperlock_glowlarge" ) )
	GlowLarge:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowLarge )
	self.GlowLarge = GlowLarge
	
	local RipperLockLineWidgetUR = CoD.RipperLockLineWidget.new( menu, controller )
	RipperLockLineWidgetUR:setLeftRight( true, false, 105, 201 )
	RipperLockLineWidgetUR:setTopBottom( false, true, -194, -110 )
	self:addElement( RipperLockLineWidgetUR )
	self.RipperLockLineWidgetUR = RipperLockLineWidgetUR
	
	local RipperLockLineWidgetUL = CoD.RipperLockLineWidget.new( menu, controller )
	RipperLockLineWidgetUL:setLeftRight( false, true, -200, -104 )
	RipperLockLineWidgetUL:setTopBottom( false, true, -194, -110 )
	RipperLockLineWidgetUL:setZRot( 90 )
	self:addElement( RipperLockLineWidgetUL )
	self.RipperLockLineWidgetUL = RipperLockLineWidgetUL
	
	local RipperLockLineWidgetLR = CoD.RipperLockLineWidget.new( menu, controller )
	RipperLockLineWidgetLR:setLeftRight( true, false, 105, 201 )
	RipperLockLineWidgetLR:setTopBottom( true, false, 110, 194 )
	RipperLockLineWidgetLR:setZRot( -90 )
	self:addElement( RipperLockLineWidgetLR )
	self.RipperLockLineWidgetLR = RipperLockLineWidgetLR
	
	local RipperLockLineWidgetLL = CoD.RipperLockLineWidget.new( menu, controller )
	RipperLockLineWidgetLL:setLeftRight( false, true, -200, -104 )
	RipperLockLineWidgetLL:setTopBottom( true, false, 110, 194 )
	RipperLockLineWidgetLL:setZRot( 180 )
	self:addElement( RipperLockLineWidgetLL )
	self.RipperLockLineWidgetLL = RipperLockLineWidgetLL
	
	local RipperLockArrowWidgetTop = CoD.RipperLockArrowWidget.new( menu, controller )
	RipperLockArrowWidgetTop:setLeftRight( true, false, 66, 114 )
	RipperLockArrowWidgetTop:setTopBottom( true, false, 14, 53 )
	self:addElement( RipperLockArrowWidgetTop )
	self.RipperLockArrowWidgetTop = RipperLockArrowWidgetTop
	
	local RipperLockArrowWidgetBottom = CoD.RipperLockArrowWidget.new( menu, controller )
	RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
	RipperLockArrowWidgetBottom:setTopBottom( true, false, 129, 168 )
	RipperLockArrowWidgetBottom:setZRot( 180 )
	self:addElement( RipperLockArrowWidgetBottom )
	self.RipperLockArrowWidgetBottom = RipperLockArrowWidgetBottom
	
	local RipperLockArrowWidgetLeft = CoD.RipperLockArrowWidget.new( menu, controller )
	RipperLockArrowWidgetLeft:setLeftRight( true, false, 9, 57 )
	RipperLockArrowWidgetLeft:setTopBottom( true, false, 71, 110 )
	RipperLockArrowWidgetLeft:setZRot( 90 )
	self:addElement( RipperLockArrowWidgetLeft )
	self.RipperLockArrowWidgetLeft = RipperLockArrowWidgetLeft
	
	local RipperLockArrowWidgetRight = CoD.RipperLockArrowWidget.new( menu, controller )
	RipperLockArrowWidgetRight:setLeftRight( true, false, 125, 173 )
	RipperLockArrowWidgetRight:setTopBottom( true, false, 71, 110 )
	RipperLockArrowWidgetRight:setZRot( -90 )
	self:addElement( RipperLockArrowWidgetRight )
	self.RipperLockArrowWidgetRight = RipperLockArrowWidgetRight
	
	local GlowSmall = LUI.UIImage.new()
	GlowSmall:setLeftRight( true, false, 41, 140 )
	GlowSmall:setTopBottom( true, false, 41.39, 140.61 )
	GlowSmall:setRGB( 1, 0, 0 )
	GlowSmall:setImage( RegisterImage( "uie_ripperlock_glowsmall" ) )
	GlowSmall:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmall )
	self.GlowSmall = GlowSmall
	
	local GlowSmall0 = LUI.UIImage.new()
	GlowSmall0:setLeftRight( true, false, 50, 131 )
	GlowSmall0:setTopBottom( true, false, 49, 131 )
	GlowSmall0:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	GlowSmall0:setAlpha( 0.91 )
	GlowSmall0:setImage( RegisterImage( "uie_ripperlock_glowsmall_notadd" ) )
	self:addElement( GlowSmall0 )
	self.GlowSmall0 = GlowSmall0
	
	local GlowSmall00 = LUI.UIImage.new()
	GlowSmall00:setLeftRight( true, false, 41, 140 )
	GlowSmall00:setTopBottom( true, false, 40.39, 140.61 )
	GlowSmall00:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	GlowSmall00:setAlpha( 0 )
	GlowSmall00:setImage( RegisterImage( "uie_ripperlock_glowsmall_notadd" ) )
	GlowSmall00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowSmall00 )
	self.GlowSmall00 = GlowSmall00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				GlowLarge:completeAnimation()
				self.GlowLarge:setAlpha( 0 )
				self.GlowLarge:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( GlowLarge, {} )
				RipperLockLineWidgetUR:completeAnimation()
				self.RipperLockLineWidgetUR:setAlpha( 0 )
				self.clipFinished( RipperLockLineWidgetUR, {} )
				RipperLockLineWidgetUL:completeAnimation()
				self.RipperLockLineWidgetUL:setAlpha( 0 )
				self.clipFinished( RipperLockLineWidgetUL, {} )
				RipperLockLineWidgetLR:completeAnimation()
				self.RipperLockLineWidgetLR:setAlpha( 0 )
				self.clipFinished( RipperLockLineWidgetLR, {} )
				RipperLockLineWidgetLL:completeAnimation()
				self.RipperLockLineWidgetLL:setAlpha( 0 )
				self.clipFinished( RipperLockLineWidgetLL, {} )
				RipperLockArrowWidgetTop:completeAnimation()
				self.RipperLockArrowWidgetTop:setAlpha( 0 )
				self.clipFinished( RipperLockArrowWidgetTop, {} )
				RipperLockArrowWidgetBottom:completeAnimation()
				self.RipperLockArrowWidgetBottom:setAlpha( 0 )
				self.clipFinished( RipperLockArrowWidgetBottom, {} )
				RipperLockArrowWidgetLeft:completeAnimation()
				self.RipperLockArrowWidgetLeft:setAlpha( 0 )
				self.clipFinished( RipperLockArrowWidgetLeft, {} )
				RipperLockArrowWidgetRight:completeAnimation()
				self.RipperLockArrowWidgetRight:setAlpha( 0 )
				self.clipFinished( RipperLockArrowWidgetRight, {} )
				GlowSmall:completeAnimation()
				self.GlowSmall:setAlpha( 0 )
				self.clipFinished( GlowSmall, {} )
				GlowSmall0:completeAnimation()
				self.GlowSmall0:setAlpha( 0 )
				self.clipFinished( GlowSmall0, {} )
				GlowSmall00:completeAnimation()
				self.GlowSmall00:setAlpha( 0 )
				self.clipFinished( GlowSmall00, {} )
			end,
			Locked = function ()
				self:setupElementClipCounter( 12 )
				local GlowLargeFrame2 = function ( GlowLarge, event )
					if not event.interrupted then
						GlowLarge:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					GlowLarge:setRGB( 1, 0, 0 )
					GlowLarge:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( GlowLarge, event )
					else
						GlowLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowLarge:completeAnimation()
				self.GlowLarge:setRGB( 1, 0, 0 )
				self.GlowLarge:setAlpha( 0 )
				GlowLargeFrame2( GlowLarge, {} )
				local RipperLockLineWidgetURFrame2 = function ( RipperLockLineWidgetUR, event )
					local RipperLockLineWidgetURFrame3 = function ( RipperLockLineWidgetUR, event )
						local RipperLockLineWidgetURFrame4 = function ( RipperLockLineWidgetUR, event )
							if not event.interrupted then
								RipperLockLineWidgetUR:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							end
							RipperLockLineWidgetUR:setLeftRight( true, false, 105, 201 )
							RipperLockLineWidgetUR:setTopBottom( false, true, -194, -110 )
							RipperLockLineWidgetUR:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockLineWidgetUR, event )
							else
								RipperLockLineWidgetUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockLineWidgetURFrame4( RipperLockLineWidgetUR, event )
							return 
						else
							RipperLockLineWidgetUR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							RipperLockLineWidgetUR:setAlpha( 0.5 )
							RipperLockLineWidgetUR:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetURFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockLineWidgetURFrame3( RipperLockLineWidgetUR, event )
						return 
					else
						RipperLockLineWidgetUR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						RipperLockLineWidgetUR:setLeftRight( true, false, 105, 201 )
						RipperLockLineWidgetUR:setTopBottom( false, true, -194, -110 )
						RipperLockLineWidgetUR:setAlpha( 1 )
						RipperLockLineWidgetUR:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetURFrame3 )
					end
				end
				
				RipperLockLineWidgetUR:completeAnimation()
				self.RipperLockLineWidgetUR:setLeftRight( true, false, 120, 216 )
				self.RipperLockLineWidgetUR:setTopBottom( false, true, -209, -125 )
				self.RipperLockLineWidgetUR:setAlpha( 0 )
				RipperLockLineWidgetURFrame2( RipperLockLineWidgetUR, {} )
				local RipperLockLineWidgetULFrame2 = function ( RipperLockLineWidgetUL, event )
					local RipperLockLineWidgetULFrame3 = function ( RipperLockLineWidgetUL, event )
						local RipperLockLineWidgetULFrame4 = function ( RipperLockLineWidgetUL, event )
							if not event.interrupted then
								RipperLockLineWidgetUL:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							end
							RipperLockLineWidgetUL:setLeftRight( false, true, -200, -104 )
							RipperLockLineWidgetUL:setTopBottom( false, true, -194, -110 )
							RipperLockLineWidgetUL:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockLineWidgetUL, event )
							else
								RipperLockLineWidgetUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockLineWidgetULFrame4( RipperLockLineWidgetUL, event )
							return 
						else
							RipperLockLineWidgetUL:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							RipperLockLineWidgetUL:setAlpha( 0.5 )
							RipperLockLineWidgetUL:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetULFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockLineWidgetULFrame3( RipperLockLineWidgetUL, event )
						return 
					else
						RipperLockLineWidgetUL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						RipperLockLineWidgetUL:setLeftRight( false, true, -200, -104 )
						RipperLockLineWidgetUL:setTopBottom( false, true, -194, -110 )
						RipperLockLineWidgetUL:setAlpha( 1 )
						RipperLockLineWidgetUL:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetULFrame3 )
					end
				end
				
				RipperLockLineWidgetUL:completeAnimation()
				self.RipperLockLineWidgetUL:setLeftRight( false, true, -215, -119 )
				self.RipperLockLineWidgetUL:setTopBottom( false, true, -209, -125 )
				self.RipperLockLineWidgetUL:setAlpha( 0 )
				RipperLockLineWidgetULFrame2( RipperLockLineWidgetUL, {} )
				local RipperLockLineWidgetLRFrame2 = function ( RipperLockLineWidgetLR, event )
					local RipperLockLineWidgetLRFrame3 = function ( RipperLockLineWidgetLR, event )
						local RipperLockLineWidgetLRFrame4 = function ( RipperLockLineWidgetLR, event )
							if not event.interrupted then
								RipperLockLineWidgetLR:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							end
							RipperLockLineWidgetLR:setLeftRight( true, false, 105, 201 )
							RipperLockLineWidgetLR:setTopBottom( true, false, 110, 194 )
							RipperLockLineWidgetLR:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockLineWidgetLR, event )
							else
								RipperLockLineWidgetLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockLineWidgetLRFrame4( RipperLockLineWidgetLR, event )
							return 
						else
							RipperLockLineWidgetLR:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							RipperLockLineWidgetLR:setAlpha( 0.5 )
							RipperLockLineWidgetLR:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetLRFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockLineWidgetLRFrame3( RipperLockLineWidgetLR, event )
						return 
					else
						RipperLockLineWidgetLR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						RipperLockLineWidgetLR:setLeftRight( true, false, 105, 201 )
						RipperLockLineWidgetLR:setTopBottom( true, false, 110, 194 )
						RipperLockLineWidgetLR:setAlpha( 1 )
						RipperLockLineWidgetLR:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetLRFrame3 )
					end
				end
				
				RipperLockLineWidgetLR:completeAnimation()
				self.RipperLockLineWidgetLR:setLeftRight( true, false, 120, 216 )
				self.RipperLockLineWidgetLR:setTopBottom( true, false, 125, 209 )
				self.RipperLockLineWidgetLR:setAlpha( 0 )
				RipperLockLineWidgetLRFrame2( RipperLockLineWidgetLR, {} )
				local RipperLockLineWidgetLLFrame2 = function ( RipperLockLineWidgetLL, event )
					local RipperLockLineWidgetLLFrame3 = function ( RipperLockLineWidgetLL, event )
						local RipperLockLineWidgetLLFrame4 = function ( RipperLockLineWidgetLL, event )
							if not event.interrupted then
								RipperLockLineWidgetLL:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							end
							RipperLockLineWidgetLL:setLeftRight( false, true, -200, -104 )
							RipperLockLineWidgetLL:setTopBottom( true, false, 110, 194 )
							RipperLockLineWidgetLL:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockLineWidgetLL, event )
							else
								RipperLockLineWidgetLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockLineWidgetLLFrame4( RipperLockLineWidgetLL, event )
							return 
						else
							RipperLockLineWidgetLL:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							RipperLockLineWidgetLL:setAlpha( 0.5 )
							RipperLockLineWidgetLL:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetLLFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockLineWidgetLLFrame3( RipperLockLineWidgetLL, event )
						return 
					else
						RipperLockLineWidgetLL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						RipperLockLineWidgetLL:setLeftRight( false, true, -200, -104 )
						RipperLockLineWidgetLL:setTopBottom( true, false, 110, 194 )
						RipperLockLineWidgetLL:setAlpha( 1 )
						RipperLockLineWidgetLL:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetLLFrame3 )
					end
				end
				
				RipperLockLineWidgetLL:completeAnimation()
				self.RipperLockLineWidgetLL:setLeftRight( false, true, -215, -119 )
				self.RipperLockLineWidgetLL:setTopBottom( true, false, 125, 209 )
				self.RipperLockLineWidgetLL:setAlpha( 0 )
				RipperLockLineWidgetLLFrame2( RipperLockLineWidgetLL, {} )
				local RipperLockArrowWidgetTopFrame2 = function ( RipperLockArrowWidgetTop, event )
					local RipperLockArrowWidgetTopFrame3 = function ( RipperLockArrowWidgetTop, event )
						local RipperLockArrowWidgetTopFrame4 = function ( RipperLockArrowWidgetTop, event )
							if not event.interrupted then
								RipperLockArrowWidgetTop:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetTop:setLeftRight( true, false, 66, 114 )
							RipperLockArrowWidgetTop:setTopBottom( true, false, 14, 53 )
							RipperLockArrowWidgetTop:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetTop, event )
							else
								RipperLockArrowWidgetTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetTopFrame4( RipperLockArrowWidgetTop, event )
							return 
						else
							RipperLockArrowWidgetTop:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							RipperLockArrowWidgetTop:setTopBottom( true, false, -1.75, 37.25 )
							RipperLockArrowWidgetTop:setAlpha( 0 )
							RipperLockArrowWidgetTop:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetTopFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetTopFrame3( RipperLockArrowWidgetTop, event )
						return 
					else
						RipperLockArrowWidgetTop:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetTop:setAlpha( 1 )
						RipperLockArrowWidgetTop:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetTopFrame3 )
					end
				end
				
				RipperLockArrowWidgetTop:completeAnimation()
				self.RipperLockArrowWidgetTop:setLeftRight( true, false, 66, 114 )
				self.RipperLockArrowWidgetTop:setTopBottom( true, false, -13, 26 )
				self.RipperLockArrowWidgetTop:setAlpha( 0 )
				RipperLockArrowWidgetTopFrame2( RipperLockArrowWidgetTop, {} )
				local RipperLockArrowWidgetBottomFrame2 = function ( RipperLockArrowWidgetBottom, event )
					local RipperLockArrowWidgetBottomFrame3 = function ( RipperLockArrowWidgetBottom, event )
						local RipperLockArrowWidgetBottomFrame4 = function ( RipperLockArrowWidgetBottom, event )
							if not event.interrupted then
								RipperLockArrowWidgetBottom:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
							RipperLockArrowWidgetBottom:setTopBottom( true, false, 129, 168 )
							RipperLockArrowWidgetBottom:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetBottom, event )
							else
								RipperLockArrowWidgetBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetBottomFrame4( RipperLockArrowWidgetBottom, event )
							return 
						else
							RipperLockArrowWidgetBottom:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							RipperLockArrowWidgetBottom:setTopBottom( true, false, 143.58, 182.58 )
							RipperLockArrowWidgetBottom:setAlpha( 0 )
							RipperLockArrowWidgetBottom:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetBottomFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetBottomFrame3( RipperLockArrowWidgetBottom, event )
						return 
					else
						RipperLockArrowWidgetBottom:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetBottom:setAlpha( 1 )
						RipperLockArrowWidgetBottom:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetBottomFrame3 )
					end
				end
				
				RipperLockArrowWidgetBottom:completeAnimation()
				self.RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
				self.RipperLockArrowWidgetBottom:setTopBottom( true, false, 154, 193 )
				self.RipperLockArrowWidgetBottom:setAlpha( 0 )
				RipperLockArrowWidgetBottomFrame2( RipperLockArrowWidgetBottom, {} )
				local RipperLockArrowWidgetLeftFrame2 = function ( RipperLockArrowWidgetLeft, event )
					local RipperLockArrowWidgetLeftFrame3 = function ( RipperLockArrowWidgetLeft, event )
						local RipperLockArrowWidgetLeftFrame4 = function ( RipperLockArrowWidgetLeft, event )
							if not event.interrupted then
								RipperLockArrowWidgetLeft:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetLeft:setLeftRight( true, false, 9, 57 )
							RipperLockArrowWidgetLeft:setTopBottom( true, false, 71, 110 )
							RipperLockArrowWidgetLeft:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetLeft, event )
							else
								RipperLockArrowWidgetLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetLeftFrame4( RipperLockArrowWidgetLeft, event )
							return 
						else
							RipperLockArrowWidgetLeft:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							RipperLockArrowWidgetLeft:setLeftRight( true, false, -6.75, 41.25 )
							RipperLockArrowWidgetLeft:setAlpha( 0 )
							RipperLockArrowWidgetLeft:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetLeftFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetLeftFrame3( RipperLockArrowWidgetLeft, event )
						return 
					else
						RipperLockArrowWidgetLeft:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetLeft:setAlpha( 1 )
						RipperLockArrowWidgetLeft:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetLeftFrame3 )
					end
				end
				
				RipperLockArrowWidgetLeft:completeAnimation()
				self.RipperLockArrowWidgetLeft:setLeftRight( true, false, -18, 30 )
				self.RipperLockArrowWidgetLeft:setTopBottom( true, false, 71, 110 )
				self.RipperLockArrowWidgetLeft:setAlpha( 0 )
				RipperLockArrowWidgetLeftFrame2( RipperLockArrowWidgetLeft, {} )
				local RipperLockArrowWidgetRightFrame2 = function ( RipperLockArrowWidgetRight, event )
					local RipperLockArrowWidgetRightFrame3 = function ( RipperLockArrowWidgetRight, event )
						local RipperLockArrowWidgetRightFrame4 = function ( RipperLockArrowWidgetRight, event )
							if not event.interrupted then
								RipperLockArrowWidgetRight:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetRight:setLeftRight( true, false, 125, 173 )
							RipperLockArrowWidgetRight:setTopBottom( true, false, 71, 110 )
							RipperLockArrowWidgetRight:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetRight, event )
							else
								RipperLockArrowWidgetRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetRightFrame4( RipperLockArrowWidgetRight, event )
							return 
						else
							RipperLockArrowWidgetRight:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							RipperLockArrowWidgetRight:setLeftRight( true, false, 139.58, 187.58 )
							RipperLockArrowWidgetRight:setAlpha( 0 )
							RipperLockArrowWidgetRight:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetRightFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetRightFrame3( RipperLockArrowWidgetRight, event )
						return 
					else
						RipperLockArrowWidgetRight:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetRight:setAlpha( 1 )
						RipperLockArrowWidgetRight:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetRightFrame3 )
					end
				end
				
				RipperLockArrowWidgetRight:completeAnimation()
				self.RipperLockArrowWidgetRight:setLeftRight( true, false, 150, 198 )
				self.RipperLockArrowWidgetRight:setTopBottom( true, false, 71, 110 )
				self.RipperLockArrowWidgetRight:setAlpha( 0 )
				RipperLockArrowWidgetRightFrame2( RipperLockArrowWidgetRight, {} )
				local GlowSmallFrame2 = function ( GlowSmall, event )
					if not event.interrupted then
						GlowSmall:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					GlowSmall:setAlpha( 1 )
					GlowSmall:setXRot( 0 )
					if event.interrupted then
						self.clipFinished( GlowSmall, event )
					else
						GlowSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowSmall:completeAnimation()
				self.GlowSmall:setAlpha( 0 )
				self.GlowSmall:setXRot( 0 )
				GlowSmallFrame2( GlowSmall, {} )
				local GlowSmall0Frame2 = function ( GlowSmall0, event )
					if not event.interrupted then
						GlowSmall0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					GlowSmall0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( GlowSmall0, event )
					else
						GlowSmall0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowSmall0:completeAnimation()
				self.GlowSmall0:setAlpha( 0 )
				GlowSmall0Frame2( GlowSmall0, {} )
				local GlowSmall00Frame2 = function ( GlowSmall00, event )
					local GlowSmall00Frame3 = function ( GlowSmall00, event )
						if not event.interrupted then
							GlowSmall00:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						GlowSmall00:setAlpha( 1 )
						GlowSmall00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
						if event.interrupted then
							self.clipFinished( GlowSmall00, event )
						else
							GlowSmall00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowSmall00Frame3( GlowSmall00, event )
						return 
					else
						GlowSmall00:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						GlowSmall00:setAlpha( 0.93 )
						GlowSmall00:registerEventHandler( "transition_complete_keyframe", GlowSmall00Frame3 )
					end
				end
				
				GlowSmall00:completeAnimation()
				self.GlowSmall00:setAlpha( 0 )
				self.GlowSmall00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				GlowSmall00Frame2( GlowSmall00, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				RipperLockLineWidgetUR:completeAnimation()
				self.RipperLockLineWidgetUR:setLeftRight( true, false, 105, 201 )
				self.RipperLockLineWidgetUR:setTopBottom( false, true, -194, -110 )
				self.RipperLockLineWidgetUR:setAlpha( 1 )
				self.clipFinished( RipperLockLineWidgetUR, {} )
				RipperLockLineWidgetUL:completeAnimation()
				self.RipperLockLineWidgetUL:setLeftRight( false, true, -200, -104 )
				self.RipperLockLineWidgetUL:setTopBottom( false, true, -194, -110 )
				self.clipFinished( RipperLockLineWidgetUL, {} )
				RipperLockLineWidgetLR:completeAnimation()
				self.RipperLockLineWidgetLR:setLeftRight( true, false, 105, 201 )
				self.RipperLockLineWidgetLR:setTopBottom( true, false, 110, 194 )
				self.clipFinished( RipperLockLineWidgetLR, {} )
				RipperLockLineWidgetLL:completeAnimation()
				self.RipperLockLineWidgetLL:setLeftRight( false, true, -200, -104 )
				self.RipperLockLineWidgetLL:setTopBottom( true, false, 110, 194 )
				self.clipFinished( RipperLockLineWidgetLL, {} )
				RipperLockArrowWidgetTop:completeAnimation()
				self.RipperLockArrowWidgetTop:setLeftRight( true, false, 66, 114 )
				self.RipperLockArrowWidgetTop:setTopBottom( true, false, 14, 53 )
				self.clipFinished( RipperLockArrowWidgetTop, {} )
				RipperLockArrowWidgetBottom:completeAnimation()
				self.RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
				self.RipperLockArrowWidgetBottom:setTopBottom( true, false, 129, 168 )
				self.clipFinished( RipperLockArrowWidgetBottom, {} )
				RipperLockArrowWidgetLeft:completeAnimation()
				self.RipperLockArrowWidgetLeft:setLeftRight( true, false, 9, 57 )
				self.RipperLockArrowWidgetLeft:setTopBottom( true, false, 71, 110 )
				self.clipFinished( RipperLockArrowWidgetLeft, {} )
				RipperLockArrowWidgetRight:completeAnimation()
				self.RipperLockArrowWidgetRight:setLeftRight( true, false, 125, 173 )
				self.RipperLockArrowWidgetRight:setTopBottom( true, false, 71, 110 )
				self.clipFinished( RipperLockArrowWidgetRight, {} )
				GlowSmall:completeAnimation()
				self.GlowSmall:setRGB( 0.84, 0.01, 0 )
				self.clipFinished( GlowSmall, {} )
				GlowSmall0:completeAnimation()
				self.GlowSmall0:setAlpha( 1 )
				self.clipFinished( GlowSmall0, {} )
				GlowSmall00:completeAnimation()
				self.GlowSmall00:setAlpha( 1 )
				self.clipFinished( GlowSmall00, {} )
			end,
			Attack = function ()
				self:setupElementClipCounter( 12 )
				GlowLarge:completeAnimation()
				self.GlowLarge:setLeftRight( true, false, -18, 198 )
				self.GlowLarge:setTopBottom( true, false, -18, 198 )
				self.clipFinished( GlowLarge, {} )
				local RipperLockLineWidgetURFrame2 = function ( RipperLockLineWidgetUR, event )
					if not event.interrupted then
						RipperLockLineWidgetUR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RipperLockLineWidgetUR:setLeftRight( true, false, 73, 169 )
					RipperLockLineWidgetUR:setTopBottom( false, true, -162, -78 )
					if event.interrupted then
						self.clipFinished( RipperLockLineWidgetUR, event )
					else
						RipperLockLineWidgetUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockLineWidgetUR:completeAnimation()
				self.RipperLockLineWidgetUR:setLeftRight( true, false, 105, 201 )
				self.RipperLockLineWidgetUR:setTopBottom( false, true, -194, -110 )
				RipperLockLineWidgetURFrame2( RipperLockLineWidgetUR, {} )
				local RipperLockLineWidgetULFrame2 = function ( RipperLockLineWidgetUL, event )
					if not event.interrupted then
						RipperLockLineWidgetUL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RipperLockLineWidgetUL:setLeftRight( false, true, -167, -71 )
					RipperLockLineWidgetUL:setTopBottom( false, true, -162, -78 )
					if event.interrupted then
						self.clipFinished( RipperLockLineWidgetUL, event )
					else
						RipperLockLineWidgetUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockLineWidgetUL:completeAnimation()
				self.RipperLockLineWidgetUL:setLeftRight( false, true, -200, -104 )
				self.RipperLockLineWidgetUL:setTopBottom( false, true, -194, -110 )
				RipperLockLineWidgetULFrame2( RipperLockLineWidgetUL, {} )
				local RipperLockLineWidgetLRFrame2 = function ( RipperLockLineWidgetLR, event )
					if not event.interrupted then
						RipperLockLineWidgetLR:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RipperLockLineWidgetLR:setLeftRight( true, false, 73, 169 )
					RipperLockLineWidgetLR:setTopBottom( true, false, 80, 164 )
					if event.interrupted then
						self.clipFinished( RipperLockLineWidgetLR, event )
					else
						RipperLockLineWidgetLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockLineWidgetLR:completeAnimation()
				self.RipperLockLineWidgetLR:setLeftRight( true, false, 105, 201 )
				self.RipperLockLineWidgetLR:setTopBottom( true, false, 110, 194 )
				RipperLockLineWidgetLRFrame2( RipperLockLineWidgetLR, {} )
				local RipperLockLineWidgetLLFrame2 = function ( RipperLockLineWidgetLL, event )
					if not event.interrupted then
						RipperLockLineWidgetLL:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					RipperLockLineWidgetLL:setLeftRight( false, true, -167, -71 )
					RipperLockLineWidgetLL:setTopBottom( true, false, 76, 160 )
					if event.interrupted then
						self.clipFinished( RipperLockLineWidgetLL, event )
					else
						RipperLockLineWidgetLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockLineWidgetLL:completeAnimation()
				self.RipperLockLineWidgetLL:setLeftRight( false, true, -200, -104 )
				self.RipperLockLineWidgetLL:setTopBottom( true, false, 110, 194 )
				RipperLockLineWidgetLLFrame2( RipperLockLineWidgetLL, {} )
				local RipperLockArrowWidgetTopFrame2 = function ( RipperLockArrowWidgetTop, event )
					local RipperLockArrowWidgetTopFrame3 = function ( RipperLockArrowWidgetTop, event )
						local RipperLockArrowWidgetTopFrame4 = function ( RipperLockArrowWidgetTop, event )
							if not event.interrupted then
								RipperLockArrowWidgetTop:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetTop:setLeftRight( true, false, 67, 115 )
							RipperLockArrowWidgetTop:setTopBottom( true, false, 49, 88 )
							RipperLockArrowWidgetTop:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetTop, event )
							else
								RipperLockArrowWidgetTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetTopFrame4( RipperLockArrowWidgetTop, event )
							return 
						else
							RipperLockArrowWidgetTop:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							RipperLockArrowWidgetTop:setLeftRight( true, false, 66.75, 114.75 )
							RipperLockArrowWidgetTop:setTopBottom( true, false, 40.25, 79.25 )
							RipperLockArrowWidgetTop:setAlpha( 0 )
							RipperLockArrowWidgetTop:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetTopFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetTopFrame3( RipperLockArrowWidgetTop, event )
						return 
					else
						RipperLockArrowWidgetTop:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetTop:setLeftRight( true, false, 66.5, 114.5 )
						RipperLockArrowWidgetTop:setTopBottom( true, false, 31.5, 70.5 )
						RipperLockArrowWidgetTop:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetTopFrame3 )
					end
				end
				
				RipperLockArrowWidgetTop:completeAnimation()
				self.RipperLockArrowWidgetTop:setLeftRight( true, false, 66, 114 )
				self.RipperLockArrowWidgetTop:setTopBottom( true, false, 14, 53 )
				self.RipperLockArrowWidgetTop:setAlpha( 1 )
				RipperLockArrowWidgetTopFrame2( RipperLockArrowWidgetTop, {} )
				local RipperLockArrowWidgetBottomFrame2 = function ( RipperLockArrowWidgetBottom, event )
					local RipperLockArrowWidgetBottomFrame3 = function ( RipperLockArrowWidgetBottom, event )
						local RipperLockArrowWidgetBottomFrame4 = function ( RipperLockArrowWidgetBottom, event )
							if not event.interrupted then
								RipperLockArrowWidgetBottom:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
							RipperLockArrowWidgetBottom:setTopBottom( true, false, 93, 132 )
							RipperLockArrowWidgetBottom:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetBottom, event )
							else
								RipperLockArrowWidgetBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetBottomFrame4( RipperLockArrowWidgetBottom, event )
							return 
						else
							RipperLockArrowWidgetBottom:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							RipperLockArrowWidgetBottom:setTopBottom( true, false, 102, 141 )
							RipperLockArrowWidgetBottom:setAlpha( 0 )
							RipperLockArrowWidgetBottom:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetBottomFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetBottomFrame3( RipperLockArrowWidgetBottom, event )
						return 
					else
						RipperLockArrowWidgetBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetBottom:setTopBottom( true, false, 111, 150 )
						RipperLockArrowWidgetBottom:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetBottomFrame3 )
					end
				end
				
				RipperLockArrowWidgetBottom:completeAnimation()
				self.RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
				self.RipperLockArrowWidgetBottom:setTopBottom( true, false, 129, 168 )
				self.RipperLockArrowWidgetBottom:setAlpha( 1 )
				RipperLockArrowWidgetBottomFrame2( RipperLockArrowWidgetBottom, {} )
				local RipperLockArrowWidgetLeftFrame2 = function ( RipperLockArrowWidgetLeft, event )
					local RipperLockArrowWidgetLeftFrame3 = function ( RipperLockArrowWidgetLeft, event )
						local RipperLockArrowWidgetLeftFrame4 = function ( RipperLockArrowWidgetLeft, event )
							if not event.interrupted then
								RipperLockArrowWidgetLeft:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetLeft:setLeftRight( true, false, 43, 91 )
							RipperLockArrowWidgetLeft:setTopBottom( true, false, 70, 109 )
							RipperLockArrowWidgetLeft:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetLeft, event )
							else
								RipperLockArrowWidgetLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetLeftFrame4( RipperLockArrowWidgetLeft, event )
							return 
						else
							RipperLockArrowWidgetLeft:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							RipperLockArrowWidgetLeft:setLeftRight( true, false, 34.5, 82.5 )
							RipperLockArrowWidgetLeft:setTopBottom( true, false, 70.25, 109.25 )
							RipperLockArrowWidgetLeft:setAlpha( 0 )
							RipperLockArrowWidgetLeft:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetLeftFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetLeftFrame3( RipperLockArrowWidgetLeft, event )
						return 
					else
						RipperLockArrowWidgetLeft:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetLeft:setLeftRight( true, false, 26, 74 )
						RipperLockArrowWidgetLeft:setTopBottom( true, false, 70.5, 109.5 )
						RipperLockArrowWidgetLeft:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetLeftFrame3 )
					end
				end
				
				RipperLockArrowWidgetLeft:completeAnimation()
				self.RipperLockArrowWidgetLeft:setLeftRight( true, false, 9, 57 )
				self.RipperLockArrowWidgetLeft:setTopBottom( true, false, 71, 110 )
				self.RipperLockArrowWidgetLeft:setAlpha( 1 )
				RipperLockArrowWidgetLeftFrame2( RipperLockArrowWidgetLeft, {} )
				local RipperLockArrowWidgetRightFrame2 = function ( RipperLockArrowWidgetRight, event )
					local RipperLockArrowWidgetRightFrame3 = function ( RipperLockArrowWidgetRight, event )
						local RipperLockArrowWidgetRightFrame4 = function ( RipperLockArrowWidgetRight, event )
							if not event.interrupted then
								RipperLockArrowWidgetRight:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetRight:setLeftRight( true, false, 90, 138 )
							RipperLockArrowWidgetRight:setTopBottom( true, false, 72, 111 )
							RipperLockArrowWidgetRight:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetRight, event )
							else
								RipperLockArrowWidgetRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetRightFrame4( RipperLockArrowWidgetRight, event )
							return 
						else
							RipperLockArrowWidgetRight:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Bounce )
							RipperLockArrowWidgetRight:setLeftRight( true, false, 98.75, 146.75 )
							RipperLockArrowWidgetRight:setTopBottom( true, false, 71.75, 110.75 )
							RipperLockArrowWidgetRight:setAlpha( 0 )
							RipperLockArrowWidgetRight:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetRightFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetRightFrame3( RipperLockArrowWidgetRight, event )
						return 
					else
						RipperLockArrowWidgetRight:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetRight:setLeftRight( true, false, 107.5, 155.5 )
						RipperLockArrowWidgetRight:setTopBottom( true, false, 71.5, 110.5 )
						RipperLockArrowWidgetRight:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetRightFrame3 )
					end
				end
				
				RipperLockArrowWidgetRight:completeAnimation()
				self.RipperLockArrowWidgetRight:setLeftRight( true, false, 125, 173 )
				self.RipperLockArrowWidgetRight:setTopBottom( true, false, 71, 110 )
				self.RipperLockArrowWidgetRight:setAlpha( 1 )
				RipperLockArrowWidgetRightFrame2( RipperLockArrowWidgetRight, {} )
				GlowSmall:completeAnimation()
				self.GlowSmall:setLeftRight( true, false, 50, 131 )
				self.GlowSmall:setTopBottom( true, false, 51, 132 )
				self.GlowSmall:setRGB( 1, 0.12, 0 )
				self.GlowSmall:setAlpha( 0.72 )
				self.clipFinished( GlowSmall, {} )
				GlowSmall0:completeAnimation()
				self.GlowSmall0:setAlpha( 0.91 )
				self.clipFinished( GlowSmall0, {} )
				GlowSmall00:completeAnimation()
				self.GlowSmall00:setAlpha( 1 )
				self.clipFinished( GlowSmall00, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 12 )
				local GlowLargeFrame2 = function ( GlowLarge, event )
					if not event.interrupted then
						GlowLarge:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					GlowLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowLarge, event )
					else
						GlowLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowLarge:completeAnimation()
				self.GlowLarge:setAlpha( 1 )
				GlowLargeFrame2( GlowLarge, {} )
				local RipperLockLineWidgetURFrame2 = function ( RipperLockLineWidgetUR, event )
					local RipperLockLineWidgetURFrame3 = function ( RipperLockLineWidgetUR, event )
						local RipperLockLineWidgetURFrame4 = function ( RipperLockLineWidgetUR, event )
							if not event.interrupted then
								RipperLockLineWidgetUR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							RipperLockLineWidgetUR:setLeftRight( true, false, 120, 216 )
							RipperLockLineWidgetUR:setTopBottom( false, true, -209, -125 )
							RipperLockLineWidgetUR:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RipperLockLineWidgetUR, event )
							else
								RipperLockLineWidgetUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockLineWidgetURFrame4( RipperLockLineWidgetUR, event )
							return 
						else
							RipperLockLineWidgetUR:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							RipperLockLineWidgetUR:setAlpha( 1 )
							RipperLockLineWidgetUR:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetURFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockLineWidgetURFrame3( RipperLockLineWidgetUR, event )
						return 
					else
						RipperLockLineWidgetUR:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						RipperLockLineWidgetUR:setAlpha( 0.5 )
						RipperLockLineWidgetUR:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetURFrame3 )
					end
				end
				
				RipperLockLineWidgetUR:completeAnimation()
				self.RipperLockLineWidgetUR:setLeftRight( true, false, 105, 201 )
				self.RipperLockLineWidgetUR:setTopBottom( false, true, -194, -110 )
				self.RipperLockLineWidgetUR:setAlpha( 1 )
				RipperLockLineWidgetURFrame2( RipperLockLineWidgetUR, {} )
				local RipperLockLineWidgetULFrame2 = function ( RipperLockLineWidgetUL, event )
					local RipperLockLineWidgetULFrame3 = function ( RipperLockLineWidgetUL, event )
						local RipperLockLineWidgetULFrame4 = function ( RipperLockLineWidgetUL, event )
							if not event.interrupted then
								RipperLockLineWidgetUL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							RipperLockLineWidgetUL:setLeftRight( false, true, -215, -119 )
							RipperLockLineWidgetUL:setTopBottom( false, true, -209, -125 )
							RipperLockLineWidgetUL:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RipperLockLineWidgetUL, event )
							else
								RipperLockLineWidgetUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockLineWidgetULFrame4( RipperLockLineWidgetUL, event )
							return 
						else
							RipperLockLineWidgetUL:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							RipperLockLineWidgetUL:setAlpha( 1 )
							RipperLockLineWidgetUL:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetULFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockLineWidgetULFrame3( RipperLockLineWidgetUL, event )
						return 
					else
						RipperLockLineWidgetUL:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						RipperLockLineWidgetUL:setAlpha( 0.5 )
						RipperLockLineWidgetUL:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetULFrame3 )
					end
				end
				
				RipperLockLineWidgetUL:completeAnimation()
				self.RipperLockLineWidgetUL:setLeftRight( false, true, -200, -104 )
				self.RipperLockLineWidgetUL:setTopBottom( false, true, -194, -110 )
				self.RipperLockLineWidgetUL:setAlpha( 1 )
				RipperLockLineWidgetULFrame2( RipperLockLineWidgetUL, {} )
				local RipperLockLineWidgetLRFrame2 = function ( RipperLockLineWidgetLR, event )
					local RipperLockLineWidgetLRFrame3 = function ( RipperLockLineWidgetLR, event )
						local RipperLockLineWidgetLRFrame4 = function ( RipperLockLineWidgetLR, event )
							if not event.interrupted then
								RipperLockLineWidgetLR:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							RipperLockLineWidgetLR:setLeftRight( true, false, 120, 216 )
							RipperLockLineWidgetLR:setTopBottom( true, false, 125, 209 )
							RipperLockLineWidgetLR:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RipperLockLineWidgetLR, event )
							else
								RipperLockLineWidgetLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockLineWidgetLRFrame4( RipperLockLineWidgetLR, event )
							return 
						else
							RipperLockLineWidgetLR:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							RipperLockLineWidgetLR:setAlpha( 1 )
							RipperLockLineWidgetLR:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetLRFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockLineWidgetLRFrame3( RipperLockLineWidgetLR, event )
						return 
					else
						RipperLockLineWidgetLR:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						RipperLockLineWidgetLR:setAlpha( 0.5 )
						RipperLockLineWidgetLR:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetLRFrame3 )
					end
				end
				
				RipperLockLineWidgetLR:completeAnimation()
				self.RipperLockLineWidgetLR:setLeftRight( true, false, 105, 201 )
				self.RipperLockLineWidgetLR:setTopBottom( true, false, 110, 194 )
				self.RipperLockLineWidgetLR:setAlpha( 1 )
				RipperLockLineWidgetLRFrame2( RipperLockLineWidgetLR, {} )
				local RipperLockLineWidgetLLFrame2 = function ( RipperLockLineWidgetLL, event )
					local RipperLockLineWidgetLLFrame3 = function ( RipperLockLineWidgetLL, event )
						local RipperLockLineWidgetLLFrame4 = function ( RipperLockLineWidgetLL, event )
							if not event.interrupted then
								RipperLockLineWidgetLL:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							RipperLockLineWidgetLL:setLeftRight( false, true, -215, -119 )
							RipperLockLineWidgetLL:setTopBottom( true, false, 125, 209 )
							RipperLockLineWidgetLL:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RipperLockLineWidgetLL, event )
							else
								RipperLockLineWidgetLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockLineWidgetLLFrame4( RipperLockLineWidgetLL, event )
							return 
						else
							RipperLockLineWidgetLL:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							RipperLockLineWidgetLL:setAlpha( 1 )
							RipperLockLineWidgetLL:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetLLFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockLineWidgetLLFrame3( RipperLockLineWidgetLL, event )
						return 
					else
						RipperLockLineWidgetLL:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						RipperLockLineWidgetLL:setAlpha( 0.5 )
						RipperLockLineWidgetLL:registerEventHandler( "transition_complete_keyframe", RipperLockLineWidgetLLFrame3 )
					end
				end
				
				RipperLockLineWidgetLL:completeAnimation()
				self.RipperLockLineWidgetLL:setLeftRight( false, true, -200, -104 )
				self.RipperLockLineWidgetLL:setTopBottom( true, false, 110, 194 )
				self.RipperLockLineWidgetLL:setAlpha( 1 )
				RipperLockLineWidgetLLFrame2( RipperLockLineWidgetLL, {} )
				local RipperLockArrowWidgetTopFrame2 = function ( RipperLockArrowWidgetTop, event )
					local RipperLockArrowWidgetTopFrame3 = function ( RipperLockArrowWidgetTop, event )
						local RipperLockArrowWidgetTopFrame4 = function ( RipperLockArrowWidgetTop, event )
							if not event.interrupted then
								RipperLockArrowWidgetTop:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetTop:setLeftRight( true, false, 66, 114 )
							RipperLockArrowWidgetTop:setTopBottom( true, false, -13, 26 )
							RipperLockArrowWidgetTop:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetTop, event )
							else
								RipperLockArrowWidgetTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetTopFrame4( RipperLockArrowWidgetTop, event )
							return 
						else
							RipperLockArrowWidgetTop:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							RipperLockArrowWidgetTop:setTopBottom( true, false, -13, 26 )
							RipperLockArrowWidgetTop:setAlpha( 1 )
							RipperLockArrowWidgetTop:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetTopFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetTopFrame3( RipperLockArrowWidgetTop, event )
						return 
					else
						RipperLockArrowWidgetTop:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetTop:setTopBottom( true, false, -1.75, 37.25 )
						RipperLockArrowWidgetTop:setAlpha( 0 )
						RipperLockArrowWidgetTop:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetTopFrame3 )
					end
				end
				
				RipperLockArrowWidgetTop:completeAnimation()
				self.RipperLockArrowWidgetTop:setLeftRight( true, false, 66, 114 )
				self.RipperLockArrowWidgetTop:setTopBottom( true, false, 14, 53 )
				self.RipperLockArrowWidgetTop:setAlpha( 1 )
				RipperLockArrowWidgetTopFrame2( RipperLockArrowWidgetTop, {} )
				local RipperLockArrowWidgetBottomFrame2 = function ( RipperLockArrowWidgetBottom, event )
					local RipperLockArrowWidgetBottomFrame3 = function ( RipperLockArrowWidgetBottom, event )
						local RipperLockArrowWidgetBottomFrame4 = function ( RipperLockArrowWidgetBottom, event )
							if not event.interrupted then
								RipperLockArrowWidgetBottom:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
							RipperLockArrowWidgetBottom:setTopBottom( true, false, 154, 193 )
							RipperLockArrowWidgetBottom:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetBottom, event )
							else
								RipperLockArrowWidgetBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetBottomFrame4( RipperLockArrowWidgetBottom, event )
							return 
						else
							RipperLockArrowWidgetBottom:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							RipperLockArrowWidgetBottom:setTopBottom( true, false, 154, 193 )
							RipperLockArrowWidgetBottom:setAlpha( 1 )
							RipperLockArrowWidgetBottom:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetBottomFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetBottomFrame3( RipperLockArrowWidgetBottom, event )
						return 
					else
						RipperLockArrowWidgetBottom:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetBottom:setTopBottom( true, false, 143.58, 182.58 )
						RipperLockArrowWidgetBottom:setAlpha( 0 )
						RipperLockArrowWidgetBottom:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetBottomFrame3 )
					end
				end
				
				RipperLockArrowWidgetBottom:completeAnimation()
				self.RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
				self.RipperLockArrowWidgetBottom:setTopBottom( true, false, 129, 168 )
				self.RipperLockArrowWidgetBottom:setAlpha( 1 )
				RipperLockArrowWidgetBottomFrame2( RipperLockArrowWidgetBottom, {} )
				local RipperLockArrowWidgetLeftFrame2 = function ( RipperLockArrowWidgetLeft, event )
					local RipperLockArrowWidgetLeftFrame3 = function ( RipperLockArrowWidgetLeft, event )
						local RipperLockArrowWidgetLeftFrame4 = function ( RipperLockArrowWidgetLeft, event )
							if not event.interrupted then
								RipperLockArrowWidgetLeft:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetLeft:setLeftRight( true, false, -18, 30 )
							RipperLockArrowWidgetLeft:setTopBottom( true, false, 71, 110 )
							RipperLockArrowWidgetLeft:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetLeft, event )
							else
								RipperLockArrowWidgetLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetLeftFrame4( RipperLockArrowWidgetLeft, event )
							return 
						else
							RipperLockArrowWidgetLeft:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							RipperLockArrowWidgetLeft:setLeftRight( true, false, -18, 30 )
							RipperLockArrowWidgetLeft:setAlpha( 1 )
							RipperLockArrowWidgetLeft:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetLeftFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetLeftFrame3( RipperLockArrowWidgetLeft, event )
						return 
					else
						RipperLockArrowWidgetLeft:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetLeft:setLeftRight( true, false, -6.75, 41.25 )
						RipperLockArrowWidgetLeft:setAlpha( 0 )
						RipperLockArrowWidgetLeft:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetLeftFrame3 )
					end
				end
				
				RipperLockArrowWidgetLeft:completeAnimation()
				self.RipperLockArrowWidgetLeft:setLeftRight( true, false, 9, 57 )
				self.RipperLockArrowWidgetLeft:setTopBottom( true, false, 71, 110 )
				self.RipperLockArrowWidgetLeft:setAlpha( 1 )
				RipperLockArrowWidgetLeftFrame2( RipperLockArrowWidgetLeft, {} )
				local RipperLockArrowWidgetRightFrame2 = function ( RipperLockArrowWidgetRight, event )
					local RipperLockArrowWidgetRightFrame3 = function ( RipperLockArrowWidgetRight, event )
						local RipperLockArrowWidgetRightFrame4 = function ( RipperLockArrowWidgetRight, event )
							if not event.interrupted then
								RipperLockArrowWidgetRight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							RipperLockArrowWidgetRight:setLeftRight( true, false, 150, 198 )
							RipperLockArrowWidgetRight:setTopBottom( true, false, 71, 110 )
							RipperLockArrowWidgetRight:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RipperLockArrowWidgetRight, event )
							else
								RipperLockArrowWidgetRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RipperLockArrowWidgetRightFrame4( RipperLockArrowWidgetRight, event )
							return 
						else
							RipperLockArrowWidgetRight:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							RipperLockArrowWidgetRight:setLeftRight( true, false, 150, 198 )
							RipperLockArrowWidgetRight:setAlpha( 1 )
							RipperLockArrowWidgetRight:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetRightFrame4 )
						end
					end
					
					if event.interrupted then
						RipperLockArrowWidgetRightFrame3( RipperLockArrowWidgetRight, event )
						return 
					else
						RipperLockArrowWidgetRight:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						RipperLockArrowWidgetRight:setLeftRight( true, false, 139.58, 187.58 )
						RipperLockArrowWidgetRight:setAlpha( 0 )
						RipperLockArrowWidgetRight:registerEventHandler( "transition_complete_keyframe", RipperLockArrowWidgetRightFrame3 )
					end
				end
				
				RipperLockArrowWidgetRight:completeAnimation()
				self.RipperLockArrowWidgetRight:setLeftRight( true, false, 125, 173 )
				self.RipperLockArrowWidgetRight:setTopBottom( true, false, 71, 110 )
				self.RipperLockArrowWidgetRight:setAlpha( 1 )
				RipperLockArrowWidgetRightFrame2( RipperLockArrowWidgetRight, {} )
				local GlowSmallFrame2 = function ( GlowSmall, event )
					if not event.interrupted then
						GlowSmall:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					GlowSmall:setAlpha( 0 )
					GlowSmall:setXRot( 0 )
					if event.interrupted then
						self.clipFinished( GlowSmall, event )
					else
						GlowSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowSmall:completeAnimation()
				self.GlowSmall:setAlpha( 1 )
				self.GlowSmall:setXRot( 0 )
				GlowSmallFrame2( GlowSmall, {} )
				local GlowSmall0Frame2 = function ( GlowSmall0, event )
					if not event.interrupted then
						GlowSmall0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					GlowSmall0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowSmall0, event )
					else
						GlowSmall0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowSmall0:completeAnimation()
				self.GlowSmall0:setAlpha( 1 )
				GlowSmall0Frame2( GlowSmall0, {} )
				local GlowSmall00Frame2 = function ( GlowSmall00, event )
					if not event.interrupted then
						GlowSmall00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					GlowSmall00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowSmall00, event )
					else
						GlowSmall00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowSmall00:completeAnimation()
				self.GlowSmall00:setAlpha( 1 )
				GlowSmall00Frame2( GlowSmall00, {} )
			end
		},
		Attack = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				RipperLockLineWidgetUR:completeAnimation()
				self.RipperLockLineWidgetUR:setLeftRight( true, false, 73, 169 )
				self.RipperLockLineWidgetUR:setTopBottom( false, true, -162, -78 )
				self.clipFinished( RipperLockLineWidgetUR, {} )
				RipperLockLineWidgetUL:completeAnimation()
				self.RipperLockLineWidgetUL:setLeftRight( false, true, -167, -71 )
				self.RipperLockLineWidgetUL:setTopBottom( false, true, -162, -78 )
				self.clipFinished( RipperLockLineWidgetUL, {} )
				RipperLockLineWidgetLR:completeAnimation()
				self.RipperLockLineWidgetLR:setLeftRight( true, false, 73, 169 )
				self.RipperLockLineWidgetLR:setTopBottom( true, false, 80, 164 )
				self.clipFinished( RipperLockLineWidgetLR, {} )
				RipperLockLineWidgetLL:completeAnimation()
				self.RipperLockLineWidgetLL:setLeftRight( false, true, -167, -71 )
				self.RipperLockLineWidgetLL:setTopBottom( true, false, 76, 160 )
				self.clipFinished( RipperLockLineWidgetLL, {} )
				RipperLockArrowWidgetTop:completeAnimation()
				self.RipperLockArrowWidgetTop:setLeftRight( true, false, 67, 115 )
				self.RipperLockArrowWidgetTop:setTopBottom( true, false, 49, 88 )
				self.RipperLockArrowWidgetTop:setAlpha( 1 )
				self.clipFinished( RipperLockArrowWidgetTop, {} )
				RipperLockArrowWidgetBottom:completeAnimation()
				self.RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
				self.RipperLockArrowWidgetBottom:setTopBottom( true, false, 93, 132 )
				self.RipperLockArrowWidgetBottom:setAlpha( 1 )
				self.clipFinished( RipperLockArrowWidgetBottom, {} )
				RipperLockArrowWidgetLeft:completeAnimation()
				self.RipperLockArrowWidgetLeft:setLeftRight( true, false, 43, 91 )
				self.RipperLockArrowWidgetLeft:setTopBottom( true, false, 70, 109 )
				self.RipperLockArrowWidgetLeft:setAlpha( 1 )
				self.clipFinished( RipperLockArrowWidgetLeft, {} )
				RipperLockArrowWidgetRight:completeAnimation()
				self.RipperLockArrowWidgetRight:setLeftRight( true, false, 90, 138 )
				self.RipperLockArrowWidgetRight:setTopBottom( true, false, 72, 111 )
				self.RipperLockArrowWidgetRight:setAlpha( 1 )
				self.clipFinished( RipperLockArrowWidgetRight, {} )
				GlowSmall0:completeAnimation()
				self.GlowSmall0:setAlpha( 0 )
				self.clipFinished( GlowSmall0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 11 )
				local GlowLargeFrame2 = function ( GlowLarge, event )
					if not event.interrupted then
						GlowLarge:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					GlowLarge:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowLarge, event )
					else
						GlowLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowLarge:completeAnimation()
				self.GlowLarge:setAlpha( 1 )
				GlowLargeFrame2( GlowLarge, {} )
				local RipperLockLineWidgetURFrame2 = function ( RipperLockLineWidgetUR, event )
					if not event.interrupted then
						RipperLockLineWidgetUR:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					RipperLockLineWidgetUR:setLeftRight( true, false, 73, 169 )
					RipperLockLineWidgetUR:setTopBottom( false, true, -162, -78 )
					RipperLockLineWidgetUR:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RipperLockLineWidgetUR, event )
					else
						RipperLockLineWidgetUR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockLineWidgetUR:completeAnimation()
				self.RipperLockLineWidgetUR:setLeftRight( true, false, 73, 169 )
				self.RipperLockLineWidgetUR:setTopBottom( false, true, -162, -78 )
				self.RipperLockLineWidgetUR:setAlpha( 1 )
				RipperLockLineWidgetURFrame2( RipperLockLineWidgetUR, {} )
				local RipperLockLineWidgetULFrame2 = function ( RipperLockLineWidgetUL, event )
					if not event.interrupted then
						RipperLockLineWidgetUL:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					RipperLockLineWidgetUL:setLeftRight( false, true, -167, -71 )
					RipperLockLineWidgetUL:setTopBottom( false, true, -162, -78 )
					RipperLockLineWidgetUL:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RipperLockLineWidgetUL, event )
					else
						RipperLockLineWidgetUL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockLineWidgetUL:completeAnimation()
				self.RipperLockLineWidgetUL:setLeftRight( false, true, -167, -71 )
				self.RipperLockLineWidgetUL:setTopBottom( false, true, -162, -78 )
				self.RipperLockLineWidgetUL:setAlpha( 1 )
				RipperLockLineWidgetULFrame2( RipperLockLineWidgetUL, {} )
				local RipperLockLineWidgetLRFrame2 = function ( RipperLockLineWidgetLR, event )
					if not event.interrupted then
						RipperLockLineWidgetLR:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					RipperLockLineWidgetLR:setLeftRight( true, false, 73, 169 )
					RipperLockLineWidgetLR:setTopBottom( true, false, 80, 164 )
					RipperLockLineWidgetLR:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RipperLockLineWidgetLR, event )
					else
						RipperLockLineWidgetLR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockLineWidgetLR:completeAnimation()
				self.RipperLockLineWidgetLR:setLeftRight( true, false, 73, 169 )
				self.RipperLockLineWidgetLR:setTopBottom( true, false, 80, 164 )
				self.RipperLockLineWidgetLR:setAlpha( 1 )
				RipperLockLineWidgetLRFrame2( RipperLockLineWidgetLR, {} )
				local RipperLockLineWidgetLLFrame2 = function ( RipperLockLineWidgetLL, event )
					if not event.interrupted then
						RipperLockLineWidgetLL:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					RipperLockLineWidgetLL:setLeftRight( false, true, -167, -71 )
					RipperLockLineWidgetLL:setTopBottom( true, false, 76, 160 )
					RipperLockLineWidgetLL:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RipperLockLineWidgetLL, event )
					else
						RipperLockLineWidgetLL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockLineWidgetLL:completeAnimation()
				self.RipperLockLineWidgetLL:setLeftRight( false, true, -167, -71 )
				self.RipperLockLineWidgetLL:setTopBottom( true, false, 76, 160 )
				self.RipperLockLineWidgetLL:setAlpha( 1 )
				RipperLockLineWidgetLLFrame2( RipperLockLineWidgetLL, {} )
				local RipperLockArrowWidgetTopFrame2 = function ( RipperLockArrowWidgetTop, event )
					if not event.interrupted then
						RipperLockArrowWidgetTop:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					RipperLockArrowWidgetTop:setLeftRight( true, false, 67, 115 )
					RipperLockArrowWidgetTop:setTopBottom( true, false, 49, 88 )
					RipperLockArrowWidgetTop:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RipperLockArrowWidgetTop, event )
					else
						RipperLockArrowWidgetTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockArrowWidgetTop:completeAnimation()
				self.RipperLockArrowWidgetTop:setLeftRight( true, false, 67, 115 )
				self.RipperLockArrowWidgetTop:setTopBottom( true, false, 49, 88 )
				self.RipperLockArrowWidgetTop:setAlpha( 1 )
				RipperLockArrowWidgetTopFrame2( RipperLockArrowWidgetTop, {} )
				local RipperLockArrowWidgetBottomFrame2 = function ( RipperLockArrowWidgetBottom, event )
					if not event.interrupted then
						RipperLockArrowWidgetBottom:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
					RipperLockArrowWidgetBottom:setTopBottom( true, false, 93, 132 )
					RipperLockArrowWidgetBottom:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RipperLockArrowWidgetBottom, event )
					else
						RipperLockArrowWidgetBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockArrowWidgetBottom:completeAnimation()
				self.RipperLockArrowWidgetBottom:setLeftRight( true, false, 66, 114 )
				self.RipperLockArrowWidgetBottom:setTopBottom( true, false, 93, 132 )
				self.RipperLockArrowWidgetBottom:setAlpha( 1 )
				RipperLockArrowWidgetBottomFrame2( RipperLockArrowWidgetBottom, {} )
				local RipperLockArrowWidgetLeftFrame2 = function ( RipperLockArrowWidgetLeft, event )
					if not event.interrupted then
						RipperLockArrowWidgetLeft:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					RipperLockArrowWidgetLeft:setLeftRight( true, false, 43, 91 )
					RipperLockArrowWidgetLeft:setTopBottom( true, false, 70, 109 )
					RipperLockArrowWidgetLeft:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RipperLockArrowWidgetLeft, event )
					else
						RipperLockArrowWidgetLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockArrowWidgetLeft:completeAnimation()
				self.RipperLockArrowWidgetLeft:setLeftRight( true, false, 43, 91 )
				self.RipperLockArrowWidgetLeft:setTopBottom( true, false, 70, 109 )
				self.RipperLockArrowWidgetLeft:setAlpha( 1 )
				RipperLockArrowWidgetLeftFrame2( RipperLockArrowWidgetLeft, {} )
				local RipperLockArrowWidgetRightFrame2 = function ( RipperLockArrowWidgetRight, event )
					if not event.interrupted then
						RipperLockArrowWidgetRight:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					RipperLockArrowWidgetRight:setLeftRight( true, false, 90, 138 )
					RipperLockArrowWidgetRight:setTopBottom( true, false, 72, 111 )
					RipperLockArrowWidgetRight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RipperLockArrowWidgetRight, event )
					else
						RipperLockArrowWidgetRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RipperLockArrowWidgetRight:completeAnimation()
				self.RipperLockArrowWidgetRight:setLeftRight( true, false, 90, 138 )
				self.RipperLockArrowWidgetRight:setTopBottom( true, false, 72, 111 )
				self.RipperLockArrowWidgetRight:setAlpha( 1 )
				RipperLockArrowWidgetRightFrame2( RipperLockArrowWidgetRight, {} )
				local GlowSmallFrame2 = function ( GlowSmall, event )
					if not event.interrupted then
						GlowSmall:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					GlowSmall:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowSmall, event )
					else
						GlowSmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowSmall:completeAnimation()
				self.GlowSmall:setAlpha( 1 )
				GlowSmallFrame2( GlowSmall, {} )
				local GlowSmall0Frame2 = function ( GlowSmall0, event )
					if not event.interrupted then
						GlowSmall0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					GlowSmall0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowSmall0, event )
					else
						GlowSmall0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowSmall0:completeAnimation()
				self.GlowSmall0:setAlpha( 1 )
				GlowSmall0Frame2( GlowSmall0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.ArmbladeLockState.ARMBLADE_TARGETTED )
			end
		},
		{
			stateName = "Attack",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.ArmbladeLockState.ARMBLADE_ATTACKING )
			end
		}
	} )
	self:linkToElementModel( self, "status", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RipperLockLineWidgetUR:close()
		element.RipperLockLineWidgetUL:close()
		element.RipperLockLineWidgetLR:close()
		element.RipperLockLineWidgetLL:close()
		element.RipperLockArrowWidgetTop:close()
		element.RipperLockArrowWidgetBottom:close()
		element.RipperLockArrowWidgetLeft:close()
		element.RipperLockArrowWidgetRight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

