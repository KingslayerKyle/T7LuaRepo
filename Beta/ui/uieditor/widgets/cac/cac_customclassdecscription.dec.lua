require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.cac_CustomClassDecscription = InheritFrom( LUI.UIElement )
CoD.cac_CustomClassDecscription.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_CustomClassDecscription )
	self.id = "cac_CustomClassDecscription"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 22 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( true, true, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( true, true, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0.25 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( true, false, 3, 253 )
	weaponDescTextBox:setTopBottom( true, false, 0, 22 )
	weaponDescTextBox:setRGB( 0.74, 0.74, 0.74 )
	weaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponDescTextBox:linkToElementModel( self, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( weaponDescTextBox, "setText", function ( element, text )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CACvarientTitlePanel0:close()
		self.weaponDescTextBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

