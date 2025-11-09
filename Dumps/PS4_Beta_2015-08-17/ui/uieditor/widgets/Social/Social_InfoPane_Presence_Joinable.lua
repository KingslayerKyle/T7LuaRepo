CoD.Social_InfoPane_Presence_Joinable = InheritFrom( LUI.UIElement )
CoD.Social_InfoPane_Presence_Joinable.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_InfoPane_Presence_Joinable )
	self.id = "Social_InfoPane_Presence_Joinable"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 354 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 9, 23.67 )
	Icon:setTopBottom( true, false, 7, 29 )
	Icon:setRGB( 0.87, 0.9, 0.9 )
	Icon:setAlpha( 0 )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconjoinable" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local notjoinableText = LUI.UIText.new()
	notjoinableText:setLeftRight( true, false, 10.67, 252.67 )
	notjoinableText:setTopBottom( false, true, -29, -7 )
	notjoinableText:setTTF( "fonts/default.ttf" )
	notjoinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	notjoinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	notjoinableText:linkToElementModel( self, "joinable", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			notjoinableText:setText( Engine.Localize( LobbyJoinableToString( modelValue ) ) )
		end
	end )
	self:addElement( notjoinableText )
	self.notjoinableText = notjoinableText
	
	local joinableText = LUI.UIText.new()
	joinableText:setLeftRight( true, false, 28.67, 253.67 )
	joinableText:setTopBottom( true, false, 7, 29 )
	joinableText:setAlpha( 0 )
	joinableText:setText( Engine.Localize( "MENU_JOINABLE" ) )
	joinableText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	joinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	joinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( joinableText )
	self.joinableText = joinableText
	
	local joinButtonImage = LUI.UIImage.new()
	joinButtonImage:setLeftRight( false, true, -80.33, -54.33 )
	joinButtonImage:setTopBottom( false, true, -31, -5 )
	joinButtonImage:setAlpha( 0 )
	joinButtonImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			joinButtonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( joinButtonImage )
	self.joinButtonImage = joinButtonImage
	
	local joinLabel = LUI.UITightText.new()
	joinLabel:setLeftRight( false, true, -80.33, -35 )
	joinLabel:setTopBottom( false, true, -28, -8 )
	joinLabel:setAlpha( 0 )
	joinLabel:setText( Engine.Localize( "MENU_JOIN_SERVER_CAPS" ) )
	joinLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( joinLabel )
	self.joinLabel = joinLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
				notjoinableText:completeAnimation()
				self.notjoinableText:setAlpha( 0 )
				self.clipFinished( notjoinableText, {} )
				joinableText:completeAnimation()
				self.joinableText:setAlpha( 1 )
				self.clipFinished( joinableText, {} )
				joinButtonImage:completeAnimation()
				self.joinButtonImage:setLeftRight( false, true, -60.33, -34.33 )
				self.joinButtonImage:setTopBottom( false, true, -31, -5 )
				self.joinButtonImage:setAlpha( 1 )
				self.clipFinished( joinButtonImage, {} )
				joinLabel:completeAnimation()
				self.joinLabel:setLeftRight( false, true, -52.33, -7 )
				self.joinLabel:setTopBottom( false, true, -28, -8 )
				self.joinLabel:setAlpha( 1 )
				self.clipFinished( joinLabel, {} )
			end
		},
		NotJoinable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
				notjoinableText:completeAnimation()
				self.notjoinableText:setLeftRight( true, true, 10.67, -101.33 )
				self.notjoinableText:setTopBottom( false, true, -29, -7 )
				self.notjoinableText:setAlpha( 1 )
				self.clipFinished( notjoinableText, {} )
				joinableText:completeAnimation()
				self.joinableText:setAlpha( 0 )
				self.clipFinished( joinableText, {} )
				joinButtonImage:completeAnimation()
				self.joinButtonImage:setAlpha( 0 )
				self.clipFinished( joinButtonImage, {} )
				joinLabel:completeAnimation()
				self.joinLabel:setAlpha( 0 )
				self.clipFinished( joinLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NotJoinable",
			condition = function ( menu, element, event )
				return not IsJoinable( self, controller )
			end
		}
	} )
	self:linkToElementModel( self, "joinable", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "joinable"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.notjoinableText:close()
		self.joinButtonImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

