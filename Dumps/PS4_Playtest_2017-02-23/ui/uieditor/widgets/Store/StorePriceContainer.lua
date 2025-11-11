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
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local StorePriceLabel = CoD.StorePriceLabel.new( menu, controller )
	StorePriceLabel:setLeftRight( 1, 1, -300, 0 )
	StorePriceLabel:setTopBottom( 0.5, 0.5, -15, 15 )
	StorePriceLabel.Panel:setAlpha( 0.85 )
	StorePriceLabel.Glow:setAlpha( 0.25 )
	StorePriceLabel.itemName:setText( Engine.Localize( "WWWWWWWWWWWWWW" ) )
	self:addElement( StorePriceLabel )
	self.StorePriceLabel = StorePriceLabel
	
	self.resetProperties = function ()
		StorePriceLabel:completeAnimation()
		StorePriceLabel:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				StorePriceLabel:completeAnimation()
				self.StorePriceLabel:setAlpha( 0 )
				self.clipFinished( StorePriceLabel, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StorePriceLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

