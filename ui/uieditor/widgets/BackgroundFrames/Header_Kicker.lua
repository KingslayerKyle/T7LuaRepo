-- 1e00bbe4bed007d9636901ddd55d68d2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.Kicker_Background" )

CoD.Header_Kicker = InheritFrom( LUI.UIElement )
CoD.Header_Kicker.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Header_Kicker )
	self.id = "Header_Kicker"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 16 )
	self.anyChildUsesUpdateState = true
	
	local KickerBackground = CoD.Kicker_Background.new( menu, controller )
	KickerBackground:setLeftRight( true, true, 0, 0 )
	KickerBackground:setTopBottom( true, true, 0, 0 )
	KickerBackground:setAlpha( 0.75 )
	self:addElement( KickerBackground )
	self.KickerBackground = KickerBackground
	
	local Kickertxt = LUI.UITightText.new()
	Kickertxt:setLeftRight( true, false, 3.5, 120 )
	Kickertxt:setTopBottom( true, false, 1.99, 17.99 )
	Kickertxt:setText( Engine.Localize( "Public Match" ) )
	Kickertxt:setTTF( "fonts/FoundryGridnik-Medium.ttf" )

	LUI.OverrideFunction_CallOriginalFirst( Kickertxt, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( Kickertxt )
	self.Kickertxt = Kickertxt
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.KickerBackground:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

