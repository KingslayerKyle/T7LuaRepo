require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel_Right" )

CoD.cac_ListButtonLabelCount = InheritFrom( LUI.UIElement )
CoD.cac_ListButtonLabelCount.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ListButtonLabelCount )
	self.id = "cac_ListButtonLabelCount"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 45 )
	self:setTopBottom( 0, 0, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( 1, 1, 0, 17 )
	Arrow:setTopBottom( 0.5, 0.5, -8.5, 8.5 )
	Arrow:setAlpha( 0.6 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local ButtonLabelCount = CoD.cac_ListButtonLabel_Right.new( menu, controller )
	ButtonLabelCount:setLeftRight( 1, 1, -156, 0 )
	ButtonLabelCount:setTopBottom( 0, 0, 0, 30 )
	ButtonLabelCount.itemName:setText( Engine.Localize( "3" ) )
	ButtonLabelCount.itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self:addElement( ButtonLabelCount )
	self.ButtonLabelCount = ButtonLabelCount
	
	self.resetProperties = function ()
		Arrow:completeAnimation()
		ButtonLabelCount:completeAnimation()
		Arrow:setAlpha( 0.6 )
		ButtonLabelCount:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				ButtonLabelCount:completeAnimation()
				self.ButtonLabelCount:setAlpha( 0 )
				self.clipFinished( ButtonLabelCount, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonLabelCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

