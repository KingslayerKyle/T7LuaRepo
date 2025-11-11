require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.BM_Description = InheritFrom( LUI.UIElement )
CoD.BM_Description.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Description )
	self.id = "BM_Description"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 768 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( 0, 0, 4, 768 )
	weaponDescTextBox:setTopBottom( 0, 0, 3, 31 )
	weaponDescTextBox:setRGB( 0.78, 0.78, 0.78 )
	weaponDescTextBox:setText( Engine.Localize( "MPUI_BM_STORE_HELP" ) )
	weaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDescTextBox:setLetterSpacing( 0.5 )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( weaponDescTextBox, "setText", function ( element, text )
		ScaleWidgetToLabelWrapped( self, element, 1, 1 )
	end )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	self.resetProperties = function ()
		CACvarientTitlePanel0:completeAnimation()
		weaponDescTextBox:completeAnimation()
		CACvarientTitlePanel0:setAlpha( 0 )
		weaponDescTextBox:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CACvarientTitlePanel0:completeAnimation()
				self.CACvarientTitlePanel0:setAlpha( 0.1 )
				self.clipFinished( CACvarientTitlePanel0, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				weaponDescTextBox:completeAnimation()
				self.weaponDescTextBox:setAlpha( 0 )
				self.clipFinished( weaponDescTextBox, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CACvarientTitlePanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

