CoD.MOTD_TitleAndBodyText = InheritFrom( LUI.UIElement )
CoD.MOTD_TitleAndBodyText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MOTD_TitleAndBodyText )
	self.id = "MOTD_TitleAndBodyText"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 646 )
	self:setTopBottom( 0, 0, 0, 625 )
	
	local TitleLbl0 = LUI.UITightText.new()
	TitleLbl0:setLeftRight( 0, 0, 0, 1078 )
	TitleLbl0:setTopBottom( 0, 0, 0, 64 )
	TitleLbl0:setTTF( "fonts/escom.ttf" )
	TitleLbl0:subscribeToGlobalModel( controller, "MtxCommsMOTD", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TitleLbl0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TitleLbl0 )
	self.TitleLbl0 = TitleLbl0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( 0, 0, 0, 63 )
	spacer:setTopBottom( 0, 0, 64, 67 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local txtDescription = LUI.UIText.new()
	txtDescription:setLeftRight( 0, 0, 3, 647 )
	txtDescription:setTopBottom( 0, 0, 71, 104 )
	txtDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtDescription:setLineSpacing( -1 )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtDescription:subscribeToGlobalModel( controller, "MtxCommsMOTD", "content_long", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtDescription )
	self.txtDescription = txtDescription
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleLbl0:close()
		self.txtDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

