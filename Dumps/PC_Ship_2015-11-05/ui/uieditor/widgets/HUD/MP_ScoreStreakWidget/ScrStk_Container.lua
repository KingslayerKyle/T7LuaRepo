require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_CombatEfficiencyBackGlow" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_PanelContainer" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_Meter" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_Button" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = "KillstreakRewardsList"
	if DataSources[f1_local0] == nil then
		DataSources[f1_local0] = {
			getCount = function ( f2_arg0 )
				return CoD.CACUtility.maxScorestreaks
			end,
			getItem = function ( f3_arg0, f3_arg1, f3_arg2 )
				return Engine.GetModel( Engine.GetModelForController( f3_arg0 ), "killstreaks.killstreak" .. 4 - f3_arg2 )
			end
		}
	end
	local f1_local1 = Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks" )
	local f1_local2 = Engine.CreateModel( f1_local1, "targetMomentum" )
	local f1_local3 = Engine.CreateModel( f1_local1, "momentumPercentage" )
	local f1_local4 = Engine.GetModel( Engine.GetModelForController( controller ), "rewardMomentum" )
	if DataSources.KillstreakRewards == nil then
		DataSources.KillstreakRewards = {
			getModel = function ( f4_arg0 )
				return Engine.GetModel( Engine.GetModelForController( f4_arg0 ), "killstreaks" )
			end
		}
	end
	local f1_local5 = Engine.GetModel( f1_local1, "killstreak0.momentumCost" )
	if f1_local5 == nil then
		f1_local5 = Engine.CreateModel( f1_local1, "killstreak0.momentumCost" )
	end
	local f1_local6 = 0
	if Engine.GetModelValue( f1_local5 ) == nil or Engine.GetModelValue( f1_local5 ) == 0 then
		self:subscribeToModel( f1_local5, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue ~= nil and Engine.GetModelValue( f1_local4 ) < modelValue then
				f1_local6 = modelValue
				Engine.SetModelValue( f1_local2, modelValue )
			end
		end )
	else
		f1_local6 = Engine.GetModelValue( f1_local5 )
		Engine.SetModelValue( f1_local2, f1_local6 or 0 )
	end
	self:subscribeToModel( f1_local4, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue ~= nil then
			local f6_local1 = 0
			if self.timer ~= nil then
				self.timer:close()
				self.timer = nil
			end
			for f6_local2 = 0, CoD.CACUtility.maxScorestreaks - 1, 1 do
				local f6_local5 = Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak" .. f6_local2 .. ".momentumCost" )
				local f6_local6 = Engine.GetModelValue( f6_local5 )
				if f6_local5 and f6_local6 and modelValue < f6_local6 then
					if f1_local6 ~= f6_local6 and Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak" .. f6_local2 + CoD.CACUtility.maxScorestreaks - 1 % CoD.CACUtility.maxScorestreaks .. ".rewardAmmo" ) ) ~= 0 then
					
					else
						Engine.SetModelValue( f1_local2, f6_local6 - modelValue )
						Engine.SetModelValue( f1_local3, (modelValue - f6_local1) / (f6_local6 - f6_local1) )
					end
					f1_local6 = f6_local6
					Engine.SetModelValue( f1_local3, 1 )
					Engine.SetModelValue( f1_local2, 0 )
					self:registerEventHandler( "time_up", function ( element, event )
						Engine.SetModelValue( f1_local3, (modelValue - f6_local1) / (f6_local6 - f6_local1) )
						Engine.SetModelValue( f1_local2, f6_local6 - modelValue )
					end )
					self.timer = LUI.UITimer.new( 1000, "time_up", true )
					self:addElement( self.timer )
				end
				f6_local1 = f6_local6
			end
		end
	end )
end

