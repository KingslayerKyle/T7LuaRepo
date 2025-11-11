require( "ui.uieditor.widgets.Border" )

local SetupPC = function ( self, controller )
	self:setHandleMouse( true )
	self:registerEventHandler( "button_action", function ( element, event )
		
	end )
	self:registerEventHandler( "mousedrag", function ( self, event )
		local grid = self:getParent()
		if grid then
			local pos = event.y - self.slider.barHeight / 2
			local l, t, r, b = self:getRect()
			local percentage = LUI.clamp( (pos - t) / (b - t), 0, 1 )
			grid:updateLayoutBasedOnVScrollbarPercentage( percentage )
		end
	end )
end

local PostLoadFunc = function ( self, controller )
	if CoD.isPC then
		SetupPC( self, controller )
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
	bottomArrow:setImage( RegisterImage( "uie_ui_arrow_down" ) )
	self:addElement( bottomArrow )
	self.bottomArrow = bottomArrow
	
	local sliderBorder = CoD.Border.new( menu, controller )
	sliderBorder:setLeftRight( 0, 1, 0, 0 )
	sliderBorder:setTopBottom( 0, 1, 15, -15 )
	sliderBorder:setRGB( 0.79, 0.78, 0.78 )
	self:addElement( sliderBorder )
	self.sliderBorder = sliderBorder
	
	local slider = LUI.UIImage.new()
	slider:setLeftRight( 0, 1, 3, -3 )
	slider:setTopBottom( 0, 1, 18, -18 )
	self:addElement( slider )
	self.slider = slider
	
	self.resetProperties = function ()
		topArrow:completeAnimation()
		bottomArrow:completeAnimation()
		sliderBorder:completeAnimation()
		slider:completeAnimation()
		topArrow:setAlpha( 1 )
		bottomArrow:setAlpha( 1 )
		sliderBorder:setAlpha( 1 )
		slider:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		AtTop = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 0 )
				self.clipFinished( topArrow, {} )
			end
		},
		AtTopAndBottom = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 0 )
				self.clipFinished( bottomArrow, {} )
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

