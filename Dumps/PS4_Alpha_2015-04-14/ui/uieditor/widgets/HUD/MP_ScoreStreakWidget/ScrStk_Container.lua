require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_CombatEfficiencyBackGlow" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_PanelContainer" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_Meter" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_Button" )

local PreLoadFunc = function ( self, controller )
	local datasourceName = "KillstreakRewardsList"
	if DataSources[datasourceName] == nil then
		DataSources[datasourceName] = {
			getCount = function ( list )
				return 4
			end,
			getItem = function ( controller, list, index )
				local killstreaksModel = Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak" .. 4 - index )
				return killstreaksModel
			end
		}
	end
	local killstreaksModel = Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks" )
	local targetMomentumModel = Engine.CreateModel( killstreaksModel, "targetMomentum" )
	local momentumPercentageModel = Engine.CreateModel( killstreaksModel, "momentumPercentage" )
	local rewardMomentumModel = Engine.GetModel( Engine.GetModelForController( controller ), "rewardMomentum" )
	if DataSources.KillstreakRewards == nil then
		DataSources.KillstreakRewards = {
			getModel = function ( controller )
				local perControllerModel = Engine.GetModelForController( controller )
				return Engine.GetModel( perControllerModel, "killstreaks" )
			end
		}
	end
	local momentumCostModel = Engine.GetModel( killstreaksModel, "killstreak0.momentumCost" )
	if momentumCostModel == nil then
		momentumCostModel = Engine.CreateModel( killstreaksModel, "killstreak0.momentumCost" )
	end
	local lastMomentumCostValue = 0
	if Engine.GetModelValue( momentumCostModel ) == nil or Engine.GetModelValue( momentumCostModel ) == 0 then
		self:subscribeToModel( momentumCostModel, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue ~= nil and Engine.GetModelValue( rewardMomentumModel ) < modelValue then
				lastMomentumCostValue = modelValue
				Engine.SetModelValue( targetMomentumModel, modelValue )
			end
		end )
	else
		lastMomentumCostValue = Engine.GetModelValue( momentumCostModel )
		Engine.SetModelValue( targetMomentumModel, lastMomentumCostValue or 0 )
	end
	self:subscribeToModel( rewardMomentumModel, function ( model )
		local value = Engine.GetModelValue( model )
		if value ~= nil then
			local previousMomentumCostValue = 0
			if self.timer ~= nil then
				self.timer:close()
				self.timer = nil
			end
			for i = 0, 3, 1 do
				local killstreakModel = Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.killstreak" .. i .. ".momentumCost" )
				local momentumCostValue = Engine.GetModelValue( killstreakModel )
				if killstreakModel and momentumCostValue and value < momentumCostValue then
					if lastMomentumCostValue ~= momentumCostValue then
					
					else
						Engine.SetModelValue( targetMomentumModel, momentumCostValue - value )
						Engine.SetModelValue( momentumPercentageModel, (value - previousMomentumCostValue) / (momentumCostValue - previousMomentumCostValue) )
					end
					lastMomentumCostValue = momentumCostValue
					Engine.SetModelValue( momentumPercentageModel, 1 )
					Engine.SetModelValue( targetMomentumModel, 0 )
					self:registerEventHandler( "time_up", function ( self, event )
						Engine.SetModelValue( momentumPercentageModel, (value - previousMomentumCostValue) / (momentumCostValue - previousMomentumCostValue) )
						Engine.SetModelValue( targetMomentumModel, momentumCostValue - value )
					end )
					self.timer = LUI.UITimer.new( 1000, "time_up", true )
					self:addElement( self.timer )
				end
				previousMomentumCostValue = momentumCostValue
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
	ScrStkCombatEfficiencyBackGlow0:setLeftRight( true, false, -43, 169 )
	ScrStkCombatEfficiencyBackGlow0:setTopBottom( true, false, -24, 223 )
	ScrStkCombatEfficiencyBackGlow0:setRGB( 1, 1, 1 )
	ScrStkCombatEfficiencyBackGlow0:setAlpha( 0.53 )
	self:addElement( ScrStkCombatEfficiencyBackGlow0 )
	self.ScrStkCombatEfficiencyBackGlow0 = ScrStkCombatEfficiencyBackGlow0
	
	local ScrStkPanelContainer0 = CoD.ScrStk_PanelContainer.new( menu, controller )
	ScrStkPanelContainer0:setLeftRight( true, false, 43.5, 104.5 )
	ScrStkPanelContainer0:setTopBottom( true, false, 4.5, 170.5 )
	ScrStkPanelContainer0:setRGB( 1, 1, 1 )
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
	ScrStkMeter1:setLeftRight( true, false, 0, 50 )
	ScrStkMeter1:setTopBottom( true, false, 40, 170 )
	ScrStkMeter1:setRGB( 1, 1, 1 )
	self:addElement( ScrStkMeter1 )
	self.ScrStkMeter1 = ScrStkMeter1
	
	local ScrStkButtons = LUI.UIList.new( menu, controller, -11, 0, nil, false, false, 0, 0, false, false )
	ScrStkButtons:makeFocusable()
	ScrStkButtons:setLeftRight( false, true, -77.46, -8.46 )
	ScrStkButtons:setTopBottom( true, false, 0, 175 )
	ScrStkButtons:setRGB( 1, 1, 1 )
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
		}
	}
	ScrStkButtons.id = "ScrStkButtons"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScrStkButtons:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.ScrStkCombatEfficiencyBackGlow0:close()
		self.ScrStkPanelContainer0:close()
		self.ScrStkMeter1:close()
		self.ScrStkButtons:close()
		CoD.ScrStk_Container.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

