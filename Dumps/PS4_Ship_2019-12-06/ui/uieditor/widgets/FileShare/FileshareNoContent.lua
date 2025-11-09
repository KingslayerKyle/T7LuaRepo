local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	Engine.CreateModel( f1_local0, "itemsCount", false )
	Engine.CreateModel( f1_local0, "PublishMode", false )
end

CoD.FileshareNoContent = InheritFrom( LUI.UIElement )
CoD.FileshareNoContent.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareNoContent )
	self.id = "FileshareNoContent"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 60 )
	
	local NoContentTextbox = LUI.UIText.new()
	NoContentTextbox:setLeftRight( true, true, 0, 0 )
	NoContentTextbox:setTopBottom( true, false, 3, 30 )
	NoContentTextbox:setText( FileshareGetNoContentString( controller, "MENU_FILESHARE_NO_CONTENT" ) )
	NoContentTextbox:setTTF( "fonts/default.ttf" )
	NoContentTextbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoContentTextbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoContentTextbox )
	self.NoContentTextbox = NoContentTextbox
	
	local SpinnerFlipbook = LUI.UIImage.new()
	SpinnerFlipbook:setLeftRight( true, false, 61, 189 )
	SpinnerFlipbook:setTopBottom( true, false, -88, 40 )
	SpinnerFlipbook:setRGB( 1, 0.63, 0 )
	SpinnerFlipbook:setImage( RegisterImage( "uie_t7_menu_loadingspinner_flipbook" ) )
	SpinnerFlipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	SpinnerFlipbook:setShaderVector( 0, 28, 0, 0, 0 )
	SpinnerFlipbook:setShaderVector( 1, 22, 0, 0, 0 )
	SpinnerFlipbook:subscribeToGlobalModel( controller, "FileshareRoot", "ready", function ( model )
		local ready = Engine.GetModelValue( model )
		if ready then
			SpinnerFlipbook:setAlpha( FileshareIsReadyAlphaReverse( ready ) )
		end
	end )
	self:addElement( SpinnerFlipbook )
	self.SpinnerFlipbook = SpinnerFlipbook
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NoContentTextbox:completeAnimation()
				self.NoContentTextbox:setAlpha( 0 )
				self.clipFinished( NoContentTextbox, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NoContentTextbox:completeAnimation()
				self.NoContentTextbox:setAlpha( 1 )
				self.NoContentTextbox:setText( FileshareGetNoContentString( controller, "MENU_FILESHARE_NO_CONTENT" ) )
				self.clipFinished( NoContentTextbox, {} )
			end
		},
		Publish = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NoContentTextbox:completeAnimation()
				self.NoContentTextbox:setAlpha( 1 )
				self.NoContentTextbox:setText( FileshareGetNoContentString( controller, "MENU_FILESHARE_NO_CONTENT" ) )
				self.clipFinished( NoContentTextbox, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NoContentTextbox:completeAnimation()
				self.NoContentTextbox:setAlpha( 1 )
				self.NoContentTextbox:setText( FileshareGetNoContentString( controller, "MENU_FILESHARE_NO_CONTENT" ) )
				self.clipFinished( NoContentTextbox, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f8_local0
				if not FileshareHasContent( element, controller ) then
					f8_local0 = FileshareIsReady( controller )
					if f8_local0 then
						f8_local0 = not FileshareShowcaseIsPublishMode( element, controller )
					end
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "Publish",
			condition = function ( menu, element, event )
				local f9_local0
				if not FileshareHasContent( element, controller ) then
					f9_local0 = FileshareIsReady( controller )
					if f9_local0 then
						f9_local0 = FileshareShowcaseIsPublishMode( element, controller )
					end
				else
					f9_local0 = false
				end
				return f9_local0
			end
		},
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				local f10_local0
				if not FileshareHasContent( element, controller ) then
					f10_local0 = not FileshareIsReady( controller )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.itemsCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.itemsCount"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SpinnerFlipbook:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

