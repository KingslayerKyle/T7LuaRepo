require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.LobbyPromptTxt = InheritFrom( LUI.UIElement )
CoD.LobbyPromptTxt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyPromptTxt )
	self.id = "LobbyPromptTxt"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 540 )
	self:setTopBottom( 0, 0, 0, 25 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0.25 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local txtDescription = LUI.UIText.new()
	txtDescription:setLeftRight( 0, 1, 0, 0 )
	txtDescription:setTopBottom( 0.5, 0.5, -12.5, 12.5 )
	txtDescription:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtDescription:subscribeToGlobalModel( controller, "LobbyPromptTitle", "lobbyPromptDescription", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( txtDescription, "setText", function ( element, text )
		ScaleWidgetToLabelWrappedLeftAlign( self, element, 0, 0 )
	end )
	self:addElement( txtDescription )
	self.txtDescription = txtDescription
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CACvarientTitlePanel0:close()
		self.txtDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

