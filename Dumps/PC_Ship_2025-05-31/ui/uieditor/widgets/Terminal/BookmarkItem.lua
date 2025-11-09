CoD.BookmarkItem = InheritFrom( LUI.UIElement )
CoD.BookmarkItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BookmarkItem )
	self.id = "BookmarkItem"
	self.soundSet = "Omnipedia"
	self:setLeftRight( true, false, 0, 840 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Bookmark = LUI.UIText.new()
	Bookmark:setLeftRight( true, false, 0, 840 )
	Bookmark:setTopBottom( true, false, 0, 20 )
	Bookmark:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Bookmark:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Bookmark:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Bookmark:linkToElementModel( self, "bookmarkDesc", true, function ( model )
		local bookmarkDesc = Engine.GetModelValue( model )
		if bookmarkDesc then
			Bookmark:setText( Engine.Localize( bookmarkDesc ) )
		end
	end )
	self:addElement( Bookmark )
	self.Bookmark = Bookmark
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Bookmark:completeAnimation()
				self.Bookmark:setRGB( 1, 1, 1 )
				self.clipFinished( Bookmark, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				Bookmark:completeAnimation()
				self.Bookmark:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( Bookmark, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Bookmark:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

