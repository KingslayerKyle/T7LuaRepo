-- 83c5e6de173cfbb59b795800e520960f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.BackgroundPattern01" )

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
	self.anyChildUsesUpdateState = true
	
	local BackgroundPattern01 = CoD.BackgroundPattern01.new( menu, controller )
	BackgroundPattern01:setLeftRight( true, false, 0, 188 )
	BackgroundPattern01:setTopBottom( true, false, 0, 35 )
	self:addElement( BackgroundPattern01 )
	self.BackgroundPattern01 = BackgroundPattern01
	
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackgroundPattern01:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

