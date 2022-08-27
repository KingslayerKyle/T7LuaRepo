-- d739632c14af49ed10b2f897019520c0
-- This hash is used for caching, delete to decompile the file again

CoD.OutcomeFactionIconItemForCodCaster = InheritFrom( LUI.UIElement )
CoD.OutcomeFactionIconItemForCodCaster.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OutcomeFactionIconItemForCodCaster )
	self.id = "OutcomeFactionIconItemForCodCaster"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 222 )
	self:setTopBottom( true, false, 0, 140 )
	
	local WinningTeamFactionIcon0 = LUI.UIImage.new()
	WinningTeamFactionIcon0:setLeftRight( true, false, 0, 222 )
	WinningTeamFactionIcon0:setTopBottom( true, false, 0, 140 )
	WinningTeamFactionIcon0:setRGB( 0, 0, 0 )
	WinningTeamFactionIcon0:setAlpha( 0.5 )
	WinningTeamFactionIcon0:setImage( RegisterImage( "uie_t7_icon_team_winslow" ) )
	self:addElement( WinningTeamFactionIcon0 )
	self.WinningTeamFactionIcon0 = WinningTeamFactionIcon0
	
	local WinningTeamFactionIcon = LUI.UIImage.new()
	WinningTeamFactionIcon:setLeftRight( true, false, 0, 222 )
	WinningTeamFactionIcon:setTopBottom( true, false, 0, 140 )
	WinningTeamFactionIcon:setImage( RegisterImage( "uie_t7_icon_team_winslow" ) )
	WinningTeamFactionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( WinningTeamFactionIcon )
	self.WinningTeamFactionIcon = WinningTeamFactionIcon
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 37, 193 )
	Image1:setTopBottom( true, false, 2.34, 139.56 )
	Image1:setAlpha( 0.15 )
	Image1:setImage( RegisterImage( "uie_t7_mp_menu_startflow_hexlarge" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Pixel20100 = LUI.UIImage.new()
	Pixel20100:setLeftRight( true, false, 47.5, 83.5 )
	Pixel20100:setTopBottom( false, false, 60.22, 64.22 )
	Pixel20100:setAlpha( 0.73 )
	Pixel20100:setYRot( -180 )
	Pixel20100:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100 )
	self.Pixel20100 = Pixel20100
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( true, false, 47.5, 83.5 )
	Pixel201000:setTopBottom( false, false, -61.78, -57.78 )
	Pixel201000:setAlpha( 0.73 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel201001 = LUI.UIImage.new()
	Pixel201001:setLeftRight( true, false, 142.5, 178.5 )
	Pixel201001:setTopBottom( false, false, 60.22, 64.22 )
	Pixel201001:setAlpha( 0.73 )
	Pixel201001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201001 )
	self.Pixel201001 = Pixel201001
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( true, false, 142.5, 178.5 )
	Pixel2010000:setTopBottom( false, false, -61.78, -57.78 )
	Pixel2010000:setAlpha( 0.73 )
	Pixel2010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010000 )
	self.Pixel2010000 = Pixel2010000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				local WinningTeamFactionIcon0Frame2 = function ( WinningTeamFactionIcon0, event )
					local WinningTeamFactionIcon0Frame3 = function ( WinningTeamFactionIcon0, event )
						if not event.interrupted then
							WinningTeamFactionIcon0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Bounce )
						end
						WinningTeamFactionIcon0:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( WinningTeamFactionIcon0, event )
						else
							WinningTeamFactionIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinningTeamFactionIcon0Frame3( WinningTeamFactionIcon0, event )
						return 
					else
						WinningTeamFactionIcon0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						WinningTeamFactionIcon0:registerEventHandler( "transition_complete_keyframe", WinningTeamFactionIcon0Frame3 )
					end
				end
				
				WinningTeamFactionIcon0:completeAnimation()
				self.WinningTeamFactionIcon0:setAlpha( 0 )
				WinningTeamFactionIcon0Frame2( WinningTeamFactionIcon0, {} )
				local WinningTeamFactionIconFrame2 = function ( WinningTeamFactionIcon, event )
					local WinningTeamFactionIconFrame3 = function ( WinningTeamFactionIcon, event )
						if not event.interrupted then
							WinningTeamFactionIcon:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						WinningTeamFactionIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( WinningTeamFactionIcon, event )
						else
							WinningTeamFactionIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinningTeamFactionIconFrame3( WinningTeamFactionIcon, event )
						return 
					else
						WinningTeamFactionIcon:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						WinningTeamFactionIcon:registerEventHandler( "transition_complete_keyframe", WinningTeamFactionIconFrame3 )
					end
				end
				
				WinningTeamFactionIcon:completeAnimation()
				self.WinningTeamFactionIcon:setAlpha( 0 )
				WinningTeamFactionIconFrame2( WinningTeamFactionIcon, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						Image1:setAlpha( 0.15 )
						if event.interrupted then
							self.clipFinished( Image1, event )
						else
							Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Pixel20100Frame2 = function ( Pixel20100, event )
					local Pixel20100Frame3 = function ( Pixel20100, event )
						if not event.interrupted then
							Pixel20100:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						Pixel20100:setAlpha( 0.73 )
						if event.interrupted then
							self.clipFinished( Pixel20100, event )
						else
							Pixel20100:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel20100Frame3( Pixel20100, event )
						return 
					else
						Pixel20100:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						Pixel20100:registerEventHandler( "transition_complete_keyframe", Pixel20100Frame3 )
					end
				end
				
				Pixel20100:completeAnimation()
				self.Pixel20100:setAlpha( 0 )
				Pixel20100Frame2( Pixel20100, {} )
				local Pixel201000Frame2 = function ( Pixel201000, event )
					local Pixel201000Frame3 = function ( Pixel201000, event )
						if not event.interrupted then
							Pixel201000:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
						end
						Pixel201000:setAlpha( 0.73 )
						if event.interrupted then
							self.clipFinished( Pixel201000, event )
						else
							Pixel201000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel201000Frame3( Pixel201000, event )
						return 
					else
						Pixel201000:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						Pixel201000:registerEventHandler( "transition_complete_keyframe", Pixel201000Frame3 )
					end
				end
				
				Pixel201000:completeAnimation()
				self.Pixel201000:setAlpha( 0 )
				Pixel201000Frame2( Pixel201000, {} )
				local Pixel201001Frame2 = function ( Pixel201001, event )
					local Pixel201001Frame3 = function ( Pixel201001, event )
						if not event.interrupted then
							Pixel201001:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						Pixel201001:setAlpha( 0.73 )
						if event.interrupted then
							self.clipFinished( Pixel201001, event )
						else
							Pixel201001:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel201001Frame3( Pixel201001, event )
						return 
					else
						Pixel201001:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						Pixel201001:registerEventHandler( "transition_complete_keyframe", Pixel201001Frame3 )
					end
				end
				
				Pixel201001:completeAnimation()
				self.Pixel201001:setAlpha( 0 )
				Pixel201001Frame2( Pixel201001, {} )
				local Pixel2010000Frame2 = function ( Pixel2010000, event )
					local Pixel2010000Frame3 = function ( Pixel2010000, event )
						if not event.interrupted then
							Pixel2010000:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						Pixel2010000:setAlpha( 0.73 )
						if event.interrupted then
							self.clipFinished( Pixel2010000, event )
						else
							Pixel2010000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel2010000Frame3( Pixel2010000, event )
						return 
					else
						Pixel2010000:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						Pixel2010000:registerEventHandler( "transition_complete_keyframe", Pixel2010000Frame3 )
					end
				end
				
				Pixel2010000:completeAnimation()
				self.Pixel2010000:setAlpha( 0 )
				Pixel2010000Frame2( Pixel2010000, {} )
			end
		},
		Killcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				WinningTeamFactionIcon0:completeAnimation()
				self.WinningTeamFactionIcon0:setAlpha( 0 )
				self.clipFinished( WinningTeamFactionIcon0, {} )
				WinningTeamFactionIcon:completeAnimation()
				self.WinningTeamFactionIcon:setAlpha( 0 )
				self.clipFinished( WinningTeamFactionIcon, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				Pixel20100:completeAnimation()
				self.Pixel20100:setAlpha( 0 )
				self.clipFinished( Pixel20100, {} )
				Pixel201000:completeAnimation()
				self.Pixel201000:setAlpha( 0 )
				self.clipFinished( Pixel201000, {} )
				Pixel201001:completeAnimation()
				self.Pixel201001:setAlpha( 0 )
				self.clipFinished( Pixel201001, {} )
				Pixel2010000:completeAnimation()
				self.Pixel2010000:setAlpha( 0 )
				self.clipFinished( Pixel2010000, {} )
			end
		},
		FinalKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				local WinningTeamFactionIcon0Frame2 = function ( WinningTeamFactionIcon0, event )
					local WinningTeamFactionIcon0Frame3 = function ( WinningTeamFactionIcon0, event )
						if not event.interrupted then
							WinningTeamFactionIcon0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Bounce )
						end
						WinningTeamFactionIcon0:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( WinningTeamFactionIcon0, event )
						else
							WinningTeamFactionIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinningTeamFactionIcon0Frame3( WinningTeamFactionIcon0, event )
						return 
					else
						WinningTeamFactionIcon0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						WinningTeamFactionIcon0:registerEventHandler( "transition_complete_keyframe", WinningTeamFactionIcon0Frame3 )
					end
				end
				
				WinningTeamFactionIcon0:completeAnimation()
				self.WinningTeamFactionIcon0:setAlpha( 0 )
				WinningTeamFactionIcon0Frame2( WinningTeamFactionIcon0, {} )
				local WinningTeamFactionIconFrame2 = function ( WinningTeamFactionIcon, event )
					local WinningTeamFactionIconFrame3 = function ( WinningTeamFactionIcon, event )
						if not event.interrupted then
							WinningTeamFactionIcon:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						WinningTeamFactionIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( WinningTeamFactionIcon, event )
						else
							WinningTeamFactionIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WinningTeamFactionIconFrame3( WinningTeamFactionIcon, event )
						return 
					else
						WinningTeamFactionIcon:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						WinningTeamFactionIcon:registerEventHandler( "transition_complete_keyframe", WinningTeamFactionIconFrame3 )
					end
				end
				
				WinningTeamFactionIcon:completeAnimation()
				self.WinningTeamFactionIcon:setAlpha( 0 )
				WinningTeamFactionIconFrame2( WinningTeamFactionIcon, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						Image1:setAlpha( 0.15 )
						if event.interrupted then
							self.clipFinished( Image1, event )
						else
							Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Pixel20100Frame2 = function ( Pixel20100, event )
					local Pixel20100Frame3 = function ( Pixel20100, event )
						if not event.interrupted then
							Pixel20100:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						end
						Pixel20100:setAlpha( 0.73 )
						if event.interrupted then
							self.clipFinished( Pixel20100, event )
						else
							Pixel20100:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel20100Frame3( Pixel20100, event )
						return 
					else
						Pixel20100:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						Pixel20100:registerEventHandler( "transition_complete_keyframe", Pixel20100Frame3 )
					end
				end
				
				Pixel20100:completeAnimation()
				self.Pixel20100:setAlpha( 0 )
				Pixel20100Frame2( Pixel20100, {} )
				local Pixel201000Frame2 = function ( Pixel201000, event )
					local Pixel201000Frame3 = function ( Pixel201000, event )
						if not event.interrupted then
							Pixel201000:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
						end
						Pixel201000:setAlpha( 0.73 )
						if event.interrupted then
							self.clipFinished( Pixel201000, event )
						else
							Pixel201000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel201000Frame3( Pixel201000, event )
						return 
					else
						Pixel201000:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						Pixel201000:registerEventHandler( "transition_complete_keyframe", Pixel201000Frame3 )
					end
				end
				
				Pixel201000:completeAnimation()
				self.Pixel201000:setAlpha( 0 )
				Pixel201000Frame2( Pixel201000, {} )
				local Pixel201001Frame2 = function ( Pixel201001, event )
					local Pixel201001Frame3 = function ( Pixel201001, event )
						if not event.interrupted then
							Pixel201001:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						Pixel201001:setAlpha( 0.73 )
						if event.interrupted then
							self.clipFinished( Pixel201001, event )
						else
							Pixel201001:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel201001Frame3( Pixel201001, event )
						return 
					else
						Pixel201001:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						Pixel201001:registerEventHandler( "transition_complete_keyframe", Pixel201001Frame3 )
					end
				end
				
				Pixel201001:completeAnimation()
				self.Pixel201001:setAlpha( 0 )
				Pixel201001Frame2( Pixel201001, {} )
				local Pixel2010000Frame2 = function ( Pixel2010000, event )
					local Pixel2010000Frame3 = function ( Pixel2010000, event )
						if not event.interrupted then
							Pixel2010000:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Bounce )
						end
						Pixel2010000:setAlpha( 0.73 )
						if event.interrupted then
							self.clipFinished( Pixel2010000, event )
						else
							Pixel2010000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Pixel2010000Frame3( Pixel2010000, event )
						return 
					else
						Pixel2010000:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						Pixel2010000:registerEventHandler( "transition_complete_keyframe", Pixel2010000Frame3 )
					end
				end
				
				Pixel2010000:completeAnimation()
				self.Pixel2010000:setAlpha( 0 )
				Pixel2010000Frame2( Pixel2010000, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

