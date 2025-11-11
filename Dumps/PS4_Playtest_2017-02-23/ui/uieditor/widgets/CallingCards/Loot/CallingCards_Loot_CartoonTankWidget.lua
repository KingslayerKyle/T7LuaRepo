require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCards_Loot_CartoonTankWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_CartoonTankWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_CartoonTankWidget )
	self.id = "CallingCards_Loot_CartoonTankWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local Frame3 = LUI.UIImage.new()
	Frame3:setLeftRight( 0, 0, 0, 720 )
	Frame3:setTopBottom( 0, 0, 0, 180 )
	Frame3:setImage( RegisterImage( "uie_t7_callingcard_cartoontank_bg3" ) )
	self:addElement( Frame3 )
	self.Frame3 = Frame3
	
	local Frame2 = LUI.UIImage.new()
	Frame2:setLeftRight( 0, 0, 0, 720 )
	Frame2:setTopBottom( 0, 0, 0, 180 )
	Frame2:setImage( RegisterImage( "uie_t7_callingcard_cartoontank_bg2" ) )
	self:addElement( Frame2 )
	self.Frame2 = Frame2
	
	local Frame1 = LUI.UIImage.new()
	Frame1:setLeftRight( 0, 0, 0, 720 )
	Frame1:setTopBottom( 0, 0, 0, 180 )
	Frame1:setImage( RegisterImage( "uie_t7_loot_callingcard_master_base" ) )
	self:addElement( Frame1 )
	self.Frame1 = Frame1
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( 0, 1, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( 0, 1, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.resetProperties = function ()
		Frame1:completeAnimation()
		Frame2:completeAnimation()
		Frame1:setAlpha( 1 )
		Frame2:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local Frame2Frame2 = function ( Frame2, event )
					local Frame2Frame3 = function ( Frame2, event )
						local Frame2Frame4 = function ( Frame2, event )
							if not event.interrupted then
								Frame2:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							Frame2:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( Frame2, event )
							else
								Frame2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Frame2Frame4( Frame2, event )
							return 
						else
							Frame2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							Frame2:setAlpha( 0 )
							Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame4 )
						end
					end
					
					if event.interrupted then
						Frame2Frame3( Frame2, event )
						return 
					else
						Frame2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame3 )
					end
				end
				
				Frame2:completeAnimation()
				self.Frame2:setAlpha( 1 )
				Frame2Frame2( Frame2, {} )
				local Frame1Frame2 = function ( Frame1, event )
					local Frame1Frame3 = function ( Frame1, event )
						local Frame1Frame4 = function ( Frame1, event )
							if not event.interrupted then
								Frame1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							end
							Frame1:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( Frame1, event )
							else
								Frame1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Frame1Frame4( Frame1, event )
							return 
						else
							Frame1:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							Frame1:registerEventHandler( "transition_complete_keyframe", Frame1Frame4 )
						end
					end
					
					if event.interrupted then
						Frame1Frame3( Frame1, event )
						return 
					else
						Frame1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						Frame1:setAlpha( 0 )
						Frame1:registerEventHandler( "transition_complete_keyframe", Frame1Frame3 )
					end
				end
				
				Frame1:completeAnimation()
				self.Frame1:setAlpha( 1 )
				Frame1Frame2( Frame1, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsGoldFrame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

