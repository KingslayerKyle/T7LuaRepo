local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	Engine.CreateModel( rootModel, "itemsCount", false )
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
	self:setLeftRight( 0, 0, 0, 375 )
	self:setTopBottom( 0, 0, 0, 90 )
	
	local NoContentTextbox = LUI.UIText.new()
	NoContentTextbox:setLeftRight( 0, 0, 0, 375 )
	NoContentTextbox:setTopBottom( 0, 0, 5, 45 )
	NoContentTextbox:setText( FileshareGetNoContentString( controller, "MENU_FILESHARE_NO_CONTENT" ) )
	NoContentTextbox:setTTF( "fonts/default.ttf" )
	NoContentTextbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoContentTextbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoContentTextbox )
	self.NoContentTextbox = NoContentTextbox
	
	self.resetProperties = function ()
		NoContentTextbox:completeAnimation()
		NoContentTextbox:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				NoContentTextbox:completeAnimation()
				self.NoContentTextbox:setAlpha( 0 )
				self.clipFinished( NoContentTextbox, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.PublishMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.PublishMode"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

