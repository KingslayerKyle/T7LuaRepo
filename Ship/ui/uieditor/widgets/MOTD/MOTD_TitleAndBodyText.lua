-- f758c61b5e2beaecabb4ff79de887b03
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 431 )
	self:setTopBottom( true, false, 0, 417 )
	
	local TitleLbl0 = LUI.UITightText.new()
	TitleLbl0:setLeftRight( true, false, 0, 718.5 )
	TitleLbl0:setTopBottom( true, false, 0, 43 )
	TitleLbl0:setTTF( "fonts/escom.ttf" )
	TitleLbl0:subscribeToGlobalModel( controller, "MtxCommsMOTD", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			TitleLbl0:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( TitleLbl0 )
	self.TitleLbl0 = TitleLbl0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 0, 42.29 )
	spacer:setTopBottom( true, false, 43, 45 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local txtDescription = LUI.UIText.new()
	txtDescription:setLeftRight( true, false, 2, 431 )
	txtDescription:setTopBottom( true, false, 47, 69 )
	txtDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtDescription:setLineSpacing( -1 )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtDescription:subscribeToGlobalModel( controller, "MtxCommsMOTD", "content_long", function ( model )
		local contentLong = Engine.GetModelValue( model )
		if contentLong then
			txtDescription:setText( Engine.Localize( contentLong ) )
		end
	end )
	self:addElement( txtDescription )
	self.txtDescription = txtDescription
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleLbl0:close()
		element.txtDescription:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
