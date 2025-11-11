require( "ui.uieditor.widgets.Footer.fe_FooterButtonPromptWithContainerMain" )

local PostLoadFunc = function ( self, controller, menu )
	local signedInGamertagModel = Engine.CreateModel( Engine.GetGlobalModel(), "durango.signedInGamertag", true )
	self:subscribeToModel( signedInGamertagModel, function ( model )
		if model ~= nil then
			local gamertag = Engine.GetModelValue( model )
			if gamertag ~= nil and string.len( gamertag ) > 0 then
				self.Username:setText( Engine.Localize( "MENU_SIGNED_IN_USER", gamertag ) )
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
	self:setLeftRight( 0, 0, 0, 1305 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 1, 1, -4, 0 )
	Image0:setTopBottom( 0, 0, -54, 138 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local feFooterButtonPromptWithContainer0 = CoD.fe_FooterButtonPromptWithContainerMain.new( menu, controller )
	feFooterButtonPromptWithContainer0:setLeftRight( 1, 1, -141, -5 )
	feFooterButtonPromptWithContainer0:setTopBottom( 1, 1, -74, 18 )
	feFooterButtonPromptWithContainer0.label:setText( Engine.Localize( "MENU_SWITCH_USER" ) )
	feFooterButtonPromptWithContainer0:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			feFooterButtonPromptWithContainer0.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	feFooterButtonPromptWithContainer0:linkToElementModel( self, "" .. Enum.LUIButton.LUI_KEY_BACK, false, function ( model )
		feFooterButtonPromptWithContainer0:setModel( model, controller )
	end )
	self:addElement( feFooterButtonPromptWithContainer0 )
	self.feFooterButtonPromptWithContainer0 = feFooterButtonPromptWithContainer0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 0, 1116, 1164 )
	Image00:setTopBottom( 0, 0, -54, 138 )
	Image00:setAlpha( 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Username = LUI.UITightText.new()
	Username:setLeftRight( 1, 1, -699, -189 )
	Username:setTopBottom( 1, 1, -40, -13 )
	Username:setText( GetFirstSignedInController( "Signed in: FEXTWOLF" ) )
	Username:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Username )
	self.Username = Username
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.feFooterButtonPromptWithContainer0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

