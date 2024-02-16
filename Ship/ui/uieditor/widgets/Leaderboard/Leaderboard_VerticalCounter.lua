-- 8643a81aa2d22e13c0da34f721b8e34d
-- This hash is used for caching, delete to decompile the file again

CoD.Leaderboard_VerticalCounter = InheritFrom( LUI.UIElement )
CoD.Leaderboard_VerticalCounter.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_VerticalCounter )
	self.id = "Leaderboard_VerticalCounter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( false, false, -76, -8 )
	currentItem:setTopBottom( false, false, -9, 9 )
	currentItem:setAlpha( 0.65 )
	currentItem:setText( Engine.Localize( "8888888888" ) )
	currentItem:setTTF( "fonts/default.ttf" )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentItem )
	self.currentItem = currentItem
	
	local dividor = LUI.UITightText.new()
	dividor:setLeftRight( false, false, -3, 3 )
	dividor:setTopBottom( false, false, -9, 9 )
	dividor:setAlpha( 0.65 )
	dividor:setText( Engine.Localize( "/" ) )
	dividor:setTTF( "fonts/default.ttf" )
	self:addElement( dividor )
	self.dividor = dividor
	
	local count = LUI.UIText.new()
	count:setLeftRight( false, false, 8, 76 )
	count:setTopBottom( false, false, -9, 9 )
	count:setAlpha( 0.65 )
	count:setText( Engine.Localize( "8888888888" ) )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( count )
	self.count = count
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( false, false, -93, -77 )
	upArrow:setTopBottom( false, false, -4, 4 )
	upArrow:setRGB( 1, 0.41, 0 )
	upArrow:setZRot( 180 )
	upArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( false, false, 77, 93 )
	downArrow:setTopBottom( false, false, -4, 4 )
	downArrow:setRGB( 1, 0.41, 0 )
	downArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )

				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )

				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )

				upArrow:completeAnimation()
				self.upArrow:setRGB( 1, 0.41, 0 )
				self.upArrow:setAlpha( 1 )
				self.clipFinished( upArrow, {} )

				downArrow:completeAnimation()
				self.downArrow:setRGB( 1, 0.41, 0 )
				self.downArrow:setAlpha( 1 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtTopAndBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				currentItem:completeAnimation()
				self.currentItem:setAlpha( 0 )
				self.clipFinished( currentItem, {} )

				dividor:completeAnimation()
				self.dividor:setAlpha( 0 )
				self.clipFinished( dividor, {} )

				count:completeAnimation()
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )

				upArrow:completeAnimation()
				self.upArrow:setAlpha( 0 )
				self.clipFinished( upArrow, {} )

				downArrow:completeAnimation()
				self.downArrow:setAlpha( 0 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtTop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )

				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )

				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )

				upArrow:completeAnimation()
				self.upArrow:setRGB( 1, 0.41, 0 )
				self.upArrow:setAlpha( 1 )
				self.clipFinished( upArrow, {} )

				downArrow:completeAnimation()
				self.downArrow:setRGB( 0.2, 0.29, 0.33 )
				self.downArrow:setAlpha( 1 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )

				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )

				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )

				upArrow:completeAnimation()
				self.upArrow:setRGB( 0.2, 0.29, 0.33 )
				self.upArrow:setAlpha( 1 )
				self.clipFinished( upArrow, {} )

				downArrow:completeAnimation()
				self.downArrow:setRGB( 1, 0.41, 0 )
				self.downArrow:setAlpha( 1 )
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
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
