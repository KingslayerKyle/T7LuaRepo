-- b81b462ed600abb75fe698dfff98a286
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMDiviniumLoopAnim.ZM_DiviniumFull" )
require( "ui.uieditor.widgets.ZMDiviniumLoopAnim.ZM_DiviniumEmpty" )

CoD.ZM_DiviniumAnimFill = InheritFrom( LUI.UIElement )
CoD.ZM_DiviniumAnimFill.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZM_DiviniumAnimFill )
	self.id = "ZM_DiviniumAnimFill"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 196, 304 )
	Glow:setTopBottom( true, false, 119.23, 166.23 )
	Glow:setImage( RegisterImage( "uie_t7_zm_anim_divinium_glow" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Fill = LUI.UIImage.new()
	Fill:setLeftRight( true, false, 231.66, 267.66 )
	Fill:setTopBottom( true, false, -8.77, 159.23 )
	Fill:setXRot( 180 )
	Fill:setImage( RegisterImage( "uie_t7_zm_anim_divinium_fill" ) )
	self:addElement( Fill )
	self.Fill = Fill
	
	local Vial = LUI.UIImage.new()
	Vial:setLeftRight( true, false, 226, 274 )
	Vial:setTopBottom( true, false, -58, 158 )
	Vial:setImage( RegisterImage( "uie_t7_zm_anim_divinium_vial" ) )
	self:addElement( Vial )
	self.Vial = Vial
	
	local ZMDiviniumFull = CoD.ZM_DiviniumFull.new( menu, controller )
	ZMDiviniumFull:setLeftRight( true, false, 284.5, 392.5 )
	ZMDiviniumFull:setTopBottom( true, false, -62.5, 162.73 )
	ZMDiviniumFull:setScale( 0.8 )
	self:addElement( ZMDiviniumFull )
	self.ZMDiviniumFull = ZMDiviniumFull
	
	local ZMDiviniumEmpty = CoD.ZM_DiviniumEmpty.new( menu, controller )
	ZMDiviniumEmpty:setLeftRight( true, false, 103.5, 211.5 )
	ZMDiviniumEmpty:setTopBottom( true, false, -62.5, 162.5 )
	ZMDiviniumEmpty:setScale( 0.8 )
	self:addElement( ZMDiviniumEmpty )
	self.ZMDiviniumEmpty = ZMDiviniumEmpty
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.clipFinished( Fill, {} )

				Vial:completeAnimation()
				self.Vial:setAlpha( 0 )
				self.clipFinished( Vial, {} )

				ZMDiviniumFull:completeAnimation()
				self.ZMDiviniumFull:setAlpha( 0 )
				self.clipFinished( ZMDiviniumFull, {} )

				ZMDiviniumEmpty:completeAnimation()
				self.ZMDiviniumEmpty:setAlpha( 0 )
				self.clipFinished( ZMDiviniumEmpty, {} )
			end,
			Start = function ()
				self:setupElementClipCounter( 5 )

				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Glow:setLeftRight( true, false, 196, 304 )
								Glow:setTopBottom( true, false, -32.77, 166.23 )
								Glow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow, event )
								else
									Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
								Glow:setTopBottom( true, false, -32.77, 166.23 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							Glow:setTopBottom( true, false, 68.37, 166.23 )
							Glow:setAlpha( 1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, 196, 304 )
				self.Glow:setTopBottom( true, false, 115.23, 166.23 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local FillFrame2 = function ( Fill, event )
					local FillFrame3 = function ( Fill, event )
						local FillFrame4 = function ( Fill, event )
							local FillFrame5 = function ( Fill, event )
								if not event.interrupted then
									Fill:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Fill:setAlpha( 0 )
								Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
								Fill:setShaderVector( 0, 1, 0, 0, 0 )
								Fill:setShaderVector( 1, 0, 0, 0, 0 )
								Fill:setShaderVector( 2, 1, 0, 0, 0 )
								Fill:setShaderVector( 3, 0.03, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( Fill, event )
								else
									Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FillFrame5( Fill, event )
								return 
							else
								Fill:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
								Fill:setShaderVector( 2, 1, 0, 0, 0 )
								Fill:registerEventHandler( "transition_complete_keyframe", FillFrame5 )
							end
						end
						
						if event.interrupted then
							FillFrame4( Fill, event )
							return 
						else
							Fill:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill:setAlpha( 1 )
							Fill:registerEventHandler( "transition_complete_keyframe", FillFrame4 )
						end
					end
					
					if event.interrupted then
						FillFrame3( Fill, event )
						return 
					else
						Fill:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						Fill:registerEventHandler( "transition_complete_keyframe", FillFrame3 )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Fill:setShaderVector( 0, 1, 0, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0.03, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local VialFrame2 = function ( Vial, event )
					local VialFrame3 = function ( Vial, event )
						local VialFrame4 = function ( Vial, event )
							local VialFrame5 = function ( Vial, event )
								if not event.interrupted then
									Vial:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Vial:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Vial, event )
								else
									Vial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								VialFrame5( Vial, event )
								return 
							else
								Vial:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
								Vial:registerEventHandler( "transition_complete_keyframe", VialFrame5 )
							end
						end
						
						if event.interrupted then
							VialFrame4( Vial, event )
							return 
						else
							Vial:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Vial:setAlpha( 1 )
							Vial:registerEventHandler( "transition_complete_keyframe", VialFrame4 )
						end
					end
					
					if event.interrupted then
						VialFrame3( Vial, event )
						return 
					else
						Vial:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						Vial:registerEventHandler( "transition_complete_keyframe", VialFrame3 )
					end
				end
				
				Vial:completeAnimation()
				self.Vial:setAlpha( 0 )
				VialFrame2( Vial, {} )
				local ZMDiviniumFullFrame2 = function ( ZMDiviniumFull, event )
					local ZMDiviniumFullFrame3 = function ( ZMDiviniumFull, event )
						local ZMDiviniumFullFrame4 = function ( ZMDiviniumFull, event )
							if not event.interrupted then
								ZMDiviniumFull:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
							end
							ZMDiviniumFull:setLeftRight( true, false, 258.66, 366.66 )
							ZMDiviniumFull:setTopBottom( true, false, -58, 167.23 )
							ZMDiviniumFull:setAlpha( 0 )
							ZMDiviniumFull:setScale( 0.8 )
							if event.interrupted then
								self.clipFinished( ZMDiviniumFull, event )
							else
								ZMDiviniumFull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZMDiviniumFullFrame4( ZMDiviniumFull, event )
							return 
						else
							ZMDiviniumFull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ZMDiviniumFull:setLeftRight( true, false, 196.78, 304.78 )
							ZMDiviniumFull:setAlpha( 1 )
							ZMDiviniumFull:registerEventHandler( "transition_complete_keyframe", ZMDiviniumFullFrame4 )
						end
					end
					
					if event.interrupted then
						ZMDiviniumFullFrame3( ZMDiviniumFull, event )
						return 
					else
						ZMDiviniumFull:beginAnimation( "keyframe", 1389, false, false, CoD.TweenType.Linear )
						ZMDiviniumFull:registerEventHandler( "transition_complete_keyframe", ZMDiviniumFullFrame3 )
					end
				end
				
				ZMDiviniumFull:completeAnimation()
				self.ZMDiviniumFull:setLeftRight( true, false, 196, 304 )
				self.ZMDiviniumFull:setTopBottom( true, false, -58, 167.23 )
				self.ZMDiviniumFull:setAlpha( 0 )
				self.ZMDiviniumFull:setScale( 1 )
				ZMDiviniumFullFrame2( ZMDiviniumFull, {} )
				local ZMDiviniumEmptyFrame2 = function ( ZMDiviniumEmpty, event )
					local ZMDiviniumEmptyFrame3 = function ( ZMDiviniumEmpty, event )
						if not event.interrupted then
							ZMDiviniumEmpty:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						ZMDiviniumEmpty:setLeftRight( true, false, 195.66, 303.66 )
						ZMDiviniumEmpty:setTopBottom( true, false, -57.77, 167.23 )
						ZMDiviniumEmpty:setAlpha( 0 )
						ZMDiviniumEmpty:setScale( 1 )
						if event.interrupted then
							self.clipFinished( ZMDiviniumEmpty, event )
						else
							ZMDiviniumEmpty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZMDiviniumEmptyFrame3( ZMDiviniumEmpty, event )
						return 
					else
						ZMDiviniumEmpty:beginAnimation( "keyframe", 709, true, false, CoD.TweenType.Linear )
						ZMDiviniumEmpty:setLeftRight( true, false, 194.74, 302.74 )
						ZMDiviniumEmpty:setTopBottom( true, false, -57.83, 167.17 )
						ZMDiviniumEmpty:setAlpha( 1 )
						ZMDiviniumEmpty:setScale( 1 )
						ZMDiviniumEmpty:registerEventHandler( "transition_complete_keyframe", ZMDiviniumEmptyFrame3 )
					end
				end
				
				ZMDiviniumEmpty:completeAnimation()
				self.ZMDiviniumEmpty:setLeftRight( true, false, 129.5, 237.5 )
				self.ZMDiviniumEmpty:setTopBottom( true, false, -62.5, 162.5 )
				self.ZMDiviniumEmpty:setAlpha( 0 )
				self.ZMDiviniumEmpty:setScale( 0.8 )
				ZMDiviniumEmptyFrame2( ZMDiviniumEmpty, {} )
			end,
			Stop = function ()
				self:setupElementClipCounter( 5 )

				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Glow:setLeftRight( true, false, 196, 304 )
								Glow:setTopBottom( true, false, -32.77, 166.23 )
								Glow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow, event )
								else
									Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
								Glow:setTopBottom( true, false, -32.77, 166.23 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							Glow:setTopBottom( true, false, 68.37, 166.23 )
							Glow:setAlpha( 1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, 196, 304 )
				self.Glow:setTopBottom( true, false, 115.23, 166.23 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local FillFrame2 = function ( Fill, event )
					local FillFrame3 = function ( Fill, event )
						local FillFrame4 = function ( Fill, event )
							local FillFrame5 = function ( Fill, event )
								if not event.interrupted then
									Fill:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Fill:setAlpha( 0 )
								Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
								Fill:setShaderVector( 0, 1, 0, 0, 0 )
								Fill:setShaderVector( 1, 0, 0, 0, 0 )
								Fill:setShaderVector( 2, 1, 0, 0, 0 )
								Fill:setShaderVector( 3, 0.03, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( Fill, event )
								else
									Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FillFrame5( Fill, event )
								return 
							else
								Fill:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
								Fill:setShaderVector( 2, 1, 0, 0, 0 )
								Fill:registerEventHandler( "transition_complete_keyframe", FillFrame5 )
							end
						end
						
						if event.interrupted then
							FillFrame4( Fill, event )
							return 
						else
							Fill:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill:setAlpha( 1 )
							Fill:registerEventHandler( "transition_complete_keyframe", FillFrame4 )
						end
					end
					
					if event.interrupted then
						FillFrame3( Fill, event )
						return 
					else
						Fill:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						Fill:registerEventHandler( "transition_complete_keyframe", FillFrame3 )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Fill:setShaderVector( 0, 1, 0, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0.03, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local VialFrame2 = function ( Vial, event )
					local VialFrame3 = function ( Vial, event )
						local VialFrame4 = function ( Vial, event )
							local VialFrame5 = function ( Vial, event )
								if not event.interrupted then
									Vial:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Vial:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Vial, event )
								else
									Vial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								VialFrame5( Vial, event )
								return 
							else
								Vial:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
								Vial:registerEventHandler( "transition_complete_keyframe", VialFrame5 )
							end
						end
						
						if event.interrupted then
							VialFrame4( Vial, event )
							return 
						else
							Vial:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Vial:setAlpha( 1 )
							Vial:registerEventHandler( "transition_complete_keyframe", VialFrame4 )
						end
					end
					
					if event.interrupted then
						VialFrame3( Vial, event )
						return 
					else
						Vial:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						Vial:registerEventHandler( "transition_complete_keyframe", VialFrame3 )
					end
				end
				
				Vial:completeAnimation()
				self.Vial:setAlpha( 0 )
				VialFrame2( Vial, {} )
				local ZMDiviniumFullFrame2 = function ( ZMDiviniumFull, event )
					local ZMDiviniumFullFrame3 = function ( ZMDiviniumFull, event )
						local ZMDiviniumFullFrame4 = function ( ZMDiviniumFull, event )
							if not event.interrupted then
								ZMDiviniumFull:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
							end
							ZMDiviniumFull:setLeftRight( true, false, 258.66, 366.66 )
							ZMDiviniumFull:setTopBottom( true, false, -58, 167.23 )
							ZMDiviniumFull:setAlpha( 0 )
							ZMDiviniumFull:setScale( 0.8 )
							if event.interrupted then
								self.clipFinished( ZMDiviniumFull, event )
							else
								ZMDiviniumFull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZMDiviniumFullFrame4( ZMDiviniumFull, event )
							return 
						else
							ZMDiviniumFull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ZMDiviniumFull:setLeftRight( true, false, 196.78, 304.78 )
							ZMDiviniumFull:setAlpha( 1 )
							ZMDiviniumFull:registerEventHandler( "transition_complete_keyframe", ZMDiviniumFullFrame4 )
						end
					end
					
					if event.interrupted then
						ZMDiviniumFullFrame3( ZMDiviniumFull, event )
						return 
					else
						ZMDiviniumFull:beginAnimation( "keyframe", 1389, false, false, CoD.TweenType.Linear )
						ZMDiviniumFull:registerEventHandler( "transition_complete_keyframe", ZMDiviniumFullFrame3 )
					end
				end
				
				ZMDiviniumFull:completeAnimation()
				self.ZMDiviniumFull:setLeftRight( true, false, 196, 304 )
				self.ZMDiviniumFull:setTopBottom( true, false, -58, 167.23 )
				self.ZMDiviniumFull:setAlpha( 0 )
				self.ZMDiviniumFull:setScale( 1 )
				ZMDiviniumFullFrame2( ZMDiviniumFull, {} )
				local ZMDiviniumEmptyFrame2 = function ( ZMDiviniumEmpty, event )
					local ZMDiviniumEmptyFrame3 = function ( ZMDiviniumEmpty, event )
						if not event.interrupted then
							ZMDiviniumEmpty:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						ZMDiviniumEmpty:setLeftRight( true, false, 195.66, 303.66 )
						ZMDiviniumEmpty:setTopBottom( true, false, -57.77, 167.23 )
						ZMDiviniumEmpty:setAlpha( 0 )
						ZMDiviniumEmpty:setScale( 1 )
						if event.interrupted then
							self.clipFinished( ZMDiviniumEmpty, event )
						else
							ZMDiviniumEmpty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZMDiviniumEmptyFrame3( ZMDiviniumEmpty, event )
						return 
					else
						ZMDiviniumEmpty:beginAnimation( "keyframe", 709, true, false, CoD.TweenType.Linear )
						ZMDiviniumEmpty:setLeftRight( true, false, 194.74, 302.74 )
						ZMDiviniumEmpty:setTopBottom( true, false, -57.83, 167.17 )
						ZMDiviniumEmpty:setAlpha( 1 )
						ZMDiviniumEmpty:setScale( 1 )
						ZMDiviniumEmpty:registerEventHandler( "transition_complete_keyframe", ZMDiviniumEmptyFrame3 )
					end
				end
				
				ZMDiviniumEmpty:completeAnimation()
				self.ZMDiviniumEmpty:setLeftRight( true, false, 129.5, 237.5 )
				self.ZMDiviniumEmpty:setTopBottom( true, false, -62.5, 162.5 )
				self.ZMDiviniumEmpty:setAlpha( 0 )
				self.ZMDiviniumEmpty:setScale( 0.8 )
				ZMDiviniumEmptyFrame2( ZMDiviniumEmpty, {} )
			end,
			Loop = function ()
				self:setupElementClipCounter( 5 )

				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Glow:setLeftRight( true, false, 196, 304 )
								Glow:setTopBottom( true, false, -32.77, 166.23 )
								Glow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow, event )
								else
									Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
								Glow:setTopBottom( true, false, -32.77, 166.23 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							Glow:setTopBottom( true, false, 68.37, 166.23 )
							Glow:setAlpha( 1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, 196, 304 )
				self.Glow:setTopBottom( true, false, 115.23, 166.23 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local FillFrame2 = function ( Fill, event )
					local FillFrame3 = function ( Fill, event )
						local FillFrame4 = function ( Fill, event )
							local FillFrame5 = function ( Fill, event )
								if not event.interrupted then
									Fill:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Fill:setAlpha( 0 )
								Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
								Fill:setShaderVector( 0, 1, 0, 0, 0 )
								Fill:setShaderVector( 1, 0, 0, 0, 0 )
								Fill:setShaderVector( 2, 1, 0, 0, 0 )
								Fill:setShaderVector( 3, 0.03, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( Fill, event )
								else
									Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FillFrame5( Fill, event )
								return 
							else
								Fill:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
								Fill:setShaderVector( 2, 1, 0, 0, 0 )
								Fill:registerEventHandler( "transition_complete_keyframe", FillFrame5 )
							end
						end
						
						if event.interrupted then
							FillFrame4( Fill, event )
							return 
						else
							Fill:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fill:setAlpha( 1 )
							Fill:registerEventHandler( "transition_complete_keyframe", FillFrame4 )
						end
					end
					
					if event.interrupted then
						FillFrame3( Fill, event )
						return 
					else
						Fill:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						Fill:registerEventHandler( "transition_complete_keyframe", FillFrame3 )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.Fill:setShaderVector( 0, 1, 0, 0, 0 )
				self.Fill:setShaderVector( 1, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 2, 0, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0.03, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local VialFrame2 = function ( Vial, event )
					local VialFrame3 = function ( Vial, event )
						local VialFrame4 = function ( Vial, event )
							local VialFrame5 = function ( Vial, event )
								if not event.interrupted then
									Vial:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Vial:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Vial, event )
								else
									Vial:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								VialFrame5( Vial, event )
								return 
							else
								Vial:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
								Vial:registerEventHandler( "transition_complete_keyframe", VialFrame5 )
							end
						end
						
						if event.interrupted then
							VialFrame4( Vial, event )
							return 
						else
							Vial:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Vial:setAlpha( 1 )
							Vial:registerEventHandler( "transition_complete_keyframe", VialFrame4 )
						end
					end
					
					if event.interrupted then
						VialFrame3( Vial, event )
						return 
					else
						Vial:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						Vial:registerEventHandler( "transition_complete_keyframe", VialFrame3 )
					end
				end
				
				Vial:completeAnimation()
				self.Vial:setAlpha( 0 )
				VialFrame2( Vial, {} )
				local ZMDiviniumFullFrame2 = function ( ZMDiviniumFull, event )
					local ZMDiviniumFullFrame3 = function ( ZMDiviniumFull, event )
						local ZMDiviniumFullFrame4 = function ( ZMDiviniumFull, event )
							if not event.interrupted then
								ZMDiviniumFull:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
							end
							ZMDiviniumFull:setLeftRight( true, false, 258.66, 366.66 )
							ZMDiviniumFull:setTopBottom( true, false, -58, 167.23 )
							ZMDiviniumFull:setAlpha( 0 )
							ZMDiviniumFull:setScale( 0.8 )
							if event.interrupted then
								self.clipFinished( ZMDiviniumFull, event )
							else
								ZMDiviniumFull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZMDiviniumFullFrame4( ZMDiviniumFull, event )
							return 
						else
							ZMDiviniumFull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ZMDiviniumFull:setLeftRight( true, false, 196.78, 304.78 )
							ZMDiviniumFull:setAlpha( 1 )
							ZMDiviniumFull:registerEventHandler( "transition_complete_keyframe", ZMDiviniumFullFrame4 )
						end
					end
					
					if event.interrupted then
						ZMDiviniumFullFrame3( ZMDiviniumFull, event )
						return 
					else
						ZMDiviniumFull:beginAnimation( "keyframe", 1389, false, false, CoD.TweenType.Linear )
						ZMDiviniumFull:registerEventHandler( "transition_complete_keyframe", ZMDiviniumFullFrame3 )
					end
				end
				
				ZMDiviniumFull:completeAnimation()
				self.ZMDiviniumFull:setLeftRight( true, false, 196, 304 )
				self.ZMDiviniumFull:setTopBottom( true, false, -58, 167.23 )
				self.ZMDiviniumFull:setAlpha( 0 )
				self.ZMDiviniumFull:setScale( 1 )
				ZMDiviniumFullFrame2( ZMDiviniumFull, {} )
				local ZMDiviniumEmptyFrame2 = function ( ZMDiviniumEmpty, event )
					local ZMDiviniumEmptyFrame3 = function ( ZMDiviniumEmpty, event )
						if not event.interrupted then
							ZMDiviniumEmpty:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						ZMDiviniumEmpty:setLeftRight( true, false, 195.66, 303.66 )
						ZMDiviniumEmpty:setTopBottom( true, false, -57.77, 167.23 )
						ZMDiviniumEmpty:setAlpha( 0 )
						ZMDiviniumEmpty:setScale( 1 )
						if event.interrupted then
							self.clipFinished( ZMDiviniumEmpty, event )
						else
							ZMDiviniumEmpty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZMDiviniumEmptyFrame3( ZMDiviniumEmpty, event )
						return 
					else
						ZMDiviniumEmpty:beginAnimation( "keyframe", 709, true, false, CoD.TweenType.Linear )
						ZMDiviniumEmpty:setLeftRight( true, false, 194.74, 302.74 )
						ZMDiviniumEmpty:setTopBottom( true, false, -57.83, 167.17 )
						ZMDiviniumEmpty:setAlpha( 1 )
						ZMDiviniumEmpty:setScale( 1 )
						ZMDiviniumEmpty:registerEventHandler( "transition_complete_keyframe", ZMDiviniumEmptyFrame3 )
					end
				end
				
				ZMDiviniumEmpty:completeAnimation()
				self.ZMDiviniumEmpty:setLeftRight( true, false, 129.5, 237.5 )
				self.ZMDiviniumEmpty:setTopBottom( true, false, -62.5, 162.5 )
				self.ZMDiviniumEmpty:setAlpha( 0 )
				self.ZMDiviniumEmpty:setScale( 0.8 )
				ZMDiviniumEmptyFrame2( ZMDiviniumEmpty, {} )

				self.nextClip = "Loop"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZMDiviniumFull:close()
		element.ZMDiviniumEmpty:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
