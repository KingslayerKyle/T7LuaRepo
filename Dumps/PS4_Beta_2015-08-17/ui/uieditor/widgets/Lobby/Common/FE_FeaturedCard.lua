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
	self:setTopBottom( true, false, 0, 135 )
	
	local BackgroundImage = LUI.UIImage.new()
	BackgroundImage:setLeftRight( true, false, -27, 333 )
	BackgroundImage:setTopBottom( true, false, 0, 104 )
	BackgroundImage:setScale( 0.85 )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, false, 0, 306 )
	TitleBg:setTopBottom( true, false, 74, 97 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local SubTitle = LUI.UITightText.new()
	SubTitle:setLeftRight( true, false, 234.41, 434.41 )
	SubTitle:setTopBottom( true, false, 150.14, 175.14 )
	SubTitle:setAlpha( 0 )
	SubTitle:setTTF( "fonts/default.ttf" )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	local Type = LUI.UITightText.new()
	Type:setLeftRight( true, false, 487.14, 540.14 )
	Type:setTopBottom( true, false, 155.86, 180.86 )
	Type:setAlpha( 0 )
	Type:setTTF( "fonts/default.ttf" )
	self:addElement( Type )
	self.Type = Type
	
	local CountLabel0 = LUI.UITightText.new()
	CountLabel0:setLeftRight( true, false, 329.72, 360 )
	CountLabel0:setTopBottom( true, false, 0, 25 )
	CountLabel0:setAlpha( 0 )
	CountLabel0:setTTF( "fonts/default.ttf" )
	self:addElement( CountLabel0 )
	self.CountLabel0 = CountLabel0
	
	local ActionTitle = LUI.UIText.new()
	ActionTitle:setLeftRight( true, false, 30, 270 )
	ActionTitle:setTopBottom( true, false, 169.41, 187.64 )
	ActionTitle:setTTF( "fonts/default.ttf" )
	ActionTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ActionTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ActionTitle )
	self.ActionTitle = ActionTitle
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 5.88, 205.88 )
	Title:setTopBottom( true, false, 75, 95 )
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
	self.SubTitle:linkToElementModel( self, "subTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SubTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Type:linkToElementModel( self, "type", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Type:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.CountLabel0:linkToElementModel( self, "index", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CountLabel0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.ActionTitle:linkToElementModel( self, "actionTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ActionTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Title:completeAnimation()
				self.Title:setRGB( 1, 1, 1 )
				self.clipFinished( Title, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 1 )
				Title:completeAnimation()
				self.Title:setRGB( 1, 1, 1 )
				self.clipFinished( Title, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BackgroundImage:close()
		self.SubTitle:close()
		self.Type:close()
		self.CountLabel0:close()
		self.ActionTitle:close()
		self.Title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

