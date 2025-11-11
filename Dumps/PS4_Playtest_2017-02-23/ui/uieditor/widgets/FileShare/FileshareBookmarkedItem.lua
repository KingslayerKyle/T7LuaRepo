CoD.FileshareBookmarkedItem = InheritFrom( LUI.UIElement )
CoD.FileshareBookmarkedItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareBookmarkedItem )
	self.id = "FileshareBookmarkedItem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 192 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local BestTimeBox = LUI.UIImage.new()
	BestTimeBox:setLeftRight( 0, 1, -15, 13 )
	BestTimeBox:setTopBottom( 0, 0, -12, 56 )
	BestTimeBox:setRGB( 0, 0, 0 )
	BestTimeBox:setAlpha( 0.5 )
	BestTimeBox:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebottom" ) )
	self:addElement( BestTimeBox )
	self.BestTimeBox = BestTimeBox
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, 0, 44 )
	Image:setTopBottom( 0, 0, 0, 45 )
	Image:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	Image:setImage( RegisterImage( "uie_bookmark" ) )
	self:addElement( Image )
	self.Image = Image
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( 0, 0, 53, 192 )
	Text:setTopBottom( 0, 0, 9, 39 )
	Text:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	Text:setText( Engine.Localize( "MENU_BOOKMARKED" ) )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 5 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.resetProperties = function ()
		Image:completeAnimation()
		Text:completeAnimation()
		BestTimeBox:completeAnimation()
		Image:setAlpha( 1 )
		Text:setAlpha( 1 )
		BestTimeBox:setAlpha( 0.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BestTimeBox:completeAnimation()
				self.BestTimeBox:setAlpha( 0 )
				self.clipFinished( BestTimeBox, {} )
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		},
		IconOnly = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BestTimeBox:completeAnimation()
				self.BestTimeBox:setAlpha( 0 )
				self.clipFinished( BestTimeBox, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		},
		IconWithText = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

