require( "ui.uieditor.widgets.FaceButtonLabelHide" )

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
	self.anyChildUsesUpdateState = true
	
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
	notjoinableText:setLeftRight( true, true, -1.33, -89.33 )
	notjoinableText:setTopBottom( false, true, -29, -7 )
	notjoinableText:setTTF( "fonts/default.ttf" )
	notjoinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	notjoinableText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	notjoinableText:linkToElementModel( self, "joinable", true, function ( model )
		local joinable = Engine.GetModelValue( model )
		if joinable then
			notjoinableText:setText( Engine.Localize( LobbyJoinableToString( joinable ) ) )
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
	
	local FaceButtonLabelHide = CoD.FaceButtonLabelHide.new( menu, controller )
	FaceButtonLabelHide:setLeftRight( true, false, 252.67, 352.67 )
	FaceButtonLabelHide:setTopBottom( true, false, 8, 28 )
	FaceButtonLabelHide.LabelText:setText( Engine.Localize( "MENU_JOIN_SERVER_CAPS" ) )
	FaceButtonLabelHide:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			FaceButtonLabelHide.ControllerImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	FaceButtonLabelHide:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if FaceButtonLabelHide.m_eventHandlers.input_source_changed then
		local f1_local5 = FaceButtonLabelHide.m_eventHandlers.input_source_changed
		FaceButtonLabelHide:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local5( element, event )
		end )
	else
		FaceButtonLabelHide:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	FaceButtonLabelHide:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( FaceButtonLabelHide, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( FaceButtonLabelHide )
	self.FaceButtonLabelHide = FaceButtonLabelHide
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )
				notjoinableText:completeAnimation()
				self.notjoinableText:setAlpha( 0 )
				self.clipFinished( notjoinableText, {} )
				joinableText:completeAnimation()
				self.joinableText:setAlpha( 1 )
				self.clipFinished( joinableText, {} )
				FaceButtonLabelHide:completeAnimation()
				self.FaceButtonLabelHide:setAlpha( 1 )
				self.clipFinished( FaceButtonLabelHide, {} )
			end
		},
		NotJoinable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
				FaceButtonLabelHide:completeAnimation()
				self.FaceButtonLabelHide:setAlpha( 0 )
				self.clipFinished( FaceButtonLabelHide, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FaceButtonLabelHide:close()
		element.notjoinableText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

