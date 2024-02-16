-- c43b261e35ec125256148a7272d7cdbf
-- This hash is used for caching, delete to decompile the file again

CoD.verticalCounterNoNumbers = InheritFrom( LUI.UIElement )
CoD.verticalCounterNoNumbers.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.verticalCounterNoNumbers )
	self.id = "verticalCounterNoNumbers"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( false, false, -12, 4 )
	upArrow:setTopBottom( false, false, -4, 4 )
	upArrow:setRGB( 1, 0.41, 0 )
	upArrow:setZRot( 180 )
	upArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( false, false, 10, 26 )
	downArrow:setTopBottom( false, false, -4, 4 )
	downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	downArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				upArrow:completeAnimation()
				self.upArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.upArrow:setAlpha( 1 )
				self.upArrow:setZRot( 180 )
				self.clipFinished( upArrow, {} )

				downArrow:completeAnimation()
				self.downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.downArrow:setAlpha( 1 )
				self.downArrow:setZRot( 0 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtTopAndBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				upArrow:completeAnimation()
				self.upArrow:setRGB( 0.2, 0.29, 0.33 )
				self.upArrow:setAlpha( 0 )
				self.upArrow:setZRot( 180 )
				self.clipFinished( upArrow, {} )

				downArrow:completeAnimation()
				self.downArrow:setRGB( 0.2, 0.29, 0.33 )
				self.downArrow:setAlpha( 0 )
				self.downArrow:setZRot( 0 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtTop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				upArrow:completeAnimation()
				self.upArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.upArrow:setAlpha( 1 )
				self.upArrow:setZRot( 180 )
				self.clipFinished( upArrow, {} )

				downArrow:completeAnimation()
				self.downArrow:setRGB( 0.2, 0.29, 0.33 )
				self.downArrow:setAlpha( 1 )
				self.downArrow:setZRot( 0 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				upArrow:completeAnimation()
				self.upArrow:setRGB( 0.2, 0.29, 0.33 )
				self.upArrow:setAlpha( 1 )
				self.upArrow:setZRot( 180 )
				self.clipFinished( upArrow, {} )

				downArrow:completeAnimation()
				self.downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.downArrow:setAlpha( 1 )
				self.downArrow:setZRot( 0 )
				self.clipFinished( downArrow, {} )
			end
		},
		NoItems = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				upArrow:completeAnimation()
				self.upArrow:setAlpha( 0 )
				self.upArrow:setZRot( 180 )
				self.clipFinished( upArrow, {} )

				downArrow:completeAnimation()
				self.downArrow:setAlpha( 0 )
				self.downArrow:setZRot( 0 )
				self.clipFinished( downArrow, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "AtTopAndBottom",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtTopAndBottom" )
			end
		},
		{
			stateName = "AtTop",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtTop" )
			end
		},
		{
			stateName = "AtBottom",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtBottom" )
			end
		},
		{
			stateName = "NoItems",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
