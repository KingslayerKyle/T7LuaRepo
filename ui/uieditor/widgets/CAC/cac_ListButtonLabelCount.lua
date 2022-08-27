-- 7960ca97436407e96a354c6bde751e1f
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 30 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( false, true, -1, 10.64 )
	Arrow:setTopBottom( false, false, -5.82, 5.82 )
	Arrow:setAlpha( 0.6 )
	Arrow:setScale( 0.8 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_gunsmith_arrow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local ButtonLabelCount = CoD.cac_ListButtonLabel_Right.new( menu, controller )
	ButtonLabelCount:setLeftRight( false, true, -104, 0 )
	ButtonLabelCount:setTopBottom( true, false, 0, 20 )
	ButtonLabelCount.itemName:setText( Engine.Localize( "3" ) )
	ButtonLabelCount.itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self:addElement( ButtonLabelCount )
	self.ButtonLabelCount = ButtonLabelCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 1 )
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

