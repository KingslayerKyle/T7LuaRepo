require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.playercard.CallingCard" )

CoD.systemOverlay_reportPlayer = InheritFrom( LUI.UIElement )
CoD.systemOverlay_reportPlayer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_reportPlayer )
	self.id = "systemOverlay_reportPlayer"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 350 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 411.89, 1216 )
	Title:setTopBottom( true, false, 20.5, 54.5 )
	Title:setText( Engine.Localize( "MENU_REPORT_USER_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 411.89, 1216 )
	Description:setTopBottom( true, false, 60.5, 80.5 )
	Description:setText( Engine.Localize( "MENU_REPORT_PLAYER_DESC" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 411.89, 741.89 )
	ButtonList:setTopBottom( false, true, -231.5, -63.5 )
	ButtonList:setWidgetType( CoD.CACGenericButton )
	ButtonList:setVerticalCount( 5 )
	ButtonList:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			ButtonList:setDataSource( listDatasource )
		end
	end )
	ButtonList:linkToElementModel( ButtonList, "disabled", true, function ( model )
		local f3_local0 = ButtonList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 23, 343 )
	emblem:setTopBottom( true, false, 20.5, 216.5 )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			emblem:setupPlayerEmblemByXUID( xuid )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local CallingCard = CoD.CallingCard.new( menu, controller )
	CallingCard:setLeftRight( true, false, 23, 343 )
	CallingCard:setTopBottom( true, false, 226, 304.69 )
	CallingCard.CallingCardsFrameWidget.CardIconFrame:setScale( 0.66 )
	CallingCard:linkToElementModel( self, nil, false, function ( model )
		CallingCard:setModel( model, controller )
	end )
	CallingCard:linkToElementModel( self, nil, false, function ( model )
		CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	CallingCard:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			CallingCard.SocialCallingCardTitle.Label0:setText( Engine.Localize( gamertag ) )
		end
	end )
	CallingCard:linkToElementModel( self, "clantag", true, function ( model )
		local clantag = Engine.GetModelValue( model )
		if clantag then
			CallingCard.SocialCallingCardSubTitle.Label0:setText( Engine.Localize( StringAsClanTag( clantag ) ) )
		end
	end )
	self:addElement( CallingCard )
	self.CallingCard = CallingCard
	
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.CallingCard:close()
		element.emblem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

