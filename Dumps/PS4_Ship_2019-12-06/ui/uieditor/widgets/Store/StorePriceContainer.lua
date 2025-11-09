require( "ui.uieditor.widgets.Store.StorePriceLabel" )

CoD.StorePriceContainer = InheritFrom( LUI.UIElement )
CoD.StorePriceContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StorePriceContainer )
	self.id = "StorePriceContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local StorePriceLabel = CoD.StorePriceLabel.new( menu, controller )
	StorePriceLabel:setLeftRight( false, true, -200, 0 )
	StorePriceLabel:setTopBottom( false, false, -10, 10 )
	StorePriceLabel.Panel:setAlpha( 0.85 )
	StorePriceLabel.Glow:setAlpha( 0.25 )
	StorePriceLabel.itemName:setText( Engine.Localize( "WWWWWWWWWWWWWW" ) )
	self:addElement( StorePriceLabel )
	self.StorePriceLabel = StorePriceLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				StorePriceLabel:completeAnimation()
				self.StorePriceLabel:setAlpha( 1 )
				self.clipFinished( StorePriceLabel, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				StorePriceLabel:completeAnimation()
				self.StorePriceLabel:setAlpha( 0 )
				self.clipFinished( StorePriceLabel, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StorePriceLabel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

