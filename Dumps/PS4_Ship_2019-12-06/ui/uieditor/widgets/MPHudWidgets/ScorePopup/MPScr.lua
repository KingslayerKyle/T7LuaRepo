require( "ui.uieditor.widgets.MPHudWidgets.ScorePopup.MPScrFeedItem" )
require( "ui.uieditor.widgets.MPHudWidgets.ScorePopup.MPScr_PlusPointsContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self.ScoreFeedItem0.TextBox:setText( "" )
	local f1_local0, f1_local1, f1_local2, f1_local3 = self.ScoreFeedItem0:getLocalTopBottom()
	local f1_local4 = f1_local3 - f1_local2
	self.ScoreFeedItem0.top = f1_local2
	self.MPScrPlusPointsContainer:setAlpha( 0 )
	self.lastAnim = 0
	self.AddScoreFeed = function ( f2_arg0, f2_arg1, f2_arg2 )
		for f2_local0 = 10, 1, -1 do
			local f2_local3 = self["ScoreFeedItem" .. f2_local0]
			local f2_local4 = self["ScoreFeedItem" .. f2_local0 - 1]
			if f2_local4 and f2_local4.text then
				if not f2_local3 then
					self["ScoreFeedItem" .. f2_local0] = CoD.MPScrFeedItem.new( menu, controller )
					f2_local3 = self["ScoreFeedItem" .. f2_local0]
					self:addElement( f2_local3 )
				end
				f2_local3:setLeftRight( f2_local4:getLocalLeftRight() )
				f2_local3:setTopBottom( f1_local0, f1_local1, f2_local4.top, f2_local4.top + f1_local4 )
				f2_local3.textColor = f2_local4.textColor
				f2_local3:setRGB( f2_local3.textColor.r, f2_local3.textColor.g, f2_local3.textColor.b )
				f2_local3.text = f2_local4.text
				f2_local3.TextBox:setText( f2_local3.text )
				f2_local3:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
				local f2_local5, f2_local6, f2_local7, f2_local8 = f2_local3:getLocalTopBottom()
				f2_local3:setTopBottom( f2_local5, f2_local6, f2_local7 + f1_local4, f2_local8 + f1_local4 )
				f2_local3.top = f2_local7 + f1_local4
			end
		end
		if f2_arg2 then
			self.ScoreFeedItem0.textColor = ColorSet.ThiefScoreFeedColor
		else
			self.ScoreFeedItem0.textColor = {
				r = 1,
				g = 1,
				b = 1
			}
		end
		self.ScoreFeedItem0:setRGB( self.ScoreFeedItem0.textColor.r, self.ScoreFeedItem0.textColor.g, self.ScoreFeedItem0.textColor.b )
		self.ScoreFeedItem0.text = f2_arg1
		self.ScoreFeedItem0.TextBox:setText( self.ScoreFeedItem0.text )
		self.ScoreFeedItem0:playClip( "DefaultClip" )
	end
	
	self.AddCenterScore = function ( f3_arg0, f3_arg1, f3_arg2 )
		if f3_arg1 ~= nil then
			if f3_arg2 >= 0 and f3_arg2 <= 0 then
				return 
			elseif f3_arg0.currentScore == nil then
				f3_arg0.currentScore = 0
			end
			f3_arg0.currentScore = f3_arg0.currentScore + f3_arg2
			local f3_local0
			if f3_arg2 > 0 then
				f3_local0 = Engine.Localize( "MP_PLUS" )
				if not f3_local0 then
				
				else
					f3_arg0.Score:setText( f3_local0 .. f3_arg0.currentScore )
					if f3_arg1 ~= "SCORE_KILL" then
						f3_arg0:AddScoreFeed( Engine.Localize( f3_arg1 ) )
					end
				end
			end
			f3_local0 = ""
		elseif f3_arg0.streakLabel ~= nil then
			f3_arg0.streakLabel:out()
			f3_arg0.streakLabel = nil
		end
	end
	
	self.AddCombatEfficiencyScore = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		if f4_arg2 == 0 or f4_arg2 > 10000 then
			return 
		end
		local f4_local0 = CoD.MPScr_PlusPointsContainer.new( f4_arg1, f4_arg3 )
		f4_local0:setScale( 0.4 )
		f4_local0.MPScr_PlusPoints.Label1:setText( "+" .. f4_arg2 )
		f4_local0.MPScr_PlusPoints.Label2:setText( "+" .. f4_arg2 )
		f4_local0.MPScr_PlusPoints:playClip( "DefaultClip" )
		f4_local0:setLeftRight( f4_arg0:getLocalLeftRight() )
		f4_local0:setTopBottom( f4_arg0:getLocalTopBottom() )
		f4_arg0.lastAnim = f4_arg0.lastAnim + 1
		Engine.PlaySound( "gdt_ce_score" )
		f4_local0:setState( "DefaultState" )
		if not f4_local0:hasClip( "Anim" .. f4_arg0.lastAnim ) then
			f4_arg0.lastAnim = 1
		end
		f4_local0:registerEventHandler( "clip_over", function ( element, event )
			element:close()
		end )
		local f4_local1 = f4_arg0:getParent()
		f4_local1:addElement( f4_local0 )
		f4_local0:playClip( "Anim" .. f4_arg0.lastAnim )
	end
	
	self:registerEventHandler( "clip_over", function ( element, event )
		element.currentScore = 0
		for f6_local0 = 0, 10, 1 do
			if not element["ScoreFeedItem" .. f6_local0] then
				break
			elseif f6_local0 == 0 then
				local f6_local3 = "ScoreFeedItem"
				element["ScoreFeedItem" .. f6_local0].TextBox:setText( "" )
				f6_local3 = "ScoreFeedItem"
				element["ScoreFeedItem" .. f6_local0].text = nil
			else
				element["ScoreFeedItem" .. f6_local0]:close()
				element["ScoreFeedItem" .. f6_local0] = nil
			end
		end
	end )
end

CoD.MPScr = InheritFrom( LUI.UIElement )
CoD.MPScr.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MPScr )
	self.id = "MPScr"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local ScoreFeedGlow = LUI.UIImage.new()
	ScoreFeedGlow:setLeftRight( false, false, -62, 62 )
	ScoreFeedGlow:setTopBottom( false, false, -55, 50 )
	ScoreFeedGlow:setRGB( 0.09, 0.16, 0.19 )
	ScoreFeedGlow:setImage( RegisterImage( "uie_lui_score_feed_glow" ) )
	ScoreFeedGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ScoreFeedGlow )
	self.ScoreFeedGlow = ScoreFeedGlow
	
	local Score = LUI.UIText.new()
	Score:setLeftRight( false, false, -50, 50 )
	Score:setTopBottom( true, false, 2, 27 )
	Score:setText( Engine.Localize( "+100" ) )
	Score:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Score, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 0 )
	end )
	self:addElement( Score )
	self.Score = Score
	
	local ScoreFeedItem0 = CoD.MPScrFeedItem.new( menu, controller )
	ScoreFeedItem0:setLeftRight( false, false, -13, 227 )
	ScoreFeedItem0:setTopBottom( true, false, 32, 50 )
	self:addElement( ScoreFeedItem0 )
	self.ScoreFeedItem0 = ScoreFeedItem0
	
	local MPScrPlusPointsContainer = CoD.MPScr_PlusPointsContainer.new( menu, controller )
	MPScrPlusPointsContainer:setLeftRight( true, false, 77.23, 162.23 )
	MPScrPlusPointsContainer:setTopBottom( true, false, -14, 52 )
	MPScrPlusPointsContainer:setAlpha( 0 )
	MPScrPlusPointsContainer:setScale( 0.4 )
	self:addElement( MPScrPlusPointsContainer )
	self.MPScrPlusPointsContainer = MPScrPlusPointsContainer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ScoreFeedGlow:completeAnimation()
				self.ScoreFeedGlow:setAlpha( 0 )
				self.clipFinished( ScoreFeedGlow, {} )
				Score:completeAnimation()
				self.Score:setAlpha( 0 )
				self.clipFinished( Score, {} )
				MPScrPlusPointsContainer:completeAnimation()
				self.MPScrPlusPointsContainer:setAlpha( 0 )
				self.clipFinished( MPScrPlusPointsContainer, {} )
			end,
			CombatEfficiencyScore = function ()
				self:setupElementClipCounter( 3 )
				local ScoreFeedGlowFrame2 = function ( ScoreFeedGlow, event )
					local ScoreFeedGlowFrame3 = function ( ScoreFeedGlow, event )
						local ScoreFeedGlowFrame4 = function ( ScoreFeedGlow, event )
							local ScoreFeedGlowFrame5 = function ( ScoreFeedGlow, event )
								if not event.interrupted then
									ScoreFeedGlow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								ScoreFeedGlow:setLeftRight( false, false, -50, 50 )
								ScoreFeedGlow:setTopBottom( false, false, 0, 0 )
								ScoreFeedGlow:setRGB( 0, 0, 0 )
								ScoreFeedGlow:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( ScoreFeedGlow, event )
								else
									ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ScoreFeedGlowFrame5( ScoreFeedGlow, event )
								return 
							else
								ScoreFeedGlow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ScoreFeedGlow:setRGB( 1, 1, 1 )
								ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", ScoreFeedGlowFrame5 )
							end
						end
						
						if event.interrupted then
							ScoreFeedGlowFrame4( ScoreFeedGlow, event )
							return 
						else
							ScoreFeedGlow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							ScoreFeedGlow:setRGB( 0.18, 0.33, 0.37 )
							ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", ScoreFeedGlowFrame4 )
						end
					end
					
					if event.interrupted then
						ScoreFeedGlowFrame3( ScoreFeedGlow, event )
						return 
					else
						ScoreFeedGlow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ScoreFeedGlow:setRGB( 0.07, 0.27, 0.31 )
						ScoreFeedGlow:setAlpha( 1 )
						ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", ScoreFeedGlowFrame3 )
					end
				end
				
				ScoreFeedGlow:completeAnimation()
				self.ScoreFeedGlow:setLeftRight( false, false, -62, 62 )
				self.ScoreFeedGlow:setTopBottom( false, false, -55, 50 )
				self.ScoreFeedGlow:setRGB( 1, 1, 1 )
				self.ScoreFeedGlow:setAlpha( 0.5 )
				ScoreFeedGlowFrame2( ScoreFeedGlow, {} )
				local ScoreFrame2 = function ( Score, event )
					local ScoreFrame3 = function ( Score, event )
						local ScoreFrame4 = function ( Score, event )
							local ScoreFrame5 = function ( Score, event )
								if not event.interrupted then
									Score:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Score:setRGB( 0.6, 0.83, 0.96 )
								Score:setAlpha( 0 )
								Score:setScale( 1 )
								if event.interrupted then
									self.clipFinished( Score, event )
								else
									Score:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ScoreFrame5( Score, event )
								return 
							else
								Score:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								Score:registerEventHandler( "transition_complete_keyframe", ScoreFrame5 )
							end
						end
						
						if event.interrupted then
							ScoreFrame4( Score, event )
							return 
						else
							Score:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Back )
							Score:setScale( 1 )
							Score:registerEventHandler( "transition_complete_keyframe", ScoreFrame4 )
						end
					end
					
					if event.interrupted then
						ScoreFrame3( Score, event )
						return 
					else
						Score:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						Score:setScale( 1.75 )
						Score:registerEventHandler( "transition_complete_keyframe", ScoreFrame3 )
					end
				end
				
				Score:completeAnimation()
				self.Score:setRGB( 0.6, 0.83, 0.96 )
				self.Score:setAlpha( 1 )
				self.Score:setScale( 0 )
				ScoreFrame2( Score, {} )
				local MPScrPlusPointsContainerFrame2 = function ( MPScrPlusPointsContainer, event )
					local MPScrPlusPointsContainerFrame3 = function ( MPScrPlusPointsContainer, event )
						if not event.interrupted then
							MPScrPlusPointsContainer:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						end
						MPScrPlusPointsContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MPScrPlusPointsContainer, event )
						else
							MPScrPlusPointsContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MPScrPlusPointsContainerFrame3( MPScrPlusPointsContainer, event )
						return 
					else
						MPScrPlusPointsContainer:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						MPScrPlusPointsContainer:registerEventHandler( "transition_complete_keyframe", MPScrPlusPointsContainerFrame3 )
					end
				end
				
				MPScrPlusPointsContainer:completeAnimation()
				self.MPScrPlusPointsContainer:setAlpha( 1 )
				MPScrPlusPointsContainerFrame2( MPScrPlusPointsContainer, {} )
			end,
			NormalScore = function ()
				self:setupElementClipCounter( 3 )
				local ScoreFeedGlowFrame2 = function ( ScoreFeedGlow, event )
					local ScoreFeedGlowFrame3 = function ( ScoreFeedGlow, event )
						local ScoreFeedGlowFrame4 = function ( ScoreFeedGlow, event )
							local ScoreFeedGlowFrame5 = function ( ScoreFeedGlow, event )
								if not event.interrupted then
									ScoreFeedGlow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								ScoreFeedGlow:setLeftRight( false, false, -50, 50 )
								ScoreFeedGlow:setTopBottom( false, false, 0, 0 )
								ScoreFeedGlow:setRGB( 0, 0, 0 )
								ScoreFeedGlow:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( ScoreFeedGlow, event )
								else
									ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ScoreFeedGlowFrame5( ScoreFeedGlow, event )
								return 
							else
								ScoreFeedGlow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ScoreFeedGlow:setRGB( 1, 1, 1 )
								ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", ScoreFeedGlowFrame5 )
							end
						end
						
						if event.interrupted then
							ScoreFeedGlowFrame4( ScoreFeedGlow, event )
							return 
						else
							ScoreFeedGlow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							ScoreFeedGlow:setRGB( 0.06, 0, 0.13 )
							ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", ScoreFeedGlowFrame4 )
						end
					end
					
					if event.interrupted then
						ScoreFeedGlowFrame3( ScoreFeedGlow, event )
						return 
					else
						ScoreFeedGlow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ScoreFeedGlow:setRGB( 0.09, 0.16, 0.19 )
						ScoreFeedGlow:registerEventHandler( "transition_complete_keyframe", ScoreFeedGlowFrame3 )
					end
				end
				
				ScoreFeedGlow:completeAnimation()
				self.ScoreFeedGlow:setLeftRight( false, false, -62, 62 )
				self.ScoreFeedGlow:setTopBottom( false, false, -55, 50 )
				self.ScoreFeedGlow:setRGB( 1, 1, 1 )
				self.ScoreFeedGlow:setAlpha( 0.5 )
				ScoreFeedGlowFrame2( ScoreFeedGlow, {} )
				local ScoreFrame2 = function ( Score, event )
					local ScoreFrame3 = function ( Score, event )
						local ScoreFrame4 = function ( Score, event )
							local ScoreFrame5 = function ( Score, event )
								if not event.interrupted then
									Score:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Score:setRGB( 1, 1, 1 )
								Score:setAlpha( 0 )
								Score:setScale( 1 )
								if event.interrupted then
									self.clipFinished( Score, event )
								else
									Score:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ScoreFrame5( Score, event )
								return 
							else
								Score:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Elastic )
								Score:registerEventHandler( "transition_complete_keyframe", ScoreFrame5 )
							end
						end
						
						if event.interrupted then
							ScoreFrame4( Score, event )
							return 
						else
							Score:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Back )
							Score:setScale( 1 )
							Score:registerEventHandler( "transition_complete_keyframe", ScoreFrame4 )
						end
					end
					
					if event.interrupted then
						ScoreFrame3( Score, event )
						return 
					else
						Score:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						Score:setScale( 1.75 )
						Score:registerEventHandler( "transition_complete_keyframe", ScoreFrame3 )
					end
				end
				
				Score:completeAnimation()
				self.Score:setRGB( 1, 1, 1 )
				self.Score:setAlpha( 1 )
				self.Score:setScale( 0 )
				ScoreFrame2( Score, {} )
				MPScrPlusPointsContainer:completeAnimation()
				self.MPScrPlusPointsContainer:setAlpha( 0 )
				self.clipFinished( MPScrPlusPointsContainer, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ScoreFeedGlow:completeAnimation()
				self.ScoreFeedGlow:setAlpha( 0 )
				self.clipFinished( ScoreFeedGlow, {} )
				Score:completeAnimation()
				self.Score:setAlpha( 0 )
				self.clipFinished( Score, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f31_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
				if not f31_local0 then
					f31_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
					if not f31_local0 then
						f31_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
						if not f31_local0 then
							f31_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
							if not f31_local0 then
								f31_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
							end
						end
					end
				end
				return f31_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreFeedItem0:close()
		element.MPScrPlusPointsContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

