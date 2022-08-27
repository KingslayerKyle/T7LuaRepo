-- 24bd716b87e96b13a44470b42cebbd8c
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local variantAttachments = CoD.GunsmithVariantAttachments.new( menu, controller )
	variantAttachments:setLeftRight( false, false, -566.47, 240.87 )
	variantAttachments:setTopBottom( false, true, -181.87, -81.87 )
	variantAttachments:linkToElementModel( self, nil, false, function ( model )
		variantAttachments:setModel( model, controller )
	end )
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
	self:addElement( variantAttachments )
	self.variantAttachments = variantAttachments
	
	variantAttachments.id = "variantAttachments"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.variantAttachments:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.variantAttachments:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

