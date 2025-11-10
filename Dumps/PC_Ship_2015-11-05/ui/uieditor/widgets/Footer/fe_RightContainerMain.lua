require( "ui.uieditor.widgets.Footer.fe_FooterButtonPromptWithContainerMain" )

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "durango.signedInGamertag", true ), function ( model )
		if model ~= nil then
			local f2_local0 = Engine.GetModelValue( model )
			if f2_local0 ~= nil and string.len( f2_local0 ) > 0 then
				self.Username:setText( Engine.Localize( "MENU_SIGNED_IN_USER", f2_local0 ) )
				return 
			end
		end
		self.Username:setText( "" )
	end )
end

CoD.fe_RightContainerMain = InheritFrom( LUI.UIElement )
CoD.fe_RightContainerMain.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
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
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_RightContainerMain )
	self.id = "fe_RightContainerMain"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 870 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -3, 0 )
	Image0:setTopBottom( true, false, -36, 92 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local feFooterButtonPromptWithContainer0 = CoD.fe_FooterButtonPromptWithContainerMain.new( menu, controller )
	feFooterButtonPromptWithContainer0:setLeftRight( false, true, -94, -3 )
	feFooterButtonPromptWithContainer0:setTopBottom( false, true, -49, 12 )
	feFooterButtonPromptWithContainer0.label:setText( Engine.Localize( "MENU_SWITCH_USER" ) )
	feFooterButtonPromptWithContainer0:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local backButtonImage = Engine.GetModelValue( model )
		if backButtonImage then
			feFooterButtonPromptWithContainer0.buttonPromptImage:setImage( RegisterImage( backButtonImage ) )
		end
	end )
	feFooterButtonPromptWithContainer0:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_BACK, false, function ( model )
		feFooterButtonPromptWithContainer0:setModel( model, controller )
	end )
	self:addElement( feFooterButtonPromptWithContainer0 )
	self.feFooterButtonPromptWithContainer0 = feFooterButtonPromptWithContainer0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 744, 776 )
	Image00:setTopBottom( true, false, -36, 92 )
	Image00:setAlpha( 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Username = LUI.UITightText.new()
	Username:setLeftRight( false, true, -466, -126 )
	Username:setTopBottom( false, true, -26.5, -8.5 )
	Username:setText( Engine.Localize( GetFirstSignedInController( "Signed in: FEXTWOLF" ) ) )
	Username:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Username )
	self.Username = Username
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feFooterButtonPromptWithContainer0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

