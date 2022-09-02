-- a611fff8d7bb4e10f1b8eb3a8d3fa42c
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) or Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) or Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) or Engine.IsVisibilityBitSet( f1_arg1.controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) or CoD.IsShoutcaster( f1_arg1.controller ) and CoD.ShoutcasterProfileVarBool( f1_arg1.controller, "shoutcaster_playernotifications" ) then
		f1_arg0:setAlpha( 0 )
	else
		f1_arg0:setAlpha( 1 )
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = function ( f3_arg0 )
		f0_local0( f2_arg0, {
			controller = f2_arg1
		} )
	end
	
	local f2_local1 = Engine.GetModelForController( f2_arg1 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), f2_local0 )
	if IsMultiplayer() then
		f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), f2_local0 )
		f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "CodCaster.profileSettingsUpdated" ), f2_local0 )
	end
end

CoD.Notification_Medals = InheritFrom( LUI.UIElement )
CoD.Notification_Medals.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Notification_Medals )
	self.id = "Notification_Medals"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 512 )
	self:setTopBottom( true, false, 0, 178 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( false, false, -64, 64 )
	Image:setTopBottom( false, false, -89, 39 )
	Image:setAlpha( 0 )
	Image:setImage( RegisterImage( "uie_hud_medals_headshot" ) )
	self:addElement( Image )
	self.Image = Image
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 0, 0 )
	Text:setTopBottom( false, false, 39, 64 )
	Text:setAlpha( 0 )
	Text:setText( Engine.Localize( "MEDAL_HEADSHOT" ) )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local SubText = LUI.UIText.new()
	SubText:setLeftRight( true, true, 0, 0 )
	SubText:setTopBottom( false, false, 64, 89 )
	SubText:setAlpha( 0 )
	SubText:setText( Engine.Localize( "MEDAL_HEADSHOT" ) )
	SubText:setTTF( "fonts/default.ttf" )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SubText )
	self.SubText = SubText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			medal_received = function ()
				self:setupElementClipCounter( 3 )

				local ImageFrame2 = function ( Image, event )
					local ImageFrame3 = function ( Image, event )
						local ImageFrame4 = function ( Image, event )
							local ImageFrame5 = function ( Image, event )
								if not event.interrupted then
									Image:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								end
								Image:setLeftRight( true, false, 192, 320 )
								Image:setTopBottom( true, false, 0, 128 )
								Image:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image, event )
								else
									Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ImageFrame5( Image, event )
								return 
							else
								Image:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								Image:setAlpha( 0 )
								Image:registerEventHandler( "transition_complete_keyframe", ImageFrame5 )
							end
						end
						
						if event.interrupted then
							ImageFrame4( Image, event )
							return 
						else
							Image:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
							Image:registerEventHandler( "transition_complete_keyframe", ImageFrame4 )
						end
					end
					
					if event.interrupted then
						ImageFrame3( Image, event )
						return 
					else
						Image:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						Image:setAlpha( 1 )
						Image:registerEventHandler( "transition_complete_keyframe", ImageFrame3 )
					end
				end
				
				Image:completeAnimation()
				self.Image:setLeftRight( true, false, 192, 320 )
				self.Image:setTopBottom( true, false, 0, 128 )
				self.Image:setAlpha( 0 )
				ImageFrame2( Image, {} )
				local TextFrame2 = function ( Text, event )
					local TextFrame3 = function ( Text, event )
						local TextFrame4 = function ( Text, event )
							local TextFrame5 = function ( Text, event )
								if not event.interrupted then
									Text:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								end
								Text:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Text, event )
								else
									Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								TextFrame5( Text, event )
								return 
							else
								Text:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								Text:setAlpha( 0 )
								Text:registerEventHandler( "transition_complete_keyframe", TextFrame5 )
							end
						end
						
						if event.interrupted then
							TextFrame4( Text, event )
							return 
						else
							Text:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
							Text:registerEventHandler( "transition_complete_keyframe", TextFrame4 )
						end
					end
					
					if event.interrupted then
						TextFrame3( Text, event )
						return 
					else
						Text:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						Text:setAlpha( 1 )
						Text:registerEventHandler( "transition_complete_keyframe", TextFrame3 )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				TextFrame2( Text, {} )
				local SubTextFrame2 = function ( SubText, event )
					local SubTextFrame3 = function ( SubText, event )
						local SubTextFrame4 = function ( SubText, event )
							local SubTextFrame5 = function ( SubText, event )
								if not event.interrupted then
									SubText:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								end
								SubText:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( SubText, event )
								else
									SubText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SubTextFrame5( SubText, event )
								return 
							else
								SubText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								SubText:setAlpha( 0 )
								SubText:registerEventHandler( "transition_complete_keyframe", SubTextFrame5 )
							end
						end
						
						if event.interrupted then
							SubTextFrame4( SubText, event )
							return 
						else
							SubText:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
							SubText:registerEventHandler( "transition_complete_keyframe", SubTextFrame4 )
						end
					end
					
					if event.interrupted then
						SubTextFrame3( SubText, event )
						return 
					else
						SubText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						SubText:setAlpha( 1 )
						SubText:registerEventHandler( "transition_complete_keyframe", SubTextFrame3 )
					end
				end
				
				SubText:completeAnimation()
				self.SubText:setAlpha( 0 )
				SubTextFrame2( SubText, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

