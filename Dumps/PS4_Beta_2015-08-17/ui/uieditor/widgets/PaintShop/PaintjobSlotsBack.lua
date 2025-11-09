require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.PaintjobSlotsBack = InheritFrom( LUI.UIElement )
CoD.PaintjobSlotsBack.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PaintjobSlotsBack )
	self.id = "PaintjobSlotsBack"
	self.soundSet = "Paintshop"
	self:setLeftRight( true, false, 0, 188 )
	self:setTopBottom( true, false, 0, 48 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, 0, 0 )
	TitleGlow1:setTopBottom( true, true, 0, 0 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		SlotsFull = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlow1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

