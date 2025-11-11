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
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 720 )
	BG:setTopBottom( 0, 0, 0, 180 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_humiliation_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local Flame1 = LUI.UIImage.new()
	Flame1:setLeftRight( 0, 0, 0, 720 )
	Flame1:setTopBottom( 0, 0, 0, 180 )
	Flame1:setImage( RegisterImage( "uie_t7_callingcard_humiliation_flame1" ) )
	self:addElement( Flame1 )
	self.Flame1 = Flame1
	
	local Flame2 = LUI.UIImage.new()
	Flame2:setLeftRight( 0, 0, 0, 720 )
	Flame2:setTopBottom( 0, 0, 0, 180 )
	Flame2:setImage( RegisterImage( "uie_t7_callingcard_humiliation_flame2" ) )
	self:addElement( Flame2 )
	self.Flame2 = Flame2
	
	local orangeBOX = LUI.UIImage.new()
	orangeBOX:setLeftRight( 0, 0, 565, 720 )
	orangeBOX:setTopBottom( 0, 0, 0, 180 )
	orangeBOX:setRGB( 0.88, 0.38, 0.04 )
	self:addElement( orangeBOX )
	self.orangeBOX = orangeBOX
	
	local Burst = LUI.UIImage.new()
	Burst:setLeftRight( 0, 0, 432, 720 )
	Burst:setTopBottom( 0, 0, 0, 180 )
	Burst:setImage( RegisterImage( "uie_t7_callingcard_humiliation_flame3" ) )
	self:addElement( Burst )
	self.Burst = Burst
	
	local CallingCardsHumiliationSkull = CoD.CallingCards_Humiliation_Skull.new( menu, controller )
	CallingCardsHumiliationSkull:setLeftRight( 0, 0, 432, 720 )
	CallingCardsHumiliationSkull:setTopBottom( 0, 0, 0, 180 )
	self:addElement( CallingCardsHumiliationSkull )
	self.CallingCardsHumiliationSkull = CallingCardsHumiliationSkull
	
	self.resetProperties = function ()
		Flame1:completeAnimation()
		Burst:completeAnimation()
		CallingCardsHumiliationSkull:completeAnimation()
		Flame2:completeAnimation()
		Flame1:setLeftRight( 0, 0, 0, 720 )
		Flame1:setTopBottom( 0, 0, 0, 180 )
		Burst:setScale( 1 )
		CallingCardsHumiliationSkull:setScale( 1 )
		Flame2:setLeftRight( 0, 0, 0, 720 )
		Flame2:setTopBottom( 0, 0, 0, 180 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local Flame1Frame2 = function ( Flame1, event )
					local Flame1Frame3 = function ( Flame1, event )
						if not event.interrupted then
							Flame1:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						end
						Flame1:setLeftRight( 0, 0, 0, 720 )
						Flame1:setTopBottom( 0, 0, 0, 180 )
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
						Flame1:setLeftRight( 0, 0, -36, 684 )
						Flame1:registerEventHandler( "transition_complete_keyframe", Flame1Frame3 )
					end
				end
				
				Flame1:completeAnimation()
				self.Flame1:setLeftRight( 0, 0, 0, 720 )
				self.Flame1:setTopBottom( 0, 0, 0, 180 )
				Flame1Frame2( Flame1, {} )
				local Flame2Frame2 = function ( Flame2, event )
					local Flame2Frame3 = function ( Flame2, event )
						if not event.interrupted then
							Flame2:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						end
						Flame2:setLeftRight( 0, 0, 0, 720 )
						Flame2:setTopBottom( 0, 0, 0, 180 )
						if event.interrupted then
							self.clipFinished( Flame2, event )
						else
							Flame2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Flame2Frame3( Flame2, event )
						return 
					else
						Flame2:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						Flame2:setLeftRight( 0, 0, -42, 678 )
						Flame2:registerEventHandler( "transition_complete_keyframe", Flame2Frame3 )
					end
				end
				
				Flame2:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				Flame2:setLeftRight( 0, 0, 0, 720 )
				Flame2:setTopBottom( 0, 0, 0, 180 )
				Flame2:registerEventHandler( "transition_complete_keyframe", Flame2Frame2 )
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
				self.CallingCardsHumiliationSkull:setScale( 1 )
				CallingCardsHumiliationSkullFrame2( CallingCardsHumiliationSkull, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsHumiliationSkull:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

