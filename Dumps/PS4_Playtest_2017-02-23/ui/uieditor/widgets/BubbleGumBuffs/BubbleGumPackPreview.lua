require( "ui.uieditor.widgets.BubbleGumBuffs.EquippedBubbleGumBuffButton" )

local SetupForPC = function ( self, controller )
	if CoD.useMouse then
		self.BubbleGumBuffs.m_mouseDisabled = true
	end
end

local PostLoadFunc = function ( self, controller )
	SetupForPC( self, controller )
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
	self:setLeftRight( 0, 0, 0, 852 )
	self:setTopBottom( 0, 0, 0, 679 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BubbleGumBuffs = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	BubbleGumBuffs:makeFocusable()
	BubbleGumBuffs:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller ) and AlwaysFalse()
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return IsCACItemNew( element, controller ) and AlwaysFalse()
			end
		}
	} )
	BubbleGumBuffs:linkToElementModel( BubbleGumBuffs, "itemIndex", true, function ( model )
		menu:updateElementState( BubbleGumBuffs, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	BubbleGumBuffs:setLeftRight( 0, 0, 1, 851 )
	BubbleGumBuffs:setTopBottom( 0, 0, 0, 162 )
	BubbleGumBuffs:setWidgetType( CoD.EquippedBubbleGumBuffButton )
	BubbleGumBuffs:setHorizontalCount( 5 )
	BubbleGumBuffs:setSpacing( 10 )
	BubbleGumBuffs:setDataSource( "BubbleGumBuffs" )
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

