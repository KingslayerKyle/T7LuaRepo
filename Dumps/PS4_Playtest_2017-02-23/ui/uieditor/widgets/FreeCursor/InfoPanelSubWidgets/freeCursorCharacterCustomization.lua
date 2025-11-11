CoD.freeCursorCharacterCustomization = InheritFrom( LUI.UIElement )
CoD.freeCursorCharacterCustomization.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorCharacterCustomization )
	self.id = "freeCursorCharacterCustomization"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 74 )
	
	local BlackBG2 = LUI.UIImage.new()
	BlackBG2:setLeftRight( 0, 1, 0, 0 )
	BlackBG2:setTopBottom( 0, 1, 0, 0 )
	BlackBG2:setRGB( 0.05, 0.15, 0.11 )
	BlackBG2:setAlpha( 0.98 )
	self:addElement( BlackBG2 )
	self.BlackBG2 = BlackBG2
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 10, 410 )
	Background:setTopBottom( 0, 0, 0, 74 )
	Background:setRGB( 0.1, 0.25, 0.23 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Head = LUI.UIText.new()
	Head:setLeftRight( 0, 0, 90, 410 )
	Head:setTopBottom( 0, 0, 0, 37 )
	Head:setAlpha( 0.3 )
	Head:setTTF( "fonts/default.ttf" )
	Head:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Head:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Head:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Head:setText( Engine.Localize( GetClientRenderOptionName( controller, 1, modelValue ) ) )
		end
	end )
	self:addElement( Head )
	self.Head = Head
	
	local Body = LUI.UIText.new()
	Body:setLeftRight( 0, 0, 90, 410 )
	Body:setTopBottom( 0, 0, 37, 74 )
	Body:setAlpha( 0.3 )
	Body:setTTF( "fonts/default.ttf" )
	Body:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Body:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Body:linkToElementModel( self, "clientNum", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Body:setText( Engine.Localize( GetClientRenderOptionName( controller, 1, modelValue ) ) )
		end
	end )
	self:addElement( Body )
	self.Body = Body
	
	local HeadTitle = LUI.UIText.new()
	HeadTitle:setLeftRight( 0, 0, 10, 90 )
	HeadTitle:setTopBottom( 0, 0, 0, 37 )
	HeadTitle:setAlpha( 0.3 )
	HeadTitle:setText( Engine.Localize( "HEROES_HEAD" ) )
	HeadTitle:setTTF( "fonts/default.ttf" )
	HeadTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HeadTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HeadTitle )
	self.HeadTitle = HeadTitle
	
	local BodyTitle = LUI.UIText.new()
	BodyTitle:setLeftRight( 0, 0, 10, 90 )
	BodyTitle:setTopBottom( 0, 0, 37, 74 )
	BodyTitle:setAlpha( 0.3 )
	BodyTitle:setText( Engine.Localize( "HEROES_BODY" ) )
	BodyTitle:setTTF( "fonts/default.ttf" )
	BodyTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BodyTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BodyTitle )
	self.BodyTitle = BodyTitle
	
	self.resetProperties = function ()
		Head:completeAnimation()
		Body:completeAnimation()
		HeadTitle:completeAnimation()
		BodyTitle:completeAnimation()
		BlackBG2:completeAnimation()
		Head:setAlpha( 0.3 )
		Body:setAlpha( 0.3 )
		HeadTitle:setAlpha( 0.3 )
		BodyTitle:setAlpha( 0.3 )
		BlackBG2:setAlpha( 0.98 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Head:completeAnimation()
				self.Head:setAlpha( 1 )
				self.clipFinished( Head, {} )
				Body:completeAnimation()
				self.Body:setAlpha( 1 )
				self.clipFinished( Body, {} )
				HeadTitle:completeAnimation()
				self.HeadTitle:setAlpha( 1 )
				self.clipFinished( HeadTitle, {} )
				BodyTitle:completeAnimation()
				self.BodyTitle:setAlpha( 1 )
				self.clipFinished( BodyTitle, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BlackBG2:completeAnimation()
				self.BlackBG2:setAlpha( 0 )
				self.clipFinished( BlackBG2, {} )
				Head:completeAnimation()
				self.Head:setAlpha( 0 )
				self.clipFinished( Head, {} )
				Body:completeAnimation()
				self.Body:setAlpha( 0 )
				self.clipFinished( Body, {} )
				HeadTitle:completeAnimation()
				self.HeadTitle:setAlpha( 0 )
				self.clipFinished( HeadTitle, {} )
				BodyTitle:completeAnimation()
				self.BodyTitle:setAlpha( 0 )
				self.clipFinished( BodyTitle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Hidden" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "DefaultState" ) then
			ExpandFreeCursorElement( self )
		else
			CollapseFreeCursorElement( self )
		end
	end )
	self:linkToElementModel( self, "characterIndex", true, function ( model )
		local element = self
		if IsSelfModelValueInRange( element, controller, "characterIndex", "0", "10" ) and AlwaysFalse() then
			SetState( self, "DefaultState" )
		elseif AlwaysTrue() then
			SetState( self, "Hidden" )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Head:close()
		self.Body:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

