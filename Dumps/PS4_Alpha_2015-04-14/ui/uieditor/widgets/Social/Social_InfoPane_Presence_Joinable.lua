require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

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
	self:setLeftRight( true, false, 0, 410 )
	self:setTopBottom( true, false, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local notjoinableText = LUI.UIText.new()
	notjoinableText:setLeftRight( true, true, 10, -10 )
	notjoinableText:setTopBottom( false, true, -29, -7 )
	notjoinableText:setRGB( 1, 1, 1 )
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
	
	local joinLabel = LUI.UITightText.new()
	joinLabel:setLeftRight( true, true, 350, -6 )
	joinLabel:setTopBottom( false, true, -28, -8 )
	joinLabel:setRGB( 1, 1, 1 )
	joinLabel:setText( Engine.Localize( "MENU_JOIN_SERVER_CAPS" ) )
	joinLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( joinLabel )
	self.joinLabel = joinLabel
	
	local joinButtonImage = LUI.UIImage.new()
	joinButtonImage:setLeftRight( false, true, -89, -63 )
	joinButtonImage:setTopBottom( true, true, 5, -5 )
	joinButtonImage:setRGB( 1, 1, 1 )
	joinButtonImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	joinButtonImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			joinButtonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( joinButtonImage )
	self.joinButtonImage = joinButtonImage
	
	local joinableText = LUI.UIText.new()
	joinableText:setLeftRight( true, true, 31, -101 )
	joinableText:setTopBottom( false, true, -29, -7 )
	joinableText:setRGB( 1, 1, 1 )
	joinableText:setText( Engine.Localize( "MENU_JOINABLE" ) )
	joinableText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	joinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	joinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( joinableText )
	self.joinableText = joinableText
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 9, 23.67 )
	Icon:setTopBottom( false, false, -11, 11 )
	Icon:setRGB( 0.87, 0.9, 0.9 )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconjoinable" ) )
	Icon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	StartMenuframenoBG0:setRGB( 1, 1, 1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				notjoinableText:completeAnimation()
				self.notjoinableText:setAlpha( 0 )
				self.clipFinished( notjoinableText, {} )
				joinLabel:completeAnimation()
				self.joinLabel:setAlpha( 1 )
				self.clipFinished( joinLabel, {} )
				joinButtonImage:completeAnimation()
				self.joinButtonImage:setAlpha( 1 )
				self.clipFinished( joinButtonImage, {} )
				joinableText:completeAnimation()
				self.joinableText:setAlpha( 1 )
				self.clipFinished( joinableText, {} )
				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
			end
		},
		NotJoinable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				notjoinableText:completeAnimation()
				self.notjoinableText:setAlpha( 1 )
				self.clipFinished( notjoinableText, {} )
				joinLabel:completeAnimation()
				self.joinLabel:setAlpha( 0 )
				self.clipFinished( joinLabel, {} )
				joinButtonImage:completeAnimation()
				self.joinButtonImage:setAlpha( 0 )
				self.clipFinished( joinButtonImage, {} )
				joinableText:completeAnimation()
				self.joinableText:setAlpha( 0 )
				self.clipFinished( joinableText, {} )
				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )
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
	self.close = function ( self )
		self.StartMenuframenoBG0:close()
		self.notjoinableText:close()
		self.joinButtonImage:close()
		CoD.Social_InfoPane_Presence_Joinable.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

