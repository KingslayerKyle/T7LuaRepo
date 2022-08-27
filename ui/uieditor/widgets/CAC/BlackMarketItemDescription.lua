-- 3716d835266dea227149394b44fbbc27
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.BlackMarketItemDescription = InheritFrom( LUI.UIElement )
CoD.BlackMarketItemDescription.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackMarketItemDescription )
	self.id = "BlackMarketItemDescription"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 384 )
	self:setTopBottom( true, false, 0, 22 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( true, true, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( true, true, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0.25 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( true, false, 5.5, 384 )
	weaponDescTextBox:setTopBottom( true, false, 0, 22 )
	weaponDescTextBox:setRGB( 0.74, 0.74, 0.74 )
	weaponDescTextBox:setText( Engine.Localize( "" ) )
	weaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( weaponDescTextBox, "setText", function ( element, controller )
		ScaleWidgetToLabelWrapped( self, element, 1, 1 )
	end )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CACvarientTitlePanel0:completeAnimation()
				self.CACvarientTitlePanel0:setAlpha( 0.25 )
				self.clipFinished( CACvarientTitlePanel0, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 1 )
				self.clipFinished( weaponDescTextBox, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CACvarientTitlePanel0:completeAnimation()
				self.CACvarientTitlePanel0:setAlpha( 0 )
				self.clipFinished( CACvarientTitlePanel0, {} )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CACvarientTitlePanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

