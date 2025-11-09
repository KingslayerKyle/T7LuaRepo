require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_CallingCardContracts_MasterCardWidget" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_CallingCardContracts_CardWidget" )
require( "ui.uieditor.widgets.SpecialContracts.SpecialContracts_CallingCardContracts_Profiler" )

CoD.SpecialContracts_CallingCardContracts_Stickerbook = InheritFrom( LUI.UIElement )
CoD.SpecialContracts_CallingCardContracts_Stickerbook.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialContracts_CallingCardContracts_Stickerbook )
	self.id = "SpecialContracts_CallingCardContracts_Stickerbook"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MasterCardWidget = CoD.SpecialContracts_CallingCardContracts_MasterCardWidget.new( menu, controller )
	MasterCardWidget:setLeftRight( true, false, 7, 766 )
	MasterCardWidget:setTopBottom( false, true, -112, -14 )
	MasterCardWidget:subscribeToGlobalModel( controller, "SpecialContractMasterCard", nil, function ( model )
		MasterCardWidget:setModel( model, controller )
	end )
	MasterCardWidget:subscribeToGlobalModel( controller, "SpecialContractMasterCard", "backgroundId", function ( model )
		local backgroundId = Engine.GetModelValue( model )
		if backgroundId then
			MasterCardWidget.SpecialContractName:setText( Engine.Localize( GetBackgroundNameByID( backgroundId ) ) )
		end
	end )
	self:addElement( MasterCardWidget )
	self.MasterCardWidget = MasterCardWidget
	
	local CallingCardGrid = LUI.UIList.new( menu, controller, 13, 0, nil, true, false, 0, 0, false, false )
	CallingCardGrid:makeFocusable()
	CallingCardGrid:setLeftRight( true, false, 13, 759 )
	CallingCardGrid:setTopBottom( true, false, 10, 385 )
	CallingCardGrid:setWidgetType( CoD.SpecialContracts_CallingCardContracts_CardWidget )
	CallingCardGrid:setHorizontalCount( 3 )
	CallingCardGrid:setVerticalCount( 4 )
	CallingCardGrid:setSpacing( 13 )
	CallingCardGrid:setDataSource( "SpecialContractsList" )
	CallingCardGrid:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	CallingCardGrid:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( CallingCardGrid, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if IsSpecialContractAvailable( self, element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if IsSpecialContractAvailable( self, element, controller ) then
			return true
		else
			return false
		end
	end, true )
	self:addElement( CallingCardGrid )
	self.CallingCardGrid = CallingCardGrid
	
	local ContractsProfiler = CoD.SpecialContracts_CallingCardContracts_Profiler.new( menu, controller )
	ContractsProfiler:setLeftRight( false, true, -357, -7 )
	ContractsProfiler:setTopBottom( true, true, 1, -13 )
	self:addElement( ContractsProfiler )
	self.ContractsProfiler = ContractsProfiler
	
	ContractsProfiler:linkToElementModel( CallingCardGrid, nil, false, function ( model )
		ContractsProfiler:setModel( model, controller )
	end )
	CallingCardGrid.id = "CallingCardGrid"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CallingCardGrid:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MasterCardWidget:close()
		element.CallingCardGrid:close()
		element.ContractsProfiler:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

