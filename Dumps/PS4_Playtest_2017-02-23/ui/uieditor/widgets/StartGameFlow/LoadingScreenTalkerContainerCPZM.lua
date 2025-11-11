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
	self:setLeftRight( 0, 0, 0, 285 )
	self:setTopBottom( 0, 0, 0, 25 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( 0, 1, 0, 0 )
	Panel:setTopBottom( 0, 1, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local VOIPImageByXUID = LUI.UIImage.new()
	VOIPImageByXUID:setLeftRight( 1, 1, -24, 0 )
	VOIPImageByXUID:setTopBottom( 0, 0, 2, 26 )
	self:addElement( VOIPImageByXUID )
	self.VOIPImageByXUID = VOIPImageByXUID
	
	local WpnName = LUI.UIText.new()
	WpnName:setLeftRight( 0, 0, 0, 266 )
	WpnName:setTopBottom( 0, 0, 0.5, 25.5 )
	WpnName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	WpnName:setLetterSpacing( 0.5 )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WpnName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	WpnName:linkToElementModel( self, "playerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WpnName:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( WpnName, "setText", function ( element, text )
		ScaleWidgetToLabelLeftJustify( self, element, 20 )
	end )
	self:addElement( WpnName )
	self.WpnName = WpnName
	
	self.VOIPImageByXUID:linkToElementModel( self, "playerxuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			VOIPImageByXUID:setupVoipImageByXUID( modelValue )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel:close()
		self.VOIPImageByXUID:close()
		self.WpnName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

