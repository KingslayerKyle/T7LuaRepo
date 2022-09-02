-- 1ae47dd6b6e652bbd005457ab387949c
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Firebreak = LUI.UIImage.new()
	Firebreak:setLeftRight( true, false, 0, 480 )
	Firebreak:setTopBottom( true, false, 0, 120 )
	Firebreak:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_firebreak" ) )
	self:addElement( Firebreak )
	self.Firebreak = Firebreak
	
	local Spectre = LUI.UIImage.new()
	Spectre:setLeftRight( true, false, 0, 480 )
	Spectre:setTopBottom( true, false, 0, 120 )
	Spectre:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_spectre" ) )
	self:addElement( Spectre )
	self.Spectre = Spectre
	
	local Seraph = LUI.UIImage.new()
	Seraph:setLeftRight( true, false, 0, 480 )
	Seraph:setTopBottom( true, false, 0, 120 )
	Seraph:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_seraph" ) )
	self:addElement( Seraph )
	self.Seraph = Seraph
	
	local Reaper = LUI.UIImage.new()
	Reaper:setLeftRight( true, false, 0, 480 )
	Reaper:setTopBottom( true, false, 0, 120 )
	Reaper:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_reaper" ) )
	self:addElement( Reaper )
	self.Reaper = Reaper
	
	local Prophet = LUI.UIImage.new()
	Prophet:setLeftRight( true, false, 0, 480 )
	Prophet:setTopBottom( true, false, 0, 120 )
	Prophet:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_prophet" ) )
	self:addElement( Prophet )
	self.Prophet = Prophet
	
	local Outrider = LUI.UIImage.new()
	Outrider:setLeftRight( true, false, 0, 480 )
	Outrider:setTopBottom( true, false, 0, 120 )
	Outrider:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_outrider" ) )
	self:addElement( Outrider )
	self.Outrider = Outrider
	
	local Nomad = LUI.UIImage.new()
	Nomad:setLeftRight( true, false, 0, 480 )
	Nomad:setTopBottom( true, false, 0, 120 )
	Nomad:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_nomad" ) )
	self:addElement( Nomad )
	self.Nomad = Nomad
	
	local Battery = LUI.UIImage.new()
	Battery:setLeftRight( true, false, 0, 480 )
	Battery:setTopBottom( true, false, 0, 120 )
	Battery:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_battery" ) )
	self:addElement( Battery )
	self.Battery = Battery
	
	local Ruin = LUI.UIImage.new()
	Ruin:setLeftRight( true, false, 0, 480 )
	Ruin:setTopBottom( true, false, 0, 120 )
	Ruin:setImage( RegisterImage( "uie_t7_callingcards_specilistweapons_ruin" ) )
	self:addElement( Ruin )
	self.Ruin = Ruin
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				local f2_local0 = function ( f3_arg0, f3_arg1 )
					if not f3_arg1.interrupted then
						f3_arg0:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
					end
					f3_arg0:setAlpha( 1 )
					f3_arg0:setScale( 1 )
					if f3_arg1.interrupted then
						self.clipFinished( f3_arg0, f3_arg1 )
					else
						f3_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Firebreak:beginAnimation( "keyframe", 4809, false, false, CoD.TweenType.Linear )
				Firebreak:setAlpha( 1 )
				Firebreak:setScale( 1 )
				Firebreak:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local f2_local1 = function ( f4_arg0, f4_arg1 )
					if not f4_arg1.interrupted then
						f4_arg0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
					end
					f4_arg0:setAlpha( 0 )
					f4_arg0:setScale( 1 )
					if f4_arg1.interrupted then
						self.clipFinished( f4_arg0, f4_arg1 )
					else
						f4_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Spectre:beginAnimation( "keyframe", 4199, false, false, CoD.TweenType.Linear )
				Spectre:setAlpha( 1 )
				Spectre:setScale( 1 )
				Spectre:registerEventHandler( "transition_complete_keyframe", f2_local1 )
				local f2_local2 = function ( f5_arg0, f5_arg1 )
					if not f5_arg1.interrupted then
						f5_arg0:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
					end
					f5_arg0:setAlpha( 0 )
					f5_arg0:setScale( 1 )
					if f5_arg1.interrupted then
						self.clipFinished( f5_arg0, f5_arg1 )
					else
						f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Seraph:beginAnimation( "keyframe", 3619, false, false, CoD.TweenType.Linear )
				Seraph:setAlpha( 1 )
				Seraph:setScale( 1 )
				Seraph:registerEventHandler( "transition_complete_keyframe", f2_local2 )
				local f2_local3 = function ( f6_arg0, f6_arg1 )
					if not f6_arg1.interrupted then
						f6_arg0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
					end
					f6_arg0:setAlpha( 0 )
					f6_arg0:setScale( 1 )
					if f6_arg1.interrupted then
						self.clipFinished( f6_arg0, f6_arg1 )
					else
						f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Reaper:beginAnimation( "keyframe", 2980, false, false, CoD.TweenType.Linear )
				Reaper:setAlpha( 1 )
				Reaper:setScale( 1 )
				Reaper:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local f2_local4 = function ( f7_arg0, f7_arg1 )
					if not f7_arg1.interrupted then
						f7_arg0:beginAnimation( "keyframe", 630, false, false, CoD.TweenType.Linear )
					end
					f7_arg0:setAlpha( 0 )
					f7_arg0:setScale( 1 )
					if f7_arg1.interrupted then
						self.clipFinished( f7_arg0, f7_arg1 )
					else
						f7_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Prophet:beginAnimation( "keyframe", 2349, false, false, CoD.TweenType.Linear )
				Prophet:setAlpha( 1 )
				Prophet:setScale( 1 )
				Prophet:registerEventHandler( "transition_complete_keyframe", f2_local4 )
				local f2_local5 = function ( f8_arg0, f8_arg1 )
					if not f8_arg1.interrupted then
						f8_arg0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
					end
					f8_arg0:setAlpha( 0 )
					f8_arg0:setScale( 1 )
					if f8_arg1.interrupted then
						self.clipFinished( f8_arg0, f8_arg1 )
					else
						f8_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Outrider:beginAnimation( "keyframe", 1759, false, false, CoD.TweenType.Linear )
				Outrider:setAlpha( 1 )
				Outrider:setScale( 1 )
				Outrider:registerEventHandler( "transition_complete_keyframe", f2_local5 )
				local f2_local6 = function ( f9_arg0, f9_arg1 )
					if not f9_arg1.interrupted then
						f9_arg0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
					end
					f9_arg0:setAlpha( 0 )
					f9_arg0:setScale( 1 )
					if f9_arg1.interrupted then
						self.clipFinished( f9_arg0, f9_arg1 )
					else
						f9_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Nomad:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
				Nomad:setAlpha( 1 )
				Nomad:setScale( 1 )
				Nomad:registerEventHandler( "transition_complete_keyframe", f2_local6 )
				local f2_local7 = function ( f10_arg0, f10_arg1 )
					if not f10_arg1.interrupted then
						f10_arg0:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
					end
					f10_arg0:setAlpha( 0 )
					f10_arg0:setScale( 1 )
					if f10_arg1.interrupted then
						self.clipFinished( f10_arg0, f10_arg1 )
					else
						f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Battery:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				Battery:setAlpha( 1 )
				Battery:setScale( 1 )
				Battery:registerEventHandler( "transition_complete_keyframe", f2_local7 )
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

