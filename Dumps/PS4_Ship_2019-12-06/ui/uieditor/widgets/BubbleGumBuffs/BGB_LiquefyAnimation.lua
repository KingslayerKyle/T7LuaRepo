require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )

CoD.BGB_LiquefyAnimation = InheritFrom( LUI.UIElement )
CoD.BGB_LiquefyAnimation.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BGB_LiquefyAnimation )
	self.id = "BGB_LiquefyAnimation"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local splash2 = LUI.UIImage.new()
	splash2:setLeftRight( true, false, -369, 143 )
	splash2:setTopBottom( true, false, 143.84, 655.84 )
	splash2:setRGB( 0.71, 0, 1 )
	splash2:setImage( RegisterImage( "uie_t7_base_graphic_zoom_dlc3" ) )
	self:addElement( splash2 )
	self.splash2 = splash2
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( false, false, -101, 90.34 )
	ZmFxSpark20:setTopBottom( true, false, -78, 143.84 )
	ZmFxSpark20:setRGB( 0.67, 0.04, 1 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local Icon1 = LUI.UIImage.new()
	Icon1:setLeftRight( true, false, -82.67, 82.67 )
	Icon1:setTopBottom( true, false, -27.51, 137.84 )
	Icon1:setImage( RegisterImage( "uie_t7_zm_cookbook_distill_icon" ) )
	self:addElement( Icon1 )
	self.Icon1 = Icon1
	
	local Icon2 = LUI.UIImage.new()
	Icon2:setLeftRight( true, false, 417.33, 582.67 )
	Icon2:setTopBottom( true, false, -27.51, 137.84 )
	Icon2:setImage( RegisterImage( "uie_t7_zm_cookbook_distill_icon" ) )
	self:addElement( Icon2 )
	self.Icon2 = Icon2
	
	local Icon3 = LUI.UIImage.new()
	Icon3:setLeftRight( true, false, 154.33, 319.67 )
	Icon3:setTopBottom( true, false, -27.51, 137.84 )
	Icon3:setImage( RegisterImage( "uie_t7_zm_cookbook_distill_icon" ) )
	self:addElement( Icon3 )
	self.Icon3 = Icon3
	
	local Audio = LUI.UIElement.new()
	Audio:setLeftRight( true, false, 57.14, 105.14 )
	Audio:setTopBottom( true, false, 562.44, 610.44 )
	self:addElement( Audio )
	self.Audio = Audio
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				splash2:completeAnimation()
				self.splash2:setAlpha( 0 )
				self.clipFinished( splash2, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				Icon1:completeAnimation()
				self.Icon1:setAlpha( 0 )
				self.clipFinished( Icon1, {} )
				Icon2:completeAnimation()
				self.Icon2:setAlpha( 0 )
				self.clipFinished( Icon2, {} )
				Icon3:completeAnimation()
				self.Icon3:setAlpha( 0 )
				self.clipFinished( Icon3, {} )
			end,
			StartLiquefying = function ()
				self:setupElementClipCounter( 6 )
				local splash2Frame2 = function ( splash2, event )
					local splash2Frame3 = function ( splash2, event )
						local splash2Frame4 = function ( splash2, event )
							if not event.interrupted then
								splash2:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
							end
							splash2:setLeftRight( true, false, -6, 506 )
							splash2:setTopBottom( true, false, -206, 306 )
							splash2:setRGB( 0.71, 0, 1 )
							splash2:setAlpha( 0 )
							splash2:setScale( 0.8 )
							if event.interrupted then
								self.clipFinished( splash2, event )
							else
								splash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							splash2Frame4( splash2, event )
							return 
						else
							splash2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							splash2:setAlpha( 1 )
							splash2:setScale( 0.6 )
							splash2:registerEventHandler( "transition_complete_keyframe", splash2Frame4 )
						end
					end
					
					if event.interrupted then
						splash2Frame3( splash2, event )
						return 
					else
						splash2:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						splash2:setAlpha( 0.03 )
						splash2:registerEventHandler( "transition_complete_keyframe", splash2Frame3 )
					end
				end
				
				splash2:completeAnimation()
				self.splash2:setLeftRight( true, false, -6, 506 )
				self.splash2:setTopBottom( true, false, -206, 306 )
				self.splash2:setRGB( 0.71, 0, 1 )
				self.splash2:setAlpha( 0 )
				self.splash2:setScale( 0.5 )
				splash2Frame2( splash2, {} )
				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							local ZmFxSpark20Frame5 = function ( ZmFxSpark20, event )
								if not event.interrupted then
									ZmFxSpark20:beginAnimation( "keyframe", 1480, false, false, CoD.TweenType.Linear )
								end
								ZmFxSpark20:setLeftRight( false, false, -71, 65.34 )
								ZmFxSpark20:setTopBottom( true, false, -63, 119.84 )
								ZmFxSpark20:setRGB( 0, 0, 0 )
								ZmFxSpark20:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( ZmFxSpark20, event )
								else
									ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmFxSpark20Frame5( ZmFxSpark20, event )
								return 
							else
								ZmFxSpark20:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:setRGB( 0.67, 0.04, 1 )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setLeftRight( false, false, -71, 65.34 )
				self.ZmFxSpark20:setTopBottom( true, false, -63, 119.84 )
				self.ZmFxSpark20:setRGB( 0, 0, 0 )
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local Icon1Frame2 = function ( Icon1, event )
					local Icon1Frame3 = function ( Icon1, event )
						local Icon1Frame4 = function ( Icon1, event )
							if not event.interrupted then
								Icon1:beginAnimation( "keyframe", 2400, false, false, CoD.TweenType.Linear )
							end
							Icon1:setLeftRight( true, false, 32.33, 197.67 )
							Icon1:setTopBottom( true, false, -27.51, 137.84 )
							Icon1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Icon1, event )
							else
								Icon1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Icon1Frame4( Icon1, event )
							return 
						else
							Icon1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							Icon1:setLeftRight( true, false, 154.33, 319.67 )
							Icon1:registerEventHandler( "transition_complete_keyframe", Icon1Frame4 )
						end
					end
					
					if event.interrupted then
						Icon1Frame3( Icon1, event )
						return 
					else
						Icon1:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Linear )
						Icon1:setLeftRight( true, false, 113.66, 279 )
						Icon1:setAlpha( 0 )
						Icon1:registerEventHandler( "transition_complete_keyframe", Icon1Frame3 )
					end
				end
				
				Icon1:completeAnimation()
				self.Icon1:setLeftRight( true, false, 32.33, 197.67 )
				self.Icon1:setTopBottom( true, false, -27.51, 137.84 )
				self.Icon1:setAlpha( 1 )
				Icon1Frame2( Icon1, {} )
				local Icon2Frame2 = function ( Icon2, event )
					local Icon2Frame3 = function ( Icon2, event )
						if not event.interrupted then
							Icon2:beginAnimation( "keyframe", 2599, false, false, CoD.TweenType.Linear )
						end
						Icon2:setLeftRight( true, false, 319.67, 485.02 )
						Icon2:setTopBottom( true, false, -27.51, 137.84 )
						Icon2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Icon2, event )
						else
							Icon2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Icon2Frame3( Icon2, event )
						return 
					else
						Icon2:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Linear )
						Icon2:setLeftRight( true, false, 154.33, 319.67 )
						Icon2:setAlpha( 0 )
						Icon2:registerEventHandler( "transition_complete_keyframe", Icon2Frame3 )
					end
				end
				
				Icon2:completeAnimation()
				self.Icon2:setLeftRight( true, false, 319.67, 485.02 )
				self.Icon2:setTopBottom( true, false, -27.51, 137.84 )
				self.Icon2:setAlpha( 1 )
				Icon2Frame2( Icon2, {} )
				local Icon3Frame2 = function ( Icon3, event )
					local Icon3Frame3 = function ( Icon3, event )
						local Icon3Frame4 = function ( Icon3, event )
							local Icon3Frame5 = function ( Icon3, event )
								if not event.interrupted then
									Icon3:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
								end
								Icon3:setAlpha( 0 )
								Icon3:setScale( 1 )
								if event.interrupted then
									self.clipFinished( Icon3, event )
								else
									Icon3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Icon3Frame5( Icon3, event )
								return 
							else
								Icon3:beginAnimation( "keyframe", 2259, false, false, CoD.TweenType.Linear )
								Icon3:setAlpha( 0 )
								Icon3:setScale( 1.02 )
								Icon3:registerEventHandler( "transition_complete_keyframe", Icon3Frame5 )
							end
						end
						
						if event.interrupted then
							Icon3Frame4( Icon3, event )
							return 
						else
							Icon3:beginAnimation( "keyframe", 159, true, false, CoD.TweenType.Linear )
							Icon3:setAlpha( 1 )
							Icon3:setScale( 1.2 )
							Icon3:registerEventHandler( "transition_complete_keyframe", Icon3Frame4 )
						end
					end
					
					if event.interrupted then
						Icon3Frame3( Icon3, event )
						return 
					else
						Icon3:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						Icon3:registerEventHandler( "transition_complete_keyframe", Icon3Frame3 )
					end
				end
				
				Icon3:completeAnimation()
				self.Icon3:setAlpha( 0 )
				self.Icon3:setScale( 1 )
				Icon3Frame2( Icon3, {} )
				Audio:completeAnimation()
				self.Audio:setPlaySoundDirect( true )
				self.Audio:playSound( "uin_cookbook_distill", controller )
				self.clipFinished( Audio, {} )
				self.nextClip = "StartLiquefying"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark20:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

