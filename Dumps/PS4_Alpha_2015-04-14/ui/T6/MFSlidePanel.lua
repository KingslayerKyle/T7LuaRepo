if CoD == nil then
	CoD = {}
end
CoD.MFSlidePanel = {}
CoD.MFSlidePanel.OutDuration = 150
CoD.MFSlidePanel.InDuration = 250
local MFSlidePanel_TransitionComplete_OutState = function ( self, event )
	if event.interrupted == true then
		return 
	end
	self:registerEventHandler( "transition_complete_" .. self.replaceContentData.outState, nil )
	self:removeAllChildren()
	self:addElement( self.replaceContentData.newContent )
	if self.replaceContentData.callbackFunc ~= nil then
		self.replaceContentData:callbackFunc()
	end
	self:animateToState( self.replaceContentData.inState, CoD.MFSlidePanel.InDuration, true, true )
	self.replaceContentData = nil
	self.m_inputDisabled = nil
end

local MFSlidePanel_ReplaceContent = function ( self, outState, inState, newContent, callbackFunc )
	if self.replaceContentData ~= nil then
		error( "LUI Error: Already replacing MFSlidePanel content with something else!" )
	end
	self.m_inputDisabled = true
	self.replaceContentData = {}
	self.replaceContentData.outState = outState
	self.replaceContentData.inState = inState
	self.replaceContentData.newContent = newContent
	self.replaceContentData.callbackFunc = callbackFunc
	self:registerEventHandler( "transition_complete_" .. outState, MFSlidePanel_TransitionComplete_OutState )
	self:animateToState( outState, CoD.MFSlidePanel.OutDuration, true, true )
	Engine.PlaySound( "uin_navigation_select_submenu" )
	Engine.PlaySound( "uin_menu_left_right" )
end

local MFSlidePanel_AddDebugBackground = function ( self )
	local background = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 0.25
	} )
	self:addElement( background )
end

CoD.MFSlidePanel.new = function ( defaultAnimationState )
	local slidePanel = LUI.UIElement.new( defaultAnimationState )
	slidePanel.id = "MFSlidePanel"
	slidePanel.replaceContent = MFSlidePanel_ReplaceContent
	slidePanel.addDebugBackground = MFSlidePanel_AddDebugBackground
	return slidePanel
end

