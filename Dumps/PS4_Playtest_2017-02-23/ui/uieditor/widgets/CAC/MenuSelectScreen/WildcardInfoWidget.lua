require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.WildcardInfoWidget = InheritFrom( LUI.UIElement )
CoD.WildcardInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardInfoWidget )
	self.id = "WildcardInfoWidget"
	self.soundSet = "CAC_Wildcard"
	self:setLeftRight( 0, 0, 0, 352 )
	self:setTopBottom( 0, 0, 0, 169 )
	
	local tokenRefundBorder = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	tokenRefundBorder:setLeftRight( 0, 1, 6, -2 )
	tokenRefundBorder:setTopBottom( 0, 0, 135, 185 )
	tokenRefundBorder:setAlpha( 0 )
	self:addElement( tokenRefundBorder )
	self.tokenRefundBorder = tokenRefundBorder
	
	local tokenRefundText = LUI.UIText.new()
	tokenRefundText:setLeftRight( 0, 0, 17, 339 )
	tokenRefundText:setTopBottom( 0, 0, 148, 172 )
	tokenRefundText:setAlpha( 0 )
	tokenRefundText:setText( Engine.Localize( "MENU_PRESTIGE_UNLOCK_TOKEN_REFUND" ) )
	tokenRefundText:setTTF( "fonts/escom.ttf" )
	tokenRefundText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	tokenRefundText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( tokenRefundText )
	self.tokenRefundText = tokenRefundText
	
	local cacButtonBoxLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke:setLeftRight( 0, 1, 6, -2 )
	cacButtonBoxLrgInactiveStroke:setTopBottom( 0, 0, 45, 139 )
	self:addElement( cacButtonBoxLrgInactiveStroke )
	self.cacButtonBoxLrgInactiveStroke = cacButtonBoxLrgInactiveStroke
	
	local descText = LUI.UIText.new()
	descText:setLeftRight( 0, 0, 17, 339 )
	descText:setTopBottom( 0, 0, 58, 82 )
	descText:setTTF( "fonts/escom.ttf" )
	descText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	descText:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			descText:setText( Engine.Localize( GetUnlockDescription( controller, modelValue ) ) )
		end
	end )
	self:addElement( descText )
	self.descText = descText
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 1, 6, 0 )
	TitleGlow1:setTopBottom( 0, 1, 6, -118 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	TitleGlow1:setAlpha( 0.85 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( 0, 0, 16, 199 )
	nameLabel:setTopBottom( 0, 0, 10, 48 )
	nameLabel:setRGB( 0, 0, 0 )
	nameLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	self.resetProperties = function ()
		descText:completeAnimation()
		cacButtonBoxLrgInactiveStroke:completeAnimation()
		tokenRefundText:completeAnimation()
		tokenRefundBorder:completeAnimation()
		descText:setAlpha( 1 )
		cacButtonBoxLrgInactiveStroke:setAlpha( 1 )
		tokenRefundText:setAlpha( 0 )
		tokenRefundBorder:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NameOnly = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				cacButtonBoxLrgInactiveStroke:completeAnimation()
				self.cacButtonBoxLrgInactiveStroke:setAlpha( 0 )
				self.clipFinished( cacButtonBoxLrgInactiveStroke, {} )
				descText:completeAnimation()
				self.descText:setAlpha( 0 )
				self.clipFinished( descText, {} )
			end
		},
		PermanentUnlockRefund = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				tokenRefundBorder:completeAnimation()
				self.tokenRefundBorder:setAlpha( 1 )
				self.clipFinished( tokenRefundBorder, {} )
				tokenRefundText:completeAnimation()
				self.tokenRefundText:setAlpha( 1 )
				self.clipFinished( tokenRefundText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.tokenRefundBorder:close()
		self.cacButtonBoxLrgInactiveStroke:close()
		self.TitleGlow1:close()
		self.descText:close()
		self.nameLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

