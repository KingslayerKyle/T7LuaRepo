require( "ui.uieditor.widgets.CPSystems.EACJumpHeight.EACJumpHeightLine" )
require( "ui.uieditor.widgets.CPSystems.EACJumpHeight.EACJumpHeightTextMessage" )
require( "ui.uieditor.widgets.CPSystems.EACJumpHeight.EACJumpHeightTextHeight" )

CoD.EACJumpHeight = InheritFrom( LUI.UIElement )
CoD.EACJumpHeight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EACJumpHeight )
	self.id = "EACJumpHeight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 392 )
	self:setTopBottom( true, false, 0, 258 )
	
	local ArrowTop = LUI.UIImage.new()
	ArrowTop:setLeftRight( true, false, 190.2, 200.87 )
	ArrowTop:setTopBottom( true, false, 0, 18.67 )
	ArrowTop:setRGB( 0.61, 0, 0.06 )
	ArrowTop:setZRot( 270 )
	ArrowTop:setZoom( 100 )
	ArrowTop:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_framearrowside" ) )
	ArrowTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowTop )
	self.ArrowTop = ArrowTop
	
	local FrameTop = LUI.UIImage.new()
	FrameTop:setLeftRight( true, false, 156.87, 234.2 )
	FrameTop:setTopBottom( true, false, 12.34, 36.34 )
	FrameTop:setRGB( 1, 0, 0.07 )
	FrameTop:setZRot( -180 )
	FrameTop:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_frametop" ) )
	FrameTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( FrameTop )
	self.FrameTop = FrameTop
	
	local MeterIcon = LUI.UIImage.new()
	MeterIcon:setLeftRight( true, false, 183.53, 207.53 )
	MeterIcon:setTopBottom( true, false, 78, 86 )
	MeterIcon:setRGB( 1, 0, 0.07 )
	MeterIcon:setZoom( 50 )
	MeterIcon:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolmtop" ) )
	MeterIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterIcon )
	self.MeterIcon = MeterIcon
	
	local Line = CoD.EACJumpHeightLine.new( menu, controller )
	Line:setLeftRight( true, false, 163.53, 227.53 )
	Line:setTopBottom( true, false, 95.66, 258.33 )
	Line:setRGB( 1, 0, 0.07 )
	self:addElement( Line )
	self.Line = Line
	
	local TextMessage = CoD.EACJumpHeightTextMessage.new( menu, controller )
	TextMessage:setLeftRight( true, false, 207.53, 392.06 )
	TextMessage:setTopBottom( true, false, 109, 160 )
	TextMessage:setRGB( 0, 0, 0 )
	TextMessage:setZoom( -50 )
	TextMessage:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextMessage:setShaderVector( 0, 0.05, 1, 0, 0 )
	TextMessage:setShaderVector( 1, 0, 0, 0, 0 )
	TextMessage:setShaderVector( 2, 0, 0, 0, 0 )
	TextMessage:setShaderVector( 3, 0, 0, 0, 0 )
	TextMessage:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( TextMessage )
	self.TextMessage = TextMessage
	
	local TextHeight = CoD.EACJumpHeightTextHeight.new( menu, controller )
	TextHeight:setLeftRight( true, false, 115.27, 275.8 )
	TextHeight:setTopBottom( true, false, 38, 76 )
	TextHeight:setRGB( 0.38, 0, 0.03 )
	TextHeight:setZoom( 50 )
	TextHeight:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextHeight:setShaderVector( 0, 0, 1, 0, 0 )
	TextHeight:setShaderVector( 1, 0, 0, 0, 0 )
	TextHeight:setShaderVector( 2, 0, 0, 0, 0 )
	TextHeight:setShaderVector( 3, 0, 0, 0, 0 )
	TextHeight:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( TextHeight )
	self.TextHeight = TextHeight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ArrowTop:completeAnimation()
				self.ArrowTop:setRGB( 0.42, 0.54, 0.58 )
				self.clipFinished( ArrowTop, {} )
				FrameTop:completeAnimation()
				self.FrameTop:setRGB( 1, 1, 1 )
				self.clipFinished( FrameTop, {} )
				MeterIcon:completeAnimation()
				self.MeterIcon:setRGB( 1, 1, 1 )
				self.clipFinished( MeterIcon, {} )
				Line:completeAnimation()
				self.Line:setRGB( 1, 1, 1 )
				self.clipFinished( Line, {} )
				TextMessage:completeAnimation()
				self.TextMessage:setRGB( 1, 1, 1 )
				self.clipFinished( TextMessage, {} )
				TextHeight:completeAnimation()
				self.TextHeight:setRGB( 1, 1, 1 )
				self.clipFinished( TextHeight, {} )
			end
		},
		Risky = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ArrowTop:completeAnimation()
				self.ArrowTop:setRGB( 0.58, 0.4, 0.17 )
				self.clipFinished( ArrowTop, {} )
				FrameTop:completeAnimation()
				self.FrameTop:setRGB( 1, 0.58, 0.23 )
				self.clipFinished( FrameTop, {} )
				MeterIcon:completeAnimation()
				self.MeterIcon:setRGB( 1, 0.76, 0.31 )
				self.clipFinished( MeterIcon, {} )
				Line:completeAnimation()
				self.Line:setRGB( 1, 0.58, 0.23 )
				self.clipFinished( Line, {} )
				TextMessage:completeAnimation()
				self.TextMessage:setRGB( 1, 0.58, 0.23 )
				self.clipFinished( TextMessage, {} )
				TextHeight:completeAnimation()
				self.TextHeight:setRGB( 1, 0.76, 0.31 )
				self.clipFinished( TextHeight, {} )
			end
		},
		Critical = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				ArrowTop:completeAnimation()
				self.ArrowTop:setRGB( 0.61, 0, 0.06 )
				self.clipFinished( ArrowTop, {} )
				FrameTop:completeAnimation()
				self.FrameTop:setRGB( 1, 0, 0.07 )
				self.clipFinished( FrameTop, {} )
				MeterIcon:completeAnimation()
				self.MeterIcon:setRGB( 1, 0, 0.07 )
				self.clipFinished( MeterIcon, {} )
				Line:completeAnimation()
				self.Line:setRGB( 1, 0, 0.07 )
				self.clipFinished( Line, {} )
				local TextMessageFrame2 = function ( TextMessage, event )
					local TextMessageFrame3 = function ( TextMessage, event )
						local TextMessageFrame4 = function ( TextMessage, event )
							local TextMessageFrame5 = function ( TextMessage, event )
								if not event.interrupted then
									TextMessage:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								TextMessage:setRGB( 1, 0, 0.07 )
								if event.interrupted then
									self.clipFinished( TextMessage, event )
								else
									TextMessage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								TextMessageFrame5( TextMessage, event )
								return 
							else
								TextMessage:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								TextMessage:registerEventHandler( "transition_complete_keyframe", TextMessageFrame5 )
							end
						end
						
						if event.interrupted then
							TextMessageFrame4( TextMessage, event )
							return 
						else
							TextMessage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							TextMessage:setRGB( 0, 0, 0 )
							TextMessage:registerEventHandler( "transition_complete_keyframe", TextMessageFrame4 )
						end
					end
					
					if event.interrupted then
						TextMessageFrame3( TextMessage, event )
						return 
					else
						TextMessage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						TextMessage:registerEventHandler( "transition_complete_keyframe", TextMessageFrame3 )
					end
				end
				
				TextMessage:completeAnimation()
				self.TextMessage:setRGB( 1, 0, 0.07 )
				TextMessageFrame2( TextMessage, {} )
				local TextHeightFrame2 = function ( TextHeight, event )
					local TextHeightFrame3 = function ( TextHeight, event )
						local TextHeightFrame4 = function ( TextHeight, event )
							local TextHeightFrame5 = function ( TextHeight, event )
								if not event.interrupted then
									TextHeight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								TextHeight:setRGB( 1, 0, 0.07 )
								if event.interrupted then
									self.clipFinished( TextHeight, event )
								else
									TextHeight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								TextHeightFrame5( TextHeight, event )
								return 
							else
								TextHeight:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								TextHeight:registerEventHandler( "transition_complete_keyframe", TextHeightFrame5 )
							end
						end
						
						if event.interrupted then
							TextHeightFrame4( TextHeight, event )
							return 
						else
							TextHeight:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							TextHeight:setRGB( 0.38, 0, 0.03 )
							TextHeight:registerEventHandler( "transition_complete_keyframe", TextHeightFrame4 )
						end
					end
					
					if event.interrupted then
						TextHeightFrame3( TextHeight, event )
						return 
					else
						TextHeight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						TextHeight:registerEventHandler( "transition_complete_keyframe", TextHeightFrame3 )
					end
				end
				
				TextHeight:completeAnimation()
				self.TextHeight:setRGB( 1, 0, 0.07 )
				TextHeightFrame2( TextHeight, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.Line:close()
		self.TextMessage:close()
		self.TextHeight:close()
		CoD.EACJumpHeight.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

