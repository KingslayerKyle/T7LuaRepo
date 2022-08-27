-- 87d9e3d0d8c9f41764422f63cb43d910
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardHeaderWidgetCP" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardFactionScoresListCP" )

CoD.ScoreboardWidgetCPAAR = InheritFrom( LUI.UIElement )
CoD.ScoreboardWidgetCPAAR.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardWidgetCPAAR )
	self.id = "ScoreboardWidgetCPAAR"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1006 )
	self:setTopBottom( true, false, 0, 526 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ScoreboardHeaderWidgetCP0 = CoD.ScoreboardHeaderWidgetCP.new( menu, controller )
	ScoreboardHeaderWidgetCP0:setLeftRight( true, false, 105, 907 )
	ScoreboardHeaderWidgetCP0:setTopBottom( true, false, 0, 32 )
	self:addElement( ScoreboardHeaderWidgetCP0 )
	self.ScoreboardHeaderWidgetCP0 = ScoreboardHeaderWidgetCP0
	
	local ScoreboardFactionScoresListCP0 = CoD.ScoreboardFactionScoresListCP.new( menu, controller )
	ScoreboardFactionScoresListCP0:setLeftRight( true, false, 105, 933 )
	ScoreboardFactionScoresListCP0:setTopBottom( true, false, 47, 526 )
	self:addElement( ScoreboardFactionScoresListCP0 )
	self.ScoreboardFactionScoresListCP0 = ScoreboardFactionScoresListCP0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ScoreboardHeaderWidgetCP0:completeAnimation()
				self.ScoreboardHeaderWidgetCP0:setAlpha( 0 )
				self.clipFinished( ScoreboardHeaderWidgetCP0, {} )
				ScoreboardFactionScoresListCP0:completeAnimation()
				self.ScoreboardFactionScoresListCP0:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionScoresListCP0, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 2 )
				local ScoreboardHeaderWidgetCP0Frame2 = function ( ScoreboardHeaderWidgetCP0, event )
					if not event.interrupted then
						ScoreboardHeaderWidgetCP0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
					end
					ScoreboardHeaderWidgetCP0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ScoreboardHeaderWidgetCP0, event )
					else
						ScoreboardHeaderWidgetCP0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreboardHeaderWidgetCP0:completeAnimation()
				self.ScoreboardHeaderWidgetCP0:setAlpha( 0 )
				ScoreboardHeaderWidgetCP0Frame2( ScoreboardHeaderWidgetCP0, {} )
				local f3_local1 = function ( f5_arg0, f5_arg1 )
					if not f5_arg1.interrupted then
						f5_arg0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					f5_arg0:setAlpha( 1 )
					if f5_arg1.interrupted then
						self.clipFinished( f5_arg0, f5_arg1 )
					else
						f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreboardFactionScoresListCP0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				ScoreboardFactionScoresListCP0:setAlpha( 0 )
				ScoreboardFactionScoresListCP0:registerEventHandler( "transition_complete_keyframe", f3_local1 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ScoreboardHeaderWidgetCP0:completeAnimation()
				self.ScoreboardHeaderWidgetCP0:setAlpha( 1 )
				self.clipFinished( ScoreboardHeaderWidgetCP0, {} )
				ScoreboardFactionScoresListCP0:completeAnimation()
				self.ScoreboardFactionScoresListCP0:setAlpha( 1 )
				self.clipFinished( ScoreboardFactionScoresListCP0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	ScoreboardFactionScoresListCP0.id = "ScoreboardFactionScoresListCP0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ScoreboardFactionScoresListCP0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreboardHeaderWidgetCP0:close()
		element.ScoreboardFactionScoresListCP0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

