require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.ScoreboardTab.AARScoreboardHeaderWidget" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCPAAR" )
require( "ui.uieditor.widgets.AAR.CP.ScoreboardTab.AARScoreboardRowWidgetCP" )

local PreLoadFunc = function ( self, controller )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
end

CoD.ScoreboardTabWidgetCP = InheritFrom( LUI.UIElement )
CoD.ScoreboardTabWidgetCP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardTabWidgetCP )
	self.id = "ScoreboardTabWidgetCP"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 526 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( true, true, 0, 0 )
	VignetteBack:setTopBottom( true, false, -94.37, 625.63 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local AARScoreboardHeaderWidget = CoD.AARScoreboardHeaderWidget.new( menu, controller )
	AARScoreboardHeaderWidget:setLeftRight( true, false, 67, 1017 )
	AARScoreboardHeaderWidget:setTopBottom( true, false, 7.5, 34.5 )
	AARScoreboardHeaderWidget:setAlpha( 0 )
	self:addElement( AARScoreboardHeaderWidget )
	self.AARScoreboardHeaderWidget = AARScoreboardHeaderWidget
	
	local ScoreboardWidgetCP0 = CoD.ScoreboardWidgetCPAAR.new( menu, controller )
	ScoreboardWidgetCP0:setLeftRight( true, false, 137, 1143 )
	ScoreboardWidgetCP0:setTopBottom( true, false, 34.5, 560.5 )
	ScoreboardWidgetCP0.ScoreboardFactionScoresListCP0.Team1:setWidgetType( CoD.AARScoreboardRowWidgetCP )
	ScoreboardWidgetCP0.ScoreboardFactionScoresListCP0.Team1:setVerticalCount( 4 )
	ScoreboardWidgetCP0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:addElement( ScoreboardWidgetCP0 )
	self.ScoreboardWidgetCP0 = ScoreboardWidgetCP0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 840.91, 1104.91 )
	Image0:setTopBottom( true, false, 787.06, 904.06 )
	Image0:setRGB( 0.56, 0.56, 0.56 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 840.91, 1104.91 )
	TextBox0:setTopBottom( true, false, 787.06, 829.06 )
	TextBox0:setText( Engine.Localize( "MENU_NEW" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 840.91, 1104.91 )
	TextBox1:setTopBottom( true, false, 845.56, 888.56 )
	TextBox1:setText( Engine.Localize( "MENU_NEW" ) )
	TextBox1:setTTF( "fonts/default.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
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
	ScoreboardWidgetCP0.id = "ScoreboardWidgetCP0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScoreboardWidgetCP0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteBack:close()
		element.AARScoreboardHeaderWidget:close()
		element.ScoreboardWidgetCP0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

