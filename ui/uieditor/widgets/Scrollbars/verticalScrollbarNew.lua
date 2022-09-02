-- 05572d8ebc5e6d7970a9a44ef541e98a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

CoD.verticalScrollbarNew = InheritFrom( LUI.UIElement )
CoD.verticalScrollbarNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.verticalScrollbarNew )
	self.id = "verticalScrollbarNew"
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
	bottomArrow:setAlpha( 0 )
	bottomArrow:setImage( RegisterImage( "uie_ui_arrow_down" ) )
	self:addElement( bottomArrow )
	self.bottomArrow = bottomArrow
	
	local sliderBorder = CoD.Border.new( menu, controller )
	sliderBorder:setLeftRight( true, true, 0, 0 )
	sliderBorder:setTopBottom( true, true, 10, -10 )
	sliderBorder:setRGB( 0.49, 0.59, 0.7 )
	sliderBorder:setAlpha( 0.4 )
	self:addElement( sliderBorder )
	self.sliderBorder = sliderBorder
	
	local slider = LUI.UIImage.new()
	slider:setLeftRight( true, true, 2, -2 )
	slider:setTopBottom( true, true, 12, -12 )
	slider:setRGB( 0.49, 0.59, 0.7 )
	slider:setAlpha( 0.8 )
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
				self.sliderBorder:setAlpha( 0.4 )
				self.clipFinished( sliderBorder, {} )

				slider:completeAnimation()
				self.slider:setAlpha( 0.8 )
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
				self.sliderBorder:setAlpha( 0.4 )
				self.clipFinished( sliderBorder, {} )

				slider:completeAnimation()
				self.slider:setAlpha( 0.8 )
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
				self.sliderBorder:setAlpha( 0.4 )
				self.clipFinished( sliderBorder, {} )

				slider:completeAnimation()
				self.slider:setAlpha( 0.8 )
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

