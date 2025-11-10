require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.AmmoWidgetMP_LowAmmoGlow = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_LowAmmoGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_LowAmmoGlow )
	self.id = "AmmoWidgetMP_LowAmmoGlow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 71 )
	self:setTopBottom( true, false, 0, 37 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( true, true, 0, 0 )
	FEButtonPanel0:setAlpha( 0 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )
			end,
			LowAmmo = function ()
				self:setupElementClipCounter( 1 )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end
		},
		Hero = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )
			end,
			LowAmmo = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end
		},
		LowAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 1 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end,
			Hero = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 1 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end,
			Knife = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 1 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.4 )
				self.clipFinished( FEButtonPanel0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.4 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end,
			LowAmmo = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.4 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end,
			Hero = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0.4 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end,
			Knife = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end
		},
		Knife = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				self.clipFinished( FEButtonPanel0, {} )
			end,
			LowAmmo = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 1 )
				local FEButtonPanel0Frame2 = function ( FEButtonPanel0, event )
					if not event.interrupted then
						FEButtonPanel0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Bounce )
					end
					FEButtonPanel0:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( FEButtonPanel0, event )
					else
						FEButtonPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setAlpha( 0 )
				FEButtonPanel0Frame2( FEButtonPanel0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

