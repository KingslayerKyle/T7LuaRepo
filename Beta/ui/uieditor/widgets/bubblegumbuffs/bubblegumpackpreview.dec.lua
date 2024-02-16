require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuffBig" )

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
	self:setLeftRight( true, false, 0, 288 )
	self:setTopBottom( true, false, 0, 448 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BubbleGumBuffs = LUI.UIList.new( menu, controller, 32, 0, nil, false, false, 0, 0, false, true )
	BubbleGumBuffs:makeFocusable()
	BubbleGumBuffs:setLeftRight( true, false, 0, 288 )
	BubbleGumBuffs:setTopBottom( true, false, 0, 448 )
	BubbleGumBuffs:setDataSource( "BubbleGumBuffs" )
	BubbleGumBuffs:setWidgetType( CoD.BubbleGumBuffBig )
	BubbleGumBuffs:setHorizontalCount( 2 )
	BubbleGumBuffs:setVerticalCount( 3 )
	BubbleGumBuffs:setSpacing( 32 )
	BubbleGumBuffs:linkToElementModel( self, nil, true, function ( model )
		local element = BubbleGumBuffs
		UpdateDataSource( self, element, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BubbleGumBuffs:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

