CoD.AbilityWheel_CenterElements = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_CenterElements.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_CenterElements )
	self.id = "AbilityWheel_CenterElements"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 216 )
	self:setTopBottom( true, false, 0, 216 )
	
	local Grad = LUI.UIImage.new()
	Grad:setLeftRight( false, false, -108, 108 )
	Grad:setTopBottom( false, false, -108, 108 )
	Grad:setRGB( 1, 1, 1 )
	Grad:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradcenter" ) )
	Grad:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Grad )
	self.Grad = Grad
	
	local TopDots = LUI.UIImage.new()
	TopDots:setLeftRight( false, false, -36, 36 )
	TopDots:setTopBottom( false, false, -80, -64 )
	TopDots:setRGB( 1, 1, 1 )
	TopDots:setAlpha( RandomAddPercent( 1, -10 ) )
	TopDots:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_centertopdots" ) )
	TopDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TopDots )
	self.TopDots = TopDots
	
	local TopGrid = LUI.UIImage.new()
	TopGrid:setLeftRight( false, false, -16, 16 )
	TopGrid:setTopBottom( false, false, -101, -85 )
	TopGrid:setRGB( 1, 1, 1 )
	TopGrid:setAlpha( RandomAddPercent( 0.7, -10 ) )
	TopGrid:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_centertopgrid" ) )
	TopGrid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TopGrid )
	self.TopGrid = TopGrid
	
	local TopGrid0 = LUI.UIImage.new()
	TopGrid0:setLeftRight( false, false, -16, 16 )
	TopGrid0:setTopBottom( false, false, 84, 100 )
	TopGrid0:setRGB( 1, 1, 1 )
	TopGrid0:setAlpha( RandomAddPercent( 0.7, -10 ) )
	TopGrid0:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_centertopgrid" ) )
	TopGrid0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TopGrid0 )
	self.TopGrid0 = TopGrid0
	
	local TitleBar = LUI.UIImage.new()
	TitleBar:setLeftRight( false, false, -76, 76 )
	TitleBar:setTopBottom( false, false, -21, -13 )
	TitleBar:setRGB( 1, 1, 1 )
	TitleBar:setAlpha( RandomAddPercent( 0.7, -10 ) )
	TitleBar:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_centertitlebar" ) )
	TitleBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleBar )
	self.TitleBar = TitleBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Grad:completeAnimation()
				self.Grad:setAlpha( 1 )
				self.clipFinished( Grad, {} )
				local TopDotsFrame2 = function ( TopDots, event )
					local TopDotsFrame3 = function ( TopDots, event )
						local TopDotsFrame4 = function ( TopDots, event )
							if not event.interrupted then
								TopDots:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							end
							TopDots:setAlpha( RandomAddPercent( 0.99, -10 ) )
							if event.interrupted then
								self.clipFinished( TopDots, event )
							else
								TopDots:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TopDotsFrame4( TopDots, event )
							return 
						else
							TopDots:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							TopDots:setAlpha( RandomAddPercent( 1, -10 ) )
							TopDots:registerEventHandler( "transition_complete_keyframe", TopDotsFrame4 )
						end
					end
					
					if event.interrupted then
						TopDotsFrame3( TopDots, event )
						return 
					else
						TopDots:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						TopDots:setAlpha( RandomAddPercent( 0.99, -10 ) )
						TopDots:registerEventHandler( "transition_complete_keyframe", TopDotsFrame3 )
					end
				end
				
				TopDots:completeAnimation()
				self.TopDots:setAlpha( RandomAddPercent( 1, -10 ) )
				TopDotsFrame2( TopDots, {} )
				local TopGridFrame2 = function ( TopGrid, event )
					local TopGridFrame3 = function ( TopGrid, event )
						local TopGridFrame4 = function ( TopGrid, event )
							if not event.interrupted then
								TopGrid:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							TopGrid:setAlpha( RandomAddPercent( 0.69, -10 ) )
							if event.interrupted then
								self.clipFinished( TopGrid, event )
							else
								TopGrid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TopGridFrame4( TopGrid, event )
							return 
						else
							TopGrid:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							TopGrid:setAlpha( RandomAddPercent( 0.7, -10 ) )
							TopGrid:registerEventHandler( "transition_complete_keyframe", TopGridFrame4 )
						end
					end
					
					if event.interrupted then
						TopGridFrame3( TopGrid, event )
						return 
					else
						TopGrid:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						TopGrid:setAlpha( RandomAddPercent( 0.69, -10 ) )
						TopGrid:registerEventHandler( "transition_complete_keyframe", TopGridFrame3 )
					end
				end
				
				TopGrid:completeAnimation()
				self.TopGrid:setAlpha( RandomAddPercent( 0.7, -10 ) )
				TopGridFrame2( TopGrid, {} )
				local TopGrid0Frame2 = function ( TopGrid0, event )
					local TopGrid0Frame3 = function ( TopGrid0, event )
						local TopGrid0Frame4 = function ( TopGrid0, event )
							if not event.interrupted then
								TopGrid0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							TopGrid0:setAlpha( RandomAddPercent( 0.69, -10 ) )
							if event.interrupted then
								self.clipFinished( TopGrid0, event )
							else
								TopGrid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TopGrid0Frame4( TopGrid0, event )
							return 
						else
							TopGrid0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							TopGrid0:setAlpha( RandomAddPercent( 0.7, -10 ) )
							TopGrid0:registerEventHandler( "transition_complete_keyframe", TopGrid0Frame4 )
						end
					end
					
					if event.interrupted then
						TopGrid0Frame3( TopGrid0, event )
						return 
					else
						TopGrid0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						TopGrid0:setAlpha( RandomAddPercent( 0.69, -10 ) )
						TopGrid0:registerEventHandler( "transition_complete_keyframe", TopGrid0Frame3 )
					end
				end
				
				TopGrid0:completeAnimation()
				self.TopGrid0:setAlpha( RandomAddPercent( 0.7, -10 ) )
				TopGrid0Frame2( TopGrid0, {} )
				local TitleBarFrame2 = function ( TitleBar, event )
					if not event.interrupted then
						TitleBar:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TitleBar:setAlpha( RandomAddPercent( 0.69, -10 ) )
					if event.interrupted then
						self.clipFinished( TitleBar, event )
					else
						TitleBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TitleBar:completeAnimation()
				self.TitleBar:setAlpha( RandomAddPercent( 0.7, -10 ) )
				TitleBarFrame2( TitleBar, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

