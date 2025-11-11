CoD.Pregame_BanProtectIndicator = InheritFrom( LUI.UIElement )
CoD.Pregame_BanProtectIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_BanProtectIndicator )
	self.id = "Pregame_BanProtectIndicator"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	
	local protected = LUI.UIImage.new()
	protected:setLeftRight( 0.5, 0.5, -19, 21 )
	protected:setTopBottom( 0, 0, 57, 105 )
	protected:setAlpha( 0 )
	protected:setImage( RegisterImage( "uie_t7_icon_pregame_protected2" ) )
	self:addElement( protected )
	self.protected = protected
	
	local banned = LUI.UIImage.new()
	banned:setLeftRight( 0.5, 0.5, -19, 21 )
	banned:setTopBottom( 0, 0, 57, 105 )
	banned:setAlpha( 0 )
	banned:setImage( RegisterImage( "uie_t7_icon_pregame_forced" ) )
	self:addElement( banned )
	self.banned = banned
	
	local line = LUI.UIImage.new()
	line:setLeftRight( 0, 0, 110, 162 )
	line:setTopBottom( 0, 0, 82, 85 )
	line:setAlpha( 0 )
	self:addElement( line )
	self.line = line
	
	local line0 = LUI.UIImage.new()
	line0:setLeftRight( 0, 0, 0, 52 )
	line0:setTopBottom( 0, 0, 82, 85 )
	line0:setRGB( 1, 0.17, 0.23 )
	line0:setAlpha( 0 )
	self:addElement( line0 )
	self.line0 = line0
	
	self.resetProperties = function ()
		protected:completeAnimation()
		line:completeAnimation()
		line0:completeAnimation()
		banned:completeAnimation()
		protected:setAlpha( 0 )
		line:setRGB( 1, 1, 1 )
		line:setAlpha( 0 )
		line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		line0:setRGB( 1, 0.17, 0.23 )
		line0:setAlpha( 0 )
		line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		banned:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Protected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				protected:completeAnimation()
				self.protected:setAlpha( 0.85 )
				self.clipFinished( protected, {} )
				line:completeAnimation()
				self.line:setRGB( 0.66, 0.85, 0.16 )
				self.line:setAlpha( 0.8 )
				self.line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( line, {} )
				line0:completeAnimation()
				self.line0:setRGB( 0.66, 0.85, 0.16 )
				self.line0:setAlpha( 0.8 )
				self.line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( line0, {} )
			end
		},
		Banned = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				banned:completeAnimation()
				self.banned:setAlpha( 0.85 )
				self.clipFinished( banned, {} )
				line:completeAnimation()
				self.line:setRGB( 1, 0.17, 0.23 )
				self.line:setAlpha( 0.8 )
				self.line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( line, {} )
				line0:completeAnimation()
				self.line0:setAlpha( 0.8 )
				self.line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( line0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Protected",
			condition = function ( menu, element, event )
				return ItemIsProtected( menu, element, controller )
			end
		},
		{
			stateName = "Banned",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

