-- a907b56aac2a1025ef9563e00fe5f1c1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:setHandleMouse( true )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		
	end )
	f1_arg0:registerEventHandler( "mousedrag", function ( element, event )
		local f3_local0 = element:getParent()
		if f3_local0 then
			local f3_local1 = event.y - element.slider.barHeight / 2
			local f3_local2, f3_local3, f3_local4, f3_local5 = element:getRect()
			f3_local0:updateLayoutBasedOnVScrollbarPercentage( LUI.clamp( (f3_local1 - f3_local3) / (f3_local5 - f3_local3), 0, 1 ) )
		end
	end )
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	if CoD.isPC then
		f0_local0( f4_arg0, f4_arg1 )
	end
end

CoD.verticalScrollbar = InheritFrom( LUI.UIElement )
CoD.verticalScrollbar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.verticalScrollbar )
	self.id = "verticalScrollbar"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 10 )
	self:setTopBottom( true, false, 0, 500 )
	
	local topArrow = LUI.UIImage.new()
	topArrow:setLeftRight( true, true, 0, 0 )
	topArrow:setTopBottom( true, false, 0, 10 )
	topArrow:setImage( RegisterImage( "uie_ui_arrow_up" ) )
	self:addElement( topArrow )
	self.topArrow = topArrow
	
	local bottomArrow = LUI.UIImage.new()
	bottomArrow:setLeftRight( true, true, 0, 0 )
	bottomArrow:setTopBottom( false, true, -10, 0 )
	bottomArrow:setImage( RegisterImage( "uie_ui_arrow_down" ) )
	self:addElement( bottomArrow )
	self.bottomArrow = bottomArrow
	
	local sliderBorder = CoD.Border.new( menu, controller )
	sliderBorder:setLeftRight( true, true, 0, 0 )
	sliderBorder:setTopBottom( true, true, 10, -10 )
	sliderBorder:setRGB( 0.79, 0.78, 0.78 )
	self:addElement( sliderBorder )
	self.sliderBorder = sliderBorder
	
	local slider = LUI.UIImage.new()
	slider:setLeftRight( true, true, 2, -2 )
	slider:setTopBottom( true, true, 12, -12 )
	self:addElement( slider )
	self.slider = slider
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 1 )
				self.clipFinished( topArrow, {} )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 1 )
				self.clipFinished( bottomArrow, {} )
				sliderBorder:completeAnimation()
				self.sliderBorder:setAlpha( 1 )
				self.clipFinished( sliderBorder, {} )
				slider:completeAnimation()
				self.slider:setAlpha( 1 )
				self.clipFinished( slider, {} )
			end
		},
		AtTop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 0 )
				self.clipFinished( topArrow, {} )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 1 )
				self.clipFinished( bottomArrow, {} )
				sliderBorder:completeAnimation()
				self.sliderBorder:setAlpha( 1 )
				self.clipFinished( sliderBorder, {} )
				slider:completeAnimation()
				self.slider:setAlpha( 1 )
				self.clipFinished( slider, {} )
			end
		},
		AtTopAndBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 0 )
				self.clipFinished( topArrow, {} )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 0 )
				self.clipFinished( bottomArrow, {} )
				sliderBorder:completeAnimation()
				self.sliderBorder:setAlpha( 0 )
				self.clipFinished( sliderBorder, {} )
				slider:completeAnimation()
				self.slider:setAlpha( 0 )
				self.clipFinished( slider, {} )
			end
		},
		AtBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 1 )
				self.clipFinished( topArrow, {} )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 0 )
				self.clipFinished( bottomArrow, {} )
				sliderBorder:completeAnimation()
				self.sliderBorder:setAlpha( 1 )
				self.clipFinished( sliderBorder, {} )
				slider:completeAnimation()
				self.slider:setAlpha( 1 )
				self.clipFinished( slider, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.sliderBorder:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

