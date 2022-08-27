-- db30cf7ede8fdf5dca4d328e56eb7f56
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLuancherSpikeCounter_TitleReady = InheritFrom( LUI.UIElement )
CoD.SpikeLuancherSpikeCounter_TitleReady.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLuancherSpikeCounter_TitleReady )
	self.id = "SpikeLuancherSpikeCounter_TitleReady"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 248 )
	self:setTopBottom( true, false, 0, 192 )
	
	local Ready = LUI.UIImage.new()
	Ready:setLeftRight( true, true, 0, 0 )
	Ready:setTopBottom( true, true, 0, 0 )
	Ready:setAlpha( 0 )
	Ready:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelaunchercounter_titleready" ) )
	self:addElement( Ready )
	self.Ready = Ready
	
	local Standby = LUI.UIImage.new()
	Standby:setLeftRight( true, true, 0, 0 )
	Standby:setTopBottom( true, true, 0, 0 )
	Standby:setAlpha( 0 )
	Standby:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelaunchercounter_titlestandby" ) )
	self:addElement( Standby )
	self.Standby = Standby
	
	local Blast = LUI.UIImage.new()
	Blast:setLeftRight( true, true, 0, 0 )
	Blast:setTopBottom( true, true, 0, 0 )
	Blast:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelaunchercounter_titleblast" ) )
	self:addElement( Blast )
	self.Blast = Blast
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Ready:completeAnimation()
				self.Ready:setAlpha( 0 )
				self.clipFinished( Ready, {} )
				Standby:completeAnimation()
				self.Standby:setAlpha( 1 )
				self.clipFinished( Standby, {} )
				Blast:completeAnimation()
				self.Blast:setAlpha( 0 )
				self.clipFinished( Blast, {} )
			end
		},
		Blasting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Ready:completeAnimation()
				self.Ready:setAlpha( 0 )
				self.clipFinished( Ready, {} )
				Standby:completeAnimation()
				self.Standby:setAlpha( 0 )
				self.clipFinished( Standby, {} )
				local BlastFrame2 = function ( Blast, event )
					local BlastFrame3 = function ( Blast, event )
						local BlastFrame4 = function ( Blast, event )
							local BlastFrame5 = function ( Blast, event )
								local BlastFrame6 = function ( Blast, event )
									local BlastFrame7 = function ( Blast, event )
										if not event.interrupted then
											Blast:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										end
										Blast:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Blast, event )
										else
											Blast:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										BlastFrame7( Blast, event )
										return 
									else
										Blast:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										Blast:setAlpha( 0 )
										Blast:registerEventHandler( "transition_complete_keyframe", BlastFrame7 )
									end
								end
								
								if event.interrupted then
									BlastFrame6( Blast, event )
									return 
								else
									Blast:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Blast:registerEventHandler( "transition_complete_keyframe", BlastFrame6 )
								end
							end
							
							if event.interrupted then
								BlastFrame5( Blast, event )
								return 
							else
								Blast:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Blast:setAlpha( 0.5 )
								Blast:registerEventHandler( "transition_complete_keyframe", BlastFrame5 )
							end
						end
						
						if event.interrupted then
							BlastFrame4( Blast, event )
							return 
						else
							Blast:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Blast:setAlpha( 0 )
							Blast:registerEventHandler( "transition_complete_keyframe", BlastFrame4 )
						end
					end
					
					if event.interrupted then
						BlastFrame3( Blast, event )
						return 
					else
						Blast:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Blast:registerEventHandler( "transition_complete_keyframe", BlastFrame3 )
					end
				end
				
				Blast:completeAnimation()
				self.Blast:setAlpha( 1 )
				BlastFrame2( Blast, {} )
				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local StandbyFrame2 = function ( Standby, event )
					local StandbyFrame3 = function ( Standby, event )
						local StandbyFrame4 = function ( Standby, event )
							local StandbyFrame5 = function ( Standby, event )
								if not event.interrupted then
									Standby:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								end
								Standby:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( Standby, event )
								else
									Standby:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								StandbyFrame5( Standby, event )
								return 
							else
								Standby:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Standby:registerEventHandler( "transition_complete_keyframe", StandbyFrame5 )
							end
						end
						
						if event.interrupted then
							StandbyFrame4( Standby, event )
							return 
						else
							Standby:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Standby:setAlpha( 0 )
							Standby:registerEventHandler( "transition_complete_keyframe", StandbyFrame4 )
						end
					end
					
					if event.interrupted then
						StandbyFrame3( Standby, event )
						return 
					else
						Standby:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Standby:setAlpha( 1 )
						Standby:registerEventHandler( "transition_complete_keyframe", StandbyFrame3 )
					end
				end
				
				Standby:completeAnimation()
				self.Standby:setAlpha( 0 )
				StandbyFrame2( Standby, {} )
				local BlastFrame2 = function ( Blast, event )
					if not event.interrupted then
						Blast:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
					end
					Blast:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Blast, event )
					else
						Blast:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Blast:completeAnimation()
				self.Blast:setAlpha( 1 )
				BlastFrame2( Blast, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Ready:completeAnimation()
				self.Ready:setAlpha( 1 )
				self.clipFinished( Ready, {} )
				Standby:completeAnimation()
				self.Standby:setAlpha( 0 )
				self.clipFinished( Standby, {} )
				Blast:completeAnimation()
				self.Blast:setAlpha( 0 )
				self.clipFinished( Blast, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

