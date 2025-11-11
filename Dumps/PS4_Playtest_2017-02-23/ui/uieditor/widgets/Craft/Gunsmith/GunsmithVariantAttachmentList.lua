require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantAttachments" )

CoD.GunsmithVariantAttachmentList = InheritFrom( LUI.UIElement )
CoD.GunsmithVariantAttachmentList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithVariantAttachmentList )
	self.id = "GunsmithVariantAttachmentList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local variantAttachments = CoD.GunsmithVariantAttachments.new( menu, controller )
	variantAttachments:mergeStateConditions( {
		{
			stateName = "SpecialWeapon",
			condition = function ( menu, element, event )
				return Gunsmith_IsSpecialWeapon( menu, element, controller )
			end
		},
		{
			stateName = "Handguns",
			condition = function ( menu, element, event )
				return Gunsmith_IsHandguns( menu, element, controller )
			end
		}
	} )
	variantAttachments:setLeftRight( 0.5, 0.5, -850, 361 )
	variantAttachments:setTopBottom( 1, 1, -273, -123 )
	variantAttachments:linkToElementModel( self, nil, false, function ( model )
		variantAttachments:setModel( model, controller )
	end )
	self:addElement( variantAttachments )
	self.variantAttachments = variantAttachments
	
	variantAttachments.id = "variantAttachments"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.variantAttachments:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.variantAttachments:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

