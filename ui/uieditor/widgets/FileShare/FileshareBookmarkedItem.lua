-- cdb2f5470b18b83a69d0a85bb2d12cf9
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 30 )
	
	local BestTimeBox = LUI.UIImage.new()
	BestTimeBox:setLeftRight( true, true, -10, 9 )
	BestTimeBox:setTopBottom( true, false, -8, 37 )
	BestTimeBox:setRGB( 0, 0, 0 )
	BestTimeBox:setAlpha( 0.5 )
	BestTimeBox:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebottom" ) )
	self:addElement( BestTimeBox )
	self.BestTimeBox = BestTimeBox
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 0, 29 )
	Image:setTopBottom( true, false, 0, 30 )
	Image:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	Image:setImage( RegisterImage( "uie_bookmark" ) )
	self:addElement( Image )
	self.Image = Image
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, false, 35.5, 128 )
	Text:setTopBottom( true, false, 6, 26 )
	Text:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	Text:setText( Engine.Localize( "MENU_BOOKMARKED" ) )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 5 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )

				BestTimeBox:completeAnimation()
				self.BestTimeBox:setAlpha( 0 )
				self.clipFinished( BestTimeBox, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		},
		IconWithText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				BestTimeBox:completeAnimation()
				self.BestTimeBox:setAlpha( 0.5 )
				self.clipFinished( BestTimeBox, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )

				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

