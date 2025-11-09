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
	self:setLeftRight( true, false, 0, 18 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local ButtonLabelCount = CoD.cac_ListButtonLabel.new( menu, controller )
	ButtonLabelCount:setLeftRight( true, false, 0, 18 )
	ButtonLabelCount:setTopBottom( true, false, 0, 20 )
	ButtonLabelCount:setRGB( 1, 1, 1 )
	ButtonLabelCount.itemName:setText( Engine.Localize( "3" ) )
	self:addElement( ButtonLabelCount )
	self.ButtonLabelCount = ButtonLabelCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ButtonLabelCount:completeAnimation()
				self.ButtonLabelCount:setAlpha( 0 )
				self.clipFinished( ButtonLabelCount, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ButtonLabelCount:completeAnimation()
				self.ButtonLabelCount:setAlpha( 1 )
				self.clipFinished( ButtonLabelCount, {} )
			end
		}
	}
	self.close = function ( self )
		self.ButtonLabelCount:close()
		CoD.cac_ListButtonLabelCount.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

