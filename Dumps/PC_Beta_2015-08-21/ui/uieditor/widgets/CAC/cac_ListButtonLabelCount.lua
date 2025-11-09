require( "ui.uieditor.widgets.CAC.cac_ListButtonLabel" )

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
	self:setLeftRight( true, false, 0, 30 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local ButtonLabelCount = CoD.cac_ListButtonLabel.new( menu, controller )
	ButtonLabelCount:setLeftRight( true, false, 0, 18 )
	ButtonLabelCount:setTopBottom( true, false, 0, 20 )
	ButtonLabelCount.itemName:setText( Engine.Localize( "3" ) )
	self:addElement( ButtonLabelCount )
	self.ButtonLabelCount = ButtonLabelCount
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( false, true, -12, -0.36 )
	Arrow:setTopBottom( false, false, -5.82, 5.82 )
	Arrow:setAlpha( 0.6 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ButtonLabelCount:completeAnimation()
				self.ButtonLabelCount:setAlpha( 0 )
				self.clipFinished( ButtonLabelCount, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ButtonLabelCount:completeAnimation()
				self.ButtonLabelCount:setAlpha( 1 )
				self.clipFinished( ButtonLabelCount, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0.6 )
				self.clipFinished( Arrow, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonLabelCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

