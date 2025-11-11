require( "ui.uieditor.widgets.Controls.Slider_Small" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OptionHighlight" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self:setHandleMouseButton( false )
		self:setForceMouseEventDispatch( true )
	end
end

CoD.Competitive_SettingsList = InheritFrom( LUI.UIElement )
CoD.Competitive_SettingsList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Competitive_SettingsList )
	self.id = "Competitive_SettingsList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1005 )
	self:setTopBottom( 0, 0, 0, 165 )
	self.anyChildUsesUpdateState = true
	
	local Title = CoD.StartMenu_OptionHighlight.new( menu, controller )
	Title:setLeftRight( 0, 0, 62, 809 )
	Title:setTopBottom( 0, 0, 0, 56 )
	Title:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Title.DescTitle:setText( LocalizeToUpperString( "DRAFT SETTINGS" ) )
	self:addElement( Title )
	self.Title = Title
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( 0, 0, 0, 816 )
	ButtonList:setTopBottom( 0, 0, 56, 154 )
	ButtonList:setWidgetType( CoD.Slider_Small )
	ButtonList:setVerticalCount( 2 )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_START )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		OpenGameSettingsOptionsMenu( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_OPTIONS", nil )
		return true
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	self.resetProperties = function ()
		Title:completeAnimation()
		Title:setLeftRight( 0, 0, 62, 809 )
		Title:setTopBottom( 0, 0, 0, 56 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Title:completeAnimation()
				self.Title:setLeftRight( 0, 0, 60, 573 )
				self.Title:setTopBottom( 0, 0, 0, 60 )
				self.clipFinished( Title, {} )
			end
		},
		NoHeader = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Title:completeAnimation()
				self.Title:setLeftRight( 0, 0, 60, 573 )
				self.Title:setTopBottom( 0, 0, 0.5, 15.5 )
				self.clipFinished( Title, {} )
			end
		}
	}
	ButtonList.id = "ButtonList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Title:close()
		self.ButtonList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

