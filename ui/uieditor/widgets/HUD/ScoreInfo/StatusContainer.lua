-- 586659970aa11e38d64bb961031facb2
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "gameScore.playerScore" )
	local f1_local1 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "gameScore.enemyScore" )
	if f1_local0 then
		f1_local0 = Engine.GetModelValue( f1_local0 )
	end
	if f1_local1 then
		f1_local1 = Engine.GetModelValue( f1_local1 )
	end
	if f1_local0 ~= nil and f1_local1 ~= nil then
		if f1_local1 < f1_local0 then
			f1_arg0.PrimaryStatus:setText( Engine.Localize( "MENU_WINNING_CAPS" ) )
		elseif f1_local0 < f1_local1 then
			f1_arg0.PrimaryStatus:setText( Engine.Localize( "MENU_LOSING_CAPS" ) )
		else
			f1_arg0.PrimaryStatus:setText( Engine.Localize( "MENU_TIED_CAPS" ) )
		end
	else
		f1_arg0.PrimaryStatus:setText( Engine.Localize( "MENU_TIED_CAPS" ) )
	end
end

local f0_local1 = function ()
	return Engine.DvarString( nil, "g_gametype" ) == "dom"
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	local f3_local0 = function ( f4_arg0, f4_arg1 )
		f3_arg0.PrimaryStatus:beginAnimation( "show_primary_status", 500 )
		f3_arg0.PrimaryStatus:setAlpha( 1 )
	end
	
	local f3_local1 = function ( f5_arg0, f5_arg1 )
		f3_arg0.PrimaryStatus:beginAnimation( "hide_primary_status", 500 )
		f3_arg0.PrimaryStatus:setAlpha( 0 )
		f3_arg0.PrimaryStatus:registerEventHandler( "transition_complete_hide_primary_status", function ( element, event )
			element:dispatchEventToParent( {
				name = "show_secondary_status"
			} )
		end )
	end
	
	local f3_local2 = function ( f7_arg0, f7_arg1 )
		f3_arg0.SecondaryStatus:beginAnimation( "show_secondary_status", 500 )
		f3_arg0.SecondaryStatus:setAlpha( 1 )
	end
	
	local f3_local3 = function ( f8_arg0, f8_arg1 )
		f3_arg0.SecondaryStatus:beginAnimation( "hide_secondary_statuss", 500 )
		f3_arg0.SecondaryStatus:setAlpha( 0 )
		f3_arg0.SecondaryStatus:registerEventHandler( "transition_complete_hide_secondary_statuss", function ( element, event )
			element:dispatchEventToParent( {
				name = "show_primary_status"
			} )
		end )
	end
	
	local f3_local4 = function ( f10_arg0, f10_arg1 )
		if f3_arg0.doNotCycle then
			return 
		elseif CoD.IsInOvertime( f3_arg1 ) then
			return 
		elseif f3_arg0.showPrimaryStatus and not IsInPrematchPeriod() then
			f3_arg0:processEvent( {
				name = "hide_secondary_status"
			} )
			f3_arg0.showPrimaryStatus = false
		else
			f3_arg0:processEvent( {
				name = "hide_primary_status"
			} )
			f3_arg0.showPrimaryStatus = true
		end
	end
	
	local f3_local5 = Engine.GetGametypeSetting( "scoreLimit" )
	local f3_local6 = Engine.GetGametypeSetting( "roundLimit" )
	local f3_local7 = Engine.GetGametypeSetting( "roundScoreLimit" )
	if f3_local5 > 0 then
		if f3_local5 == 1 then
			f3_arg0.SecondaryStatus:setText( Engine.Localize( "MPUI_1_POINT_TO_WIN_CAPS" ) )
		else
			f3_arg0.SecondaryStatus:setText( Engine.Localize( "MPUI_X_POINTS_TO_WIN_CAPS", f3_local5 ) )
		end
	elseif f0_local1() then
		f3_arg0.SecondaryStatus:setText( Engine.Localize( "MPUI_X_POINTS_TO_WIN_CAPS", f3_local6 * f3_local7 ) )
	else
		f3_arg0.SecondaryStatus:setText( "" )
	end
	f3_arg0:registerEventHandler( "hide_primary_status", f3_local1 )
	f3_arg0:registerEventHandler( "show_secondary_status", f3_local2 )
	f3_arg0:registerEventHandler( "show_primary_status", f3_local0 )
	f3_arg0:registerEventHandler( "hide_secondary_status", f3_local3 )
	f3_arg0:registerEventHandler( "toggle_status", f3_local4 )
	f3_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "gameScore.playerScore" ), function ( model )
		f0_local0( f3_arg0, f3_arg1 )
	end )
	f3_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "gameScore.enemyScore" ), function ( model )
		f0_local0( f3_arg0, f3_arg1 )
	end )
	f3_local4()
	f3_arg0:addElement( LUI.UITimer.new( 9000, "toggle_status", false, f3_arg0 ) )
	f3_arg0.showPrimaryStatus = false
end

CoD.StatusContainer = InheritFrom( LUI.UIElement )
CoD.StatusContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StatusContainer )
	self.id = "StatusContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 290 )
	self:setTopBottom( true, false, 0, 16 )
	
	local PrimaryStatus = LUI.UIText.new()
	PrimaryStatus:setLeftRight( true, false, -11, 302 )
	PrimaryStatus:setTopBottom( true, false, 0, 18 )
	PrimaryStatus:setText( Engine.Localize( " WINNING" ) )
	PrimaryStatus:setTTF( "fonts/escom.ttf" )
	PrimaryStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PrimaryStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrimaryStatus )
	self.PrimaryStatus = PrimaryStatus
	
	local SecondaryStatus = LUI.UIText.new()
	SecondaryStatus:setLeftRight( true, false, 0, 291 )
	SecondaryStatus:setTopBottom( true, false, 0, 13.51 )
	SecondaryStatus:setAlpha( 0 )
	SecondaryStatus:setText( Engine.Localize( "75 POINTS TO WIN" ) )
	SecondaryStatus:setTTF( "fonts/escom.ttf" )
	SecondaryStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SecondaryStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SecondaryStatus )
	self.SecondaryStatus = SecondaryStatus
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

