CoD.MyShowcase_CategoryLabel = InheritFrom( LUI.UIElement )
CoD.MyShowcase_CategoryLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MyShowcase_CategoryLabel )
	self.id = "MyShowcase_CategoryLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 19 )
	
	local categoryName = LUI.UIText.new()
	categoryName:setLeftRight( true, false, 0, 256 )
	categoryName:setTopBottom( true, false, 0, 19 )
	categoryName:setRGB( 0.97, 0.32, 0.05 )
	categoryName:setText( Engine.Localize( "WEAPON_PDW57_DESC" ) )
	categoryName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	categoryName:setLetterSpacing( 1 )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	categoryName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( categoryName )
	self.categoryName = categoryName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				categoryName:completeAnimation()
				self.categoryName:setLeftRight( true, false, 0, 256 )
				self.categoryName:setTopBottom( true, false, 0, 19 )
				self.categoryName:setAlpha( 1 )
				self.clipFinished( categoryName, {} )
			end
		},
		Theater = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				categoryName:completeAnimation()
				self.categoryName:setAlpha( 0 )
				self.clipFinished( categoryName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Theater",
			condition = function ( menu, element, event )
				return IsInTheaterMode()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

