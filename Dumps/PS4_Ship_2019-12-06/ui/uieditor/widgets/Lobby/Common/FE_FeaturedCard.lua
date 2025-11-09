require( "ui.uieditor.widgets.OverClipContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
	self:setForceMouseEventDispatch( true )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		if FeaturedCards_IsEnabled( f2_arg0, controller ) then
			FeaturedCardsActionButtonHandler( menu, f2_arg0, controller, "", menu )
		end
		return true
	end
	
	if f1_local0 then
		self:registerEventHandler( "leftmouseup", f1_local0 )
	end
end

CoD.FE_FeaturedCard = InheritFrom( LUI.UIElement )
CoD.FE_FeaturedCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FE_FeaturedCard )
	self.id = "FE_FeaturedCard"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 306 )
	self:setTopBottom( true, false, 0, 87 )
	self.anyChildUsesUpdateState = true
	
	local BackgroundImage = LUI.UIImage.new()
	BackgroundImage:setLeftRight( true, false, -27, 333 )
	BackgroundImage:setTopBottom( true, false, -9, 95 )
	BackgroundImage:setScale( 0.85 )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local OverClip = CoD.OverClipContainer.new( menu, controller )
	OverClip:setLeftRight( true, false, 0, 306 )
	OverClip:setTopBottom( true, false, 0, 87 )
	self:addElement( OverClip )
	self.OverClip = OverClip
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, false, 0, 306 )
	TitleBg:setTopBottom( true, false, 66.5, 87.4 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 5.88, 306 )
	Title:setTopBottom( true, false, 66.5, 86.5 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setLetterSpacing( 0.5 )
	self:addElement( Title )
	self.Title = Title
	
	self.BackgroundImage:linkToElementModel( self, "background", true, function ( model )
		local background = Engine.GetModelValue( model )
		if background then
			BackgroundImage:setImage( RegisterImage( background ) )
		end
	end )
	self.Title:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title:setText( Engine.Localize( title ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BackgroundImage:completeAnimation()
				self.BackgroundImage:setRGB( 1, 1, 1 )
				self.clipFinished( BackgroundImage, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 1 )
				BackgroundImage:completeAnimation()
				self.BackgroundImage:setRGB( 1, 1, 1 )
				self.clipFinished( BackgroundImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.OverClip:close()
		element.BackgroundImage:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

