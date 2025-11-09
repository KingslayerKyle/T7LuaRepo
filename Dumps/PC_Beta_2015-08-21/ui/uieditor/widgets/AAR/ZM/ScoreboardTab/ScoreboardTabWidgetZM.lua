require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.AAR.ZM.ScoreboardTab.PlayerStylesWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		f1_arg0.m_inputDisabled = not Engine.GetModelValue( model )
	end )
end

CoD.ScoreboardTabWidgetZM = InheritFrom( LUI.UIElement )
CoD.ScoreboardTabWidgetZM.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardTabWidgetZM )
	self.id = "ScoreboardTabWidgetZM"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 526 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, false, 0, 1280 )
	VignetteBack:setTopBottom( true, false, -94.37, 625.63 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local AARScoreboardHeaderWidget = CoD.AARScoreboardHeaderWidget.new( menu, controller )
	AARScoreboardHeaderWidget:setLeftRight( true, false, 67, 1017 )
	AARScoreboardHeaderWidget:setTopBottom( true, false, 7.5, 34.5 )
	AARScoreboardHeaderWidget:setAlpha( 0 )
	self:addElement( AARScoreboardHeaderWidget )
	self.AARScoreboardHeaderWidget = AARScoreboardHeaderWidget
	
	local ScoreboardWidget = CoD.ScoreboardWidgetCP.new( menu, controller )
	ScoreboardWidget:setLeftRight( true, false, 137, 1143 )
	ScoreboardWidget:setTopBottom( true, false, 34.5, 219.5 )
	ScoreboardWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ScoreboardWidget )
	self.ScoreboardWidget = ScoreboardWidget
	
	local PlayerStylesList = LUI.UIList.new( menu, controller, 41, 0, nil, false, false, 0, 0, false, true )
	PlayerStylesList:makeFocusable()
	PlayerStylesList:setLeftRight( true, false, 204.86, 1127.86 )
	PlayerStylesList:setTopBottom( true, false, 388.19, 491.19 )
	PlayerStylesList:setDataSource( "ZmPlayerStyles" )
	PlayerStylesList:setWidgetType( CoD.PlayerStylesWidget )
	PlayerStylesList:setHorizontalCount( 4 )
	PlayerStylesList:setSpacing( 41 )
	self:addElement( PlayerStylesList )
	self.PlayerStylesList = PlayerStylesList
	
	ScoreboardWidget.navigation = {
		down = PlayerStylesList
	}
	PlayerStylesList.navigation = {
		up = ScoreboardWidget
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local VignetteBackFrame2 = function ( VignetteBack, event )
					if not event.interrupted then
						VignetteBack:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
					end
					VignetteBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( VignetteBack, event )
					else
						VignetteBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VignetteBack:completeAnimation()
				self.VignetteBack:setAlpha( 0 )
				VignetteBackFrame2( VignetteBack, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	ScoreboardWidget.id = "ScoreboardWidget"
	PlayerStylesList.id = "PlayerStylesList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScoreboardWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteBack:close()
		element.AARScoreboardHeaderWidget:close()
		element.ScoreboardWidget:close()
		element.PlayerStylesList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

