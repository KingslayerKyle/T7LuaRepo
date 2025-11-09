require( "ui.uieditor.widgets.PaintShop.PaintjobSlotsBack" )

CoD.PaintshopChooseIconName = InheritFrom( LUI.UIElement )
CoD.PaintshopChooseIconName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintshopChooseIconName )
	self.id = "PaintshopChooseIconName"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local PaintjobSlotsBack0 = CoD.PaintjobSlotsBack.new( menu, controller )
	PaintjobSlotsBack0:setLeftRight( true, false, 0, 240 )
	PaintjobSlotsBack0:setTopBottom( true, false, 0, 36 )
	self:addElement( PaintjobSlotsBack0 )
	self.PaintjobSlotsBack0 = PaintjobSlotsBack0
	
	local decalDesc = LUI.UIText.new()
	decalDesc:setLeftRight( true, false, 5, 240 )
	decalDesc:setTopBottom( true, false, 0, 36 )
	decalDesc:setRGB( 0, 0, 0 )
	decalDesc:setTTF( "fonts/default.ttf" )
	decalDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	decalDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	decalDesc:subscribeToGlobalModel( controller, "EmblemProperties", "selectedDecalID", function ( model )
		local selectedDecalID = Engine.GetModelValue( model )
		if selectedDecalID then
			decalDesc:setText( Engine.Localize( GetEmblemDecalDesc( selectedDecalID ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( decalDesc, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( decalDesc )
	self.decalDesc = decalDesc
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PaintjobSlotsBack0:close()
		element.decalDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

