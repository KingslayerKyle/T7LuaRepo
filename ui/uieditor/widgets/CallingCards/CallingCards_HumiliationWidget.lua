-- 5a2e0c834ce10d8610b383d50b08d6a5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_Humiliation_Skull" )

CoD.CallingCards_HumiliationWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_HumiliationWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_HumiliationWidget )
	self.id = "CallingCards_HumiliationWidget"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_humiliation_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local Flame1 = LUI.UIImage.new()
	Flame1:setLeftRight( true, false, 0, 480 )
	Flame1:setTopBottom( true, false, 0, 120 )
	Flame1:setImage( RegisterImage( "uie_t7_callingcard_humiliation_flame1" ) )
	self:addElement( Flame1 )
	self.Flame1 = Flame1
	
	local Flame2 = LUI.UIImage.new()
	Flame2:setLeftRight( true, false, 0, 480 )
	Flame2:setTopBottom( true, false, 0, 120 )
	Flame2:setImage( RegisterImage( "uie_t7_callingcard_humiliation_flame2" ) )
	self:addElement( Flame2 )
	self.Flame2 = Flame2
	
	local orangeBOX = LUI.UIImage.new()
	orangeBOX:setLeftRight( true, false, 376.75, 480 )
	orangeBOX:setTopBottom( true, false, 0, 120 )
	orangeBOX:setRGB( 0.88, 0.38, 0.04 )
	self:addElement( orangeBOX )
	self.orangeBOX = orangeBOX
	
	local Burst = LUI.UIImage.new()
	Burst:setLeftRight( true, false, 288, 480 )
	Burst:setTopBottom( true, false, 0, 120 )
	Burst:setImage( RegisterImage( "uie_t7_callingcard_humiliation_flame3" ) )
	self:addElement( Burst )
	self.Burst = Burst
	
	local CallingCardsHumiliationSkull = CoD.CallingCards_Humiliation_Skull.new( menu, controller )
	CallingCardsHumiliationSkull:setLeftRight( true, false, 288, 480 )
	CallingCardsHumiliationSkull:setTopBottom( true, false, 0, 120 )
	self:addElement( CallingCardsHumiliationSkull )
	self.CallingCardsHumiliationSkull = CallingCardsHumiliationSkull
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local Flame1Frame2 = function ( Flame1, event )
					local Flame1Frame3 = function ( Flame1, event )
						if not event.interrupted then
							Flame1:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						end
						Flame1:setLeftRight( true, false, 0, 480 )
						Flame1:setTopBottom( true, false, 0, 120 )
						if event.interrupted then
							self.clipFinished( Flame1, event )
						else
							Flame1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Flame1Frame3( Flame1, event )
						return 
					else
						Flame1:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						Flame1:setLeftRight( true, false, -24, 456 )
						Flame1:registerEventHandler( "transition_complete_keyframe", Flame1Frame3 )
					end
				end
				
				Flame1:completeAnimation()
				self.Flame1:setLeftRight( true, false, 0, 480 )
				self.Flame1:setTopBottom( true, false, 0, 120 )
				Flame1Frame2( Flame1, {} )
				local f2_local1 = function ( f5_arg0, f5_arg1 )
					local f5_local0 = function ( f6_arg0, f6_arg1 )
						if not f6_arg1.interrupted then
							f6_arg0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						end
						f6_arg0:setLeftRight( true, false, 0, 480 )
						f6_arg0:setTopBottom( true, false, 0, 120 )
						if f6_arg1.interrupted then
							self.clipFinished( f6_arg0, f6_arg1 )
						else
							f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f5_arg1.interrupted then
						f5_local0( f5_arg0, f5_arg1 )
						return 
					else
						f5_arg0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						f5_arg0:setLeftRight( true, false, -28, 452 )
						f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
					end
				end
				
				Flame2:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				Flame2:setLeftRight( true, false, 0, 480 )
				Flame2:setTopBottom( true, false, 0, 120 )
				Flame2:registerEventHandler( "transition_complete_keyframe", f2_local1 )
				local BurstFrame2 = function ( Burst, event )
					local BurstFrame3 = function ( Burst, event )
						local BurstFrame4 = function ( Burst, event )
							if not event.interrupted then
								Burst:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
							end
							Burst:setScale( 1 )
							if event.interrupted then
								self.clipFinished( Burst, event )
							else
								Burst:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BurstFrame4( Burst, event )
							return 
						else
							Burst:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
							Burst:setScale( 1.1 )
							Burst:registerEventHandler( "transition_complete_keyframe", BurstFrame4 )
						end
					end
					
					if event.interrupted then
						BurstFrame3( Burst, event )
						return 
					else
						Burst:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						Burst:registerEventHandler( "transition_complete_keyframe", BurstFrame3 )
					end
				end
				
				Burst:completeAnimation()
				self.Burst:setScale( 1 )
				BurstFrame2( Burst, {} )
				local CallingCardsHumiliationSkullFrame2 = function ( CallingCardsHumiliationSkull, event )
					local CallingCardsHumiliationSkullFrame3 = function ( CallingCardsHumiliationSkull, event )
						if not event.interrupted then
							CallingCardsHumiliationSkull:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						CallingCardsHumiliationSkull:setAlpha( 1 )
						CallingCardsHumiliationSkull:setScale( 1 )
						if event.interrupted then
							self.clipFinished( CallingCardsHumiliationSkull, event )
						else
							CallingCardsHumiliationSkull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CallingCardsHumiliationSkullFrame3( CallingCardsHumiliationSkull, event )
						return 
					else
						CallingCardsHumiliationSkull:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						CallingCardsHumiliationSkull:setScale( 1.2 )
						CallingCardsHumiliationSkull:registerEventHandler( "transition_complete_keyframe", CallingCardsHumiliationSkullFrame3 )
					end
				end
				
				CallingCardsHumiliationSkull:completeAnimation()
				self.CallingCardsHumiliationSkull:setAlpha( 1 )
				self.CallingCardsHumiliationSkull:setScale( 1 )
				CallingCardsHumiliationSkullFrame2( CallingCardsHumiliationSkull, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsHumiliationSkull:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

