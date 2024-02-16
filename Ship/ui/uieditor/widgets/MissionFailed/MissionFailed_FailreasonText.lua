-- 897a6f6f061312a7291a067ed12ad741
-- This hash is used for caching, delete to decompile the file again

CoD.MissionFailed_FailreasonText = InheritFrom( LUI.UIElement )
CoD.MissionFailed_FailreasonText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionFailed_FailreasonText )
	self.id = "MissionFailed_FailreasonText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 268 )
	self:setTopBottom( true, false, 0, 21 )
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, -3, -2 )
	BlackBox:setTopBottom( false, false, -10.5, 10.5 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.7 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local FailReason = LUI.UIText.new()
	FailReason:setLeftRight( false, false, -360.5, 360.5 )
	FailReason:setTopBottom( false, false, -11, 11 )
	FailReason:setAlpha( 0.95 )
	FailReason:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	FailReason:setLetterSpacing( 1 )
	FailReason:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FailReason:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )

	LUI.OverrideFunction_CallOriginalFirst( FailReason, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 0, 0 )
	end )
	self:addElement( FailReason )
	self.FailReason = FailReason
	
	self.FailReason:linkToElementModel( self, "MissionFailReason", true, function ( model )
		local MissionFailReason = Engine.GetModelValue( model )
		if MissionFailReason then
			FailReason:setText( Engine.Localize( MissionFailReason ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FailReason:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
