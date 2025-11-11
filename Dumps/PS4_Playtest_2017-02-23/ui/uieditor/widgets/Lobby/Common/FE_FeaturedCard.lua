require( "ui.uieditor.widgets.OverClipContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
	self:setForceMouseEventDispatch( true )
	local cardActionButtonLeftMouseUp = function ( element, event )
		if FeaturedCards_IsEnabled( element, controller ) then
			FeaturedCardsActionButtonHandler( menu, element, controller, "", menu )
		end
		return true
	end
	
	if cardActionButtonLeftMouseUp then
		self:registerEventHandler( "leftmouseup", cardActionButtonLeftMouseUp )
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
	self:setLeftRight( 0, 0, 0, 459 )
	self:setTopBottom( 0, 0, 0, 130 )
	self.anyChildUsesUpdateState = true
	
	local BackgroundImage = LUI.UIImage.new()
	BackgroundImage:setLeftRight( 0, 0, -40, 500 )
	BackgroundImage:setTopBottom( 0, 0, -14, 142 )
	BackgroundImage:setScale( 0.85 )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local OverClip = CoD.OverClipContainer.new( menu, controller )
	OverClip:setLeftRight( 0, 0, 0.5, 459.5 )
	OverClip:setTopBottom( 0, 0, 0, 130 )
	self:addElement( OverClip )
	self.OverClip = OverClip
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( 0, 0, 0, 459 )
	TitleBg:setTopBottom( 0, 0, 100, 131 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0, 0, 9, 459 )
	Title:setTopBottom( 0, 0, 100, 130 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setLetterSpacing( 0.5 )
	self:addElement( Title )
	self.Title = Title
	
	self.BackgroundImage:linkToElementModel( self, "background", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BackgroundImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.Title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.OverClip:close()
		self.BackgroundImage:close()
		self.Title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

