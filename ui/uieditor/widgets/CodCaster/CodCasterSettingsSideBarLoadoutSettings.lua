-- 01cd7e235f8315cad01c558b9c86da04
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.codcaster_options_slider_small" )

CoD.CodCasterSettingsSideBarLoadoutSettings = InheritFrom( LUI.UIElement )
CoD.CodCasterSettingsSideBarLoadoutSettings.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterSettingsSideBarLoadoutSettings )
	self.id = "CodCasterSettingsSideBarLoadoutSettings"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 450 )
	self:setTopBottom( true, false, 0, 640 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Hint = LUI.UIText.new()
	Hint:setLeftRight( true, false, 23, 435 )
	Hint:setTopBottom( true, false, 267, 289 )
	Hint:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Hint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Hint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Hint )
	self.Hint = Hint
	
	local ButtonList = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 0, 450 )
	ButtonList:setTopBottom( true, false, 1, 245 )
	ButtonList:setDataSource( "CodCasterLoadoutSettingsButtonList" )
	ButtonList:setWidgetType( CoD.codcaster_options_slider_small )
	ButtonList:setVerticalCount( 7 )
	ButtonList:setSpacing( 1 )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	Hint:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			Hint:setText( Engine.Localize( hintText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonList:close()
		element.Hint:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

