require( "ui.uieditor.widgets.BubbleGumBuffs.EquippedBubbleGumBuffButton" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if CoD.useMouse then
		f1_arg0.BubbleGumBuffs.m_mouseDisabled = true
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f0_local0( f2_arg0, f2_arg1 )
end

CoD.BubbleGumPackPreview = InheritFrom( LUI.UIElement )
CoD.BubbleGumPackPreview.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumPackPreview )
	self.id = "BubbleGumPackPreview"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 568 )
	self:setTopBottom( true, false, 0, 453 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BubbleGumBuffs = LUI.UIList.new( menu, controller, 7, 0, nil, false, false, 0, 0, false, true )
	BubbleGumBuffs:makeFocusable()
	BubbleGumBuffs:setLeftRight( true, false, 0, 568 )
	BubbleGumBuffs:setTopBottom( true, false, 0, 108 )
	BubbleGumBuffs:setDataSource( "BubbleGumBuffs" )
	BubbleGumBuffs:setWidgetType( CoD.EquippedBubbleGumBuffButton )
	BubbleGumBuffs:setHorizontalCount( 5 )
	BubbleGumBuffs:setSpacing( 7 )
	BubbleGumBuffs:linkToElementModel( self, nil, true, function ( model )
		UpdateDataSource( self, BubbleGumBuffs, controller )
	end )
	self:addElement( BubbleGumBuffs )
	self.BubbleGumBuffs = BubbleGumBuffs
	
	BubbleGumBuffs.id = "BubbleGumBuffs"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.BubbleGumBuffs:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BubbleGumBuffs:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

