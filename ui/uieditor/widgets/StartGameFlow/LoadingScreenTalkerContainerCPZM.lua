-- 0bfcf5aba8066b7881c6ca1acf8fa10f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.LoadingScreenTalkerContainerCPZM = InheritFrom( LUI.UIElement )
CoD.LoadingScreenTalkerContainerCPZM.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenTalkerContainerCPZM )
	self.id = "LoadingScreenTalkerContainerCPZM"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 17 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, true, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local VOIPImageByXUID = LUI.UIImage.new()
	VOIPImageByXUID:setLeftRight( false, true, -16, 0 )
	VOIPImageByXUID:setTopBottom( true, false, 1, 17 )
	self:addElement( VOIPImageByXUID )
	self.VOIPImageByXUID = VOIPImageByXUID
	
	local WpnName = LUI.UIText.new()
	WpnName:setLeftRight( true, false, 0, 177.25 )
	WpnName:setTopBottom( true, false, 0, 17 )
	WpnName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WpnName:setLetterSpacing( 0.5 )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	WpnName:linkToElementModel( self, "playerName", true, function ( model )
		local playerName = Engine.GetModelValue( model )
		if playerName then
			WpnName:setText( Engine.Localize( playerName ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( WpnName, "setText", function ( element, controller )
		ScaleWidgetToLabelLeftJustify( self, element, 20 )
	end )
	self:addElement( WpnName )
	self.WpnName = WpnName
	
	self.VOIPImageByXUID:linkToElementModel( self, "playerxuid", true, function ( model )
		local playerxuid = Engine.GetModelValue( model )
		if playerxuid then
			VOIPImageByXUID:setupVoipImageByXUID( playerxuid )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.VOIPImageByXUID:close()
		element.WpnName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

