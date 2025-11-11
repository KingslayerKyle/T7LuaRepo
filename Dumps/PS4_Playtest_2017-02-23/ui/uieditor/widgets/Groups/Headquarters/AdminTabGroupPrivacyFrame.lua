require( "ui.uieditor.widgets.Challenges.Challenges_Title" )
require( "ui.uieditor.widgets.Groups.GroupSlider" )

CoD.AdminTabGroupPrivacyFrame = InheritFrom( LUI.UIElement )
CoD.AdminTabGroupPrivacyFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AdminTabGroupPrivacyFrame )
	self.id = "AdminTabGroupPrivacyFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1086 )
	self:setTopBottom( 0, 0, 0, 625 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GroupTypeSlider = CoD.GroupSlider.new( menu, controller )
	GroupTypeSlider:setLeftRight( 0, 0, 0, 578 )
	GroupTypeSlider:setTopBottom( 0, 0, 58, 108 )
	GroupTypeSlider:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		GroupChangePrivacy( self, element, controller )
		return retVal
	end )
	self:addElement( GroupTypeSlider )
	self.GroupTypeSlider = GroupTypeSlider
	
	local JoinApprovalSlider = CoD.GroupSlider.new( menu, controller )
	JoinApprovalSlider:setLeftRight( 0, 0, 0, 578 )
	JoinApprovalSlider:setTopBottom( 0, 0, 196.5, 247.5 )
	JoinApprovalSlider.Slider:setDataSource( "GroupJoinApprovalTypes" )
	JoinApprovalSlider:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		GroupChangeJoinApprovalType( self, element, controller )
		return retVal
	end )
	self:addElement( JoinApprovalSlider )
	self.JoinApprovalSlider = JoinApprovalSlider
	
	local ChallengesTitle0 = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle0:setLeftRight( 0, 0, 4, 300 )
	ChallengesTitle0:setTopBottom( 0, 0, 0, 50 )
	ChallengesTitle0.weaponNameLabel:setText( Engine.Localize( "GROUPS_GROUP_TYPE" ) )
	self:addElement( ChallengesTitle0 )
	self.ChallengesTitle0 = ChallengesTitle0
	
	local ChallengesTitle00 = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle00:setLeftRight( 0, 0, 4, 300 )
	ChallengesTitle00:setTopBottom( 0, 0, 138, 188 )
	ChallengesTitle00.weaponNameLabel:setText( Engine.Localize( "GROUPS_JOIN_APPROVAL" ) )
	self:addElement( ChallengesTitle00 )
	self.ChallengesTitle00 = ChallengesTitle00
	
	GroupTypeSlider.navigation = {
		down = JoinApprovalSlider
	}
	JoinApprovalSlider.navigation = {
		up = GroupTypeSlider
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	GroupTypeSlider.id = "GroupTypeSlider"
	JoinApprovalSlider.id = "JoinApprovalSlider"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GroupTypeSlider:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupTypeSlider:close()
		self.JoinApprovalSlider:close()
		self.ChallengesTitle0:close()
		self.ChallengesTitle00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

