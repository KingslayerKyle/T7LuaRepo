CoD.CallingCards_SpecialistWeaponsWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_SpecialistWeaponsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_SpecialistWeaponsWidget )
	self.id = "CallingCards_SpecialistWeaponsWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local Firebreak = LUI.UIImage.new()
	Firebreak:setLeftRight( 0, 0, 0, 720 )
	Firebreak:setTopBottom( 0, 0, 0, 180 )
	Firebreak:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_firebreak" ) )
	self:addElement( Firebreak )
	self.Firebreak = Firebreak
	
	local Spectre = LUI.UIImage.new()
	Spectre:setLeftRight( 0, 0, 0, 720 )
	Spectre:setTopBottom( 0, 0, 0, 180 )
	Spectre:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_spectre" ) )
	self:addElement( Spectre )
	self.Spectre = Spectre
	
	local Seraph = LUI.UIImage.new()
	Seraph:setLeftRight( 0, 0, 0, 720 )
	Seraph:setTopBottom( 0, 0, 0, 180 )
	Seraph:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_seraph" ) )
	self:addElement( Seraph )
	self.Seraph = Seraph
	
	local Reaper = LUI.UIImage.new()
	Reaper:setLeftRight( 0, 0, 0, 720 )
	Reaper:setTopBottom( 0, 0, 0, 180 )
	Reaper:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_reaper" ) )
	self:addElement( Reaper )
	self.Reaper = Reaper
	
	local Prophet = LUI.UIImage.new()
	Prophet:setLeftRight( 0, 0, 0, 720 )
	Prophet:setTopBottom( 0, 0, 0, 180 )
	Prophet:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_prophet" ) )
	self:addElement( Prophet )
	self.Prophet = Prophet
	
	local Outrider = LUI.UIImage.new()
	Outrider:setLeftRight( 0, 0, 0, 720 )
	Outrider:setTopBottom( 0, 0, 0, 180 )
	Outrider:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_outrider" ) )
	self:addElement( Outrider )
	self.Outrider = Outrider
	
	local Nomad = LUI.UIImage.new()
	Nomad:setLeftRight( 0, 0, 0, 720 )
	Nomad:setTopBottom( 0, 0, 0, 180 )
	Nomad:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_nomad" ) )
	self:addElement( Nomad )
	self.Nomad = Nomad
	
	local Battery = LUI.UIImage.new()
	Battery:setLeftRight( 0, 0, 0, 720 )
	Battery:setTopBottom( 0, 0, 0, 180 )
	Battery:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_battery" ) )
	self:addElement( Battery )
	self.Battery = Battery
	
	local Ruin = LUI.UIImage.new()
	Ruin:setLeftRight( 0, 0, 0, 720 )
	Ruin:setTopBottom( 0, 0, 0, 180 )
	Ruin:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_ruin" ) )
	self:addElement( Ruin )
	self.Ruin = Ruin
	
	self.resetProperties = function ()
		Ruin:completeAnimation()
		Battery:completeAnimation()
		Nomad:completeAnimation()
		Outrider:completeAnimation()
		Prophet:completeAnimation()
		Reaper:completeAnimation()
		Seraph:completeAnimation()
		Spectre:completeAnimation()
		Firebreak:completeAnimation()
		Ruin:setAlpha( 1 )
		Ruin:setScale( 1 )
		Battery:setAlpha( 1 )
		Battery:setScale( 1 )
		Nomad:setAlpha( 1 )
		Nomad:setScale( 1 )
		Outrider:setAlpha( 1 )
		Outrider:setScale( 1 )
		Prophet:setAlpha( 1 )
		Prophet:setScale( 1 )
		Reaper:setAlpha( 1 )
		Reaper:setScale( 1 )
		Seraph:setAlpha( 1 )
		Seraph:setScale( 1 )
		Spectre:setAlpha( 1 )
		Spectre:setScale( 1 )
		Firebreak:setAlpha( 1 )
		Firebreak:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				local FirebreakFrame2 = function ( Firebreak, event )
					if not event.interrupted then
						Firebreak:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
					end
					Firebreak:setAlpha( 1 )
					Firebreak:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Firebreak, event )
					else
						Firebreak:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Firebreak:beginAnimation( "keyframe", 4809, false, false, CoD.TweenType.Linear )
				Firebreak:setAlpha( 1 )
				Firebreak:setScale( 1 )
				Firebreak:registerEventHandler( "transition_complete_keyframe", FirebreakFrame2 )
				local SpectreFrame2 = function ( Spectre, event )
					if not event.interrupted then
						Spectre:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
					end
					Spectre:setAlpha( 0 )
					Spectre:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Spectre, event )
					else
						Spectre:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Spectre:beginAnimation( "keyframe", 4199, false, false, CoD.TweenType.Linear )
				Spectre:setAlpha( 1 )
				Spectre:setScale( 1 )
				Spectre:registerEventHandler( "transition_complete_keyframe", SpectreFrame2 )
				local SeraphFrame2 = function ( Seraph, event )
					if not event.interrupted then
						Seraph:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
					end
					Seraph:setAlpha( 0 )
					Seraph:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Seraph, event )
					else
						Seraph:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Seraph:beginAnimation( "keyframe", 3619, false, false, CoD.TweenType.Linear )
				Seraph:setAlpha( 1 )
				Seraph:setScale( 1 )
				Seraph:registerEventHandler( "transition_complete_keyframe", SeraphFrame2 )
				local ReaperFrame2 = function ( Reaper, event )
					if not event.interrupted then
						Reaper:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
					end
					Reaper:setAlpha( 0 )
					Reaper:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Reaper, event )
					else
						Reaper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Reaper:beginAnimation( "keyframe", 2980, false, false, CoD.TweenType.Linear )
				Reaper:setAlpha( 1 )
				Reaper:setScale( 1 )
				Reaper:registerEventHandler( "transition_complete_keyframe", ReaperFrame2 )
				local ProphetFrame2 = function ( Prophet, event )
					if not event.interrupted then
						Prophet:beginAnimation( "keyframe", 630, false, false, CoD.TweenType.Linear )
					end
					Prophet:setAlpha( 0 )
					Prophet:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Prophet, event )
					else
						Prophet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Prophet:beginAnimation( "keyframe", 2349, false, false, CoD.TweenType.Linear )
				Prophet:setAlpha( 1 )
				Prophet:setScale( 1 )
				Prophet:registerEventHandler( "transition_complete_keyframe", ProphetFrame2 )
				local OutriderFrame2 = function ( Outrider, event )
					if not event.interrupted then
						Outrider:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
					end
					Outrider:setAlpha( 0 )
					Outrider:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Outrider, event )
					else
						Outrider:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Outrider:beginAnimation( "keyframe", 1759, false, false, CoD.TweenType.Linear )
				Outrider:setAlpha( 1 )
				Outrider:setScale( 1 )
				Outrider:registerEventHandler( "transition_complete_keyframe", OutriderFrame2 )
				local NomadFrame2 = function ( Nomad, event )
					if not event.interrupted then
						Nomad:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					Nomad:setAlpha( 0 )
					Nomad:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Nomad, event )
					else
						Nomad:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Nomad:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
				Nomad:setAlpha( 1 )
				Nomad:setScale( 1 )
				Nomad:registerEventHandler( "transition_complete_keyframe", NomadFrame2 )
				local BatteryFrame2 = function ( Battery, event )
					if not event.interrupted then
						Battery:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
					end
					Battery:setAlpha( 0 )
					Battery:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Battery, event )
					else
						Battery:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Battery:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				Battery:setAlpha( 1 )
				Battery:setScale( 1 )
				Battery:registerEventHandler( "transition_complete_keyframe", BatteryFrame2 )
				local RuinFrame2 = function ( Ruin, event )
					local RuinFrame3 = function ( Ruin, event )
						local RuinFrame4 = function ( Ruin, event )
							if not event.interrupted then
								Ruin:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
							end
							Ruin:setAlpha( 1 )
							Ruin:setScale( 1 )
							if event.interrupted then
								self.clipFinished( Ruin, event )
							else
								Ruin:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RuinFrame4( Ruin, event )
							return 
						else
							Ruin:beginAnimation( "keyframe", 4219, false, false, CoD.TweenType.Linear )
							Ruin:registerEventHandler( "transition_complete_keyframe", RuinFrame4 )
						end
					end
					
					if event.interrupted then
						RuinFrame3( Ruin, event )
						return 
					else
						Ruin:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						Ruin:setAlpha( 0 )
						Ruin:registerEventHandler( "transition_complete_keyframe", RuinFrame3 )
					end
				end
				
				Ruin:completeAnimation()
				self.Ruin:setAlpha( 1 )
				self.Ruin:setScale( 1 )
				RuinFrame2( Ruin, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

