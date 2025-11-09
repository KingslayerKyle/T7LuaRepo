local SetStatusText = function ( self, event )
	if event.enemyScore < event.yourScore then
		self.PrimaryStatus:setText( Engine.Localize( "MENU_WINNING_CAPS" ) )
	elseif event.yourScore < event.enemyScore then
		self.PrimaryStatus:setText( Engine.Localize( "MENU_LOSING_CAPS" ) )
	else
		self.PrimaryStatus:setText( Engine.Localize( "MENU_TIED_CAPS" ) )
	end
end

local PostLoadFunc = function ( self, controller )
	local showPrimaryStatus = function ( element, event )
		self.PrimaryStatus:beginAnimation( "show_primary_status", 500 )
		self.PrimaryStatus:setAlpha( 1 )
	end
	
	local hidePrimaryStatus = function ( element, event )
		self.PrimaryStatus:beginAnimation( "hide_primary_status", 500 )
		self.PrimaryStatus:setAlpha( 0 )
		self.PrimaryStatus:registerEventHandler( "transition_complete_hide_primary_status", function ( self, event )
			self:dispatchEventToParent( {
				name = "show_secondary_status"
			} )
		end )
	end
	
	local showSecondaryStatus = function ( element, event )
		self.SecondaryStatus:beginAnimation( "show_secondary_status", 500 )
		self.SecondaryStatus:setAlpha( 1 )
	end
	
	local hideSecondaryStatus = function ( element, event )
		self.SecondaryStatus:beginAnimation( "hide_secondary_statuss", 500 )
		self.SecondaryStatus:setAlpha( 0 )
		self.SecondaryStatus:registerEventHandler( "transition_complete_hide_secondary_statuss", function ( self, event )
			self:dispatchEventToParent( {
				name = "show_primary_status"
			} )
		end )
	end
	
	local toggleStatus = function ( element, event )
		if self.doNotCycle then
			return 
		elseif CoD.IsInOvertime( controller ) then
			return 
		elseif self.showPrimaryStatus and not IsInPrematchPeriod() then
			self:processEvent( {
				name = "hide_secondary_status"
			} )
			self.showPrimaryStatus = false
		else
			self:processEvent( {
				name = "hide_primary_status"
			} )
			self.showPrimaryStatus = true
		end
	end
	
	local scoreLimit = Engine.GetGametypeSetting( "scoreLimit" )
	if scoreLimit > 0 then
		if scoreLimit == 1 then
			self.SecondaryStatus:setText( Engine.Localize( "MPUI_1_POINT_TO_WIN_CAPS" ) )
		else
			self.SecondaryStatus:setText( Engine.Localize( "MPUI_X_POINTS_TO_WIN_CAPS", scoreLimit ) )
		end
	else
		self.SecondaryStatus:setText( "" )
	end
	self:registerEventHandler( "hide_primary_status", hidePrimaryStatus )
	self:registerEventHandler( "show_secondary_status", showSecondaryStatus )
	self:registerEventHandler( "show_primary_status", showPrimaryStatus )
	self:registerEventHandler( "hide_secondary_status", hideSecondaryStatus )
	self:registerEventHandler( "toggle_status", toggleStatus )
	self:registerEventHandler( "hud_update_scores", SetStatusText )
	toggleStatus()
	self:addElement( LUI.UITimer.new( 9000, "toggle_status", false, self ) )
	self.showPrimaryStatus = false
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
	PrimaryStatus:setLeftRight( true, false, -111, 202 )
	PrimaryStatus:setTopBottom( true, false, 0, 13.51 )
	PrimaryStatus:setRGB( 1, 1, 1 )
	PrimaryStatus:setText( Engine.Localize( " WINNING" ) )
	PrimaryStatus:setTTF( "fonts/Entovo.ttf" )
	PrimaryStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PrimaryStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrimaryStatus )
	self.PrimaryStatus = PrimaryStatus
	
	local SecondaryStatus = LUI.UIText.new()
	SecondaryStatus:setLeftRight( true, false, 16, 307 )
	SecondaryStatus:setTopBottom( true, false, 0, 13.51 )
	SecondaryStatus:setRGB( 1, 1, 1 )
	SecondaryStatus:setAlpha( 0 )
	SecondaryStatus:setText( Engine.Localize( "75 POINTS TO WIN" ) )
	SecondaryStatus:setTTF( "fonts/Entovo.ttf" )
	SecondaryStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SecondaryStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SecondaryStatus )
	self.SecondaryStatus = SecondaryStatus
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

