local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false ), "itemsCount", false )
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
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 30 )
	
	local NoContentTextbox = LUI.UIText.new()
	NoContentTextbox:setLeftRight( true, false, 0, 400 )
	NoContentTextbox:setTopBottom( true, false, 3, 28 )
	NoContentTextbox:setText( Engine.Localize( FileshareGetNoContentString( controller, "MENU_FILESHARE_NO_CONTENT" ) ) )
	NoContentTextbox:setTTF( "fonts/default.ttf" )
	NoContentTextbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoContentTextbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoContentTextbox )
	self.NoContentTextbox = NoContentTextbox
	
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
				self.clipFinished( NoContentTextbox, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not FileshareHasContent( element, controller )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