CoD.ScrStk_Container = InheritFrom( LUI.UIElement )
CoD.ScrStk_Container.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_Container )
	self.id = "ScrStk_Container"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 109 )
	self:setTopBottom( true, false, 0, 175 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ScrStkCombatEfficiencyBackGlow0 = CoD.ScrStk_CombatEfficiencyBackGlow.new( menu, controller )
	ScrStkCombatEfficiencyBackGlow0:setLeftRight( false, true, -152, 60 )
	ScrStkCombatEfficiencyBackGlow0:setTopBottom( true, false, -24, 223 )
	ScrStkCombatEfficiencyBackGlow0:setAlpha( 0.53 )
	self:addElement( ScrStkCombatEfficiencyBackGlow0 )
	self.ScrStkCombatEfficiencyBackGlow0 = ScrStkCombatEfficiencyBackGlow0
	
	local ScrStkPanelContainer0 = CoD.ScrStk_PanelContainer.new( menu, controller )
	ScrStkPanelContainer0:setLeftRight( false, true, -65.5, -4.5 )
	ScrStkPanelContainer0:setTopBottom( true, false, 4.5, 170.5 )
	ScrStkPanelContainer0:setZoom( -20 )
	ScrStkPanelContainer0:mergeStateConditions( {
		{
			stateName = "Scr2",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Scr3",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Scr4",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ScrStkPanelContainer0 )
	self.ScrStkPanelContainer0 = ScrStkPanelContainer0
	
	local ScrStkMeter1 = CoD.ScrStk_Meter.new( menu, controller )
	ScrStkMeter1:setLeftRight( false, true, -109, -59 )
	ScrStkMeter1:setTopBottom( true, false, 40, 170 )
	self:addElement( ScrStkMeter1 )
	self.ScrStkMeter1 = ScrStkMeter1
	
	local ScrStkButtons = LUI.UIList.new( menu, controller, -11, 0, nil, false, false, 0, 0, false, false )
	ScrStkButtons:makeFocusable()
	ScrStkButtons:setLeftRight( false, true, -65.46, 3.54 )
	ScrStkButtons:setTopBottom( true, false, 0, 175 )
	ScrStkButtons:setDataSource( "KillstreakRewardsList" )
	ScrStkButtons:setWidgetType( CoD.ScrStk_Button )
	ScrStkButtons:setVerticalCount( 4 )
	ScrStkButtons:setSpacing( -11 )
	self:addElement( ScrStkButtons )
	self.ScrStkButtons = ScrStkButtons
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ScrStkCombatEfficiencyBackGlow0:completeAnimation()
				self.ScrStkCombatEfficiencyBackGlow0:setAlpha( 0 )
				self.clipFinished( ScrStkCombatEfficiencyBackGlow0, {} )
				ScrStkPanelContainer0:completeAnimation()
				self.ScrStkPanelContainer0:setAlpha( 0 )
				self.clipFinished( ScrStkPanelContainer0, {} )
				ScrStkMeter1:completeAnimation()
				self.ScrStkMeter1:setAlpha( 0 )
				self.clipFinished( ScrStkMeter1, {} )
				ScrStkButtons:completeAnimation()
				self.ScrStkButtons:setAlpha( 0 )
				self.clipFinished( ScrStkButtons, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 4 )
				local ScrStkCombatEfficiencyBackGlow0Frame2 = function ( ScrStkCombatEfficiencyBackGlow0, event )
					if not event.interrupted then
						ScrStkCombatEfficiencyBackGlow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					ScrStkCombatEfficiencyBackGlow0:setAlpha( 0.53 )
					if event.interrupted then
						self.clipFinished( ScrStkCombatEfficiencyBackGlow0, event )
					else
						ScrStkCombatEfficiencyBackGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScrStkCombatEfficiencyBackGlow0:completeAnimation()
				self.ScrStkCombatEfficiencyBackGlow0:setAlpha( 0 )
				ScrStkCombatEfficiencyBackGlow0Frame2( ScrStkCombatEfficiencyBackGlow0, {} )
				local ScrStkPanelContainer0Frame2 = function ( ScrStkPanelContainer0, event )
					if not event.interrupted then
						ScrStkPanelContainer0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
					end
					ScrStkPanelContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ScrStkPanelContainer0, event )
					else
						ScrStkPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScrStkPanelContainer0:completeAnimation()
				self.ScrStkPanelContainer0:setAlpha( 0 )
				ScrStkPanelContainer0Frame2( ScrStkPanelContainer0, {} )
				local ScrStkMeter1Frame2 = function ( ScrStkMeter1, event )
					if not event.interrupted then
						ScrStkMeter1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Bounce )
					end
					ScrStkMeter1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ScrStkMeter1, event )
					else
						ScrStkMeter1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScrStkMeter1:completeAnimation()
				self.ScrStkMeter1:setAlpha( 0 )
				ScrStkMeter1Frame2( ScrStkMeter1, {} )
				local ScrStkButtonsFrame2 = function ( ScrStkButtons, event )
					local ScrStkButtonsFrame3 = function ( ScrStkButtons, event )
						if not event.interrupted then
							ScrStkButtons:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Bounce )
						end
						ScrStkButtons:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ScrStkButtons, event )
						else
							ScrStkButtons:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScrStkButtonsFrame3( ScrStkButtons, event )
						return 
					else
						ScrStkButtons:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						ScrStkButtons:registerEventHandler( "transition_complete_keyframe", ScrStkButtonsFrame3 )
					end
				end
				
				ScrStkButtons:completeAnimation()
				self.ScrStkButtons:setAlpha( 0 )
				ScrStkButtonsFrame2( ScrStkButtons, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ScrStkCombatEfficiencyBackGlow0:completeAnimation()
				self.ScrStkCombatEfficiencyBackGlow0:setAlpha( 0.53 )
				self.clipFinished( ScrStkCombatEfficiencyBackGlow0, {} )
				ScrStkPanelContainer0:completeAnimation()
				self.ScrStkPanelContainer0:setAlpha( 1 )
				self.clipFinished( ScrStkPanelContainer0, {} )
				ScrStkMeter1:completeAnimation()
				self.ScrStkMeter1:setAlpha( 1 )
				self.clipFinished( ScrStkMeter1, {} )
				ScrStkButtons:completeAnimation()
				self.ScrStkButtons:setAlpha( 1 )
				self.clipFinished( ScrStkButtons, {} )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 4 )
				local ScrStkCombatEfficiencyBackGlow0Frame2 = function ( ScrStkCombatEfficiencyBackGlow0, event )
					if not event.interrupted then
						ScrStkCombatEfficiencyBackGlow0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					ScrStkCombatEfficiencyBackGlow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ScrStkCombatEfficiencyBackGlow0, event )
					else
						ScrStkCombatEfficiencyBackGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScrStkCombatEfficiencyBackGlow0:completeAnimation()
				self.ScrStkCombatEfficiencyBackGlow0:setAlpha( 0.53 )
				ScrStkCombatEfficiencyBackGlow0Frame2( ScrStkCombatEfficiencyBackGlow0, {} )
				local ScrStkPanelContainer0Frame2 = function ( ScrStkPanelContainer0, event )
					if not event.interrupted then
						ScrStkPanelContainer0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ScrStkPanelContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ScrStkPanelContainer0, event )
					else
						ScrStkPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScrStkPanelContainer0:completeAnimation()
				self.ScrStkPanelContainer0:setAlpha( 1 )
				ScrStkPanelContainer0Frame2( ScrStkPanelContainer0, {} )
				local ScrStkMeter1Frame2 = function ( ScrStkMeter1, event )
					if not event.interrupted then
						ScrStkMeter1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
					end
					ScrStkMeter1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ScrStkMeter1, event )
					else
						ScrStkMeter1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScrStkMeter1:completeAnimation()
				self.ScrStkMeter1:setAlpha( 1 )
				ScrStkMeter1Frame2( ScrStkMeter1, {} )
				local ScrStkButtonsFrame2 = function ( ScrStkButtons, event )
					local ScrStkButtonsFrame3 = function ( ScrStkButtons, event )
						if not event.interrupted then
							ScrStkButtons:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						ScrStkButtons:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ScrStkButtons, event )
						else
							ScrStkButtons:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScrStkButtonsFrame3( ScrStkButtons, event )
						return 
					else
						ScrStkButtons:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						ScrStkButtons:registerEventHandler( "transition_complete_keyframe", ScrStkButtonsFrame3 )
					end
				end
				
				ScrStkButtons:completeAnimation()
				self.ScrStkButtons:setAlpha( 1 )
				ScrStkButtonsFrame2( ScrStkButtons, {} )
			end
		},
		ShowForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ScrStkCombatEfficiencyBackGlow0:completeAnimation()
				self.ScrStkCombatEfficiencyBackGlow0:setAlpha( 0.53 )
				self.clipFinished( ScrStkCombatEfficiencyBackGlow0, {} )
				ScrStkPanelContainer0:completeAnimation()
				self.ScrStkPanelContainer0:setAlpha( 1 )
				self.clipFinished( ScrStkPanelContainer0, {} )
				ScrStkMeter1:completeAnimation()
				self.ScrStkMeter1:setAlpha( 1 )
				self.clipFinished( ScrStkMeter1, {} )
				ScrStkButtons:completeAnimation()
				self.ScrStkButtons:setAlpha( 1 )
				self.clipFinished( ScrStkButtons, {} )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 4 )
				local ScrStkCombatEfficiencyBackGlow0Frame2 = function ( ScrStkCombatEfficiencyBackGlow0, event )
					if not event.interrupted then
						ScrStkCombatEfficiencyBackGlow0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
					end
					ScrStkCombatEfficiencyBackGlow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ScrStkCombatEfficiencyBackGlow0, event )
					else
						ScrStkCombatEfficiencyBackGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScrStkCombatEfficiencyBackGlow0:completeAnimation()
				self.ScrStkCombatEfficiencyBackGlow0:setAlpha( 0.53 )
				ScrStkCombatEfficiencyBackGlow0Frame2( ScrStkCombatEfficiencyBackGlow0, {} )
				local ScrStkPanelContainer0Frame2 = function ( ScrStkPanelContainer0, event )
					if not event.interrupted then
						ScrStkPanelContainer0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ScrStkPanelContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ScrStkPanelContainer0, event )
					else
						ScrStkPanelContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScrStkPanelContainer0:completeAnimation()
				self.ScrStkPanelContainer0:setAlpha( 1 )
				ScrStkPanelContainer0Frame2( ScrStkPanelContainer0, {} )
				local ScrStkMeter1Frame2 = function ( ScrStkMeter1, event )
					if not event.interrupted then
						ScrStkMeter1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
					end
					ScrStkMeter1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ScrStkMeter1, event )
					else
						ScrStkMeter1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScrStkMeter1:completeAnimation()
				self.ScrStkMeter1:setAlpha( 1 )
				ScrStkMeter1Frame2( ScrStkMeter1, {} )
				local ScrStkButtonsFrame2 = function ( ScrStkButtons, event )
					local ScrStkButtonsFrame3 = function ( ScrStkButtons, event )
						if not event.interrupted then
							ScrStkButtons:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
						end
						ScrStkButtons:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ScrStkButtons, event )
						else
							ScrStkButtons:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScrStkButtonsFrame3( ScrStkButtons, event )
						return 
					else
						ScrStkButtons:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						ScrStkButtons:registerEventHandler( "transition_complete_keyframe", ScrStkButtonsFrame3 )
					end
				end
				
				ScrStkButtons:completeAnimation()
				self.ScrStkButtons:setAlpha( 1 )
				ScrStkButtonsFrame2( ScrStkButtons, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "ShowForCodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and IsCodCasterProfileValueEqualTo( controller, "shoutcaster_scorestreaks", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	ScrStkButtons.id = "ScrStkButtons"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScrStkButtons:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScrStkCombatEfficiencyBackGlow0:close()
		element.ScrStkPanelContainer0:close()
		element.ScrStkMeter1:close()
		element.ScrStkButtons:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

