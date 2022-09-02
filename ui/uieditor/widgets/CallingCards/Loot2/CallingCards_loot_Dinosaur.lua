-- a12f454b423ab51d08a7487ebe0c49ce
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_loot_Dinosaur = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_Dinosaur.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_Dinosaur )
	self.id = "CallingCards_loot_Dinosaur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_dinosaurs_master_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Glow00 = LUI.UIImage.new()
	Glow00:setLeftRight( true, false, 53.26, 589.07 )
	Glow00:setTopBottom( true, false, -81.86, 81.86 )
	Glow00:setRGB( 0.93, 1, 0.72 )
	Glow00:setAlpha( 0 )
	Glow00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow00 )
	self.Glow00 = Glow00
	
	local Dino2 = LUI.UIImage.new()
	Dino2:setLeftRight( true, false, 0, 480 )
	Dino2:setTopBottom( true, false, 0, 120 )
	Dino2:setImage( RegisterImage( "uie_t7_loot_callingcard_dinosaurs_master_dino1" ) )
	self:addElement( Dino2 )
	self.Dino2 = Dino2
	
	local Dino1 = LUI.UIImage.new()
	Dino1:setLeftRight( true, false, 0, 480 )
	Dino1:setTopBottom( true, false, 0, 120 )
	Dino1:setImage( RegisterImage( "uie_t7_loot_callingcard_dinosaurs_master_dino2" ) )
	self:addElement( Dino1 )
	self.Dino1 = Dino1
	
	local glow1 = LUI.UIImage.new()
	glow1:setLeftRight( true, false, 119, 181 )
	glow1:setTopBottom( true, false, 20, 82 )
	glow1:setImage( RegisterImage( "uie_t7_loot_callingcard_dinosaurs_master_ray2" ) )
	self:addElement( glow1 )
	self.glow1 = glow1
	
	local glow2 = LUI.UIImage.new()
	glow2:setLeftRight( true, false, 119, 181 )
	glow2:setTopBottom( true, false, 20, 82 )
	glow2:setImage( RegisterImage( "uie_t7_loot_callingcard_dinosaurs_master_ray1" ) )
	self:addElement( glow2 )
	self.glow2 = glow2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						local Glow00Frame4 = function ( Glow00, event )
							local Glow00Frame5 = function ( Glow00, event )
								if not event.interrupted then
									Glow00:beginAnimation( "keyframe", 1060, false, false, CoD.TweenType.Linear )
								end
								Glow00:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow00, event )
								else
									Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Glow00Frame5( Glow00, event )
								return 
							else
								Glow00:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								Glow00:setAlpha( 0.7 )
								Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame5 )
							end
						end
						
						if event.interrupted then
							Glow00Frame4( Glow00, event )
							return 
						else
							Glow00:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
							Glow00:setAlpha( 0 )
							Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame4 )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						Glow00:setAlpha( 0.7 )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:completeAnimation()
				self.Glow00:setAlpha( 0 )
				Glow00Frame2( Glow00, {} )
				local Dino2Frame2 = function ( Dino2, event )
					local Dino2Frame3 = function ( Dino2, event )
						local Dino2Frame4 = function ( Dino2, event )
							local Dino2Frame5 = function ( Dino2, event )
								if not event.interrupted then
									Dino2:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								end
								Dino2:setLeftRight( true, false, 0, 480 )
								Dino2:setTopBottom( true, false, 0, 120 )
								Dino2:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( Dino2, event )
								else
									Dino2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dino2Frame5( Dino2, event )
								return 
							else
								Dino2:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
								Dino2:setLeftRight( true, false, -11, 469 )
								Dino2:registerEventHandler( "transition_complete_keyframe", Dino2Frame5 )
							end
						end
						
						if event.interrupted then
							Dino2Frame4( Dino2, event )
							return 
						else
							Dino2:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
							Dino2:setLeftRight( true, false, 0, 480 )
							Dino2:registerEventHandler( "transition_complete_keyframe", Dino2Frame4 )
						end
					end
					
					if event.interrupted then
						Dino2Frame3( Dino2, event )
						return 
					else
						Dino2:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						Dino2:setLeftRight( true, false, -11, 469 )
						Dino2:registerEventHandler( "transition_complete_keyframe", Dino2Frame3 )
					end
				end
				
				Dino2:completeAnimation()
				self.Dino2:setLeftRight( true, false, 0, 480 )
				self.Dino2:setTopBottom( true, false, 0, 120 )
				self.Dino2:setAlpha( 1 )
				Dino2Frame2( Dino2, {} )
				local Dino1Frame2 = function ( Dino1, event )
					local Dino1Frame3 = function ( Dino1, event )
						local Dino1Frame4 = function ( Dino1, event )
							local Dino1Frame5 = function ( Dino1, event )
								if not event.interrupted then
									Dino1:beginAnimation( "keyframe", 1030, false, false, CoD.TweenType.Linear )
								end
								Dino1:setLeftRight( true, false, 0, 480 )
								Dino1:setTopBottom( true, false, 0, 120 )
								Dino1:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( Dino1, event )
								else
									Dino1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dino1Frame5( Dino1, event )
								return 
							else
								Dino1:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
								Dino1:setLeftRight( true, false, 18, 498 )
								Dino1:registerEventHandler( "transition_complete_keyframe", Dino1Frame5 )
							end
						end
						
						if event.interrupted then
							Dino1Frame4( Dino1, event )
							return 
						else
							Dino1:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
							Dino1:setLeftRight( true, false, 0, 480 )
							Dino1:registerEventHandler( "transition_complete_keyframe", Dino1Frame4 )
						end
					end
					
					if event.interrupted then
						Dino1Frame3( Dino1, event )
						return 
					else
						Dino1:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						Dino1:setLeftRight( true, false, 18, 498 )
						Dino1:registerEventHandler( "transition_complete_keyframe", Dino1Frame3 )
					end
				end
				
				Dino1:completeAnimation()
				self.Dino1:setLeftRight( true, false, 0, 480 )
				self.Dino1:setTopBottom( true, false, 0, 120 )
				self.Dino1:setAlpha( 1 )
				Dino1Frame2( Dino1, {} )
				local glow1Frame2 = function ( glow1, event )
					local glow1Frame3 = function ( glow1, event )
						local glow1Frame4 = function ( glow1, event )
							local glow1Frame5 = function ( glow1, event )
								if not event.interrupted then
									glow1:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
								end
								glow1:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( glow1, event )
								else
									glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								glow1Frame5( glow1, event )
								return 
							else
								glow1:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
								glow1:setAlpha( 0.11 )
								glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame5 )
							end
						end
						
						if event.interrupted then
							glow1Frame4( glow1, event )
							return 
						else
							glow1:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
							glow1:setAlpha( 1 )
							glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame4 )
						end
					end
					
					if event.interrupted then
						glow1Frame3( glow1, event )
						return 
					else
						glow1:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						glow1:setAlpha( 0.11 )
						glow1:registerEventHandler( "transition_complete_keyframe", glow1Frame3 )
					end
				end
				
				glow1:completeAnimation()
				self.glow1:setAlpha( 1 )
				glow1Frame2( glow1, {} )
				local glow2Frame2 = function ( glow2, event )
					local glow2Frame3 = function ( glow2, event )
						local glow2Frame4 = function ( glow2, event )
							local glow2Frame5 = function ( glow2, event )
								local glow2Frame6 = function ( glow2, event )
									if not event.interrupted then
										glow2:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
									end
									glow2:setAlpha( 0 )
									glow2:setScale( 1 )
									if event.interrupted then
										self.clipFinished( glow2, event )
									else
										glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									glow2Frame6( glow2, event )
									return 
								else
									glow2:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
									glow2:setAlpha( 0.72 )
									glow2:setScale( 1.7 )
									glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame6 )
								end
							end
							
							if event.interrupted then
								glow2Frame5( glow2, event )
								return 
							else
								glow2:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
								glow2:setAlpha( 1 )
								glow2:setScale( 1.26 )
								glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame5 )
							end
						end
						
						if event.interrupted then
							glow2Frame4( glow2, event )
							return 
						else
							glow2:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
							glow2:setAlpha( 0 )
							glow2:setScale( 1 )
							glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame4 )
						end
					end
					
					if event.interrupted then
						glow2Frame3( glow2, event )
						return 
					else
						glow2:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						glow2:setAlpha( 1 )
						glow2:setScale( 1.7 )
						glow2:registerEventHandler( "transition_complete_keyframe", glow2Frame3 )
					end
				end
				
				glow2:completeAnimation()
				self.glow2:setAlpha( 0 )
				self.glow2:setScale( 1 )
				glow2Frame2( glow2, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

