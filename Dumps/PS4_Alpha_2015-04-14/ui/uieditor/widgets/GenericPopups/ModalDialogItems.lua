require( "ui.uieditor.widgets.Lobby.Common.List1ButtonLarge_Left" )
require( "ui.uieditor.widgets.GenericPopups.ButtonPrompts" )

local PostLoadFunc = function ( self )
	if LUI.DEVHideButtonPrompts then
		self.ButtonPrompts:setAlpha( 0 )
	end
end

CoD.ModalDialogItems = InheritFrom( LUI.UIElement )
CoD.ModalDialogItems.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 14
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ModalDialogItems )
	self.id = "ModalDialogItems"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 484 )
	self:setTopBottom( true, false, 0, 200 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 58.04, 522.96 )
	Title:setTopBottom( true, false, 0, 36 )
	Title:setRGB( 0.87, 0.88, 0.78 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:subscribeToGlobalModel( controller, "ModalDialogData", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( true, false, 58.04, 522.96 )
	Subtitle:setTopBottom( true, false, 50, 70 )
	Subtitle:setRGB( 1, 1, 1 )
	Subtitle:setAlpha( 0.9 )
	Subtitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Subtitle:subscribeToGlobalModel( controller, "ModalDialogData", "description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Subtitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local optionsList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	optionsList:makeFocusable()
	optionsList:setLeftRight( true, false, 58.04, 338.04 )
	optionsList:setTopBottom( true, false, 84, 150 )
	optionsList:setRGB( 1, 1, 1 )
	optionsList:setDataSource( "ModalDialogDataList" )
	optionsList:setWidgetType( CoD.List1ButtonLarge_Left )
	optionsList:setVerticalCount( 2 )
	optionsList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ModalSelectListOption( self, element, controller )
		return retVal
	end )
	self:addElement( optionsList )
	self.optionsList = optionsList
	
	local ButtonPrompts = CoD.ButtonPrompts.new( menu, controller )
	ButtonPrompts:setLeftRight( true, false, 58.04, 379.04 )
	ButtonPrompts:setTopBottom( true, false, 164, 195 )
	ButtonPrompts:setRGB( 1, 1, 1 )
	self:addElement( ButtonPrompts )
	self.ButtonPrompts = ButtonPrompts
	
	optionsList.id = "optionsList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.optionsList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.optionsList:close()
		self.ButtonPrompts:close()
		self.Title:close()
		self.Subtitle:close()
		CoD.ModalDialogItems.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

