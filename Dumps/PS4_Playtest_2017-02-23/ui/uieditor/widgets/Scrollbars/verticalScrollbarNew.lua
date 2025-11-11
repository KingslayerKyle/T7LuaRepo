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
	self:setLeftRight( 0, 0, 0, 15 )
	self:setTopBottom( 0, 0, 0, 750 )
	
	local topArrow = LUI.UIImage.new()
	topArrow:setLeftRight( 0, 1, 0, 0 )
	topArrow:setTopBottom( 0, 0, 0, 15 )
	topArrow:setImage( RegisterImage( "uie_ui_arrow_up" ) )
	self:addElement( topArrow )
	self.topArrow = topArrow
	
	local bottomArrow = LUI.UIImage.new()
	bottomArrow:setLeftRight( 0, 1, 0, 0 )
	bottomArrow:setTopBottom( 1, 1, -15, 0 )
	bottomArrow:setAlpha( 0 )
	bottomArrow:setImage( RegisterImage( "uie_ui_arrow_down" ) )
	self:addElement( bottomArrow )
	self.bottomArrow = bottomArrow
	
	local sliderBorder = CoD.Border.new( menu, controller )
	sliderBorder:setLeftRight( 0, 1, 0, 0 )
	sliderBorder:setTopBottom( 0, 1, 15, -15 )
	sliderBorder:setRGB( 0.49, 0.59, 0.7 )
	sliderBorder:setAlpha( 0.4 )
	self:addElement( sliderBorder )
	self.sliderBorder = sliderBorder
	
	local slider = LUI.UIImage.new()
	slider:setLeftRight( 0, 1, 3, -3 )
	slider:setTopBottom( 0, 1, 18, -18 )
	slider:setRGB( 0.49, 0.59, 0.7 )
	slider:setAlpha( 0.8 )
	self:addElement( slider )
	self.slider = slider
	
	self.resetProperties = function ()
		bottomArrow:completeAnimation()
		topArrow:completeAnimation()
		sliderBorder:completeAnimation()
		slider:completeAnimation()
		bottomArrow:setAlpha( 0 )
		topArrow:setAlpha( 1 )
		sliderBorder:setAlpha( 0.4 )
		slider:setAlpha( 0.8 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 1 )
				self.clipFinished( bottomArrow, {} )
			end
		},
		AtTop = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 0 )
				self.clipFinished( topArrow, {} )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 1 )
				self.clipFinished( bottomArrow, {} )
			end
		},
		AtTopAndBottom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 0 )
				self.clipFinished( topArrow, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.sliderBorder:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

