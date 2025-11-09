require( "ui.uieditor.widgets.Leaderboard.LeaderboardRow" )
require( "ui.uieditor.widgets.Leaderboard.LeaderboardHeader" )

CoD.Leaderboard = InheritFrom( LUI.UIElement )
CoD.Leaderboard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.Leaderboard )
	self.id = "Leaderboard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 780 )
	self:setTopBottom( true, false, 0, 391 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local LeaderboardRows = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	LeaderboardRows:makeFocusable()
	LeaderboardRows:setLeftRight( true, false, 0, 780 )
	LeaderboardRows:setTopBottom( true, false, 31, 391 )
	LeaderboardRows:setDataSource( "LeaderboardRows" )
	LeaderboardRows:setWidgetType( CoD.LeaderboardRow )
	LeaderboardRows:setVerticalCount( 15 )
	LeaderboardRows:setSpacing( 0 )
	self:addElement( LeaderboardRows )
	self.LeaderboardRows = LeaderboardRows
	
	local LeaderboardHeader = CoD.LeaderboardHeader.new( menu, controller )
	LeaderboardHeader:setLeftRight( true, false, 0, 780 )
	LeaderboardHeader:setTopBottom( true, false, 0, 20 )
	LeaderboardHeader:subscribeToGlobalModel( controller, "LeaderboardHeader", nil, function ( model )
		LeaderboardHeader:setModel( model, controller )
	end )
	self:addElement( LeaderboardHeader )
	self.LeaderboardHeader = LeaderboardHeader
	
	local LoadingText = LUI.UIText.new()
	LoadingText:setLeftRight( true, false, 326, 436 )
	LoadingText:setTopBottom( true, false, 174, 194 )
	LoadingText:setText( Engine.Localize( "MENU_LB_LOADING" ) )
	LoadingText:setTTF( "fonts/UnitedSansRgMd.ttf" )
	LoadingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LoadingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( LoadingText )
	self.LoadingText = LoadingText
	
	local GroupsLeaderboardEmpty = LUI.UIText.new()
	GroupsLeaderboardEmpty:setLeftRight( true, false, 169.5, 610.5 )
	GroupsLeaderboardEmpty:setTopBottom( true, false, 174, 194 )
	GroupsLeaderboardEmpty:setText( Engine.Localize( "GROUPS_LEADERBOARD_EMPTY" ) )
	GroupsLeaderboardEmpty:setTTF( "fonts/UnitedSansRgMd.ttf" )
	GroupsLeaderboardEmpty:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GroupsLeaderboardEmpty:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GroupsLeaderboardEmpty )
	self.GroupsLeaderboardEmpty = GroupsLeaderboardEmpty
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LeaderboardRows:completeAnimation()
				self.LeaderboardRows:setAlpha( 1 )
				self.clipFinished( LeaderboardRows, {} )
				LeaderboardHeader:completeAnimation()
				self.LeaderboardHeader:setAlpha( 1 )
				self.clipFinished( LeaderboardHeader, {} )
				LoadingText:completeAnimation()
				self.LoadingText:setAlpha( 0 )
				self.clipFinished( LoadingText, {} )
				GroupsLeaderboardEmpty:completeAnimation()
				self.GroupsLeaderboardEmpty:setAlpha( 0 )
				self.clipFinished( GroupsLeaderboardEmpty, {} )
			end
		},
		UpdatingLeaderboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LeaderboardRows:completeAnimation()
				self.LeaderboardRows:setAlpha( 0 )
				self.clipFinished( LeaderboardRows, {} )
				LeaderboardHeader:completeAnimation()
				self.LeaderboardHeader:setAlpha( 1 )
				self.clipFinished( LeaderboardHeader, {} )
				LoadingText:completeAnimation()
				self.LoadingText:setAlpha( 1 )
				self.clipFinished( LoadingText, {} )
				GroupsLeaderboardEmpty:completeAnimation()
				self.GroupsLeaderboardEmpty:setAlpha( 0 )
				self.clipFinished( GroupsLeaderboardEmpty, {} )
			end
		},
		EmptyLeaderboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LeaderboardRows:completeAnimation()
				self.LeaderboardRows:setAlpha( 0 )
				self.clipFinished( LeaderboardRows, {} )
				LeaderboardHeader:completeAnimation()
				self.LeaderboardHeader:setAlpha( 1 )
				self.clipFinished( LeaderboardHeader, {} )
				LoadingText:completeAnimation()
				self.LoadingText:setAlpha( 0 )
				self.clipFinished( LoadingText, {} )
				GroupsLeaderboardEmpty:completeAnimation()
				self.GroupsLeaderboardEmpty:setAlpha( 1 )
				self.clipFinished( GroupsLeaderboardEmpty, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "UpdatingLeaderboard",
			condition = function ( menu, element, event )
				return IsLeaderboardUpdating()
			end
		},
		{
			stateName = "EmptyLeaderboard",
			condition = function ( menu, element, event )
				return IsLeaderboardEmpty()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.isUpdating" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.isUpdating"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard.totalResults" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "leaderboard.totalResults"
		} )
	end )
	LeaderboardRows.id = "LeaderboardRows"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.LeaderboardRows:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeaderboardRows:close()
		element.LeaderboardHeader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

