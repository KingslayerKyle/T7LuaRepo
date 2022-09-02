-- f0ca6919a6a58ed4fe9cbd5d7d1fd71e
-- This hash is used for caching, delete to decompile the file again

CoD.VideoItem = InheritFrom( LUI.UIElement )
CoD.VideoItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VideoItem )
	self.id = "VideoItem"
	self.soundSet = "Omnipedia"
	self:setLeftRight( true, false, 0, 162 )
	self:setTopBottom( true, false, 0, 19 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Video = LUI.UIText.new()
	Video:setLeftRight( true, false, 4, 182 )
	Video:setTopBottom( true, false, 0.5, 18.5 )
	Video:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Video:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Video:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Video )
	self.Video = Video
	
	self.Video:linkToElementModel( self, "displaytext", true, function ( model )
		local displaytext = Engine.GetModelValue( model )
		if displaytext then
			Video:setText( Engine.Localize( displaytext ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Video:completeAnimation()
				self.Video:setRGB( 1, 1, 1 )
				self.clipFinished( Video, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				Video:completeAnimation()
				self.Video:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( Video, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )

				Video:completeAnimation()
				self.Video:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
				self.clipFinished( Video, {} )
			end
		},
		Arabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Video:completeAnimation()
				self.Video:setLeftRight( true, false, -78, 100 )
				self.Video:setTopBottom( true, false, 0, 18 )
				self.Video:setRGB( 1, 1, 1 )
				self.clipFinished( Video, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				Video:completeAnimation()
				self.Video:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( Video, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Arabic",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic()
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Video:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

