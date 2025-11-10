require( "ui.uieditor.widgets.Groups.GroupsFrameNoBG" )
require( "ui.uieditor.widgets.Groups.GroupsSlider" )

CoD.GroupSlider = InheritFrom( LUI.UIElement )
CoD.GroupSlider.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupSlider )
	self.id = "GroupSlider"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 385 )
	self:setTopBottom( true, false, 0, 34 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GroupsFrameNoBG0 = CoD.GroupsFrameNoBG.new( menu, controller )
	GroupsFrameNoBG0:setLeftRight( true, false, 0, 385 )
	GroupsFrameNoBG0:setTopBottom( true, false, 0, 34 )
	self:addElement( GroupsFrameNoBG0 )
	self.GroupsFrameNoBG0 = GroupsFrameNoBG0
	
	local Slider = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Slider:makeFocusable()
	Slider:setLeftRight( true, false, 108, 276 )
	Slider:setTopBottom( true, false, 2, 32 )
	Slider:setDataSource( "GroupPrivacyModes" )
	Slider:setWidgetType( CoD.GroupsSlider )
	self:addElement( Slider )
	self.Slider = Slider
	
	Slider.id = "Slider"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Slider:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsFrameNoBG0:close()
		element.Slider:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

