CoD.scorestreaks_ElementBottom = InheritFrom( LUI.UIElement )
CoD.scorestreaks_ElementBottom.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.scorestreaks_ElementBottom )
	self.id = "scorestreaks_ElementBottom"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 111 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 464, 500 )
	Image1:setTopBottom( false, false, 71.11, 74.61 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 464, 500 )
	Image4:setTopBottom( false, false, -27.89, -24.39 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, 464, 500 )
	Image5:setTopBottom( false, false, -55.61, -52.11 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Image1:completeAnimation()
				self.Image1:setLeftRight( true, false, 464, 500 )
				self.Image1:setTopBottom( false, false, 52.11, 55.61 )
				self.clipFinished( Image1, {} )
				Image4:completeAnimation()
				self.Image4:setLeftRight( true, false, 464, 500 )
				self.Image4:setTopBottom( false, false, -27.89, -24.39 )
				self.clipFinished( Image4, {} )
				Image5:completeAnimation()
				self.Image5:setLeftRight( true, false, 464, 500 )
				self.Image5:setTopBottom( false, false, -55.61, -52.11 )
				self.clipFinished( Image5, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 3 )
				local Image1Frame2 = function ( Image1, event )
					if not event.interrupted then
						Image1:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
					end
					Image1:setLeftRight( true, false, 464, 500 )
					Image1:setTopBottom( false, false, 71.11, 74.61 )
					if event.interrupted then
						self.clipFinished( Image1, event )
					else
						Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				self.Image1:setLeftRight( true, false, -768, -732 )
				self.Image1:setTopBottom( false, false, 52, 55.5 )
				Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame2 )
				local Image4Frame2 = function ( Image4, event )
					if not event.interrupted then
						Image4:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
					end
					Image4:setLeftRight( true, false, 464, 500 )
					Image4:setTopBottom( false, false, -27.89, -24.39 )
					if event.interrupted then
						self.clipFinished( Image4, event )
					else
						Image4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image4:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				self.Image4:setLeftRight( true, false, -768, -732 )
				self.Image4:setTopBottom( false, false, -28, -24.5 )
				Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame2 )
				local Image5Frame2 = function ( Image5, event )
					if not event.interrupted then
						Image5:beginAnimation( "keyframe", 639, true, false, CoD.TweenType.Back )
					end
					Image5:setLeftRight( true, false, 464, 500 )
					Image5:setTopBottom( false, false, -55.61, -52.11 )
					if event.interrupted then
						self.clipFinished( Image5, event )
					else
						Image5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image5:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				self.Image5:setLeftRight( true, false, -768, -732 )
				self.Image5:setTopBottom( false, false, -55.73, -52.23 )
				Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame2 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

