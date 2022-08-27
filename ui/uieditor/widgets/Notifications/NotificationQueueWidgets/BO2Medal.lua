-- 4b124761e0fed3c1501f374ad6309ecd
-- This hash is used for caching, delete to decompile the file again

CoD.BO2Medal = InheritFrom( LUI.UIElement )
CoD.BO2Medal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BO2Medal )
	self.id = "BO2Medal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 188 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( false, false, -64, 64 )
	Image:setTopBottom( true, false, 0, 128 )
	self:addElement( Image )
	self.Image = Image
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( false, false, -640, 640 )
	Text:setTopBottom( true, false, 128, 158 )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local SubText = LUI.UIText.new()
	SubText:setLeftRight( false, false, -640, 640 )
	SubText:setTopBottom( true, false, 158, 188 )
	SubText:setTTF( "fonts/default.ttf" )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SubText )
	self.SubText = SubText
	
	self.Image:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			Image:setImage( RegisterImage( icon ) )
		end
	end )
	self.Text:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Text:setText( Engine.Localize( title ) )
		end
	end )
	self.SubText:linkToElementModel( self, "subtitle", true, function ( model )
		local subtitle = Engine.GetModelValue( model )
		if subtitle then
			SubText:setText( subtitle )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
					end
					Image:setLeftRight( false, false, -64, 64 )
					Image:setTopBottom( true, false, 0, 128 )
					Image:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setLeftRight( false, false, -136, 136 )
				self.Image:setTopBottom( true, false, -72, 200 )
				self.Image:setAlpha( 0 )
				ImageFrame2( Image, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Text:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				TextFrame2( Text, {} )
				local SubTextFrame2 = function ( SubText, event )
					if not event.interrupted then
						SubText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					SubText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SubText, event )
					else
						SubText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SubText:completeAnimation()
				self.SubText:setAlpha( 0 )
				SubTextFrame2( SubText, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 3 )
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Image:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
					Image:setShaderVector( 0, 0, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.Image:setShaderVector( 0, 1, 0, 0, 0 )
				ImageFrame2( Image, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Text:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				TextFrame2( Text, {} )
				local SubTextFrame2 = function ( SubText, event )
					if not event.interrupted then
						SubText:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					SubText:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SubText, event )
					else
						SubText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SubText:completeAnimation()
				self.SubText:setAlpha( 1 )
				SubTextFrame2( SubText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Image:close()
		element.Text:close()
		element.SubText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

